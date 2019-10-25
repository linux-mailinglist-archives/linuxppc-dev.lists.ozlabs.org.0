Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32916E55A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 23:12:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 470Gyr3Ny2zDqfp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 08:12:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="M9n9pfj8"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 470Gww6k3QzDqnV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2019 08:10:40 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id 3so2389014pfb.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 14:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4SQYqLXX0XdL1+ct2NCqP0blLyo4HQV7tsLhnLw7hQs=;
 b=M9n9pfj8q7l6P50lkgGdxZehMpVLDK8ZmI6h116XJC4/64SSNK/YYVX+xv3DRF2ivG
 Zzgg3mBivr6x3cWPjemy+EWNbPRXm/iIW8aNbCrb94Ls9MlU5jU/jb0mn3yNCTdBo9Wa
 GmH4WJ6y/7gjeq5BRvdgW8izUhckGGyiGd6AsuGFEcjVRuFiy4McVtTy2Z+/FH/qAd80
 pmDXrACAkqPxzboLhwXjbCgOhhFJ9jplmG2pc5ZjNF2ksSd46aYvZ0QbZ6CgvzGvsiCH
 EPNUqMYwahXzG8Vj/dr8l6pm6uxAspTidvfzU2fWuZvxPsaWFfUfz3wbEzJum84O0QfG
 vMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4SQYqLXX0XdL1+ct2NCqP0blLyo4HQV7tsLhnLw7hQs=;
 b=HHzPHvR/53alV8kmKZhC0wSIvCHk2sMtEBdxjeAB8xccpbo/pqgIfjtmXJwHWLnshI
 SxKCGpHdjQtlhOtxoVnTOXyqSJTEhg7P3h2B/y3VTkVkTE0KWKOO5iomzanftb1xRCkm
 lWL4x37zioGCDZSIjnyU1bLiOI0Zp/ZK1qd2huQ4/tw++CpDUvKGeBIbEqP9YaLcF8cm
 kUb12hDKeJENzWwy9fC9bd+o3fVsO4CXd/SxEDp4Dc+vo/ZJWOUMklvQJ9ARfKps7GSG
 Cweng8fNPlAQIbJaxjdfuSFr0L7YTWc0LjEi7RHybvIH55N3XKzWhn+PpQqrizf7hK6d
 dfcQ==
X-Gm-Message-State: APjAAAUj88fzegSALN6iryqAwoUlkot21tK5tpIGF5k5ncfBoZwT8Z00
 ZwvjdHRtEPxIdCW/wGnwy8o=
X-Google-Smtp-Source: APXvYqzzjTnv2D4OYrUqWzMN8fCAnpjvEbjHAwrTNhaiVf/2Enfk58DhQ/EGZoxwOZADuV5bHAi7cw==
X-Received: by 2002:a63:e056:: with SMTP id n22mr6675498pgj.73.1572037836935; 
 Fri, 25 Oct 2019 14:10:36 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id z13sm3550450pfg.172.2019.10.25.14.10.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 25 Oct 2019 14:10:36 -0700 (PDT)
Date: Fri, 25 Oct 2019 14:10:14 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH V2] ASoC: fsl_esai: Add spin lock to protect reset, stop
 and start
Message-ID: <20191025211013.GA15101@Asurada-Nvidia.nvidia.com>
References: <36e1d0157d2b71985b88e841d416d04c584c04fe.1571986436.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36e1d0157d2b71985b88e841d416d04c584c04fe.1571986436.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 25, 2019 at 03:13:53PM +0800, Shengjiu Wang wrote:
> xrun may happen at the end of stream, the
> trigger->fsl_esai_trigger_stop maybe called in the middle of
> fsl_esai_hw_reset, this may cause esai in wrong state
> after stop, and there may be endless xrun interrupt.
> 
> This issue may also happen with trigger->fsl_esai_trigger_start.
> 
> So Add spin lock to lock those functions.
> 
> Fixes: 7ccafa2b3879 ("ASoC: fsl_esai: recover the channel swap after xrun")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Some small comments inline. Once they are addressed, please add:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks

> ---
> Change in v2
> -add lock for fsl_esai_trigger_start.
> 
>  sound/soc/fsl/fsl_esai.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
> index 37b14c48b537..9b28e2af26e4 100644
> --- a/sound/soc/fsl/fsl_esai.c
> +++ b/sound/soc/fsl/fsl_esai.c
> @@ -33,6 +33,7 @@
>   * @fsysclk: system clock source to derive HCK, SCK and FS
>   * @spbaclk: SPBA clock (optional, depending on SoC design)
>   * @task: tasklet to handle the reset operation
> + * @lock: spin lock to handle reset and stop behavior

Should be "between hw_reset() and trigger()" now.

>   * @fifo_depth: depth of tx/rx FIFO
>   * @slot_width: width of each DAI slot
>   * @slots: number of slots
> @@ -56,6 +57,7 @@ struct fsl_esai {
>  	struct clk *fsysclk;
>  	struct clk *spbaclk;
>  	struct tasklet_struct task;
> +	spinlock_t lock; /* Protect reset and stop */

We can drop the comments here since you add it to the top.
