Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CBD2F37DA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 19:03:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFdjF3lw8zDr43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 05:03:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BSgHEVaU; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFdg21q4lzDr42
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 05:01:16 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id v1so2092536pjr.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 10:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=va30dobV2cprJIEYRAMJZ0NvTQmJlWLcGFXGaT2vIak=;
 b=BSgHEVaU+wp7g4SWj2v4eN1mMBviAHg2joarj9Q5PqmN8t6EM2D6f1NyFTwwm/RHI0
 o530n0t4+JxUQbuS7gDRYOL0VdFusmQMKTAGYtLo1Apuiz1GAX0v7lTywAjArhJbxLd4
 VkEM/2ERiVdNuyl7zex52LNAJnTL+Ok9EGjto3tvmPt0E4q91je9Jtu1HVekg4QImqlf
 Ukvg1OjSm3f5QJyWdErQltv+AJ0iHxmXhbNSBnhcqlDKTGZqQv2yVs1sh4hB03PRkf2K
 /HBV+PIWSsfBRTZM8gmqQSl0rm/5btH8juEfiP+v6pXHCW8BfJFJ1UWGfNakFEpb+yF2
 kqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=va30dobV2cprJIEYRAMJZ0NvTQmJlWLcGFXGaT2vIak=;
 b=E7jOCzOCDlBkO1IRCzTkymTEwXVLTp3ku1008SHD+UrXDJFK8b/wm55u5OZ0hyCEij
 zVhBnFLEZwKFWvMccDcQtdhNJ8741bpz/lblam3DTmdjSI+sOnOf6hq+K3FF+fqX+tb9
 ei8kY5pE6DX3rUujF5f/hJXyQB5TPUDQq5rA13jgojNceGEV9vhT9giDZeecj/uW1n8Y
 5YQ2lfazxg9bgGMf+GFZlWWTDqc4czP5VJbwKx4r/NCCiWf0+23YJ6XH39/E3uAW6sqA
 FdbQRNavDTMtegkLBT6TwYhGcT5gfUlQ+1SKzBpVoa8zVnOt/z448uH9pxng1VrdxGF+
 Z+ZQ==
X-Gm-Message-State: AOAM532Bz5O0+/Sn1rWwyRyqJ4n9LLcTTKeODgcb0VQWnjnL13DzxUu7
 +6k7EUBQmtEJvuHpBa0tdBc=
X-Google-Smtp-Source: ABdhPJxLrOwZPK4BbGADYVcldoOiNOJ5fY7nnloJLfhNDEA/ZD8O29mpGXC5Cm138CV7PrM9YNS3vA==
X-Received: by 2002:a17:902:521:b029:dc:2836:ec17 with SMTP id
 30-20020a1709020521b02900dc2836ec17mr258050plf.47.1610474472960; 
 Tue, 12 Jan 2021 10:01:12 -0800 (PST)
