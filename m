Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB477FD7CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 14:20:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PDU9jhIL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgKh31WWtz3cmg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 00:20:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PDU9jhIL;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgKg80wXFz3cNQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 00:19:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701263988;
	bh=AKCmbsq85txC8lFlNS/lYcOEO43Av8kM4dGjPGZ+qK8=;
	h=From:To:Cc:Subject:Date:From;
	b=PDU9jhIL4PNzfitWppQTZxl70Px+8kTaEpwyca8nJpilkspisK8e3KhbGv6eED8vw
	 hJLepcfJbhXN5Z+G+Emy1IbhZ4cv+UjOs/4d1fE2MUBqQvvsotn6B1+bLnHKe12zuY
	 l3TJiF/HGMYyKBsZdoCuc0i5vyhFwTYVXEHTNF3kdy9Ys9UxOJitAK5/+00A6OvTi5
	 YvDGJcljVUl7daUL2waio9PP1fV2s7bwHG4Wa8O1ha1ZxwWulk5/RvNhd1yPUlrcL0
	 Fc9q4jNYLw6/se+Jp8OEbdXh9mMpC9600H53uhGGCvwDrEDV0cTW/V7jxr47gUfkBg
	 zVracCwBuuAUg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SgKg65mCyz4wc6;
	Thu, 30 Nov 2023 00:19:46 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/5] powerpc/suspend: Add prototype for do_after_copyback()
Date: Thu, 30 Nov 2023 00:19:15 +1100
Message-ID: <20231129131919.2528517-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With HIBERNATION=y the build breaks with:

  arch/powerpc/kernel/swsusp_64.c:14:6: error: no previous prototype for ‘do_after_copyback’ [-Werror=missing-prototypes]
  14 | void do_after_copyback(void)
     |      ^~~~~~~~~~~~~~~~~

do_after_copyback() is only called from asm, so there is no prototype,
nor any header where it makes sense to place one. Just add a prototype
in the C file to fix the build error.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/swsusp_64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/swsusp_64.c b/arch/powerpc/kernel/swsusp_64.c
index 16ee3baaf09a..50fa8fc9ef95 100644
--- a/arch/powerpc/kernel/swsusp_64.c
+++ b/arch/powerpc/kernel/swsusp_64.c
@@ -11,6 +11,8 @@
 #include <linux/interrupt.h>
 #include <linux/nmi.h>
 
+void do_after_copyback(void);
+
 void do_after_copyback(void)
 {
 	iommu_restore();
-- 
2.41.0

