Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AD937D444
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 22:36:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgRQN0MpGz308L
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 06:36:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jBTVeyrJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jBTVeyrJ; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgRPv0JGYz2xZN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 06:35:45 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id 76so23575679qkn.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 13:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OtfJJXdm91OIA7pO2o1aqx3igQIsCMyaLw8mGH6YxOk=;
 b=jBTVeyrJcI/7rjD9HMPWAY8wd3Mh+4Ovi1bS09ZpAKMHghrFnvo10hAO9fDUFeZDe9
 Dz7FVTYs+e4NqRj7v6nIYHjy2XFoocEFfsB6veIVghG2n5FdlUXMy8cUB5tnSfTVqF9q
 +gHRBUbKwF8KfOiFvP//Ukp0dGttziKELqsPjt6yoVEjZwC28rM+Jl6zLAAcSflG+XkA
 2bs4tqdq8qogmiQFSLktemUaNyg4JHX8cG9lf69YcYjoiDk3EnhiQ0YugQBEy36bs/Ui
 jUHWYQzXTUMAUKrTEiyLBH5a7px/X3+8hiS4Bx4fajWnmdZX/gO3xaKo/eQkNXJKZtgI
 QNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OtfJJXdm91OIA7pO2o1aqx3igQIsCMyaLw8mGH6YxOk=;
 b=kl9eD0seoHHrxal+Ue9CgAYfPLvktyWRcTaWr9+tLonXVk2KLmT+JACNB2yVVRmGSq
 gliOmbe4+GoDGzn6UwyE4buzeaopM1Y60kfNKpiCJ4hGMET4XC77g+94durDhks5bRaw
 KH1De+iSS7qngI7LOs9Ha32JOw5ACM0a2Hyg1V1Zi8F2ugFJ2l1dqh7r/uC1XhAcqjQD
 5M2YuW85WuZTNe7spsmT3VnCp14mZywOyoAAFNByY40/vk9QCk3NrQIUcmhgAtwXJSdq
 GH4Z9QaIoAB9Q6hXbs2TBcxHWdAe/OjUtRQv3DTWoqmXnHiZXproDQUVgsIkYfprpluv
 TlUw==
X-Gm-Message-State: AOAM5338UO8UPsgMbbauuGTAb+MfQmk5mqakIU1ea5jVtSXSUvJniGQE
 8IFYUvWmcWVshjgofGdi/voSFX/jK7xWrA==
X-Google-Smtp-Source: ABdhPJysljzx3A/nrPX6/sX/Mo3uGePURJb6VpTMx6aFTUJSsV9L5d6fdbtnzgZePqZyts8rXSBN3g==
X-Received: by 2002:a37:9f4c:: with SMTP id i73mr35171476qke.165.1620851742299; 
 Wed, 12 May 2021 13:35:42 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:fb9a:a1c9:c5a3:1e98:bc69?
 ([2804:431:c7c6:fb9a:a1c9:c5a3:1e98:bc69])
 by smtp.gmail.com with ESMTPSA id l6sm851586qkk.130.2021.05.12.13.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 13:35:41 -0700 (PDT)
Subject: Re: [PATCH 2/3] hotplug-memory.c: enhance dlpar_memory_remove* LMB
 checks
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210430120917.217951-1-danielhb413@gmail.com>
 <20210430120917.217951-3-danielhb413@gmail.com> <YJCdNJRSLCOV59dE@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <c735c4ad-7477-b07a-e84b-86eccd8d9978@gmail.com>
