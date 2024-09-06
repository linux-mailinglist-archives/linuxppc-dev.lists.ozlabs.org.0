Return-Path: <linuxppc-dev+bounces-1101-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C449796F1C7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 12:42:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0Xqq3JvFz304B;
	Fri,  6 Sep 2024 20:42:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725606440;
	cv=none; b=eLAQ2e4L3zkfijAHWRWSL8J+8Z4fSgnVWwtqDFU7bL5+7bIDxmv9Rt/H2STFkOqot7AfKay8zdx5oZmfUL2LEohsVZo2qU1PgJLdIRA6oYhXGAwb91AV6tZEPVSoiPAbHSyKM0QX+WEb8wLxRGS5LXP32ze6SuFqZD9Icai4GxxmM1/NRRaXdTtrt45V7138Lzcy4syvR5RaQshzjH5wehfmc9fYeJOSK8qcrBm4mvBh5OBJnEVBfWwri9sATagQ0hW+gFRBxY6pEn2sgmTZnP1rNXVFi4OPBDXh/B5aTZ6oKg8S/l46ISL6ZaIDVX3dsQHPmUdYJUaub/3SWtq44Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725606440; c=relaxed/relaxed;
	bh=JzHuzwYv1A4WZNysYS65N8PwpinTo4zkrx7lnPByC8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mA5Xc5aWN7ZVaY3+sNUk39Na0rsxjAH+StR34HV3O74i4U5qJuBhts4Un7Q/UckvcoWYy4v4lI+k7sfxuVPcnWqdvu1hzFdgWE8n1qZnUByJ3xOZJr+TwRiTfzvcs+4x83C7b1Vp84yg0aYVwQQihQEtf02gcyQFPxMaAd9HIfVq058Andioc2TUBoqJFa9uh/2CpvAcRRsYA063LdL3RIuZm1JQ4/LGCnhLvdHCwO0MaPWkd+6AgHP3mel4iy8vbKfuv2rtMU24ztM0MVwvu4Xc48KKZeXlLnicrQHDW7SaBr6HLj9xqf8SMWrn8pV3tg8IfOTbMLTBuvQs/MmXGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=morten.rasmussen@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=morten.rasmussen@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0S3D0sTtz301Y
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 17:07:17 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69D0EFEC;
	Fri,  6 Sep 2024 00:07:12 -0700 (PDT)
Received: from R5WKVNH4JW (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D6703F66E;
	Fri,  6 Sep 2024 00:06:41 -0700 (PDT)
Date: Fri, 6 Sep 2024 09:06:33 +0200
From: Morten Rasmussen <morten.rasmussen@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: Pierre Gondois <pierre.gondois@arm.com>, yangyicong@hisilicon.com,
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
Message-ID: <Ztqp-SUinu8C9a-P@R5WKVNH4JW>
References: <20240806085320.63514-1-yangyicong@huawei.com>
 <20240806085320.63514-4-yangyicong@huawei.com>
 <a998c723-7451-439a-9c88-7c8b5c1b890b@arm.com>
 <00e6110a-462a-c117-0292-e88b57d27a05@huawei.com>
 <3947cb79-3199-4cd6-b784-51a245084581@arm.com>
 <1a7b5ac7-f040-672f-07a0-d7f3dc170c88@huawei.com>
 <6c05e39c-41f3-451c-b119-7b8662c1ceee@arm.com>
 <7f722af2-2969-aae5-1fb5-68d353eb95b9@huawei.com>
 <277bd093-422b-4301-92a3-d0a58eb41af5@arm.com>
 <10082e64-b00a-a30b-b9c5-1401a54f6717@huawei.com>
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
In-Reply-To: <10082e64-b00a-a30b-b9c5-1401a54f6717@huawei.com>

Hi Yicong,

On Thu, Sep 05, 2024 at 08:02:20PM +0800, Yicong Yang wrote:
> On 2024/9/5 16:34, Pierre Gondois wrote:
> > Hello Yicong,
> > 
> > If a platform has CPUs with:
> > - 1 thread
> > - X (!= 1) threads
> > Then I think that the asymmetry is not detected
> 
> Ah ok, I only handle the case where there are several thread numbers except no SMT CPUs in the
> system. For this case I was thinking we don't need to handle this since there's only one kind
> of SMT core in the system, control should works fine for the SMT CPU clusters and we may not
> care about the CPUs with no SMT.
> 
> Below code should handle the case if we initialize the max_smt_thread_num to 0. I also
> reword the warning messages to match the fact. For heterogeneous SMT topology we still
> support control SMT by on/off toggle but not fully support setting the thread number.
> 
> 	int max_smt_thread_num = 0;
> 	[...]
> 	/*
> 	 * This should be a short loop depending on the number of heterogeneous
> 	 * CPU clusters. Typically on a homogeneous system there's only one
> 	 * entry in the XArray.
> 	 */
> 	xa_for_each(&hetero_cpu, hetero_id, entry) {
> 		/*
> 		 * If max_smt_thread_num has been initialized and doesn't match
> 		 * the thread number of this entry, then the system has
> 		 * heterogeneous SMT topology.
> 		 */
> 		if (entry->thread_num != max_smt_thread_num && max_smt_thread_num)
> 			pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");

What does 'partly supported' mean here?

If the SMT control doesn't work as intended for this topology, I don't
think it should be enabled for it.

Morten

