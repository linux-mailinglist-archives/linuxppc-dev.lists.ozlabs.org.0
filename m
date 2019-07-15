Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F68685BB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 10:49:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nHJH2ZFgzDqX2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 18:49:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="lFxF4rWk"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nH9h2rx3zDqbW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 18:43:20 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id m4so7383524pgk.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 01:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OaKAOydO6Eon6t3R6eew+1Egio0Y9f+rY8NqFNAOM9E=;
 b=lFxF4rWkOrQ9QXhs7QgRj2naJtwp9gcWy0JaoEI8sUk57Lbl4Ng+P1YrnLHNe/L/2s
 6LbUdDBNo4FaziIpL5Dfo/hwz5pdQx0bzbXVCV7lZgnciS8gkfacmqlHMmzwHtSfasoR
 UOJM598EU0B0mUqal2FkW0zVLFhCjA7cb2LFMuZ9pyLmEUCEbwoCn+c0C7lUNTd2HWhm
 bvI1VltfulG5U27cOZAdfAl0tJhPKIA2AJlzQflMOu1gk334P4aYqPWU5jtP30S7CvEh
 u7n4ymk6ggo/39n+W/TQsm48tzksDVh06mj3PGQMipzwb9TPp++mmiZsyg7VUDnx3pXA
 CKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OaKAOydO6Eon6t3R6eew+1Egio0Y9f+rY8NqFNAOM9E=;
 b=ZHLDWurCUkUx4+qKctqpRHU2DH9TPayx6JBvemzaXcVofSLH9n25tTVKeoiGw10JFq
 roQNJHvly/jpDz20JlRiuZTzhClYOQLn3udqMHIAwXJpZD4mPLJ7+Ih1t1aZ2P2d6M6W
 ekM20DMBmWCJIFAKf68TdxanDBtANF30SiyfuKj2Bvt/J61xTCHVndfe6EIfVt1VVmlv
 st3iMMQhvnRSLSa7auMfnuMwWApWI2GofqCU2RolHvqBLWwpgPH7vgPk1I30JAUKXB1j
 aU4NnAKCgeAx/JEUG7hE/XkI15ZEiktQ1HClUs4CHZaIpsZDOQXpbna+/U423t1YGJSZ
 jRBQ==
X-Gm-Message-State: APjAAAUEmrHEPvDSUqewWI2Pub6vrnJ5g7MDe4iZ+BtBh/0YZLou4O0N
 I9C5tot8VKLgnJZBugwgaOc=
X-Google-Smtp-Source: APXvYqxL6PWxc/xJ7PrdEl5mHHOU2v/jWjiEJvgHl/pG8OLfKGhI/VfWa7dW1RowRmVed8srh3t/Bg==
X-Received: by 2002:a63:7245:: with SMTP id c5mr11228100pgn.11.1563180197748; 
 Mon, 15 Jul 2019 01:43:17 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id x22sm19643621pff.5.2019.07.15.01.43.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 01:43:17 -0700 (PDT)
Subject: Re: [PATCH kernel v4 0/4 repost] powerpc/ioda2: Yet another attempt
 to allow DMA masks between 32 and 59
To: Christoph Hellwig <hch@infradead.org>
References: <20190712094509.56695-1-aik@ozlabs.ru>
 <20190712152800.GC3061@infradead.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <44fe9d2e-0793-13f9-e0eb-4ff649e229a5@ozlabs.ru>
Date: Mon, 15 Jul 2019 18:43:12 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712152800.GC3061@infradead.org>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 13/07/2019 01:28, Christoph Hellwig wrote:
> On Fri, Jul 12, 2019 at 07:45:05PM +1000, Alexey Kardashevskiy wrote:
>> This is an attempt to allow DMA masks between 32..59 which are not large
>> enough to use either a PHB3 bypass mode or a sketchy bypass. Depending
>> on the max order, up to 40 is usually available.
> 
> Can you elaborate what you man with supported in detail?  In the end
> a DMA devices DMA capability is only really interesting as a lower
> bound.
> 
> e.g. if you have a DMA that supports 40-bit DMA addressing we could
> always treat it as if supports 32-bit addressing,and I thought the
> powerpc code does that, 

powerpc does that and this is what the patchset is changing as people 
complained that 2GB DMA window has bad effects on AMD GPUs (cannot 
allocate enough buffers) and 40/100Gbit devices (lower performance), I 
do not have the details handy.

> as the DMA API now relies on that.

Relies on what precisely? If a device cannot do full 64bit, then it has 
to be no more than just 32bit?


>  Did I miss
> something and it explicitly rejected that (in which case I didn't spot
> the fix in this series), or is this just an optimization to handle these
> devices more optimally, in which case maybe the changelog could be
> improved a bit.


4/4 did this essentially:

-	const u64 window_size = min((u64)pe->table_group.tce32_size, max_memory);
+	const u64 maxblock = 1UL << (PAGE_SHIFT + MAX_ORDER - 1);
+	const u64 window_size = min((maxblock * 8) << PAGE_SHIFT, max_memory);

where tce32_size==2<<30. The 4/4 commit log has the details, what is 
missing there? Thanks,



-- 
Alexey
