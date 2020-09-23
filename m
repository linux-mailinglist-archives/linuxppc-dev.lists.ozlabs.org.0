Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F1E276215
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 22:29:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxVC649ZWzDqZj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 06:29:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=hkallweit1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=R4uunmiD; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxV9J0YDbzDqSm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 06:27:45 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id c8so1107217edv.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 13:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RLmDO0N9ccoJ8u92C25jHjrEVWeg8b6n7yD+xz6k+6Q=;
 b=R4uunmiDiELoVRTK827oOM2OMeXozrpPuXoZZcSF5pgIdW8NYAxGFzg3nSNbZrx45g
 pOMecXhBY11U3aILDB0bY+hGPhL13YUWLIaBRmvg9OX0KKgoY+wDsUI0MU+xQ1lFCI6T
 8+i3FtRwPhBuygoYwV24I/aeVyesVkyx4nOaci7WI/+TDBioBAU2a9HEbif38XHLpwxX
 uPcl7fsa+BR/7TZW/swADfQ9+JrZF2XFnxZBn57c31JfaWxnQGqdCSTVYTywws23bBap
 safe//+Lkqq/XJAsUq523v/LZl4HaQosc1H+oUsMhLGGh3Rw4IR7MPn4VymTBxTWvYX1
 OxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RLmDO0N9ccoJ8u92C25jHjrEVWeg8b6n7yD+xz6k+6Q=;
 b=qZI+KPNS7Yzt5I6jJgFDfsHGYR9luZyw2NYuIVnwMSHJk+nN2r4uNk3mYfLB67zxBv
 RDKy0/+KPdbgZgbNl7SswDDPftTJhJPn6wuLnE49kgv4MnkWTFFmAiLZdkKZGMSG7u55
 PazoiH7M07GhLzYYX3TdH56RSrvwmb9K/VMzRnOk6AydFvtXyZDNiW2ZgfMLan4yZYKP
 5OELa2kXOZO5Q+UoGzHqNWqGJDm3RW0TiBFp3yWGqWSxNIXfrJLR98/Ru9EyKcMqaVC9
 3D0Zc4vhKIiOPCVgkHntpL2wz5MJCzVWy/S1c8hi4tU4YxG3k25V+K1LTnn/gpjG28pu
 Pmmg==
X-Gm-Message-State: AOAM532Ouma0x36Es+K09IU1IhS5+XcNztXT2W8BJ346WiqR/AwrdYcl
 Uc0rfrOV8wUHzz0YWaPujXs=
X-Google-Smtp-Source: ABdhPJzihFfmrxDThRVVULdh2IhBYV10mRR9tpYrkebJinnFPte5DuLo1wiPQv0HxGX0M2zxoLLi0A==
X-Received: by 2002:aa7:c61a:: with SMTP id h26mr1114145edq.254.1600892861107; 
 Wed, 23 Sep 2020 13:27:41 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f23:5700:9dd1:2d79:8cda:7fd2?
 (p200300ea8f2357009dd12d798cda7fd2.dip0.t-ipconnect.de.
 [2003:ea:8f23:5700:9dd1:2d79:8cda:7fd2])
 by smtp.googlemail.com with ESMTPSA id r9sm708481ejc.102.2020.09.23.13.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 13:27:40 -0700 (PDT)
Subject: Re: [PATCH] spi: fsl-espi: Only process interrupts for expected events
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, broonie@kernel.org,
 npiggin@gmail.com
References: <20200904002812.7300-1-chris.packham@alliedtelesis.co.nz>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <ec77cf82-5ef1-c650-3e8a-80be749c2214@gmail.com>
Date: Wed, 23 Sep 2020 22:27:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200904002812.7300-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-spi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04.09.2020 02:28, Chris Packham wrote:
> The SPIE register contains counts for the TX FIFO so any time the irq
> handler was invoked we would attempt to process the RX/TX fifos. Use the
> SPIM value to mask the events so that we only process interrupts that
> were expected.
> 
> This was a latent issue exposed by commit 3282a3da25bd ("powerpc/64:
> Implement soft interrupt replay in C").
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: stable@vger.kernel.org
> ---
> 
> Notes:
>     I've tested this on a T2080RDB and a custom board using the T2081 SoC. With
>     this change I don't see any spurious instances of the "Transfer done but
>     SPIE_DON isn't set!" or "Transfer done but rx/tx fifo's aren't empty!" messages
>     and the updates to spi flash are successful.
>     
>     I think this should go into the stable trees that contain 3282a3da25bd but I
>     haven't added a Fixes: tag because I think 3282a3da25bd exposed the issue as
>     opposed to causing it.
> 
>  drivers/spi/spi-fsl-espi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-fsl-espi.c b/drivers/spi/spi-fsl-espi.c
> index 7e7c92cafdbb..cb120b68c0e2 100644
> --- a/drivers/spi/spi-fsl-espi.c
> +++ b/drivers/spi/spi-fsl-espi.c
> @@ -574,13 +574,14 @@ static void fsl_espi_cpu_irq(struct fsl_espi *espi, u32 events)
>  static irqreturn_t fsl_espi_irq(s32 irq, void *context_data)
>  {
>  	struct fsl_espi *espi = context_data;
> -	u32 events;
> +	u32 events, mask;
>  
>  	spin_lock(&espi->lock);
>  
>  	/* Get interrupt events(tx/rx) */
>  	events = fsl_espi_read_reg(espi, ESPI_SPIE);
> -	if (!events) {
> +	mask = fsl_espi_read_reg(espi, ESPI_SPIM);
> +	if (!(events & mask)) {
>  		spin_unlock(&espi->lock);
>  		return IRQ_NONE;

Sorry, I was on vacation and therefore couldn't comment earlier.
I'm fine with the change, just one thing could be improved IMO.
If we skip an unneeded interrupt now, then returning IRQ_NONE
causes reporting this interrupt as spurious. This isn't too nice
as spurious interrupts typically are seen as a problem indicator.
Therefore returning IRQ_HANDLED should be more appropriate.
This would just require a comment in the code explaining why we
do this, and why it can happen that we receive interrupts
we're not interested in.

>  	}
> 

