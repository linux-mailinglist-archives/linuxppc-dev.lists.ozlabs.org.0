Return-Path: <linuxppc-dev+bounces-12415-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CC9B88530
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 10:07:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSlV173Tlz2yrK;
	Fri, 19 Sep 2025 18:07:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758269241;
	cv=none; b=CUwaGCK01C19YMvncYkBE4SPtvOmisxgDyRGNVQH7FeC7T/9vaOGBpk8XBSZ4ZQc+jRVM+RlyaXc4trTUK9vJ9mcPGtAqvkc4KCDOMOCd00Hu5F4SUh1iIwx3DwphoOYol+BhCy9rGMSmMRBGv3YggZroIsjMculqQDZuyaoFIsJ0zt21ZMBJJoPUFESxbUDWBel7i4CNQvAVlWZfAgc/kNn1KdIpUZ8yhjpRDcFCdxowOpktB6JpNRPuTWDEZE+px1luw+aGGZQ4IdhX9Jtvjc7YjrOYTRNDT6w6EB7ko+CUKxX4g7FQCJSsKOaaRly9nnKqACUOihetiqSH9tn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758269241; c=relaxed/relaxed;
	bh=Jr2Z8JjLLW516ZnDw+SHlM+3eks1R5blpHFwbmMf0GY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X7vCR1X9YWCQTp/m+P01PW7PWvJFqGb6Kar0JBv62YuyblDhuZBsJ1CwH9PIRrA/SZXrr2ZbD3aPPOcmDENmcu6w4UkJJRjqUrbRHLPF2vMvQvgCGxD8qX+BnrRGbiCxy8mc4HQI3lOgo9bhjf4e/HHd3whTdfmrkhmiu+5PvRkIsDiMo2KOI0deGYBun6ksS+K8PRx/6iVudQEth0IQ4f8G3GDQY49CDMBiBSEvp/xFDhS3rOE0KyX4zVBEvKlZJVcvEKmnOvANE3CpJzfXl50KS4fxCOeSYZ39Rpdh8hLInnmF97jECV+YnCQXG946SkOlMNKEses0c2e8sXcKeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.222.54; helo=mail-ua1-f54.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.54; helo=mail-ua1-f54.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSlV10mNjz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 18:07:20 +1000 (AEST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-8ddcd2cd4e9so769848241.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 01:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758269238; x=1758874038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jr2Z8JjLLW516ZnDw+SHlM+3eks1R5blpHFwbmMf0GY=;
        b=EzbnP0m0aYbp5FP/uMXpOfsiDqvzXSBVC2JKAyjGwC/v/71Nfvrubc92xZGPuhE90u
         UhYtGD04Pbr+EVP7x8grYcOeb4VNrNLSLIhEFJikGbapbiU689OOB67cZf/RUxGGNklh
         mkNkl2r5YyZaqAwgkMd+ch2QoOCO/HrR6/jYntAYomUk5naYoVfMACO+kmkJaRWX79b3
         unZ3Jkne/M52VxMSM24MvU7XI99THIGkgixwZVYBNJAbWL4JFth21KQF5E28Z4DhZS8/
         wqtAcjmGRPsdbNfdHT72MCAKDOgHBtIiodtYt9PS2M/LQ+4iRRBYQjylGvxfl/WuWpJi
         OKvw==
X-Forwarded-Encrypted: i=1; AJvYcCV46c1MkBbdewpn5Xq7ivSnSlu8zzipIGbuv6d2q5ZYwLxppuc6MHjEzqki0q9YlAre/rNqldYQPiWwXng=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyY8RBievz5ngTSmp+FpmrjPszMCyw3VwQ9yQ5u6W17vqhE4NZ/
	/4qQ1ld8VigjZVefR949p+12yriPE8vfFjahCC8MhCfigtmvIAhcboCLcH039ORD
X-Gm-Gg: ASbGnctOrgp0wH5bjVCAipJ/ClO8mLP3UwmtnvjHEVqfEUcyzLc8WqOiGAcoc6aPrQV
	yDe6E1oTykBG6VCuUMIn+Ah+CUI48W4tkyj0D+uVIQmR67150koL6aolhPREjZzQpCtvo73tZhB
	X7rgezmvHbxvT6dAYOBWntX7FUs33BelQgKM8qUjL2UE5E/lBuJYAWwxufXEOTi+A430eVMUT1g
	zm2vf7k/mZV6RjPPTXNd5+8yCKLaq7k2WdvSEoLjkpUZsGeub9UT7tJz1F9bW1lBM7NmOemu2U8
	jGvkfOoVR7GjEMDTBB2Hq6nOXmb+3G7n+F6quFZwL/Y3AEO+PJ07fyPisM+Jtttj2zZx+hSlYqi
	xn2PngqwncKLNl13H+c/rGiB973FQ9AkgHt/oRlFJxMbYXZQTolarMs8bcioj
X-Google-Smtp-Source: AGHT+IHknL+02mfWzJhY/AbORfOchzZsloPL2ZgnXxUDf7Ggqlll69ViWNJJEYqSUpFuLCnFBxzBbQ==
X-Received: by 2002:a05:6102:943:b0:52a:7083:2f67 with SMTP id ada2fe7eead31-588ee660bd6mr529212137.24.1758269237422;
        Fri, 19 Sep 2025 01:07:17 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8e3e2e04775sm863741241.0.2025.09.19.01.07.16
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 01:07:16 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-89018e97232so584363241.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 01:07:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVg/rt63zI9+N1Gozjw0t4jXKh7QP/IcDEBteZ1iqfRWKz0IXYGgp8FhCh9WlpqsMiBer2hzB2OmmI552I=@lists.ozlabs.org
X-Received: by 2002:a05:6102:1627:b0:4ec:c548:e10e with SMTP id
 ada2fe7eead31-588d76ebbc2mr727213137.3.1758269235705; Fri, 19 Sep 2025
 01:07:15 -0700 (PDT)
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
References: <20250918114840.53581-1-abarnas@google.com>
In-Reply-To: <20250918114840.53581-1-abarnas@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Sep 2025 10:07:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUi1z3T5dFL15x23ZmkW-m9tzLADYtS0rwKb7KuZrTegg@mail.gmail.com>
X-Gm-Features: AS18NWA24mwTgPwJuiV4lrTa76WLXSZxDgw8vBVbC4rxB2V-sO3NiQxEmyRWCCo
Message-ID: <CAMuHMdUi1z3T5dFL15x23ZmkW-m9tzLADYtS0rwKb7KuZrTegg@mail.gmail.com>
Subject: Re: [PATCH] arch: powerpc: ps3: Make ps3_system_bus_type const
To: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
Cc: Geoff Levand <geoff@infradead.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 18 Sept 2025 at 13:49, Adrian Barna=C5=9B <abarnas@google.com> wrot=
e:
> Because driver core can properly handle constant struct bus_type,
> move the ps3_system_bus_type to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
>
> Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>

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

