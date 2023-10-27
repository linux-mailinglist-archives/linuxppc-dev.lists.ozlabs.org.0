Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8467D9519
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:21:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Y69gopJy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGzGJ3LsGz3d9V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:21:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Y69gopJy;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGyzY3zPSz3cT7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:08:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698401304;
	bh=KBtXhrg40QvhdKC3Ez2hE2W+GYiJuVAlqPrN0s/T7o8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y69gopJyMkfobUPOzrV67aOsfpwsLL+krJ7Vv/ugx4MV1he4bCRIo4YgkwBoNdAtq
	 4T76Ym2KLiKm6hXnl0xvOn49oBk5Rv5XQtG8S/52O80UXsYVzHNkJ4EXCn+5EMCBZv
	 pp8Is+hAfei8ZTn58aeMifkNjxP5SFVZnvQuzQB3yK/yVUHTLE82kIEcQRRA/4R7Zt
	 Dbwk5htlHEak6aGtycU2txM4+qe7FoGoHtaVQTkeCfW+58hEKOENzaYsKqOrnsml/f
	 5B9x3ohp13u1uZKvjZR10BBZuK3k9qlY43w1GEDnTaeWbJ3g2O3S5AX5DFoQunwjUY
	 NHgHSiI6cWdgA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGyzX2gCsz4xYR;
	Fri, 27 Oct 2023 21:08:24 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20231018153423.298373-1-npiggin@gmail.com>
References: <20231018153423.298373-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/perf: Fix disabling BHRB and instruction sampling
Message-Id: <169840079669.2701453.1951279893357175821.b4-ty@ellerman.id.au>
Date: Fri, 27 Oct 2023 20:59:56 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 19 Oct 2023 01:34:23 +1000, Nicholas Piggin wrote:
> When the PMU is disabled, MMCRA is not updated to disable BHRB and
> instruction sampling. This can lead to those features remaining enabled,
> which can slow down a real or emulated CPU.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/perf: Fix disabling BHRB and instruction sampling
      https://git.kernel.org/powerpc/c/ea142e590aec55ba40c5affb4d49e68c713c63dc

cheers
