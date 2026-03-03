Return-Path: <linuxppc-dev+bounces-17638-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNCvFvhTp2lsgwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17638-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 22:34:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 615041F7998
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 22:34:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQTbS1qxNz2xSD;
	Wed, 04 Mar 2026 08:34:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772573684;
	cv=none; b=IcVLJu285Cs6i7Hu+1XQ3grgHn1xMynuwDL/fcQfJ7LGhJDq1dEiSnG7V7YX8JDJLs+lV+ioyMrj4G8Se8Stb6THsq1p/SSfPMCCOZgtqOsoGeNPeFd9okZk+cbplrJaSasqBeMpEFSYIUQ3X6kC9TYg/CqgU/j2Rme8yWhi7SrcUcmVinL+3iKKaOuZCHhLwh5pc+/w3+dYTdAffEVLAH41dk1SJxbCWDpy/8q+LeaEL6fWH4eGtqLtgjMpxuTLO62bvcb/yIDk6Dfd3UFGxOWRl8wvtUTADYGlHB7qWm0T7WckBMsF9z76MWQ/rBzufE8PqZ5zltEfGP5OivOlrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772573684; c=relaxed/relaxed;
	bh=KeyOHxlHCpyTOk6+yaQldBTlhnYnaDxjHKFxz0vCsko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZnwbAOjRvr4daO//vObn0mW+vlonpBqwk1uMDynMLQ5h7Q6jaW1kit2MfRXZMi0dzqdq7tLLUmSZ0k5R71eGfLqGBR1rQZzi3GQkEPdWI1q5uy8LMR57MM0SsxuObxOy0VZ5o093PMP/x+gqfT1ZXnzdB0iVLlB8nRPBKcUx2dyRuVFDqnA/FjChY211DfTc33pHABjZvXPdrjOio+bJJr6FEfHQACj/skOU6YvI3jLEoXiJ+AfuWuQL84njOvAJxhIMHMuTQzC++yHfIDK6N7yiBjBeRTTKZZsq1voXmpewAY6Ks5pp+j8wQ+w9K4MJcd+gDypl8oXH+5N28JdCBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.221.177; helo=mail-vk1-f177.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.177; helo=mail-vk1-f177.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQTbQ34GYz2xR4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 08:34:41 +1100 (AEDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56a981f44c9so2731296e0c.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 13:34:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772573679; x=1773178479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KeyOHxlHCpyTOk6+yaQldBTlhnYnaDxjHKFxz0vCsko=;
        b=fX8QPJKbfWqRubItzSb49vynTl786s2NxxciqtLltHkxa8ru9RuFoSBu4BY+Q4kouH
         OTy9cM1YSYaUODL+EuCHVM36hJFrjG9FJTB3aScEMZtNWm4crdK/e9n+woZsCNtPI6Zb
         GcanuMC9fQKcVBRmEOvqGgjja/EqeLf0zHdiprjVW3Zr6yOzvOUG+0r6l34ZLj45ZKzi
         3Ug+NsLoIXWLOXqvErrhMFxg40MxYZPIGxDNvmYMG2ngwvTdNNvAOJls7cwqf33kpqCk
         0JeObaSqlrOOucnRr/EijO6StKLJEZqFZffnDgh/FLgxFNllPdlyb8PuWs4DyijmbIGM
         DKOg==
X-Forwarded-Encrypted: i=1; AJvYcCUB7YatYdWkNOVddUzLMcKh3lHKHyEyj7itq9TKXnMi9jlLv9nAOdYKtXIn/S1hn8+boFR4drkJR2VswuQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1686s8SBqXPPY9yCSa6niAmvyCH4725p7UhGNEHP0G70ezkIO
	t2jtNNgd5/MXzWjxVQbGn2Gn9QKq63VTT89jICnPljKkrWbDOEJGoaiSnogwxva1
X-Gm-Gg: ATEYQzwlI0wntHBrlbMSLyzWtzbAO9cA1bQqsmCWMOLa8BhT4TQfkrtZn3kefrBHhBv
	dmLBGChN7CP8z/S5XdVvU9mXX7LmJJgDUSwL+6VyA2wYBTg1l1EDRF0dSFVR2COk3593Clv1H+K
	c5bkTD3uTmDCEex3dqiFnlTfuror4sSoYjejlf2yWk3kHcWwFUrOFUbAY1X8+QjWq57E2jOMyYB
	B9EzEDZu7gWrm7BGro9XPvc3054CpoQsObOqmjtAt6aw9l1g33okWL919y6lMKxdvoNYc0haF7v
	9AbBUQdkmhXL8cAaZc0yNG+fe8qda6Hd81y7DhFX3LGXXl3MAO9cFywtXt0+wQEZDGBacPWh4iz
	Iij8rx88WZSit5hDZiWV4GOho+iApmdcHo7E68qhNCY2vbUQOVxwfLbExGD/Lfiy5apwRogkBR3
	7qbTyreSz8oOQ5l8/u71KOaNM3Wlf0Le6MqHW77KowntWyN0KetlHlpXh7U/eoEQbi
