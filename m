Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB8B374DC7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 05:00:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbJH42fzqz30Gl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 13:00:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bV0lkOJU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bV0lkOJU; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbJGK0qcSz2yxj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 12:59:50 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id v20so3713188qkv.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 May 2021 19:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5nU1vgirtCThHvyYn1ZRBNMbOfWAmoUamSH+LcH56a8=;
 b=bV0lkOJUu5s4BbJ6rOBiItcFnuvbF+pPAhICL7Ag0S8hMCilMdMA4h1XNFzN990UGg
 DXxyd2rDycv94LpUuP9K+XIGsdJ1jE+FBVWhinoriPc6FS1PJXhNiJa+KmYAtD0QNcox
 YLOG2tCqtb7TWLtLkt8HjH2rDcpiHVLukewopVAnLSow3YvNLj2nBXP7VkfM7YxKtGOw
 mhiFBao0G/SVg/yiavea5HiyXhCvruWpuNQvaMkzX0uhfbHillZsPq/yeJ3D8BNUfmB2
 y0L8qmXCaTVRTsv6ycs+qIsaDYZKvFy8If6GsPAX7q5kidOzd2hB/HHRbPHw1h8BHqEm
 h7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5nU1vgirtCThHvyYn1ZRBNMbOfWAmoUamSH+LcH56a8=;
 b=VNgkkbMIMjA4mvqcEUZPfuBw8fGBroRIojRHQ/GNLhS1165mwIEYBFwLtoBeluLpHz
 rahE6zrhc6iFXoBahb2pWvfhKjALY92DZUjjo2z+9BFGqKCYEGoHva9EKWMolPsi7t5q
 DKi8m97jO0/VI7Ds4/JnMLCJFOrS79iAO4TYM0wmvmX42fbEgFbIRbL5qWdvw/4Wbee2
 FRjzcSLB0sgV5ljUIx4RZnekLcDRFGNLQlX2LPQNHb4ttLipINfUoyC05fwBwFeqrBa0
 lDge5V94jFXpbdassOxzIDThutq6piIFA0h4JOZJxASVIoIVtcsP+8kwI88o0CTteYQn
 bU+Q==
X-Gm-Message-State: AOAM530Z+j77TaVl5encghh/oPAPrqt7DGb08b9BbC28LRbCr9lbJ9yj
 4Y9hrcb+u5BohAo8klzMxefy8UwasxZnA1aXkq4=
X-Google-Smtp-Source: ABdhPJzDff6nOz49nsVXQ8WHxc36EDEAfLfOpn0EAONrS6s8pZ5dBpXMkQjbHpcdA6HIl/tZ0mtx4etMgnd41dZYB7w=
X-Received: by 2002:a05:620a:2903:: with SMTP id
 m3mr1886281qkp.37.1620269986820; 
 Wed, 05 May 2021 19:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210506022452.5762-1-wanjiabing@vivo.com>
In-Reply-To: <20210506022452.5762-1-wanjiabing@vivo.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 6 May 2021 10:59:35 +0800
Message-ID: <CAA+D8AOLyjnjD2gc=a20zYCfJp1EoJ9En4Q9JQXR5qbV9Mpzyg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: Remove unneeded semicolon
To: Wan Jiabing <wanjiabing@vivo.com>
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, kael_w@yeah.net,
 Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 6, 2021 at 10:26 AM Wan Jiabing <wanjiabing@vivo.com> wrote:
>
> Fix the following coccicheck warning:
>
> ./sound/soc/fsl/fsl_xcvr.c:739:2-3: Unneeded semicolon
>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

> ---
>  sound/soc/fsl/fsl_xcvr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index 6cb558165848..df7c189d97dd 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -736,7 +736,7 @@ static int fsl_xcvr_load_firmware(struct fsl_xcvr *xcvr)
>                         /* clean current page, including data memory */
>                         memset_io(xcvr->ram_addr, 0, size);
>                 }
> -       };
> +       }
>
>  err_firmware:
>         release_firmware(fw);
> --
> 2.25.1
>
