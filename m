Return-Path: <linuxppc-dev+bounces-3458-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3AF9D542F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2024 21:45:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvVcZ4Hkmz2yng;
	Fri, 22 Nov 2024 07:45:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732221950;
	cv=none; b=cxP07VJ2JXd6at/ImBRkxNLpE3gv/8M0gZaMNKTi8bdhIvvEHafALW2It3PjynATNH4NHIz9kUhBr3n6dppm7F6SG1rLrNGdo3RTf3WXixrTJ42Rh0fOkMb3NxxRgWawLeSem5wAtz1VZ9v4VYJwyUpamw+woZdJKXSiWMCyZvZxcf+XeWUUMN6W28KuxbfuUHpX6T5vo83uM0ApmBxTggLc8FfxaIQW8iXBU4ACAm/eQb9iY9URyiVazmRb97DAOBI5G4AUJM1cRuSorKWKMc2hVyLStgB5CWb78MzUZlbxNMVgJtZe4CxXSD7RPF1xTOUnHewup/ptazBfW9eV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732221950; c=relaxed/relaxed;
	bh=VtSRjuJwza2RH5ehpU7qNEh2YcxlKoG/hB48tQGalvQ=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=RBfcyPxzxxr3IHgRGgbdTShTirQ6h/Fv6Ie6YSZHlgCjUtm4w/anUMxh8AqBCmNFy/091faFgerPCwObH+2tO0zzeZ4DDJDPdwwcGHvviQ06yDO/fQ5rKWqKfzJCaYR2RQqby3KpYfCloQwAeTgEn/pr9n8VJFN4cZ5jPth5hMIfSdAN173r33u7wbEcQ6rlGMeZoyBNIDlxoxDOUFslH9ylCNHhd/b15fICkwbmZ1Fz8rSUE+BWyEmKq9jyFTPbKQiYgCCfEtiLYYe+Oz5T2HDFMFcbj8eH8kr8HLeptUxN6P/0WcC2H6Yo9hy9oEthDjOWY6ZH3j0ckvKP+WYNqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P0Dcnjeo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P0Dcnjeo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvVcX50H6z2yhG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 07:45:47 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-724e113c821so679b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2024 12:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732221945; x=1732826745; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VtSRjuJwza2RH5ehpU7qNEh2YcxlKoG/hB48tQGalvQ=;
        b=P0DcnjeoaY7lovRk29uBFeLk4s4SNOVAy1OFil/hf1/Ck/RZT+Gyawk00SsDQo29on
         LEiokBFrUSNriXcb4zbTkvO8tEyk1ihDFPNi3BHvls/XLJ0OA1V7WstqEF9+Tjno7i6T
         +t+NpGNunyuabXKCN5NsTOHH4qrpqhs0vc1hFvI5MedaJe71L73DP5BojWL2EyTpqP8O
         WpQZLttAM304HGgFrVw459F9pqtIVKjgPLprSQk+6h2K5Ci2rcmW100lu4TzenbrWWfE
         Qw9ry6uDnFclofWfhlzDVW4lqtJBQc+cW1HcThhdbKfjhatLqrFcCuHD8EhSOsuuwMnV
         HYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732221945; x=1732826745;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VtSRjuJwza2RH5ehpU7qNEh2YcxlKoG/hB48tQGalvQ=;
        b=GAmKGyaRwaNF7C/rrwDzBoLnUf2Gry4PLqZkto/kTDkpyTbNvvBjXudmR063HfuAI5
         gU0kl5CNrp+bQe8+2VUZoncdeE+g559JGlOUBnklf3ShQDL/xHqAP3jFZK1ZMLligYqZ
         0gchsY6gJcgywS1rbf1Y3YJWnuBiFxgCHwYZWaUCQTFbepqSDGvjllqI2lLVPt4vjR9O
         fpyOQWO3IYIwxyQLHiY3QNIUJLGaarwFAdUqDocJkWZSn6wZyQ5xUOqEPGS6AWgX8czC
         eQTymTiozwQs5dIzidZsyvromG80NgtzC111AiBFBgzGSaQ5+L+JHCCsls0Rlr8uBagO
         EAHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq88UanvCvkkqv3swDWuS+p9Z111TA7sLZKscd3fyibg2rwn3ybw7AptKLCXqvR4hze7keOl7FLwQ6mD8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzhxLR1fKLRNGDEKaHNz9PT9YSiMEMHFJxnuARCaB5SDHMce6Mc
	FJeOkZCkq3SeeT0wrN+kUPjKbkmm5ah8vqHuxvM4rDiXqi72X8cP
X-Gm-Gg: ASbGncsoo7YFoZvmk5sBIiDjKSTxomEFYTGxrrjKv0YrlIyqHj7gAhYzQLnKUzU6+D0
	YLlZ1qy8EwMRR188/N+V8j4tZKSRVJgkS8SviOAkTu5FnnqLglUbi6vLwXORMdovhWlEvC1icGe
	YwOY4WdwqsAOqY2yJjX9NAWiv6qhRoO948HuOY3N8ZGJi1NgugJh9ZUHBi0FaljuAhhcPff5uE/
	0r2JMMYvv+J9c15X6wdp+dnsXdf9zHgXYVjnMphcJA=
X-Google-Smtp-Source: AGHT+IGezdLw8pd5bAJJH2FxWUd5eSOKARsWYuo+GBjewBEIPtsbxv5xI7Rxnto/ZjiKV3i5xG02Gw==
X-Received: by 2002:a05:6a00:1388:b0:71d:eb7d:20d5 with SMTP id d2e1a72fcca58-724df5eed0cmr750905b3a.8.1732221944478;
        Thu, 21 Nov 2024 12:45:44 -0800 (PST)
