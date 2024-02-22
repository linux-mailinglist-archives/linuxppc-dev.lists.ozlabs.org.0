Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6331685F363
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 09:46:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgRZG2SPRz3dV6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 19:46:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.171; helo=mail-yb1-f171.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgRYp6sFMz30QJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 19:45:50 +1100 (AEDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso6464410276.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 00:45:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708591546; x=1709196346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6Kahe0OhfDh8S9J/Rqow+4MQwXRJQIenHOLMamoIBc=;
        b=OCWn0G8bdWXScp6ebq1uq10+0wTCyrdZOvHXDIvNE+2c2mhTG8SiQTIY3MJitrNh1J
         j77BJ6p3ws6TmDm1jalvwA1Eb5Gl09wqTFfNJM1crcGZnfyd4J7IQ3tImUYuXQn89LlS
         YKYyCDrmMqwxr8IJv/kTyYliS/P2oXZd6MF1kbXRJ2/6YsGx99I0ZrkhbHktySvELZrx
         iEgBYHSsmErELP63LOHWDp/rF/9YNAMU1nXEAF/Ma2vog5LnE47QKrgaifupbXPRCEYT
         qwm6z7OILA5ckNXwkhO387h7aYrO00vm9yXJ16bmBrVLZTBDwekh5Dn7ZWS0iKfkZurl
         HdZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRTd7Gm1mmH2+Mm1NCRPaPGWhsHrBO2kubwD6IJInqdNWLXqm/pAosnqw/0bPXq8WgmzkrWHfw/qbc5hCyvQz2PuBoStjykmpzPp4q0w==
X-Gm-Message-State: AOJu0YxYvO/Kwk21fsoWOgmxDQt/f23v9M766Q9L00DVJiBtevhofXKt
	rX6PSVZei5G4h5p2rLye214diO1niQuYUxV5j58qhN18tMTkkDO4SxPKxLBtYwE=
X-Google-Smtp-Source: AGHT+IE+CmqNYeyc6HgwckV53VoRZtGtYylx/ew9mgFXrdrbRLhAs2cX8laOWT2giOzTaQn9sHXwlg==
X-Received: by 2002:a25:9b83:0:b0:dc7:4639:55d1 with SMTP id v3-20020a259b83000000b00dc7463955d1mr1633732ybo.18.1708591545118;
        Thu, 22 Feb 2024 00:45:45 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id t34-20020a25f622000000b00dc73705ec59sm2715580ybd.0.2024.02.22.00.45.43
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 00:45:44 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60821136c5aso33171997b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 00:45:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWr7bZFXmc7LYZH43NabigN5UeODrb5UC5hdC3lIF1CmZ1rsLq9px+so6OWRWse7klKkbIz3ERUOBRS/0RTC8x7kctBx/QIAxeBCOGPIQ==
X-Received: by 2002:a81:6d8b:0:b0:608:7a3f:d0a4 with SMTP id
 i133-20020a816d8b000000b006087a3fd0a4mr4680838ywc.24.1708591543772; Thu, 22
 Feb 2024 00:45:43 -0800 (PST)
MIME-Version: 1.0
References: <20240221-ps3-gelic-null-deref-v1-1-f4fe159c7cb0@kernel.org>
In-Reply-To: <20240221-ps3-gelic-null-deref-v1-1-f4fe159c7cb0@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Feb 2024 09:45:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXSmf6cKxzzXBYC5Zrkj6QR+2EhB4346d3g-RNTS+W7AQ@mail.gmail.com>
Message-ID: <CAMuHMdXSmf6cKxzzXBYC5Zrkj6QR+2EhB4346d3g-RNTS+W7AQ@mail.gmail.com>
Subject: Re: [PATCH RFC net] ps3/gelic: Fix possible NULL pointer dereference
To: Simon Horman <horms@kernel.org>
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
Cc: Jeff Garzik <jeff@garzik.org>, Geoff Levand <geoff@infradead.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Simon,

On Wed, Feb 21, 2024 at 5:57=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
> Fix possible NULL pointer dereference in gelic_card_release_tx_chain()
>
> The cited commit introduced a netdev variable to
> gelic_card_release_tx_chain() which is set unconditionally on each
> iteration of a for loop.
>
> It is set to the value of tx_chain->tail->skb->dev.  However, in some
> cases it is assumed that tx_chain->tail->skb may be NULL. And if that
> occurs, setting netdev will cause a NULl pointer dereference.

Thanks for your patch!

> Given the age of this code I do wonder if this can occur in practice.
> But to be on the safe side this patch assumes that it can and aims to
> avoid the dereference in the case where tx_chain->tail->skb may be NULL.

The compiler may also lazy-load netdev until it's actually used,
avoiding the crash?

> Fixes: 589866f9f1cb ("PS3: gelic: Add support for dual network interface"=
)
> Signed-off-by: Simon Horman <horms@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
