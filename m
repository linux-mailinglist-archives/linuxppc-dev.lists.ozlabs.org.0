Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A05BB759B68
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 18:49:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=owITUim9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5hcz2HWCz3bf6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 02:49:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=owITUim9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5hc31Qh1z2yVl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 02:49:06 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-55b5a37acb6so721334a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 09:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689785342; x=1690390142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5oKfuESxM+AbYitYVm52qNXw+XWHUNvJL7SdYQTD1A=;
        b=owITUim9KtkXTm/sHKMPJvCR/Jav8bcKjZmelH3deMYE6RexIHkb7sP3I00tgazDpN
         da7AgknVpC8VAJNcX8VrnfM0/c2nYuWoMoj348aPdQD62ThaVkNUGx4TlQ9bT1twfY+L
         V37xhOQprPMRZ62bwcqIrQ/ANrY8i/F7DINqbH+pAz3PMwc17I47lXAA8mazLZoYkSs+
         e4KVLu8EiyNALjRG3IUvy6Du2Xtg6nUKm/TJLQ0/yhXySVjBudtU05w57yI8X4oP2HuG
         zMiAr62Tb3nacDfS8qkLI3sXrBe1Ms709DsKUN8jhbC0hU4Tsxcf+gC/HmiwzwGn9o82
         JvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689785342; x=1690390142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5oKfuESxM+AbYitYVm52qNXw+XWHUNvJL7SdYQTD1A=;
        b=f1PLwAsz9rxWJc1o1JFKs/h6lZGiO+s/MJghWqIc5f6qszcDpIDCGcOBOBkWPz7q6j
         WoFVQxjdHkKWWmc0ecIY5oJNtrx/ISyqgd2NCnGH2NG3oRKK9vmSXuvNS+kU4g5pywVC
         yefO/xZx73oC0dZJ2D0qsKWcCddmsUNMZdYTjBhBl0VJ4+ZAbUct4xizoNBhG3adguWf
         tJbUElZ9lhRV8aZ37DoulLaDev+jCVGX11MTK3yLI851Y3al8OXayNo73GQoqn83l1fC
         GVjwk56M4GbcAbH6ZJ6tTGhMPFTHCowYTbibB2oqEl8ldXjrTYeJwYkHF8cHy9+b7sL0
         apFg==
X-Gm-Message-State: ABy/qLa0tTtq+xl6tuvKXvL9PeJh12cctBPjGcslRP9vq1jnybNSFpYi
	rQRLtjBJdI2zK0c1RHEcu8/DxyQOHw7xl7b64GE=
X-Google-Smtp-Source: APBJJlFVxTBOJZyOAApETTi1cRHOhfvHsqzZIpoAZFguJ4tWPkKoTOnqKPrWk2Z72eDkR6FaHpGVLbFHpVIf9yUfU3U=
X-Received: by 2002:a17:90a:5386:b0:263:484c:f173 with SMTP id
 y6-20020a17090a538600b00263484cf173mr2648285pjh.2.1689785341744; Wed, 19 Jul
 2023 09:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230719163154.19492-1-matuszpd@gmail.com>
In-Reply-To: <20230719163154.19492-1-matuszpd@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Jul 2023 13:48:50 -0300
Message-ID: <CAOMZO5A6BYuJYr_6mLSKhAYTQYpki3otdrOaH7Gw+2177rXn9g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Add support for 22.05 kHz sample rate
To: Matus Gajdos <matuszpd@gmail.com>
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 19, 2023 at 1:32=E2=80=AFPM Matus Gajdos <matuszpd@gmail.com> w=
rote:
>
> Add support for 22.05 kHz sample rate for TX.
>
> Signed-off-by: Matus Gajdos <matuszpd@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
