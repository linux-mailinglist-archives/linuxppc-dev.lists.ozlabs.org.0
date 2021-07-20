Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E113CF707
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 11:41:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTYdK00Dtz302S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 19:41:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=OQPq3ivH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=OQPq3ivH; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTYcr3l8Tz2yfY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 19:41:13 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id u126so11367262pfb.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 02:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lBTdU8mREWjp6GuuDRHaFg8/8Aywm4XcbbpvuhmOIxI=;
 b=OQPq3ivHPUv0PV3E0QM2yqaQD4NedeMCakKx7MBpzKAlKJmT8YbStiF3T9y0FixuKL
 xU4iUVlLAguySXkO8kgsWzDP7f8Azr3RxK0+KZB0tRAA8cBSDuQzuJapBqEmYyZKoi/q
 JvC2hGQJlh8EUa0PorL2dudpoZQgfYTXyyaVRKkB+J3gd+ajkAskmj1i6fcpwreX+TXb
 RleIwS/fMI6yvAY1X2X/ZLOMwbL7Mg9pmHF9CVJa837enDVh29W2CH9eq+lJZrTrbts0
 tZtWhO588w09ox/PL2pVT7Qw4w1WpxM5e/5iT1vnoXOZwMKUCmf2YfpZwDIXy1T1A0fU
 Y5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lBTdU8mREWjp6GuuDRHaFg8/8Aywm4XcbbpvuhmOIxI=;
 b=AaiO2ib91dhc+UviEeqquId6d3AYWfd1RHmH1WdU7aMqTlp/QsodfHSjd1OKZnlbQX
 CP0G8GtqUoaCNEIZxQQMIyMKd8jU2Xnh9miyP7FfeigMOyxvk+FMgkcMM6pBpAeMUPF2
 BlRhh92IsPY6vLTvrHLyl1N2wRl/drRba0gFYUWftnyZ3M3OdtiO7r/OyWMHGMo3S37j
 Pw27m0ygHyZ6ms7A9OpACIrQrFkRHLeznb5pstjjQRE8iw/gvVo55H9AztQbX5i/8bmS
 ltsz2A0WgOV4NnRzkoBYj62EVy5FfexzQgoHWQ2pcUMC9Otz+HTEuCNNjmMxrPtk0IId
 npSg==
X-Gm-Message-State: AOAM533NvYGIbfaPamIMPoWAqwmhMxoibxLdLif3rMsnyqQqQ7b+P16G
 AXeCftAdgUba72imVl2AdlTJHg==
X-Google-Smtp-Source: ABdhPJzwFMn5nWvbQaylTXslcD5MFqxqoe3hjE59RDXvkdB56AeXlY8I65PRaJL6t1G/soCSfzRAhg==
X-Received: by 2002:a63:5244:: with SMTP id s4mr22843254pgl.267.1626774068971; 
 Tue, 20 Jul 2021 02:41:08 -0700 (PDT)
Received: from [192.168.10.23] (219-90-184-65.ip.adam.com.au. [219.90.184.65])
 by smtp.gmail.com with UTF8SMTPSA id
 n23sm24858904pgv.76.2021.07.20.02.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 02:41:08 -0700 (PDT)
Message-ID: <cd309d68-65ac-0ce9-c941-520ac6402f8e@ozlabs.ru>
Date: Tue, 20 Jul 2021 19:41:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:90.0) Gecko/20100101
 Thunderbird/90.0
Subject: Re: [PATCH v5 02/11] powerpc/kernel/iommu: Add new
 iommu_table_in_use() helper
Content-Language: en-US
To: =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, David Gibson
 <david@gibson.dropbear.id.au>, kernel test robot <lkp@intel.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
 <20210716082755.428187-3-leobras.c@gmail.com>
 <29c199f3-63a8-3edb-b29e-de157431d89f@linux.ibm.com>
 <283e44591010dcb0690769afaef147add3b36978.camel@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <283e44591010dcb0690769afaef147add3b36978.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 20/07/2021 15:38, Leonardo Brás wrote:
> Hello Fred, thanks for this feedback!
> 
> Sorry if I miss anything, this snippet was written for v1 over an year
> ago, and I have not taken a look at it ever since.
> 
> On Mon, 2021-07-19 at 15:53 +0200, Frederic Barrat wrote:
>>
>>
>> On 16/07/2021 10:27, Leonardo Bras wrote:
>>> @@ -1099,18 +1105,13 @@ int iommu_take_ownership(struct iommu_table
>>> *tbl)
>>>          for (i = 0; i < tbl->nr_pools; i++)
>>>                  spin_lock_nest_lock(&tbl->pools[i].lock, &tbl-
>>>> large_pool.lock);
>>>    
>>> -       iommu_table_release_pages(tbl);
>>> -
>>> -       if (!bitmap_empty(tbl->it_map, tbl->it_size)) {
>>> +       if (iommu_table_in_use(tbl)) {
>>>                  pr_err("iommu_tce: it_map is not empty");
>>>                  ret = -EBUSY;
>>> -               /* Undo iommu_table_release_pages, i.e. restore
>>> bit#0, etc */
>>> -               iommu_table_reserve_pages(tbl, tbl-
>>>> it_reserved_start,
>>> -                               tbl->it_reserved_end);
>>> -       } else {
>>> -               memset(tbl->it_map, 0xff, sz);
>>>          }
>>>    
>>> +       memset(tbl->it_map, 0xff, sz);
>>> +
>>
>>
>> So if the table is not empty, we fail (EBUSY) but we now also
>> completely
>> overwrite the bitmap. It was in an unexpected state, but we're making
>> it
>> worse. Or am I missing something?
> 
> IIRC there was a reason to do that at the time, but TBH I don't really
> remember it, and by looking at the code right now you seem to be
> correct about this causing trouble.
> 
> I will send a v6 fixing it soon.
> Please review the remaining patches for some issue I may be missing.
> 
> Alexey, any comments on that?


Agree with Fred, this is a bug, EBUSY is not that unexpected :-/ Thanks,


> 
>>
>>     Fred
>>
> 
> Again, thank you for reviewing Fred!
> Best regards,
> Leonardo Bras
> 
> 
> 
> 
> 

-- 
Alexey