Received: from dw-tp ([171.76.85.142])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de532d27sm186502b3a.118.2024.11.21.12.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 12:45:43 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, Narayana Murty N <nnmlinux@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, linux-kernel@vger.kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, npiggin@gmail.com, christophe.leroy@csgroup.eu, maddy@linux.ibm.com, naveen@kernel.org, ganeshgr@linux.ibm.com, sbhat@linux.ibm.com
Subject: Re: [PATCH] powerpc/pseries/eeh: Fix get PE state translation
In-Reply-To: <87cyiq3px0.fsf@vajain21.in.ibm.com>
Date: Fri, 22 Nov 2024 01:26:56 +0530
Message-ID: <87zflswebb.fsf@gmail.com>
References: <20241107042027.338065-1-nnmlinux@linux.ibm.com> <87ttc8d0vf.fsf@gmail.com> <87cyiq3px0.fsf@vajain21.in.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> Hi Ritesh,
>
> Thanks for looking into this patch. My responses on behalf of Narayana
> below:
>
> "Ritesh Harjani (IBM)" <ritesh.list@gmail.com> writes:
>
>> Narayana Murty N <nnmlinux@linux.ibm.com> writes:
>>
>>> The PE Reset State "0" obtained from RTAS calls
>>> ibm_read_slot_reset_[state|state2] indicates that
>>> the Reset is deactivated and the PE is not in the MMIO
>>> Stopped or DMA Stopped state.
>>>
>>> With PE Reset State "0", the MMIO and DMA is allowed for
>>> the PE.
>>
>> Looking at the PAPR spec - I do agree that it states the same. i.e.
>> The "0" Initial PE state means the "Not Reset", "Load/Store allowed" &
>> "DMA allowed" (Normal Operations). 
>>
>>> The function pseries_eeh_get_state() is currently
>>> not indicating that to the caller because of  which the
>>> drivers are unable to resume the MMIO and DMA activity.
>>
>> It's new to me, but could you help explain the user visible effect
>> of what gets broken. Since this looks like pseries_eeh_get_state() has
>> always been like this when it got first implemented.
>> Is there also a unit test somewhere which you are testing?
> Without this patch a userspace process performing VFIO EEH-Recovery wont
> get the correct indication that EEH recovery is completed. Test code at
> [2] has an example test case that uses VFIO to inject an EEH error on to
> a pci-device and then waits on it to reach 'EEH_PE_STATE_NORMAL' state
> . That state is never reached without this patch.
>
> [2] :
> https://github.com/nnmwebmin/vfio-ppc-tests/commit/006d8fdc41a4
>

Right. Thanks for helping with that test code. It's much clearer now. So
after the error inject and/or the PE hot reset, the PE is never reaching
it's normal state. That is due to this kernel bug in the pseries EEH
handling, where it fails to advertise the MMIO & DMA enabled capability
flag back to the caller. This therefore can cause the userspace VFIO
driver to incorrectly assume that MMIO/DMA operations cannot be done. 

>>
>> IIUC eeh_pe_get_state() was implemented[1] for supporting EEH for VFIO PCI
>> devices. i.e. the VFIO_EEH_PE_GET_STATE operation of VFIO EEH PE ioctl op
>> uses pseries_eeh_get_state() helper to query PE state on pseries LPAR.
>> So are you suggesting that EEH functionality for VFIO PCI device was
>> never enabled/tested before on pseries?
> VFIO-EEH had been broken for pseries for a quite some time and was
> recently fixed in kernel. So this issue was probably not discovered
> until recently when we started testing with userspace VFIO.
>

ohk right, then maybe we might have started testing it after the eeh
error inject op was implemented for pseries here [1].

[1]: https://lore.kernel.org/linuxppc-dev/20240909140220.529333-1-nnmlinux@linux.ibm.com/#t

>>
>> [1]: https://lore.kernel.org/all/1402364517-28561-3-git-send-email-gwshan@linux.vnet.ibm.com/
>>
>> Checking the powernv side of implementation I do see that it does
>> enables the EEH_STATE_[MMIO|DMA]_ENABLED flags in the result mask for
>> the callers. So doing the same for pseries eeh get state implementation
>> does look like the right thing to do here IMO.
>>
>>> The patch fixes that by reflecting what is actually allowed.
>>
>> You say this is "fixes" so I am also assuming you are also looking for
>> stable backports of this? If yes - could you please also add the "Fixes"
>> tag and cc stable?
> Yes, agree will re-send adding the fixes tag.
>

Yes and maybe let's also add some more context & information to the
commit message from this discussion.

-ritesh

>>
>> -ritesh
>>
>>>
>>> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
>>> ---
>>>  arch/powerpc/platforms/pseries/eeh_pseries.c | 6 ++++--
>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
>>> index 1893f66371fa..b12ef382fec7 100644
>>> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
>>> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
>>> @@ -580,8 +580,10 @@ static int pseries_eeh_get_state(struct eeh_pe *pe, int *delay)
>>>  
>>>  	switch(rets[0]) {
>>>  	case 0:
>>> -		result = EEH_STATE_MMIO_ACTIVE |
>>> -			 EEH_STATE_DMA_ACTIVE;
>>> +		result = EEH_STATE_MMIO_ACTIVE	|
>>> +			 EEH_STATE_DMA_ACTIVE	|
>>> +			 EEH_STATE_MMIO_ENABLED	|
>>> +			 EEH_STATE_DMA_ENABLED;
>>>  		break;
>>>  	case 1:
>>>  		result = EEH_STATE_RESET_ACTIVE |
>>> -- 
>>> 2.45.2
>>
>
> -- 
> Cheers
> ~ Vaibhav

