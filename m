Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BAF2F3873
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 19:21:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFf6M2jwBzDrBq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 05:21:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::731;
 helo=mail-qk1-x731.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LynGEmqa; dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFf4b4THzzDr82
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 05:19:55 +1100 (AEDT)
Received: by mail-qk1-x731.google.com with SMTP id f26so2761414qka.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 10:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6/4/dr7fn+zRTbNcUowmMs8Ol/J2eKhumjr3A4Q7PFg=;
 b=LynGEmqaTLG2T0txzoExer0ZVvjQ7ErcUJn8AJ46RHf/x34wtEtL7n7G5pZi3WcIkm
 2liRj0IBu3R/Tn5gyMpYhSPxmjvwY6kit3j+p+XB9kjWHJBvy87NuxGprIcmz7T4o+Pa
 ja9De+tLhO5ZymbHezPq6orUehBQJUjfP6yIJac6hT9UTC18Ywi00zftsU9YWd/crE+o
 BsH3yQICgUmTf3AHw/mNFffhDx8hkP7Mlux1H5J1fwO5BrBh/5oMSETzzv1jeDEN1Lpi
 w5gViEURf6IPAXIyznPwQsFVgMI7nur9g1x8FOe4lj8E8w59WZ3DCMqDSgfo4l5ea68X
 86Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6/4/dr7fn+zRTbNcUowmMs8Ol/J2eKhumjr3A4Q7PFg=;
 b=IMshOP1gw4Va0E70hXAiSI/9FsXY7CmiSr8IzBpogwgb3YgYia3Jdr8GDxZ6L01KSc
 fHfwhk5PGwpaNYjBXA6Zg29dN6KWNyLS/hLGOtfGF0hr30L8tUTp3mcz31fxT5Jf1HZS
 eaN6BUM1sk1lbv/drKqpbLycho+EPhCvJgjxcquUfRnjQeSPDExRXTKFzckmgAmaGw7F
 lVXS6sQ0xhN1wnWRp2GUXIIrb3J0ZfT3BBDwra/eq5Eb1NdWGAECQvcIGG6oWIe+DVS7
 WlC51jw1+BATw6jkPNXVf4WAu2cc7S+p/5PaOtAF1kgjNob91Ac0P2DUFOnzqNigQex1
 EtPA==
X-Gm-Message-State: AOAM5305WMeY38n/d9ofwP/D80Q/PVAK4CYO6dV5eNjbC8mlZ2Z2npUu
 HE3N51HfA8AkaGrBvXdsmuM=
X-Google-Smtp-Source: ABdhPJw0IfeM/ZZbNMvRUDF9MbEZALByeR0JUGlFVpnEJrx3y+U/PumG28kscAX3wbxVu5lB/HcYjQ==
X-Received: by 2002:a37:4f11:: with SMTP id d17mr615113qkb.53.1610475591791;
 Tue, 12 Jan 2021 10:19:51 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id q70sm1736569qka.107.2021.01.12.10.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:19:51 -0800 (PST)
Date: Tue, 12 Jan 2021 11:19:49 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: imx-hdmi: Fix warning of the uninitialized
 variable ret
Message-ID: <20210112181949.GA3241630@ubuntu-m3-large-x86>
References: <1608115464-18710-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1608115464-18710-1-git-send-email-shengjiu.wang@nxp.com>
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
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, perex@perex.cz,
 nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 16, 2020 at 06:44:24PM +0800, Shengjiu Wang wrote:
> From: shengjiu wang <shengjiu.wang@nxp.com>
> 
> When condition ((hdmi_out && hdmi_in) || (!hdmi_out && !hdmi_in))
> is true, then goto fail, the uninitialized variable ret will be
> returned.
> 
> Signed-off-by: shengjiu wang <shengjiu.wang@nxp.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  sound/soc/fsl/imx-hdmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
> index 2c2a76a71940..ede4a9ad1054 100644
> --- a/sound/soc/fsl/imx-hdmi.c
> +++ b/sound/soc/fsl/imx-hdmi.c
> @@ -164,6 +164,7 @@ static int imx_hdmi_probe(struct platform_device *pdev)
>  
>  	if ((hdmi_out && hdmi_in) || (!hdmi_out && !hdmi_in)) {
>  		dev_err(&pdev->dev, "Invalid HDMI DAI link\n");
> +		ret = -EINVAL;
>  		goto fail;
>  	}
>  
> -- 
> 2.17.1
> 

I still see a warning in v5.11-rc3 that is fixed by this patch, is it
not going in this release cycle? It is a regression fix, seems like it
should.

Cheers,
Nathan
