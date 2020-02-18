Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F4C163689
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 23:56:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MbnS6xJTzDqk9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 09:56:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RoN26OTS; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Mblf1tfLzDqZk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 09:54:48 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id t6so8678615plj.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 14:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DLcO2DKWECMZLG1IHbpSAq+iosbKYeAAnLf8zJftE2I=;
 b=RoN26OTSoD8xQPX8Ejb8azpPGaUfxPDvq/VvNyKPUXC02u6KESX4+KewWJ0C3B6BvY
 Qe1m2IweSiLDlgWK90aBCD09mUr1arr5/A8ACf2W+VfYSIlOLRZM9GnqkYCH1Hk9Agoj
 +PNGQbijasxynJv26p7N5IwUoW2ory/yMjEaGzcnvWGXZ9Ty/Y4qskG2oDvwhP9uGs4U
 7/Vzvi4mr8AnPcRhPfuz+jTCNtKEXjzqK2+uZ5DD5xXRui0DuhY8RuP2kRy9664Z9xkn
 Ajfm5wDf5zrloWSVfa/c1AYPhfG8K/6YjkD/0dfA1novKrcoPB8Ky47OKjgh6sc2gsXF
 GXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DLcO2DKWECMZLG1IHbpSAq+iosbKYeAAnLf8zJftE2I=;
 b=FEs8Omu6OYi6vun2cxdOsTYPzb84jrWBJEZ53MpuQsa523dLXQ67F+0KjY+sTehSj3
 /Irc7Qzi6N+stXCiv2Etbp3SE74SKgf3VJ9TZreawxk+5ElNl2aiT7ypiMe1mQChSYQJ
 8K2GAang9SghD4M/HCrutaUQ62IQcHGxsB98FrV1A036ykVU18qYwQN9gNvPDdeetgwO
 uHmvkFXcLyIe9zXIQKaISubWkpbyJtMe274uHXH+wwG4mr4EapRJA3fhcL/kYCXxtHnh
 2/U/MVkElnWmdSz3ijgnxl5eeAQd7Apfir/u/c4MaTxW1DGX7tt9HKL7RzaYrdpl9XSu
 NtjA==
X-Gm-Message-State: APjAAAXt+W2x0uE/LiEshbXvVOlLRSBJX9a6P5OOxlbqdu9ExHEb6zO/
 gIdBFTPBp9T6WmaA/DrYQ30=
X-Google-Smtp-Source: APXvYqxKyKfvB6gUIxasXk+3gpb22DtW5pbbJzCinqep7l23wSdhHK6tbwkFTvHB8sVofima6J/cHw==
X-Received: by 2002:a17:90a:cc16:: with SMTP id
 b22mr5326984pju.65.1582066485149; 
 Tue, 18 Feb 2020 14:54:45 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id i2sm4403pjs.21.2020.02.18.14.54.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Feb 2020 14:54:45 -0800 (PST)
Date: Tue, 18 Feb 2020 14:54:54 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: fsl_easrc: Add document for
 EASRC
Message-ID: <20200218225454.GA32720@Asurada-Nvidia.nvidia.com>
References: <cover.1582007379.git.shengjiu.wang@nxp.com>
 <a02af544c73914fe3a5ab2f35eb237ef68ee29e7.1582007379.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a02af544c73914fe3a5ab2f35eb237ef68ee29e7.1582007379.git.shengjiu.wang@nxp.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, perex@perex.cz, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 18, 2020 at 02:39:36PM +0800, Shengjiu Wang wrote:
> EASRC (Enhanced Asynchronous Sample Rate Converter) is a new
> IP module found on i.MX8MN.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,easrc.txt   | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.txt b/Documentation/devicetree/bindings/sound/fsl,easrc.txt
> new file mode 100644
> index 000000000000..0e8153165e3b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.txt
> @@ -0,0 +1,57 @@
> +NXP Asynchronous Sample Rate Converter (ASRC) Controller

Missing "Enhanced", I guess.

And "ASRC" => "EASRC"

> +The Asynchronous Sample Rate Converter (ASRC) converts the sampling rate of a

Ditto

> +signal associated with an input clock into a signal associated with a different
> +output clock. The driver currently works as a Front End of DPCM with other Back
> +Ends Audio controller such as ESAI, SSI and SAI. It has four context to support

"context" => "contexts"

Btw, what's the definition of this "context"?

And, is SSI still available on imx8mn?
