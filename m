Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2410430222E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 07:41:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPKyj2X4dzDq9n
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 17:41:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=jonmasters.org
 (client-ip=2607:f8b0:4864:20::f30; helo=mail-qv1-xf30.google.com;
 envelope-from=jcm@jonmasters.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=jonmasters-org.20150623.gappssmtp.com
 header.i=@jonmasters-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=j695vV5w; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPJK213rczDqWY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 16:27:14 +1100 (AEDT)
Received: by mail-qv1-xf30.google.com with SMTP id l14so3619516qvp.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 21:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jonmasters-org.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GKTBOeeUx6wXeRV6P9Jfat4kGoUSJVEmxQdNQfrFvYE=;
 b=j695vV5wc3nWbcMyhTthhn8OdI8FeBU0NIYpfGjClWPlG3p0NydLWU3g8ZsUMYwpBb
 KW2JNRKyHSLj5NbF3zgv98LTNXR/FI39adb5P8g5Ov78xV8+1I3sJLAx/58VQjev1KK9
 XKN6U58W3kDgBuh9ixEWML+5uiYTRljv9/vcApapM+BuN0SafT8eT2cq36/M2Nhx4pOJ
 J+dP+esVrOb1dc6faQd7ITFMjpT86ScCGU+zUJalRsk7qImxfM17ctgNIbj4tyIuQypR
 1Iiztz5jbMamKVvZAj8X7V/REhVlSgRHspm0lD1mMncTqhuBLErXKvrpx0VXyNdgEZ0T
 x3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GKTBOeeUx6wXeRV6P9Jfat4kGoUSJVEmxQdNQfrFvYE=;
 b=NvmSBJBiVAv24Imh2tRRoGCEJ6RvVgfYx3iASwo0KH4hTsOn7JyXCyEdCMkYeQjXVO
 yHbwTxEStOoONRYr6nl8J3P6vd310fhA2lE2zPtUcCVrk/imSgQ/8vXgA6CBoE3Memo3
 5W+qVgHv9s2POf1GbdWVF6a+zdDysg7lxMFFCOOVyHCEwGBaWguB7nl++gQyMnZKBQLQ
 zmVRr/tyiQUjJNnsh5UFlgmqS0ke4eMTP1q3y4wfF+pjeY5vKIFaweAA37mGG37AiH7o
 GtkZDi5Ud/LK1q+FYHBKt9gZ3z37rwMeCCQUVA90L73HKUYkvkopHI5R12yyll8By7c8
 Su2g==
X-Gm-Message-State: AOAM5320aCbrurEbHUOLPTbL+SJY04DYz8VrrXgOdU4ngAdBIajFTzyf
 PZfV75yLddtOG1sPbUPKNeC4AQ==
X-Google-Smtp-Source: ABdhPJx6twpOFiNUXkHrytF4tAaeP9jbL+fIEfsueCOWmVBETzURbZy1jFgpbjKAN/zJfi4NlaTIRA==
X-Received: by 2002:ad4:4e86:: with SMTP id dy6mr6025332qvb.4.1611552430534;
 Sun, 24 Jan 2021 21:27:10 -0800 (PST)
Received: from independence.bos.jonmasters.org (Boston.jonmasters.org.
 [50.195.43.97])
 by smtp.gmail.com with ESMTPSA id x49sm10447908qth.95.2021.01.24.21.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 21:27:09 -0800 (PST)
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
To: Florian Fainelli <f.fainelli@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Claire Chang <tientzu@chromium.org>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-3-tientzu@chromium.org>
 <20210106185241.GA109735@localhost.localdomain>
 <CALiNf2-HDf6tFcvVgCttr-ta=88ZMH=OvB5XoryTPc6MNvwV+Q@mail.gmail.com>
 <20210107175740.GA16519@char.us.oracle.com>
 <aa5af7d1-779e-f0f6-e6ba-8040e603523f@gmail.com>
From: Jon Masters <jcm@jonmasters.org>
Organization: World Organi{s,z}ation of Broken Dreams
Message-ID: <a843a970-afec-6541-c54b-4bc2a3c4750a@jonmasters.org>
Date: Mon, 25 Jan 2021 00:26:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <aa5af7d1-779e-f0f6-e6ba-8040e603523f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 25 Jan 2021 17:39:52 +1100
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
 paulus@samba.org, will@kernel.org, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, Frank Rowand <frowand.list@gmail.com>,
 Joerg Roedel <joro@8bytes.org>, rafael.j.wysocki@intel.com, mingo@kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>, dan.j.williams@intel.com,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, iommu@lists.linux-foundation.org,
 xypron.glpk@gmx.de, linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/7/21 1:09 PM, Florian Fainelli wrote:
> On 1/7/21 9:57 AM, Konrad Rzeszutek Wilk wrote:
>> On Fri, Jan 08, 2021 at 01:39:18AM +0800, Claire Chang wrote:
>>> Hi Greg and Konrad,
>>>
>>> This change is intended to be non-arch specific. Any arch that lacks DMA access
>>> control and has devices not behind an IOMMU can make use of it. Could you share
>>> why you think this should be arch specific?
>>
>> The idea behind non-arch specific code is it to be generic. The devicetree
>> is specific to PowerPC, Sparc, and ARM, and not to x86 - hence it should
>> be in arch specific code.
> 
> In premise the same code could be used with an ACPI enabled system with
> an appropriate service to identify the restricted DMA regions and unlock
> them.
> 
> More than 1 architecture requiring this function (ARM and ARM64 are the
> two I can think of needing this immediately) sort of calls for making
> the code architecture agnostic since past 2, you need something that scales.
> 
> There is already code today under kernel/dma/contiguous.c that is only
> activated on a CONFIG_OF=y && CONFIG_OF_RESERVED_MEM=y system, this is
> no different.

<unrelated to these patches, which are useful for the case cited>

Just a note for history/archives that this approach would not be 
appropriate on general purpose Arm systems, such as SystemReady-ES 
edge/non-server platforms seeking to run general purpose distros. I want 
to have that in the record before someone at Arm (or NVidia, or a bunch 
of others that come to mind who have memory firewalls) gets an idea.

If you're working at an Arm vendor and come looking at this later 
thinking "wow, what a great idea!", please fix your hardware to have a 
real IOMMU/SMMU and real PCIe. You'll be pointed at this reply.

Jon.

-- 
Computer Architect
