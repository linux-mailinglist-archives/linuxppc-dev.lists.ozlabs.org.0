Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEFE63298F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 17:33:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGCcf5RzBz3dvd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 03:33:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qZ4jSJx1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qZ4jSJx1;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGCbg4w52z3bcw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 03:32:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EB9E2B81150
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 16:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7BCC433D6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 16:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669048345;
	bh=iTyQ6oW9PS2870YEdN16DxwGc5vOzwMA9nRCe4hOR0Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qZ4jSJx1uAC8xWkW9Zvu8I8CQWPMG89KTNIqXU3xnN97M85BCmZHEgQnwwIIFkTmy
	 wKX7rq56fkxprAwVQwdtam8mUSeuFSKNPGsVL+L8ZQ9Sg83SoaqMdN8HDAta41v8No
	 quZNL7c9hj8NdHl5sQ2n6WZhIUyFaTLoeCL3OqtnvrtnqzUpBDuLu6s66fWUbyhAuj
	 AprDzf27Fbm31vLxFfJ/jT29hRLiixOoxUnxdti8W3g/T8UyS2audVYfVKTNuAwzHB
	 lq1rf8pUH5nvsziXsGxAJcNl5RNVIr2+NEiT5y8CI4+jQsCOX5vxHqLa0Fq+KZum/z
	 3LKBB/DGBLAwA==
Received: by mail-ed1-f54.google.com with SMTP id z20so15541307edc.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 08:32:25 -0800 (PST)
X-Gm-Message-State: ANoB5plUZ3MqwIRaBjvxfEGXYnuTBINNvE+U7bGpxkgLmPxHKgbik4BF
	xq/1HscIoK4AMoYElV9tzb30E0DoZ9UhF+GHoBg=
X-Google-Smtp-Source: AA0mqf59hdeFp3pfAA6MPvqNEA/WxDhlx0M4qlJP7fkbFsr3sIG7IKu3IWfapn6h1JA3P61AE5bZKmmM04cQpaXJIhw=
X-Received: by 2002:aa7:ccd3:0:b0:468:f345:aa4a with SMTP id
 y19-20020aa7ccd3000000b00468f345aa4amr16363516edt.412.1669048343933; Mon, 21
 Nov 2022 08:32:23 -0800 (PST)
MIME-Version: 1.0
References: <20220901171252.2148348-1-song@kernel.org> <Y3expGRt4cPoZgHL@alley>
 <CAPhsuW4MaiJBTNnwVhqkmxPxBn8e1cn9PPGm9PkgF6YaO0AWKQ@mail.gmail.com> <09ac46a0-45fe-e280-cabb-682e05c7fddc@redhat.com>
In-Reply-To: <09ac46a0-45fe-e280-cabb-682e05c7fddc@redhat.com>
From: Song Liu <song@kernel.org>
Date: Mon, 21 Nov 2022 09:32:11 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4OTB+_nq6oRuyY1=sA00ik7X19W2TwoYL7WVDBccZxrw@mail.gmail.com>
Message-ID: <CAPhsuW4OTB+_nq6oRuyY1=sA00ik7X19W2TwoYL7WVDBccZxrw@mail.gmail.com>
Subject: Re: [PATCH v6] livepatch: Clear relocation targets on a module removal
To: Joe Lawrence <joe.lawrence@redhat.com>
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
Cc: Petr Mladek <pmladek@suse.com>, jikos@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, live-patching@vger.kernel.org, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 21, 2022 at 8:32 AM Joe Lawrence <joe.lawrence@redhat.com> wrote:
>
> On 11/18/22 12:14 PM, Song Liu wrote:
> > Hi Petr,
> >
> > On Fri, Nov 18, 2022 at 8:24 AM Petr Mladek <pmladek@suse.com> wrote:
> >>
> >> On Thu 2022-09-01 10:12:52, Song Liu wrote:
> > [...]
> >>>
> >>>  arch/powerpc/kernel/module_32.c |  10 ++++
> >>>  arch/powerpc/kernel/module_64.c |  49 +++++++++++++++
> >>>  arch/s390/kernel/module.c       |   8 +++
> >>>  arch/x86/kernel/module.c        | 102 +++++++++++++++++++++++---------
> >>>  include/linux/moduleloader.h    |   7 +++
> >>>  kernel/livepatch/core.c         |  41 ++++++++++++-
> >>
> >> First, thanks a lot for working on this.
> >>
> >> I can't check or test the powerpc and s390 code easily.
> >>
> >> I am going to comment only x86 and generic code. It looks good
> >> but it needs some changes to improve maintainability.
> >
> > Thanks for these comments and suggestions. I will work on them
> > and send v4.
> >
>
> Hi Song,
>
> I'll help with testing the arches (at least ppc64le and s390x, I can
> only cross-build ppc32).  I can either pick up the patches from the list
> when you post, or if you want to run them through testing first, lmk.

Thanks Joe!

I am on vacation this week. I will pick this up next week.

Song
