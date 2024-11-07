Return-Path: <linuxppc-dev+bounces-2973-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB9F9C0053
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 09:46:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkbHX5LVpz3bnr;
	Thu,  7 Nov 2024 19:45:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730969112;
	cv=none; b=SksiD4dkUfGSUJac+YREYNAb/cClY2YkaVgzXWhsQN6QxOAbuZY1p+jBta8kob3T6wgYFyWi1OxO03+aSBCpjy1eezCrnROqaMqX/DyN3HSclOPGnCx65Td1/wiLda//b9yfMzgrm7bjcKs4mG+sNGFHLP6ctpwu7kwcC6X+Bbkm564wOHJ81dxyKhB33fiHak36mcOiw20+iEtTWLQVKqlCYJqtRrXO8dRCCMNSy2iQ1An5kB0Qm8yc2CuihZCkNQ/x8YCzIOP78pMuAdkyAaBo4Z0xqrIF/jG1XNvZJJmNKMmGGVSzRmuNKyX7nQnicGI26gVElZb5+QbamEMe+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730969112; c=relaxed/relaxed;
	bh=AtYWqTIxPgHoeHB3zYOtmIE2TS3jK6OifDuwNw11R3g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bUwfbL9faMsW/PHIZD6MZOTupAlEKRob1LK9UpKAZ/x3X1QK6ehS9ts70eTsGR+Q+FKfY/T047Dsf0Ut7dJEh9xDt3i1b9yhWuxK/yp7t8YGF3kE2c//ohCYkppJWON6mjUJkK8ugL8GR7FZH5zyX3CVIOygiGDlBR0S5HnKDL960eNuhch/bV4w0gWpgnQ3g0EJ/p6ZpXn4rqHfkkEXeQpPgluaIJIczCFQqqke4tJhUXGowgWEL8gCPgixR+Di//fT64fcXeYs5GkY6D14N1Pi8JiLDpyJPssrKdxH1TzoOUmY0RCpyidrhkOa6RmVdfCg7trH2jYrORHMqWoGyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bqPuUQqX; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bqPuUQqX;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkbHW0cqlz3bmq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 19:45:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730969100;
	bh=AtYWqTIxPgHoeHB3zYOtmIE2TS3jK6OifDuwNw11R3g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bqPuUQqX3r1BkIgoVFvzvB/F+APT5FTZpDxRKcsadpBJbEpPVI0WqNmCfKkMC9gn7
	 NfiD5VfZjknI3E1E7N/5Bxc/PsjENZ27tFxw92vCqhdHBzKW59bP7i9JfrGfUnemsy
	 do2pyG7q96AZvfb44tYxUcOrVnM1/UWhUDwOOXjzQ9yXVA2uBsQLvE/VtIK9LhxLWK
	 Oo7TKHYNOFoagSxVQOBxE9ftl27JDSTYBt6c97D1heqd56vLvcV2HAwfMgvqlEK8NS
	 bQc6MNLVpjSNNF981GiPZVhzZjZm5dDu6XGw/iSD+Dln1wClgKslRLDJ8W00/g/efL
	 uFTVO1GZ6+PFQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkbHJ0Zfvz4x9G;
	Thu,  7 Nov 2024 19:45:00 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux@leemhuis.info
In-Reply-To: <20241009053806.135807-1-mpe@ellerman.id.au>
References: <20241009053806.135807-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/boot: Remove bogus reference to lilo
Message-Id: <173096894649.18315.12388791074755480804.b4-ty@ellerman.id.au>
Date: Thu, 07 Nov 2024 19:42:26 +1100
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

On Wed, 09 Oct 2024 16:38:06 +1100, Michael Ellerman wrote:
> The help text refers to lilo, but the install script does not run lilo
> and never has. The reference to lilo seems to have come originally from
> arch/ppc/Makefile, but it was not true there either.
> 
> Remove it.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/boot: Remove bogus reference to lilo
      https://git.kernel.org/powerpc/c/c7182a0bdec16cdea912b5a3aea9a80f4f657b7d

cheers