Date: Wed, 12 May 2021 17:35:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJCdNJRSLCOV59dE@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 5/3/21 10:02 PM, David Gibson wrote:
> On Fri, Apr 30, 2021 at 09:09:16AM -0300, Daniel Henrique Barboza wrote:
>> dlpar_memory_remove_by_ic() validates the amount of LMBs to be removed
>> by checking !DRCONF_MEM_RESERVED, and in the following loop before
>> dlpar_remove_lmb() a check for DRCONF_MEM_ASSIGNED is made before
>> removing it. This means that a LMB that is both !DRCONF_MEM_RESERVED and
>> !DRCONF_MEM_ASSIGNED will be counted as valid, but then not being
>> removed.  The function will end up not removing all 'lmbs_to_remove'
>> LMBs while also not reporting any errors.
>>
>> Comparing it to dlpar_memory_remove_by_count(), the validation is done
>> via lmb_is_removable(), which checks for DRCONF_MEM_ASSIGNED and fadump
>> constraints. No additional check is made afterwards, and
>> DRCONF_MEM_RESERVED is never checked before dlpar_remove_lmb(). The
>> function doesn't have the same 'check A for validation, then B for
>> removal' issue as remove_by_ic(), but it's not checking if the LMB is
>> reserved.
>>
>> There is no reason for these functions to validate the same operation in
>> two different manners.
> 
> Actually, I think there is: remove_by_ic() is handling a request to
> remove a specific range of LMBs.  If any are reserved, they can't be
> removed and so this needs to fail.  But if they are !ASSIGNED, that
> essentially means they're *already* removed (or never added), so
> "removing" them is, correctly, a no-op.
> 
> remove_by_count(), in contrast, is being asked to remove a fixed
> number of LMBs from wherever they can be found, and for that it needs
> to find LMBs that haven't already been removed.
> 
> Basically remove_by_ic() is an absolute request: "make this set of
> LMBs be not-plugged", whereas remove_by_count() is a relative request
> "make N less LMBs be plugged".
> 
> 
> So I think remove_by_ic()s existing handling is correct.  I'm less
> sure if remove_by_count() ignoring RESERVED is correct - I couldn't
> quickly find under what circumstances RESERVED gets set.

RESERVED is never set by the kernel. It is written in the DT by the
firmware/hypervisor and the kernel just checks its value. QEMU sets it in
spapr_dt_dynamic_memory() with the following comment:


             /*
              * LMB information for RMA, boot time RAM and gap b/n RAM and
              * device memory region -- all these are marked as reserved
              * and as having no valid DRC.
              */
             dynamic_memory[0] = cpu_to_be32(addr >> 32);
             dynamic_memory[1] = cpu_to_be32(addr & 0xffffffff);
             dynamic_memory[2] = cpu_to_be32(0);
             dynamic_memory[3] = cpu_to_be32(0); /* reserved */
             dynamic_memory[4] = cpu_to_be32(-1);
             dynamic_memory[5] = cpu_to_be32(SPAPR_LMB_FLAGS_RESERVED |
                                             SPAPR_LMB_FLAGS_DRC_INVALID);


The flag is formally described in LOPAR section 4.2.8, "Reserved Memory":

"Memory nodes marked with the special value of the “status” property of
“reserved” is not to be used or altered by the base OS."


This makes me confident that we should check DRCONF_MEM_RESERVED in
remove_by_count() as well, since phyp needs do adhere to these semantics and
shouldn't be able to remove a LMB marked as RESERVED.



Thanks,



Daniel




> 
> 
>> This patch addresses that by changing
>> lmb_is_removable() to also check for DRCONF_MEM_RESERVED to tell if a
>> lmb is removable, making dlpar_memory_remove_by_count() take the
>> reservation state into account when counting the LMBs.
>> lmb_is_removable() is then used in the validation step of
>> dlpar_memory_remove_by_ic(), which is already checking for both states
>> but in different stages, to avoid counting a LMB that is not assigned as
>> eligible for removal. We can then skip the check before
>> dlpar_remove_lmb() since we're validating all LMBs beforehand.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   arch/powerpc/platforms/pseries/hotplug-memory.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
>> index bb98574a84a2..4e6d162c3f1a 100644
>> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
>> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
>> @@ -348,7 +348,8 @@ static int pseries_remove_mem_node(struct device_node *np)
>>   
>>   static bool lmb_is_removable(struct drmem_lmb *lmb)
>>   {
>> -	if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
>> +	if ((lmb->flags & DRCONF_MEM_RESERVED) ||
>> +		!(lmb->flags & DRCONF_MEM_ASSIGNED))
>>   		return false;
>>   
>>   #ifdef CONFIG_FA_DUMP
>> @@ -523,7 +524,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>>   
>>   	/* Validate that there are enough LMBs to satisfy the request */
>>   	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
>> -		if (lmb->flags & DRCONF_MEM_RESERVED)
>> +		if (!lmb_is_removable(lmb))
>>   			break;
>>   
>>   		lmbs_available++;
>> @@ -533,9 +534,6 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>>   		return -EINVAL;
>>   
>>   	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
>> -		if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
>> -			continue;
>> -
>>   		rc = dlpar_remove_lmb(lmb);
>>   		if (rc)
>>   			break;
> 
