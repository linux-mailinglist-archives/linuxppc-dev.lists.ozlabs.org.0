Return-Path: <linuxppc-dev+bounces-1103-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E5C96F37E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:48:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZHJ1C13z2xKd;
	Fri,  6 Sep 2024 21:48:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623292;
	cv=none; b=ETF+il7jZRdmuhKcv+JHtDTYfyaMJG3u6hP/QJbMEKRE6zAtJOeNradDbhHTibgDK0VeRCr2gm2b8Xvh6yV8k6HF/dx0zb4Jxpb2S9U3fmjArpG81D/WwcAm/UQhBIUvqVEVW5W3cSW71vvIFzYGQqjDVVS3Uxo4GxpWmDz7J5CMTPLyrnumkvo3rehkzGYHbUpD1892wrO7swHDnPtihStBJDHHBRFw5fA670sPyOhzAEloHl08W+FFq/Gbe4IwcZxC/2nI98B8lmkTGSpraCQqG4R0mD0Uut7I+wgbNlElEsnfuv2IuNcsQsy4HSdax4WJW1om7sPpLUrJoLcuFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623292; c=relaxed/relaxed;
	bh=4yBsZEY7Hesn67awFwYAy75xg1NngpI4UOwPcvd0DGA=;
	h=DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type; b=oqf98EQIxfssfDJOI6rSuE7oI18syXRN1CVW7gRVgDvGY0+ZbGt5t5F18uOce/LaBLZXvtzrXVDVgcTLkuWnw8bnHVxyUq8VTm1YowVR8ab9bhFFIJ4GoFqsLQVVfnNtj1go7/CMD8mxAiWowft+gWfX3pFjgRmnl6VCr9u8KDfvzoXNqWD5dzCMf/43WNXAd+5uOGgpMcauBhvwts+yfGNiNCTJRM8C96i9sdW+qPMcY6GksSpM1D32p1tb/vGFh+FAftd6rPfaiVJcCNJn9JV7DDtRETvXl/AlWFD9uYBlSM+tq3z3mO9EHbWIMGZfVeZPtesjyPTIuJYRRG3gxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cxm6y9EY; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cxm6y9EY;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZHH1Vw6z2xGs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:48:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623291;
	bh=4yBsZEY7Hesn67awFwYAy75xg1NngpI4UOwPcvd0DGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cxm6y9EYtW7EDJdt2IxMs03JP1S/HYOaJyuRFN3suKcyUuku92Tr8Jd/SAjgUMAiC
	 77huDQjvRHjYvhTZUgi2nQpF/0jKsmHvp2WP2pS58VErHviDNdfQfOIZ4HjhMh8RDR
	 +mU1xbuT/29p6z+tgiEpSKIzMgQi8Tap2TruyLjHRGHe+U95d8+tgSriLBRGLdoh8S
	 amSfRMFH9GM+0WSfA8mDYgO5inzog1OcjpSjXY2gFxcq3m0VJ1aKl+ZADWUFRcVBga
	 shKJAGTmnN2ZpDI+jjVuR3GaS08f3y13yb/ObFM1Q5HdF+E8h/kCv/NgnghSnE0GNO
	 dAMO86RKSgr0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZHH0CX9z4wxx;
	Fri,  6 Sep 2024 21:48:11 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Nysal Jan K.A." <nysal@linux.ibm.com>
Cc: stable@vger.kernel.org, Geetika Moolchandani <geetika@linux.ibm.com>, Vaishnavi Bhat <vaish123@in.ibm.com>, Jijo Varghese <vargjijo@in.ibm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240829022830.1164355-1-nysal@linux.ibm.com>
References: <20240829022830.1164355-1-nysal@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/qspinlock: Fix deadlock in MCS queue
Message-Id: <172562323422.464302.13801524851924660182.b4-ty@ellerman.id.au>
Date: Fri, 06 Sep 2024 21:47:14 +1000
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

On Thu, 29 Aug 2024 07:58:27 +0530, Nysal Jan K.A. wrote:
> If an interrupt occurs in queued_spin_lock_slowpath() after we increment
> qnodesp->count and before node->lock is initialized, another CPU might
> see stale lock values in get_tail_qnode(). If the stale lock value happens
> to match the lock on that CPU, then we write to the "next" pointer of
> the wrong qnode. This causes a deadlock as the former CPU, once it becomes
> the head of the MCS queue, will spin indefinitely until it's "next" pointer
> is set by its successor in the queue.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/qspinlock: Fix deadlock in MCS queue
      https://git.kernel.org/powerpc/c/734ad0af3609464f8f93e00b6c0de1e112f44559

cheers

