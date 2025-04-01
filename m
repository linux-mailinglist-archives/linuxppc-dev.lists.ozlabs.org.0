Return-Path: <linuxppc-dev+bounces-7413-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE350A77BE1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Apr 2025 15:18:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRpV61bMpz2yqf;
	Wed,  2 Apr 2025 00:18:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743513518;
	cv=none; b=T31czpDWBC9pyjx2PmVULyZ5xYBDw/+Wzmo3mCoVsEy5ydY7jwAEHHASR+umY/R5Ez6CxlyobbvaK8MuIrSGXjyGf4N+y/SJz983beazLggB00gX3oKHhng9LXoNZmH6bfEs1Lidsx6wiZNBPc1klIccyk9vomfKGA+HECmFwtsYCAHqlBw3jWrtBRfMRb6q98xKwgeiJhOQcpjumfAjNhQrcs5QqsYaoHjanmYTNehRQBGvvZspWiRLCg0wx21mnm4PwmcGR0NMTqCbKrFWIm5+4QfkN4GdSdE26jSXxbF9VrZVe8Ls4eyC4Qp2aepUkLJ0ljaSrtQSqNTWYhapUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743513518; c=relaxed/relaxed;
	bh=AHAHZnRaWT2kEHEFw/h+fXhuvxH77Ryny+INUOk6P78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CzmxA5hyxHt0VvH+ItJ+3he5V1fN05xGX90eO/gQE4mu/aJE26gl0qpiinb8fyuTt5d/o63GbcjI0SaDGJqWkRel0useK+nlUDjDZ2EYLXtqwQeh1kvOnqWlTK+YnDRtzm8fhGGFMv7HImg7smZ13YxoCoKhBWA5Qr0HsPgyzk9mnEb4KCc4J3j5f8bmTrzBZzQTuDQlmpHjqxuwsWU7mZUwfY9ycvw0+1vBs8cr0ASB9D/cHJkXgdhjmHnHLJbspLdYJZ3nlMGE+Qincw/qDlUBQ5e+RDHMtFb9rTuIJ8lkNxRMfT6XbEDs1E1LCa74ap2mUDW4nqithSwIR94IcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.dk; dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=blxtl4oP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=axboe@kernel.dk; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.dk
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=blxtl4oP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=axboe@kernel.dk; receiver=lists.ozlabs.org)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRpV40gWXz2yhG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Apr 2025 00:18:33 +1100 (AEDT)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3cfeff44d94so19628645ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Apr 2025 06:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1743513511; x=1744118311; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AHAHZnRaWT2kEHEFw/h+fXhuvxH77Ryny+INUOk6P78=;
        b=blxtl4oPCK5MEbWovBVa7jIpO5Zb/8B8S1r2EZmuX3JEvRdSiXD+6uwWQlEj/OA5Rj
         545vZZvsEScBQ4Wa/kzUMkAWPvlfjcc2mTwMlm+D3ZBsZeAii0+WLrViPvIwkem4uFo6
         oXgRDA4lh1Svl9nxNo+KjfJuz5x558EtcYZ/X7X4wlcc5Vy/lMnVsR35hi9qmF7FzWqC
         N2G+J9K9w7O5ijrbPmyJI2HZvZtAk2PeN1ZnFSPM0cvwc6H/ozHIPrOBzhQrOeVxe1PE
         7N/M8ICIqGIS5kawXoGEGjRWjE6vgTn1K8nG5qmRn2aGCqvXBLNxwLPFy/U2VI5cnljl
         vt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743513511; x=1744118311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AHAHZnRaWT2kEHEFw/h+fXhuvxH77Ryny+INUOk6P78=;
        b=RsaJL4rW1BnkkyXnAdZJ11JsNBPerXGVnvzJTq6bx8ohNWk/6YaDPgzEGUk5irGNld
         4kQqhaOIw9Fj1RHrdN0ddEDaneyNkQmCXynYlNLKhDoIkUZ3rpgj4ab+TFblf8PsMpTn
         YvCUAODq/k6j2Y1kCH8uQ2y6nAK6T0aDYQncTbxF/+rquUnjPA4ZkYoBIpOy9UbVwIh5
         60F7BM67XoKIOivdfUZd/nUQIkV6mtZIBxexU6OwluxbSZtmwMcyQk1mGAERn9N8V6Ne
         AgKSriBOOfxKh67JIVQpZjLTprUkmJFboakODXJMSkDa8+v+2OmWe00MM5HvhRegMirF
         Aq5A==
