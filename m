Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B509750007
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 09:23:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hxINpudt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hxINpudt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R18P54lMxz3c1l
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 17:23:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hxINpudt;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hxINpudt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R18N90tvHz3bkD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 17:23:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689146581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EeR3QS0to/DqY2bB2MsY9aijuKAPyyHA7YBvuvP948Y=;
	b=hxINpudteX50rybup4QpUqNOEHTofMAPgqBJAWF4qEnFEyV0zWGOGiePpuvdOdRlSKvLzW
	lbbXIObdPFpbRAWNvq8LbA0o0u+5whHJVcCoRh/NWDHf7kPEzgBaNm4/wnFye+CEd3wCGx
	pMP2GgDRN6yuNr9Q97BiNoizsWy0onA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689146581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EeR3QS0to/DqY2bB2MsY9aijuKAPyyHA7YBvuvP948Y=;
	b=hxINpudteX50rybup4QpUqNOEHTofMAPgqBJAWF4qEnFEyV0zWGOGiePpuvdOdRlSKvLzW
	lbbXIObdPFpbRAWNvq8LbA0o0u+5whHJVcCoRh/NWDHf7kPEzgBaNm4/wnFye+CEd3wCGx
	pMP2GgDRN6yuNr9Q97BiNoizsWy0onA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-OQxxi_lXN9CPQQclFhy6zg-1; Wed, 12 Jul 2023 03:22:59 -0400
X-MC-Unique: OQxxi_lXN9CPQQclFhy6zg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-30932d15a30so4201780f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 00:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689146578; x=1691738578;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeR3QS0to/DqY2bB2MsY9aijuKAPyyHA7YBvuvP948Y=;
        b=B0KkkrjVKgc18WPCaZAhDlw8QLsns+/3E6eISsarRJUnuiES5ZhMjMMCurSP1z0A2p
         gZjX1wjmNrDc99kzqhGG2khKzQ5oTfW6NKVDUz2DAfXkIq6WiVF++GU0Lcembzzpqt+a
         Fl3Hb0JeRQ/PLT4pmZdgTuOXZkedyNZJq6i3zZZ1KrYP11h30eaJc3NyFCOmOjrTFx2U
         SBqnvw85SKuUg3bUzxxxKH2+5c2GK+kOgZqRP/dENLTEmil1jRIt/zkxtmg2wdrNkdnP
         63yhr2ioSI2Zfz2V4stogW3aMALAYM375HErB/iMir5qrAQby9L9Y5u3mwB5Hi9t0M2c
         iOQQ==
X-Gm-Message-State: ABy/qLYPkcYhxf/UisvvkfDJXaVljPwTNsQllL5Yf0cqLXbf1JKl8H7n
	rkAtlbC7qHTWIWc5ejFMDvMXyJilu6f1svYSQ2pb+KSFj+CVwHG+cW4hYyH0J5y27CbEmmf5c7M
	lYS8nfKCx/gfdVLKZs3tNqybCKA==
X-Received: by 2002:adf:fb01:0:b0:315:96ca:dcab with SMTP id c1-20020adffb01000000b0031596cadcabmr9622407wrr.35.1689146578407;
        Wed, 12 Jul 2023 00:22:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGomYcWQ/XjYm7yp82hAebaVhQCX5yL7rEd66/QkdDzyKYkyHxNEVV3WcmmW7loEO8e5SBIQQ==
X-Received: by 2002:adf:fb01:0:b0:315:96ca:dcab with SMTP id c1-20020adffb01000000b0031596cadcabmr9622388wrr.35.1689146578042;
        Wed, 12 Jul 2023 00:22:58 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:3700:3eea:ace6:5bde:4478? (p200300cbc70737003eeaace65bde4478.dip0.t-ipconnect.de. [2003:cb:c707:3700:3eea:ace6:5bde:4478])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d4e04000000b00313de682eb3sm4200483wrt.65.2023.07.12.00.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 00:22:57 -0700 (PDT)
Message-ID: <57dd0568-ee56-ff8d-3ba3-a9089a2ab386@redhat.com>
Date: Wed, 12 Jul 2023 09:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 4/7] mm/hotplug: Allow pageblock alignment via altmap
 reservation
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
 <20230711044834.72809-5-aneesh.kumar@linux.ibm.com>
 <b44ce7ab-7fcf-3f1b-4bca-3d5d12838812@redhat.com>
 <ccda3be5-1e44-145e-7b46-2e420935b1d6@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <ccda3be5-1e44-145e-7b46-2e420935b1d6@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12.07.23 05:16, Aneesh Kumar K V wrote:
> On 7/11/23 10:49 PM, David Hildenbrand wrote:
>> On 11.07.23 06:48, Aneesh Kumar K.V wrote:
>>> Add a new kconfig option that can be selected if we want to allow
>>> pageblock alignment by reserving pages in the vmemmap altmap area.
>>> This implies we will be reserving some pages for every memoryblock
>>> This also allows the memmap on memory feature to be widely useful
>>> with different memory block size values.
>>
>> "reserving pages" is a nice way of saying "wasting memory". :) Let's spell that out.
>>
>> I think we have to find a better name for this, and I think we should have a toggle similar to memory_hotplug.memmap_on_memory. This should be an admin decision, not some kernel config option.
>>
>>
>> memory_hotplug.force_memmap_on_memory
>>
>> "Enable the memmap on memory feature even if it could result in memory waste due to memmap size limitations. For example, if the memmap for a memory block requires 1 MiB, but the pageblock size is 2 MiB, 1 MiB
>> of hotplugged memory will be wasted. Note that there are still cases where the feature cannot be enforced: for example, if the memmap is smaller than a single page, or if the architecture does not support the forced mode in all configurations."
>>
>> Thoughts?
>>
> 
> With module parameter, do we still need the Kconfig option?

No.

Sleeping over this, maybe we can convert the existing 
memory_hotplug.memmap_on_memory parameter to also accept "force".

-- 
Cheers,

David / dhildenb

