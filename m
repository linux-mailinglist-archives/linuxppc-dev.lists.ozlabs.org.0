Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB7A239F2D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 07:42:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKmwz4md2zDqGJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 15:42:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=K186TuiU; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKmvS2vHNzDqGJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 15:40:52 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id f193so7166760pfa.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Aug 2020 22:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FhbpD1GOOiuI1h2KLYGhIc+Q4nrSHyP4h81W7KBJFqA=;
 b=K186TuiUMKQPdqAxCXhqtmALF9pZVrrem7PSJKHN2TVp6X/DGU7ghf9/BJMgBlUhh9
 jS5/KukDzLHwp2Tdh4NSv/i8naoGe9A3lUIZtoYE8DaWtRKIWGLC17qgWRsBuZ3JbkXD
 oI8zW7cC4xb3BZI+vs/9AmJvJY9r0ii6/sp00L/jDAKIi60G5674s+5a07y3LVR+IYv+
 deXVnc3aHNRNX7yQY4FFTNiSAUxBcTIDHNsWd3W3SkG+OiQQgnX8qlAqr3PJu9juma9t
 ZOSyPHOQaDxAdPbVnDMa/p63b0pwNeNG3aWsDaeHmhNXIVHXLUvlwT1LaFoiZtLXcwQy
 s+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FhbpD1GOOiuI1h2KLYGhIc+Q4nrSHyP4h81W7KBJFqA=;
 b=bgkwPnrNi5EaI20jH6muLuxLk1Q7entvK6uFMsGk9RZPsJEJds1umogPrNCx3FxsML
 kDyJ9UOKqKhx+rLWQfrdZP8EI7HcGg99I+wQJoppRK2DcWw2gnEVHsBXn7ns/N8iR/iw
 ai6AKmtGXhOy5qzTK/0joFOpQroLLJrBEO2/GxNDaUDO1hdhAAW7R8g7oVR+JV2qIvgB
 ccgdLDO+uYhfL63wfBlszqyYIf5izZOijKigXos2B2Wng9KFJrvNV1uNqekePGIeRvAl
 ejUmsY66jFRhfQE4iUkGLDqznAvX4pUMXJt1UdbixQFqzkOV51TBGwnXQ9w68xrGaZlf
 wqcQ==
X-Gm-Message-State: AOAM530V1MrTHLWOFsdjYSaN1aCrd0e46kTX3JTVJyx+QuE7h04zT1kZ
 9pQ1zK26ERrG8L7TeuXcz/DI8oxzZbYUWg==
X-Google-Smtp-Source: ABdhPJwtNZAtl8+czzRAcH8w3sZ9OYQlR+w7v7GG79nlmxqjy27pa7NblOV/FHvTJ6hTl+lyzxlnOg==
X-Received: by 2002:a63:444b:: with SMTP id t11mr13955435pgk.134.1596433249969; 
 Sun, 02 Aug 2020 22:40:49 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id m190sm16926096pfm.89.2020.08.02.22.40.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 02 Aug 2020 22:40:49 -0700 (PDT)
Date: Sun, 2 Aug 2020 22:40:37 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Clean code for synchronize mode
Message-ID: <20200803054037.GA1056@Asurada-Nvidia>
References: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
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

On Mon, Aug 03, 2020 at 11:17:54AM +0800, Shengjiu Wang wrote:
> TX synchronous with RX: The RMR is no need to be changed when
> Tx is enabled, the other configuration in hw_params() is enough for

Probably you should explain why RMR can be removed, like what
it really does so as to make it clear that there's no such a
relationship between RMR and clock generating.

Anyway, this is against the warning comments in the driver:
	/*
	 * For SAI master mode, when Tx(Rx) sync with Rx(Tx) clock, Rx(Tx) will
	 * generate bclk and frame clock for Tx(Rx), we should set RCR4(TCR4),
	 * RCR5(TCR5) and RMR(TMR) for playback(capture), or there will be sync
	 * error.
	 */

So would need to update it.

> clock generation. The TCSR.TE is no need to enabled when only RX
> is enabled.

You are correct if there's only RX running without TX joining.
However, that's something we can't guarantee. Then we'd enable
TE after RE is enabled, which is against what RM recommends:

# From 54.3.3.1 Synchronous mode in IMX6SXRM
# If the receiver bit clock and frame sync are to be used by
# both the transmitter and receiver, it is recommended that
# the receiver is the last enabled and the first disabled.

I remember I did this "ugly" design by strictly following what
RM says. If hardware team has updated the RM or removed this
limitation, please quote in the commit logs.

> +		if (!sai->synchronous[TX] && sai->synchronous[RX] && !tx) {
> +			regmap_update_bits(sai->regmap, FSL_SAI_xCSR((!tx), ofs),
> +					   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
> +		} else if (!sai->synchronous[RX] && sai->synchronous[TX] && tx) {
> +			regmap_update_bits(sai->regmap, FSL_SAI_xCSR((!tx), ofs),
> +					   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);

Two identical regmap_update_bits calls -- both on !tx (RX?)