X-Forwarded-Encrypted: i=1; AJvYcCXrM728ZUwwEtsAt/KcH+a9Bg0BmV95emhEzfFtIvHSZUNCVJVqAeSexADJRwt12E68L9nIZWz7mjsKGnA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyA1qJhnTAl9vlt2yzDNwF/WLY1hXHdHyXb5aykcWjywvnFgUyY
	A2Xu0imi5tWFUTYOvtddTtpAaibaFIhQv127VeJrjD8JpHpaXXER/XTfrzY/I4s=
X-Gm-Gg: ASbGncuBwDGDhytQ+/GC3SCQUDmM8OPdOwD0izv82KILQzErC6HNvPP/Cd2Tua1DriF
	O/FwECWZLQXcvrkzEGQnLSPCNtI/1TaZKgrkE+W6obRk3tOA3fg3dJGzn1GD/1ZjV7+K/dQR/v1
	BJGYzsiZ1uAc27B1hEbqatM4BD7GyffWpLlroiD07UnIGF4+2uhemyQqeA4Uj+aEOxX4+V16rHR
	e0SrADsmDplR7oHMJALlLlTVbIeiycgSiMi3AhUmpuNL8MHYlJa0syBMD6Z+irdDUXWtHEEPxVT
	8OQ0/fXATdp3Jvp9/dkhz0EQCVyp0LzCuNFdc+YPig==
X-Google-Smtp-Source: AGHT+IFVnPkYjUDSgEcAEBlaOmmh5aK7tQ1ZzesCShYnYzsQMsgfc7WnH26Fxa32XvQ7Qw4imigY9Q==
X-Received: by 2002:a05:6e02:17ce:b0:3d1:78f1:8a9e with SMTP id e9e14a558f8ab-3d5e0a0d2c2mr126004175ab.20.1743513511570;
        Tue, 01 Apr 2025 06:18:31 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4648cc61csm2379600173.141.2025.04.01.06.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 06:18:30 -0700 (PDT)
Message-ID: <500a6b67-9ce0-4a74-9ae9-59ee0d4990d4@kernel.dk>
Date: Tue, 1 Apr 2025 07:18:29 -0600
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] block: ps3disk: Use str_read_write() helper
To: shao.mingyin@zte.com.cn, geoff@infradead.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, yang.yang29@zte.com.cn, xu.xin16@zte.com.cn,
 ye.xingchen@zte.com.cn, feng.wei8@zte.com.cn
References: <20250401192139605xby4g5ak51tei46zArAT8@zte.com.cn>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250401192139605xby4g5ak51tei46zArAT8@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 4/1/25 5:21 AM, shao.mingyin@zte.com.cn wrote:
> From: Feng Wei <feng.wei8@zte.com.cn>
> 
> Remove hard-coded strings by using the str_read_write() helper.
> 
> Signed-off-by: Feng Wei <feng.wei8@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  drivers/block/ps3disk.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/ps3disk.c b/drivers/block/ps3disk.c
> index dc9e4a14b885..b7fe90b6fdef 100644
> --- a/drivers/block/ps3disk.c
> +++ b/drivers/block/ps3disk.c
> @@ -9,6 +9,7 @@
>  #include <linux/ata.h>
>  #include <linux/blk-mq.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
>  #include <linux/module.h>
> 
>  #include <asm/lv1call.h>
> @@ -233,7 +234,7 @@ static irqreturn_t ps3disk_interrupt(int irq, void *data)
>  		op = "flush";
>  	} else {
>  		read = !rq_data_dir(req);
> -		op = read ? "read" : "write";
> +		op = str_read_write(read);
>  	}
>  	if (status) {
>  		dev_dbg(&dev->sbd.core, "%s:%u: %s failed 0x%llx\n", __func__,

If you're doing this, why not kill off the useless 'read' variable as
well?

-- 
Jens Axboe

