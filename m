Return-Path: <linuxppc-dev+bounces-15091-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 543C8CE7165
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Dec 2025 15:41:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfzRn03sjz2xpg;
	Tue, 30 Dec 2025 01:41:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767019268;
	cv=none; b=NtlZGiwGnFUWjph5qlL3OqSm3FbRHEJQycbSMylkApkq+XLe/GXG+YW8rwt5HEYtnF+muAV57123G3SqqqWATjETLNeOQGcOC1XHP7w/Sauxs/8pHG+pNH2iNlJBLAu/KkKytgS2lJSNSZZePLEINGhxzO+s9pn3+lWm3R6rlAQV58+YCSSbIUWdm9zi0jQCvr54L8WG99dzbjI9HCkgH2xTBmnbB+A2BP/3UdHLEdEvXOactyqq1CSm7BN2dNZ23Sac1KXd0Uo91kap4GUWay1fpPbZRm/vzKYL0MogO3mDLBxU1xlDIhhxOc70Sp0j82EUD0XEkZKlRNYW7xgH8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767019268; c=relaxed/relaxed;
	bh=3tId5XV5kYSQY/kLmA9NWqwvSnJZ5ff10lBlcCOD+Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZareZx4fygEvislGGxiEbfupcJV1klGjCjnzTeprCcNWjFncafHCfBZiN6AqJVm2jvwzjF8U2u2vaN5KofyxYg1tYkhoUkX3WuD89naV66isi7GYuReAYm6P6upZ8i3l/3C60kSQ+udF/gtJ1w1lQiYuYmy4brAw7goT6kMR+1vR/kXp3IuIcK7f88/ung+4ho2i2W5t7G24NDj72vzVD7SYRXINhy9sVoiCx49BucyrRmsw9naPb1hu+MDH9+BkL8HGjf5QHNvsJ5QDcp42ciRbnBR79Hf5LDqELVLehBoQxLNGVZZ133Rod2iGxxiAM2wsDGitJgzJPKsr2zvgVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=beFiUDyn; dkim-atps=neutral; spf=pass (client-ip=209.85.218.47; helo=mail-ej1-f47.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=beFiUDyn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.47; helo=mail-ej1-f47.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfzRg01C4z2xdV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Dec 2025 01:41:02 +1100 (AEDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7355f6ef12so1754372966b.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Dec 2025 06:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767019197; x=1767623997; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tId5XV5kYSQY/kLmA9NWqwvSnJZ5ff10lBlcCOD+Ow=;
        b=beFiUDyn3IpocmKmCXEaPhEKyxZM5lPq0oLO/keeDb0IXCYeLvjjAdghzk3M7cmXeG
         fsQXo1ng4sB2WX8BB70dlxYKe1NTAkUUWwsj8PvkZSCW+Zqvjq8UP/lgOLU7kpUak4uM
         0AAVjrnGIxTVBm6UgdBRXqfdKB97YoSwa4EDG0Ochn7RM7Z2dW641m4MVfg8lHayzCBN
         4VKMeECeDYWcDTkyOqcwgq1DUqeejF+jJzEEWjfCfyPjY8tAXax9QjUYx+aNMLSVD99c
         tmZxk+smYNu98o6L1Ue7Xanbt3uBPFR2WUpnIrk7t7O+KSupL6HVQfEhyRVH1SzZiu5f
         XyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019197; x=1767623997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3tId5XV5kYSQY/kLmA9NWqwvSnJZ5ff10lBlcCOD+Ow=;
        b=YaVkdmW9HQe4fOdYPML42nC+O/cDr6sh4gWSjW4CDICgp4/wDuOqwmoXTtOPfsqhd6
         Q7Q6FV4cbwha/5MVXWY18eMuKyijnbB4vWhpQ6GIvuJ+DHeJ+fk7oFo6HuDzI3i8fXk/
         jmnG395mOAEtTHrkbZIy0GjFfpA9KrfoTHmxOPVERtSj24v/1YAyCgHc34QOR0RnO7PP
         qtiZIh8L8uTCIXO1+tV5Cw4rJMZoJ4G6/NDpAx3PAUzsHqQC+osZCl437FeQ/Lb3cKfv
         FARpc9Quk8WFigrcrdWVBbXv34xH/7x6EBPgy2CE//qks/zSY9tQAJKQdFwc+tfLsi8d
         hv7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBCu4svh3MfOjCQ2RV73CLDHsyYP4YoQJ8GIuk3W7NVZnVizQFWta+owdf7THqUaF93r30Sr18Hy8BoFU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz2grGK9OAmXBz3w3liTzwGKIJKLTccUGImWJ1G+F7Vk6ypEqJx
	6cz5bPU9FGGXVttDm0U2ucn2j0sZpJJCZzMbQx2YVACyzF+IhNYWwB5NwlMEyg==
X-Gm-Gg: AY/fxX4EqFuCC+IJRqrZNAeNSRti5n2errBK/igi3fwnM0ydvAsnzEFFmwckCb0538V
	NRXCVAFu+2LRQTSCQoz0f3MokAgJG89GACQZ3ltxUAcokyPIPXL9mYkti0kjjqy5HG8Te/OLZWC
	ZZKeqmnGvI1MEr3CR2N1i/+Bw1+Nn+WQa6EeWQYDlDxXNzPEldMI74HqSMfcm97i+qyKU2HywHl
	TVxgB6l1PPJ3XHEsmJsYwDfaS50uODFr3mE1Maz28Vuo5CEffleYBEspCscdDSZIxFFyrc4kKNj
	+Z9kWFsBh9XGqBTF3muc6RuD7A8JmYQwT+p0zr4qlLT/a8FN762BftPqrb8f03iLAs1+/n1GF7h
	uiWPJdW30b7IuxTar4LlhYQ1HUyegP9XWvzaDOYmqGT+7BLiYbvTRb2hRexjI2UPvosPUuz4yZa
	OWBRH/LNKYCj5QddZtB6VE6cT6K6rprxMFsz4pSXqsIrscCDCDd43F
X-Google-Smtp-Source: AGHT+IFZx2XByZDcGoz6k0dVTKejmOPtpNe6KoB1/QAoZpQAFG17i3uYtYslAObNd+vt7plTaXSkLA==
X-Received: by 2002:a05:600c:c0c7:b0:47d:264e:b37d with SMTP id 5b1f17b1804b1-47d264eb725mr245790195e9.22.1767013332883;
        Mon, 29 Dec 2025 05:02:12 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3ad0c60sm245250335e9.5.2025.12.29.05.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 05:02:12 -0800 (PST)
Date: Mon, 29 Dec 2025 13:02:11 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: fsl_easrc: force cast 'val1' to u32 for do_div()
Message-ID: <20251229130211.49b169a0@pumpkin>
In-Reply-To: <20251229085919.3952347-1-shengjiu.wang@nxp.com>
References: <20251229085919.3952347-1-shengjiu.wang@nxp.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 29 Dec 2025 16:59:19 +0800
Shengjiu Wang <shengjiu.wang@nxp.com> wrote:

> Fix below cocci warnings, the real width of val1 is 32bit, so use force
> cast to avoid warning.

I just looked at the uses of 'frac_bits' in that file.
Some of the related code looks very dubious.

The 200 has:
	val = (u64)in_rate << frac_bits;
	do_div(val, out_rate);
	r = (uint32_t *)&val;
followed by uses of r[0] and r[1] - that probably isn't going to DTRT big endian
and will generate worse code LE than using val and val >> 32.

Line 2063 has:
	val <<= (frac_bits - 31);
	regmap_write(easrc->regmap, REG_EASRC_RUC(pair->index), EASRC_RSUC_RS_RM(val));
where EASRC_RSUC_RS_RM(v) is (v) << 32
That is a lot of shift lefts on an 'int'.

The code in question can shift 'val1' right and convert to 32 bits
before ctx_priv->ratio_mod is added in.

	David

> 
> cocci warnings: (new ones prefixed by >>)
> >> sound/soc/fsl/fsl_easrc.c:1999:2-8: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.  
> 
> Fixes: 27147695aaf7 ("ASoC: fsl_easrc: define functions for memory to memory usage")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512281902.bPsKjjkC-lkp@intel.com/
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_easrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> index f404a39009e1..16a45a7146e8 100644
> --- a/sound/soc/fsl/fsl_easrc.c
> +++ b/sound/soc/fsl/fsl_easrc.c
> @@ -1996,7 +1996,7 @@ static int fsl_easrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buff
>  		/* right shift 12 bit to make ratio in 32bit space */
>  		val2 = (u64)in_samples << (frac_bits - 12);
>  		val1 = val1 >> 12;
> -		do_div(val2, val1);
> +		do_div(val2, (u32)val1);
>  		out_samples = val2;
>  
>  		out_length = out_samples * out_width * channels;


