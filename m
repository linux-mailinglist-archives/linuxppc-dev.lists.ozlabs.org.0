Return-Path: <linuxppc-dev+bounces-6638-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CCDA4BDE5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 12:17:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5x9G2wpSz2y34;
	Mon,  3 Mar 2025 22:17:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741000626;
	cv=none; b=MBUXqOlMJ9unwiVQs+9eNvF2g8MuEGGEVjNbBYb7WhWeBUow2IwtQSLb2t84hq414ufL1mki1bIuRePIV95Q5/0ha3YkiUPBGx+QxLX2BmBSbaOvl9JjIa+6ZLOzBwbE5krJH6KNS9288p738GIeXSsRmmxnZYjHRYsp5Ma53bkzrxQMuBEnM/HGO6CbmGT1XZweVgjIDiGyRnaVgCv9nd3etOQKkfCjgAzM2Jas4shUqc6Dvy504ZvJx6zeu/wcE+mbf3PUWqdLijDqmpOsat0xx4EWiWV4N4boy5mKXrlB3tbAGOFYWaxlfEsWEitBvyLfjFETpNHH33jM7EZL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741000626; c=relaxed/relaxed;
	bh=ym2vB8taCXVhXuUVrfzAT1jmbvDb6jkdVJy/SrgbKTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OC6msiLBgPo5gVRphPtOz/Pc83bTse9imQUMRvRL1prlfHLwM0ph+SjE+sFd0VdAc/KzYja/eakCJY8/TmScosT88z9/8JezI4M4OZXaYKnu+wbmnSxODw4aMu79wN9omvGUlBCc8JEgqXZ3R0H3fG/M0dury8x/rXvumkydIHGhtvitJlK8UtoxTXYoH/+QVfgGOWzQK1O0BOEYk7Y3f05+9otAAalnXAXK1LN8JKf3N6WKisbWoMlS6DGYCoGa4NGNU9DdonuGK7fDkWMpglrWX0qu4mIpHidNClRXCYR2fcU/KXMPxgn9k/vk+iPuefY2JRO2nqb0MlwGNuP/bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5x9F1Vlvz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 22:17:03 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FC8E113E;
	Mon,  3 Mar 2025 03:16:45 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CDCF3F673;
	Mon,  3 Mar 2025 03:16:26 -0800 (PST)
Date: Mon, 3 Mar 2025 11:16:24 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: Yicong Yang <yangyicong@huawei.com>, <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, <will@kernel.org>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<dietmar.eggemann@arm.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<morten.rasmussen@arm.com>, <msuchanek@suse.de>,
	<gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <yangyicong@hisilicon.com>,
	<xuwei5@huawei.com>, <guohanjun@huawei.com>,
	<sshegde@linux.ibm.com>
Subject: Re: [PATCH v11 3/4] arm64: topology: Support SMT control on ACPI
 based system
Message-ID: <Z8WPiOweOjFZqTwN@bogus>
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-4-yangyicong@huawei.com>
 <Z8HAkZiHYRjj97M7@bogus>
 <336e9c4e-cd9c-4449-ba7b-60ee8774115d@arm.com>
 <20250228190641.q23vd53aaw42tcdi@bogus>
 <a52972c7-aadd-4a77-a292-057fa5f8372d@arm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a52972c7-aadd-4a77-a292-057fa5f8372d@arm.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Mar 03, 2025 at 10:56:12AM +0100, Pierre Gondois wrote:
> On 2/28/25 20:06, Sudeep Holla wrote:
> > > >
> > > > Ditto as previous patch, can get rid if it is default 1.
> > > >
> > >
> > > On non-SMT platforms, not calling cpu_smt_set_num_threads() leaves
> > > cpu_smt_num_threads uninitialized to UINT_MAX:
> > >
> > > smt/active:0
> > > smt/control:-1
> > >
> > > If cpu_smt_set_num_threads() is called:
> > > active:0
> > > control:notsupported
> > >
> > > So it might be slightly better to still initialize max_smt_thread_num.
> > >
> >
> > Sure, what I meant is to have max_smt_thread_num set to 1 by default is
> > that is what needed anyways and the above code does that now.
> >
> > Why not start with initialised to 1 instead ?
> > Of course some current logic needs to change around testing it for zero.
> >
>
> I think there would still be a way to check against the default value.
> If we have:
> unsigned int max_smt_thread_num = 1;
>
> then on a platform with 2 threads, the detection condition would trigger:
> xa_for_each(&hetero_cpu, hetero_id, entry) {
>     if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)     <---- (entry->thread_num=2) and (max_smt_thread_num=1)
>         pr_warn_once("Heterogeneous SMT topology is partly
>                       supported by SMT control\n");
>
> so we would need an additional variable:
> bool is_initialized = false;

Sure, we could do that or skip the check if max_smt_thread_num == 1 ?

I mean
	if (entry->thread_num != max_smt_thread_num && max_smt_thread_num != 1)

I assume entry->thread_num must be set to 1 on single threaded cores
Won't that work ? Am I missing something still ?

--
Regards,
Sudeep

