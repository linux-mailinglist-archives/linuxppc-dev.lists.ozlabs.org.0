Return-Path: <linuxppc-dev+bounces-1287-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4339E976874
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 14:00:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4GGF10C8z2xpv;
	Thu, 12 Sep 2024 22:00:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726142405;
	cv=none; b=Xh4qfMVYKvTbzToC2qAKiDBtfgz6Z4U8Z1UpPtGSdRRBJoGWZ1QeublPV8Qqndnc++fa6uS9GCyyfg2zfoWlp3X4LdMLv3kXp64Uqil7zgfJwvdH+5ZQhUrxMYE8SPAju1FMI/F7bAUwCtQwYwDFuDUfDcl3myiVlwvEltySRM8nbsv1bm6pxTdQ23kU6zYdlvQuAkIERIfkFh+mztShXl+r6yLdUwjoFze//47OBZ2pkgnwHIkNaJuTTUvK8eGcMT9jJgRE8x3yd9582fysh2bZfyti6gvmgs0+XirhZu4LXo7x1IBvQb8HekJWrrlqTvCU+rHUYW5J3sLoaFkEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726142405; c=relaxed/relaxed;
	bh=vAADt586xCKw0PRkD5hXRBBdE5jQmBMuZsOGgSCDPY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3A7j+VKyX508P2C51Jwq+rJuw4SDn92jX+9GNmdURyxxqy7yR5hoUvcmg23flH3F3Hr/zW/kijbPyy1KBWFcAfWVyvyQfohuSYL5zKk/7ZrjAY9bCk85aV9V6hdHfPcFJjPaN+/uzyaDgLvmNQtKA7986lT22ibO9HsrOAFdg0pBWGEt2GCSmus0kMiNTZ8qqEG1dhIBV8i3DSuwDjGpxaSfGqYaX7Fs8gfjFU1sAwecnmVhbg25dyYmyH4OfZFLMzAoMLPVqR2OY4q+qwGHA0P+9VVB7evhhr/Ek/dauK0/sGuasZrAT8ZhOftBDD9sxYdfrTsQrUlfBOhxQfT0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=morten.rasmussen@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=morten.rasmussen@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4GGD25Lzz2yHL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 22:00:02 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26E96DA7;
	Thu, 12 Sep 2024 04:59:57 -0700 (PDT)
