Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEC319BD0E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 09:50:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tFcF5Q1VzDr4F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 18:50:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=vfRlt1T9; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tFFC0dDLzDrQq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 18:34:22 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48tFF42bWfz9txL1;
 Thu,  2 Apr 2020 09:34:16 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=vfRlt1T9; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id mlNnXNve6VrP; Thu,  2 Apr 2020 09:34:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48tFF41Px0z9txKx;
 Thu,  2 Apr 2020 09:34:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585812856; bh=rtnBM1MZyQLE3O3HghcLmwXfM1Z+PTLW0Cqh5beK/Mk=;
 h=From:Subject:To:Cc:Date:From;
 b=vfRlt1T9Wzn97hRqE2ckDl24BlcrW56elnYuF2j5/U7+L0RAePaONNQxT+n6RprLc
 +bxsSTN+TqyVMtO0t2PmGsDMqLzp7kKEVAVl+89pPEaxxWXVJ1k6G+DNn9g49gvTcQ
 /pVE1BGqixCbYSeasBoKWxSN0J7FrEZH5/rGxMfc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F0CA88B76E;
 Thu,  2 Apr 2020 09:34:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RdMFZGC4YDww; Thu,  2 Apr 2020 09:34:16 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9E6708B75E;
 Thu,  2 Apr 2020 09:34:16 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 52C2E656BF; Thu,  2 Apr 2020 07:34:16 +0000 (UTC)
Message-Id: <27106d62fdbd4ffb47796236050e418131cb837f.1585811416.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH RESEND 1/4] uaccess: Add user_read_access_begin/end and
 user_write_access_begin/end
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 airlied@linux.ie, daniel@ffwll.ch, torvalds@linux-foundation.org,
 viro@zeniv.linux.org.uk, akpm@linux-foundation.org, keescook@chromium.org,
 hpa@zytor.com
Date: Thu,  2 Apr 2020 07:34:16 +0000 (UTC)
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
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some architectures like powerpc64 have the capability to separate
read access and write access protection.
For get_user() and copy_from_user(), powerpc64 only open read access.
For put_user() and copy_to_user(), powerpc64 only open write access.
But when using unsafe_get_user() or unsafe_put_user(),
user_access_begin open both read and write.

Other architectures like powerpc book3s 32 bits only allow write
access protection. And on this architecture protection is an heavy
operation as it requires locking/unlocking per segment of 256Mbytes.
On those architecture it is therefore desirable to do the unlocking
only for write access. (Note that book3s/32 ranges from very old
powermac from the 90's with powerpc 601 processor, till modern
ADSL boxes with PowerQuicc II modern processors for instance so it
is still worth considering)

In order to avoid any risk based of hacking some variable parameters
passed to user_access_begin/end that would allow hacking and
leaving user access open or opening too much, it is preferable to
use dedicated static functions that can't be overridden.

Add a user_read_access_begin and user_read_access_end to only open
read access.

Add a user_write_access_begin and user_write_access_end to only open
write access.

By default, when undefined, those new access helpers default on the
existing user_access_begin and user_access_end.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Link: https://patchwork.ozlabs.org/patch/1227926/
---
Resending this series as I mistakenly only sent it to powerpc list
begining of February (https://patchwork.ozlabs.org/patch/1233172/)

This series is based on the discussion we had in January, see
https://patchwork.ozlabs.org/patch/1227926/ . I tried to
take into account all remarks, especially @hpa 's remark to use
a fixed API on not base the relocking on a magic id returned at
unlocking.

This series is awaited for implementing selective lkdtm test to
test powerpc64 independant read and write protection, see
https://patchwork.ozlabs.org/patch/1231765/

 include/linux/uaccess.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 67f016010aad..9861c89f93be 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -378,6 +378,14 @@ extern long strnlen_unsafe_user(const void __user *unsafe_addr, long count);
 static inline unsigned long user_access_save(void) { return 0UL; }
 static inline void user_access_restore(unsigned long flags) { }
 #endif
+#ifndef user_write_access_begin
+#define user_write_access_begin user_access_begin
+#define user_write_access_end user_access_end
+#endif
+#ifndef user_read_access_begin
+#define user_read_access_begin user_access_begin
+#define user_read_access_end user_access_end
+#endif
 
 #ifdef CONFIG_HARDENED_USERCOPY
 void usercopy_warn(const char *name, const char *detail, bool to_user,
-- 
2.25.0

