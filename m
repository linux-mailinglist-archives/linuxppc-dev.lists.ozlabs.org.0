Return-Path: <linuxppc-dev+bounces-1664-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ECF988783
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 16:48:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFYHX6h5fz3cN4;
	Sat, 28 Sep 2024 00:48:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727441987;
	cv=none; b=iROxRE9yaHyag8h6Bp/ldrEGFhYb1gLSgSbrewxjLZxkBuMnhMomjLrvFwyJ8vrL347C3KvfRKe99Gnbcqpiuo55OUbIEiCYY++9qThyZI3zzzdYs2JRZTi0m6Wf4Yfe6mmqp9MJKLBY2SLqTSaMrLu1LtiGQ1uSlXFdqaViSv+0sIBSGeOKaqmRfZFlwEnufs7/UHvUPLx09VMeRNTxxKlCVhRvoXGcVcTk16S34c4u5RmT+Rvg6hKF78q5yEhTQK3DKmvgtb3NhwKoF+PE37iPCH7ix2QB0mVA62TZ12y4kfbdx+b23rKvB4hNV4mIbxcMMWYNl6X8ndv+ZDhxeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727441987; c=relaxed/relaxed;
	bh=5kRvQYqrDxlyQ/4IJ60voMIp6Qt/AmF1WSn0sGcC0t0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h8xQV7VCEg+XZerQ81wr5AVW4mXxPoFB94FPXK6hhzRN8U3DFvRbhczkPLon+zpaz0j+xyMphVJloLx+rMpNZs4yLB8hSpYzbWy4ZmB2qKbiwjXnZXVXBFibpLckXE5oDNUVFZ5NkXecSCsa+62dE0RILOHEXzv/JlVxgKfxfUrIrUe8hUqBhM4XZ37K4Rr/X3hcU0udeqI8+3ENAstIDxoNggmmGWmosFEncg71IXJeQFQFPT/t1yWjoDZq5DJCoXSZZUYbj7qnCDqf49g7oC8Srj0dzmOUqP6svlbjDN5cAst8wv2bRxvy8ODVHKyCuQtzM3+cRRLPVYILOnpI5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P7ytwmFN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=aford173@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P7ytwmFN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=aford173@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFVtC03qNz3cCM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 22:59:46 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2e09a276ec6so1574553a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 05:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727441984; x=1728046784; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kRvQYqrDxlyQ/4IJ60voMIp6Qt/AmF1WSn0sGcC0t0=;
        b=P7ytwmFNxiYlLwNyZ+Ne/bANtejv+urOrc2DnECtttJbrV3tRxwq9HiO9RTi4/FgsY
         P+oJeU0JJoNPwY2EuE2nx3Wgw7nCOTpzvdHlSD+KUA9AM8cH2exLxmTp3rH6e6Az1xFl
         gG2I75eCkXhBAPDBXCGRKIPtjfC6LSkYVwy+AMWs0QNJrdaOEiDTQuuPHqDQs2iUecik
         QYtRoOfQU5imSWvCWi6k6/Ml/JQFk133LEXVNgv4izYFnuPW4VEP94zI3dMjCATv1zwz
         j456M9FDBohwv8XavJswAOUkuENU6AZKUAc3xP2lRvZ+Rn0G+AVOD/7DXhCIpQx0fCgg
         nLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727441984; x=1728046784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kRvQYqrDxlyQ/4IJ60voMIp6Qt/AmF1WSn0sGcC0t0=;
        b=RTI/wNf0WH4z8IcsxsQ0fKnA7Zn1OiBfW2oKzqYKb+kEjX38Vf5i4doG9ZRMP2cCdP
         u9mI18ctbkHwIFkuV/dRvcn+EEsbbQ/86QTM9h7uRWST196VqXV6+z+hvbzjOJnZObzp
         TcztXb19g47zKfPpjqBix8tK1v6okCVufBpPAAd/hMti8jFFnY/t7/PfJL7eHiAgbWwu
         hrRZDD8N+D7VfTP9kPHXi9uxuZv1QMAW+SfY7S44vCZaA5JsSnoGULx1UUbvP6P8j2jB
         MIjZXtx2qqxvFSSQdyTBgYvkUaifoaEJir+LQBrPtq+qD1EBfBqVK4sTDjf5XwSlqg9c
         yrPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgCr2An9fz09/6NM6GdlC8LBsAcYTehBpR1PgnlbX1++Z2skASO07iGBlyix9kkeWJh9P0uoltorjY23g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwVrox2x6cqasL64RvD/IRhFwFLZaP1tsE0gs6gz/8IqHityew8
	5WFaRdkwuA8kU8tckGNEfimE623E+LZHtqosWfYO+rY6SiKlJhzQMwASZzc3DtOlKQS3vw5bdtv
	p4PCVxz8UTdzkMGn7wIjFI3FSU28=
X-Google-Smtp-Source: AGHT+IHCtWkk/m0gIJI4HjMGIxf6HDCRDpOESUdGt/5A/Krn13z9jK+YnLyf6mEmoZB4cokgO5ouczhwAV6HyE5bjfY=
X-Received: by 2002:a17:90b:1896:b0:2de:ec70:837 with SMTP id
 98e67ed59e1d1-2e0b876f84bmr4254037a91.1.1727441983559; Fri, 27 Sep 2024
 05:59:43 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <cover.1727438777.git.geert+renesas@glider.be> <750d6ac7911aef9a461dca6d07e5c1fab6211ecb.1727438777.git.geert+renesas@glider.be>
 <0bd21761-a81f-494a-9934-877f24b7fe0a@kernel.org>
In-Reply-To: <0bd21761-a81f-494a-9934-877f24b7fe0a@kernel.org>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 27 Sep 2024 07:59:32 -0500
Message-ID: <CAHCN7xKKs9mUvnqZaLE2gCsDau4QtZ706LLoYcS_47-U86-nfA@mail.gmail.com>
Subject: Re: [PATCH treewide 05/11] arm64: dts: renesas: beacon-renesom:
 Switch to mic-det-gpios
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-mips@vger.kernel.org, 
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 7:56=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/09/2024 14:42, Geert Uytterhoeven wrote:
> > Replace the deprecated "mic-det-gpio" property by "mic-det-gpios" in
> > Audio Graph Card device nodes.

Thanks!

> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Adam Ford <aford173@gmail.com>

>
> Best regards,
> Krzysztof
>

