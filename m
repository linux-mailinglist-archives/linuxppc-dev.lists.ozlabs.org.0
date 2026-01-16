Return-Path: <linuxppc-dev+bounces-15903-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6049D32E46
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 15:53:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt2sQ1qhtz3bW7;
	Sat, 17 Jan 2026 01:53:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768575194;
	cv=none; b=Se4WFKnOPrT8YgncvbFUK2/7hwaHcYGs9Ne8lXOoCo/u1/jJydO1TkMhvqDZdP9E7+4GTmTBe/M/tCo4cJmNrkryK3CJIvxzj80sbZ3B+2YqwEvvtZGALed5pIl0O9nwMl8FHi1ANZ1Rx7z1OFFln34CnxOl5mmC+PVK8OTnX2g9Y0g2B3S9nVQ/myi+TeZ70XgJsGN5qnfXPpDyugV9DFKr+ZLLNGfDkapmap88qd4LSbWms4J1fIpxeM7tKz67NezrVIB+0aTN+bhmwb9ZDXsG9OV42HGuCR4c4yOnB6uilYJ1zPigJ/XPahsO0VV4q2JyTpg5pKfJh45S+4riVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768575194; c=relaxed/relaxed;
	bh=wkNvBnJ0W5qcEmJFdeVLHoio0JsvPFzSkF0OPc5Gu+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aEbeFcormiev10qwNDCEMpUBzrujED5vSCXuGImMG14O2VBa5IPhXtD28uDPvem9ZYlClHTWl3r7zz+3y2WNeaxgoPYnsAztZb2ozmFE+aOkK0sgo/fGr6ZEOp6vxPYdPOiSvOn/bQeZB/MB0QRU5MTv7iIlF7jhV90DFkYgz9zYeBN/wdhwLbRh5eJzkhLi7DDzWLBzDl0OaknFEomI15gg/HRA9ZTLO/+XrrVcSEJs3rRo6rGFHKLGgvVoGVigsxzt+HC7QpTi2uWXSInRMDRU/QgHPxMTS8Ls6hla+Yvdtc7nsl1H1aKw4HLC0XqvNw0N+miuOFXkeCNHOL/QLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AUnnY7SK; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AUnnY7SK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt2sP4WKJz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 01:53:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B032E601BC;
	Fri, 16 Jan 2026 14:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A0FC19421;
	Fri, 16 Jan 2026 14:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768575191;
	bh=TzrKoRirKu2E+jAiuhlzsln8JBhROUV36dDGy9tKFsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AUnnY7SK3ALhVTftF+V//K5xP8H7lrjkEswZ+U2Y2mPJfJsD3b2iS1zkZM/21hkDb
	 otcvgtr3VNOsAa5lRYT6msuhiOEdltnRqueCWPAs3RmlhuxjPkj0MoZRyQYXkCVkp+
	 EEa529KqpaVkr3RPuZTwr5AB9LQEXD1IOjZhct9kLv/VlIEdQtP5Pg0qGxOgAtdzuG
	 zKl2D/2NbJb9yEWBpc2c6pyOL9cKpOdjPb072dxVwl4v4i2PACLu684MJTdcq35VeG
	 yuc16NjatOamu0X8Rn+5hd5bF/GzfXEYSr+6rWj9yP9o2l3izkMwerxfrSQRHI6L2Y
	 YEhsuz1tKeRPA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ben Segall <bsegall@google.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mel Gorman <mgorman@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Xin Zhao <jackzxcui1989@163.com>,
	linux-pm@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/15] cpufreq: ondemand: Simplify idle cputime granularity test
Date: Fri, 16 Jan 2026 15:52:00 +0100
Message-ID: <20260116145208.87445-8-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260116145208.87445-1-frederic@kernel.org>
References: <20260116145208.87445-1-frederic@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

cpufreq calls get_cpu_idle_time_us() just to know if idle cputime
accounting has a nanoseconds granularity.

Use the appropriate indicator instead to make that deduction.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 drivers/cpufreq/cpufreq_ondemand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index a6ecc203f7b7..2d52ee035702 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -334,17 +334,12 @@ static void od_free(struct policy_dbs_info *policy_dbs)
 static int od_init(struct dbs_data *dbs_data)
 {
 	struct od_dbs_tuners *tuners;
-	u64 idle_time;
-	int cpu;
 
 	tuners = kzalloc(sizeof(*tuners), GFP_KERNEL);
 	if (!tuners)
 		return -ENOMEM;
 
-	cpu = get_cpu();
-	idle_time = get_cpu_idle_time_us(cpu, NULL);
-	put_cpu();
-	if (idle_time != -1ULL) {
+	if (tick_nohz_enabled) {
 		/* Idle micro accounting is supported. Use finer thresholds */
 		dbs_data->up_threshold = MICRO_FREQUENCY_UP_THRESHOLD;
 	} else {
-- 
2.51.1


