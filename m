Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E5959B6B2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 01:09:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M9rmQ5hKFz3cFB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 09:09:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qnKx3AW2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M9rlp1RqMz3086
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 09:09:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qnKx3AW2;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M9rlm38Xjz4wgr;
	Mon, 22 Aug 2022 09:09:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1661123348;
	bh=ot4vNPXID2qHzyKPZNzTF6jzsfFG44Rik1Jxj+q9etI=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=qnKx3AW22cbizwm3VfJDlQCqjy1Qh8ntG4y0D6gtqPBW8EcSMZqHYv2C4VF90ju19
	 9fS3oiyNGeZ5majD6ugg7+mGAX2z0RrePFUK3MrIlcMH2AcTQVieiJcDi2o+56BRYI
	 yacNyzgRYObAsD4vzOJdiYasClSjYqbHV0P/nqTkL28PcGn57Q6sQT/MY6TbVmEygg
	 cQX9+TKOVAhG9sOYNK5p2T3bMh+O0YW/DUrEB8JS//ehqg17f6dew7RnL40Z6cQSkA
	 4kKQzYDkwua5PMsLQK93WpWaWmvKlAkpf4NBlekF5PfSeS2O/oMf0oEVElgoqFs3rn
	 Vq0uCHqtiPe/g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org
Subject: Re: [PATCH] kernel: exit: cleanup release_thread()
In-Reply-To: <20220819014406.32266-1-wangkefeng.wang@huawei.com>
References: <20220819014406.32266-1-wangkefeng.wang@huawei.com>
Date: Mon, 22 Aug 2022 09:09:06 +1000
Message-ID: <87r119kxd9.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Kefeng Wang <wangkefeng.wang@huawei.com> writes:
> Only x86 has own release_thread(), introduce a new weak
> release_thread() function to clean empty definitions in
> other ARCHs.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
..
>  arch/powerpc/include/asm/processor.h    | 1 -
>  arch/powerpc/kernel/process.c           | 5 -----

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
