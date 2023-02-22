Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4BA69F471
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 13:22:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMFfB0Grrz3cBK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 23:22:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PO25MBZG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PO25MBZG;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMFdG1qKbz30Bp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 23:21:36 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id i31so3468239pgi.10
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 04:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J0zIsh8Bj6elQ9e9ElCXMRZbUBkH4I43/+9DyamMhIU=;
        b=PO25MBZG0E5W+OEJqoSOY28lOrPlpC98wfgUrwfFl9o/K+CNuPRFRtbMMX1ZACCz6L
         iCOxFx/aEj9Y54aVINJGEzirvgKl4EkoDZeus2NxpV6gH88FMHaHSHX8W9Dxf/VTEct6
         ylwB7ByycxIJwgbXpS+D7jiZpDvlJv6nHZTwN7z1ztcnt2woaqh62RUKox96t2R4Ddj9
         m47AT3EPv4tm9IUmhMZ5ux8J+SJzAJxpTJqV4bGsN0xrwQuUhyNMisp6OBrtwsD30fDD
         ojaZl8rGX8YydcmY6VIPCPdSR3Mj+Us6156OWKJ2Rtbsd0lpfVAsI1f3kQggcqEStusk
         2IgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J0zIsh8Bj6elQ9e9ElCXMRZbUBkH4I43/+9DyamMhIU=;
        b=qHS/bjhFo+nS1GsLyQJU18wnsTBo2FufdZ8Nj2CbXO3EmDb0zvHU57OZ7XXb7fQxtm
         3p/Z25xHIYN7rndmvLrPvUF3BUs7uJ5bST9WYze+ZUMN/TsiX0AHslVoF0tJacPlJdbV
         zpADn3GkB6OVtR/fnADDTVZ9d0Ybg5iPG6o3Jf2xbFHl8LbD3R21qfOd9eg4lR7Lp7mB
         P/Cai5Uwzq9NMk+Rk0PYfRjzxDkB4pxTdokz4IXvpy0JCjjd9U5YTOEcyEXaXSpWig8c
         PnQWaVJQXy/lsVzryQ25AE8eZkU99MRuIwsExrCWtXQ7y5X5upRjYB3Ouggk/lUFGEt4
         NMrg==
X-Gm-Message-State: AO0yUKV/tfzaXOItx7AKZkAs9GwHrf+m+WbrMXXcRz4D//K+Obt/JwgL
	zwJLhxTHOPybzlNj9zbCR08=
X-Google-Smtp-Source: AK7set8PxiycLre5bahVPAidCVKEo+/sb6ZGb0Kk6FEAdx0lylT2Lhxy5yALgrciJiMuqWECmJWEUQ==
X-Received: by 2002:a62:1784:0:b0:5a8:b2a0:9b4d with SMTP id 126-20020a621784000000b005a8b2a09b4dmr7743376pfx.15.1677068491547;
        Wed, 22 Feb 2023 04:21:31 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-68.three.co.id. [180.214.232.68])
        by smtp.gmail.com with ESMTPSA id a20-20020aa78654000000b005a8bfe3b241sm1743795pfo.167.2023.02.22.04.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 04:21:31 -0800 (PST)
Message-ID: <d96f1c64-a82a-afde-0ecf-3b1dab6510a8@gmail.com>
Date: Wed, 22 Feb 2023 19:21:24 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: linux-next tree panic on ppc64le
To: Murphy Zhou <jencce.kernel@gmail.com>
References: <CADJHv_tWJKgqfXy=2mynVG0U2bJaVqYo59F_OPfdRRptNOV-WQ@mail.gmail.com>
 <c69dc6be-9642-2876-5375-d536f49d0403@gmail.com>
 <CADJHv_tzBWoGDBfNCsg-HKt8aKacXgmvY31mS47y30XkNyAw4w@mail.gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CADJHv_tzBWoGDBfNCsg-HKt8aKacXgmvY31mS47y30XkNyAw4w@mail.gmail.com>
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
Cc: Linux-Next <linux-next@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/22/23 16:13, Murphy Zhou wrote:
> next-20230221
> 
> I'll try powerpc/next.
> 

OK, but next time when you reply, don't top-post; reply inline
with appropriate context instead.

-- 
An old man doll... just what I always wanted! - Clara

