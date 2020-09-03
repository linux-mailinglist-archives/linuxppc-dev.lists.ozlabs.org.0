Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 768BC25B9C3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 06:27:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bhnpw4mS5zDqwt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 14:27:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=sJlfa0FJ; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhnnF6sYtzDqkf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Sep 2020 14:26:23 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id n3so3118049pjq.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Sep 2020 21:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vNNQnTB2bzzVVpKwB6qXlFTaOV9Itbw7rVnGe9BKXq4=;
 b=sJlfa0FJy0iGf9Yz8+LLYpkmIRerR+3vw9ref3rCuEZFVw3shlzY5WxXBPCJLQClXC
 EXzOD4lRvMwyHMtYa2H+FZXE+YhQkpHoSQTiXybdDd2NGAELqWlw3ErulpozjdyzT3nG
 AeP43JnaytbUXYFNBYmKxXWrfW6OAID8E7SKHR0hHUQ5rOiLdPGUVrZKlgAXaPBIgUrh
 qhlxtTxgU+dM7jzIKD+tPNpxTwPJrMx3+9SkjGhmF08CUqm6SPcqJUQkWBZpk+1NHZo7
 C6ZR81iQGjiZbvKYU0hxY2fblbEpYtOcZ70lVMPuyjdMgv/jI08pZvA15Ih+cV97ahXw
 LG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vNNQnTB2bzzVVpKwB6qXlFTaOV9Itbw7rVnGe9BKXq4=;
 b=o8KnN39BZt5V/3I5UO6w56ei6M2VAiFAuBAV9CMTxvqDz9E489S1zDY/emc3PjJhON
 GayfsPmPbZHkj/ky0FxaEROqkbyRGwyPQi7nkTp+uOVYTXPkQgMUL2RPe39+oLRZGy4z
 UH4/mMKDNJgi+JKUEs9JYkx53xMUTZ+jbUkfNFw12rziojdj+7tMEdL8vNubpSNpO8cp
 LDdSeLQJbwFrS9hOvJbDm76OPho2mUooZdIi/724T0XUSqaw5dmtvWg+tB/nb+I45C3o
 VFhZRZpR8aNlzjj9u9/8c3Hb57Vi625fdLQ+ZUpxeugS+35WM0rbhx3KmHnWFPAC9gDw
 B/yA==
X-Gm-Message-State: AOAM532paFEqR2xE13MEs+GSlMWMyzdO0f3Aomb2Bl7n68qObXNY1Sc3
 J9hYllz4NmqPXm/Ci7U+hecpBg==
X-Google-Smtp-Source: ABdhPJxtRfGq45PYlHxfkRMSCAIlYNz5dGbpz6AjsI1wmDKHjr2nziGD1zj2YOi01BPhog6rNUF/ug==
X-Received: by 2002:a17:90a:de09:: with SMTP id
 m9mr1249438pjv.231.1599107180628; 
 Wed, 02 Sep 2020 21:26:20 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id n67sm888007pgn.14.2020.09.02.21.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 21:26:19 -0700 (PDT)
Subject: Re: [PATCH v1 01/10] powerpc/pseries/iommu: Replace hard-coded page
 shift
To: Leonardo Bras <leobras.c@gmail.com>, Oliver O'Halloran <oohall@gmail.com>
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-2-leobras.c@gmail.com>
 <6232948f-033d-8322-e656-544f12c5f784@ozlabs.ru>
 <31e913d842693b6e107cb2b8e51fd45118b1bd2c.camel@gmail.com>
 <1e77a3d9-dff9-f58b-45be-77be7cbea41a@ozlabs.ru>
 <93037398c7afaabc0411890998f3f29f741c8aff.camel@gmail.com>
 <aaaf993a-d233-f5be-b809-5911a6a9872d@ozlabs.ru>
 <CAOSf1CG49ztvNoG43hcSHyLB9UY6Nc8maY_q6nvQmiyFQOAp3A@mail.gmail.com>
 <1bba12c6-f1ec-9f1e-1d3e-c1efa5ceb7c7@ozlabs.ru>
 <c381d7e60d0924e432b0f36dce9a44b89733a129.camel@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <ffed8bef-443c-3794-2ba3-720c073d91f5@ozlabs.ru>
Date: Thu, 3 Sep 2020 14:26:12 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <c381d7e60d0924e432b0f36dce9a44b89733a129.camel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 David Dai <zdai@linux.vnet.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Brian King <brking@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 02/09/2020 07:38, Leonardo Bras wrote:
> On Mon, 2020-08-31 at 13:48 +1000, Alexey Kardashevskiy wrote:
>>>>> Well, I created this TCE_RPN_BITS = 52 because the previous mask was a
>>>>> hardcoded 40-bit mask (0xfffffffffful), for hard-coded 12-bit (4k)
>>>>> pagesize, and on PAPR+/LoPAR also defines TCE as having bits 0-51
>>>>> described as RPN, as described before.
>>>>>
>>>>> IODA3 Revision 3.0_prd1 (OpenPowerFoundation), Figure 3.4 and 3.5.
>>>>> shows system memory mapping into a TCE, and the TCE also has bits 0-51
>>>>> for the RPN (52 bits). "Table 3.6. TCE Definition" also shows it.
>>>>> In fact, by the looks of those figures, the RPN_MASK should always be a
>>>>> 52-bit mask, and RPN = (page >> tceshift) & RPN_MASK.
>>>>
>>>> I suspect the mask is there in the first place for extra protection
>>>> against too big addresses going to the TCE table (or/and for virtial vs
>>>> physical addresses). Using 52bit mask makes no sense for anything, you
>>>> could just drop the mask and let c compiler deal with 64bit "uint" as it
>>>> is basically a 4K page address anywhere in the 64bit space. Thanks,
>>>
>>> Assuming 4K pages you need 52 RPN bits to cover the whole 64bit
>>> physical address space. The IODA3 spec does explicitly say the upper
>>> bits are optional and the implementation only needs to support enough
>>> to cover up to the physical address limit, which is 56bits of P9 /
>>> PHB4. If you want to validate that the address will fit inside of
>>> MAX_PHYSMEM_BITS then fine, but I think that should be done as a
>>> WARN_ON or similar rather than just silently masking off the bits.
>>
>> We can do this and probably should anyway but I am also pretty sure we
>> can just ditch the mask and have the hypervisor return an error which
>> will show up in dmesg.
> 
> Ok then, ditching the mask.


Well, you could run a little experiment and set some bits above that old 
mask and see how phyp reacts :)


> Thanks!
> 

-- 
Alexey
