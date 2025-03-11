Return-Path: <linuxppc-dev+bounces-6894-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC22A5C419
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 15:42:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBxL56ksqz3bmL;
	Wed, 12 Mar 2025 01:42:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741704125;
	cv=none; b=UKhd1RxKYpg+K2f/YgRIDPfMalJ56zQUgCQCXisM5i1m2TS4Xyd7fmbZt1/WSY8XFvs5HdaPcbUOev4Hik7LouMu8ZEdPO1A/AwhHQHnvn4X+ow2vIzmUMJQ/xXQfIWA2s+JJ2B0RG7L6SF/9Cdu5d4jP4/c7DQOG7ZnZYdKdJI1kUwJWZVK2Tkg5SeW8HU/vq+r88R3o3u2H0deTsTjmsXl6fAN3VnlNKQ512gKo1ZiieuTfmHz/v5hO1Q87WnIEdpU95Mb3wWx2KTjA8qg1AUNhIfJwjGdu4iLYiRDPyiJVM5CB5LbbqXzlzvjsWGYc8Jcydi7klNIpuU1po5NmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741704125; c=relaxed/relaxed;
	bh=YQh8GUR3BeJxb5Disg+M3ANy8pAn0cbKyg9qtGciff4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lB/iaXSIAL4qAVTJ+rQisRtjD/OWAz4+TIJxt3SwYNm7ah5hIgtsx3BX3rKxpcUTOdhK5y3BO2vKZ2Wxsa/tXthXcsLUK+dkpITINciuqF5VgV3U+jAsky0HpNOK4jXepWbPpncEURgzkJLxNH8lkN10WBKuSLBSUrLjMApmDo2HbqKrN3fSsEUanHcUTLzXd35BrOczxab43wrw4d8oeWg7ZMJ3qukyneDHApgBw49I4/RsnZ0mOcYd9+kJoNVXjFpfiAvbC3EHENOkxcUhHKYLIeKVJ/26CBZrFL1hrOaWHn8gCnPQzUXHMnMicbT4IEBZNiEDXoHHlYkICyOmFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@foss.arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=foss.arm.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=foss.arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@foss.arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBxL45th4z3blV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 01:42:04 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7BA5152B;
	Tue, 11 Mar 2025 07:41:42 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 673CE3F694;
	Tue, 11 Mar 2025 07:41:27 -0700 (PDT)
Date: Tue, 11 Mar 2025 14:41:24 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <tglx@linutronix.de>,
	Sudeep Holla <sudeep.holla@arm.com>, <peterz@infradead.org>,
	<mpe@ellerman.id.au>, <linux-arm-kernel@lists.infradead.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<pierre.gondois@arm.com>, <dietmar.eggemann@arm.com>,
	<linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>, <sshegde@linux.ibm.com>
Subject: Re: [PATCH v12 0/4] Support SMT control on arm64
Message-ID: <Z9BLlOgL3RFLCFnz@bogus>
References: <20250311075143.61078-1-yangyicong@huawei.com>
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
In-Reply-To: <20250311075143.61078-1-yangyicong@huawei.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Mar 11, 2025 at 03:51:39PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> The core CPU control framework supports runtime SMT control which
> is not yet supported on arm64. Besides the general vulnerabilities
> concerns we want this runtime control on our arm64 server for:
> 
> - better single CPU performance in some cases
> - saving overall power consumption
> 
> This patchset implements it in the following aspects:
> 
> - Provides a default topology_is_primary_thread()
> - support retrieve SMT thread number on OF based system
> - support retrieve SMT thread number on ACPI based system
> - select HOTPLUG_SMT for arm64
> 
> Tests has been done on our ACPI based arm64 server and on ACPI/OF
> based QEMU VMs.
> 
> Change since v11:
> - Remove the check and warning for heterogeneous platform as suggested and discussed

IIUC, the ask was not to remove it completely but to allow single
threaded and same number of threads in all the multi-threaded CPUs.
Anyways that is not a must, we can just stash max_smt_thread_num value
before updating with max and see if it changes from one value to another
with value != 1. It can be done later when we want to warn such systems
if they appear in the future and we can't support them. For now, it looks
fine.

-- 
Regards,
Sudeep

