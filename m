Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3662676B684
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 15:59:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VwPraxCe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFcDS0hFyz3bT8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 23:59:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VwPraxCe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFcCW5TC7z2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 23:58:46 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fe1489ced6so9275242e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Aug 2023 06:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690898317; x=1691503117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9LCAsr2bIL8kLMgkEwkdI+MgOLqKLakMLSAWcTBAIPs=;
        b=VwPraxCeRIr2mAW9uLS3E1/rWkUsOFaKUUwtl5DRFP4MAwgK6s8t3MTB+pSty7hiU0
         vAbe3m1AJM5QMtYLXqCLXQtDM9GKEKyysMuWgczAMYNGC6kNV7bucErLjdVFC4TSUM3p
         P9fgJGHDX8mAw16H57HZcG1xNLdIMVZBMBDoU7NBBtSLC8V6RJYR5G2xDvjQJq4ljzAL
         kACOqBSZewUf3PNLkJtg//OAJKCuvTXRSjsPLj6vPsqsJNzhbpDizI9uwnYcTzbFp/o3
         Ga5RHWYQabbaAgpChUI9ZoT52HMfbp9guSuW0o0v7GfpGa+pY8vlrmWeWfbC/kIDH2Lc
         3AMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690898317; x=1691503117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LCAsr2bIL8kLMgkEwkdI+MgOLqKLakMLSAWcTBAIPs=;
        b=hgtFAW5mcXNHV7FMBjUysXD0cdjbTB5EEOf3vZcPWmh5LYJCBA9sfqMaR4Pz8w2aww
         5/6ncJf8MJ1A+HZD99wUQU0BlvmLrjVWPLmIHQqkIbAdIgev2sIyDIlnImXFOpLxnoaS
         JQKFLDs/8jZLFQeGB+5oyaCZdhv0zjLELyHF6kjwNEZgVinhpYMjk7Dqzc5Z0dox72EM
         wtQ9co85vWjePNPO2CiM7JaVCBXsMsTTiwwxQs4MNNo1lbjRvZ+L1hpDQL8hV2vHY6OA
         +ML6dmP5i2BIsjaaI2duNikwDUXym9CrDjAE641KejXXCJVWmikkP7qWWyAPDnvyUFWC
         5wiw==
X-Gm-Message-State: ABy/qLZqVIUtowQ8jZ8gXZz5su85o9GQiTUzKFYLQ3X+q/lZIqSKQJmm
	ozeK3tDkiz+67huDnFU1U0sJGb2n+Z0WJTnbwRw=
X-Google-Smtp-Source: APBJJlEoNwnh+Ebgn0hDAnQlavgKTJxX9UrRWcPCk34A/XO9GiTaGag7RkbaBBxz7XtW7k0d504mj057GMahDehAfac=
X-Received: by 2002:a19:6514:0:b0:4fb:845d:9e8f with SMTP id
 z20-20020a196514000000b004fb845d9e8fmr1871744lfb.53.1690898316655; Tue, 01
 Aug 2023 06:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com> <1690265540-25999-2-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1690265540-25999-2-git-send-email-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 1 Aug 2023 16:58:24 +0300
Message-ID: <CAEnQRZCzUkpE-ppSDqBzhTXZHphr+twSju=snSiMii9gR=v0nA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/7] ASoC: fsl_asrc: define functions for memory to
 memory usage
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, linuxppc-dev@lists.ozlabs.org, broonie@kernel.org, sakari.ailus@iki.fi, festevam@gmail.com, perex@perex.cz, mchehab@kernel.org, shengjiu.wang@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +static int fsl_asrc_m2m_check_format(u8 dir, u32 rate, u32 channels, u32 format)
> +{
> +       u64 support_format = FSL_ASRC_FORMATS;
> +
> +       if (channels < 1 || channels > 10)
> +               return -EINVAL;
> +
> +       if (rate < 5512 || rate > 192000)
> +               return -EINVAL;
> +

I think we can avoid using magic numbers. Instead we could do:

#define FSL_ASRC_MIN_CHANNELS 1
/...
#define FSL_ASRC_MAX_RATE 192000


> +       if (dir == IN)
> +               support_format |= SNDRV_PCM_FMTBIT_S8;
> +
> +       if (!(1 << format & support_format))
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
> +/* calculate capture data length according to output data length and sample rate */
> +static int fsl_asrc_m2m_calc_out_len(struct fsl_asrc_pair *pair, int input_buffer_length)
> +{
> +       unsigned int in_width, out_width;
> +       unsigned int channels = pair->channels;
> +       unsigned int in_samples, out_samples;
> +       unsigned int out_length;
> +
> +       in_width = snd_pcm_format_physical_width(pair->sample_format[IN]) / 8;
> +       out_width = snd_pcm_format_physical_width(pair->sample_format[OUT]) / 8;
> +
> +       in_samples = input_buffer_length / in_width / channels;
> +       out_samples = pair->rate[OUT] * in_samples / pair->rate[IN];
> +       out_length = (out_samples - ASRC_OUTPUT_LAST_SAMPLE) * out_width * channels;
> +
> +       return out_length;
> +}
> +
> +static int fsl_asrc_m2m_get_maxburst(u8 dir, struct fsl_asrc_pair *pair)
> +{
> +       struct fsl_asrc *asrc = pair->asrc;
> +       struct fsl_asrc_priv *asrc_priv = asrc->private;
> +       int wml = (dir == IN) ? ASRC_M2M_INPUTFIFO_WML : ASRC_M2M_OUTPUTFIFO_WML;
> +
> +       if (!asrc_priv->soc->use_edma)
> +               return wml * pair->channels;
> +       else
> +               return 1;
> +}
> +
> +static int fsl_asrc_m2m_pair_resume(struct fsl_asrc_pair *pair)
> +{
> +       struct fsl_asrc *asrc = pair->asrc;
> +       int i;
> +
> +       for (i = 0; i < pair->channels * 4; i++)
> +               regmap_write(asrc->regmap, REG_ASRDI(pair->index), 0);
> +
> +       return 0;
> +}
> +
>  static int fsl_asrc_runtime_resume(struct device *dev);
>  static int fsl_asrc_runtime_suspend(struct device *dev);

<snip>

There is no implementation for _suspend although you mention it
in the commit message.

> + * @complete: dma task complete
> + * @sample_format: format of m2m
> + * @rate: rate of m2m
> + * @buf_len: buffer length of m2m
> + * @req_pair: flag for request pair


For example @complete field is not used in this patch. Maybe add it in the patch
that uses it?

I think is the same for other fields.
