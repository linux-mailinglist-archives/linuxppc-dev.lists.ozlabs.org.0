Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A25581D3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 03:37:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsxHN2HDcz3c6l
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 11:37:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=IGQbirVR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=hqxn=ya=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=IGQbirVR;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsxGl0JBZz2x9G
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 11:37:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 05D37B81F0C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 01:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663E9C433D6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 01:37:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="IGQbirVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1658885830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Fmgx8N0WQu3EBYzpYloNNBsA8XbCPiWqgOrlE5ogDk=;
	b=IGQbirVRt+XAEdw/tsv9aC4FXX47bbZHb8uoUE2Sl7Y3abOnW/dWAYjjAxmKxWQLvnrfw1
	RyslTfS71yq0xis8gHLpEiS2spKWYXibLTxUFLH+mMFI3JFeHllHM1P5m/ncXMJYMrvkYs
	b6LzVMecFEZTK9S/KMuditRJSEAJ+sU=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3ae67790 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Wed, 27 Jul 2022 01:37:10 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-31bf3656517so160390247b3.12
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 18:37:10 -0700 (PDT)
X-Gm-Message-State: AJIora9b+mYpcP0CQOatkw7KDDn7Mkx/81UN12xU/QQyd8EHuIQBCbVT
	DunB1iIRiPuNgQaxT2tOLmk42Z1fTIjjUGp9oF0=
X-Google-Smtp-Source: AGRyM1tHtJ03wVUfoEkcgXr50XYYj4caRdR7VA2UuBfl7LiVUfhisHMKiq0eLG6EFkJRUzT6AFqBdhb+qZrKlPUwn0s=
X-Received: by 2002:a81:59c4:0:b0:31f:4804:76ad with SMTP id
 n187-20020a8159c4000000b0031f480476admr5528716ywb.143.1658885829426; Tue, 26
 Jul 2022 18:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220711232448.136765-1-Jason@zx2c4.com> <YtVbbMpRbfCWEIFn@zx2c4.com>
In-Reply-To: <YtVbbMpRbfCWEIFn@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 27 Jul 2022 03:36:58 +0200
X-Gmail-Original-Message-ID: <CAHmME9pMOQKnMUQQyOA+CkN5scQjtLN79pvdYSu70MkuU207cw@mail.gmail.com>
Message-ID: <CAHmME9pMOQKnMUQQyOA+CkN5scQjtLN79pvdYSu70MkuU207cw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] powerpc rng cleanups
To: PowerPC <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Sachin Sant <sachinp@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Mon, Jul 18, 2022 at 3:09 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hey again,
>
> On Tue, Jul 12, 2022 at 01:24:46AM +0200, Jason A. Donenfeld wrote:
> > These are two small cleanups for -next. This v5 rebases on the latest
> > git master, as some whitespace was added that made v4 no longer apply.
> >
> > Jason A. Donenfeld (2):
> >   powerpc/powernv: rename remaining rng powernv_ functions to pnv_
> >   powerpc/kvm: don't crash on missing rng, and use darn
> >
> >  arch/powerpc/include/asm/archrandom.h |  7 +--
> >  arch/powerpc/kvm/book3s_hv_builtin.c  |  7 +--
> >  arch/powerpc/platforms/powernv/rng.c  | 66 ++++++++++-----------------
> >  drivers/char/hw_random/powernv-rng.c  |  2 +-
> >  4 files changed, 30 insertions(+), 52 deletions(-)
>
> I think v5 has reached a completion point. Could you queue these up in
> some PPC tree for 5.20?

Just paging again. Do you think you could queue these up for 5.20?
This trivial series is over a month old now.

Thanks,
Jason
