Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A72B35D8B6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 09:19:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKH6X04Dqz3c0T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 17:19:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=fnKyc9Kd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=fnKyc9Kd; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKH6518qLz30B4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 17:19:05 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id z22so2592478plo.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 00:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lqoytvQxyJi0mXN8dD9+NrRIGe02hFmGhllQY8hVABk=;
 b=fnKyc9Kd73v7xEgx2vXRmbxfj2VHqObBrIWnJyCt1g2ndz4BS3kaW48SpzZIB/7XGc
 JdRRXFb5i5aU5Z4sIvQqcfteO1WjyIBaMgt4WURXdjqAOsBkrxZEayAfGL9WjtpusWwf
 6twlSBmxjLF1PIIjkutVAVkMog/v5V5IvcxMJMkkwABsD5fyHvR6gGJxqGSdt9PQRjJJ
 uM8gdoTLaEpJRiBTF95pHxoZxovNchiJWBQtMV9eaLpMudJKd4DeaJaPhBIoqTK9vmUW
 TOpanCypzuL6n0Jbgfg+qO8Wi+stHI4PTmkX1Gs+eSIpls66crwYjhE4OAr5lDjnXXcV
 FBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lqoytvQxyJi0mXN8dD9+NrRIGe02hFmGhllQY8hVABk=;
 b=amjN7efQVcTdxPtwb6OIt2dj97hgHYkWRC8cqCXOJf2X6vOp0FZ/sb0Y1oUVNYoAbf
 aYNEMnEGZzaoGBHYrGpVKFo7PX9AOnanW5zmSKYXg12Z6q5sJeBiyyqY29LiZlw9PXg0
 mNL52AFHMTaBjnS6IEtzFVlqbDMsvhmIWSnDM6rG4pd0/o5OdPnVRsSsr82Jvvx8pC6Q
 ByoyR3x0yfPW4aN7aj/aGXjkEcW0lBMen0shxhTHy3E4D6qPHfV6SSHHgtRUVdJ71gSi
 jbHxm3+1P0Eiwuhh/NcI6lFQills4h7A+KaQMZjAVXavGV1R9tfATzKY2ad+L2mBIB1X
 6DuQ==
X-Gm-Message-State: AOAM533bxpPb3Dg9Z304XHA0GfhOQrRbwRSEre6BPY3ThOxU6dQopDPe
 Tz3fFv9V4M25PR7md2whG9xCKw==
X-Google-Smtp-Source: ABdhPJwnXB9iWfGcWSRm35Zd5iNQJMuX9v+v/KD48QLCJjtLkiStOU72NXSuNE4GODoPN52q+lBxUA==
X-Received: by 2002:a17:902:9b8b:b029:e6:b027:2f96 with SMTP id
 y11-20020a1709029b8bb02900e6b0272f96mr31407999plp.28.1618298344041; 
 Tue, 13 Apr 2021 00:19:04 -0700 (PDT)
Received: from localhost
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id 4sm1359125pjl.51.2021.04.13.00.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 00:19:03 -0700 (PDT)
Message-ID: <94ef78d5-467e-0492-4b7d-90077fe37343@ozlabs.ru>
Date: Tue, 13 Apr 2021 17:18:56 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH v2 13/14] powerpc/pseries/iommu: Make use of DDW for
 indirect mapping
Content-Language: en-US
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-14-leobras.c@gmail.com>
 <f3bc958f-a656-6481-0a19-3cff4dd3a4ff@ozlabs.ru>
 <0c6eef8181aeb69d69ce72ec86c646dfa7591414.camel@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <0c6eef8181aeb69d69ce72ec86c646dfa7591414.camel@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 13/04/2021 15:49, Leonardo Bras wrote:
> Thanks for the feedback!
> 
> On Tue, 2020-09-29 at 13:56 +1000, Alexey Kardashevskiy wrote:
>>> -static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)
>>> +static phys_addr_t ddw_memory_hotplug_max(void)
>>
>>
>> Please, forward declaration or a separate patch; this creates
>> unnecessary noise to the actual change.
>>
> 
> Sure, done!
> 
>>
>>> +		_iommu_table_setparms(tbl, pci->phb->bus->number, create.liobn, win_addr,
>>> +				      1UL << len, page_shift, 0, &iommu_table_lpar_multi_ops);
>>> +		iommu_init_table(tbl, pci->phb->node, 0, 0);
>>
>>
>> It is 0,0 only if win_addr>0 which is not the QEMU case.
>>
> 
> Oh, ok.
> I previously though it was ok to use 0,0 here as any other usage in
> this file was also 0,0.
> 
> What should I use to get the correct parameters? Use the previous tbl
> it_reserved_start and tbl->it_reserved_end is enough?

depends on whether you carry reserved start/end even if they are outside 
of the dma window.


-- 
Alexey
