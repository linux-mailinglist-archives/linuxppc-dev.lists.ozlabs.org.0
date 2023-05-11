Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D2F6FF164
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 14:17:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QH9rl5fRvz3fWf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 22:17:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Dnnz4ZrI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QH9qv4ZmHz3bjY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 22:16:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Dnnz4ZrI;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QH9qv3KDKz4x4V;
	Thu, 11 May 2023 22:16:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1683807419;
	bh=KQWCV9FmJH5CqzWvqzks5FSok5ibmu2vlrQSNtsRn/c=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=Dnnz4ZrICZyFD2i+dGe19uBY2xMo+ASbmj7O0G7XbCdxspqP7O4KixfnTZ3bvRvcn
	 HJoDq3+wJrmxr79EgEKIbrJw1t+GEfrF8FxY8pvoWWljfAez8hFDTbqpEuaHwoeAFr
	 wMpIg2RppfCNDgNz/U0iKQElNoD7+t7OVuHIIPfEn02/t2zd3ch7bdrm7oEs//vIpd
	 N3oaOT49e0ODkzY+UF8fzd3O/p9ZImkUzJEryAiMkme8kqC/syGuBuQBvVTC0iFwBt
	 xi5G8kZT4ufZmYX8pDe4kNGKp0eT63gqli4pQwQ/Ul3aMddBP5bVQPDPcyjkMKKuVU
	 XW4cn+1DuOyrA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Dan =?utf-8?Q?Hor=C3=A1k?= <dan@danny.cz>, linuxppc-dev@lists.ozlabs.org
Subject: Re: a possible issue with radix MMU on P9
In-Reply-To: <20230511095558.56663a50f86bdc4cd97700b7@danny.cz>
References: <20230511095558.56663a50f86bdc4cd97700b7@danny.cz>
Date: Thu, 11 May 2023 22:16:51 +1000
Message-ID: <87bkirkqq4.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Dan Hor=C3=A1k <dan@danny.cz> writes:
> Hi all,
>
> we have been struggling with an issue in the bdwgc project (garbage
> collector) on P9 systems for a while [1]. There were some test failing
> on P9, but not on P8 or other platforms (x86, s390x, aarch64). Recently
> the upstream developer has found out there is likely a problem in the
> kernel memory mgmt [2], there is a reproduction scenario included. I
> have rechecked the original code on P9 with hash MMU and it worked. Thus
> I believe there is a problem in the radix MMU code on Power, where it
> behaves differently. My testing was using Fedora, which means recent
> kernels up to 6.4-rc1.
>
> [1] https://github.com/ivmai/bdwgc/issues/479
> [2] https://github.com/ivmai/bdwgc/issues/479#issuecomment-1535274481

Thanks Dan.

Fix patch here: https://lore.kernel.org/linuxppc-dev/20230511114224.977423-=
1-mpe@ellerman.id.au/

I tested that it fixes the bdwgc failures (with their workaround reverted).

cheers
