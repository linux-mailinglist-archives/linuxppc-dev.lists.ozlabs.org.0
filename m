Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AA4216388
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 03:53:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B157N3ps5zDqg7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 11:53:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JOfLIPJL; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B155Z3lwrzDqJh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 11:51:46 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id l6so36817016qkc.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jul 2020 18:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qx/C0isL60DPbKTPxrph0kJVnu1AM2M66vCo2gvDUxo=;
 b=JOfLIPJL+2nxndCtc9jPaSJdkd+AmzkyaD1JzoVZhJb34tgPdJuaPVJbdhGbbmlot1
 nP0PCUA2MnDCVjOTzLofNt5MbSHBNXQxCZtyBJJABBz2HfoEZbvQdmxYmb7leoUTt+DX
 hLzm1z/RZbt8s91F2R4d+0vl+3C0GK31Catd+BJ3duwE76ybY8oTZisVGdhKSxuv+eQJ
 HnaAvpjQGIkO0c1lLMZNsMXGcVW/f8n8D9tDW/DKceRkvWp9rTl9lqt0AOwOMH3hp17c
 g+nXeOpHlQsh/gG9W0Nkmgnc6EpRs9y15S8Up7ybEJLf3nOF7TMorGn6XpoLBKi0AF8+
 vY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qx/C0isL60DPbKTPxrph0kJVnu1AM2M66vCo2gvDUxo=;
 b=shnMY9Aqj9wqa8iQBmmKTjgP1OLuiO6IOZPdhAfE0kB6c+bqItRnlAANRcBXCCm6U5
 BtcWEpaZO5D0Z0S4wZlhC/GMZ/s1NlrZKpExBuyEP5G0hL6cwekkzuU1ZIw+IkXhBsXL
 xd7VZToUWYx7tG/G/jRY/xOXImOPpXb9LIa5F2StwRt9xckEqTPKT/ldGfi2BUcoM1PH
 yM8yHiF6w4EEaQA9AkpSaFRb9ZW3W3i4fskzt9SbzHz1YDQ1NZDwvFIfUjG33zUvaU28
 c4fNYAVZXEYLTqjSizu5yHtSXXSdgehJi2Vvpq5qnKoL+UtWmlGsTcnHGD/EBTITuFQV
 QxBQ==
X-Gm-Message-State: AOAM532nNfMZDysLWdMjJZfejiTlddwQ+AiambfUkwYYutKQEeo+stwn
 FWatwiHTxodPHaZG4A3UT00lf3wRgFwe0rXXYI4=
X-Google-Smtp-Source: ABdhPJxbdu1UR0UwC4VJ18/+W8RImTA2mJWd60dbnKAprt4YwcWVw4xJ/jqDfQmncoedyIwf0fGD5hIXQ2ivhdVou/E=
X-Received: by 2002:a37:bcb:: with SMTP id 194mr51351661qkl.103.1594086702672; 
 Mon, 06 Jul 2020 18:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200702193102.25282-1-nicoleotsuka@gmail.com>
In-Reply-To: <20200702193102.25282-1-nicoleotsuka@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 7 Jul 2020 09:51:31 +0800
Message-ID: <CAA+D8AMMKKDyPXXN0790LswNh_sOfUUDVw5PiMoLB-U4qX8G9w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Shengjiu to reviewer list of
 sound/soc/fsl
To: Nicolin Chen <nicoleotsuka@gmail.com>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Li.Xiubo@freescale.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 timur@tabi.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 3, 2020 at 3:33 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> Add Shengjiu who's actively working on the latest fsl/nxp audio drivers.
>
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> To Shengjiu, please ack if you feel okay with this (your email address too).

Thanks Nicolin for nominating me as a reviewer.

I'd like to use my gmail address "shengjiu.wang@gmail.com".
with this then

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
wang shengjiu

>
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 496fd4eafb68..54aab083bb88 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6956,6 +6956,7 @@ M:        Timur Tabi <timur@kernel.org>
>  M:     Nicolin Chen <nicoleotsuka@gmail.com>
>  M:     Xiubo Li <Xiubo.Lee@gmail.com>
>  R:     Fabio Estevam <festevam@gmail.com>
> +R:     Shengjiu Wang <shengjiu.wang@nxp.com>
>  L:     alsa-devel@alsa-project.org (moderated for non-subscribers)
>  L:     linuxppc-dev@lists.ozlabs.org
>  S:     Maintained
> --
> 2.17.1
>
