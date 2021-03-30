Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAFE34F1FF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 22:13:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F90yF0nmFz3bv7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 07:13:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oxcTEFt8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oxcTEFt8; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F90xp5Vy5z2y8Q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 07:13:18 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E7F2619D0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 20:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617135196;
 bh=a0u6btj9eABWcxyPcMcImxEQD72LmDexfcRuz0Fotaw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oxcTEFt8SZA7Bx7749WETP1GMcz8oii+pSej4jE7fgG7WS52nFSAy0fAei47dgGTT
 q+Qb1Vck6k9rwb/VKFbpxYLCRwW8Zmp1NygRTYvTbkrtN8tcJTYHnYqP37zGDxtl3E
 fLVdYj+EF8UqAvR0aWxEGFZxJkFSDv4Byhn8kleGogmKDj7PTae42Z1E5/o+jWQsb1
 HYw1Fo55Tqy0SK39VzMpcr/2Pwo8JaJitq/88PjP/eTbN9nL6pj+wOZyP2ryfIX68I
 bA376/UXRBuXIyfqtJFeQh4VhT/oB3BGehfnYkXzNHHRLkOJra/md8EVxl2jTS73e4
 GEFqd0oC0lteg==
Received: by mail-qv1-f45.google.com with SMTP id by2so8818718qvb.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 13:13:16 -0700 (PDT)
X-Gm-Message-State: AOAM532r54RIukg/3Fdarc0YM1l0TvhqWqdzUkIK7fdlvM0wfxJ3DGgz
 sMaB0Rn7Rn5r3Tgp4fCxxuOZ5PNHgQz0WyagSQ==
X-Google-Smtp-Source: ABdhPJw55amAUhZyFZAQITDAaWCWvjRQ4s0B/xEdY/mzymYT1/HSrfDlYWJbEwEmGzlU1vhNgrIIF8xwK9tMaYRV82Y=
X-Received: by 2002:a05:6214:12a1:: with SMTP id
 w1mr32724714qvu.57.1617135195251; 
 Tue, 30 Mar 2021 13:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
 <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
 <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu>
 <20210325195956.GM109100@zorba>
 <CAL_Jsq+10nucQSRkrTKe9BD5wBScqEb7-Rdg=9TsPiKuiuPG7w@mail.gmail.com>
 <20210330173254.GS109100@zorba>
In-Reply-To: <20210330173254.GS109100@zorba>
From: Rob Herring <robh@kernel.org>
Date: Tue, 30 Mar 2021 15:13:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJKBeAgaHQJwOL9G2qLbQSh32L5LtN+cSUgn5sV_P8How@mail.gmail.com>
Message-ID: <CAL_JsqJKBeAgaHQJwOL9G2qLbQSh32L5LtN+cSUgn5sV_P8How@mail.gmail.com>
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

On Tue, Mar 30, 2021 at 12:33 PM Daniel Walker <danielwa@cisco.com> wrote:
>
> On Thu, Mar 25, 2021 at 05:29:44PM -0600, Rob Herring wrote:
> > On Thu, Mar 25, 2021 at 2:00 PM Daniel Walker <danielwa@cisco.com> wrote:
> > >
> > > On Thu, Mar 25, 2021 at 01:03:55PM +0100, Christophe Leroy wrote:
> > > >
> > > > Ok, so you agree we don't need to provide two CMDLINE, one to be appended and one to be prepended.
> > > >
> > > > Let's only provide once CMDLINE as of today, and ask the user to select
> > > > whether he wants it appended or prepended or replacee. Then no need to
> > > > change all existing config to rename CONFIG_CMDLINE into either of the new
> > > > ones.
> > > >
> > > > That's the main difference between my series and Daniel's series. So I'll
> > > > finish taking Will's comment into account and we'll send out a v3 soon.
> > >
> > > It doesn't solve the needs of Cisco, I've stated many times your changes have
> > > little value. Please stop submitting them.
> >
> > Can you please outline what those needs are which aren't met?
>
> append AND prepend at the same time on all architectures. Christophe doesn't
> understand the need, and hence tries to minimize the feature set which is
> incompatible with Cisco needs and all the other out of tree users.

Okay, but that's never been a feature in upstream. For upstream, we
refactor first and add features 2nd. In this case, the difference is
largely the kconfig and it would be better to not change the options
twice, but that's not a blocker for taking the refactoring. You won't
find a maintainer that's going to take adding a feature over cleanups
and unification.

Rob
