Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 503AF2F19A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 16:30:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDyMB3PvXzDqfK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 02:30:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=212.18.0.9; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
X-Greylist: delayed 577 seconds by postgrey-1.36 at bilbo;
 Tue, 12 Jan 2021 02:28:42 AEDT
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDyKQ1W43zDqPw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 02:28:40 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DDy651Fmqz1qskT;
 Mon, 11 Jan 2021 16:18:53 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DDy646j31z1tYWW;
 Mon, 11 Jan 2021 16:18:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id S1jEDPKn3m5i; Mon, 11 Jan 2021 16:18:51 +0100 (CET)
X-Auth-Info: +4ZBp6oP5UHBQbz30gRFNPVk3E+f0nOqHIQmb61qUoCy/249mUINCdfQGZyGGjep
Received: from igel.home (ppp-46-244-179-249.dynamic.mnet-online.de
 [46.244.179.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 11 Jan 2021 16:18:51 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 666492C352E; Mon, 11 Jan 2021 16:18:51 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/vdso: fix clock_gettime_fallback for vdso32
X-Yow: Yow!  Did something bad happen or am I in a drive-in movie??
Date: Mon, 11 Jan 2021 16:18:51 +0100
Message-ID: <87eeirsdr8.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1.90 (gnu/linux)
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
Cc: Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The second argument of __kernel_clock_gettime64 points to a struct
__kernel_timespec, with 64-bit time_t, so use the clock_gettime64 syscall
in the fallback function for the 32-bit vdso.  Similarily,
clock_getres_fallback should use the clock_getres_time64 syscall, though
it isn't yet called from the 32-bit vdso.

Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index 81671aa365b3..a26c12df2c9a 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -106,13 +106,21 @@ int gettimeofday_fallback(struct __kernel_old_timeval *_tv, struct timezone *_tz
 static __always_inline
 int clock_gettime_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
 {
+#ifndef __powerpc64__
+	return do_syscall_2(__NR_clock_gettime64, _clkid, (unsigned long)_ts);
+#else
 	return do_syscall_2(__NR_clock_gettime, _clkid, (unsigned long)_ts);
+#endif
 }
 
 static __always_inline
 int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
 {
+#ifndef __powerpc64__
+	return do_syscall_2(__NR_clock_getres_time64, _clkid, (unsigned long)_ts);
+#else
 	return do_syscall_2(__NR_clock_getres, _clkid, (unsigned long)_ts);
+#endif
 }
 
 #ifdef CONFIG_VDSO32
-- 
2.30.0


-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
