Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 586683CF462
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 08:18:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTT6J1bsBz3bfG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 16:18:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bOgMs8/x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::431;
 helo=mail-wr1-x431.google.com; envelope-from=ckoenig.leichtzumerken@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bOgMs8/x; dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTT5p3dwpz2yPC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 16:17:33 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id t5so24669687wrw.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 23:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YUv373TRbJzpXEjq3/HXrealkqxY3Zrlb077s3lFdTo=;
 b=bOgMs8/xCj3eL2F7zv7VyLj1GImGnX1zf134Xe6YHmA2mts3mLnezy0+UqqSc5zAQr
 rZTYdWF62QMA9Y2AQ9c84CetJ/S9098g1PKmMOTPQsf1Z8qHfW59aSXlBo3gZGfnTHAs
 ZMJF69i0jYBhucxfkoNoN6oQ3ljI8kCA9Mzkot6CtiTX0pNx/Ftgc08KVtmq83kRi8TY
 Zu74g2JPRQSTs+Yfhs+fQ8xzLKYK77YcT2p/vvL3UdrjMb503/9KWYdDpS/9mIxAd3+h
 1lt6uIfOVzluOff/N/ZIJVD1o+J/Hnlc6V49Ch8ASNlS94shqy4wgbnAywPZAL56SnHQ
 A5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YUv373TRbJzpXEjq3/HXrealkqxY3Zrlb077s3lFdTo=;
 b=VqR989quNsCSYVqi93qXqsgz+PWu0NwqldMhQlsYOtcAtxmzeOwmOdULtQ6cz3zeQ7
 r+zegj0jMOn0xt12ahB0KvQtYkzYrh9Np7Ts91eUJ9lObwpe60cUpd95rXGjNMiXeUMK
 3mrc6pdny9o5kR+d1h5EaxIyh6owvG1RSKNOpw7+Ne3alC/BcQ/Nn0UyeuATq4p6gyfO
 k9e6hvIYqQyd7ReZWvsVy3pzG38Gl89eRq1PdSKlJG5T7y+GsPvNKmC616gOw3ZVMm7a
 eXpjIscwSLgcd/U8Dsv19T98YmXoFaLB1ryY8lNp4ge6dr4ODQnBWF96Kqew+TNlfXV5
 UA9w==
X-Gm-Message-State: AOAM533ulkBWvmL5dtsRUGj53a462BfJCjzR4scWJl2JdQlZQoZOAJEe
 aiAGtCKHCfeEx+Ek8Yfi1DQ=
X-Google-Smtp-Source: ABdhPJwrP8qAYB5H7g+4sskeYriO2f1L15Hn6rZR7pEzSwo+pLKcVZRB8fz5WUDNgJkBh3jw60V5TA==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr34880575wrm.413.1626761846576; 
 Mon, 19 Jul 2021 23:17:26 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8651:5b5e:8648:2fd0?
 ([2a02:908:1252:fb60:8651:5b5e:8648:2fd0])
 by smtp.gmail.com with ESMTPSA id o19sm9990450wmr.18.2021.07.19.23.17.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 23:17:26 -0700 (PDT)
Subject: Re: [RFC 0/2] Add generic FPU api similar to x86
To: Anson Jacob <Anson.Jacob@amd.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, amd-gfx@lists.freedesktop.org
References: <20210719195211.520428-1-Anson.Jacob@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cd330e45-f8e0-8751-813a-98f1810881c1@gmail.com>
Date: Tue, 20 Jul 2021 08:17:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719195211.520428-1-Anson.Jacob@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: Sunpeng.Li@amd.com, Bhawanpreet.Lakha@amd.com, qingqing.zhuo@amd.com,
 Rodrigo.Siqueira@amd.com, roman.li@amd.com, Aurabindo.Pillai@amd.com,
 Harry.Wentland@amd.com, bindu.r@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While you already CCed a bunch of people stuff like that needs to go to 
the appropriate mailing list and not just amd-gfx.

Especially LKML so that other core devs can take a look as well.

Regards,
Christian.

Am 19.07.21 um 21:52 schrieb Anson Jacob:
> This is an attempt to have generic FPU enable/disable
> calls similar to x86.
> So that we can simplify gpu/drm/amd/display/dc/os_types.h
>
> Also adds FPU correctness logic seen in x86.
>
> Anson Jacob (2):
>    ppc/fpu: Add generic FPU api similar to x86
>    drm/amd/display: Use PPC FPU functions
>
>   arch/powerpc/include/asm/switch_to.h      |  29 ++---
>   arch/powerpc/kernel/process.c             | 130 ++++++++++++++++++++++
>   drivers/gpu/drm/amd/display/dc/os_types.h |  28 +----
>   3 files changed, 139 insertions(+), 48 deletions(-)
>

