Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B209D746B5D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 10:01:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=XHp+Hs2J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwFbp4LDGz3cCt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 18:01:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=XHp+Hs2J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwFZw5b7kz309V
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 18:00:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 225B96108E;
	Tue,  4 Jul 2023 08:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6B7C433C7;
	Tue,  4 Jul 2023 08:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688457621;
	bh=vU2jOdZ5LLyWKgEHZBnAwSo71oT39lJC++2uk0MUGbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XHp+Hs2JhHl1RFxbfZK/NaC++Nys7AA/C7FARVmMBKrYYsKSWOIXthZX1iXpeUyvH
	 mgHmFrS0zclbCWqAYoKQ/ydbtN9SHJC3UQL4Gess9n1x4aEI+vjtv80YqkFMDU6VFp
	 AqPAyovltrHCKeutz1bcCPNgSjyII3zCgoWE2F04=
Date: Tue, 4 Jul 2023 09:00:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
Message-ID: <2023070453-plod-swipe-cfbf@gregkh>
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info>
 <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
 <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
 <2023070359-evasive-regroup-f3b8@gregkh>
 <CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
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
Cc: Jacob Young <jacobly.alt@gmail.com>, Linux regressions mailing list <regressions@lists.linux.dev>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 04, 2023 at 12:45:39AM -0700, Suren Baghdasaryan wrote:
> On Mon, Jul 3, 2023 at 11:44 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Jul 03, 2023 at 11:27:19AM -0700, Suren Baghdasaryan wrote:
> > > On Mon, Jul 3, 2023 at 11:08 AM Suren Baghdasaryan <surenb@google.com> wrote:
> > > >
> > > > On Mon, Jul 3, 2023 at 2:53 AM Linux regression tracking (Thorsten
> > > > Leemhuis) <regressions@leemhuis.info> wrote:
> > > > >
> > > > > On 02.07.23 14:27, Bagas Sanjaya wrote:
> > > > > > I notice a regression report on Bugzilla [1]. Quoting from it:
> > > > > >
> > > > > >> After upgrading to kernel version 6.4.0 from 6.3.9, I noticed frequent but random crashes in a user space program.  After a lot of reduction, I have come up with the following reproducer program:
> > > > > > [...]
> > > > > >> After tuning the various parameters for my computer, exit code 2, which indicates that memory corruption was detected, occurs approximately 99% of the time.  Exit code 1, which occurs approximately 1% of the time, means it ran out of statically-allocated memory before reproducing the issue, and increasing the memory usage any more only leads to diminishing returns.  There is also something like a 0.1% chance that it segfaults due to memory corruption elsewhere than in the statically-allocated buffer.
> > > > > >>
> > > > > >> With this reproducer in hand, I was able to perform the following bisection:
> > > > > > [...]
> > > > > >
> > > > > > See Bugzilla for the full thread.
> > > > >
> > > > > Additional details from
> > > > > https://bugzilla.kernel.org/show_bug.cgi?id=217624#c5 :
> > > > >
> > > > > ```
> > > > > I can confirm that v6.4 with 0bff0aaea03e2a3ed6bfa302155cca8a432a1829
> > > > > reverted no longer causes any memory corruption with either my
> > > > > reproducer or the original program.
> > > > > ```
> > > > >
> > > > > FWIW: 0bff0aaea03 ("x86/mm: try VMA lock-based page fault handling
> > > > > first") [merged for v6.4-rc1, authored by Suren Baghdasaryan [already CCed]]
> > > > >
> > > > > That's the same commit that causes build problems with go:
> > > > >
> > > > > https://lore.kernel.org/all/dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel.org/
> > > >
> > > > Thanks! I'll investigate this later today. After discussing with
> > > > Andrew, we would like to disable CONFIG_PER_VMA_LOCK by default until
> > > > the issue is fixed. I'll post a patch shortly.
> > >
> > > Posted at: https://lore.kernel.org/all/20230703182150.2193578-1-surenb@google.com/
> >
> > As that change fixes something in 6.4, why not cc: stable on it as well?
> 
> Sorry, I thought since per-VMA locks were introduced in 6.4 and this
> patch is fixing 6.4 I didn't need to send it to stable for older
> versions. Did I miss something?

6.4.y is a stable kernel tree right now, so yes, it needs to be included
there :)

