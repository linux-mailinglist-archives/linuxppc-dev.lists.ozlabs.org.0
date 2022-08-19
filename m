Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABA859A96F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 01:28:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8dHG4mFtz3f8D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 09:28:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linbit-com.20210112.gappssmtp.com header.i=@linbit-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=agmJAUC8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linbit.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=christoph.boehmwalder@linbit.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linbit-com.20210112.gappssmtp.com header.i=@linbit-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=agmJAUC8;
	dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8QY40V3cz3bYG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 01:24:54 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id u15so755024ejt.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 08:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=QcjuSMkjgvmcMVSZtEnP4HKDq1IJJzuLOO5WZsbK0+U=;
        b=agmJAUC8jfOsl/gS4hT8lv5H6fTz01qf2pe3Iv5R9j9Ate9ewR22RfAhjEhwJ6X7ah
         6i2gUSjqWAQUwG7vDL22TL3OJ2DhWyK4iGyCxaZDkZBo8C5fdnjLhkpYDW7Sa1kKJ0m9
         nTTLPu80zYWs5VKFI/soqsQZ2m3SZwMJLkyAN+lFaM/+QA0zpsdobhOAVHSxJY09NVpJ
         unBTEPM3BaQo8lZAI/3LxHBqdI4Xtjfj+l91HslXfgpBHq8BMYj8CpA31LlMMIn6dSW8
         vv42Aj7Ht2909aymuONX4UFmgeVzYDTPM0HNunn/RXfrH17hgsFeGl4AuF4WAgPFBbnL
         B9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=QcjuSMkjgvmcMVSZtEnP4HKDq1IJJzuLOO5WZsbK0+U=;
        b=Zuf4Tage1AvkmJgQ/h+RVCi91f8XjqWbyJlvnB4ZOguMXhEH3IMtvlMlTK4n5lVo9u
         ISgQMOsE1L3cVcOGJtXPnEwWcqFWdPN1Jkqvf85gc0BuA7ASyh8dNODRtrMNy+/o2UTE
         KetSV9/TJBkiJT5e1+wk+Ni2ZCgrUTs2pSBYD+h5KGzpW50iuKlnx2AAUFA1Qb8mrTHe
         JbfnenTNNf7lKj/5DrglPaOwkUILWm6esR5T60qwdHSE/I+HTQNNDuank/216lMqBR/d
         5G/MUMQVK/vJX1am50MdUJHme+uZR+qpEmzcQV2d5Gtl6MDcxeL/jAkdrOkPbYOXm5x9
         Ng/Q==
X-Gm-Message-State: ACgBeo2uQMEfU065wpzdH6Pc+cK4jl5T94aZL98m0WxGCMCLtOykzmuj
	kTc3z3ztCplLd7z1PgrPsQPJ1A==
X-Google-Smtp-Source: AA6agR5mq+T7k3AHmZCAgqpwHVwskje+A0igISLSMji1ANW7KLAUFwidL9UZ9jQ29SXqclEdOTfxgg==
X-Received: by 2002:a17:907:7fa5:b0:730:5d54:4c24 with SMTP id qk37-20020a1709077fa500b007305d544c24mr5248538ejc.641.1660922691995;
        Fri, 19 Aug 2022 08:24:51 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at. [82.218.28.181])
        by smtp.gmail.com with ESMTPSA id h10-20020aa7c60a000000b0043cc2c9f5adsm3270313edq.40.2022.08.19.08.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 08:24:51 -0700 (PDT)
Message-ID: <a6d3e3a8-f0a6-dffc-c3b6-45d81efc7664@linbit.com>
Date: Fri, 19 Aug 2022 17:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] block: move from strlcpy with unused retval to strscpy
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20220818205958.6552-1-wsa+renesas@sang-engineering.com>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220818205958.6552-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 20 Aug 2022 09:27:17 +1000
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
Cc: Jens Axboe <axboe@kernel.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, Geoff Levand <geoff@infradead.org>, Philipp Reisner <philipp.reisner@linbit.com>, Jim Paris <jim@jtan.com>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org, Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 18.08.22 um 22:59 schrieb Wolfram Sang:
> Follow the advice of the below link and prefer 'strscpy' in this
> subsystem. Conversion is 1:1 because the return value is not used.
> Generated by a coccinelle script.
> 
> Link: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/block/brd.c               |  2 +-
>  drivers/block/drbd/drbd_nl.c      |  2 +-

For the drbd part:

Acked-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>

>  drivers/block/mtip32xx/mtip32xx.c | 12 ++++++------
>  drivers/block/ps3vram.c           |  2 +-
>  drivers/block/zram/zram_drv.c     |  6 +++---
>  5 files changed, 12 insertions(+), 12 deletions(-)
...
> diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
> index 013d355a2033..864c98e74875 100644
> --- a/drivers/block/drbd/drbd_nl.c
> +++ b/drivers/block/drbd/drbd_nl.c
> @@ -4752,7 +4752,7 @@ void notify_helper(enum drbd_notification_type type,
>  	struct drbd_genlmsghdr *dh;
>  	int err;
>  
> -	strlcpy(helper_info.helper_name, name, sizeof(helper_info.helper_name));
> +	strscpy(helper_info.helper_name, name, sizeof(helper_info.helper_name));
>  	helper_info.helper_name_len = min(strlen(name), sizeof(helper_info.helper_name));
>  	helper_info.helper_status = status;
>
-- 
Christoph Böhmwalder
LINBIT | Keeping the Digital World Running
DRBD HA —  Disaster Recovery — Software defined Storage
