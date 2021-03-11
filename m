Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7612D336B4E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 06:05:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwxhv37L9z3cKS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 16:05:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IL1N7vM7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IL1N7vM7; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwxhN16ysz30Ql
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 16:04:50 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id ha17so2102217pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 21:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eayOjb0KZ31qj1N8PdToC+xRVUBfCHUPI3Znks8WR0k=;
 b=IL1N7vM7p9PzFcfpvhgRRMuOzhmjBlfibWkIcOQbYlGbPOJMnLhIzjCy8LxBaJ8EGU
 KJjjEgkbLtjbaD4sqhZ1ochG6cVFghEOlubEd7dsbfPijX8lC9eVqiLaeiTO3VXqhE5j
 YprOjLc8isTrNz1yxLNXa7sz1Bhn0z1t0w+HJ0pPJUXLLao5DKoPWk0aWURYin4FB6OE
 oTFCyRJLtkVFf3JLLGhSJTXk7wLVT433snzVLTFp5sM2sqXb87myqAsWS9pqaTfVDExL
 f+ojkMFllNvYboAo4xsrXYacF/clYDZcJc779Ph0MFvl0b3brsNawqyYAhHoxSZKsU/v
 mTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eayOjb0KZ31qj1N8PdToC+xRVUBfCHUPI3Znks8WR0k=;
 b=StuUk5J3VG2GoBQulGCDEVReE0MpWQK8iytyjEqkP6Ipfoem3HVo27ZwMwcioYoYBH
 gD2WHBefm0PqcjQmfcpJwIZ2AN847B5PcLzmi0y/D17EuaBYuJulnJXbcRXN11yUbP1e
 z2Co566YM6THGrmmQjyyPM/WHlvb06mYjQYGeJXr8P5cnUX4YPwpW95cWXQ0Ij1H2m3b
 XrHMaPrAxP6oXUjiB5CTWHS7VenB0A5rqc3EI8NpC1P+yve0+bIIc8e/tY7iF+2caFiw
 LeIcr03HBMsRVGRFxZT7ux3vk+7y3sJYhRQ7S+9FrLtCiSFkLgPnlvtuwQ66c9+Wd2Wp
 cA2A==
X-Gm-Message-State: AOAM530FNzrbu9prK+zNHlAstWmVYQ/PKKu9LG6kNX6VP44ZcxaB17Fh
 H3mKytrRELt2ipqQ+EQbzVE=
X-Google-Smtp-Source: ABdhPJzomvd6XDgwv/fL+vlX+FLEQgGyCWkzPbL90UL/BQndPGhzKH0Q4L/hjqK/fMjpcf3zxKU3vg==
X-Received: by 2002:a17:90a:a403:: with SMTP id
 y3mr7078020pjp.227.1615439087609; 
 Wed, 10 Mar 2021 21:04:47 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id y2sm979638pgf.7.2021.03.10.21.04.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 21:04:47 -0800 (PST)
Subject: Re: [PATCH v4 13/14] dt-bindings: of: Add restricted DMA pool
To: Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
 <20210209062131.2300005-14-tientzu@chromium.org>
 <20210310160747.GA29834@willie-the-truck>
 <CAL_JsqJE6A4awYCvqzw3qk2uAJEKgkSOKbk9tPaMKup8zes8cA@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <a5a684fe-5ed0-a12f-22ca-a8ba46124341@gmail.com>
Date: Wed, 10 Mar 2021 21:04:42 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJE6A4awYCvqzw3qk2uAJEKgkSOKbk9tPaMKup8zes8cA@mail.gmail.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Grant Likely <grant.likely@arm.com>,
 Paul Mackerras <paulus@samba.org>, Frank Rowand <frowand.list@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Claire Chang <tientzu@chromium.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Juergen Gross <jgross@suse.com>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Robin Murphy <robin.murphy@arm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/10/2021 1:40 PM, Rob Herring wrote:
> On Wed, Mar 10, 2021 at 9:08 AM Will Deacon <will@kernel.org> wrote:
>>
>> Hi Claire,
>>
>> On Tue, Feb 09, 2021 at 02:21:30PM +0800, Claire Chang wrote:
>>> Introduce the new compatible string, restricted-dma-pool, for restricted
>>> DMA. One can specify the address and length of the restricted DMA memory
>>> region by restricted-dma-pool in the reserved-memory node.
>>>
>>> Signed-off-by: Claire Chang <tientzu@chromium.org>
>>> ---
>>>  .../reserved-memory/reserved-memory.txt       | 24 +++++++++++++++++++
>>>  1 file changed, 24 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>> index e8d3096d922c..fc9a12c2f679 100644
>>> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>> @@ -51,6 +51,20 @@ compatible (optional) - standard definition
>>>            used as a shared pool of DMA buffers for a set of devices. It can
>>>            be used by an operating system to instantiate the necessary pool
>>>            management subsystem if necessary.
>>> +        - restricted-dma-pool: This indicates a region of memory meant to be
>>> +          used as a pool of restricted DMA buffers for a set of devices. The
>>> +          memory region would be the only region accessible to those devices.
>>> +          When using this, the no-map and reusable properties must not be set,
>>> +          so the operating system can create a virtual mapping that will be used
>>> +          for synchronization. The main purpose for restricted DMA is to
>>> +          mitigate the lack of DMA access control on systems without an IOMMU,
>>> +          which could result in the DMA accessing the system memory at
>>> +          unexpected times and/or unexpected addresses, possibly leading to data
>>> +          leakage or corruption. The feature on its own provides a basic level
>>> +          of protection against the DMA overwriting buffer contents at
>>> +          unexpected times. However, to protect against general data leakage and
>>> +          system memory corruption, the system needs to provide way to lock down
>>> +          the memory access, e.g., MPU.
>>
>> As far as I can tell, these pools work with both static allocations (which
>> seem to match your use-case where firmware has preconfigured the DMA ranges)
>> but also with dynamic allocations where a 'size' property is present instead
>> of the 'reg' property and the kernel is responsible for allocating the
>> reservation during boot. Am I right and, if so, is that deliberate?
> 
> I believe so. I'm not keen on having size only reservations in DT.
> Yes, we allowed that already, but that's back from the days of needing
> large CMA carveouts to be reserved early in boot. I've read that the
> kernel is much better now at contiguous allocations, so do we really
> need this in DT anymore?

I would say yes, there can be a number of times where you want to semi
statically partition your physical memory and their reserved regions. Be
it to pack everything together under the same protection rules or
because you need to allocate memory from a particular address range in
say a non-uniform memory controller architecture where address windows
have different scheduling algorithms.
-- 
Florian
