Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 243507D0E23
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 13:08:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBhdz0pCSz3vX3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 22:08:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.173; helo=mail-yw1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBhdR1NVPz30hY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 22:07:53 +1100 (AEDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5a7ad24b3aaso7267387b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 04:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697800070; x=1698404870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W0tXFYyVXNiSpns+Mi0YzAxeIB5UtoY4Qzk6NSDbAd4=;
        b=XgkXAcdjkpZaJ4kZz7qX+TDP3bUtbuuftTg+Sj0d5evrH5d5WXdMDVcsNYyooZfRA/
         HvH9vTqd++ClB0M5F3g6ZYopXy4SDurvY0xPew2nUGJgML7jt/8Js4SKh5pFtSE5l/mn
         uIrlZVtxr2AjbRZcLvjkSupVHkkOgNaGXN0A2LBan+JpomyUniGE6gZW3K09cGdkFyyg
         kj/e5UCR+pKKF4jmK0P/Bj5pjbwJpycSjy1NLhSZ7fdrNDOhVQ6IQqR3mNOz+9SzcPpx
         IA9/XsEp+HX0acAxmm049SYji8Ts8yiz95IhQnE8mL5g3bTBM3NLZJKOiOKccnEH6wKd
         cokg==
X-Gm-Message-State: AOJu0Yzg83fLNykHKRLYRLFaiAksxFd+ErSOVm2DQ1rOFt45DiM150Pl
	CPAPr6yNUrKcN4mc41nwkafBS+iboE1Udg==
X-Google-Smtp-Source: AGHT+IGAZji6T8WX2Oowua6UYbi6nq1s+ZLhtMok1uubJ1MJUe9o8A0J6oxfn+UijY4Y6Oyb1hPyKA==
X-Received: by 2002:a81:4844:0:b0:5a8:d86f:bb3f with SMTP id v65-20020a814844000000b005a8d86fbb3fmr1684684ywa.8.1697800069654;
        Fri, 20 Oct 2023 04:07:49 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id o207-20020a0dccd8000000b00589c103d00asm596420ywd.79.2023.10.20.04.07.47
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 04:07:48 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a7ad24b3aaso7266987b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 04:07:47 -0700 (PDT)
X-Received: by 2002:a81:4e09:0:b0:5a7:c50e:8df with SMTP id
 c9-20020a814e09000000b005a7c50e08dfmr1699674ywb.18.1697800067486; Fri, 20 Oct
 2023 04:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231020093156.538856-1-chentao@kylinos.cn>
In-Reply-To: <20231020093156.538856-1-chentao@kylinos.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Oct 2023 13:07:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUo8tEBQa6soZm=MUWLy2AnkL6Vszt7vzbs-peb20=myQ@mail.gmail.com>
Message-ID: <CAMuHMdUo8tEBQa6soZm=MUWLy2AnkL6Vszt7vzbs-peb20=myQ@mail.gmail.com>
Subject: Re: [PATCH] treewide: Spelling fix in comment
To: Kunwu Chan <chentao@kylinos.cn>
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
Cc: jeff@garzik.org, mokuno@sm.sony.co.jp, kunwu.chan@hotmail.com, dcbw@redhat.com, linville@tuxdriver.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, edumazet@google.com, netdev@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Kunwu,

Thanks for your patch!

This is not a treewide change. Hence the oneline-summary should be
something prefixed by "[net-next] ps3_gelic"

On Fri, Oct 20, 2023 at 11:32=E2=80=AFAM Kunwu Chan <chentao@kylinos.cn> wr=
ote:
> reques -> request
>
> Fixes: 09dde54c6a69 ("PS3: gelic: Add wireless support for PS3")

No need for a Fixes tag for a spelling fix in a comment.

> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/net/ethernet/toshiba/ps3_gelic_wireless.c
> +++ b/drivers/net/ethernet/toshiba/ps3_gelic_wireless.c
> @@ -1217,7 +1217,7 @@ static int gelic_wl_set_encodeext(struct net_device=
 *netdev,
>                 key_index =3D wl->current_key;
>
>         if (!enc->length && (ext->ext_flags & IW_ENCODE_EXT_SET_TX_KEY)) =
{
> -               /* reques to change default key index */
> +               /* request to change default key index */
>                 pr_debug("%s: request to change default key to %d\n",
>                          __func__, key_index);
>                 wl->current_key =3D key_index;

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
