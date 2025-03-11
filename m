Return-Path: <linuxppc-dev+bounces-6898-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBA7A5C424
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 15:43:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBxMH0gCvz3brP;
	Wed, 12 Mar 2025 01:43:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741704187;
	cv=none; b=EpcirqwWojx0x0Yyeg6twYBZStz0dkGoukKSy7+GzWsK8RikF7/xavSK+OFRKgkeb50GZIYyr/WLyCF6+/uV0daI5aQUzqS3/fv8UeXEZWEcYQUg519+fP7pZOik9LXrHGLJPlf1LqYVJNDEBwuD3lLoTfe5OxDFc6J8tV9S3e6xty9GEB53DLDvdPs/9CDCbvLyzyepzCG8Sl3FyiJ36OvtfXG/cR8PyqmzNbEXCB1AS0LFUOfttz4AW1BArSpLQCVQ6IMYSfrQIqmW9RAOQ3pcBaWmk3cm79fghg22LhEIKFYzrun91nJLrHmmB3C3JFpWSfG7lrbxGM6d3KM7Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741704187; c=relaxed/relaxed;
	bh=kHx9MMe0I+IhuCYlFT1sS6UaInxKAWS8UcRErdt1woY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASRCdTAKKch+E7XCC7bsQieyskqw47LPcLdo8pfuARd4NZpvsrrgEfIWt+Y3zG5JH9yC5VWREtcmLogInh93DnwERV0BKQAjSHsYrbEtRHbaU27xlRFbQM6XHOlvG5Nw3HJmghwKFYg1dAqoLUVu9wE41Kqd6XzuRMs+23d6ilXaKTxDcTuMXXlr6R7zyndQ64KpckAUlxgjQJ000Qs+G92O7fVqyhALck7i+V9iGGDx57x+EDVUXWdCR/vMorCd60dxUuhtdLeO0G/1eLSi82nDsy2/bIUtUo+HFofMa7q24EUMRqZKtMMahpGZHe8MlYtiKeqrzgvkCS1FL1rZWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@foss.arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=foss.arm.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=foss.arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@foss.arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBxMG3DN1z3blV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 01:43:06 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BB3F27B5;
	Tue, 11 Mar 2025 07:42:46 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61E293F694;
	Tue, 11 Mar 2025 07:42:31 -0700 (PDT)
Date: Tue, 11 Mar 2025 14:42:28 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<pierre.gondois@arm.com>, <dietmar.eggemann@arm.com>,
	<linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>, <sshegde@linux.ibm.com>
Subject: Re: [PATCH v12 3/4] arm64: topology: Support SMT control on ACPI
 based system
Message-ID: <Z9BL1DgDlcYKVaDu@bogus>
References: <20250311075143.61078-1-yangyicong@huawei.com>
 <20250311075143.61078-4-yangyicong@huawei.com>
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
In-Reply-To: <20250311075143.61078-4-yangyicong@huawei.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Mar 11, 2025 at 03:51:42PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> For ACPI we'll build the topology from PPTT and we cannot directly
> get the SMT number of each core. Instead using a temporary xarray
> to record the heterogeneous information (from ACPI_PPTT_ACPI_IDENTICAL)
> and SMT information of the first core in its heterogeneous CPU cluster
> when building the topology. Then we can know the largest SMT number
> in the system. If a homogeneous system's using ACPI 6.2 or later,
> all the CPUs should be under the root node of PPTT. There'll be
> only one entry in the xarray and all the CPUs in the system will
> be assumed identical.
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
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542

Ditto, just path please.

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep

