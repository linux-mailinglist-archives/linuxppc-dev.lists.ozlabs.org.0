Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F8C11C35D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 03:42:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YJ3c0btnzDqwM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 13:42:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="Iwml/aNI"; 
 dkim-atps=neutral
X-Greylist: delayed 13930 seconds by postgrey-1.36 at bilbo;
 Thu, 12 Dec 2019 13:40:05 AEDT
Received: from mail-pf1-x442.google.com (unknown [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YJ1K3lWjzDqtr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 13:40:02 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id 4so290257pfz.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 18:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N1vZvAspVQ8GxG11NuV9rSW7V/scKsXsFlLyg+4/A4c=;
 b=Iwml/aNIyEo0sVmh/kZW7X3bDMcq2p6VyagPQDzbJPI7mpRvRtKPCYU5iRlGvEI3Jq
 IUhjA7qrdpzl+ak4caPBw+R/YCHfl/MyCrJ1i83RWP8HwstZP/AmUoSK5Usa/dT3JDIP
 drejMPfgS5bLw3w2VXwSKyrIXwjIXEQK9n4mLMIPQqKegw1TtBqNsSWghA9CjXa06lk3
 ppmqI+dju0ypDqj5jpfSIXgpH1s+hkstGDFiPbMD1/mJ9IvBIDAPqJyDLvBybo0A26cZ
 y+sOpSkt2cag1reywKhKYuOPNXDdpvPtZwuLt1Q+y2/NT1IniEWgYIHLFE111T1NYT/k
 p2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=N1vZvAspVQ8GxG11NuV9rSW7V/scKsXsFlLyg+4/A4c=;
 b=VsXiz4fH8tvWEk01t62CsGZ/JA0Qw9uK1fNutB4nCmYsc7D4X7Wo+Ko0tdl/p3OlbR
 DMyYqwaLp2ZRCOHT9QcwwQO4O0sXOm1GCk+oCcCHndQkc/jg+QwWgFWKLBCzeAWXx16O
 8aQ0QFDx3GorV4WeVwPYYU9vjeMGj5vXtGbjwsOSIlTjJ7a9DhGliXIZSjiLt381Rwlf
 104QlZBnnNeC3sdAWChfcINwMri32jwe2ez61nD24qjtfMd9EvDRzREJ9LbGInzeqS4t
 tibsWa5Y+xoXak7lQJkIEG0QgiW1AAk712pktjyUxMDm/VrVO49brHH3Krz2/6eUryyp
 eV0A==
X-Gm-Message-State: APjAAAW3G/1O8YV/JoS8CaRMTTz6Q96B6FaZThWgGSlbzqNwtKzelEf+
 b0IIx0vQ7QxpvIhNgD+NkiRK5Q==
X-Google-Smtp-Source: APXvYqxqZxe7JUIphpxrPKnVayuDBaQKS2IgAeyhOIdv1S5akOBshaNeRVrmxwn2czc7G4V7KUEkgg==
X-Received: by 2002:a63:a508:: with SMTP id n8mr7700548pgf.278.1576118390190; 
 Wed, 11 Dec 2019 18:39:50 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id q11sm4602605pff.111.2019.12.11.18.39.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 18:39:49 -0800 (PST)
Subject: Re: [PATCH v5 1/2] powerpc/pseries/iommu: Share the per-cpu TCE page
 with the hypervisor.
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: Michael Roth <mdroth@linux.vnet.ibm.com>, Ram Pai <linuxram@us.ibm.com>
References: <1575681159-30356-1-git-send-email-linuxram@us.ibm.com>
 <1575681159-30356-2-git-send-email-linuxram@us.ibm.com>
 <ed0f048c-bb40-c6c6-887c-ef68c9e411a2@ozlabs.ru>
 <20191210051244.GB5702@oc0525413822.ibm.com>
 <c4b48f55-e4e3-222a-0aa0-9b4783e19584@ozlabs.ru>
 <20191210153542.GB5709@oc0525413822.ibm.com>
 <90f6019b-d756-7f33-21b0-bb49c1c842da@ozlabs.ru>
 <157609629270.3810.9676234389583169255@sif>
 <ad63a352-bdec-08a8-2fd0-f64b9579da6c@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <d2285445-b86d-b2f2-5418-b1af46523311@ozlabs.ru>
Date: Thu, 12 Dec 2019 13:39:42 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <ad63a352-bdec-08a8-2fd0-f64b9579da6c@ozlabs.ru>
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
Cc: andmike@us.ibm.com, mst@redhat.com, linux-kernel@vger.kernel.org,
 leonardo@linux.ibm.com, ram.n.pai@gmail.com, cai@lca.pw, tglx@linutronix.de,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/12/2019 09:47, Alexey Kardashevskiy wrote:
> 
> 
> On 12/12/2019 07:31, Michael Roth wrote:
>> Quoting Alexey Kardashevskiy (2019-12-11 02:15:44)
>>>
>>>
>>> On 11/12/2019 02:35, Ram Pai wrote:
>>>> On Tue, Dec 10, 2019 at 04:32:10PM +1100, Alexey Kardashevskiy wrote:
>>>>>
>>>>>
>>>>> On 10/12/2019 16:12, Ram Pai wrote:
>>>>>> On Tue, Dec 10, 2019 at 02:07:36PM +1100, Alexey Kardashevskiy wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 07/12/2019 12:12, Ram Pai wrote:
>>>>>>>> H_PUT_TCE_INDIRECT hcall uses a page filled with TCE entries, as one of
>>>>>>>> its parameters.  On secure VMs, hypervisor cannot access the contents of
>>>>>>>> this page since it gets encrypted.  Hence share the page with the
>>>>>>>> hypervisor, and unshare when done.
>>>>>>>
>>>>>>>
>>>>>>> I thought the idea was to use H_PUT_TCE and avoid sharing any extra
>>>>>>> pages. There is small problem that when DDW is enabled,
>>>>>>> FW_FEATURE_MULTITCE is ignored (easy to fix); I also noticed complains
>>>>>>> about the performance on slack but this is caused by initial cleanup of
>>>>>>> the default TCE window (which we do not use anyway) and to battle this
>>>>>>> we can simply reduce its size by adding
>>>>>>
>>>>>> something that takes hardly any time with H_PUT_TCE_INDIRECT,  takes
>>>>>> 13secs per device for H_PUT_TCE approach, during boot. This is with a
>>>>>> 30GB guest. With larger guest, the time will further detoriate.
>>>>>
>>>>>
>>>>> No it will not, I checked. The time is the same for 2GB and 32GB guests-
>>>>> the delay is caused by clearing the small DMA window which is small by
>>>>> the space mapped (1GB) but quite huge in TCEs as it uses 4K pages; and
>>>>> for DDW window + emulated devices the IOMMU page size will be 2M/16M/1G
>>>>> (depends on the system) so the number of TCEs is much smaller.
>>>>
>>>> I cant get your results.  What changes did you make to get it?
>>>
>>>
>>> Get what? I passed "-m 2G" and "-m 32G", got the same time - 13s spent
>>> in clearing the default window and the huge window took a fraction of a
>>> second to create and map.
>>
>> Is this if we disable FW_FEATURE_MULTITCE in the guest and force the use
>> of H_PUT_TCE everywhere?
> 
> 
> Yes. Well, for the DDW case FW_FEATURE_MULTITCE is ignored but even when
> fixed (I have it in my local branch), this does not make a difference.
> 
> 
>>
>> In theory couldn't we leave FW_FEATURE_MULTITCE in place so that
>> iommu_table_clear() can still use H_STUFF_TCE (which I guess is basically
>> instant),
> 
> PAPR/LoPAPR "conveniently" do not describe what hcall-multi-tce does
> exactly. But I am pretty sure the idea is that either both H_STUFF_TCE
> and H_PUT_TCE_INDIRECT are present or neither.
> 
> 
>> and then force H_PUT_TCE for new mappings via something like:
>>
>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>> index 6ba081dd61c9..85d092baf17d 100644
>> --- a/arch/powerpc/platforms/pseries/iommu.c
>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>> @@ -194,6 +194,7 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
>>         unsigned long flags;
>>  
>>         if ((npages == 1) || !firmware_has_feature(FW_FEATURE_MULTITCE)) {
>> +       if ((npages == 1) || !firmware_has_feature(FW_FEATURE_MULTITCE) || is_secure_guest()) {
> 
> 
> Nobody (including myself) seems to like the idea of having
> is_secure_guest() all over the place.
> 
> And with KVM acceleration enabled, it is pretty fast anyway. Just now we
> do not have H_PUT_TCE in KVM/UV for secure guests but we will have to
> fix this for secure PCI passhtrough anyway.
> 
> 
>>                 return tce_build_pSeriesLP(tbl, tcenum, npages, uaddr,
>>                                            direction, attrs);
>>         }
>>
>> That seems like it would avoid the extra 13s.
> 
> Or move around iommu_table_clear() which imho is just the right thing to do.


Huh. It is not the right thing as the firmware could have left mappings
there so we need cleanup. Even if I fixed SLOF, there is POWERVM which I
do not know what it does about TCEs. Thanks,



-- 
Alexey
