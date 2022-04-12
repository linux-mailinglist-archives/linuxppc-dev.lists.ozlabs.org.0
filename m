Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B28074FCFB8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 08:36:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcwwT5G9vz3bfr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 16:36:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Nd2yL4IA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kcwvs5Rtjz2yK7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 16:35:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Nd2yL4IA; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Kcwvr710jz4xNl;
 Tue, 12 Apr 2022 16:35:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649745337;
 bh=KOPW0YoznaEOZ4lHn5MCkotY+XFXHkyZcvx9GTXAcm0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Nd2yL4IAil9l07N83Be0MuQoHG40q8hyQNcyuSclpT9ck/FCYnf69VZYQ4NEYacv4
 BcKfzxbI3pNdPqHbXdt4S2rH354m26hd6KTRRL4fXnERJsBnbEJqFxRhCIYmo/m1JI
 w2C1INiK4P0Ih7STQs/sGI9cAALCuVDm5s7yTVRaXmRaj4VCIHH4VfdyRtFMT87a/y
 V3pL42K3fJ+/QdHfl5G5xHnn8F6YfEC+jR8pTW3ot2Tg8Y6ECQo12hK40uJ2QqS7q4
 mvEGqFT1I8K6vp2mKU5GhtyKsFekrHWuBlnNbvidM2VQoNabqqVVV6TT6Z6uZb9T4y
 4qtCnPitjVZ7A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 5.17 40/49] powerpc: Fix virt_addr_valid() for
 64-bit Book3E & 32-bit
In-Reply-To: <20220412004411.349427-40-sashal@kernel.org>
References: <20220412004411.349427-1-sashal@kernel.org>
 <20220412004411.349427-40-sashal@kernel.org>
Date: Tue, 12 Apr 2022 16:35:35 +1000
Message-ID: <87sfqi6c7c.fsf@mpe.ellerman.id.au>
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
Cc: Sasha Levin <sashal@kernel.org>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sasha Levin <sashal@kernel.org> writes:
> From: Kefeng Wang <wangkefeng.wang@huawei.com>
>
> [ Upstream commit ffa0b64e3be58519ae472ea29a1a1ad681e32f48 ]
>
> mpe: On 64-bit Book3E vmalloc space starts at 0x8000000000000000.

This cherry-pick is good, but can you also pick up the immediately
following commit:

  1ff5c8e8c835 ("Revert "powerpc: Set max_mapnr correctly"")

For v5.16 and v5.17. Thanks.

cheers
