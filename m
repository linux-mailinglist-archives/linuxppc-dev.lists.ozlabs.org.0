Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9DD6143C6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 04:49:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1bcz0MN2z3cMY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 14:49:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=c1Zd6WLj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1bc042s9z2ybK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 14:49:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=c1Zd6WLj;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4N1bbt6Y2Jz4xG6;
	Tue,  1 Nov 2022 14:48:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1667274540;
	bh=T392P69jAve48id/Hh6oGoSS/9g8pGp4/xMJlKxuSlQ=;
	h=From:To:Cc:Subject:Date:From;
	b=c1Zd6WLjfB4wWP/+1z3qC3ciHPhnsPSBnammP/QMyDg5KBsslYxC3uWkAkfnndoE5
	 3LSf2OTWoy4Ryy+3NPwsza53ZetBanzl6XMqN5Je7nDbw4lEbDbuJ6zlVu3U78vQKb
	 TvJ1nTCk0XWLG0XQcjyVyHBLTUBcSnHD4CmWMAsqXorgTmDCAmhisFtmXDbpxdSPm9
	 gA3A30sNcCLr36luClsKU9C4VQcMhqwn9KHFZUUqjv4KPq21x/0mStg4hHxq0NlQ30
	 UiimdlSYwqr+UdgnSO8iEgQtqFq0RXbwtjyT0ktdTPF+v/tuqgmiJPQtWCw3U3YECT
	 nrfzwX7VqJ9Bg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/32: Select ARCH_SPLIT_ARG64
Date: Tue,  1 Nov 2022 14:48:52 +1100
Message-Id: <20221101034852.2340319-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
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
Cc: rmclure@linux.ibm.com, schwab@linux-m68k.org, arnd@arndb.de, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 32-bit kernels, 64-bit syscall arguments are split into two
registers. For that to work with syscall wrappers, the prototype of the
syscall must have the argument split so that the wrapper macro properly
unpacks the arguments from pt_regs.

The fanotify_mark() syscall is one such syscall, which already has a
split prototype, guarded behind ARCH_SPLIT_ARG64.

So select ARCH_SPLIT_ARG64 to get that prototype and fix fanotify_mark()
on 32-bit kernels with syscall wrappers.

Note also that fanotify_mark() is the only usage of ARCH_SPLIT_ARG64.

Fixes: 7e92e01b7245 ("powerpc: Provide syscall wrapper")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 20fb1765238c..2ca5418457ed 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -147,6 +147,7 @@ config PPC
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ARCH_OPTIONAL_KERNEL_RWX		if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
+	select ARCH_SPLIT_ARG64			if PPC32
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx || 40x
-- 
2.37.3

