Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA615924996
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 22:49:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SH4Zj0MO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDFQ54Rs4z3cyf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 06:49:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SH4Zj0MO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDFPQ20dsz3cXL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 06:48:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 42DD161F9B
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 20:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE21AC4AF11
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 20:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719953319;
	bh=XSP7UcJ2D5LrCSQQ6xjlc13J4cCPY/UwXaVdyrjho+I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SH4Zj0MO6dwU6JylDy31rRaLEqDce+H018fT6jImpUKeGTaYI+cAwrvCpQv7jNukU
	 DIOiRTwdKru2xYPSjKYdKhHB7rZKt8vUXY6G1c70s+QEGIxlmK6DCU6FjIOIvog/SB
	 wOzNDcjfAJljOYDKUjavpmfTfoYpt9tGbfl7Pjlvtu2z5ZM+MCNJ//4eDHBfQHgtRO
	 pG4GKxCd/fjeC1PKAJQ33c9YugXGP4u3RsLbZ1cqgl0nErK9C0O7HdcLVccJUcsmco
	 MWD1NUjYBVWF+oy6M4surPdcGYtyuBITfy5h/+oya/8VaZqYEUg6xs9mr7KPZrk33u
	 Bc42wZOp/CcMQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52e96d4986bso792e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Jul 2024 13:48:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVK3cKWOyAk35wzYifWeVbOBVGKCBUsjokBCx3uV5Xz3or4mGZ+QxVgaVwAFXV2S7kGbzKjVrRLfdwB0+yBmiXBaEbwkf/iB5GwVhCNUA==
X-Gm-Message-State: AOJu0YwZTP8G91NV2kvS8iQsTCtAZ4ZOqEvQHPCOtJbYgg6u/XZINZmr
	6YRgecn5oViDJhxakMyQ0+jH3OXl0Yb5mgMwiU0VGOE3iUgXiZqOXfuJ+xsBChPRuBvjm2RHrfI
	cmwibAslQxhcQMlzz73nToBPX4A==
X-Google-Smtp-Source: AGHT+IF5h+XH9Vo4eaNorGEHLOkNM/85fqjWjFjU4KS8+4jdTSMWo0Xm7m4AuM80pi3ahYssXlzXXvKAi8m1a2Z04X8=
X-Received: by 2002:a05:6512:158b:b0:52c:df8c:72cc with SMTP id
 2adb3069b0e04-52e82703ecbmr6879482e87.43.1719953317947; Tue, 02 Jul 2024
 13:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <3ab66fab-c3f2-4bed-a04d-a10c57dcdd9b@xenosoft.de> <86zfqzhgys.wl-maz@kernel.org>
In-Reply-To: <86zfqzhgys.wl-maz@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Jul 2024 14:48:23 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+_QZHMJGHqw8vFA5CspuouvY_U=+NobYQ52DcwPQx-2w@mail.gmail.com>
Message-ID: <CAL_Jsq+_QZHMJGHqw8vFA5CspuouvY_U=+NobYQ52DcwPQx-2w@mail.gmail.com>
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives
 after the of/irq updates 2024-05-29
To: Marc Zyngier <maz@kernel.org>, Christian Zigotzky <chzigotzky@xenosoft.de>
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
Cc: apatel@ventanamicro.com, DTML <devicetree@vger.kernel.org>, Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 2, 2024 at 10:54=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Sun, 30 Jun 2024 11:21:55 +0100,
> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
> >
> > Hello,
> >
> > There is an issue with the identification of ATA drives with our
> > P.A. Semi Nemo boards [1] after the
> > commit "of/irq: Factor out parsing of interrupt-map parent
> > phandle+args from of_irq_parse_raw()" [2].
>
> [snip]
>
> My earlier request for valuable debug information still stands. But
> while you're at it, can you please give the following hack a go?
>
>         M.
>
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -282,8 +282,10 @@ int of_irq_parse_raw(const __be32 *addr, struct of_p=
handle_args *out_irq)
>
>                         oldimap =3D imap;
>                         imap =3D of_irq_parse_imap_parent(oldimap, imaple=
n, out_irq);
> -                       if (!imap)
> -                               goto fail;
> +                       if (!imap) {
> +                               match =3D 0;
> +                               break;
> +                       }

AFAICT reading the DT, I don't think this would fix it. imap should
only be null if malformed. This case to me looks like interrupt-map
has the correct cell sizes, but just never matches to do the mapping.
So maybe imaplen is off and that causes us to end up here, but if
there's an error I don't see it. A boot with DEBUG enabled in
drivers/of/irq.c would help.

>
>                         match &=3D of_device_is_available(out_irq->np);
>                         if (match)
>
> This may not be the final workaround even if it solves your boot
> problem, but will at least give us a hint at what is going wrong.
>
> I have the fuzzy feeling that we may be able to lob this broken system
> as part of the of_irq_imap_abusers[] array, which would solve things
> pretty "neatly".

I think this would work and would consolidate the work-arounds. It
would need either "pasemi,rootbus" or "pa-pxp" added to the list.

Rob
