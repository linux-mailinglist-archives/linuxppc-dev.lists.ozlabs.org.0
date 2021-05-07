Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEAC3768E8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 18:36:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcGLJ2ptkz307Y
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 02:36:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=L7g2JwXn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::731;
 helo=mail-qk1-x731.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L7g2JwXn; dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcGKp0Z7tz2yY7
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 02:36:12 +1000 (AEST)
Received: by mail-qk1-x731.google.com with SMTP id i17so9047429qki.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 May 2021 09:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TWAGdP0r3uGNlGPX71wd+bNg8BtYy3jG0dVJnke3u1Q=;
 b=L7g2JwXnRtUQhhmZjWXY8OoqXKIFQpL2h1nqKxzNjDWVcVP2t2rRqrfwo9bXY7PHan
 YZBTH5ZD6DJr2tirsRSedqZ8qyv6CZ2k3AUI7EJS/s3+wwmJwAVJqZzmWq5xssNZulKD
 ZYlzJ4YryyN5UHb4Q8RhSlfz+L6boWqBpp+7bVGM9Yb6sOsIiHN1R7/32+qeqoJvVf1d
 altC6yWnSDuvT2gskFmeBdq6uSTI1NDW9Loy0DD0NJHnb4tfkOLsi2+Fa5DgtYhOb9c8
 aOgLlC9Q0U/GiK7g+qID/0ugIE5uxRNFNMdTwmpvqZGGcfcgL7hO8SXAK6Ty/vIGDfLg
 8MzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TWAGdP0r3uGNlGPX71wd+bNg8BtYy3jG0dVJnke3u1Q=;
 b=laldfzjOeXFenghm2nXH7lNERvXN8igMPENNk4UKyTnZXgYY1vfDIzjaAFoUE9DuG7
 TgpcMtnJVuNBtU3guYVYu+WfDr/0Fgght2huiw5wXP5wPrnuKI2mSDQzHs98RIJfCKXt
 xePUkk6HmDXwqbw6EURHXhokbUmCd/47d0nRvUf4KdLFoHmdG4ai517NYfzcI2MmyCaE
 seYT/lD60v7p/dHk9+CFEhWB3+CyvRzY9C3wWmOgzLaa+Sn1LjPzAck0ci+DvoK4lQwQ
 1Lk5eEnSh+sKgPwIMCcp8+bCKx/fYZOvcz5ZQzz69rmRZWbwlTTGaE5XfbMzL5BONY7e
 vwVw==
X-Gm-Message-State: AOAM533Do2ALFiIJ55KS+DEXM43PE3h/AfLxT1VuxMCd7BZXKbXw9gAS
 dEoFrFQb8x3pP0PMykQaiBfkR7YkTAA=
X-Google-Smtp-Source: ABdhPJztoz0yyHZRRa+aYlo1C2HpFuCOt8CnYVZ13Tp9JrpryuZbHt0cnjHV3yRFJhvV7IqvOzLfWw==
X-Received: by 2002:a37:384:: with SMTP id 126mr10891638qkd.387.1620405369095; 
 Fri, 07 May 2021 09:36:09 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:fb9a:a1c9:c5a3:1e98:bc69?
 ([2804:431:c7c6:fb9a:a1c9:c5a3:1e98:bc69])
 by smtp.gmail.com with ESMTPSA id v22sm671049qtq.77.2021.05.07.09.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 09:36:08 -0700 (PDT)
Subject: Re: [PATCH 2/3] hotplug-memory.c: enhance dlpar_memory_remove* LMB
 checks
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210430120917.217951-1-danielhb413@gmail.com>
 <20210430120917.217951-3-danielhb413@gmail.com> <YJCdNJRSLCOV59dE@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <1491f5c1-593b-4a87-2645-6da76bb7e47a@gmail.com>
Date: Fri, 7 May 2021 13:36:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJCdNJRSLCOV59dE@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

I guess that makes sense. Although I am not aware of any situation, at least
thinking about how QEMU adds/removes LMBs, where some LMBs would be removed
'ad-hoc' in the middle of a LMB range that maps to a QEMU DIMM, I can't say
that this wouldn't never happen either. It is sensible to make remove_by_ic()
resilient to this situation.

I'll re-send this patch just with the remove_by_count() change.


Thanks,


Daniel

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
