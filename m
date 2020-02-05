Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A752153322
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 15:36:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CPJ60bd1zDqCs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 01:36:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=ndfont@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dY3pxJvI; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CPFS3BLMzDqCp
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 01:33:46 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id h9so2057853otj.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Feb 2020 06:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a2Q+FJJ7ymzq1vpGgV7nlcxJJEeDcXgTcSuun2ahR3E=;
 b=dY3pxJvID6PLcV83rCPo28gm7GHN2YwlG9xrPqmyMSuFgvc3NLlLykZMCsM8jGbpLJ
 2nUSXqHjCfPticf1Ouuch3siGfCW9d2R1hftHLXQrirh8PW4V1MAGhy+XiV3orr5hy5e
 STSNinpP5wR3wE3otHFW1enNLMrXOv3jGHFReBD0xq0zRXMw3m6UO8BqgirsvOy8ajfn
 JzmhY11rg74Z8Fq/PChhoYF/W5WJyfumAyudYtHKtKr0dsBpXueicdoaQlSboii4z7Lv
 xqJOrooZqbc8kMTVwR8YMKdba8dvf/GialehxZAajunNc1cyG1Nab6FKV0VHy+dZ+MV8
 XM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a2Q+FJJ7ymzq1vpGgV7nlcxJJEeDcXgTcSuun2ahR3E=;
 b=VGnrVhWSLLSawloDZjkHJq6DJStcKCVDLiJF0IoIH1DwzgJ/kKMH7+a0vuO+/dy4qi
 tZ6laegNOlItFvamqwU3tCFnGS6p4AzoMV0Q7q/ocrD75HwRYL/98r3iVRKLVfhdMi3u
 Zyn93WVmcgHEQ8qMx9dei5h04v610C/Zdnufkisbd9csQyXU9wOKFZUJG0Xs3uzUiGFF
 DyYFdjfOOpLzzbAtNcy9MQZc0IwKf2H3Or17r8kQR/PQNEhg0mB6vZsdLqLZGyVznHxb
 f4tmMw0OSy7qvp4KGDyey2x8JlmUameS150KngPFGUGkRxe9SIkLxxz1UjyDEw9mEY6b
 RXYg==
X-Gm-Message-State: APjAAAXFRN71A3MdLKwgF0mwlXHYgrInTwXKFFXr1jm8pBtVpmoIRbLA
 zzVxJsTKmlwzJVZBcmbtZw==
X-Google-Smtp-Source: APXvYqzxVnLjQYctWfjtUnn4bSqM/ku6JsnRwW3/SfU1UZn46nnAsfDbo0KLkuaDg+9BpOjdzSqFag==
X-Received: by 2002:a05:6830:155a:: with SMTP id
 l26mr26380657otp.339.1580913223228; 
 Wed, 05 Feb 2020 06:33:43 -0800 (PST)
Received: from [172.31.9.147] (ausvpn.amd.com. [165.204.77.11])
 by smtp.gmail.com with ESMTPSA id j45sm8895622ota.59.2020.02.05.06.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 06:33:42 -0800 (PST)
Subject: Re: [PATCH] powerpc/drmem: cache LMBs in xarray to accelerate lookup
To: Scott Cheloha <cheloha@linux.ibm.com>, Nathan Lynch <nathanl@linux.ibm.com>
References: <20200128221113.17158-1-cheloha@linux.ibm.com>
 <87pnf3i188.fsf@linux.ibm.com>
 <20200129181013.lz6q5lpntnhwclqi@rascal.austin.ibm.com>
 <4dfb2f93-7af8-8c5f-854c-22afead18a8c@gmail.com>
 <20200203201346.deqkxwgfmkifeb5s@rascal.austin.ibm.com>
