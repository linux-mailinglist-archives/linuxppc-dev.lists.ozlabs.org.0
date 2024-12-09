Return-Path: <linuxppc-dev+bounces-3851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB43E9E88B7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2024 01:33:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y62rr3LQ0z2xtt;
	Mon,  9 Dec 2024 11:33:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733704380;
	cv=none; b=mqQcvOD1DLJvp8pcgXyjhI15/OuRB/rejygxRWCkeZ8ZV2MlqvBEiLXUUr1rxwehEZJrV8wfIGGMGGTEqxiO/y+r7o7a75Cb4s/VF+UoeTwN70vKCjenAe3UCVkuQjTFuqH3BCfQnNviNk1gZ0HqO3Nt9vcJiUErY+iGv+kY+xNMm8q93Eu6Mt4gdwOWoymJx4BLrQmYPQgN6r/bbQ7Wdp4xCAmrfdichewnmSNHc1bIKmuMWH8InY6IPibCgk1NGC3OIo1HycWhX/rapoGcqVOMvfeeZaUly0r5/88D7xYnT+Iiwrze9aMm2ZnxEdq4yjXGOMh4sGemNym83z1tLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733704380; c=relaxed/relaxed;
	bh=rk/kBvGXbOiTTCvnHv9JwPUrIgzBbvNG0YVTljgAwPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DhoCPolBXHFTZIglij0yzt+dE2dY+WiSX88HT0RJ0vp1rBdC5eWRDwbJsd0+NxlQkm4NsqaJ14zT+ffmd2dAtLz9ZswDr12Qq1MaPgvBOPdPTwjMcMjIrL5Vvl09VrNoTuLCsRvqebqavbht0hUv+0uFljOPJCE5UsUGDO/Okv46Vv0hic3J06d7kpmVXEkMBMjvNyOojHgDgXKq1LYskquDTC3h/CMFqTL4VqrucI1oxBWm4D/DKmD6GW3lmtPWRj+D7HjyVHiIflkEbywROw2aBGGH4Aeh/3x7NnZw3SGTE9goe/GEWRRMEPFJzNs3cU7mk3KE0XvFb7jzM4OZxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Y2RJTTvW; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Y2RJTTvW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y62rp3znRz2xtb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2024 11:32:57 +1100 (AEDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aa67f31a858so100907766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Dec 2024 16:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733704370; x=1734309170; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rk/kBvGXbOiTTCvnHv9JwPUrIgzBbvNG0YVTljgAwPM=;
        b=Y2RJTTvWN8SMihKtSvq1xAkNuOoxPlZqpsWhXf4hgKh93m/XhMFurdefMOkNQ4Veqg
         1kZG0JtEidCBMgvNaRtTCR00L3KjgsmawmuKvAArNb6QE+gxIA7dkKehx2gm+ZWr10FE
         y9DHoKHLgcRcWb+Ryu45SMEbn5eR3iEakJnAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733704370; x=1734309170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rk/kBvGXbOiTTCvnHv9JwPUrIgzBbvNG0YVTljgAwPM=;
        b=rVwRnBp+SqJE+5M5e9/vJWk/O4TiT88Jg1lBBBti9P0Qm+Q4lV6SFoRKscsCGji+Hh
         hgPDlAVz2WJ8JpeDX88v0qwnjfofMEtzU0kHElg8wmondBrDrMt1jdVUD3+4MPhVdNMw
         VyB8kWeQJwFDKptOcIINmv6GIGGXrSeKwBb06xoMiAYhF4rByj7WWG6qwITGl57JMBUY
         TNwUh/mw+zpdLtz9mH+E3EAjMtv28GQoTLTYC40dhNF5Ij4E2Xlj919YDK16ogEQ1DX4
         rSZ6wevvXZ3DaxSAXg5ps6OO4nIWTE1kN/HXUL9QZfHYEBXytrKg/K6icNKbmF8U1wrR
         7mJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxahU0FekoncWcKswmC118C2r/buKxo5tnDkuuvMBSOAPvz7T5iTld5zLrf7oR9vgr3dzSR1YKts5TP2Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyQu0j7964JFOv4aZsX+NC81NDyvkTxP+Wrzl1NZ1FT7U1/q4II
	+SHy8EtITCcNzu5yufrM7VuHcRaqvHQTBuK1WKKiBtJ3bAFiuOrdz+lKMAa3nWdsiQxl5mHafc8
	lOGQCPQ==
X-Gm-Gg: ASbGnctHJvNLKGooFsTfqTblcGLjGCJpzzSvb7TDTU1D6XffYYxW6asept/gxYio6E9
	rkaRRAx7L35SRIHsEoqsqo8hfIQN/dts321BaaUbadpAAYryNf9YZC6I2/zhy7hOJT0CmP5YBv6
	vMDnyCOHJWVb8KY6Cpq+am7a3K6HIz7UPC6sxfczafB0i/0njg0CeaL5ynczum+5f6MgXds6K1B
	nmfYJN6Y4RV9Hae6fyj3rQmZPFBU/WcpZCEjjNVot5enl5ztd9xB0SzH1i6ral5FQ3oreefGX42
	RSegc3TU6dVBdlHd6oZCXln2
X-Google-Smtp-Source: AGHT+IGaIJGOYuDC5ChlPj6aOKddS9BwDRUbT1bJb0P13JtZFPedOTdg+1aC9r38+JxB2FllIDX7Lg==
X-Received: by 2002:a17:907:950a:b0:aa6:832b:8d71 with SMTP id a640c23a62f3a-aa6832b9844mr195039366b.2.1733704370377;
        Sun, 08 Dec 2024 16:32:50 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa659f14faesm286310266b.101.2024.12.08.16.32.49
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 16:32:49 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa67f31a858so100904766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Dec 2024 16:32:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRmXp1TS+sp7oqOzwOtLtZCFsCr8H6hqVPuuZpGzLwOoL2JnGyfIbHpL85I4/gvYPxbBCFDBvo3s8SQLg=@lists.ozlabs.org
X-Received: by 2002:a17:906:31cc:b0:aa5:3874:c646 with SMTP id
 a640c23a62f3a-aa63a031645mr1031456266b.18.1733704369344; Sun, 08 Dec 2024
 16:32:49 -0800 (PST)
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
MIME-Version: 1.0
References: <20241122193305.7316-1-torvalds@linux-foundation.org> <87bjxl6b0i.fsf@igel.home>
In-Reply-To: <87bjxl6b0i.fsf@igel.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 8 Dec 2024 16:32:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjnvFU3sMjjKyqtgvPe6EMu3M4f1qyZncJR5=QDQsV=ng@mail.gmail.com>
Message-ID: <CAHk-=wjnvFU3sMjjKyqtgvPe6EMu3M4f1qyZncJR5=QDQsV=ng@mail.gmail.com>
Subject: Re: [PATCH] futex: improve user space accesses
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 8 Dec 2024 at 14:54, Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> This breaks userspace on ppc32.  As soon as /init in the initrd is
> started the kernel hangs (without any messages).

Funky, funky. Most of the diff is the code movement (and some small
x86-specific stuff), so for ppc, the only part that should be relevant
is the futex_get_value_locked().

And since ppc doesn't do the masked user access thing, so it
*literally* boils down to just that

        if (!user_read_access_begin(from, sizeof(*from)))
                return -EFAULT;
        unsafe_get_user(val, from, Efault);
        user_access_end();

path.

Ahh... And now that I write that out, the bug is obvious: it should be using

        user_read_access_end();

to match up with the user_read_access_begin().

And yeah, ppc is the only platform that has that
"read-vs-write-vs-both" thing, so this bug is not visible anywhere
else.

IOW, does this one-liner fix it for you?

  --- a/kernel/futex/futex.h
  +++ b/kernel/futex/futex.h
  @@ -265,7 +265,7 @@
        else if (!user_read_access_begin(from, sizeof(*from)))
                return -EFAULT;
        unsafe_get_user(val, from, Efault);
  -     user_access_end();
  +     user_read_access_end();
        *dest = val;
        return 0;
   Efault:

I bet it does, but I'll wait for confirmation before actually
committing that fix.

Thanks,

                Linus

