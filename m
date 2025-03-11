Return-Path: <linuxppc-dev+bounces-6896-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44017A5C41D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Mar 2025 15:42:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBxLf6dyQz3brc;
	Wed, 12 Mar 2025 01:42:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741704154;
	cv=none; b=Gv+FVKvN5Yd3Ra54bDkjCjNM+7ll6LQYYmPD/UwDyKplZAAoaon7AScka38FILiB+YBN6wtBHZQ9aS6UEcMLciP9BBvXbepqe8OS0SUnWOW5dizqpCnxWJqtMYkhP5B3A2umCYCj3IeanDnRySEM1Etbp+uHt6UuJ/oDzRRRj+lNphqb5ycO68jzRu9SaRj99KWgGbb0jdeJxdx1c6FgBbAM9IJGw0rwxYt0oBYAP5Bd76uX1xbB87nFiL+vEz5tXHshMsOLpMpwrzuk9S6mYk4XBba77zG86kjy15/hOasZy667EkEzbLW51YEeXX1TGZnjhuNwc/FOA210iEXiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741704154; c=relaxed/relaxed;
	bh=+DTvzNieviq6Zp2Xvtg+AxJ9ON3jIGFsmH8X6J9S20Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buxDH6qzMY0Fx13aMVFTCLET+9Ft5OOwK4Fr/mV1XIobJhl0IV1iU4pELDvsbGL1Fp6pxwToc96YSjYD2gUnYDp3QD64YFxxOMwjUeYYL4OoIyIJN7AW5S0PajIryJQ12bFRdgtuioV5BEPuMWbs9OCF13m/wwFyUWzkM2cdwMCyfqNptIoVbC5D1DJirBBX7mLTayhontHsMpwTM1N4SnIhI3y0eGNw6hy8NJP83NZPy9l0I7QRN9E6z9p3MH5Dp4VhAgeAhqMbwgUuL0+eltUFlCTZJvIrHK4DykacqUOY48q4OD2+in+WXn2Kez0TUeqzkRIZxFkWXJmvryrnFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@foss.arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=foss.arm.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=foss.arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=sudeep.holla@foss.arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBxLf2Bw3z3blV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 01:42:34 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71E6B271B;
	Tue, 11 Mar 2025 07:42:14 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 479853F694;
	Tue, 11 Mar 2025 07:41:59 -0700 (PDT)
Date: Tue, 11 Mar 2025 14:41:56 +0000
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
Subject: Re: [PATCH v12 4/4] arm64: Kconfig: Enable HOTPLUG_SMT
Message-ID: <Z9BLtGYyQ3CqkX5Z@bogus>
References: <20250311075143.61078-1-yangyicong@huawei.com>
 <20250311075143.61078-5-yangyicong@huawei.com>
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
In-Reply-To: <20250311075143.61078-5-yangyicong@huawei.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Mar 11, 2025 at 03:51:43PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Enable HOTPLUG_SMT for SMT control.
> 

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

