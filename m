Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F432176A27
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 02:43:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wft13dmZzDqfL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 12:43:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wfr13hTmzDqQv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 12:41:37 +1100 (AEDT)
Received: by mail-ot1-f68.google.com with SMTP id x97so1411355ota.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 17:41:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wTmd93QvHJKnRP/iE9AlgpSex86ml4dgAiKBLvXi4d8=;
 b=qyuvmYVUtUq7hm+uX48jKMvZFQsWbBf60+paZODlJ7fEFQ4YnxKy7DnH5t0/U1vnKE
 k/2c5ZXXBGdaENf0sIZUS+qexBQfudM4FUFMmNgA5FUpHL0wmpmomX0fA6KAKsiFLK1p
 /e3tXqE/YnyJaNIgSJLwYTMG3hncyToTKGAjMQtM+kr+YszCGRM32jUufV3ITSkBRB/m
 NgAKsJvNalonIsRkaSZu32QI1s51vbmG8tnmhxXOBEMPu06OzpCWtMkG+B62hFgBuV7T
 MI8bL4PSq3zxIA064Wp6JprqJhU9AU7zj9xF75cF1k7T46UCECorG61oT+mlSHsE7AiB
 l2XQ==
X-Gm-Message-State: ANhLgQ11v9bi76KIt9sE2Q6eml95GGMIxgW7uMwRs94xljv1chE42NSp
 zUlaag83yiiYChQVJxnoHg==
X-Google-Smtp-Source: ADFU+vsdNg78DFlU+1lj7jVL9V1hy4eNjciajaJxnlZGh0to9M1K+WoyXSAT3r6zp73f0HaM+PIrow==
X-Received: by 2002:a9d:836:: with SMTP id 51mr1698659oty.318.1583199694975;
 Mon, 02 Mar 2020 17:41:34 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 16sm6365123otc.33.2020.03.02.17.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 17:41:34 -0800 (PST)
Received: (nullmailer pid 25998 invoked by uid 1000);
 Tue, 03 Mar 2020 01:41:33 -0000
Date: Mon, 2 Mar 2020 19:41:33 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v4 1/8] ASoC: dt-bindings: fsl_asrc: Change asrc-width to
 asrc-format
Message-ID: <20200303014133.GA24596@bogus>
References: <cover.1583039752.git.shengjiu.wang@nxp.com>
 <872c2e1082de6348318e14ccd31884d62355c282.1583039752.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <872c2e1082de6348318e14ccd31884d62355c282.1583039752.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, tiwai@suse.com,
 lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com,
 broonie@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 01, 2020 at 01:24:12PM +0800, Shengjiu Wang wrote:
> asrc_format is more inteligent, which is align with the alsa
> definition snd_pcm_format_t, we don't need to convert it to
> format in driver, and it can distinguish S24_LE & S24_3LE.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> index cb9a25165503..0cbb86c026d5 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> @@ -38,7 +38,9 @@ Required properties:
>  
>     - fsl,asrc-rate	: Defines a mutual sample rate used by DPCM Back Ends.
>  
> -   - fsl,asrc-width	: Defines a mutual sample width used by DPCM Back Ends.
> +   - fsl,asrc-format	: Defines a mutual sample format used by DPCM Back
> +			  Ends. The value is one of SNDRV_PCM_FORMAT_XX in
> +			  "include/uapi/sound/asound.h"

You can't just change properties. They are an ABI.

>  
>     - fsl,asrc-clk-map   : Defines clock map used in driver. which is required
>  			  by imx8qm/imx8qxp platform
> -- 
> 2.21.0
> 
