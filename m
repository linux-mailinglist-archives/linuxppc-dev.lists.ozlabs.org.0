Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE03DE906
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 12:09:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xXRZ4mYszDqm6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 21:09:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xXPW0kVDzDqg7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 21:07:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46xXPV66NVz8xTL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 21:07:26 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46xXPV5cF9z9sCJ; Mon, 21 Oct 2019 21:07:26 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46xXPV2Phrz9sP3
 for <linuxppc-dev@ozlabs.org>; Mon, 21 Oct 2019 21:07:25 +1100 (AEDT)
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iMUaq-0006Yb-JY; Mon, 21 Oct 2019 12:07:16 +0200
Date: Mon, 21 Oct 2019 12:07:15 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Andreas Schwab <schwab@linux-m68k.org>
Subject: [PATCH] lib/vdso: Make clock_getres() POSIX compliant again
In-Reply-To: <87eez7glre.fsf@igel.home>
Message-ID: <alpine.DEB.2.21.1910211202260.1904@nanos.tec.linutronix.de>
References: <0fc22a08-31d9-e4d1-557e-bf5b482a9a20__6444.28012180782$1571503753$gmane$org@c-s.fr>
 <87v9skcznp.fsf@igel.home> <ed65e4c6-2fe0-2f5c-f667-5a81b19eb073@c-s.fr>
 <87tv83zqt1.fsf@hase.home> <b64c367b-d1e5-bf26-d452-145c0be6e30a@c-s.fr>
 <alpine.DEB.2.21.1910201243580.2090@nanos.tec.linutronix.de>
 <875zkjipra.fsf@igel.home>
 <alpine.DEB.2.21.1910201731070.2090@nanos.tec.linutronix.de>
 <87r237h01a.fsf@igel.home>
 <alpine.DEB.2.21.1910202145160.2090@nanos.tec.linutronix.de>
 <87eez7glre.fsf@igel.home>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A recent commit removed the NULL pointer check from the clock_getres()
implementation causing a test case to fault.

POSIX requires an explicit NULL pointer check for clock_getres() aside of
the validity check of the clock_id argument for obscure reasons.

Add it back for both 32bit and 64bit.

Note, this is only a partial revert of the offending commit which does not
bring back the broken fallback invocation in the the 32bit compat
implementations of clock_getres() and clock_gettime().

Fixes: a9446a906f52 ("lib/vdso/32: Remove inconsistent NULL pointer checks")
Reported-by: Andreas Schwab <schwab@linux-m68k.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: stable@vger.kernel.org
---
 lib/vdso/gettimeofday.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -214,9 +214,10 @@ int __cvdso_clock_getres_common(clockid_
 		return -1;
 	}
 
-	res->tv_sec = 0;
-	res->tv_nsec = ns;
-
+	if (likely(res)) {
+		res->tv_sec = 0;
+		res->tv_nsec = ns;
+	}
 	return 0;
 }
 
@@ -245,7 +246,7 @@ static __maybe_unused int
 		ret = clock_getres_fallback(clock, &ts);
 #endif
 
-	if (likely(!ret)) {
+	if (likely(!ret && res)) {
 		res->tv_sec = ts.tv_sec;
 		res->tv_nsec = ts.tv_nsec;
 	}
