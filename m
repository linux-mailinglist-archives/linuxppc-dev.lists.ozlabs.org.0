Return-Path: <linuxppc-dev+bounces-6895-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81175A5C41B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 15:42:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBxLL1V2Fz3brm;
	Wed, 12 Mar 2025 01:42:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741704138;
	cv=none; b=LqGr5UKmA54trZoX5LBVpIok4pqM66RAhxON1Us1flKIH8n8ny5cC94jFwFrU8FLXtOZ1W2i1yI45ytBwEA6luWEjVmMRiWbY1P2vLVE2z2Ls29niw5OudQPhJaHi0H/MsgK7pOX+nasFxMIhElDwPgmRAOsjzuCAVbtZ1agYyKntgnaa/QK9jctBM4Izby3N7/1bKcXJ1Fyt413UjGfNBVTdiIpXwuP2ur8/EC+NA2mJBSxnX1w9MlCt24Ks8cHJiQIo6U2rA/P2B0zMlNOY50IoZQ9NNYC8xlxoRN5CCSPuFrKaxBVdX/wXrXOB7/PNxmFsYFdA16DjnlRfiX5zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741704138; c=relaxed/relaxed;
	bh=9sGCh5e4a8Av+BTXu+TbisFIn3CL2BaF8ghukzBXizQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBGG1FoUIn9gdyyk5csf29ZJHyrSbRR/vC28eGbtBvD/j05pjA5x/AEa8vV3FsgIWOwXGVulBTMo8uwe12PNfn29W8PuwjwvIcFT70dHrcto0VUjHrEgh0DMMDg/hmEu71czGa8sI/edO4gh5gm6K2n3M4pZa5RPcbgX9eKkElYaNvRr9/Y+T/GZc6MSfOOEtDwTJIFS+dgjzzykq8NQuY/wxsSHEz6vqkMAI+YqSAjpLIkN+V6cZG5QnMZDpqW/BBDFEc9uYJ2Cy765P6oV7Ys3E7dEBf6zylMKTGJKXcB9YHRJsZk8fWb6KjMDkNREQrCd1uNEG3dUxVPCodp2Fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@foss.arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=foss.arm.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=foss.arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@foss.arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBxLK4KMcz3blV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 01:42:17 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE9EE1762;
	Tue, 11 Mar 2025 07:41:57 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5C703F694;
	Tue, 11 Mar 2025 07:41:42 -0700 (PDT)
Date: Tue, 11 Mar 2025 14:41:39 +0000
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
Subject: Re: [PATCH v12 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
Message-ID: <Z9BLo0rDthj2NwFu@bogus>
References: <20250311075143.61078-1-yangyicong@huawei.com>
 <20250311075143.61078-2-yangyicong@huawei.com>
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
In-Reply-To: <20250311075143.61078-2-yangyicong@huawei.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Mar 11, 2025 at 03:51:40PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Currently if architectures want to support HOTPLUG_SMT they need to
> provide a topology_is_primary_thread() telling the framework which
> thread in the SMT cannot offline. However arm64 doesn't have a
> restriction on which thread in the SMT cannot offline, a simplest
> choice is that just make 1st thread as the "primary" thread. So
> just make this as the default implementation in the framework and
> let architectures like x86 that have special primary thread to
> override this function (which they've already done).
> 
> There's no need to provide a stub function if !CONFIG_SMP or
> !CONFIG_HOTPLUG_SMT. In such case the testing CPU is already
> the 1st CPU in the SMT so it's always the primary thread.
>

LGTM:

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

> +	 * enabled/active. Architectures do have a special primary thread

If you respin

^^ s/do/that/ or s/do/that do/

-- 
Regards,
Sudeep

