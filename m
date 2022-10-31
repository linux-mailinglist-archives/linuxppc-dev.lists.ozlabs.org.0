Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CC26137D3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 14:23:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1DPk0BW3z3cPg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 00:23:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nefkom.net (client-ip=212.18.0.9; helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1DP64Rxvz3bc4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 00:23:21 +1100 (AEDT)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4N1DNy4bBzz1r1gL;
	Mon, 31 Oct 2022 14:23:14 +0100 (CET)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.84])
	by mail.m-online.net (Postfix) with ESMTP id 4N1DNy3w75z1qqlS;
	Mon, 31 Oct 2022 14:23:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan3.mail.m-online.net [192.168.6.84]) (amavisd-new, port 10024)
	with ESMTP id HC3Mvmdykm8r; Mon, 31 Oct 2022 14:23:13 +0100 (CET)
X-Auth-Info: 4Ro2+5+yUyLRiufloHf7YdkXtdmA+yYGcz7RrZ5urKTYhRImccKxkV+Qw1VxUv3N
Received: from igel.home (aftr-82-135-86-233.dynamic.mnet-online.de [82.135.86.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 31 Oct 2022 14:23:13 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id 8970B2C3586; Mon, 31 Oct 2022 14:23:13 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Rohan McLure <rmclure@linux.ibm.com>
Subject: [PATCH] asm-generic: compat: fix compat_arg_u64 and
 compat_arg_u64_dual
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
	<20220921065605.1051927-10-rmclure@linux.ibm.com>
X-Yow: Now that we're in LOVE, you can BUY this GOLDFISH for a 48% DISCOUNT.
Date: Mon, 31 Oct 2022 14:23:13 +0100
In-Reply-To: <20220921065605.1051927-10-rmclure@linux.ibm.com> (Rohan McLure's
	message of "Wed, 21 Sep 2022 16:55:49 +1000")
Message-ID: <871qqoyvni.fsf_-_@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@anrdb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The macros are defined backwards.

Fixes: 43d5de2b67d7 ("asm-generic: compat: Support BE for long long args in 32-bit ABIs")
Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
---
 include/asm-generic/compat.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/compat.h b/include/asm-generic/compat.h
index aeb257ad3d1a..8392caea398f 100644
--- a/include/asm-generic/compat.h
+++ b/include/asm-generic/compat.h
@@ -15,7 +15,7 @@
 #endif
 
 #ifndef compat_arg_u64
-#ifdef CONFIG_CPU_BIG_ENDIAN
+#ifndef CONFIG_CPU_BIG_ENDIAN
 #define compat_arg_u64(name)		u32  name##_lo, u32  name##_hi
 #define compat_arg_u64_dual(name)	u32, name##_lo, u32, name##_hi
 #else
-- 
2.38.1

