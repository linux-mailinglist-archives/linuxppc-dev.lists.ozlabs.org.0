Return-Path: <linuxppc-dev+bounces-17238-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF8FMlASoGlAfgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17238-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 10:28:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B73031A35FE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 10:28:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM5k2359Hz2yFd;
	Thu, 26 Feb 2026 20:28:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772098122;
	cv=none; b=Tqt798Y+TdgqUuy1f+6wgOP4mx2fG1pJoElzZ4a13+IjukdR9S2I2etoVS+muYHy4hCX87+4c0Gcg83I3eWxNaarpxKBxy8E44QYAG1eNPCPLfu0Tdqj3Cooc+OoVxtfe6zMHwjcJQ8zGmY3Ye/pTaCiavw4Q7DIc5+7n9Ie8Pa5i3uoZhUeiaXd8yvD5W0CJPcP3QQoflR6qsF659kONJDopl4EWWWAqwCAxBHnHryYNXuD03PSxS+9zP5eRk07cPWp7lwQ9nUZ//NC9Z98SPVzt9dr7fOixNnnymLH9TYYupgC3YlST851H9MAS8ZJmv2zi1VAWBYCEw1hoSu9PA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772098122; c=relaxed/relaxed;
	bh=Q+JPGjs/pGTsOGNIOl36KuUbk8oNei+wKcehtvsLCRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXFzl89hAgP5hny7rpEIWDa4fpZbOUNpLxpo8/+YMWH6lhnvC9yRfmk2MghBWWzsqX8XaQ4wRbyhwAU9n7DquaSRt0ayJy2L6N5Asj2z6MF3uNKwwQ5YcS3lKUy6ISzVeUDP1zUSy26T06YHv9hX6rmIgL8h/X2NXnAoSp93sNPxOTzAzNAngPnhcxVv6EknDXKZ0ZjMbQI8XE0qxLbRmriN083RtLM+xSFdxKEi1TVjvmPOmQ4lCc7Zmq7hsaCivCrHr8kvQF+EwZLDcqOWBkANElsBZ4DtiLpB/jafQ3OFRr7M2fUt3t4g1TSELu7wwLuxPIg8ItIi6bRjHvxxcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pGu5+ci+; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pGu5+ci+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM5k14l6bz2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 20:28:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A804444593
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 09:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D26C2BCFB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 09:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772098119;
	bh=Q+JPGjs/pGTsOGNIOl36KuUbk8oNei+wKcehtvsLCRI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pGu5+ci+Wn2JAlztc6J6f17nc1u7YqME6JKT+8WKxBgc0aHcELhW8ukVtK0us1QEk
	 vZNR+ptEg/K6oY7fx9VRoFz+7glIPSL8J/f3xTV38nfSLG2Pn+yOHDraiExxbpKF7/
	 RMy3y7yR6cPFN3QrnZsiNvy5AjcqAc72iEN6B5FcJuEqSOhXp2VLav781RZKXGrhyp
	 i9Dll60Oag+79Jj6SFxp8iQwslow7Q5Tc5X3tHYLya1ez1aOHjdGBcNxkq/3lzqwPX
	 wA2XfnV170zB6ymSkxYEUufb58p0kTvV/FvZXmY++w5oMjSHRFhKZm882IOP6064bh
	 MDBQX4QmjpAWQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a10a1617d0so508478e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 01:28:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVOs3+NUUBrxz1O+ZVfWDro6MM36fgNxsfjPJQwQfROnimNnV5GMF6pkW4+e4UB6y1Fm6uLdsahgjesUoI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzDsg808p1bap31vboUKXHC4gcLiEpWwEl8kVDMQLNCa/X0JVHT
	Th8Py/Yy3dS8/SK2G1O70Lu2AQmSLKsf9bLJeSwBIEUSNPzl2qv7lLmv6V7YEVFlHr4+vm8IFPa
	rPG60bNSZivsVDtFyzwX4nvkdgMXwdON+fwXl7Oq00A==
X-Received: by 2002:ac2:4bc6:0:b0:595:9d6b:1178 with SMTP id
 2adb3069b0e04-5a105eb321amr948844e87.40.1772098117903; Thu, 26 Feb 2026
 01:28:37 -0800 (PST)
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
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com> <20260224183832.GB3239922-robh@kernel.org>
In-Reply-To: <20260224183832.GB3239922-robh@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 26 Feb 2026 10:28:26 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mft5vc-C8miKVdw6C-qRdYsqfgm-UgLZJOctFwagMF0iA@mail.gmail.com>
X-Gm-Features: AaiRm51IEGv2tkqYAUL_wlvSqsaBCZdXcGaMbPUU4umqiYT87HTd0LJXBirO8Tg
Message-ID: <CAMRc=Mft5vc-C8miKVdw6C-qRdYsqfgm-UgLZJOctFwagMF0iA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] soc: remove direct accesses to of_root from drivers/soc/
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
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev, 
	Peng Fan <peng.fan@nxp.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17238-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:chleroy@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:driver-core@lists.linux.dev,m:peng.fan@nxp.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: B73031A35FE
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 7:38=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Feb 23, 2026 at 02:37:15PM +0100, Bartosz Golaszewski wrote:
> > linux/of.h declares a set of variables providing addresses of certain
> > key OF nodes. The pointers being variables can't profit from stubs
> > provided for when CONFIG_OF is disabled which means that drivers
> > accessing these variables can't profit from CONFIG_COMPILE_TEST=3Dy
> > coverage.
> >
> > There are drivers under drivers/soc/ that access the of_root node. This
> > series introduces new OF helpers for reading the machine compatible and
> > model strings, exports an existing SoC helper that reads the machine
> > string from the root node and finally replaces all direct accesses to
> > of_root with new or already existing helper functions.
> >
> > Merging strategy: first two patches should be either acked by Rob or
> > picked up into an immutable branch based on v7.0-rc1, the rest can go
> > through the SoC tree.
>
> SoC tree is good.
>
> For all but patch 8,
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>

FYI Rob also reviewed patch 8 now. Who would pick the patches up? Greg
KH? There does not seem to be a centralized SoC maintainer in
MAINTAINERS?

Bart