From: "Fontenot, Nathan" <ndfont@gmail.com>
Message-ID: <081c4f0e-5d7a-93c1-2075-608790f8e35f@gmail.com>
Date: Wed, 5 Feb 2020 08:33:40 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203201346.deqkxwgfmkifeb5s@rascal.austin.ibm.com>
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/3/2020 2:13 PM, Scott Cheloha wrote:
> On Thu, Jan 30, 2020 at 10:09:32AM -0600, Fontenot, Nathan wrote:
>> On 1/29/2020 12:10 PM, Scott Cheloha wrote:
>>> On Tue, Jan 28, 2020 at 05:56:55PM -0600, Nathan Lynch wrote:
>>>> Scott Cheloha <cheloha@linux.ibm.com> writes:
>>>>> LMB lookup is currently an O(n) linear search.  This scales poorly when
>>>>> there are many LMBs.
>>>>>
>>>>> If we cache each LMB by both its base address and its DRC index
>>>>> in an xarray we can cut lookups to O(log n), greatly accelerating
>>>>> drmem initialization and memory hotplug.
>>>>>
>>>>> This patch introduces two xarrays of of LMBs and fills them during
>>>>> drmem initialization.  The patch also adds two interfaces for LMB
>>>>> lookup.
>>>>
>>>> Good but can you replace the array of LMBs altogether
>>>> (drmem_info->lmbs)? xarray allows iteration over the members if needed.
>>>
>>> I don't think we can without potentially changing the current behavior.
>>>
>>> The current behavior in dlpar_memory_{add,remove}_by_ic() is to advance
>>> linearly through the array from the LMB with the matching DRC index.
>>>
>>> Iteration through the xarray via xa_for_each_start() will return LMBs
>>> indexed with monotonically increasing DRC indices.> 
>>> Are they equivalent?  Or can we have an LMB with a smaller DRC index
>>> appear at a greater offset in the array?
>>>
>>> If the following condition is possible:
>>>
>>> 	drmem_info->lmbs[i].drc_index > drmem_info->lmbs[j].drc_index
>>>
>>> where i < j, then we have a possible behavior change because
>>> xa_for_each_start() may not return a contiguous array slice.  It might
>>> "leap backwards" in the array.  Or it might skip over a chunk of LMBs.
>>>
>>
>> The LMB array should have each LMB in monotonically increasing DRC Index
>> value. Note that this is set up based on the DT property but I don't recall
>> ever seeing the DT specify LMBs out of order or not being contiguous.
> 
> Is that ordering guaranteed by the PAPR or some other spec or is that
> just a convention?

From what I remember the PAPR does not specify that DRC indexes are guaranteed
to be contiguous. In past discussions with pHyp developers I had been told that
they always generate contiguous DRC index values but without a specification in
the PAPR that could always break.

-Nathan

> 
> Code like drmem_update_dt_v1() makes me very nervous:
> 
> static int drmem_update_dt_v1(struct device_node *memory,
>                               struct property *prop)
> {
>         struct property *new_prop;
>         struct of_drconf_cell_v1 *dr_cell;
>         struct drmem_lmb *lmb;
>         u32 *p;
> 
>         new_prop = clone_property(prop, prop->length);
>         if (!new_prop)
>                 return -1;
> 
>         p = new_prop->value;
>         *p++ = cpu_to_be32(drmem_info->n_lmbs);
> 
>         dr_cell = (struct of_drconf_cell_v1 *)p;
> 
>         for_each_drmem_lmb(lmb) {
>                 dr_cell->base_addr = cpu_to_be64(lmb->base_addr);
>                 dr_cell->drc_index = cpu_to_be32(lmb->drc_index);
>                 dr_cell->aa_index = cpu_to_be32(lmb->aa_index);
>                 dr_cell->flags = cpu_to_be32(drmem_lmb_flags(lmb));
> 
>                 dr_cell++;
>         }
> 
>         of_update_property(memory, new_prop);
>         return 0;
> }
> 
> If for whatever reason the firmware has a DRC that isn't monotonically
> increasing and we update a firmware property at the wrong offset I have
> no idea what would happen.
> 
> With the array we preserve the order.  Without it we might violate
> some assumption the firmware has made.
> 
