Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2C3352060
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 22:09:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBDmB3pZcz3c3Y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 07:09:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZkxjcrpV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZkxjcrpV; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBDlk3dk3z3bsW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 07:08:50 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41595610D0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 20:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617307697;
 bh=leXRGFCaTe62iNXS9w44O42W8yxC/IB8Rcab5IVMEdo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZkxjcrpVIoR0UEZPAPwcCGRNCr9cnaA8ap9gvRp4jG0hf1ImuQrB2wy7jdHBNp4J8
 +B6DTRenJaqRuVw182uynS3O32+RWy36NHQ4NVmOs0uERUsoS0z0YIuCVKtIezpQaf
 ar8zPs7y24q5Srof2D/yE6kT+20NEcXp6C2mI5SQ7X6r3aN/FP+ATmxolsyxP5MpYT
 7NCJo48UM5HYxI/NGZmIbO5BI7lz6QHAEg6D/9PyVuj/nEJF3OsBF99i626YiF29DE
 grEk3QDd2ku4LB6wDx6iQIOep2wLfsf2NpExyi99i3NsqyYF/Nc2kd3WGauqNfXcpi
 sqcEd4bpv2hVA==
Received: by mail-ej1-f43.google.com with SMTP id hq27so4617790ejc.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 13:08:17 -0700 (PDT)
X-Gm-Message-State: AOAM532qgKoEuikpKvL7oyn9DAHEdlTxWKhDONOg0PxT0R/p5Nu2iiVz
 JkiSzNYMJk5VXLkz6bP14CyRc7NnyZ+FaB/D7A==
X-Google-Smtp-Source: ABdhPJwo4ozd5r/I3vDcht4+RN+4+j5bUHW3XwFV21OlpcnhU71wdknH6GNYfELodycCl347pJJo+2xFYHlBdNJZ9TM=
X-Received: by 2002:a17:906:5e01:: with SMTP id
 n1mr10940420eju.359.1617307695709; 
 Thu, 01 Apr 2021 13:08:15 -0700 (PDT)
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
 <CAL_JsqJKBeAgaHQJwOL9G2qLbQSh32L5LtN+cSUgn5sV_P8How@mail.gmail.com>
 <20210330233137.GB2469518@zorba>
In-Reply-To: <20210330233137.GB2469518@zorba>
From: Rob Herring <robh@kernel.org>
Date: Thu, 1 Apr 2021 15:08:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL8bJrxnJgs4doQ0L7YTF0vrDZLOoPOBdJzwTgMhXm-dw@mail.gmail.com>
Message-ID: <CAL_JsqL8bJrxnJgs4doQ0L7YTF0vrDZLOoPOBdJzwTgMhXm-dw@mail.gmail.com>
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

On Tue, Mar 30, 2021 at 6:31 PM Daniel Walker <danielwa@cisco.com> wrote:
>
> On Tue, Mar 30, 2021 at 03:13:04PM -0500, Rob Herring wrote:
> > On Tue, Mar 30, 2021 at 12:33 PM Daniel Walker <danielwa@cisco.com> wrote:
> > >
> > > On Thu, Mar 25, 2021 at 05:29:44PM -0600, Rob Herring wrote:
> > > > On Thu, Mar 25, 2021 at 2:00 PM Daniel Walker <danielwa@cisco.com> wrote:
> > > > >
> > > > > On Thu, Mar 25, 2021 at 01:03:55PM +0100, Christophe Leroy wrote:
> > > > > >
> > > > > > Ok, so you agree we don't need to provide two CMDLINE, one to be appended and one to be prepended.
> > > > > >
> > > > > > Let's only provide once CMDLINE as of today, and ask the user to select
> > > > > > whether he wants it appended or prepended or replacee. Then no need to
> > > > > > change all existing config to rename CONFIG_CMDLINE into either of the new
> > > > > > ones.
> > > > > >
> > > > > > That's the main difference between my series and Daniel's series. So I'll
> > > > > > finish taking Will's comment into account and we'll send out a v3 soon.
> > > > >
> > > > > It doesn't solve the needs of Cisco, I've stated many times your changes have
> > > > > little value. Please stop submitting them.
> > > >
> > > > Can you please outline what those needs are which aren't met?
> > >
> > > append AND prepend at the same time on all architectures. Christophe doesn't
> > > understand the need, and hence tries to minimize the feature set which is
> > > incompatible with Cisco needs and all the other out of tree users.
> >
> > Okay, but that's never been a feature in upstream. For upstream, we
> > refactor first and add features 2nd. In this case, the difference is
> > largely the kconfig and it would be better to not change the options
> > twice, but that's not a blocker for taking the refactoring. You won't
> > find a maintainer that's going to take adding a feature over cleanups
> > and unification.
>
> It kind of is a feature in upstream, it's a matter of opinion. Some platform
> used append and some use prepend, and it's likely because the maintainers needed
> one or the other for development.

Which arch/platform upstream does both prepend and append at the same time?

> I'm not sure why you think I can't add the features in one go. It would be
> horrid to take Christophe's changes, then have to do basically all the same work
> a second time which is what Christophe's changes would force me to do.

I didn't say it couldn't be done. In fact, I said it would be better
all at once: "it would be better to not change the options twice"

But both of you ignoring comments and continuing to post competing
series is not going to get us there. TBC, I think Christophe's series
is much closer to being in shape to merge upstream.

> Say for example I implement this change only on one architecture. In that case
> the maintainer would be accepting a feature enhancement , but there would be no
> stopping it. I shouldn't have to go two strokes on one architecture, but each
> change I'm making is essentially a single architecture. They can go in all
> together or one at a time.

Features do get implemented all the time on one arch. And then maybe a
2nd and 3rd. At some point we decide no more copying, it needs to be
common and refactored. We're at that point for cmdline handling IMO.

Rob
