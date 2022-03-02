Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 237124C9A7A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 02:34:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7c9l2frLz3by2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 12:34:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hVDRrGDl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=hbh25y@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hVDRrGDl; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7c924vY7z3bZZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 12:34:12 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id p17so244449plo.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Mar 2022 17:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WvbfaPTFctx/ZBq/LbbOp5Y1TVJ+xSqnWCCTA+Z/BLo=;
 b=hVDRrGDlFebSSqMoxkVgXMfbIhKd7vB31icR6jp+FDN9jEoc3/f+hhT+TfYm+yQ113
 Jao9U9WNhS+eUSrPnCAgyIh2K/n4cE3RCee/HhVr1YAZqW7v4wI9fQO09xsp5BKqAD2x
 VsIh7Jhw6uh0B6Zv8uP635f7wJ4TgE+HGZZaGtuZLe+FWzbQPEBSVdhTgSyaCpR65IJ8
 lM7+mmgMkj1OBNAHJXFgAkl1MtpMJnCX4V0v+lfSCoNKvVPpjfWPkEEj6hO0BbYzn6r8
 In/Ck5es2mK8aZ5AAiOammC+fCQmE346I+zs/Xj406NX2ds9JyBk+vSgx8RvC4bhqesG
 SryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WvbfaPTFctx/ZBq/LbbOp5Y1TVJ+xSqnWCCTA+Z/BLo=;
 b=EllJRDSrBjBrQ9w4Gq5FerTyk7rwBCLs6J+dCEAR8jrd93lmmyn4QhCzCUf5d3J+Q6
 jo9t8M5gmGPHH9HTTtUNE+9t7/bHuqs1k6zUuMKoE2vx37mJCUNmpG0ooLrdUTwYlYbm
 A/3yN26fCpghZqPwarz+ziL8Zyaori64Z3Ej4YFQmVaDP3yhQjLBMZp0ejqeRCfepSE0
 9qO7nrRLvKj5+kIFnHu73et+a35gFtURuVHGVUhBV3TiysVU0Syj80iUZ9z59bDYXN7M
 CmRsZYrhdU57UyFTou3nC/wUsDuj3TaPVFgHKBrSfZNCIkg1V88biFQFimKHMPkJRHQf
 kvCg==
X-Gm-Message-State: AOAM531tn6Q88J5CjYy8CmKaaROBubgKn9Cr+RfFPKZ66Ej5ELHCQLvH
 x2Yi/4GsXU4dBdQdY8aThKCbsQHez2oYiWXZ
X-Google-Smtp-Source: ABdhPJz6zxh10Pr83NPul6JjmZR+Q9CQqGzwlbLF8IduW22KXvc3PsJaORPgaxeL5JcmWfaefjyRfg==
X-Received: by 2002:a17:90b:10b:b0:1bc:6f86:b209 with SMTP id
 p11-20020a17090b010b00b001bc6f86b209mr24660317pjz.33.1646184850280; 
 Tue, 01 Mar 2022 17:34:10 -0800 (PST)
Received: from [10.11.37.162] ([103.84.139.54])
 by smtp.gmail.com with ESMTPSA id
 b187-20020a621bc4000000b004f3c8f3b560sm16963844pfb.129.2022.03.01.17.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 17:34:09 -0800 (PST)
Message-ID: <43e1dba5-2af7-658b-ae45-c7a6c1c0dc6d@gmail.com>
Date: Wed, 2 Mar 2022 09:34:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] powerpc: kernel: fix a refcount leak in format_show()
Content-Language: en-US
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, benh@kernel.crashing.org,
 paulus@samba.org
References: <20220228091103.39749-1-hbh25y@gmail.com>
 <87o82pomrc.fsf@mpe.ellerman.id.au>
 <825f5cba-a62b-a691-225e-22f6bb9b10a8@linux.ibm.com>
From: Hangyu Hua <hbh25y@gmail.com>
In-Reply-To: <825f5cba-a62b-a691-225e-22f6bb9b10a8@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks. I will resubmit my patch latter.

On 2022/3/2 03:50, Tyrel Datwyler wrote:
> On 3/1/22 04:55, Michael Ellerman wrote:
>> Hangyu Hua <hbh25y@gmail.com> writes:
>>> node needs to be dropped when of_property_read_string fails. So an earlier call
>>> to of_node_put is required here.
>>
>> That's true but ...
>>
>>> diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
>>> index a0a78aba2083..cd0fa7028d86 100644
>>> --- a/arch/powerpc/kernel/secvar-sysfs.c
>>> +++ b/arch/powerpc/kernel/secvar-sysfs.c
>>> @@ -30,13 +30,12 @@ static ssize_t format_show(struct kobject *kobj, struct kobj_attribute *attr,
>>>   		return -ENODEV;
>>
>> There's also a reference leak there ^
>>
>> So if you're going to touch this code I'd like you to fix both reference
>> leaks in a single patch please.
>>
>> Having the error cases set rc and then goto "out" which does the
>> of_node_put() is the obvious solution I think.
> 
> update_kobj_size() in the same source file provides a good example of the
> suggested solution.
> 
> -Tyrel
> 
>>
>> cheers
>>
>>>   	rc = of_property_read_string(node, "format", &format);
>>> +	of_node_put(node);
>>>   	if (rc)
>>>   		return rc;
>>>   
>>>   	rc = sprintf(buf, "%s\n", format);
>>>   
>>> -	of_node_put(node);
>>> -
>>>   	return rc;
>>>   }
>>>   
>>> -- 
>>> 2.25.1
> 
