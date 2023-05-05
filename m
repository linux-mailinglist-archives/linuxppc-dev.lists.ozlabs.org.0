Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E846F86FD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 18:46:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCc6133N3z3fKl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 May 2023 02:46:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UzXA/OQu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UzXA/OQu;
	dkim-atps=neutral
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCc584681z3bgv
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 May 2023 02:46:02 +1000 (AEST)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3314ddef780so4840635ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 09:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683305158; x=1685897158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFdQlmBZsVXpMFRWa31Nf9CH5lKcpqbN0ffO9NCLDqk=;
        b=UzXA/OQu44+Be4ajBQzyWDRJ5gzypkk3DPS8vgCkBm5s86T/D2yWZHa49mMa7ahsQC
         0me0LGhxZ+opWQzWiHWbv+B8I+JQDsljOFbjhF4LCj4jBhnQWVYFaRWP01pfP4eYGg/p
         wOtKaA2GjFgXgPJCZy0RIZ+V1I0coDThi5GHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683305158; x=1685897158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFdQlmBZsVXpMFRWa31Nf9CH5lKcpqbN0ffO9NCLDqk=;
        b=AXCnbPUmdfipaXywN1hKwKIroTE0a9taMeKj4sCptgyQ6RCZxyYMbhXVnrrDeUF1ZR
         A1kE8TYw7M6s7GXzAxHbFOZb4y0LLKxecGe4EWVd66FsVUCLEqbEMm7mkwGxfN9DtIog
         Xnzac9SN5iu7611sT0a2ljlo/rpPz8OBHwq5kL5Urp4/gzZosb44SChKfT7THCibtPc7
         5WFxIJ2aivsiiXDZiX+5P1eBe1SpDz3nn6FLXskwg9meB70BAhL/WqcaH66FUTenxm0f
         25xUFL3WMEnA2g3RPlm5vVA1HFyMdhz+6KY2O43wn2S8s7Tr/B0iV1Q5YZzQqJDYA6eZ
         5/GQ==
X-Gm-Message-State: AC+VfDwN94aqsGOHd3bbIB2PVhUynqooh0oWH57Dl4cHRfvD+BGlk4kI
	pgxbxfQfJnpPWu6YN9M1zeT1sY89ulAErnXp0vk=
X-Google-Smtp-Source: ACHHUZ7ljymJX2G+S6qkuAwfpuEeGfaHlZBSn5G1Z610ySrgFgjPdAz1/SNUFgi0tmhKLmywsjdiIg==
X-Received: by 2002:a92:c007:0:b0:32b:12ee:3f0b with SMTP id q7-20020a92c007000000b0032b12ee3f0bmr1186789ild.9.1683305158619;
        Fri, 05 May 2023 09:45:58 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id s3-20020a025103000000b0039deb26853csm73084jaa.10.2023.05.05.09.45.58
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 09:45:58 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-33164ec77ccso601775ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 09:45:58 -0700 (PDT)
X-Received: by 2002:ac8:5a8e:0:b0:3ef:3361:75d5 with SMTP id
 c14-20020ac85a8e000000b003ef336175d5mr266034qtc.11.1683304721570; Fri, 05 May
 2023 09:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.11.I91f7277bab4bf8c0cb238732ed92e7ce7bbd71a6@changeid> <CSE0GBQQDUAY.1QAJIC3D3OBVU@wheely>
In-Reply-To: <CSE0GBQQDUAY.1QAJIC3D3OBVU@wheely>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 May 2023 09:38:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VVhPpTLPv1fmavGz-iwW1xA2P7_Uu_=GKZ-Ofu=vReZw@mail.gmail.com>
Message-ID: <CAD=FV=VVhPpTLPv1fmavGz-iwW1xA2P7_Uu_=GKZ-Ofu=vReZw@mail.gmail.com>
Subject: Re: [PATCH v4 11/17] watchdog/hardlockup: Rename some "NMI watchdog" constants/function
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Randy Dunlap <rdunlap@infradead.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>, ravi.v.shankar@intel.com, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, Petr Mladek <pmladek@suse.com>, Tzung-Bi Shih <tzungbi@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, davem@da
 vemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, May 4, 2023 at 8:07=E2=80=AFPM Nicholas Piggin <npiggin@gmail.com> =
wrote:
>
> On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> > Do a search and replace of:
> > - NMI_WATCHDOG_ENABLED =3D> HARD_WATCHDOG_ENABLED
> > - watchdog_nmi_ =3D> watchdog_hardlockup_
>
> These are just making prefixes inconsistent again.
>
> If you really want to do a prefix, I would call it hardlockup which
> probably best matches existing code and sysctl / boot stuff, and
> concentrate on non-static symbols.

As with other similar patches, I'm happy to drop this and am doing it
at Petr's request.

[1] https://lore.kernel.org/r/ZFErmshcrcikrSU1@alley
