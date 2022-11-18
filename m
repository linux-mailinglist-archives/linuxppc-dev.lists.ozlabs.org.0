Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB75E62FB64
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 18:15:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDNj36HZ8z3f3S
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 04:15:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aRZ9CdGo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aRZ9CdGo;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDNh82S5sz3cBX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 04:15:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AF1D862697
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 17:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B69C43470
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 17:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668791699;
	bh=aGeNjGPP8dZqmetYNEd9VnRo9dFM5dECRmcaKXKx9eY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aRZ9CdGoQcFqHGqM1EJ8/vLQtWJgf//zBNew9wpzdt1r4Grm7ONnH6wCnLT0Px1qr
	 o69zcXpOLzA43jU9bl7mgZS8x+cn1vm+F5PTZGYDAqzHnPTH+yo3Dq7dIjA3ModHiM
	 IPgz8DmBwvJ+cnveUFihaE/d9nqyNKWI5ECqCjD18hAmUC8rIisDARhZnd7kC3Ryh9
	 pdqmwAsc4zp+TrKMUEFLjS/bYNbEUaZnAOjD79L/lNniEYBufdWhqh3EWIOaaY/X7k
	 S/hrZsYvIQ0sRhlU+cGkkJGsR3D/4Y+OJA1gE1094VmFY6vcHZsM64lQH3BdGiqeEK
	 GDwnUSKUEMVCw==
Received: by mail-ed1-f51.google.com with SMTP id z18so8022306edb.9
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 09:14:59 -0800 (PST)
X-Gm-Message-State: ANoB5pl4PaMpmh4Mj3haRLtj6vG+wmuXJaLe3X2d6s12CxObx2lASOIT
	y6jYOFJq9z5rbFdKnENFpF164tzdTzVWJIdpsQA=
X-Google-Smtp-Source: AA0mqf5vmlW8qp/K/O9wIXdvysgv/PQikRZVOikEvoR7n1HGHbtgOsu76Fyk4A8Fs1YuHDx0tCwF5kll65JjGlipyYU=
X-Received: by 2002:a05:6402:538a:b0:458:fbd9:e3b1 with SMTP id
 ew10-20020a056402538a00b00458fbd9e3b1mr6950969edb.6.1668791697320; Fri, 18
 Nov 2022 09:14:57 -0800 (PST)
MIME-Version: 1.0
References: <20220901171252.2148348-1-song@kernel.org> <Y3expGRt4cPoZgHL@alley>
In-Reply-To: <Y3expGRt4cPoZgHL@alley>
From: Song Liu <song@kernel.org>
Date: Fri, 18 Nov 2022 09:14:44 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4MaiJBTNnwVhqkmxPxBn8e1cn9PPGm9PkgF6YaO0AWKQ@mail.gmail.com>
Message-ID: <CAPhsuW4MaiJBTNnwVhqkmxPxBn8e1cn9PPGm9PkgF6YaO0AWKQ@mail.gmail.com>
Subject: Re: [PATCH v6] livepatch: Clear relocation targets on a module removal
To: Petr Mladek <pmladek@suse.com>
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
Cc: jikos@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, joe.lawrence@redhat.com, Josh Poimboeuf <jpoimboe@redhat.com>, live-patching@vger.kernel.org, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Petr,

On Fri, Nov 18, 2022 at 8:24 AM Petr Mladek <pmladek@suse.com> wrote:
>
> On Thu 2022-09-01 10:12:52, Song Liu wrote:
[...]
> >
> >  arch/powerpc/kernel/module_32.c |  10 ++++
> >  arch/powerpc/kernel/module_64.c |  49 +++++++++++++++
> >  arch/s390/kernel/module.c       |   8 +++
> >  arch/x86/kernel/module.c        | 102 +++++++++++++++++++++++---------
> >  include/linux/moduleloader.h    |   7 +++
> >  kernel/livepatch/core.c         |  41 ++++++++++++-
>
> First, thanks a lot for working on this.
>
> I can't check or test the powerpc and s390 code easily.
>
> I am going to comment only x86 and generic code. It looks good
> but it needs some changes to improve maintainability.

Thanks for these comments and suggestions. I will work on them
and send v4.

Song