Received: from [10.67.48.230] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id i2sm4230154pjd.21.2021.01.12.10.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 10:01:10 -0800 (PST)
Subject: Re: [RFC PATCH v3 0/6] Restricted DMA
To: Claire Chang <tientzu@chromium.org>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <d7043239-12cf-3636-4726-2e3b90917dc6@gmail.com>
 <CALiNf28sU1VtGB7LeTXExkMwQiCeg8N5arqyEjw0CPZP72R4dg@mail.gmail.com>
 <78871151-947d-b085-db03-0d0bd0b55632@gmail.com>
 <CALiNf29_PmLJTVLksSHp3NFAaL52idqehSMOtatJ=jaM2Muq1g@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 mQGiBEjPuBIRBACW9MxSJU9fvEOCTnRNqG/13rAGsj+vJqontvoDSNxRgmafP8d3nesnqPyR
 xGlkaOSDuu09rxuW+69Y2f1TzjFuGpBk4ysWOR85O2Nx8AJ6fYGCoeTbovrNlGT1M9obSFGQ
 X3IzRnWoqlfudjTO5TKoqkbOgpYqIo5n1QbEjCCwCwCg3DOH/4ug2AUUlcIT9/l3pGvoRJ0E
 AICDzi3l7pmC5IWn2n1mvP5247urtHFs/uusE827DDj3K8Upn2vYiOFMBhGsxAk6YKV6IP0d
 ZdWX6fqkJJlu9cSDvWtO1hXeHIfQIE/xcqvlRH783KrihLcsmnBqOiS6rJDO2x1eAgC8meAX
 SAgsrBhcgGl2Rl5gh/jkeA5ykwbxA/9u1eEuL70Qzt5APJmqVXR+kWvrqdBVPoUNy/tQ8mYc
 nzJJ63ng3tHhnwHXZOu8hL4nqwlYHRa9eeglXYhBqja4ZvIvCEqSmEukfivk+DlIgVoOAJbh
 qIWgvr3SIEuR6ayY3f5j0f2ejUMYlYYnKdiHXFlF9uXm1ELrb0YX4GMHz7QnRmxvcmlhbiBG
 YWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+iGYEExECACYCGyMGCwkIBwMCBBUCCAME
 FgIDAQIeAQIXgAUCVF/S8QUJHlwd3wAKCRBhV5kVtWN2DvCVAJ4u4/bPF4P3jxb4qEY8I2gS
 6hG0gACffNWlqJ2T4wSSn+3o7CCZNd7SLSC5BA0ESM+4EhAQAL/o09boR9D3Vk1Tt7+gpYr3
 WQ6hgYVON905q2ndEoA2J0dQxJNRw3snabHDDzQBAcqOvdi7YidfBVdKi0wxHhSuRBfuOppu
 pdXkb7zxuPQuSveCLqqZWRQ+Cc2QgF7SBqgznbe6Ngout5qXY5Dcagk9LqFNGhJQzUGHAsIs
 hap1f0B1PoUyUNeEInV98D8Xd/edM3mhO9nRpUXRK9Bvt4iEZUXGuVtZLT52nK6Wv2EZ1TiT
 OiqZlf1P+vxYLBx9eKmabPdm3yjalhY8yr1S1vL0gSA/C6W1o/TowdieF1rWN/MYHlkpyj9c
 Rpc281gAO0AP3V1G00YzBEdYyi0gaJbCEQnq8Vz1vDXFxHzyhgGz7umBsVKmYwZgA8DrrB0M
 oaP35wuGR3RJcaG30AnJpEDkBYHznI2apxdcuTPOHZyEilIRrBGzDwGtAhldzlBoBwE3Z3MY
 31TOpACu1ZpNOMysZ6xiE35pWkwc0KYm4hJA5GFfmWSN6DniimW3pmdDIiw4Ifcx8b3mFrRO
 BbDIW13E51j9RjbO/nAaK9ndZ5LRO1B/8Fwat7bLzmsCiEXOJY7NNpIEpkoNoEUfCcZwmLrU
 +eOTPzaF6drw6ayewEi5yzPg3TAT6FV3oBsNg3xlwU0gPK3v6gYPX5w9+ovPZ1/qqNfOrbsE
 FRuiSVsZQ5s3AAMFD/9XjlnnVDh9GX/r/6hjmr4U9tEsM+VQXaVXqZuHKaSmojOLUCP/YVQo
 7IiYaNssCS4FCPe4yrL4FJJfJAsbeyDykMN7wAnBcOkbZ9BPJPNCbqU6dowLOiy8AuTYQ48m
 vIyQ4Ijnb6GTrtxIUDQeOBNuQC/gyyx3nbL/lVlHbxr4tb6YkhkO6shjXhQh7nQb33FjGO4P
 WU11Nr9i/qoV8QCo12MQEo244RRA6VMud06y/E449rWZFSTwGqb0FS0seTcYNvxt8PB2izX+
 HZA8SL54j479ubxhfuoTu5nXdtFYFj5Lj5x34LKPx7MpgAmj0H7SDhpFWF2FzcC1bjiW9mjW
 HaKaX23Awt97AqQZXegbfkJwX2Y53ufq8Np3e1542lh3/mpiGSilCsaTahEGrHK+lIusl6mz
 Joil+u3k01ofvJMK0ZdzGUZ/aPMZ16LofjFA+MNxWrZFrkYmiGdv+LG45zSlZyIvzSiG2lKy
 kuVag+IijCIom78P9jRtB1q1Q5lwZp2TLAJlz92DmFwBg1hyFzwDADjZ2nrDxKUiybXIgZp9
 aU2d++ptEGCVJOfEW4qpWCCLPbOT7XBr+g/4H3qWbs3j/cDDq7LuVYIe+wchy/iXEJaQVeTC
 y5arMQorqTFWlEOgRA8OP47L9knl9i4xuR0euV6DChDrguup2aJVU4hPBBgRAgAPAhsMBQJU
 X9LxBQkeXB3fAAoJEGFXmRW1Y3YOj4UAn3nrFLPZekMeqX5aD/aq/dsbXSfyAKC45Go0YyxV
 HGuUuzv+GKZ6nsysJ7kCDQRXG8fwARAA6q/pqBi5PjHcOAUgk2/2LR5LjjesK50bCaD4JuNc
 YDhFR7Vs108diBtsho3w8WRd9viOqDrhLJTroVckkk74OY8r+3t1E0Dd4wHWHQZsAeUvOwDM
 PQMqTUBFuMi6ydzTZpFA2wBR9x6ofl8Ax+zaGBcFrRlQnhsuXLnM1uuvS39+pmzIjasZBP2H
 UPk5ifigXcpelKmj6iskP3c8QN6x6GjUSmYx+xUfs/GNVSU1XOZn61wgPDbgINJd/THGdqiO
 iJxCLuTMqlSsmh1+E1dSdfYkCb93R/0ZHvMKWlAx7MnaFgBfsG8FqNtZu3PCLfizyVYYjXbV
 WO1A23riZKqwrSJAATo5iTS65BuYxrFsFNPrf7TitM8E76BEBZk0OZBvZxMuOs6Z1qI8YKVK
 UrHVGFq3NbuPWCdRul9SX3VfOunr9Gv0GABnJ0ET+K7nspax0xqq7zgnM71QEaiaH17IFYGS
 sG34V7Wo3vyQzsk7qLf9Ajno0DhJ+VX43g8+AjxOMNVrGCt9RNXSBVpyv2AMTlWCdJ5KI6V4
 KEzWM4HJm7QlNKE6RPoBxJVbSQLPd9St3h7mxLcne4l7NK9eNgNnneT7QZL8fL//s9K8Ns1W
 t60uQNYvbhKDG7+/yLcmJgjF74XkGvxCmTA1rW2bsUriM533nG9gAOUFQjURkwI8jvMAEQEA
 AYkCaAQYEQIACQUCVxvH8AIbAgIpCRBhV5kVtWN2DsFdIAQZAQIABgUCVxvH8AAKCRCH0Jac
 RAcHBIkHD/9nmfog7X2ZXMzL9ktT++7x+W/QBrSTCTmq8PK+69+INN1ZDOrY8uz6htfTLV9+
 e2W6G8/7zIvODuHk7r+yQ585XbplgP0V5Xc8iBHdBgXbqnY5zBrcH+Q/oQ2STalEvaGHqNoD
 UGyLQ/fiKoLZTPMur57Fy1c9rTuKiSdMgnT0FPfWVDfpR2Ds0gpqWePlRuRGOoCln5GnREA/
 2MW2rWf+CO9kbIR+66j8b4RUJqIK3dWn9xbENh/aqxfonGTCZQ2zC4sLd25DQA4w1itPo+f5
 V/SQxuhnlQkTOCdJ7b/mby/pNRz1lsLkjnXueLILj7gNjwTabZXYtL16z24qkDTI1x3g98R/
 xunb3/fQwR8FY5/zRvXJq5us/nLvIvOmVwZFkwXc+AF+LSIajqQz9XbXeIP/BDjlBNXRZNdo
 dVuSU51ENcMcilPr2EUnqEAqeczsCGpnvRCLfVQeSZr2L9N4svNhhfPOEscYhhpHTh0VPyxI
 pPBNKq+byuYPMyk3nj814NKhImK0O4gTyCK9b+gZAVvQcYAXvSouCnTZeJRrNHJFTgTgu6E0
 caxTGgc5zzQHeX67eMzrGomG3ZnIxmd1sAbgvJUDaD2GrYlulfwGWwWyTNbWRvMighVdPkSF
 6XFgQaosWxkV0OELLy2N485YrTr2Uq64VKyxpncLh50e2RnyAJ9Za0Dx0yyp44iD1OvHtkEI
 M5kY0ACeNhCZJvZ5g4C2Lc9fcTHu8jxmEkI=
