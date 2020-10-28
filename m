Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A03B829DA0D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 00:13:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM4BY6lnJzDqZl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 10:13:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=SpwfTtMc; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM48b17dvzDqSg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 10:11:53 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id 133so708020pfx.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 16:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9KLgU2ii04BMgmi9GJzMZxGva6u6t/mvJPjkoxUhr74=;
 b=SpwfTtMc6fpZxAapRbEYqZhJ275joqIjQxSqHFrK4Yekqe+Gh2zz6qdapj9A1/J6xI
 foQfDDB0AVcez/2sNAO+Vh7ZW8qJCyoy9o3KnSyOfL1YPG6414L3YyOl4Njh8oZ8j6cN
 k/wpFmINd26rcv9udGDVOqncEZKOYKWgN538CHGj59P1jCeuXhh4uJhVDNt/VOl8thrA
 6gQgeAs5qDBHuJGVR26BnE+b3PWJaR95jKJGVTFY9pcLxUn1YiPeNXt/l0VYXsG6V6rf
 jRAzk4WcwmAviBfA8VMWZx8MtjV20TQ/6IZFDqchgrG1GICr9zCbtwiBXkLs+Jmdbxyv
 Ab1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9KLgU2ii04BMgmi9GJzMZxGva6u6t/mvJPjkoxUhr74=;
 b=rW7uOxAgdBa7JdVOl4t3pc35hITpCldX6i8PDS+lnV99zFa0LxANjJbvXbG8cbSCak
 T9HSQS5oszsZZSBRLfgfSBBH0xlzIP21DQH/hDWy6dsxs8H+B8OJuuIw3aI+Z0BkYNpR
 EI48ckoWTgLUeU4bTWyIYQ5g4hq5ySxANf5/47O7WnrIqUElVYEC8jm2lr/u3RNgZSOS
 50xjyoI3cItf0yq5w5FPlFXf2AgA82QHaZExMz18DfsMljGuO7yM2vwPWTaDIiTsppNO
 uMXklL/SvJY91/QPakQpTp8WTXoEa4f4TjXgIPDlOajMG2RcE6Y0+I/foRBiSTiLEm+5
 mfuA==
X-Gm-Message-State: AOAM530cFZAaqrV/Lk8RPX45XFAQgdLeb30LyajPHhNxVSYMZTUF+sj2
 V9kJNcHWDIiXPlKaK7FcOWnRtQ==
X-Google-Smtp-Source: ABdhPJy00goGFzfZHxvXhNS7gg6ez4rHGE2d6wvUjsKkNkmVUyn+UFMehJccnUwS8rJlbF8q7y3A5Q==
X-Received: by 2002:a63:1649:: with SMTP id 9mr1419124pgw.91.1603926711033;
 Wed, 28 Oct 2020 16:11:51 -0700 (PDT)
Received: from [192.168.10.88] (124-171-72-187.dyn.iinet.net.au.
 [124.171.72.187])
 by smtp.gmail.com with UTF8SMTPSA id q5sm449440pjj.26.2020.10.28.16.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 16:11:50 -0700 (PDT)
Subject: Re: [PATCH kernel v2 1/2] dma: Allow mixing bypass and normal IOMMU
 operation
To: Christoph Hellwig <hch@lst.de>
References: <20201027101841.96056-1-aik@ozlabs.ru>
 <20201027101841.96056-2-aik@ozlabs.ru> <20201027164858.GA30651@lst.de>
 <28147035-500d-f3cd-f283-257066343697@ozlabs.ru>
 <20201028172106.GA10015@lst.de>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <f4420b19-05cd-5817-9ba4-8f6f166a7e5c@ozlabs.ru>
Date: Thu, 29 Oct 2020 10:11:45 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:83.0) Gecko/20100101
 Thunderbird/83.0
MIME-Version: 1.0
In-Reply-To: <20201028172106.GA10015@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 29/10/2020 04:21, Christoph Hellwig wrote:
> On Wed, Oct 28, 2020 at 05:55:23PM +1100, Alexey Kardashevskiy wrote:
>>
>> It is passing an address of the end of the mapped area so passing a page
>> struct means passing page and offset which is an extra parameter and we do
>> not want to do anything with the page in those hooks anyway so I'd keep it
>> as is.
>>
>>
>>> and
>>>      maybe even hide the dma_map_direct inside it.
>>
>> Call dma_map_direct() from arch_dma_map_page_direct() if
>> arch_dma_map_page_direct() is defined? Seems suboptimal as it is going to
>> be bypass=true in most cases and we save one call by avoiding calling
>> arch_dma_map_page_direct(). Unless I missed something?
> 
> C does not even evaluate the right hand side of a || expression if the
> left hand evaluates to true.

Right, this is what I meant. dma_map_direct() is inline and fast so I 
did not want it inside the arch hook which is not inline.


-- 
Alexey
