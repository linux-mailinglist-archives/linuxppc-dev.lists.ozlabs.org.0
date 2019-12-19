Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC0512609F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 12:16:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dq7J5HMyzDqnr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 22:15:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=bigeasy@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dq4X0wGkzDqmJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 22:13:30 +1100 (AEDT)
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1ihtk7-00034v-G3; Thu, 19 Dec 2019 12:13:19 +0100
Date: Thu, 19 Dec 2019 12:13:19 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [Qemu-ppc] pseries on qemu-system-ppc64le crashes in
 doorbell_core_ipi()
Message-ID: <20191219111319.hes3fhpqpvn7nklg@linutronix.de>
References: <7d97f3c6-4614-ead7-179a-e7e223ea3997@kaod.org>
 <2bbc1490-400d-585e-d74b-924c570b4236@kaod.org>
 <1553836851.2264.2.camel@gmail.com>
 <1553850306.nyv11r9iej.astroid@bobo.none>
 <20190329113109.3a9bd24e@gandalf.local.home>
 <1553912871.ce5mzizoek.astroid@bobo.none>
 <20190401083827.GE11158@hirez.programming.kicks-ass.net>
 <20190406000611.GA27782@lenoir>
 <1554801792.ruzup3dxhe.astroid@bobo.none>
 <7a5b63a0-2bf5-60bb-8678-b7b36671a29c@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7a5b63a0-2bf5-60bb-8678-b7b36671a29c@zx2c4.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <fweisbec@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 Paul Mackerras <paulus@samba.org>, tglx@linutronix.de,
 David? Gibson <david@gibson.dropbear.id.au>, linuxppc-dev@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-12-19 11:41:21 [+0100], Jason A. Donenfeld wrote:
> Hi folks,
Hi,

so this should duct tape it:

diff --git a/arch/powerpc/kernel/dbell.c b/arch/powerpc/kernel/dbell.c
index f17ff1200eaae..ec044bdf362a1 100644
--- a/arch/powerpc/kernel/dbell.c
+++ b/arch/powerpc/kernel/dbell.c
@@ -60,16 +60,8 @@ void doorbell_core_ipi(int cpu)
  */
 int doorbell_try_core_ipi(int cpu)
 {
-	int this_cpu =3D get_cpu();
 	int ret =3D 0;
=20
-	if (cpumask_test_cpu(cpu, cpu_sibling_mask(this_cpu))) {
-		doorbell_core_ipi(cpu);
-		ret =3D 1;
-	}
-
-	put_cpu();
-
 	return ret;
 }
=20

> This is with "qemu-system-ppc64 -smp 4 -machine pseries" on QEMU 4.0.0.

Interesting. I didn't get v5.4 to boot a while ago and didn't have the
time to look into it.

> I'm not totally sure what's going on here. I'm emulating a pseries, and
> using that with qemu's pseries model, and I see that selecting the pseries
> forces the selection of 'config PPC_DOORBELL' (twice in the same section,
> actually). Then inside the kernel there appears to be some runtime CPU ch=
eck
> for doorbell support. Is this a case in which QEMU is advertising doorbell
> support that TCG doesn't have? Or is something else happening here?

Based on my understanding is that the doorbell feature is part of the
architecture. It can be used to signal other siblings on the same CPU.
qemu TCG doesn't support that and does not allow to announce multiple
siblings on the same CPU. However, the kernel uses this interface if it
tries to send an interrupt to itself (the same CPU) so everything
matches.
Last time I run into this, the interface was change so the kernel das
not send an IPI to itself. This changed now for another function=E2=80=A6

> Thanks,
> Jason

Sebastian
