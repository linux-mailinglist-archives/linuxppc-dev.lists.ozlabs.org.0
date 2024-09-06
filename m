Return-Path: <linuxppc-dev+bounces-1109-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC0F96F3BA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:56:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZRm6v8mz304N;
	Fri,  6 Sep 2024 21:55:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623732;
	cv=none; b=PA8ziHggFSe80rm9QnbUoWuEolXe37UyG2dlEps6DifWOA9Y1o72pDj8x7neFCKdUwsZ6wvOMalVzkksVOrDK42S2FdGT32NDGppkebIDbdorx+w2qv+71yel2RG333DXtREZls043KXoLv2QmTHZJyUM9yiqI9xTqxl4cYuYuc+BiImwWovuIE/h1VqgtpzepMO250zP6/m5QLn/pROmb5aJTfG051urVCh8zs8/lFqxlVMvd2XHqlUPVmPnLPK1SUZImPcv2q9fo0bijAyqX3TvSfyDvBaDdJKM5wPsPl0FFqXu1J8WCgMwwhFVh0vej9JaWi7SZjyeMW7W4zDmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623732; c=relaxed/relaxed;
	bh=DegYF6L0xrPJs/W3yhej8GCjtAFx5fG7XOMdZXndKx0=;
	h=DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type; b=FkTTc+6dGqI+9fus02Z1WHvE/8iSQBX0qeDdbX0kQNWv0/Woo4SipFlyj0WQ3uUQcaDUVLB4b5U5qMc823KD5j1ReGdlVxp//BwkmZNWPGiHD4vyiSQqGoLIA+6dQwLgN+kSTCNcy0hJBEoXNG8WnfFb1cR6IEezvrVLoZdoAryyuZaYUxIvDfNFxNpmlBotwj6aVrSJN0nJHrOrdZvhsBnz6KNH5bCy/twpb8disvtrcPC/1auZxIAT1+wcR6jeqtg3sbDi62VB6tyGScp99KTtIg3v2WVEbaxZUe0dI2caMh+Zm5sLJDgub+bRVEnAw6pIL+w0KPmKWL0wGNLYbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Q77AT84y; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Q77AT84y;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZRm5pcxz30DL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:55:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623732;
	bh=DegYF6L0xrPJs/W3yhej8GCjtAFx5fG7XOMdZXndKx0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Q77AT84ys3ukPRI64ZuNm8PziTIUkrHmIjc0o4RsY2Slq3Mq6W1b09tYP34JFloFi
	 1CIQlqDwtDPvJuEOUwUOCaDqvBUjPu7EXrn07LS6nNhtq7lJxUdtOvAIZQHA/9e2Nd
	 O+cHWaehRrIZCXmLwHWFjJlYmzm++tQfOcsCRZG2Ak4yQ7nUJ2rrh1tbBp11B8aHp/
	 oqps2ImKuZccLsmK9S2fOoS3gM24Gl0S/vpBKpV+UNEAlFqVHawpdQQ3ZIwlI/QN7n
	 f5MqrYWo2cKeZILP9eahQy16/V2EMt4DVpVsP+HrONxoqzyCe4480thTYpo8LocYn8
	 oVelWeySocw4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZRm4Hf9z4x8w;
	Fri,  6 Sep 2024 21:55:32 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20240822130043.783756-1-cuigaosheng1@huawei.com>
References: <20240822130043.783756-1-cuigaosheng1@huawei.com>
Subject: Re: [PATCH -next] powerpc/powernv/pci: Remove obsoleted declaration for pnv_pci_init_ioda_hub
Message-Id: <172562357199.467568.16977065972735898774.b4-ty@ellerman.id.au>
Date: Fri, 06 Sep 2024 21:52:51 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Thu, 22 Aug 2024 21:00:43 +0800, Gaosheng Cui wrote:
> The pnv_pci_init_ioda_hub() have been removed since
> commit 5ac129cdb50b ("powerpc/powernv/pci: Remove ioda1 support"),
> and now it is useless, so remove it.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/powernv/pci: Remove obsoleted declaration for pnv_pci_init_ioda_hub
      https://git.kernel.org/powerpc/c/10c8ac13395a087c90ba6acd11f793588ba5609e

cheers

