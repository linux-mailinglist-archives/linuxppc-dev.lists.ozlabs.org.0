Return-Path: <linuxppc-dev+bounces-17211-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DHyBw1un2mZbwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17211-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 22:47:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6AD19E007
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 22:47:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLp9M6Khfz3f4W;
	Thu, 26 Feb 2026 08:47:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772056071;
	cv=none; b=HU4gJHAn2PBAt8Dd569Wv+19qz63lq2cibum4KXCZ9D93rQuYjyalmunfMEKL+iW9XsuONmx8NcCUx1/Ck2Qv+OOIFnTyCl92/pvc1trioC/me1sWVq3ye4MqS8+IJyRXBcGOkXUN9nV1WkdI889SXPRYDv/dKElN6HOWeBhqqwOHhpnYxsmeD8yto1D0+I/2GPqKfCG0ugPDb4/3TTKX03fmAFuu8SoYPY+1/LAJyg/+L17xOgH4RhTNdLYVw9BgXc3jhVM6nWJO0idoZN82eiBCiiZ0XDWMRE2tHDqb5WgZxGg9aXAkOqNQzjd1LdfgKvfVK87M592oKzNPmHPWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772056071; c=relaxed/relaxed;
	bh=qynXNHPWMkC/Dsp1GodjENA+o7nP+5AXv7EbouCSYiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQu/CWoVy1u1SoFeg7/JCH3ILzLx2EcI/9VnBR79Mw1SBeEN6W2TShbhxJ9yI0/9GGNFmzSogTHyUR+USdpJr1c3eqPvIZB7vlFTdR+fbcO60M75LUlP6sQcAnhG63xxwri68m86iShDukXUM6Tzaag7/gOA24m7oEyw9vqm/WxzQhtA3FFf/biqnu6kGEojkSfZEpcMb/W/9rjaNBcrDGyZP4HnuFxrSlvIyMEsZPab+sJMCSIMFxLm+kmGcICg/mTYAYjGJ5RQBopSYhjiNXxx2POJv7/ujDPKQz/1zszen88ICrXy2E06g6LsYkkQ1LJcKyP1TvYiZeeI3eikag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lNwdo0nU; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lNwdo0nU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLp9L4sKHz3f25
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 08:47:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 43E6060122
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 21:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04BAC2BCB0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 21:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772056067;
	bh=l8N6B+v3LKcBSMQDhhMsq1Ou4LUvHgBtC7GiADD7q1o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lNwdo0nUY0vYNlniM9tZn3gVIj62mw9G4B/6roySJN2yYSIKp3Wl6adjb9q3m7M8F
	 3U+qdqQuwsI+L/D53LkkRLNmsjH64zrvmQTYwG9xtZtg4urFoV+mSrjt5/M7pDxJ17
	 8QLkWyiQTcRJumUZJgjzpV+z2Eh54aP0okn5EnZwMfz2RBGa+s7aJwxio2m7V2W4PC
	 pRI/La+3ZJOEnrHypTCrYI99pE1Q2sWsaEhLPWj3dDAzEKWait8gxLs1TWDH+upu+U
	 jVutIDBZwWqE6SmOFaC15sUFxWQIrY2XSL16u9bGwI1tnNY51R0tVq/D+TDSM1Kzak
	 vTu8DBpj4e92w==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9359c0ec47so5157666b.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 13:47:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWlN5EXAgvjwQqkCrbqSbz9DmgEq0A38gFviigLEKoioIrVgj6CJpEYK6xpkVEtXithYnf8Zwz4cksVNck=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz559qwojJ1txfrCB7+4AMpuEFnGtcbqNcQvwpnhoT8ghYVgk/0
	AgL7PnFNalWBJn95AUGAbWDsyNg13c5tTkSqCFrmCJZVmwKgut2Ya2gB47eonaF7gSurfB/1Q7R
	ox2vxQdybliHn1qb7hVg4CGPlnJX0Lw==
X-Received: by 2002:a17:906:38cb:b0:b8f:7200:63bd with SMTP id
 a640c23a62f3a-b9351794335mr92810866b.42.1772056066379; Wed, 25 Feb 2026
 13:47:46 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com> <20260224183213.GA3239922-robh@kernel.org>
 <CAMRc=MfAuDqQZQAPXnJPJ9P1OV38dsQb0CWCh_EtZVq_G9dwsA@mail.gmail.com>
In-Reply-To: <CAMRc=MfAuDqQZQAPXnJPJ9P1OV38dsQb0CWCh_EtZVq_G9dwsA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 25 Feb 2026 15:47:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLr3zzBfVujuj2kO3VCngV-wa97e+xEQj_sjakzRXyZSw@mail.gmail.com>
X-Gm-Features: AaiRm539jdazKEwDTNuu6a7Fra_2vBg28zXqHEjYX1GN3S7PxX9gedX_Y-Td3eI
Message-ID: <CAL_JsqLr3zzBfVujuj2kO3VCngV-wa97e+xEQj_sjakzRXyZSw@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] soc: renesas: don't access of_root directly
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17211-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:chleroy@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:driver-core@lists.linux.dev,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 2E6AD19E007
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 3:42=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, Feb 24, 2026 at 7:32=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Mon, Feb 23, 2026 at 02:37:23PM +0100, Bartosz Golaszewski wrote:
> > > Don't access of_root directly as it reduces the build test coverage f=
or
> > > this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper fun=
ctions
> > > to retrieve the relevant information.
> > >
> > > Suggested-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.=
com>
> > > ---
> > >  drivers/soc/renesas/renesas-soc.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/=
renesas-soc.c
> > > index 38ff0b823bdaf1ba106bfb57ed423158d9103f8d..bd8ba0ac30fa91fcf2a10=
edd0d58b064650085cf 100644
> > > --- a/drivers/soc/renesas/renesas-soc.c
> > > +++ b/drivers/soc/renesas/renesas-soc.c
> > > @@ -6,6 +6,7 @@
> > >   */
> > >
> > >  #include <linux/bitfield.h>
> > > +#include <linux/cleanup.h>
> > >  #include <linux/io.h>
> > >  #include <linux/of.h>
> > >  #include <linux/of_address.h>
> > > @@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
> > >       const char *soc_id;
> > >       int ret;
> > >
> > > -     match =3D of_match_node(renesas_socs, of_root);
> > > +     struct device_node *root __free(device_node) =3D of_find_node_b=
y_path("/");
> > > +     if (!root)
> > > +             return -ENOENT;
> > > +
> > > +     match =3D of_match_node(renesas_socs, root);
> >
> > Doesn't of_machine_device_match() work here?
> >
>
> No, because we're using the returned address of the matching struct
> of_device_id later in the function. If you think it's a better idea to
> introduce of_machine_match_node(), let me know but I think that should
> be done separately.

No, it's fine.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

