Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE21741DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 01:14:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vB4z1GBdzDqP5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 09:14:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Sa4QuXYT"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vB331VrxzDqFY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2019 09:13:02 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id n9so15733091pgc.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 16:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=d+t+952qOGIU1AddOHVH/nDFUA90m4SMJ1NCUq2nKKI=;
 b=Sa4QuXYTDpG4z9VPVpCPn4be1hY1xZdVOzdRfkm5eeTmruwirxYioQZkmJndvCu/OF
 bzrzowYqU0xUjsFcb/9Gak318sfFLVIUWd1bEtZKQSov5e25ZaPricXKIHgcMDs0D9GX
 zM4mJcESv6Ad3QBx4ZTbbA70n96sGRf8fa97U7fgYq1Q7ckfFSCLwjZDEYTKFL4RE9Ft
 /noDhPKAvG871BL+wzXVGZMFh6VtQgbUW2K1P1E0a5GOgU3n9cNJKc903vD2QtySQcGn
 N/X+a3Lt7zuy7QItV4ewrlRjb576kj58NUH5FtirVnBLqvk8l5R+TPgYJ1PrxyBsAdIW
 EekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=d+t+952qOGIU1AddOHVH/nDFUA90m4SMJ1NCUq2nKKI=;
 b=dSyb+0xKA+/FoxekIas5OzRBPhBkU0bz5o9kxxyQcxO9K5hmDUfk7HMyj6bBafRHiY
 6n3sDXqXVlIQr1SsKDcrS+60b/RfXl8a6NJ7gY+GgIbfux1fNWOS0gEaFA1iMUANN0dn
 szGPOF+9fXCNg5jJf/NfBAk9WcfPySi2O8f4Nc3LgGZZsxUOn+r29oFTg24N9SvBq5wU
 dUwZa2jF7DjX2dlP9imjRoSWQ4E4Hfzex7Qu4QMz5WuJhRP3k3DFKT13cr/V+t+PZSBr
 IpifQ/U30LeQEcb9Xg3W5UIFos+VAnMmjY9IRAUnNSCK3t0i2oV5uVNsJgdt/Ikr+TVp
 bPFQ==
X-Gm-Message-State: APjAAAVtXyC79B8GyGdOg8DVX3ocEX9JYCp1Qlg50b61gVm4Jmi6yPWR
 eF1ELA27gI4sB742mr2N1S4=
X-Google-Smtp-Source: APXvYqze9AAhyT3DRIx1dZFNDLjo8o8XIOYbw6gQScrKQK72ISZdadufL/dJOqjjN+UT+iUZgOd2WA==
X-Received: by 2002:a62:f20b:: with SMTP id m11mr13713991pfh.125.1564009979132; 
 Wed, 24 Jul 2019 16:12:59 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id t9sm20439665pgj.89.2019.07.24.16.12.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 16:12:58 -0700 (PDT)
Date: Wed, 24 Jul 2019 16:13:43 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH 06/10] ASoC: dt-bindings: Document dl_mask property
Message-ID: <20190724231342.GB6859@Asurada-Nvidia.nvidia.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-7-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722124833.28757-7-daniel.baluta@nxp.com>
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
Cc: alsa-devel@alsa-project.org, viorel.suman@nxp.com, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com,
 angus@akkea.ca, tiwai@suse.com, perex@perex.cz, broonie@kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com,
 linux-kernel@vger.kernel.org, l.stach@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 22, 2019 at 03:48:29PM +0300, Daniel Baluta wrote:
> SAI supports up to 8 data lines. This property let the user
> configure how many data lines should be used per transfer
> direction (Tx/Rx).
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl-sai.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> index 2e726b983845..59f4d965a5fb 100644
> --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> @@ -49,6 +49,11 @@ Optional properties:

> +  - fsl,dl_mask		: list of two integers (bitmask, first for RX, second

Not quite in favor of the naming here; And this patch should
be sent to the devicetree maillist and add DT maintainers --
they would give some good naming advice.

From my point of view, I feel, since data lines are enabled
consecutively, probably it'd be clear just to have something
like "fsl,num-datalines = <2 2>", corresponding to "dl_mask
= <0x3 0x3>". I believe there're examples in the existing DT
bindings, so let's see how others suggest.

> +			  for TX) representing enabled datalines. Bit 0
> +			  represents first data line, bit 1 represents second
> +			  data line and so on. Data line is enabled if
> +			  corresponding bit is set to 1.

Would be better to mention: "as a default use case, if this
property is absent, only the first data line will be enabled
for both TX and RX", since it's an optional property.

And one more extension(?) of it could be what if there's no
data line being physically connected for one direction, for
example "dl_mask = <0x0 0x1>", indicating that SAI enables
one single TX line only, so driver would disable RX feature.
What do you think?
