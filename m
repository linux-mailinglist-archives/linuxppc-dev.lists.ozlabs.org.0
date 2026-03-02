Return-Path: <linuxppc-dev+bounces-17546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGrqHWbGpWnEFgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 18:18:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AAF1DDB17
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 18:18:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPly81nDmz3bn7;
	Tue, 03 Mar 2026 04:18:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772471904;
	cv=none; b=ZLj7+A7aspNDuQVKc/U8kMBADOkObGPji2rdRmQdJf1LYt9A6Mb7/jx+j2trjRNWggaX/LYeO+tcQNR8rGxFUbWdQ41gM4bPz7DIOAWWF+1rJmT1w5z3yMqcQaFO18R1PHr9/Z7lYQ9Z+gJei1wxmtakHl6xL0ohmYa4so+kjlwm7phlfzWaiNceilTGZxJSNFYfYwv8h0/X1ihlmH2fP6JEC8LvIbv+bFcLOvKi8i9E1AQfxsp+gI0V4pXnRvvpUQErfq2Nw8ddl5EcXrW3OWyKkDLuU4coVpkIzlULvLpjMfmYBZA2H5kZGT5LkxPEFc38w5YO4QNzWx1ItOPoUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772471904; c=relaxed/relaxed;
	bh=2AyTmtGapKV3ZDBpXl/zEatvMugJVMPsu8CkfUGOdnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ct2zfVG2TiBo59qfUOpf1k+iN05nrDiGR1HndYjVsjKCn0M8iva5mbya+mTwethvm/GKI0HAFh6gyOypn5YA5OjfYh73sWZw6ZmPAYuSsUEFb3/sj+5tvQJ/2EYyeN827gkEsO3S4ubFaGgSAzCuM5xsRFLzyYAx46rKbzaMeXI0ZUX77cj6JC/OszSP0aYogtDr9UzqrOEw8mdnPnSvDuJO0DcD390ay8z0GaBsQlA1AYc/KqLec8mH3qIboJooGKOU074Y0VOIDoAp49KOq1mmiD9V941uFwiJgTJTewX33tZjx8r7BZNllPngJPb7nJG+4pxM5O5Pks/jqz5NrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kb3Nqe5R; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kb3Nqe5R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPly71dzXz3bmc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 04:18:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FDBF43E65
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2026 17:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD06C2BCB1
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2026 17:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772471901;
	bh=+MqM9KmRITyYRwaK2vO3M8KAYNBFVTYRhLwmb87Tibc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kb3Nqe5RRQ6fZzn0hWpidUfbL2ksozo7iqaxctiNEtWQg41IQH7CybnHljjB6FoYE
	 tSqIamkvZDxigySxPoGdI/0koM8f95QpBE1nv/YQ6xf+CWYKIwIQT17nJnZKj9D1uU
	 gHmiMDtDSr6R8cgZGprDUbS0MDKyrdTvYRBJo4AKX5I3FqPu6dPUeUdM6EfGSah9/c
	 K7u5M5qykk2BStQ3UsxRnqWs0FXcuJhgCnawQcW6y5xsruO5RS0j4A0zGSRKHHFd/Y
	 ixHTWvP+28P17nLzxy813d5t+NivpygbdSHdkY8Wb8aGpAKPaQEClVjIjgG5G7dP4G
	 ZRjj3CL+wcY0w==
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1279eced0b9so1685443c88.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 09:18:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVbkR7swYTsuuLcV/0oyH8xW/fv3XAnrTfBbtyLGnJJFtTrrZfPEUZ+NjK2iKhkt6IIBaP+Hr+jd9cpARE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YysulSgwE9AdkRKg4Roi3AtCiwZD6kaHKTqvDZilgBHiKC9S2qw
	UVFYbZ7NUZB49WI5O1J1hZ//XcI+4IDkCG1emtA5FgSwPasWud17+UpOwRadjDFSBqJQODnXQEo
	AshODRHrJLBaP+OvBsmn8gjg5Ri4MbSsXJ5pS4oiDNA==
X-Received: by 2002:a05:7022:2524:b0:11b:c2fd:3960 with SMTP id
 a92af1059eb24-1278fbff709mr5725970c88.28.1772471900307; Mon, 02 Mar 2026
 09:18:20 -0800 (PST)
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
 <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com> <CAMuHMdX-rdzLhOFEJYBXzCYX5jH2E1=ydGWKgNkD0Nqx-tGr4Q@mail.gmail.com>
In-Reply-To: <CAMuHMdX-rdzLhOFEJYBXzCYX5jH2E1=ydGWKgNkD0Nqx-tGr4Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 2 Mar 2026 18:18:06 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfwQm58Md+rH0gfwAdKf2mdtZ=2VRDzXQOZpGVcQgeyMw@mail.gmail.com>
X-Gm-Features: AaiRm50zY2ACynZYq07UnZgsPpbD86ujojZTOhhFyYjI7hbWVv0-GS9VJ_fMHck
Message-ID: <CAMRc=MfwQm58Md+rH0gfwAdKf2mdtZ=2VRDzXQOZpGVcQgeyMw@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] soc: renesas: don't access of_root directly
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
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
X-Rspamd-Queue-Id: 46AAF1DDB17
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
	TAGGED_FROM(0.00)[bounces-17546-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:saravanak@kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:chleroy@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:Frank.Li@nxp.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:driver-core@lists.linux.dev,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 5:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Bartosz,
>
> On Mon, 23 Feb 2026 at 14:38, Bartosz Golaszewski
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
> > --- a/drivers/soc/renesas/renesas-soc.c
> > +++ b/drivers/soc/renesas/renesas-soc.c
>
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
> >         if (!match)
> >                 return -ENODEV;
> >
>
> I still find it silly to add a call to of_find_node_by_path().
> In your reply to my comment on v1, you said you don't want to add
> another helper.
>
> Currently we have two helpers in this area:
>   1. of_machine_device_match(), which returns bool, and tells if a
>      match is available,
>   2. of_machine_get_match_data(), which returns the match data, if a
>      match is available.
> But there is no helper to return the actual match?
> of_machine_device_match() would be fine, if it wouldn't cast the result
> to bool...
>
> As there is no cost (binary size-wise) in having the helper that returns
> the match, too, I have sent a series[1] to do that. The last patch[2]
> is an alternative to this patch, avoiding the need to add a call to
> of_find_node_by_path().
>
> [1] "[PATCH 0/7] of: Add and use of_machine_get_match() helper"
>     https://lore.kernel.org/cover.1772468323.git.geert+renesas@glider.be
> [2] "[PATCH 7/7] soc: renesas: Convert to of_machine_get_match()"
>     https://lore.kernel.org/10876b30a8bdb7d1cfcc2f23fb859f2ffea335fe.1772=
468323.git.geert+renesas@glider.be
>

Sure, I'm fine with this patch being dropped and your series queued instead=
.

Bart

