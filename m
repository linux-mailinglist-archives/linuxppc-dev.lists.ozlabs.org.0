Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D04103A4A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:45:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47J2VN4DKqzDqrs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 23:45:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J2Ql72qvzDqrX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 23:42:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="EBZkrwVU"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47J2Qk27HHz9sPV;
 Wed, 20 Nov 2019 23:42:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1574253758;
 bh=kcB8hU0HApS87lVWCCHWC6nJNpbOngygsjnom0C++ZU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=EBZkrwVUi4jpHNMaaKB8rHY2iUV/HY5vFnwmddANH5qGJr+iDp4mmSf3jNen0ONcb
 Y7Zqxv6GkQ+rUYNPL8HncFyFXXL7uVK8L32v3crpLLGVuU27dUBO+LMy0Z1BveYSYN
 6+vDpq63rLf8oqAHDm93S9nP9Li3v46hcXzwgtnJyXgN2hHbVO6CNiEHO2gn4ZsaYL
 znYEep/9PWGWGdbsLAyfsG+R6RWT/Uy6jkUchpi4ZGVUG0dXqHBcm8XaJ4L/9Yc2vG
 kLj0L8HZWpxaYtg9dE4ga8N0KWfO874d24txUZD/fio9LMJmIevrFcGAocW76EyjW5
 GWk86pF754YOA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v3 2/8] powerpc/vdso32: Add support for
 CLOCK_{REALTIME/MONOTONIC}_COARSE
In-Reply-To: <4644ccc9b4da78639ae9424db878c48711abf05a.1572342582.git.christophe.leroy@c-s.fr>
References: <cover.1572342582.git.christophe.leroy@c-s.fr>
 <4644ccc9b4da78639ae9424db878c48711abf05a.1572342582.git.christophe.leroy@c-s.fr>
Date: Wed, 20 Nov 2019 23:42:33 +1100
Message-ID: <87eey2btxi.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> This is copied and adapted from commit 5c929885f1bb ("powerpc/vdso64:
> Add support for CLOCK_{REALTIME/MONOTONIC}_COARSE")
> from Santosh Sivaraj <santosh@fossix.org>
>
> Benchmark from vdsotest-all:
> clock-gettime-realtime: syscall: 3601 nsec/call
> clock-gettime-realtime:    libc: 1072 nsec/call
> clock-gettime-realtime:    vdso: 931 nsec/call
> clock-gettime-monotonic: syscall: 4034 nsec/call
> clock-gettime-monotonic:    libc: 1213 nsec/call
> clock-gettime-monotonic:    vdso: 1076 nsec/call
> clock-gettime-realtime-coarse: syscall: 2722 nsec/call
> clock-gettime-realtime-coarse:    libc: 805 nsec/call
> clock-gettime-realtime-coarse:    vdso: 668 nsec/call
> clock-gettime-monotonic-coarse: syscall: 2949 nsec/call
> clock-gettime-monotonic-coarse:    libc: 882 nsec/call
> clock-gettime-monotonic-coarse:    vdso: 745 nsec/call
>
> Additional test passed with:
> 	vdsotest -d 30 clock-gettime-monotonic-coarse verify

This broke on 64-bit big endian, which uses the 32-bit VDSO, with errors
like:

  clock-gettime-monotonic-coarse/verify: 10 failures/inconsistencies encountered
  timestamp obtained from libc/vDSO not normalized:
  	[-1574202155, 1061008673]
  timestamp obtained from libc/vDSO predates timestamp
  previously obtained from kernel:
  	[74, 261310747] (kernel)
  	[-1574202155, 1061008673] (vDSO)
  timestamp obtained from libc/vDSO not normalized:
  	[-1574202155, 1061008673]
  timestamp obtained from libc/vDSO predates timestamp
  previously obtained from kernel:
  	[74, 261310747] (kernel)
  	[-1574202155, 1061008673] (vDSO)
  timestamp obtained from libc/vDSO not normalized:
  	[-1574202155, 1061008673]
  timestamp obtained from libc/vDSO predates timestamp
  previously obtained from kernel:
  	[74, 261310747] (kernel)
  	[-1574202155, 1061008673] (vDSO)
  timestamp obtained from libc/vDSO not normalized:
  	[-1574202155, 1061008673]
  timestamp obtained from libc/vDSO predates timestamp
  previously obtained from kernel:
  	[74, 261310747] (kernel)
  	[-1574202155, 1061008673] (vDSO)
  timestamp obtained from libc/vDSO not normalized:
  	[-1574202155, 1061008673]
  timestamp obtained from libc/vDSO predates timestamp
  previously obtained from kernel:
  	[74, 261310747] (kernel)
  	[-1574202155, 1061008673] (vDSO)
  Failure threshold (10) reached; stopping test.


The diff below seems to fix it, but I'm not sure it's correct. ie. we
just ignore the top part of the values, how does that work?

cheers


diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
index decd263c16e0..58f7e1124d92 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -16,9 +16,11 @@
 #ifdef CONFIG_PPC64
 #define LOPART 4
 #define TSPEC_TV_SEC   TSPC64_TV_SEC+LOPART
+#define TSPEC_TV_NSEC  TSPC64_TV_NSEC+LOPART
 #else
 #define LOPART 0
 #define TSPEC_TV_SEC   TSPC32_TV_SEC
+#define TSPEC_TV_NSEC  TSPC32_TV_NSEC
 #endif
 
        .text
@@ -131,8 +133,8 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
         * CLOCK_REALTIME_COARSE, below values are needed for MONOTONIC_COARSE
         * too
         */
-       lwz     r3,STAMP_XTIME+TSPC32_TV_SEC(r9)
-       lwz     r4,STAMP_XTIME+TSPC32_TV_NSEC(r9)
+       lwz     r3,STAMP_XTIME+TSPEC_TV_SEC(r9)
+       lwz     r4,STAMP_XTIME+TSPEC_TV_NSEC(r9)
        bne     cr6,1f
 
        /* CLOCK_MONOTONIC_COARSE */


