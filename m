Return-Path: <linuxppc-dev+bounces-3212-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6812B9C8CE1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 15:32:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq2fd6kfzz301N;
	Fri, 15 Nov 2024 01:32:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.170
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731594729;
	cv=none; b=igZb+RNtplhJz9T+gZxkHcFlwZFCYCxdGBBy8VAHoE+8uvAAyHoEhrb944ZQ89wgzKkBsEr1z2m4A8N5LHC89aZej6BN01MfSfnx8llJVInPDa/drtoF+Y9wj7hZDO9t8r1dHz+PofCB2yz67APPm9uCwDKcPX2Lql1xm6P7aU1/HdjCyqmEvzpnAVTthgGdLNXfjVOEVg/LvU6ue+1h60uPMb7/ELyW/4BI+KijrlCcEon7sNykq0B3frwAcpV2N+hWOT/dfzVVBFMT9DphVzzD8ov4VN9oZ8GnP0og+bfJuQLfJ802ktEEDORvQokhbxJ4grpPT2e/6zeRvcH9uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731594729; c=relaxed/relaxed;
	bh=xEw/QL8DjzngP6FtwkYMjBBUd+ADoH2d5hmL2oqNxQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kprfeNPiz1r/HsH9Oc2wjR36re/u6MMUQKyLCNebsYhRWTq5Vmr1AQsrmsNxOSAaLWRZ0MUnM+rl7sZ1jmq2YmeUJQJxZJlKm1y6vbtspA6ZUUzaUL3f5IRggqV8GRttruMEfRM8CSxs6bpbwsbKwY/VGRdlaqnu+F0fpAIAZmahGBkd2GtH2pb5Z2O+XtGVBTUT17cLntEyQnVGorKBnqcLWG54Bj6UnI1IeRIAZOsb8gkJAByCo5L7Co+QYIPfXDDarmUCF/N0tori/KuvopqshfBWzyRzryD/7Pubue+F2cyobD/FluwtQMPlcwQu6MWTsLXrQoYEj4EVkew64Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.219.170; helo=mail-yb1-f170.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.170; helo=mail-yb1-f170.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq2fb0DQxz2ywh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 01:32:05 +1100 (AEDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e30eca40dedso674485276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 06:32:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731594722; x=1732199522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEw/QL8DjzngP6FtwkYMjBBUd+ADoH2d5hmL2oqNxQE=;
        b=vUirZ17+6xXse6ys4DKBZMpe8+gHJPhi9COqfPXklnxJRjioLBu6p3cgpBVa/0wvwN
         vSMDlfM6tGBGH2Drfa/grfiqTGd2ZnLQIRbllajouNqxJ1RYW1Q6fU4wnz1qg+Z4Q6ks
         BXi9zltwctZO8ayitPFxHMlQGEEIVeOXSzESWMXkdLZOAEX6JDe303KxhEK2z0L15UHk
         KZ/P0Nrgqi9m/KO11Ujw1fpoGRap9W9XeX/t1RHdS23vAkeDwg6OP+yNfyNC8VkPXk1z
         h9kcy2/0VD7OuqquHfXcVxpH3azaaE8YuejVp5AR+B4BoNmyf5rOENqIt8oQEqpM6oAw
         k5GA==
X-Gm-Message-State: AOJu0YzX0NYBl26hrYWdu74S4LFPtn5ydLoSu8i+mix1TWbnwpIjF2xw
	CkjPth2margkOw3cC10WITXv3SL5A3dU6WbnXWsYKhhZJqnsvH4W62RLdAOY
X-Google-Smtp-Source: AGHT+IH4PvyH8AE8lpFJmw6HIkvxyx6n4q0enmk2vpeOqOT59xtmVM46kwDSZdoKStRv/LjrzlUriQ==
X-Received: by 2002:a05:6902:2b03:b0:e30:d460:f344 with SMTP id 3f1490d57ef6-e38142c15e3mr1846947276.50.1731594722369;
        Thu, 14 Nov 2024 06:32:02 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e381545b36asm314968276.45.2024.11.14.06.32.02
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 06:32:02 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e38193093a7so454625276.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 06:32:02 -0800 (PST)
X-Received: by 2002:a05:690c:3682:b0:6ea:3e6d:2b01 with SMTP id
 00721157ae682-6ee43385bf7mr20392957b3.19.1731594721950; Thu, 14 Nov 2024
 06:32:01 -0800 (PST)
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
References: <20241114131114.602234-1-mpe@ellerman.id.au>
In-Reply-To: <20241114131114.602234-1-mpe@ellerman.id.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Nov 2024 15:31:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWBZJvVaKiWk_VaHY0ZQiaezn9Kqa0XpTXKzf0gh_rG+g@mail.gmail.com>
Message-ID: <CAMuHMdWBZJvVaKiWk_VaHY0ZQiaezn9Kqa0XpTXKzf0gh_rG+g@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] powerpc/chrp: Remove CHRP support
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 14, 2024 at 2:11=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
> CHRP (Common Hardware Reference Platform) was a standard developed by
> IBM & Apple for PowerPC-based systems.
>
> The standard was used in the development of some machines but never
> gained wide spread adoption.
>
> The Linux CHRP code only supports a handful of machines, all 32-bit, eg.
> IBM B50, bplan/Genesi Pegasos/Pegasos2, Total Impact briQ, and possibly
> some from Motorola? No Apple machines should be affected.
>
> All of those mentioned above are over or nearing 20 years old, and seem
> to have no active users.
>
> So remove the CHRP support. If there's interest in still supporting some
> of the machines that can be brought back from the git history.
>
> Note there are still some references to CHRP/chrp in various comments
> and some in the code, because later standards (eg. RPA, PAPR) used some
> elements of CHRP or copied the CHRP behaviour. These will need to be
> cleaned up on a case-by-case basis to either refer to newer standards or
> left as-is when that's correct.
>
> The CHRP code was copied from arch/ppc, and before that it mostly
> predates git, so the original authorship is largely lost. If anyone
> wrote any of this code and would like a CREDITS entry just let me know.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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

