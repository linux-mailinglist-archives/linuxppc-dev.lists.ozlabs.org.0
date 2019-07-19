Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB856E26B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 10:26:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qkbq4PCszDqvp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 18:25:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="i55FhmBI"; 
 dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qkYg29xHzDqsJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 18:24:07 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id ay6so15273473plb.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 01:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZQn0T9exEKB2fsCzKTS/DQ/EOo9g9+Gw4FCegE9zDBg=;
 b=i55FhmBIFcVUduYAxcjHGxSZC1ZdIWRXjyG/jhVFIbm4jdXzp+t2YvOrx85I4cjy5q
 CpWykVwfvfaj+emR0caAQdR+bREWgXAOvsOiCqS4cxq4ih9eBSBqTM5NFjoKD5c3Rl1n
 7xuW3O4H+E8I3h9mR73Z6XQwpT6++Aiv8Yt+04TteqtvqPsYw/7Xui7/ViBEO2FieODF
 yIaoVDibTNGBhxuqoMAs+b2x3b+to7G8CQRXDvyuQhIigCy0Xy7iv3E+kdHNLPMD1j82
 FSYOnHa7BCkRmkf/1ood+a0WjYGb3ofkVW559/sR8W9qay2z8QZb5ydrf6RAQ027Wm/Q
 o1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZQn0T9exEKB2fsCzKTS/DQ/EOo9g9+Gw4FCegE9zDBg=;
 b=fBbZkyzAInaGh8l5VWfYnPrGIHeWYuD4i66icuJjHSPgcq+jdHMibJz6u/oLf2C7iD
 CbZvXy4dpwDAr2tyk+MPhnz3uQYyaDkCfg4FJIItB9qMA3HB+Emh/rFDzvr44JEaW02C
 1TY0dHS3IgLxJX6H8UrNdq6ZqUNGFFyxPEa2DlEKRi9vWd9k9radMSLd1hhyNj8hB/HK
 aYuBPvgtiX5IS9KSSE/hrA4/dCVKMeNyRGpx+giLY5RZwbCxa6XECmeCco5tcvrEL1LT
 IGZf5hNL4Bhqb9Bpv+axSPEVkYKfF6CqvGzpDbqXq44jx2F0TYKBZykGQFP1a2WM5r1F
 UVGw==
X-Gm-Message-State: APjAAAXPiQMRZhbnw37vbz+bRNnpTPl5pzpNArZ+XnMDJG9ETYSi9kYL
 GD7rtHPsT6lgyLs0U8omcgZC1XgEpXs=
X-Google-Smtp-Source: APXvYqxNpijJIKAz82ezpLVh9p9rNFke0SKLKOinJsaowJaZ6uGY/qIHs3FHSXITWlaZFxka01UKIg==
X-Received: by 2002:a17:902:ea:: with SMTP id
 a97mr55006692pla.182.1563524643384; 
 Fri, 19 Jul 2019 01:24:03 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id g2sm12430503pfi.26.2019.07.19.01.24.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jul 2019 01:24:02 -0700 (PDT)
Subject: Re: question on "powerpc/pseries/dma: Allow SWIOTLB"
To: Christoph Hellwig <hch@infradead.org>
References: <20190719071014.GA1922@infradead.org>
 <0f969485-a3fe-4436-a448-5f4c4f875cb2@ozlabs.ru>
 <20190719075348.GA2892@infradead.org>
 <33ba562c-1a87-58e2-4105-520834d5b969@ozlabs.ru>
 <20190719080532.GA3861@infradead.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <14c9591a-5c8d-12a5-ed25-b7a41e0b1ad7@ozlabs.ru>
Date: Fri, 19 Jul 2019 18:23:59 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719080532.GA3861@infradead.org>
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



On 19/07/2019 18:05, Christoph Hellwig wrote:
> On Fri, Jul 19, 2019 at 06:00:25PM +1000, Alexey Kardashevskiy wrote:
>>> But shouldn't we force usage of the direct ops in that case as the
>>> IOMMU is not neededed at all?
>>
>> We do, for mappings, but not unmappings and syncing.
> 
> Well, I mean as in literally not setting a dma_ops so that the
> dma_direct code is used without the indirection through the iommu ops.
> This is not only more obvious, but also faster as you avoid the
> indirect call (although that probably doesn't matter much if you
> are bounce buffering anyway).

I was not precise. We cannot avoid IOMMU in the guest for passed through 
devices.


>>> Also isn't that support non-upstream so far?
>>
>> How is this relevant? I expect the existing "swiotlb=force" just work.
> 
> I though the whole secure VM support was still not upstream.

It is getting there and I still do not see why "swiotlb=force" should 
not work if chosed in the cmdline.


-- 
Alexey
