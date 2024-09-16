Return-Path: <linuxppc-dev+bounces-1413-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D256197A8D3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2024 23:33:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6ynS0h7Qz2y3b;
	Tue, 17 Sep 2024 07:33:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726508834;
	cv=none; b=ES+QV/YYtqFXUDhQLJVd2MhsUuE9cu93qtU0F+sDJhTa7bECCaUg5dXBlNCXK0pwXSAwnrg245UK04aruQ4WgVmEre7hK/edX2numMC5wFpuHMDO/xaunZ+uaXU8YGbiKhh4TDldwL0TANCfyiWEt8tVwD6W74g33sUH140+MtUvwc9bMcijk16A3Wuy0qkKKTw6oOzYbBHqqDH2kCcEOU7TbS/3oHgI8aiqnXxdwgRiBprgA0p8C2g9haR+SMsc5m5biFy7MVMQEcD8b0f9VtAFd82V3gKZd8mIiVfExMOy7a8u2QIi71fl+HvHkkkalnB6DfVmd1QcWTbfvSaUaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726508834; c=relaxed/relaxed;
	bh=5SGK/TY72KmFyRsQhuci5dBJyuneuqu3SiP14BigZGA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=IZG19oMaUQ3iE4JMgGrq9zPpLYs6LrfCXqKm3oRfn01ggbzw1cBjQLJpz0QoR5MGgBFushIamZjNLUUzVZMPP/ZBUQTKgQuN/ubu57Bg9aFHh5hBTa+/k/BNaPHjfSmIB601BHc9gwLkQHNM/enS9204qjFSEPsx0HUSIal1jvR3s2hP6UjMNFky0VL9tSze5e4cvL5isNWHRyHd5v3BsdYM5uufR27+o7XK24tbeUgLt8QvcEFX2/ORnVTLOFJhgLbfdMqLccy93jaSOCB1geVTWOeW7RJYaLCizWTll6J0xI0MjxCZO19P8wcIRe7HZ/jVnEP8jsFaNcCGsdC4Gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=dWMAYLxC; dkim-atps=neutral; spf=pass (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=dWMAYLxC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 341 seconds by postgrey-1.37 at boromir; Tue, 17 Sep 2024 03:47:11 AEST
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6smv6v3gz2xrv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2024 03:47:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1726508821; x=1727113621; i=markus.elfring@web.de;
	bh=5SGK/TY72KmFyRsQhuci5dBJyuneuqu3SiP14BigZGA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dWMAYLxCuwPK0ZnnbL08bkqn2GeoX66+mt7Bkwq0OMh4VAb0gZRd+ZhMp9jJll4s
	 l79oPikqYIrzmo/+F6CVibWZCsD5qhQwE12Fiv6Qd7ChvU4OJfobOCOrBiolW2RBA
	 72FmkU+PikVPpPxkOjgjnM+PRkNd/seJSyTQNk2X23pNslkPBke1+JTS1ZIlwz8Wh
	 saTjkkybCLT8OdQjN05F4ZLOCj46g51Gx9pv94RKTmc4WFy6OxVkgrFG8cJHH9TB9
	 V++IkDQCU/yUL1C4Qrw2XMdoMlMOMdVJ6z14588gABFwAyp5BCU2b0+iBp6/+yyI6
	 /uNra3eA+TUcQLNQFQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MYtwy-1sUAV41JHE-00LYSq; Mon, 16
 Sep 2024 19:40:30 +0200
Message-ID: <096fc4ee-8ffe-4eb6-88f8-28dc944b079f@web.de>
Date: Mon, 16 Sep 2024 19:40:19 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linuxppc-dev@lists.ozlabs.org, Anjali K <anjalik@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Kan Liang <kan.liang@linux.intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@inria.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] powerpc/perf: Use guard(irqsave)() in eight functions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4itjh4f1YOCmJfNLXxyV6dv0Z7b50VyILMhOp4u68y7IQBDcsMR
 pwUORGisP/0PIfUll6L4iv4icDhWaZDvI3DsHAbGSQ3eOTUzzqcT7sLeOdC7NJZoA4LMOP4
 EHXnc4H1P7QZJ2xhdrRf/owE1B8btyWB4vAqC2CeACOnBKj9KrotFLl+ptZhUtRfxyui9KE
 XKmFASJ6MZKhUD/dGnEog==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:o8R8TjX5ZSI=;77YALcK+D6cYvBbU2OhVqXUMig8
 BG28x1pGqbkKG3vaywxIXzoteUinFOQ/hgkPY+PG8HQvaaDN0T3l6mUp0tu4icfYqtGwlrmxY
 UPYmtx/pIcCjestHIoQ2rv+bQDity5CsP6GHdTCFyPVtyqeTX42OOuFex3XByxkOmQxJ3FCGb
 tUhzxSU55LmtVOkbIotfiAtoUXn4WEbpUMq6uFiTiBMTWvTJeJAMYYJ+IciVs4tToyWLfdwbG
 oCd0NTBA1x259bToHZXg+ovmoiV456BPoAmKBPk0spc0ATLDRjDziM337bBvexjnVVksCK3Ib
 OnfaCR91ULFf9yBhNTRKeg0yfTRUOYzWVEHowyl9xEUMO+paQpK2+iNMFYoXdpn7ROSgUqlky
 rdaE1N5lL6aWnEDeOltrQNRcvVKTyQpNtwddrfKiZZpkkv3mev3DMoyKrjtr2UQsSdXNvJicJ
 iR1+eTJaD3v6ipm+OMDMC3HxTmOKf6bmsZvkwOXe7B+E980NBtqrxcVESBsuz2NPvVzNRkxzn
 tUmPdgNs+kpgijOgQloDyYSyII4JrSGwcAC8LauJlV6AbFaPL4vzIZFufB+5mOh5Df1pqW+uS
 GV2BtYYxivIPMcMtmpelktu6V2pG7rxMlzx52hUuzaN1ADZZMhZCQZTyB04GO8+wZl6XZtXeu
 lsh7oeiHElLcAemvpZthnj5oJI2yjgDT53l0QG+0q8IhLB/E235hLMp6ZiSKjxYzRWeUI7tv1
 ZaAgVSrlVZHYOEnwyNbRF6aHetAVca4HSLeBmagIsrJLJj8LUDj3dHu9uZYYTBcLVQyhH7H27
 U41Do/xPj+68/C1A1L+sUOuQ==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Sep 2024 19:25:00 +0200

