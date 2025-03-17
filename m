Return-Path: <linuxppc-dev+bounces-7115-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D89A6485D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 10:57:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGVkv4Wyhz2ygk;
	Mon, 17 Mar 2025 20:57:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742205447;
	cv=none; b=Y3cmn2LOQW60e5oyuX+Po/cF13Umat9wSYjdzKPIypi/U1MSmEQRvwH7saoOC5NOTWYFHniU1qx+f0bDAJ6KBEh51Ubyy0bH7pRcpJw9ePW0yVRTwbPkARQye1TYfmaVjbkLVaSA7BTGeM+nyr7Dvx/xyTD0JhQv0BjH1nlBHrqz1K/jXSxNu18wxce8RoMaD022s3sVjnvQlC1H3nxgFnkpacouTsD3c482pfUcJJMKFcd/lHwAimMx+C3jT2Q2DwjuBSr6oxa4c/vXZXaMid+vu8G5bvELemwjFrWS7XeN6fIFNreZAkd0PyVTE6WOeeXOxPqNh+ahxZHLQSs4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742205447; c=relaxed/relaxed;
	bh=Vhtf+O6571L5NvCf+/lUYx3qGvG7r+/V8Hl09YPXGb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V1kDr1r/8kr544ZUH4FRywVyCiNeIjEcfRYCdyf0IjJbOLTol3WN5NjRgmt114fkozUNC0/tECFaw8OvV53Laf+yAvPN+/O/hT56hJdn2AgFnJlzQ+yNx93zmRC7JSmvokaXwgtTjbWM9TwdjCOK5q4aV/vbIi5zFVv2XYYtYJV4UGNoNzOwitsdY2tZWszGV0SgLv1wxpvTCGPEaB3XIstLRbUS45Ici5wK3pmPLd0ieDxHwLoBoG85n11Q+wBvRTYySoMo/v2yvAlxYb99KceFPRR+5sFM3Ie25mhj0m7N7TZv7D/mx6+MJqRed4wp/OBQD+C/+03HU7PUKtiXOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGVkv04y5z2ygg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 20:57:26 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34AF413D5;
	Mon, 17 Mar 2025 02:57:04 -0700 (PDT)
Received: from [172.18.154.215] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AB1E3F673;
	Mon, 17 Mar 2025 02:56:48 -0700 (PDT)
Message-ID: <2bd3aa0a-d700-46bf-81d1-a5fb0364d1e0@arm.com>
Date: Mon, 17 Mar 2025 10:56:43 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/4] arch_topology: Support SMT control for OF based
 system
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, sudeep.holla@arm.com, tglx@linutronix.de,
 peterz@infradead.org, mpe@ellerman.id.au,
 linux-arm-kernel@lists.infradead.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, pierre.gondois@arm.com
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, morten.rasmussen@arm.com, msuchanek@suse.de,
 gregkh@linuxfoundation.org, rafael@kernel.org, jonathan.cameron@huawei.com,
 prime.zeng@hisilicon.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 xuwei5@huawei.com, guohanjun@huawei.com, sshegde@linux.ibm.com
References: <20250311075143.61078-1-yangyicong@huawei.com>
 <20250311075143.61078-3-yangyicong@huawei.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20250311075143.61078-3-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/03/2025 08:51, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> On building the topology from the devicetree, we've already gotten the
> SMT thread number of each core. Update the largest SMT thread number
> and enable the SMT control by the end of topology parsing.
> 
> The framework's SMT control provides two interface to the users [1]
> through /sys/devices/system/cpu/smt/control:
> 1) enable SMT by writing "on" and disable by "off"
> 2) enable SMT by writing max_thread_number or disable by writing 1
> 
> Both method support to completely disable/enable the SMT cores so both
> work correctly for symmetric SMT platform and asymmetric platform with
> non-SMT and one type SMT cores like:
> core A: 1 thread
> core B: X (X!=1) threads
> 
> Note that for a theoretically possible multiple SMT-X (X>1) core
> platform the SMT control is also supported as expected but only
> by writing the "on/off" method.

Here we still have a little misunderstanding. IMHO, even on such a
system 2) would work too.

My qemu example with SMT-1, SMT-2 and SMT-4 in one system from your v11:

# cat /proc/schedstat | grep -v "^v\|^t" | awk '{print $1" "$2" "$3}'
cpu0 0 0
domain0 MC ff
cpu1 0 0
domain0 MC ff
cpu2 0 0
domain0 SMT 0c
domain1 MC ff
cpu3 0 0
domain0 SMT 0c
domain1 MC ff
cpu4 0 0
domain0 SMT f0
domain1 MC ff
cpu5 0 0
domain0 SMT f0
domain1 MC ff
cpu6 0 0
domain0 SMT f0
domain1 MC ff
cpu7 0 0
domain0 SMT f0
domain1 MC ff

# cat /proc/cpuinfo | grep ^processor
processor	: 0
processor	: 1
processor	: 2
processor	: 3
processor	: 4
processor	: 5
processor	: 6
processor	: 7

# echo 1 > /sys/devices/system/cpu/smt/control

# cat /proc/cpuinfo | grep ^processor
processor	: 0
processor	: 1
processor	: 2
processor	: 4

# echo 4 > /sys/devices/system/cpu/smt/control

# cat /proc/cpuinfo | grep ^processor
processor	: 0
processor	: 1
processor	: 2
processor	: 3
processor	: 4
processor	: 5
processor	: 6
processor	: 7

Whats doesn't work is to echoing a '2' but that's not
'max_thread_number' of the system.

[...]

