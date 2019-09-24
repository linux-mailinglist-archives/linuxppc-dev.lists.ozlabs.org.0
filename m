Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A82BC88C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 15:03:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d1ZS30r4zDqLk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 23:02:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="b0KTt7xa"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d1WK2JHTzDq75
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 23:00:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ylrO+be3Mmt+XjMqDRomHffExbjsXGlaXweUO2EGDGw=; b=b0KTt7xaHwsu3rE54aR9vlkxp
 aXve44h/2oq0DshKJQpyeK3clHkUTZBL2jf617MWWYi1VP+TBuo1zAw/egHbl2cQwxDjPG3n326wc
 CBPFOUX6971a0HFnr8xPfy8sqXrUIJn6wo4ySykwm1yWMdOXLe87GZ3mral+5xdHOVraQbyzjeeOb
 KzVVwubFdmgQvhXjsVCg9be0PiHlkfvdGwbOJ55IBt7PtAUOiH9LLyY2sucwO/r1M8Jug/sEtV+WM
 R64nVAZkbXZWJFgPsUT218LWuQbiHCxfmkctmbYDsMotGKIMx9CCaGLAM2EriZYPUD8GziRFYqoJe
 nyru16oqQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCkPs-00081B-C4; Tue, 24 Sep 2019 12:59:41 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AD9EB301A7A;
 Tue, 24 Sep 2019 14:58:50 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 4B82120C3E176; Tue, 24 Sep 2019 14:59:36 +0200 (CEST)
Date: Tue, 24 Sep 2019 14:59:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
Message-ID: <20190924125936.GR2349@hirez.programming.kicks-ass.net>
References: <20190923165235.GD17206@dhcp22.suse.cz>
 <20190923203410.GI2369@hirez.programming.kicks-ass.net>
 <20190924074751.GB23050@dhcp22.suse.cz>
 <20190924091714.GJ2369@hirez.programming.kicks-ass.net>
 <20190924105622.GH23050@dhcp22.suse.cz>
 <20190924112349.GJ2332@hirez.programming.kicks-ass.net>
 <20190924115401.GM23050@dhcp22.suse.cz>
 <20190924120943.GP2349@hirez.programming.kicks-ass.net>
 <20190924122500.GP23050@dhcp22.suse.cz>
 <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dalias@libc.org, linux-sh@vger.kernel.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, heiko.carstens@de.ibm.com,
 jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, mwb@linux.vnet.ibm.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, chenhc@lemote.com,
 will@kernel.org, cai@lca.pw, linux-s390@vger.kernel.org,
 ysato@users.sourceforge.jp, x86@kernel.org,
 Yunsheng Lin <linyunsheng@huawei.com>, rppt@linux.ibm.com,
 borntraeger@de.ibm.com, dledford@redhat.com, mingo@redhat.com,
 jeffrey.t.kirsher@intel.com, jhogan@kernel.org, mattst88@gmail.com,
 len.brown@intel.com, gor@linux.ibm.com, anshuman.khandual@arm.com,
 gregkh@linuxfoundation.org, bp@alien8.de, luto@kernel.org, tglx@linutronix.de,
 naveen.n.rao@linux.vnet.ibm.com, linux-arm-kernel@lists.infradead.org,
 rth@twiddle.net, axboe@kernel.dk, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, tbogendoerfer@suse.de,
 paul.burton@mips.com, linux-alpha@vger.kernel.org, rafael@kernel.org,
 ink@jurassic.park.msu.ru, akpm@linux-foundation.org, robin.murphy@arm.com,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 24, 2019 at 02:43:25PM +0200, Peter Zijlstra wrote:
> On Tue, Sep 24, 2019 at 02:25:00PM +0200, Michal Hocko wrote:
> > On Tue 24-09-19 14:09:43, Peter Zijlstra wrote:
> 
> > > We can push back and say we don't respect the specification because it
> > > is batshit insane ;-)
> > 
> > Here is my fingers crossed.
> > 
> > [...]
> > 
> > > Now granted; there's a number of virtual devices that really don't have
> > > a node affinity, but then, those are not hurt by forcing them onto a
> > > random node, they really don't do anything. Like:
> > 
> > Do you really consider a random node a better fix than simply living
> > with a more robust NUMA_NO_NODE which tells the actual state? Page
> > allocator would effectivelly use the local node in that case. Any code
> > using the cpumask will know that any of the online cpus are usable.
> 
> For the pmu devices? Yes, those 'devices' aren't actually used for
> anything other than sysfs entries.
> 
> Nothing else uses the struct device.

The below would get rid of the PMU and workqueue warnings with no
side-effects (the device isn't used for anything except sysfs).

I'm stuck in the device code for BDIs, I can't find a sane place to set
the node before it gets added, due to it using device_create_vargs().

---
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 4f08b17d6426..2a64dcc3d70f 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -9965,6 +9965,7 @@ static int pmu_dev_alloc(struct pmu *pmu)
 	if (!pmu->dev)
 		goto out;
 
+	set_dev_node(pmu->dev, 0);
 	pmu->dev->groups = pmu->attr_groups;
 	device_initialize(pmu->dev);
 	ret = dev_set_name(pmu->dev, "%s", pmu->name);
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index bc2e09a8ea61..efafc4590bbe 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5613,6 +5613,7 @@ int workqueue_sysfs_register(struct workqueue_struct *wq)
 	wq_dev->dev.bus = &wq_subsys;
 	wq_dev->dev.release = wq_device_release;
 	dev_set_name(&wq_dev->dev, "%s", wq->name);
+	set_dev_node(wq_dev, 0);
 
 	/*
 	 * unbound_attrs are created separately.  Suppress uevent until
