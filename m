Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1FC7ABA40
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 21:46:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P4ZZPqOm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsjT63SnXz3cbM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 05:46:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P4ZZPqOm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsjSC2rqZz3c9n
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Sep 2023 05:46:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AABF0CE24D0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 19:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95394C433A9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 19:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695411957;
	bh=Z73INrp+tUCDrn3nt/IznNU60OcEzvbVv581pkRDXlE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P4ZZPqOmhipnrgdjc5Cicuv4gwGoR5ahpSW6RraPJhB2FOCevSoVAq7M03SUqbiJq
	 K7C83A8rvE9vTWF2PZ5kYCMKgg3G1IVvpRh+NW3hqCEKgBE5APzZ0p6is/9D0IzpXy
	 L4KFq+qRrX7Nsl9X/FVhceTOut8PENgISZ7V9Hgc0n17gQFch+sOZHm06uwoEbBMFg
	 bdQku4DZghgBK/X1clycJXNjGfpUaVv8cK0r9G/b2uMU+jMiHYfIm/lqjl9v/3n8cS
	 tduJT5OdwlLHx5IjPVmN9jiMNIWgStlkcTXysI9oJM3ogbUGEUzRoqqQuRZPSge2DG
	 XwBXMnxxa/mIQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-503f39d3236so4420669e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 12:45:57 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw0wwlgOdWWtZNp1eJqbMQdGRLjqgqQYkiSFp/W1egsMP0MZBsT
	FrCoOBdkOJeTTwIB1H8GkGiy7POs383Vt7wxng==
X-Google-Smtp-Source: AGHT+IEyL15UWPDOOifALHGXr9zT3PFp6EFjcQQ6N5sRMKjOVNVOEvEhKETlB6KYvfp58mdiyeysUyZjSt5CkUaQLB8=
X-Received: by 2002:a19:651e:0:b0:503:18c5:6833 with SMTP id
 z30-20020a19651e000000b0050318c56833mr310830lfb.61.1695411955742; Fri, 22 Sep
 2023 12:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230922075913.422435-1-herve.codina@bootlin.com>
 <20230922075913.422435-26-herve.codina@bootlin.com> <169538601225.2919383.2942072541503354871.robh@kernel.org>
 <20230922154546.4ca18b6f@bootlin.com>
In-Reply-To: <20230922154546.4ca18b6f@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 22 Sep 2023 14:45:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJTruTExc=uHCPCp3q-fo+fB-wAJ-ggPpHpWcHSoGALdw@mail.gmail.com>
Message-ID: <CAL_JsqJTruTExc=uHCPCp3q-fo+fB-wAJ-ggPpHpWcHSoGALdw@mail.gmail.com>
Subject: Re: [PATCH v6 25/30] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
To: Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>, Eric Dumazet <edumazet@google.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Li Yang <leoyang.li@nxp.com>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wan g <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>, li
 nuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 22, 2023 at 8:46=E2=80=AFAM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> Hi Rob,
>
> On Fri, 22 Sep 2023 07:33:32 -0500
> Rob Herring <robh@kernel.org> wrote:
>
> > On Fri, 22 Sep 2023 09:59:00 +0200, Herve Codina wrote:
> > > The Lantiq PEF2256 is a framer and line interface component designed =
to
> > > fulfill all required interfacing between an analog E1/T1/J1 line and =
the
> > > digital PCM system highway/H.100 bus.
> > >
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > ---
> > >  .../bindings/net/lantiq,pef2256.yaml          | 214 ++++++++++++++++=
++
> > >  1 file changed, 214 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/net/lantiq,pef2=
256.yaml
> > >
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_chec=
k'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/net/lantiq,pef2256.yaml: properties:lantiq,data-rate-bps: '$ref' should no=
t be valid under {'const': '$ref'}
> >       hint: Standard unit suffix properties don't need a type $ref
> >       from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> >
>
> The '-bps' suffix was added recently in
> https://github.com/devicetree-org/dt-schema/
> commit 033d0b1 ("Add '-bps' as a standard unit suffix for bits per second=
")
>
> This commit is not yet present in any dt-schema release.
>
> Should I update my patch (ie. removing $ref) right now even if this updat=
e will
> make the last dt-schema release not happy ?

Yes. I will spin a release soon as well.

Rob
