Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9C744DA93
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 17:37:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqnSx063Sz2ywJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Nov 2021 03:37:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.49.213;
 helo=5.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 5.mo548.mail-out.ovh.net (5.mo548.mail-out.ovh.net
 [188.165.49.213])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqnSP69Lvz2yPp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Nov 2021 03:37:23 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.5])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id B677F207E0;
 Thu, 11 Nov 2021 16:01:16 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 11 Nov
 2021 17:01:16 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00548b62de8-7217-45f9-a3a6-94d77bce3813,
 8B5B52A496DB6C6EAAECFF7965DC260A0E8F97D2) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7341ab0d-c12b-6d5f-76d3-5927a2734f02@kaod.org>
Date: Thu, 11 Nov 2021 17:01:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 11/11] powerpc/smp: Add a doorbell=off kernel parameter
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
References: <20211105102636.1016378-1-clg@kaod.org>
 <20211105102636.1016378-12-clg@kaod.org> <87fss3m0sp.fsf@mpe.ellerman.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87fss3m0sp.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 760a52f1-e90b-4a68-b7ed-7177b4d3abb4
X-Ovh-Tracer-Id: 4488962930185178077
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrvddugdekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhm
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/11/21 11:41, Michael Ellerman wrote:
> Cédric Le Goater <clg@kaod.org> writes:
>> On processors with a XIVE interrupt controller (POWER9 and above), the
>> kernel can use either doorbells or XIVE to generate CPU IPIs. Sending
>> doorbell is generally preferred to using the XIVE IC because it is
>> faster. There are cases where we want to avoid doorbells and use XIVE
>> only, for debug or performance. Only useful on POWER9 and above.
> 
> How much do we want this?

Yes. Thanks for asking. It is a recent need.

Here is some background I should have added in the first place. May be
for a v2.

We have different ways of doing IPIs on POWER9 and above processors,
depending on the platform and the underlying hypervisor.

- PowerNV uses global doorbells

- pSeries/KVM uses XIVE only because local doorbells are not
   efficient, as there are emulated in the KVM hypervisor

- pSeries/PowerVM uses XIVE for remote cores and local doorbells for
   threads on same core (SMT4 or 8)

This recent commit 5b06d1679f2f ("powerpc/pseries: Use doorbells even
if XIVE is available") introduced the optimization for PowerVM and
commit 107c55005fbd ("powerpc/pseries: Add KVM guest doorbell
restrictions") restricted the optimization.

We would like a way to turn off the optimization.

> Kernel command line args are a bit of a pain, they tend to be poorly
> tested, because someone has to explicitly enable them at boot time,
> and then reboot to test the other case.

True. The "xive=off" parameter was poorly tested initially.

> When would we want to enable this?

For bring-up, for debug, for tests. I have been using a similar switch
to compare the XIVE interrupt controller performance with doorbells on
POWER9 and P0WER10.

A new need arises with PowerVM, some configurations will behave as KVM
(local doorbell are unsupported) and the doorbell=off parameter is a
simple way to handle this case today.

> Can we make the kernel smarter about when to use doorbells and make
> it automated?

I don't think we want to probe all IPI methods to detect how well
local doorbells are supported on the platform. Do we ?

A machine property/feature would be cleaner. It is a global CPU
property but I don't know where to put it. Ideas ?

> Could we make it a runtime switch?

We can. See the patch below. It covers the need for test/performance
but it won't work on a PowerVM system not supporting local doorbells
since boot will fail as soon as secondaries are started. We need a way
to take a decision early on which method to activate.


Thanks

C.

 From dcac8528c89b689217515032f3329ba5ea10085d Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Fri, 5 Nov 2021 12:23:48 +0100
Subject: [PATCH] powerpc/xive: Add a debugfs toggle to select xive for IPIs
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For performance tests only.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
  arch/powerpc/sysdev/xive/common.c | 26 ++++++++++++++++++++++++++
  1 file changed, 26 insertions(+)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 39142df828a018..9ee36b95f9c545 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1826,6 +1826,30 @@ static int xive_eq_debug_show(struct seq_file *m, void *private)
  }
  DEFINE_SHOW_ATTRIBUTE(xive_eq_debug);
  
+static int xive_ipi_cause_debug_set(void *data, u64 val)
+{
+	static void (*do_ipi)(int cpu);
+
+	if (val) {
+		do_ipi = smp_ops->cause_ipi;
+		smp_ops->cause_ipi = xive_cause_ipi;
+	} else {
+		if (do_ipi)
+			smp_ops->cause_ipi = do_ipi;
+	}
+
+	return 0;
+}
+
+static int xive_ipi_cause_debug_get(void *data, u64 *val)
+{
+	*val = xive_cause_ipi == smp_ops->cause_ipi;
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(xive_ipi_cause_debug_fops, xive_ipi_cause_debug_get,
+			 xive_ipi_cause_debug_set, "%llu\n");
+
  static void xive_core_debugfs_create(void)
  {
  	struct dentry *xive_dir;
@@ -1849,6 +1873,8 @@ static void xive_core_debugfs_create(void)
  	}
  	debugfs_create_bool("store-eoi", 0600, xive_dir, &xive_store_eoi);
  	debugfs_create_bool("save-restore", 0600, xive_dir, &xive_has_save_restore);
+	debugfs_create_file("ipi-cause", 0600, xive_dir,
+			    NULL, &xive_ipi_cause_debug_fops);
  }
  
  #endif /* CONFIG_DEBUG_FS */
