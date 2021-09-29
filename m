Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7982041C0F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 10:48:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HK95g2mScz3086
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 18:48:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=jtn0jGIc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=jtn0jGIc; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HK94y6lhnz2xrP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 18:48:16 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id c4so1027567pls.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 01:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:cc:in-reply-to:content-transfer-encoding;
 bh=ZQRPGDnBGJonDmWlRby4UA+FFasdTsHdgMXphGq+CjU=;
 b=jtn0jGIcYV8KseGUptQj292Loqd9OYZuEXo0FZ2TllIzxsWSufGnhbm8pbI78D136e
 fuw8amW9G2drgIuVokmm1GCDucDd9Rxa19w9dOodmRBGCXmS9lhKOUnPS88B2OAU2icX
 VnLAVFxdRyNVLy3xzAM2nSlPs6w2cJj2x6u/ck5+30Wg5VzkZCtCGgM4GAXAsURoottW
 jCYnbsnjEeoDq9JKjsmSKQAIZdSJhdFO8NUW1JgXvNjOvlFBRWVcXDGKcHaLI0LtTdmK
 se3+HjvH04c3GHaisRTqVPapKxf9z+V8qAFXZSDeE5fbPNP7H4Aj+2RN7Y7cysdT30Q8
 zZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:cc:in-reply-to
 :content-transfer-encoding;
 bh=ZQRPGDnBGJonDmWlRby4UA+FFasdTsHdgMXphGq+CjU=;
 b=JBbajySujfWOIVxEM3qHSvmS269A0Q87+uxXmmQjsZLzYAviYGtLuNyHJMACYARDE0
 d94dOAb3L9Zqh/UL/sN9pCo9GVxSj9gKwEJbDsE8KEWYmVsHUgd9aAK76Kz4piwqa7PC
 jIso9PLNATNC04f7/WeOOMB0L6wT8VvxZKtvOvpUSDUJP2uFJ3raKzaf8XTKBcVP5qG4
 yx/lTDUbmw72BuLURnS5TF6CaG3tSgrUzvm0k+uXLKFqps1CDQF44HRK53ZLSz6MmJeO
 T0ObowIsm0chHnwemjy5uFTVcE27xPznM/LdttqCFAuE33v2dg1R+xus26mQ6Upfsxdm
 XKFQ==
X-Gm-Message-State: AOAM533LYuw/VWbew+by9cHBdxsNHjPieAyOqlbVYTjtwAqAgCskBRIC
 jKdO4G7BNiGtvLZ8lEgW9vXWfw==
X-Google-Smtp-Source: ABdhPJxJvp0/rVxYGvoVFn5N56POBu9bIRiy1nazI/XyYnaanoTbF3RvOWH2i0JfcKgu09BydTMlxw==
X-Received: by 2002:a17:90a:ead1:: with SMTP id
 ev17mr5245837pjb.158.1632905292640; 
 Wed, 29 Sep 2021 01:48:12 -0700 (PDT)
Received: from [192.168.10.23] (124-171-108-209.dyn.iinet.net.au.
 [124.171.108.209])
 by smtp.gmail.com with ESMTPSA id w6sm1737797pfj.179.2021.09.29.01.48.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 01:48:11 -0700 (PDT)
Message-ID: <8bb9bfd4-f481-e9e6-34d1-fea78ace864f@ozlabs.ru>
Date: Wed, 29 Sep 2021 18:48:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:93.0) Gecko/20100101
 Thunderbird/93.0
Subject: Re: [PATCH kernel] powerpc/dma: Fix dma_map_ops::get_required_mask
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20200908015106.79661-1-aik@ozlabs.ru>
 <20200908054416.GA13585@lst.de>
 <94353228-2262-cfa1-7177-7eed2288ca63@ozlabs.ru>
 <20200908121937.GA31559@lst.de>
 <1746dd66810.27bb.1ca38dd7e845b990cd13d431eb58563d@ozlabs.ru>
 <20200909075849.GA12282@lst.de>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20200909075849.GA12282@lst.de>
Content-Type: text/plain; charset=UTF-8
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
Cc: Carol Soto <clsoto@us.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 09/09/2020 17:58, Christoph Hellwig wrote:
> On Tue, Sep 08, 2020 at 11:10:03PM +1000, Alexey Kardashevskiy wrote:
>>>> a-ha, this makes more sense, thanks. Then I guess we need to revert that
>>>> one bit from yours f1565c24b596, do not we?
>>>
>>> Why?  The was the original intent of the API, but now we also use
>>> internally to check the addressing capabilities.
>>
>> The bigger mask the better, no? As it is now, it's limited by the window 
>> size which happens to be bigger than 4GB but smaller then full 64bit (48bit 
>> on my system)
> 
> Yes, the bigger mask is better.  But I don't see why you'd want to
> revert the dma bypass code for that entirely.


Ok we have another victim of this change:

https://github.com/torvalds/linux/blob/master/drivers/scsi/mpt3sas/mpt3sas_base.c#L3007


It calls dma_get_required_mask() to know "the mask that the platform
requires to operate efficiently" (from dma-api.rst). The current
upstream returns 31 for pseries which in no way is efficient, we can do
better so we need this hunk back (but just this one):
https://github.com/torvalds/linux/commit/f1565c24b5965dfd2352f209c417ff160be04db9#diff-18e87e1863bf902c6388d72ad99467b7fcec0dd37084636d96ad5a35a3e59904L156
(well, almost, move it above the !tbl check).

This does not hit us on powernv/upstream as that returns 44 (or so) and
the mpt3sas driver (which does the right thing afaict) just assumes that
">32" == ">=63". What do I miss here? Thanks,

ps:
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20200908015106.79661-1-aik@ozlabs.ru/#2528801
is the rest of the thread I am replying to.


-- 
Alexey