Message-ID: <23a09b9a-70fc-a7a8-f3ea-b0bfa60507f0@gmail.com>
Date: Tue, 12 Jan 2021 10:01:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CALiNf29_PmLJTVLksSHp3NFAaL52idqehSMOtatJ=jaM2Muq1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org, grant.likely@arm.com,
 paulus@samba.org, Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 rafael.j.wysocki@intel.com, Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>, will@kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/11/21 11:48 PM, Claire Chang wrote:
> On Fri, Jan 8, 2021 at 1:59 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> On 1/7/21 9:42 AM, Claire Chang wrote:
>>
>>>> Can you explain how ATF gets involved and to what extent it does help,
>>>> besides enforcing a secure region from the ARM CPU's perpsective? Does
>>>> the PCIe root complex not have an IOMMU but can somehow be denied access
>>>> to a region that is marked NS=0 in the ARM CPU's MMU? If so, that is
>>>> still some sort of basic protection that the HW enforces, right?
>>>
>>> We need the ATF support for memory MPU (memory protection unit).
>>> Restricted DMA (with reserved-memory in dts) makes sure the predefined memory
>>> region is for PCIe DMA only, but we still need MPU to locks down PCIe access to
>>> that specific regions.
>>
>> OK so you do have a protection unit of some sort to enforce which region
>> in DRAM the PCIE bridge is allowed to access, that makes sense,
>> otherwise the restricted DMA region would only be a hint but nothing you
>> can really enforce. This is almost entirely analogous to our systems then.
> 
> Here is the example of setting the MPU:
> https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132
> 
>>
>> There may be some value in standardizing on an ARM SMCCC call then since
>> you already support two different SoC vendors.
>>
>>>
>>>>
>>>> On Broadcom STB SoCs we have had something similar for a while however
>>>> and while we don't have an IOMMU for the PCIe bridge, we do have a a
>>>> basic protection mechanism whereby we can configure a region in DRAM to
>>>> be PCIe read/write and CPU read/write which then gets used as the PCIe
>>>> inbound region for the PCIe EP. By default the PCIe bridge is not
>>>> allowed access to DRAM so we must call into a security agent to allow
>>>> the PCIe bridge to access the designated DRAM region.
>>>>
>>>> We have done this using a private CMA area region assigned via Device
>>>> Tree, assigned with a and requiring the PCIe EP driver to use
>>>> dma_alloc_from_contiguous() in order to allocate from this device
>>>> private CMA area. The only drawback with that approach is that it
>>>> requires knowing how much memory you need up front for buffers and DMA
>>>> descriptors that the PCIe EP will need to process. The problem is that
>>>> it requires driver modifications and that does not scale over the number
>>>> of PCIe EP drivers, some we absolutely do not control, but there is no
>>>> need to bounce buffer. Your approach scales better across PCIe EP
>>>> drivers however it does require bounce buffering which could be a
>>>> performance hit.
>>>
>>> Only the streaming DMA (map/unmap) needs bounce buffering.
>>
>> True, and typically only on transmit since you don't really control
>> where the sk_buff are allocated from, right? On RX since you need to
>> hand buffer addresses to the WLAN chip prior to DMA, you can allocate
>> them from a pool that already falls within the restricted DMA region, right?
>>
> 
> Right, but applying bounce buffering to RX will make it more secure.
> The device won't be able to modify the content after unmap. Just like what
> iommu_unmap does.