Received: from R5WKVNH4JW (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EE0D3F73B;
	Thu, 12 Sep 2024 04:59:24 -0700 (PDT)
Date: Thu, 12 Sep 2024 13:59:16 +0200
From: Morten Rasmussen <morten.rasmussen@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: yangyicong@hisilicon.com, Pierre Gondois <pierre.gondois@arm.com>,
	linuxppc-dev@lists.ozlabs.org, bp@alien8.de,
	dave.hansen@linux.intel.com, mingo@redhat.com,
	linux-arm-kernel@lists.infradead.org, mpe@ellerman.id.au,
	peterz@infradead.org, tglx@linutronix.de, sudeep.holla@arm.com,
	will@kernel.org, catalin.marinas@arm.com, x86@kernel.org,
	linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
	gregkh@linuxfoundation.org, rafael@kernel.org,
	jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
	linuxarm@huawei.com, xuwei5@huawei.com, guohanjun@huawei.com
Subject: Re: [PATCH v5 3/4] arm64: topology: Support SMT control on ACPI
 based system
Message-ID: <ZuLXlOe0CyiH5eXd@R5WKVNH4JW>
References: <a998c723-7451-439a-9c88-7c8b5c1b890b@arm.com>
 <00e6110a-462a-c117-0292-e88b57d27a05@huawei.com>
 <3947cb79-3199-4cd6-b784-51a245084581@arm.com>
 <1a7b5ac7-f040-672f-07a0-d7f3dc170c88@huawei.com>
 <6c05e39c-41f3-451c-b119-7b8662c1ceee@arm.com>
 <7f722af2-2969-aae5-1fb5-68d353eb95b9@huawei.com>
 <277bd093-422b-4301-92a3-d0a58eb41af5@arm.com>
 <10082e64-b00a-a30b-b9c5-1401a54f6717@huawei.com>
 <Ztqp-SUinu8C9a-P@R5WKVNH4JW>
 <bb2bd7f4-e0ea-a771-7960-e35949ec9e03@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb2bd7f4-e0ea-a771-7960-e35949ec9e03@huawei.com>

On Fri, Sep 06, 2024 at 04:36:30PM +0800, Yicong Yang wrote:
> On 2024/9/6 15:06, Morten Rasmussen wrote:
> > Hi Yicong,
> > 
> > On Thu, Sep 05, 2024 at 08:02:20PM +0800, Yicong Yang wrote:
> >> On 2024/9/5 16:34, Pierre Gondois wrote:
> >>> Hello Yicong,
> >>>
> >>> If a platform has CPUs with:
> >>> - 1 thread
> >>> - X (!= 1) threads
> >>> Then I think that the asymmetry is not detected
> >>
> >> Ah ok, I only handle the case where there are several thread numbers except no SMT CPUs in the
> >> system. For this case I was thinking we don't need to handle this since there's only one kind
> >> of SMT core in the system, control should works fine for the SMT CPU clusters and we may not
> >> care about the CPUs with no SMT.
> >>
> >> Below code should handle the case if we initialize the max_smt_thread_num to 0. I also
> >> reword the warning messages to match the fact. For heterogeneous SMT topology we still
> >> support control SMT by on/off toggle but not fully support setting the thread number.
> >>
> >> 	int max_smt_thread_num = 0;
> >> 	[...]
> >> 	/*
> >> 	 * This should be a short loop depending on the number of heterogeneous
> >> 	 * CPU clusters. Typically on a homogeneous system there's only one
> >> 	 * entry in the XArray.
> >> 	 */
> >> 	xa_for_each(&hetero_cpu, hetero_id, entry) {
> >> 		/*
> >> 		 * If max_smt_thread_num has been initialized and doesn't match
> >> 		 * the thread number of this entry, then the system has
> >> 		 * heterogeneous SMT topology.
> >> 		 */
> >> 		if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)
> >> 			pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
> > 
> > What does 'partly supported' mean here?
> > 
> > If the SMT control doesn't work as intended for this topology, I don't
> > think it should be enabled for it.
> > 
> 
> The /sys/devices/system/cpu/smt/control supports 2 kind of controls [1]
> (a) enable/disable SMT entirely by writing on/off
> (b) enable/disable SMT partially by writing a valid thread number (CONFIG_SMT_NUM_THREADS_DYNAMIC)
> 
> We assume 3 kind of SMT topology:
> 1. homogeneous SMT topology, all the CPUs support SMT or not
> 2.1 heterogeneous SMT topology, part of CPU clusters have SMT and others not. Clusters support SMT
>     have the same SMT thread number
> 2.2 heterogeneous SMT topology, part of CPU clusters have SMT and the thread number may differs
>     (e.g. cluster 1 is of SMT 2 and cluster 2 is of SMT 4. not sure there's such a real system)
> 
> For any of above SMT topology, control (a) should work as expected. When enabling SMT by writing "on"
> the SMT is disabled for those CPU clusters who have SMT. Same for disabling SMT by writing "off".
> But control (b) may not work for case 2.2 since the SMT thread number is not the same across
> the system.
> 
> For this series alone we won't met this since CONFIG_SMT_NUM_THREADS_DYNAMIC is not enabled.
> So control (b) only supports write 1/max_thread which behaves same as write off/on and will
> work as intended for all the 3 cases. As discussed Pierre will add support for
>  CONFIG_SMT_NUM_THREADS_DYNAMIC since thunderX2 is a symmetric SMT4 machine and
> CONFIG_SMT_NUM_THREADS_DYNAMIC would be useful. We thought a warning should be useful
> if running on a system of case 2.2.

Thanks for explaining the situation.

So IIUC, for case 2.2 there will be _no_ failures if someone writes a
value different from 1 or max_threads?

The SMT control code can handle that max_threads isn't the correct
number of threads for all cores in the system?

