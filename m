Return-Path: <linuxppc-dev+bounces-11985-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0334BB5132B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 11:50:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMGBv15N3z3d39;
	Wed, 10 Sep 2025 19:50:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::134"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757497815;
	cv=none; b=b4Iu8mk5APjnbAgEJds1r+qaOpuJNf2nfUOZs5/89s83+N9l0CGTjiuBd4Z0er7d7oTMJgYyMnlj9noybRDHSDqzarwjytwC4wtIcus0VegAOROlSeXAYGnkCStN6uqzzhe4EjtM8oEWnyKEETWSYT5eTMqo9AObDl1X8xukllKtUTIxmnGkpKeOhZwn5gSu3dkbkSzJgJFHFpHprF1F41DIXm01gXk5rlCJ7cyJXF/+GhM5p5Dc4VgI8jfAppX7d2xMaTdy4xloJEMg3Qg0EeaO9b+sbynuGn3pQ+kSzZbUavi8LvTOvqhRvp+8BFUoTJp8pu9W1QEQljlbjkws0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757497815; c=relaxed/relaxed;
	bh=8Y7rG79FKOI2JeBB22WORiCW6ZRk/F6yyki8GX6i0OY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+H5Uub9y9itj57AVKmIEioZ2u5R4VWow/l/dRT0qTTK+32gZngcA2Hje8nXznfdZ9vaHMdlUUiNciFynbwbAzwFEez1LRxSA7T2I2A6bDijAeR1rRoDP/hl9rjCzIb5eXstgAm5Be2I1NILGdqm03gctQXDhsSYJ5Y0VDoeEXic35tjRXQL2RGsIYK6ISGqgvYYA3UUSk7T40lAp+SLUsQ3Yw/IPe8f8VIFVOIy6c3d3w0t4//qQa2f/ZLaHc45ATZSrrTuJWiz6AjCL7PNtoV63rfJ9pTK2UPyb25Ny3QgJ+HMkaPZOh+LEVR5oOe54nSMjAp8+48ZDTDuV+xaDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GrbQrO1I; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GrbQrO1I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMGBs38XZz3d2B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 19:50:12 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5608bfae95eso7521514e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 02:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757497807; x=1758102607; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Y7rG79FKOI2JeBB22WORiCW6ZRk/F6yyki8GX6i0OY=;
        b=GrbQrO1I33qsi7/pX4q7ZF9EMTn3kSwIA48ERxw12uNKymFnuYc3P3q3XBF0+FfRBf
         Pd0QH49u0qhKsbeI5dOjXrp95eKMNuaLLQ8Nl1EajrIobu6l9tAfg+unFn9enl0HLFF9
         5SXUetq+BrUbNw9btwdftHP5Ba05QY3+s2tHPstrOzAoufI8dlCEyocIHp3ddMD6Cd8s
         4Mj2k3nbjsMv1t3xnogwkEUXxJtBmltvpfr3Y0qYzYpddHhVD8hqzAXRJ8+vcoFwqdas
         02MLFJwEVKurInnSDntreknznjNJpRZjvpJR5K/29SwO8XO1r5SEwZjwvG+1GOvSnkzs
         g3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497807; x=1758102607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Y7rG79FKOI2JeBB22WORiCW6ZRk/F6yyki8GX6i0OY=;
        b=fBbHxcQNJx8pmJppst6vA0jBfClbGFEx3z6xrFYuVYR7cc7aM8yQEX/JN2HTBnEAJI
         1TKBzZ26eCrC3t+7D7Oddq7MPczgzmsV2dFsoDSwzVkVXxJzyLcDtBg6HhR+KRdwYQUM
         kWOKYmJDB45oGlBooksNsm8lod4tIKek4rsEuaK34xMcHSQMm/UDPf+Ex9bDRASKIvS5
         eGm6CJS1Qp97X7UUibBR2tfiQqw4ok/QYvvAdF0CZlK2HoxWm3v7rJihB99NyfIu+lX2
         Ql4+LNwNRE4/O66+iqhTMFlpW7BgNbREWK3sf0H8cQCps5mFOcJKSvckh4TWwsVz+pLa
         HHrA==
X-Forwarded-Encrypted: i=1; AJvYcCXdL4NytFqgAf/6CffoFMqKIjTgVc8BDpLmywJHQRyi9MxFZUc9Vfhylj1gtkbibplTr7HX4UkFgVY9CbI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxSH20E5gx2kT87volAEoW7okw4n9UttZoftesf4tTucqqBgAPf
	3icEuA9Bjow2R6hCEAtVG08qipHgjYN/MywFEwHmnJLCOPhny/v13P1ePNZGSA/tN4oJX5KbQE3
	lbT+8FutH38rCuO4I+ADJSp5pgxx7IBXV/MzMRGh0QA==
X-Gm-Gg: ASbGncspSB6Rh+iL3LzHavdqVSwiypkMre/VjXHYKJA5FWHp5Lhgz7/nOW9/og2HBqa
	2Gkvk0pAOZCQ4LEvSe7RkGYuHbf+gXG1RLjcCFAa9vjARkgHlBBc2MRZMqguxWSbJmfwyo+TQ5O
	M4+clRUiL2BF08T0NPWSmqXFr9ui3U7ll3HUWtUcoEI5owURRXqp3JP5/6UApu3xE2qMYSrqoAK
	93r37w=
X-Google-Smtp-Source: AGHT+IGq2x91wz7j8DANH/yJwpeO4d/hIy0ABq1WES66C1SeY2aK74/VWAJ5lsiz89NvTXBUTDFt595MC0reZwFBRxA=
X-Received: by 2002:a2e:a009:0:20b0:336:5e1f:b1ec with SMTP id
 38308e7fff4ca-33b536f14b1mr41029971fa.31.1757497807337; Wed, 10 Sep 2025
 02:50:07 -0700 (PDT)
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
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <aMDYdp3H-yOHU1Pm@casper.infradead.org>
In-Reply-To: <aMDYdp3H-yOHU1Pm@casper.infradead.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 11:49:55 +0200
X-Gm-Features: Ac12FXxu2Penmvb-ANhZIzZlxEacPcTMGZ42OzvKFfqr5PHU2ajbCjOLxBc-XSU
Message-ID: <CACRpkdZZZNV5BdNhyXEK__=EJLjDtAEsc2Kv4Tv53+=Mv-8R=w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Matthew Wilcox <willy@infradead.org>, Russell King <rmk+kernel@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, 
	Lucas Stach <l.stach@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 10, 2025 at 3:46=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:

> I don't mind that the feature remains ... unless it causes us trouble.
> Which it currently does.  Perhaps we could start by removing HIGHPTE?
> There was a certain amount of complexity introduced into the page fault
> path when support for that was introduced.  x86 removed support for it,
> so it's just ARM left before we can remove the complexity again.

I sent an RFC patch so we can see what Russell has to say about this,
it is currently only enabled by default on the VT8500 machine.

Yours,
Linus Walleij

