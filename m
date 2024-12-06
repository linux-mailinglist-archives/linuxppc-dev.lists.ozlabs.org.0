Return-Path: <linuxppc-dev+bounces-3846-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C865E9E7A4A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2024 21:58:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y4kBj1Vcrz2ywC;
	Sat,  7 Dec 2024 07:58:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733518733;
	cv=none; b=JY60KTEfhwFS14dQSTMgYlMCACI8D06R2fn0mud6bGKT9Fl8rtE674aP7crAvJN6t3hx5Nep08IGy938KYEBoyrvSbeLXGRbkGjphY/Eny+EQMJXCgFajJ/9zvAJqcZN7Fbwc1RZALUHt5ZmeDTQ6+xA2SdJ1Fw47Ti2yLTyV8FwBznwbMS0O6/IUcvGRdMcFqo9JT+4/SFmCyNuRIICLI+d6p/JIldfXc52tMP66vLuySTl5knOyhtRprSbgWZTXa4Rr0v2PpEI2pSfIrPRdb27+FfJg8NUjRMYwWGH4kXNOxSGSk866FNyNgOO+ASCD8J2FUnXopQ4l9jQDrTBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733518733; c=relaxed/relaxed;
	bh=M9PuEUd7fHK0twjnpmT4sQ2WiGKSyXN5nPrU+06sRxI=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kt4MvkPI0ojMeYcr0kTI1OtuF0OLTJjivY9EgyyEU1yQKXdKCflGp3U2T5CpLmDzcalUqHaJ35JbnDTO5Wz96nn0e3KtqEJth6A+40nn3yKTO9mCcPWsa4kTPDmkg8jxO10wtnDs3/01ObDbxDN2XjVUex+MggzHXWSNidcYht6KJoY4lZbsVcvMAckzGtNRoKoIClzy0PKObO7PaXV/Nzol2O6nf0nyTwChq/PP51BAFIMdWLB+A/bpLkVfBkDxSyX/U1Asq36XV3D7uIey+5Z6CuaSTqHBMyq6LaXkL+tuazBgxfXlyfNhpIkqHEQf7cVhMedBBYCMHjaQtXvFfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=opdIpAAC; dkim-atps=neutral; spf=pass (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=opdIpAAC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y4kBg3pqhz2xjM
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2024 07:58:51 +1100 (AEDT)
Received: from [100.65.128.154] (unknown [20.236.11.102])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8B63620ACD7A;
	Fri,  6 Dec 2024 12:58:18 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8B63620ACD7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1733518699;
	bh=M9PuEUd7fHK0twjnpmT4sQ2WiGKSyXN5nPrU+06sRxI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=opdIpAACnQeStJ33oACe6p52ZM8f0Sws7Fv8oVZEtnJ34oxYkj2Ifncn0UBE7+8VM
	 /Rer5IHWNKL+Om4cBhthsawIs+kQdevr3ykVw21CBvfVnNLhAZ1lcWLQbVr0aJDoH2
	 0Lv+tHrW7mbf2ysXMzyMfTT7x/zNVB+cEVkkvmJU=
Message-ID: <dab77729-682f-4182-9fb2-cd522ac29b5f@linux.microsoft.com>
Date: Fri, 6 Dec 2024 12:58:17 -0800
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
Cc: eahariha@linux.microsoft.com, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 etnaviv@lists.freedesktop.org, oss-drivers@corigine.com,
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH v2 00/21] Converge on using secs_to_jiffies()
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <b9fcb12a-b7a4-4c33-836e-67109ce07deb@intel.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <b9fcb12a-b7a4-4c33-836e-67109ce07deb@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 11/29/2024 4:57 AM, Przemek Kitszel wrote:
> 
> [removed most non-list recipients, it's just too much]
> 
> On 11/15/24 10:26 PM, Easwar Hariharan wrote:
<snip>
>>
>> ---
>> Changes in v2:
>> - EDITME: describe what is new in this series revision.
>> - EDITME: use bulletpoints and terse descriptions.
>> - Link to v1: https://lore.kernel.org/r/20241115-converge-secs-to-
>> jiffies-v1-0-19aadc34941b@linux.microsoft.com
> 
> that is not a proper changelog, you were supposed to edit those
> placeholder entries; please look around for examples
> 
> There is also just too much recipients. Please split up your patches
> into smaller pieces. You will also learn the process on a smaller
> sample.
> 
> And definitively please wait for 48h before reposting such big series.

Yes, sorry, I sent out a v2 in a moment of panic on including the
already accepted patch in v1. I failed to edit the changelog in that
same panic. I'll try to not panic and do better in the future.

> 
> Regarding code - you could also convert msecs_to_jiffies(const * HZ),
> there are 10 that are greppable.
> 

Those seem to be mistakes. const*HZ is a seconds-denominated timeout,
being passed to msecs_to_jiffies() which will treat it as a
millisecond-denominated timeout resulting in an excessively long
timeout. I suppose that's better than a too-short timeout, and
apparently it's been working fine all along since hardware responds
before the too-long timeout expires. Half of them are in
drivers/scsi/arcmsr/arcmsr_hba.c and the pattern has apparently been
there since 2010.

Thanks,
Easwar

