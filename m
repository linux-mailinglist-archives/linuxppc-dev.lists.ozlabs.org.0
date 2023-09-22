Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8987AB2F5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 15:46:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=biE04lp+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsYTc1FDxz3clT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 23:46:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=biE04lp+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsYSj3G66z3c50
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 23:45:55 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BC371BF20D;
	Fri, 22 Sep 2023 13:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695390352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3d45HSdjEBrGWXzT/hFE6ZoKYqY81rYCMtjLk2B/bLE=;
	b=biE04lp+7hE+NLdqozy2BgZPaAjb3vaTtdsBnKCNRXF0qN2XFtgDbT6n4cqLkcqbHptxLb
	oeMOmF7eHyF3aNQjMyD5QaHQjivx7ot6sdz0fFd0QcreP+88erVcjSDntCACDudD3RcyQH
	iK/3cWyQ7W7XAH8Riv34zdtaG/ZaF9U8gRbBkmmXP9wtu9Dpmv+8fBGDH2uHlFgTVuaf+D
	vUEEo2o7OwBll3KiAvIkjzGSfu3326QoSexo+bH5ppzRDvkVMmXLebD7B12+Z2XnIyyhNX
	ouCNBvOA0rABVPgSWhVwNkW32WK4XjYvnXpRZzPaNCdSCfw9y1M3ExfRT98Eow==
Date: Fri, 22 Sep 2023 15:45:46 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 25/30] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <20230922154546.4ca18b6f@bootlin.com>
In-Reply-To: <169538601225.2919383.2942072541503354871.robh@kernel.org>
References: <20230922075913.422435-1-herve.codina@bootlin.com>
	<20230922075913.422435-26-herve.codina@bootlin.com>
	<169538601225.2919383.2942072541503354871.robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>, Eric Dumazet <edumazet@google.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Li Yang <leoyang.li@nxp.com>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wan g <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, S
 imon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob,

On Fri, 22 Sep 2023 07:33:32 -0500
Rob Herring <robh@kernel.org> wrote:

> On Fri, 22 Sep 2023 09:59:00 +0200, Herve Codina wrote:
> > The Lantiq PEF2256 is a framer and line interface component designed to
> > fulfill all required interfacing between an analog E1/T1/J1 line and the
> > digital PCM system highway/H.100 bus.
> > 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > ---
> >  .../bindings/net/lantiq,pef2256.yaml          | 214 ++++++++++++++++++
> >  1 file changed, 214 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
> >   
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/lantiq,pef2256.yaml: properties:lantiq,data-rate-bps: '$ref' should not be valid under {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> 

The '-bps' suffix was added recently in
https://github.com/devicetree-org/dt-schema/
commit 033d0b1 ("Add '-bps' as a standard unit suffix for bits per second")

This commit is not yet present in any dt-schema release.

Should I update my patch (ie. removing $ref) right now even if this update will
make the last dt-schema release not happy ?

Regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
