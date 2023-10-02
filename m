Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4357B5717
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 18:09:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uHpSZwV+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rzm9r3FW1z3vfV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 03:09:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uHpSZwV+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=mcio=fq=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rzm8x3WfMz3cNl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 03:08:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3A78FB8119C;
	Mon,  2 Oct 2023 16:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEAD3C433C7;
	Mon,  2 Oct 2023 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696262924;
	bh=A8RHgRJTdq1YDreXk6pMR2+4zGGe3daZlhUNpP+YvT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uHpSZwV+lJDbbehLSb/Spt3d5nct5tqN+zguTdzkPGP78BtxJA5slWfkTHCE8nFQo
	 5Yp3/oCpoJUvujCt8oxxEYnhBkzbbfdWcUXXSLMC2qKfBUPFd2AhM75roBWtzG12r+
	 zyO3n4G2YX0Ps18ARR/RDgmN7gspcIylPGhayXOz1Z3HxoUpPcb7dfOrvn+RuO5jOI
	 k2O/32V4DaM8k2gyvWyggG3PutfRoMw1ofZehwhbd+Ft3ixdNjLhr1VYMPu4nJnQko
	 xeOCGFGk/lxGzbnX61GXQT0EuQIbzaoX+ArQPRhaz4CGLZCfceZXmw3nFUYhiiDYic
	 5M3ipz/e+xiTA==
Received: (nullmailer pid 1849866 invoked by uid 1000);
	Mon, 02 Oct 2023 16:08:40 -0000
Date: Mon, 2 Oct 2023 11:08:40 -0500
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v7 25/30] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <169626292036.1849826.7381200671829119399.robh@kernel.org>
References: <20230928070652.330429-1-herve.codina@bootlin.com>
 <20230928070652.330429-26-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928070652.330429-26-herve.codina@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, linux-gpio@vg,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	er.kernel.org@lists.ozlabs.org,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>, Simon Horman <horms@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	"David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Thu, 28 Sep 2023 09:06:43 +0200, Herve Codina wrote:
> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../bindings/net/lantiq,pef2256.yaml          | 213 ++++++++++++++++++
>  1 file changed, 213 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

