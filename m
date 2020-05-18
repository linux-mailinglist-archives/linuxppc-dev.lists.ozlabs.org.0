Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD361D7CC1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 17:23:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QjSm3htSzDqgj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 01:23:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2c;
 helo=mail-vk1-xa2c.google.com; envelope-from=rsalvaterra@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=D77Jj8eh; dkim-atps=neutral
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QjNf6kYlzDqf4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 01:19:28 +1000 (AEST)
Received: by mail-vk1-xa2c.google.com with SMTP id 134so2507311vky.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 08:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PvBtQjo/viiZVVneOr2G2OerC2+p+WtSo1RpO9LNs4o=;
 b=D77Jj8ehBGO13QzjgjasP7pFsMUzyeCkPnyJxakgWq1PQH+HZWWXMdnga9fbiP4u3C
 UZNges1SHKLfrkU/Wl1g/sTQ4WjZmbbRvlIQFODIrBpK8ftStg19BC1kdRUDOdyjWNIn
 zxzCgbweGrelUrhl3xsk6qej8q1ZGWpsiHWOK/Ms6ouO269Uqnl/9zOOZh1QYldawDSJ
 Jz2ggGVODmF9St7JP/ShEA9OmRQQE2xdPH2MAJMK5uKtDHTlJDbngkS0taIungaRh2pu
 pTAl3WY3XOmAB/6cqJMBTrvSSDk6lauVblDR9vz3kZt5o7RA1bBYb9V1J7juLF8qHmDb
 yDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PvBtQjo/viiZVVneOr2G2OerC2+p+WtSo1RpO9LNs4o=;
 b=lpDe3a9TdVVb7hAVNML9u6v3v8nfYujzbN5RYmjqJ0glpTGtTrrVZD8z7mPJHZmsAN
 XBFcdjOuJVBWla66D019g8AkslGcGYXIci+kPK/l83mrB+ZIhTKIJB+VVoUGm/krJoNX
 5kt6QxOI+ubG18UZWpddTc1t6Kv6e777/pSNqPoqQtrNT3bn/j96x6bf2nMtBcbvs56S
 R3GaIcNjGHAKYeARCtiOVGVphoroXWf1QA1Pp90J4pfU8b/JiXdxu1SBNMopqQS05Nph
 nf1hUCPoz3wbMOF7aJYTrKTW++ZxXx7J/NNXoRMuf6Y7Md90O50w4N+EOX0pP1JLWw76
 jZGg==
X-Gm-Message-State: AOAM530oPeku8Nb/1Px2YWEZhHJMAP65Sl0L1m4oeMmgIv6s+sMEru68
 qd3keajAwG+TJQ04hprTnot6890E2iIBmWg6dQ==
X-Google-Smtp-Source: ABdhPJxcHAkJI0M5R26silbrsxUFJWgVqP6B8l6mjocXdsRo0Br4STr3EMKRhR8fK8omteHXbCwXH1kgRwzxKgARbFs=
X-Received: by 2002:a1f:9fc9:: with SMTP id i192mr11682047vke.97.1589815164430; 
 Mon, 18 May 2020 08:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <CALjTZvZ69v3Z=8MY28F+p8v8_Z5e+7NrH0PAJ7TGD9kh6Ab7bw@mail.gmail.com>
 <3729805f-2638-6f0e-55fa-bd7d5c173899@csgroup.eu>
 <CALjTZvZ0gjZOpx7GuJ4ccawqpyOjr4N_C7UCQQHrrFR1Ojrh4g@mail.gmail.com>
 <d4f02b20-8b3e-fd88-6857-c2e4dc7786da@csgroup.eu>
In-Reply-To: <d4f02b20-8b3e-fd88-6857-c2e4dc7786da@csgroup.eu>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Mon, 18 May 2020 16:19:13 +0100
Message-ID: <CALjTZvZ1NyVOhX+qJZSqO_8shn9yD76DBBg0t9UeFUyzom=PBw@mail.gmail.com>
Subject: Re: [Regression 5.7-rc1] Random hangs on 32-bit PowerPC (PowerBook6,
 7)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
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
Cc: debian-powerpc@lists.debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi again, Christophe,

On Mon, 18 May 2020 at 15:03, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Can you try reverting 697ece78f8f749aeea40f2711389901f0974017a ? It may
> have broken swap.

Yeah, that was a good call. :) Linux 5.7-rc1 with the revert on top
survives the beating. I'll be happy to test a definitive patch!

Thanks a lot,
Rui
