Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30150349CE6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 00:30:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F61Yb0Htwz3br0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 10:30:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ays7TH2U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ays7TH2U; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F61Y44Mmkz2yhF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 10:30:00 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C53961A42
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 23:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616714997;
 bh=1So/sDC1qFPREyegXHFcy7/VmRkzeq/fmOvYjRI/LkM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ays7TH2UlrPjYT2EhVKB9kfoPA5X87la04AArIOH/b/tNiVyioalV2c0dN8bICOoL
 7VJtPJyCS9xna9DctRH8KPmi55ZNcoYl6ih9TRaL9tTERYwV06i8f7RN/lu6xMqld9
 e2l8Of2a/O3BXNaZZgjWqjkX0LVObsYgCGTtH+ZCr2VaXRrIItdTzF93vAGrcWB7z3
 Ewo07B3N41P6QiPOcmR96/pdF1SZpaj3tHf5XQrXzYYKBM0F01axjY0X5FWxjIwrJt
 cDmzFK//Fa80+AgrWa/Pscxi8j3sI2x8kQO05VvBQdTX/SWhTViEySY6kw5g9Bhi0R
 UVP/O02On5eaw==
Received: by mail-ej1-f51.google.com with SMTP id ce10so5691208ejb.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 16:29:57 -0700 (PDT)
X-Gm-Message-State: AOAM530HEKL0ztrleJRqKmMUo3BA6beTvVGWUCd1eL6GfrpwiXlr2bzs
 KcxFT5rqFJVT5U4sjmUy0Hw9w8YXHdJpuaIdhA==
X-Google-Smtp-Source: ABdhPJyp90At2ic5zxJIDhb11Bg7kKraVHtULioYfIts4QYqWxOJiucuvniDhV6Uc0L1MCJm0RL6y9lW3E+JgBiBtTE=
X-Received: by 2002:a17:906:5e01:: with SMTP id
 n1mr12293198eju.359.1616714996020; 
 Thu, 25 Mar 2021 16:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
 <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
 <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu>
 <20210325195956.GM109100@zorba>
In-Reply-To: <20210325195956.GM109100@zorba>
From: Rob Herring <robh@kernel.org>
Date: Thu, 25 Mar 2021 17:29:44 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+10nucQSRkrTKe9BD5wBScqEb7-Rdg=9TsPiKuiuPG7w@mail.gmail.com>
Message-ID: <CAL_Jsq+10nucQSRkrTKe9BD5wBScqEb7-Rdg=9TsPiKuiuPG7w@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] powerpc: convert config files to generic cmdline
To: Daniel Walker <danielwa@cisco.com>
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
Cc: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, X86 ML <x86@kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, xe-linux-external@cisco.com,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 25, 2021 at 2:00 PM Daniel Walker <danielwa@cisco.com> wrote:
>
> On Thu, Mar 25, 2021 at 01:03:55PM +0100, Christophe Leroy wrote:
> >
> > Ok, so you agree we don't need to provide two CMDLINE, one to be appended and one to be prepended.
> >
> > Let's only provide once CMDLINE as of today, and ask the user to select
> > whether he wants it appended or prepended or replacee. Then no need to
> > change all existing config to rename CONFIG_CMDLINE into either of the new
> > ones.
> >
> > That's the main difference between my series and Daniel's series. So I'll
> > finish taking Will's comment into account and we'll send out a v3 soon.
>
> It doesn't solve the needs of Cisco, I've stated many times your changes have
> little value. Please stop submitting them.

Can you please outline what those needs are which aren't met?

Rob