Scope-based resource management became supported for some
programming interfaces by contributions of Peter Zijlstra on 2023-05-26.
See also the commit 54da6a0924311c7cf5015533991e44fb8eb12773 ("locking:
Introduce __cleanup() based infrastructure").

* Thus replace local_irq_save() and local_irq_restore() calls by calls
  of the macro =E2=80=9Cguard(irqsave)=E2=80=9D.

* Omit the local variables =E2=80=9Cflags=E2=80=9D and =E2=80=9Cirq_flags=
=E2=80=9D.

* Replace selected usage of the label =E2=80=9Cout=E2=80=9D by a few retur=
n statements.


This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/powerpc/perf/core-book3s.c | 102 +++++++++++++-------------------
 1 file changed, 42 insertions(+), 60 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book=
3s.c
index 42867469752d..6416c629a2b1 100644
=2D-- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -895,7 +895,7 @@ static int any_pmc_overflown(struct cpu_hw_events *cpu=
hw)
 /* Called from sysrq_handle_showregs() */
 void perf_event_print_debug(void)
 {
-	unsigned long sdar, sier, flags;
+	unsigned long sdar, sier;
 	u32 pmcs[MAX_HWEVENTS];
 	int i;

@@ -907,7 +907,7 @@ void perf_event_print_debug(void)
 	if (!ppmu->n_counter)
 		return;

-	local_irq_save(flags);
+	guard(irqsave)();

 	pr_info("CPU: %d PMU registers, ppmu =3D %s n_counters =3D %d",
 		 smp_processor_id(), ppmu->name, ppmu->n_counter);
@@ -949,8 +949,6 @@ void perf_event_print_debug(void)
 #endif
 	pr_info("SIAR:  %016lx SDAR:  %016lx SIER:  %016lx\n",
 		mfspr(SPRN_SIAR), sdar, sier);
-
-	local_irq_restore(flags);
 }

 /*
@@ -1298,11 +1296,12 @@ static void write_mmcr0(struct cpu_hw_events *cpuh=
w, unsigned long mmcr0)
 static void power_pmu_disable(struct pmu *pmu)
 {
 	struct cpu_hw_events *cpuhw;
-	unsigned long flags, mmcr0, val, mmcra;
+	unsigned long mmcr0, val, mmcra;

 	if (!ppmu)
 		return;
-	local_irq_save(flags);
+
+	guard(irqsave)();
 	cpuhw =3D this_cpu_ptr(&cpu_hw_events);

 	if (!cpuhw->disabled) {
@@ -1398,8 +1397,6 @@ static void power_pmu_disable(struct pmu *pmu)
 		}
 #endif
 	}
-
-	local_irq_restore(flags);
 }

 /*
@@ -1411,7 +1408,6 @@ static void power_pmu_enable(struct pmu *pmu)
 {
 	struct perf_event *event;
 	struct cpu_hw_events *cpuhw;
-	unsigned long flags;
 	long i;
 	unsigned long val, mmcr0;
 	s64 left;
@@ -1422,15 +1418,16 @@ static void power_pmu_enable(struct pmu *pmu)

 	if (!ppmu)
 		return;
-	local_irq_save(flags);
+
+	guard(irqsave)();

 	cpuhw =3D this_cpu_ptr(&cpu_hw_events);
 	if (!cpuhw->disabled)
-		goto out;
+		return;

 	if (cpuhw->n_events =3D=3D 0) {
 		ppc_set_pmu_inuse(0);
-		goto out;
+		return;
 	}

 	cpuhw->disabled =3D 0;
@@ -1474,7 +1471,7 @@ static void power_pmu_enable(struct pmu *pmu)
 			       &cpuhw->mmcr, cpuhw->event, ppmu->flags)) {
 		/* shouldn't ever get here */
 		printk(KERN_ERR "oops compute_mmcr failed\n");
-		goto out;
+		return;
 	}

 	if (!(ppmu->flags & PPMU_ARCH_207S)) {
@@ -1577,10 +1574,6 @@ static void power_pmu_enable(struct pmu *pmu)
 		mb();
 		mtspr(SPRN_MMCRA, cpuhw->mmcr.mmcra);
 	}
