Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2D66E233
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 10:02:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qk4Q3WLqzDqWt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 18:02:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="eGmoIeAL"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qk2T5JwYzDqfK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 18:00:31 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id l21so14107353pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 01:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WChktbJEDC4B0RScC7Nm6QHNRvVt5JFgxbtgeAMG0SA=;
 b=eGmoIeAL3LbIt6SK5G017SA6r4nrmIZvaqkXY5zZKYC/JjlDmT/kwhVVrkR4dU22Zr
 ArQsw3SBMxXqcqo9m6wVxmaJdRCWkyyQXYfaPc4h9f1vqrDxWVFcJBY+pSfv8zeb4n0K
 t23bhUDsSg9UQxm7SmefSOyg7NPtNHF5XnolvoyWBtR5Q7ionsXxJzK4ZNDT1OP7peNA
 JY+3H5n1uXG/kxSIWxGCDK64an39Pj6mSKjpEMauz2a9tVrtccHB6PofQmn4shmErrjl
 LGfsRScFweKS21DaYl7kqlBWhu59sHQrHdYlhIYehbP9DefEs3DWqWYSh3LWluEIyolX
 QsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WChktbJEDC4B0RScC7Nm6QHNRvVt5JFgxbtgeAMG0SA=;
 b=ksYGIM4nVCEgSpm13LOa13EUusf8+Lbtn5pLSTpuGsLgEDkfmT8OcfMCNIz9m+ldKn
 pbmkLP7Nuit5AZYBB/IYyK+5As8dtrx/VFFP9/c/gq5Ci0/6FKlLaPhGbIebz8hImjFt
 xJrxBzqop/IPP/TH3rHcegvGCwe6u4QWS0T0z7iOJKKcxdqroLaKRkAldO/rGVXEubmD
 /tDJiq+9IhSTNlMsaAZPjjDSDHAaZa2wMQs4qdng3p8uuCExULPCQ4QdGgTyyO7iMdJT
 V50ySZNuu223JcFlrfLymAHdsd7ICW85T93a/5wftWLMdhjlLzBf3rxS5V9M09xR07do
 ZoSA==
X-Gm-Message-State: APjAAAU1x26ADqZLX0kLOzOLKuZO3s4HRsIiILHX74HmECBf0oNSqTUo
 QUVBSaROdPWqUmPfXMH/fWub1sOxS/s=
X-Google-Smtp-Source: APXvYqzh1K0yZcawmsmsJsm1Qz6chjcMs1m/XOcOMA+tDyOu6QMhovXevkY9aht8mGBnlgGmhBHlpQ==
X-Received: by 2002:a63:714a:: with SMTP id b10mr18284277pgn.25.1563523229027; 
 Fri, 19 Jul 2019 01:00:29 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id j6sm41052843pjd.19.2019.07.19.01.00.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jul 2019 01:00:28 -0700 (PDT)
Subject: Re: question on "powerpc/pseries/dma: Allow SWIOTLB"
To: Christoph Hellwig <hch@infradead.org>
References: <20190719071014.GA1922@infradead.org>
 <0f969485-a3fe-4436-a448-5f4c4f875cb2@ozlabs.ru>
 <20190719075348.GA2892@infradead.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <33ba562c-1a87-58e2-4105-520834d5b969@ozlabs.ru>
Date: Fri, 19 Jul 2019 18:00:25 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719075348.GA2892@infradead.org>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 19/07/2019 17:53, Christoph Hellwig wrote:
> On Fri, Jul 19, 2019 at 05:52:37PM +1000, Alexey Kardashevskiy wrote:
>>
>>
>> On 19/07/2019 17:10, Christoph Hellwig wrote:
>>> Hey Alexey,
>>>
>>> what is the use case for the above commit?  Shouldn't we handle all
>>> addressing limits using the iommu?
>>
>> Our secure VMs is the use case, when only a fraction of system memory is
>> available for DMA.
> 
> But shouldn't we force usage of the direct ops in that case as the
> IOMMU is not neededed at all?

We do, for mappings, but not unmappings and syncing.

> Also isn't that support non-upstream so far?

How is this relevant? I expect the existing "swiotlb=force" just work.


-- 
Alexey