Sure, however the goals of using bounce buffering equally applies to RX
and TX in that this is the only layer sitting between a stack (block,
networking, USB, etc.) and the underlying device driver that scales well
in order to massage a dma_addr_t to be within a particular physical range.

There is however room for improvement if the drivers are willing to
change their buffer allocation strategy. When you receive Wi-Fi frames
you need to allocate buffers for the Wi-Fi device to DMA into, and that
happens ahead of the DMA transfers by the Wi-Fi device. At buffer
allocation time you could very well allocate these frames from the
restricted DMA region without having to bounce buffer them since the
host CPU is in control over where and when to DMA into.

The issue is that each network driver may implement its own buffer
allocation strategy, some may simply call netdev_alloc_skb() which gives
zero control over where the buffer comes from unless you play tricks
with NUMA node allocations and somehow declare that your restricted DMA
region is a different NUMA node. If the driver allocates pages and then
attaches a SKB to that page using build_skb(), then you have much more
control over where that page comes from, and this is where using a
device private CMA are helps, because you can just do
dma_alloc_from_contiguous() and that will ensure that the pages are
coming from your specific CMA area.

Few questions on the implementation:

- is there any warning or error being printed if the restricted DMA
region is outside of a device's DMA addressable range?

- are there are any helpful statistics that could be shown to indicate
that the restricted DMA region was sized too small, e.g.: that
allocation of a DMA buffer failed because we ran out of space in the
swiotlb pool?

> 
>>> I also added alloc/free support in this series
>>> (https://lore.kernel.org/patchwork/patch/1360995/), so dma_direct_alloc() will
>>> try to allocate memory from the predefined memory region.
>>>
>>> As for the performance hit, it should be similar to the default swiotlb.
>>> Here are my experiment results. Both SoCs lack IOMMU for PCIe.
>>>
>>> PCIe wifi vht80 throughput -
>>>
>>>   MTK SoC                  tcp_tx     tcp_rx    udp_tx   udp_rx
>>>   w/o Restricted DMA  244.1     134.66   312.56   350.79
>>>   w/ Restricted DMA    246.95   136.59   363.21   351.99
>>>
>>>   Rockchip SoC           tcp_tx     tcp_rx    udp_tx   udp_rx
>>>   w/o Restricted DMA  237.87   133.86   288.28   361.88
>>>   w/ Restricted DMA    256.01   130.95   292.28   353.19
>>
>> How come you get better throughput with restricted DMA? Is it because
>> doing DMA to/from a contiguous region allows for better grouping of
>> transactions from the DRAM controller's perspective somehow?
> 
> I'm not sure, but actually, enabling the default swiotlb for wifi also helps the
> throughput a little bit for me.

OK, it would be interesting if you could get to the bottom of why
performance does increase with swiotlb.
-- 
Florian