-
- out:
-
-	local_irq_restore(flags);
 }

 static int collect_events(struct perf_event *group, int max_count,
@@ -1619,11 +1612,10 @@ static int collect_events(struct perf_event *group=
, int max_count,
 static int power_pmu_add(struct perf_event *event, int ef_flags)
 {
 	struct cpu_hw_events *cpuhw;
-	unsigned long flags;
 	int n0;
 	int ret =3D -EAGAIN;

-	local_irq_save(flags);
+	guard(irqsave)();
 	perf_pmu_disable(event->pmu);

 	/*
@@ -1685,7 +1677,6 @@ static int power_pmu_add(struct perf_event *event, i=
nt ef_flags)
 	}

 	perf_pmu_enable(event->pmu);
-	local_irq_restore(flags);
 	return ret;
 }

@@ -1696,9 +1687,8 @@ static void power_pmu_del(struct perf_event *event, =
int ef_flags)
 {
 	struct cpu_hw_events *cpuhw;
 	long i;
-	unsigned long flags;

-	local_irq_save(flags);
+	guard(irqsave)();
 	perf_pmu_disable(event->pmu);

 	power_pmu_read(event);
@@ -1740,7 +1730,6 @@ static void power_pmu_del(struct perf_event *event, =
int ef_flags)
 		power_pmu_bhrb_disable(event);

 	perf_pmu_enable(event->pmu);
-	local_irq_restore(flags);
 }

 /*
@@ -1750,7 +1739,6 @@ static void power_pmu_del(struct perf_event *event, =
int ef_flags)

 static void power_pmu_start(struct perf_event *event, int ef_flags)
 {
-	unsigned long flags;
 	s64 left;
 	unsigned long val;

@@ -1763,7 +1751,7 @@ static void power_pmu_start(struct perf_event *event=
, int ef_flags)
 	if (ef_flags & PERF_EF_RELOAD)
 		WARN_ON_ONCE(!(event->hw.state & PERF_HES_UPTODATE));

-	local_irq_save(flags);
+	guard(irqsave)();
 	perf_pmu_disable(event->pmu);

 	event->hw.state =3D 0;
@@ -1777,20 +1765,17 @@ static void power_pmu_start(struct perf_event *eve=
nt, int ef_flags)

 	perf_event_update_userpage(event);
 	perf_pmu_enable(event->pmu);
-	local_irq_restore(flags);
 }

 static void power_pmu_stop(struct perf_event *event, int ef_flags)
 {
-	unsigned long flags;
-
 	if (!event->hw.idx || !event->hw.sample_period)
 		return;

 	if (event->hw.state & PERF_HES_STOPPED)
 		return;

-	local_irq_save(flags);
+	guard(irqsave)();
 	perf_pmu_disable(event->pmu);

 	power_pmu_read(event);
@@ -1799,7 +1784,6 @@ static void power_pmu_stop(struct perf_event *event,=
 int ef_flags)

 	perf_event_update_userpage(event);
 	perf_pmu_enable(event->pmu);
-	local_irq_restore(flags);
 }

 /*
@@ -1996,7 +1980,7 @@ static bool is_event_blacklisted(u64 ev)
 static int power_pmu_event_init(struct perf_event *event)
 {
 	u64 ev;
-	unsigned long flags, irq_flags;
+	unsigned long flags;
 	struct perf_event *ctrs[MAX_HWEVENTS];
 	u64 events[MAX_HWEVENTS];
 	unsigned int cflags[MAX_HWEVENTS];
@@ -2115,43 +2099,41 @@ static int power_pmu_event_init(struct perf_event =
*event)
 	if (check_excludes(ctrs, cflags, n, 1))
 		return -EINVAL;

-	local_irq_save(irq_flags);
-	cpuhw =3D this_cpu_ptr(&cpu_hw_events);
+	{
+		guard(irqsave)();
+		cpuhw =3D this_cpu_ptr(&cpu_hw_events);

-	err =3D power_check_constraints(cpuhw, events, cflags, n + 1, ctrs);
+		err =3D power_check_constraints(cpuhw, events, cflags, n + 1, ctrs);

-	if (has_branch_stack(event)) {
-		u64 bhrb_filter =3D -1;
+		if (has_branch_stack(event)) {
+			u64 bhrb_filter =3D -1;

-		/*
-		 * Currently no PMU supports having multiple branch filters
-		 * at the same time. Branch filters are set via MMCRA IFM[32:33]
-		 * bits for Power8 and above. Return EOPNOTSUPP when multiple
-		 * branch filters are requested in the event attr.
-		 *
-		 * When opening event via perf_event_open(), branch_sample_type
-		 * gets adjusted in perf_copy_attr(). Kernel will automatically
-		 * adjust the branch_sample_type based on the event modifier
-		 * settings to include PERF_SAMPLE_BRANCH_PLM_ALL. Hence drop
-		 * the check for PERF_SAMPLE_BRANCH_PLM_ALL.
-		 */
-		if (hweight64(event->attr.branch_sample_type & ~PERF_SAMPLE_BRANCH_PLM_=
ALL) > 1) {
-			local_irq_restore(irq_flags);
-			return -EOPNOTSUPP;
-		}
+			/*
+			 * Currently no PMU supports having multiple branch filters
+			 * at the same time. Branch filters are set via MMCRA IFM[32:33]
+			 * bits for Power8 and above. Return EOPNOTSUPP when multiple
+			 * branch filters are requested in the event attr.
+			 *
+			 * When opening event via perf_event_open(), branch_sample_type
+			 * gets adjusted in perf_copy_attr(). Kernel will automatically
+			 * adjust the branch_sample_type based on the event modifier
+			 * settings to include PERF_SAMPLE_BRANCH_PLM_ALL. Hence drop
+			 * the check for PERF_SAMPLE_BRANCH_PLM_ALL.
+			 */
+			if (hweight64(event->attr.branch_sample_type & ~PERF_SAMPLE_BRANCH_PLM=
_ALL)
+			    > 1)
+				return -EOPNOTSUPP;

-		if (ppmu->bhrb_filter_map)
-			bhrb_filter =3D ppmu->bhrb_filter_map(
-					event->attr.branch_sample_type);
+			if (ppmu->bhrb_filter_map)
+				bhrb_filter =3D ppmu->bhrb_filter_map(event->attr.branch_sample_type)=
;

-		if (bhrb_filter =3D=3D -1) {
-			local_irq_restore(irq_flags);
-			return -EOPNOTSUPP;
+			if (bhrb_filter =3D=3D -1)
+				return -EOPNOTSUPP;
+
+			cpuhw->bhrb_filter =3D bhrb_filter;
 		}
-		cpuhw->bhrb_filter =3D bhrb_filter;
 	}

-	local_irq_restore(irq_flags);
 	if (err)
 		return -EINVAL;

=2D-
2.46.0


