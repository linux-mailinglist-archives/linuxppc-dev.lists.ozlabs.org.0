Return-Path: <linuxppc-dev+bounces-17169-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHYqIRrEnmkuXQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17169-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 10:42:50 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 667CD19531D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 10:42:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLV4k4yyLz3dfy;
	Wed, 25 Feb 2026 20:42:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772012566;
	cv=none; b=UXC9sLTq9CZlKdL+FA4eYSXXFvNNAbhMnOLdGAKfotejAOGcLILPP3o5g8Trkh9DwNfgIgBXMI0TzIIupedrWANcI9eDf9swx/PO8cZyABc4cOBIrUPmn3lUuhFF3w45SZlepK7c0fH2hGRTAbFwqvR/xgc8bxlmkf0oZlfrFsa7t88+OTsD+4SGPo69Z/tkk7r/C01BBWc1ePYnyba3fsNw+zOCwGHPLI2PffrhtuO62Bh/uX/F7ceFYXewcSy/4YzHc+rx23kAQ5flFcI+UyvBJTM5t1kgo1lITUTuCLpWDGNJQl2gt7jlvkRTNJC0aFq2wlDAs0zleMT4GCgbrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772012566; c=relaxed/relaxed;
	bh=A2FVw1Jjv4YamguvXiaYBNnqdEOuqllBWzjW+UVlpnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OkYNyJPFLpTn6ykURFA3prtKyCnNd/jF4onXGBzW7ZfzxXKXQNZH6ZH+ZdodIUoUKZ4MTwnbhSKF8dN10n/e/HC2iy228uAm5+2kVKLMzFr6lQMKuq42MxjjmlM1wjrK6Unjx6mqrTt9FD2527c6ljlCY8fZEsmj9NsV1f0281+aoK4IzRaTvRWz3etnvVzTgaTMA33BoCi6GpuiCVdz8DrDwUBlWT90tjexUdiTMlSxE0yuOGIdYgQ/24anIu1eIKGApj+riy6z/lm0vgbLgOuc8cGHGggJ2rF8srT5XPD4xGN94qnRMxYpJFlaqJ9XiWO7jwY6EaNcMMZs+hV76Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mT9Spqfg; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mT9Spqfg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLV4j3GW7z3dXj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 20:42:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B475A60103
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 09:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B4EC2BCB6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772012562;
	bh=K9a2s9JYkj0KSLlC0p3v78WuyHO3yDxajztaUeqowf4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mT9SpqfgCsu/X3E++A3RmEyNDeS1Jlb38T25+6EctL4aTNtrYmIn9sJwobi0Kjivc
	 SIWlIil8HD6rI4tZWkASdHUvWoNLME+BBS77ASy39EdP9AEAvu8Grv97sZx0mgt4gA
	 FeuVzd0nOinFN0twGSxBNd48CSosm2UTZtSO4BSCkLC9t3U6SY6VNPtrfdwBTtZPix
	 cjoD2KrAApoFMf/6vraGzPtSqKDsk0JAwdh9JUpg0jU9012elBvMgLfvKfToNyDphC
	 cRF+6q6DtW/u0Fl2wkp2IU3lxk1cSXZg3CgiNc7XIWbaJI8xW6WZRbGZZKtucy4U+G
	 mWWi1ENNudy+g==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-389e139ee5eso5180361fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 01:42:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVFNhxKw4XJ+ERT8bmekcqtKVt7OVHyegyRmUBWEqzvQ6mnTkcFmQirkXOk37p5fvUkolsoHFnaelN1i+4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxj5p1ZFSRgqJqpKAV3KGYgspVOybEbC2ct1YH0yCGT/tyNkmDa
	Nf3y/8qMI/f9/33d7uqtOmsnuKf6FmeMQN38wNtOosY6BbBwv0fPVV8sPF9LBJAXHkFCnxsvdxj
	bVSxTTIOdsqSAtwIIQ4JGzN1rblpjHv+a9eCtzkIMeg==
X-Received: by 2002:a2e:9e46:0:b0:388:25c1:d969 with SMTP id
 38308e7fff4ca-389a5d14de0mr32354961fa.9.1772012560925; Wed, 25 Feb 2026
 01:42:40 -0800 (PST)
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
In-Reply-To: <20260224183213.GA3239922-robh@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 25 Feb 2026 10:42:26 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfAuDqQZQAPXnJPJ9P1OV38dsQb0CWCh_EtZVq_G9dwsA@mail.gmail.com>
X-Gm-Features: AaiRm52qiNgvNEan0Ja9tgnzlKTIzAcLn92f5zLzhmXEy4_h8wLWb64Qeoqf4C4
Message-ID: <CAMRc=MfAuDqQZQAPXnJPJ9P1OV38dsQb0CWCh_EtZVq_G9dwsA@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] soc: renesas: don't access of_root directly
To: Rob Herring <robh@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17169-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:chleroy@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:driver-core@lists.linux.dev,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 667CD19531D
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 7:32=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Feb 23, 2026 at 02:37:23PM +0100, Bartosz Golaszewski wrote:
> > Don't access of_root directly as it reduces the build test coverage for
> > this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper funct=
ions
> > to retrieve the relevant information.
> >
> > Suggested-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> >  drivers/soc/renesas/renesas-soc.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/re=
nesas-soc.c
> > index 38ff0b823bdaf1ba106bfb57ed423158d9103f8d..bd8ba0ac30fa91fcf2a10ed=
d0d58b064650085cf 100644
> > --- a/drivers/soc/renesas/renesas-soc.c
> > +++ b/drivers/soc/renesas/renesas-soc.c
> > @@ -6,6 +6,7 @@
> >   */
> >
> >  #include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> >  #include <linux/io.h>
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> > @@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
> >       const char *soc_id;
> >       int ret;
> >
> > -     match =3D of_match_node(renesas_socs, of_root);
> > +     struct device_node *root __free(device_node) =3D of_find_node_by_=
path("/");
> > +     if (!root)
> > +             return -ENOENT;
> > +
> > +     match =3D of_match_node(renesas_socs, root);
>
> Doesn't of_machine_device_match() work here?
>

No, because we're using the returned address of the matching struct
of_device_id later in the function. If you think it's a better idea to
introduce of_machine_match_node(), let me know but I think that should
be done separately.

Bart

