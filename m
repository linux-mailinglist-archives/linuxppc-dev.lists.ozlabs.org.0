Return-Path: <linuxppc-dev+bounces-3383-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C93C89D03B3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:27:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrqjF63jnz3bnB;
	Sun, 17 Nov 2024 23:25:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846337;
	cv=none; b=oLFZJlXJLMrSBZR/O8Zqg6l1PFGxx0QO/1sgyrFm3QndRppy+C5bcXo3Kk9bnhPgr6fOZ88CcqqEahDdiTri4+EPUKYfrnLMtAFHProLIZMJLeGlTscSWVSzB1bDLk4hHyLx6wKLFAv8/lp8bT74drq/XT408AHKXt+J6A2tRwqjLtrwZ9I2iNaZ4BGhPvLi2owRSGngtTXqda3tHVZEMu71Z/urzSwPOL9ZGVa0JykAhL2QvMUWPe+SFfKQuCKIp5Jr3cMFFHQuw8RfJfP8prgwJMDZdKolziLrv+ifk02M7sfC35aGBeTndS0w066BxBEdVEE9BF+2toswVVHtIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846337; c=relaxed/relaxed;
	bh=bpsWnoifT/hIC+01WtPTd1rGqigmxOpuxcKKogn0bFQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bm1UbbqZYfHg6KebM7Xq18df7KVg/mtMHv/gNCjR4jjwVx9wZXJh+ZHVn2eRjWm073LVe55JJ67Jvis+LNhNbHhe9TkYKX0Hz1uDTWGn8EPgaNSdf89G1191QqjjeFS5kfDhqP/P9BRI+dcGtahccOJHm0kEvP6GqoyPP32acsYZEfu87J1LIPkLczAcOEaYzP/4nL/wDAwmvRzV3/yP4Oy/AYd1w8PwY0UGTPp3pdxzJhAPmXfRrL27h0wnwLd/1fgd3/r8Wsq8bHAVz4fp7wInGkSovTKL1iF+tQijWMYsCf7dTflvMV+PDQtb7orbUihKVxhxcPAS69GlpviERw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Lor/k3St; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Lor/k3St;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrqjC72fGz3bny
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846333;
	bh=bpsWnoifT/hIC+01WtPTd1rGqigmxOpuxcKKogn0bFQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Lor/k3Stxzn3GSeVIckE9SptJ9kTkY8DrWM7Rx5ov/HyI4pL+Fp8vauVPIEc8HKrf
	 TMARtT/Hq3eFkWIDacFmk6GHrB4ijz20+fdJDXrpK0CqE/pOuNG4gUk2NzebQQUwyB
	 far9PsEyqK1T+9y22QgOcLWwNaFx7TtVXTJC0ic9hPYP/cKAgqCb+vLg0zENteK9FN
	 M4bdYZLSQ9oq+qfPEyvpLY+plhd8KR46vVfgb5jt6+WGz2EkbuESasu1KNT/F2oQmj
	 0g/bR/M3SrGFNrPLkCvaxEHtuFQEkipZxjuOgSoS1XtUn0h0T/89Xucu/AgOMRBcYm
	 S/New/kOv8yyg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqj872Wbz4xfb;
	Sun, 17 Nov 2024 23:25:32 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241106212640.341677-1-robh@kernel.org>
References: <20241106212640.341677-1-robh@kernel.org>
Subject: Re: [PATCH] powerpc: 44x: Use for_each_of_range() iterator
Message-Id: <173184539746.890800.10274728574642039643.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 06 Nov 2024 15:26:39 -0600, Rob Herring (Arm) wrote:
> Simplify the ppc44x PCI dma-ranges parsing to use the for_each_of_range()
> iterator.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: 44x: Use for_each_of_range() iterator
      https://git.kernel.org/powerpc/c/817a763a07f2407ca43b2134d067e7c0576f1b79

cheers

