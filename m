Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DBE578337
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 15:09:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmj3q322Lz3c36
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 23:09:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=HAYepAxM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=p9lr=xx=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=HAYepAxM;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lmj383RVDz2ywV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 23:09:08 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9AE0B6159D;
	Mon, 18 Jul 2022 13:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6738EC341C0;
	Mon, 18 Jul 2022 13:09:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="HAYepAxM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1658149742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N7QlNK74ybwRYfzHI8TBP3B7VtPI78+Og9U+7B0YR44=;
	b=HAYepAxMlmZJztlmTWH49hY3/hDdlc+XMv8oBROFi7vjUqOiXNfm3X5k2ibtbnCnOfeAWw
	+gWYnD2ZcIAw8ondAmKUpoALBxjS6O7VZ/NnB1jEZulYYuKMpSPj8+MvXHnZRVrtFGh32Y
	T0nCK1ypSrkG4t9I2xiIcP9zvBJtwvk=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dd83422f (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Mon, 18 Jul 2022 13:09:02 +0000 (UTC)
Date: Mon, 18 Jul 2022 15:09:00 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
	sachinp@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] powerpc rng cleanups
Message-ID: <YtVbbMpRbfCWEIFn@zx2c4.com>
References: <20220711232448.136765-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220711232448.136765-1-Jason@zx2c4.com>
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

Hey again,

On Tue, Jul 12, 2022 at 01:24:46AM +0200, Jason A. Donenfeld wrote:
> These are two small cleanups for -next. This v5 rebases on the latest
> git master, as some whitespace was added that made v4 no longer apply.
> 
> Jason A. Donenfeld (2):
>   powerpc/powernv: rename remaining rng powernv_ functions to pnv_
>   powerpc/kvm: don't crash on missing rng, and use darn
> 
>  arch/powerpc/include/asm/archrandom.h |  7 +--
>  arch/powerpc/kvm/book3s_hv_builtin.c  |  7 +--
>  arch/powerpc/platforms/powernv/rng.c  | 66 ++++++++++-----------------
>  drivers/char/hw_random/powernv-rng.c  |  2 +-
>  4 files changed, 30 insertions(+), 52 deletions(-)

I think v5 has reached a completion point. Could you queue these up in
some PPC tree for 5.20?

Thanks,
Jason