X-Received: by 2002:a05:6122:1b05:b0:55f:c6c9:e4ba with SMTP id 71dfb90a1353d-56aa0ac3b1fmr6854834e0c.13.1772573678469;
        Tue, 03 Mar 2026 13:34:38 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ae16a4e31sm1510987e0c.11.2026.03.03.13.34.37
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 13:34:37 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a8a20e6e6so2746090e0c.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 13:34:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTAg1+7mKBoURhc0o//uvqATzErzUqXWYoYo0uq5AR85eOjpmcQJXsv2eYbsKIZ1Jmnbof9/vNtPmq07o=@lists.ozlabs.org
X-Received: by 2002:a67:fb87:0:b0:5ff:a16b:9403 with SMTP id
 ada2fe7eead31-5ffa16b966cmr493900137.2.1772573677268; Tue, 03 Mar 2026
 13:34:37 -0800 (PST)
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
References: <20260303-mpc83xx-dtb-v1-1-592d27492019@posteo.net>
In-Reply-To: <20260303-mpc83xx-dtb-v1-1-592d27492019@posteo.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 22:34:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXZYuDn5RRFFUp7kXFDn_fMZuqHbXmSJie4ofEv8NxXfw@mail.gmail.com>
X-Gm-Features: AaiRm50LfNGqwLPwMhPV4lBP43hdFBFszhhM8HNs-2mio-oWff62BhKycGhdbWU
Message-ID: <CAMuHMdXZYuDn5RRFFUp7kXFDn_fMZuqHbXmSJie4ofEv8NxXfw@mail.gmail.com>
Subject: Re: [PATCH RESEND] powerpc: dts: Build devicetrees of enabled platforms
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, devicetree@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PDS_OTHER_BAD_TLD,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 615041F7998
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17638-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,vger.kernel.org,lists.ozlabs.org];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:j.ne@posteo.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

Hi J,

On Tue, 3 Mar 2026 at 16:56, J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:
> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> Follow the same approach as other architectures such as Arm or RISC-V,
> and build devicetrees based on platforms selected in Kconfig. This makes
> it unnecessary to use CONFIG_OF_ALL_DTBS on PowerPC in order to build
> DTB files.
>
> This makes it easier to use other build and test infrastructure such as
> `make dtbs_check`, and is a first step towards generating FIT images
> that include all the relevant DTBs with `make image.fit`.
>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>

Thanks for your patch!

> --- a/arch/powerpc/boot/dts/Makefile
> +++ b/arch/powerpc/boot/dts/Makefile
> @@ -3,3 +3,158 @@
>  subdir-y +=3D fsl
>
>  dtb-$(CONFIG_OF_ALL_DTBS) :=3D $(patsubst $(src)/%.dts,%.dtb, $(wildcard=
 $(src)/*.dts))
> +
> +# PPC44x platforms
> +dtb-$(CONFIG_PPC44x_SIMPLE) +=3D \
> +       arches.dtb \
> +       bamboo.dtb \
> +       bluestone.dtb \
> +       glacier.dtb \
> +       eiger.dtb \
> +       katmai.dtb \
> +       rainier.dtb \
> +       redwood.dtb \
> +       sequoia.dtb \
> +       taishan.dtb \
> +       yosemite.dtb \
> +       icon.dtb
> +dtb-$(CONFIG_EBONY) +=3D \
> +       ebony.dtb

This fits on a single line (many more below)

[...]

> +# MPC5200 platforms
> +dtb-$(CONFIG_PPC_MPC5200_SIMPLE) +=3D \
> +       a3m071.dtb \
> +       a4m072.dtb \
> +       charon.dtb \
> +       cm5200.dtb \
> +       digsy_mtc.dtb \
> +       motionpro.dtb \
> +       mucmc52.dtb \
> +       o2d.dtb \
> +       o2d300.dtb \
> +       o2dnt2.dtb \
> +       o2i.dtb \
> +       o2mnt.dtb \
> +       o3dnt.dtb \
> +       pcm030.dtb \
> +       pcm032.dtb \
> +       tqm5200.dtb \
> +       uc101.dtb

Even when it wouldn't fit on a single line, having separate

    dtb-$(CONFIG_FOO) +=3D bar1.dtb
    dtb-$(CONFIG_FOO) +=3D bar2.dtb

lines not only makes it a little bit shorter, but avoids the churn of
adding a backslash to the previous line when adding new entries.

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

