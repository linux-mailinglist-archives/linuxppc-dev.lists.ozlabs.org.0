Return-Path: <linuxppc-dev+bounces-12412-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E7DB88226
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 09:18:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSkP223rjz30D3;
	Fri, 19 Sep 2025 17:17:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758266278;
	cv=none; b=ZLBKM/4KJ8pP0OJtCIi/QVWRkNVMVGziUtHivDa/2CwZLYdu4dzov3OQxiP6lwHS4wD5dxuATDPeS2RsjZcJ7rd9EY9D7sHEy050CWPN38Z+aY7zdtcC4rjcPCwXW/kSgxo+aBgZZkv54jKr37HJIOhO+l3z02cGJ6DkEe6m7J+ZAey+/2bsrLps1qqsQUtYb40OdbqH3dMRdfFjsyS/lYrB5mjBi3Q8qZq+cHDbIc0m8S35kW9ZibDiaOqswDyd3ARNuY5S7em/qqvhxjyzir3jtMLO9KFGyinhfLZz3k+oaSWmgE2Txjcgb0pqTp2e/c6Maw1Quy7DvzUVWJpl6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758266278; c=relaxed/relaxed;
	bh=jN8ls4Umh9EIXSEQoAkCyXxQ8L8mjN2Gdzzs4J/riyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jRtRft0RcJtQQzCw8+oqWHFJi0wBnR9gCZBROz3u40uhqrGx3VVmxSE4OxFe7tI1nlu/PyaFTfVpN/CKXzT+bC6xfCXcuqCHFoptjMeeQouQMeDMTkcxBLjVCFcHc/SFYtRWccncTV1ZUEXKZwuZ8ZXTGkZwoBBxzHKGLqNAlxdJwcFjmoiOnu/eyHjHFC17bgXx18w/V5m4v+4ZTqnWPqnvI3kihQ826yU8xVX8HXu3Fmah7xMNZJ9MkpGbU07bM0WQoaiTi+nQvMNfFywLxCKAf9+y79MPJmdQ+NqUhejVnUeVsC+TObuqj3nFoWSq2+o69cf0zxO9kT/eNxxWTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.221.169; helo=mail-vk1-f169.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.169; helo=mail-vk1-f169.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSkP04t8Tz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 17:17:55 +1000 (AEST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-545df2bb95dso739029e0c.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 00:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758266272; x=1758871072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jN8ls4Umh9EIXSEQoAkCyXxQ8L8mjN2Gdzzs4J/riyA=;
        b=wpTiwxpgxqvahLKU7adN6Hens66dcYFgaIKTo+Y0pNP3Y3YV43v4Lmkin2jCmV8uGx
         kdq/1zArMnjU+Pp3TuBhlmcujT3dVAzPjJlL0eMHGWI98cB2GY7mwe6GdpBnKHLNIpgj
         hSefIVQYOGoDHhk5fdlKZgaPYs+hSD7FFa4QJeKuLyNq4GG72ExLK+rcs0gfAFyALOSD
         rr7tHPCxnaM4atoC8zkVjgipdGDd9ati1nM3m/E5AllKIFWp4CdMMZ1Bkm7DK4zCt5Qa
         5Ci8D7S9orn0bLiAU+nkzRmxnTtRvt0F5jbU81AvvCLTVtevrptpqfGLwdl6lskRKo1W
         kWTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrkG/arBnPVo+0iYDKu0JJEEMrqyKFl6G5uwoMXgHs+6ZWQSYzdC0eTlBGCkO4VB4O/SMdhvT08eXyNy8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxB5IucUJZjqsiYCGNsmjrCAGvUvXZkvLIeZE6Bqu058vW0amPN
	b5DFRJAN5ySH1pHoJhtT+iL4UWb0MrwimmgvsESMHkdUrDik0WVoU25seZZEuHXI
X-Gm-Gg: ASbGnct94T2FevfY/QP0km7KpNbwZjB8XR69qnLteYatI/S1QQEIK5iZtMR+ZyobGJg
	0wwJaRVmndkvqPl0clqdyjYzpUvbqte2YqFxKUvCmfKbXtizLUz9AzMw/JcG9eoxbkGvQKET719
	1k2qhXPG6eFWvtPdLmn7y5Q4wT6uyX1Hd3/HX42P96cz1GC9vRE/ovtYEe/Cx+nfOovW4xzob16
	mJVoCpfOYSpYI6+gShytBek6Cfl801XIIRBM91vzbOC+zHx+LfnzUZLwEKvq0KG0qHTWsb7mUQ8
	p+WmJmtb3zGOdQL5fthUmO4szlbPBkKWiO/0KsR0AdS6CNttsWQ6zUzAWJWgeP5XKKYSbKx+z6u
	qeR5fErICk1l0iU2TYG3+23oK4s2sqWFZjin1yQSJgyvqbSUxe0jPnaSlfxca
X-Google-Smtp-Source: AGHT+IFe+FKUZ9OZO0qyzLOZ4hCPVZbceFmbSUTilC03Rvq2OCYXamQ461ZGr5xuiqgmPbzpVC4smw==
X-Received: by 2002:a05:6122:caa:b0:544:9414:105f with SMTP id 71dfb90a1353d-54a837c5148mr769603e0c.2.1758266272346;
        Fri, 19 Sep 2025 00:17:52 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a7275993dsm1018845e0c.10.2025.09.19.00.17.52
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 00:17:52 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-58bf3b15575so47159137.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 00:17:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWr84jkgpKNUf7uwqsDiIS98oRXPMZFPTthMd/oBLQ7RFV4HiLH21s41SBaOWg2ol+PYhbrK7Qani9oHK4=@lists.ozlabs.org
X-Received: by 2002:a05:6102:534c:b0:55d:b35e:7a58 with SMTP id
 ada2fe7eead31-588f3357b74mr639278137.23.1758266271934; Fri, 19 Sep 2025
 00:17:51 -0700 (PDT)
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
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com> <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
In-Reply-To: <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Sep 2025 09:17:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
X-Gm-Features: AS18NWAI1tRNfDFQjIFUy24j2rmv5VjIZdZQpBy05JHeqlSMB-7iVf4odZQDlmM
Message-ID: <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, 
	Lucas Stach <l.stach@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Arnd,

On Thu, 18 Sept 2025 at 15:13, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, Sep 17, 2025, at 14:59, Jason Gunthorpe wrote:
> > On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:
> >
> >> I'm still collecting information about which of the remaining highmem
> >> users plan to keep updating their kernels and for what reason.
> >
> > On this topic of removing some parts of highmem, can we say goodbye to
> > kmap_high_get()? Only ARM uses it and only for
> > !cache_is_vipt_nonaliasing() systems.
>
> Good idea. I think we are almost there, just need to verify that
> there is actually no impact for existing users. I already knew
> that there is very little highmem usage on ARMv6 and earlier, but
> I tried to recheck all platforms that might be affected:

> * Microchip SAM9x7 is the newest ARMv5 chip, clearly does
>   get kernel updates, and the only one I can think of with
>   DDR3 support, but seems to be limited to 256MB total memory.

Are they limited to DDR3?

IIRC, someone (you? ;-) told me at ELCE that Microchip keeps on spinning
new variants of old SoCs, to accommodate the changing DDR landscape
and market.  So perhaps they also accept larger RAM sizes?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

