Return-Path: <linuxppc-dev+bounces-3215-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A469C8CF1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 15:35:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq2l149lpz3057;
	Fri, 15 Nov 2024 01:35:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731594957;
	cv=none; b=k6OMv1EYqdKfUopuXJdVkAoAXlbqMHAJaydvUcDOgrrBZuoVP3cqPZSCbW/5XpV7ihMTunn2uGe2nmDuniEmVhcvysN4A/bQK4Uw5ISwqSt9Ync5Jl6pJkPdAjmX8Deoz+B4xg5MUrUeEwv1sQ0TNY23g5rwy7F16cahX7AQhtssAYTQn6o/DXscCt7O4pZqf4QhbfNaJZl7s+xEk6T2gwmssGje5UaNpHIM9ZmVwfWS+Br3RH/cFIta9qOBzRlHDkqs0nxn0emg0V41GVvcU/9R/BT+PBpAuf+cg6lMncgBf4mlelZx2fnyinJ9v199Cds3eMx+n4nHFIsdtP0vaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731594957; c=relaxed/relaxed;
	bh=46L+e3bH+nT+0jGJFLr1AI0Ez4pi2J5iqbML9+tLGWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWfJP7JeEUkdf5+BM/gaGTVwyRUuemgPoTg4lelW+7Ns2pPQiaulC7t7utORv3wIInZaunEUbN61Hg6KOINg9vDtA4K6uEg0pepBPp0W2FmJxmoEhl4ZR6D1QjoA/5C4owjkv3KiXpaB0xdsC65fMv+SHk2TtQPDcgsWRBegeCavqGI4vBR3bAK/nBU00tJOQiAy8Sr0iZIAT63sFv5uvbCmo5e1SSz0Gx9N6wXiZINpJEdWQAWWoaUT+TrKbULL472+U8dfrnn89yLh6JuvSriZRpMIXeChe6Y7zeHsU03fZG5xhSsy+IyxdPVJajygqOzH74ZBMgvKNXBtIR2akA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.128.175; helo=mail-yw1-f175.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.175; helo=mail-yw1-f175.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq2l041Ppz3051
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 01:35:56 +1100 (AEDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e9f69cc576so6164287b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 06:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731594954; x=1732199754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46L+e3bH+nT+0jGJFLr1AI0Ez4pi2J5iqbML9+tLGWY=;
        b=hORS0NYkXXuoeIEX4cUoGYVw9Aro5qR2y12RKlkI0gblGOPWeCjNAqtjbjkBbw7FNC
         emOTxfIF8lqWiReYH7yyg5GdUw/2Agn2ZzmH/ixP6Mq4aF93yBV8kRv99HWbdTJMASyl
         +/X5DTSV8ch1xLDEnzPheglBTrjVLwoYzMne33+l5SYOzqDrhiqoZcLQ6nT5kkwcNQ7D
         FB6ehW6CeJbiViiDhPh+Grs64cv2xJ4Jbms3cSdl3J6wzqHBzMT+cB/KkrxfMKmc79fj
         jfeZO45y/JVXkoo0xQS4niNhBIgLuNCr8grQ/gYRAsLEhTkAfdI1zEmxPeI8t2ZRujdR
         QUGA==
X-Gm-Message-State: AOJu0YwSA4tmXPfILtY3GCPmf3OMwKEJJEa2856HEWusF1ND2nHKQR3l
	9nW+Px+GOHk41W4GsCSoINkBjlFjOdovHN6WO518B2QgMPOHcYhh7mcaohDA
X-Google-Smtp-Source: AGHT+IFzFDP6sWZQDA5wT4iMQS0s6at5ZDmHG9Uw3CdXKqPCqdFgWqbrb8STtYJIXaHLL+XxnY1CPw==
X-Received: by 2002:a05:690c:6505:b0:6e3:24c1:cdf8 with SMTP id 00721157ae682-6eadddbea1fmr261347587b3.22.1731594954382;
        Thu, 14 Nov 2024 06:35:54 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee440465bfsm2633977b3.46.2024.11.14.06.35.54
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 06:35:54 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e30d0d84d23so636401276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 06:35:54 -0800 (PST)
X-Received: by 2002:a05:690c:9986:b0:6ea:8a23:7673 with SMTP id
 00721157ae682-6eaddd88edemr260442417b3.8.1731594953802; Thu, 14 Nov 2024
 06:35:53 -0800 (PST)
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
References: <20241114131114.602234-1-mpe@ellerman.id.au> <20241114131114.602234-8-mpe@ellerman.id.au>
In-Reply-To: <20241114131114.602234-8-mpe@ellerman.id.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Nov 2024 15:35:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVsn7Km+ut3jqhigv9cA4XADQc-4bSMe_PGO4rVpx7Fow@mail.gmail.com>
Message-ID: <CAMuHMdVsn7Km+ut3jqhigv9cA4XADQc-4bSMe_PGO4rVpx7Fow@mail.gmail.com>
Subject: Re: [RFC PATCH 08/10] macintosh: Remove ADB_MACIO
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
> The macio-adb driver depends on PPC_CHRP, which has been removed, remove
> the driver also.
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

