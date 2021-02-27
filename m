Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93745326AF3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 02:13:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnT704JQBz3d4S
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 12:13:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=131.153.2.45;
 helo=h4.fbrelay.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from h4.fbrelay.privateemail.com (h4.fbrelay.privateemail.com
 [131.153.2.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnT6g4yHJz3cYf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 12:13:15 +1100 (AEDT)
Received: from MTA-14-4.privateemail.com (mta-14.privateemail.com
 [198.54.118.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 008A580D7B
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 20:13:10 -0500 (EST)
Received: from mta-14.privateemail.com (localhost [127.0.0.1])
 by mta-14.privateemail.com (Postfix) with ESMTP id E0B6F80077
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 20:13:06 -0500 (EST)
Received: from oc8246131445.ibm.com (unknown [10.20.151.203])
 by mta-14.privateemail.com (Postfix) with ESMTPA id B14D58007A
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 01:13:06 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 01/10] powerpc/uaccess: Add unsafe_copy_from_user()
Date: Fri, 26 Feb 2021 19:12:50 -0600
Message-Id: <20210227011259.11992-2-cmr@codefail.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210227011259.11992-1-cmr@codefail.de>
References: <20210227011259.11992-1-cmr@codefail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the same approach as unsafe_copy_to_user() but instead call
unsafe_get_user() in a loop.

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
v7:	* Change implementation to call unsafe_get_user() and remove
	  dja's 'Reviewed-by' tag
---
 arch/powerpc/include/asm/uaccess.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 78e2a3990eab..ef5978b73a8d 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -487,6 +487,27 @@ user_write_access_begin(const void __user *ptr, size_t len)
 #define unsafe_put_user(x, p, e) \
 	__unsafe_put_user_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
 
+#define unsafe_copy_from_user(d, s, l, e) \
+do {											\
+	u8 *_dst = (u8 *)(d);								\
+	const u8 __user *_src = (const u8 __user *)(s);					\
+	size_t _len = (l);								\
+	int _i;										\
+											\
+	for (_i = 0; _i < (_len & ~(sizeof(long) - 1)); _i += sizeof(long))		\
+		unsafe_get_user(*(long *)(_dst + _i), (long __user *)(_src + _i), e);	\
+	if (IS_ENABLED(CONFIG_PPC64) && (_len & 4)) {					\
+		unsafe_get_user(*(u32 *)(_dst + _i), (u32 __user *)(_src + _i), e);	\
+		_i += 4;								\
+	}										\
+	if (_len & 2) {									\
+		unsafe_get_user(*(u16 *)(_dst + _i), (u16 __user *)(_src + _i), e);	\
+		_i += 2;								\
+	}										\
+	if (_len & 1)									\
+		unsafe_get_user(*(u8 *)(_dst + _i), (u8 __user *)(_src + _i), e);	\
+} while (0)
+
 #define unsafe_copy_to_user(d, s, l, e) \
 do {									\
 	u8 __user *_dst = (u8 __user *)(d);				\
-- 
2.26.1

