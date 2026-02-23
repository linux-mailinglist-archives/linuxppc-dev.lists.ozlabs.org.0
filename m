Return-Path: <linuxppc-dev+bounces-17059-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBAkBypanGmzEgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17059-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:46:18 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EF8177332
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 14:46:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKMZZ2grrz30FD;
	Tue, 24 Feb 2026 00:46:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771854374;
	cv=none; b=a8VkPr3KoOjHfmMXjH0QJGn5+DHnLMjrJfHv8C7heJrV4NF4lzSRW2oC+H5YR+wkvTQlrCCxdH/rgomdZg7YJf3ym+CezeMrKQTj6hjqSrY3Vx1ozSfaVkqrkrPeJy9lbQtMamNqHr/RHwxHLrtYTNsl9FylrfoRy8zmIWGqfVzZARRbLPDk9NgKmN7Agus2zJC8bfKvnwwACqA77dRvWi0yMck6etMEbYOSh5cpg8dxWO8BxudI8JVBPzFCoJIDFZEnIw1lQHaZr9vPkNSMrgZpBQNbGbf8YaKi8nVpakkrH88fIS2ZFvJiUT4hNHFG3tTmfA2JR87ubH4xj0gBvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771854374; c=relaxed/relaxed;
	bh=Z+Cpj50sruElmHklNhyHuwozFbgXojBuiZpoYG3iicM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNIonAulYgi05K5omUfaxGRsYw1QHwRTF1YMROGCnkP0bjZrpiZTcRUpHutoreqEyMrlG5YRHtBTzSq0aPDUBDE0KvAg+qD7EQlSxDhELcFq4sAJRINDSZcPfK65eUfYe1wDXmTDDGxoKaLroBF8WXmNLTfMKaGeXA7R0dNliImYN6bu0LdgWmnj8MMAihgPApwuFnDfubEg1HU/N6cv2C0lFUHmqWIDElQQ/qqafB7r+9QqEjryRRzYFI7tXJO/isKzls3opOsQ77kXb8C3H/JizR9Ag5bn3cUzQ1buZp0hUKtMOmqwVGdNuUyfCvIC+OYQaBziECpCWu6/c2BxHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GEhfoMxg; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GEhfoMxg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKMZY34zPz2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 00:46:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B156143CB1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 13:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E12C19424
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 13:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771854371;
	bh=xHD4QsgF9yMDfM9DNpu+nmQETYKEDBFK3tSyRcSPFXU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GEhfoMxgLPcp6nwBkt61gmLigCTkVgwWzwT0WQNgF2v2B5l7cMU1ELQLt3YHmIdBn
	 5SAQ9FzxXxdkTsua8QRJaj+XmvK4QG19qdTYwSzCjypit9H1KiTPwRh7FtCZ6tkqcX
	 WXpeV/sajncXIUIIM0tJHwJ+863yKm8QK5ecZ7hYMEBA+EhmHfW947NBkxOv/P6+k/
	 5GU11vmBKyLibQb0nd9eewN2w9Z4NQ7gR1ADROg8pSR6Ed5Wd9ZTSFn/kjg+XTxOHP
	 BfaZYFe56E19NFL/uM6za8z+9EKP3PS01Q5PvG/36tELIOBRvrtFao503jbbYj73m9
	 ywb3HTeKvIDsw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59e62834439so4862244e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 05:46:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1Lm5deqeRNFoIH+Dbt0E0JiSm8Ut/dpobu85m/oh+wCZcK9vy77KRWrlgoGTw356DkX5t7/jEe6SBHKo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yximc0DgTRddBgSHsWRrZMUiWOqYtlmH+iX8Rg1CqEfauyssXHJ
	bHPA1c76sZMR8Tha7GUKQVVYXzEDf2LnLPwPtzmMVce+FCMjgz97FNW5Vv5FkA9sDhEAwO2sppi
	8OTHnxZ/A1rrkZZEJLllJnpfd7Gcmm9fEy95k+9khaQ==
X-Received: by 2002:a05:6512:1553:20b0:5a0:ef6b:f613 with SMTP id
 2adb3069b0e04-5a0ef6bf704mr1540983e87.1.1771854370177; Mon, 23 Feb 2026
 05:46:10 -0800 (PST)
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
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-7-32a0fa9a78b4@oss.qualcomm.com> <CAMuHMdU56p9jH8OZ5bpwKq8Q31C-8X85YAjiXZm8amYdo+Xotw@mail.gmail.com>
In-Reply-To: <CAMuHMdU56p9jH8OZ5bpwKq8Q31C-8X85YAjiXZm8amYdo+Xotw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Feb 2026 14:45:58 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeC-MTzEOVw0j4Kq9T0bSXk2gKJr=jn2jO8tqfS7BEteQ@mail.gmail.com>
X-Gm-Features: AaiRm53YdoncmLlrYwWxzOjKhAAi91ZYzJ0VCyHsDsiPleMxR8Z5ZNNGKc2eDc4
Message-ID: <CAMRc=MeC-MTzEOVw0j4Kq9T0bSXk2gKJr=jn2jO8tqfS7BEteQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] soc: renesas: don't access of_root directly
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17059-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:chleroy@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 27EF8177332
X-Rspamd-Action: no action

On Mon, Jan 19, 2026 at 8:25=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Bartosz,
>
> On Mon, 19 Jan 2026 at 11:40, Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > Don't access of_root directly as it reduces the build test coverage for
> > this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper funct=
ions
> > to retrieve the relevant information.
> >
> > Suggested-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> Thanks for your patch!
>
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
> >         const char *soc_id;
> >         int ret;
> >
> > -       match =3D of_match_node(renesas_socs, of_root);
> > +       struct device_node *root __free(device_node) =3D of_find_node_b=
y_path("/");
> > +       if (!root)
> > +               return -ENOENT;
> > +
> > +       match =3D of_match_node(renesas_socs, root);
>
> I am not so fond of these of_find_node_by_path("/") + something replaceme=
nts.
> What about adding an of_match_root() helper?
>

I removed other instances from this series but not this one. I don't
want to grow this series with even more new helpers. How about
addressing this separately?

> However, in the previous patch you used a different strategy:
>
> -       if (!of_match_node(imx8_soc_match, of_root))
> +       if (!of_machine_device_match(imx8_soc_match))
>

Because here, we really need the match structure later into the function.

Bart

