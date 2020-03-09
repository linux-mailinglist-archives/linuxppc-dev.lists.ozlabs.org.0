Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF9F17EB1F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Mar 2020 22:23:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48brmQ2CVbzDqXq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 08:23:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.193;
 helo=mail-pg1-f193.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pbO7fa9h; dkim-atps=neutral
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48brjn0DfzzDqSt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 08:20:43 +1100 (AEDT)
Received: by mail-pg1-f193.google.com with SMTP id y30so5276289pga.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2020 14:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CSeop4EP+cHMLCfdhjpEDfNo8WqTVWutCfl/33ROm+Q=;
 b=pbO7fa9huNww+H4GhUCnFSIZbuh3Sf/rqL+W+gTUIf64t4U2IixcH4BPbnCSE8qcFS
 UFQeQYt3s3zs0VatDi9JjRoQ89980G7DbXdtTb6Xv+TFK984PRq8TwylqphaXkExjt9e
 Xz5NNdc5nN8xwtUgWFNoCG93FRrBhJ+/l9IckYff3HQvEitnWoNN14NCKsfJ2OD9gS4W
 k+FppLDxkIPBUWhYWJxUiM8VHQ73wgCCs51Fniu84mN3YqmRggft2jiivrPTxzEEvtdq
 Ui+ObyGCQmX3LzvkIZNhar5QHwGH5uWiu5+IlvyBg1k+SwlLEZI4g9HVM7oMwISqFxyo
 6law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CSeop4EP+cHMLCfdhjpEDfNo8WqTVWutCfl/33ROm+Q=;
 b=cjquPQ7QrQUis+5pf++lrslYWTxosotOa8oUvO6lqs91UJ4TeCzmu/hjlQteFKW23O
 k/ttWNXDODwYTVsN2f3bjbrLUoAZgToNbBYkBbBb2N4w0yfEZ0IL6blWiv7jo5VqBXxW
 EQ+EL6BN0FOzLAecgY8JImMcK+yfHSuBGiWV8TKPx+Lvx+/UDRGs7UDPlS8Vu6NGn+8D
 uzONmqu3sqnMMew6a2yFNvXIZhL+Eyo0hfk8fAR5wJlh3+JTzzuEhPWGQRlst4bwwb/p
 84AyAD6A+6vE5hsNyDpTCCC+CUtJfY/3Mjnl/+eCn9kvblhph3yuNCyH5EhbVxYf4J33
 4XQA==
X-Gm-Message-State: ANhLgQ1rzNhcUW88s9+bP3YcXig2ZMNZZTJEQdy8pMTcD1naIxGjYX3C
 8B0lFTrtdDMOE/35MX9maYs=
X-Google-Smtp-Source: ADFU+vsg7KizeYcWAnahiuG5JhDpW4TK4b4no2mIFhQ7Xz1jVWgPmRVkedECb5+Or6RlRlgKY30Ong==
X-Received: by 2002:a63:8f17:: with SMTP id n23mr19033927pgd.161.1583788776473; 
 Mon, 09 Mar 2020 14:19:36 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id d10sm448423pjc.34.2020.03.09.14.19.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Mar 2020 14:19:35 -0700 (PDT)
Date: Mon, 9 Mar 2020 14:19:44 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: fsl_asrc: Add new property
 fsl,asrc-format
Message-ID: <20200309211943.GB11333@Asurada-Nvidia.nvidia.com>
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
 <24f69c50925b93afd7a706bd888ee25d27247c78.1583725533.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24f69c50925b93afd7a706bd888ee25d27247c78.1583725533.git.shengjiu.wang@nxp.com>
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

On Mon, Mar 09, 2020 at 11:58:28AM +0800, Shengjiu Wang wrote:
> In order to support new EASRC and simplify the code structure,
> We decide to share the common structure between them. This bring
> a problem that EASRC accept format directly from devicetree, but
> ASRC accept width from devicetree.
> 
> In order to align with new ESARC, we add new property fsl,asrc-format.
> The fsl,asrc-format can replace the fsl,asrc-width, then driver
> can accept format from devicetree, don't need to convert it to
> format through width.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> index cb9a25165503..780455cf7f71 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> @@ -51,6 +51,11 @@ Optional properties:
>  			  will be in use as default. Otherwise, the big endian
>  			  mode will be in use for all the device registers.
>  
> +   - fsl,asrc-format	: Defines a mutual sample format used by DPCM Back
> +			  Ends, which can replace the fsl,asrc-width.
> +			  The value is SNDRV_PCM_FORMAT_S16_LE, or
> +			  SNDRV_PCM_FORMAT_S24_LE

I am still holding the concern at the DT binding of this format,
as it uses values from ASoC header file instead of a dt-binding
header file -- not sure if we can do this. Let's wait for Rob's
comments.
