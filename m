Return-Path: <linuxppc-dev+bounces-1120-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A07396F3D0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:57:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZRw3v72z3c5h;
	Fri,  6 Sep 2024 21:55:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623740;
	cv=none; b=NnlxWmXPV6puK/8kJ6km1/GifO5eKyrnKAmevqYgVdOz8tKv5cmCaS2j6inVDb6gGQfFu8x13raaZe/kSNsQuZiFGgEqQ6svt8wumLWACfzCHMz4FMQfgpxmshuk6STWRMxS4hb7vEZaZj1YAUNyYFZ47w9FEb4rBBkKYe/+CIJBhl+auEQ9gWn51gtjAS9z4WZRtUzNzrPKqpjMmXzbWTVHnBrjE2HxIV2qScchT9EQl+seNWbIxE7xUGIxPMrUd6ZlD58fQ2A2hiGa6l2n5oNshzU7bGXt+dVTRMIvIyi2D900JH9r9qO1jovhhGW104pr7XCXefVEOcwLGpYUhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623740; c=relaxed/relaxed;
	bh=q4+5OBBCLEenVP1yKe6CohEDLCCwiap2I6hvNkW55fo=;
	h=DKIM-Signature:From:To:In-Reply-To:References:Subject:Message-Id:
	 Date:MIME-Version:Content-Type; b=jkxwxsd69svZLFtTXFmJtoQQpO/tVYSYtDaMBlNvVHEu0kWb3qBOEcnU5fWx48btePwUgKLrDpIzJm0fcgsA+wLyy2RFkdR7LkhNwprxDZJrBvrZRBNyW8wm27NyrBHc0ZiD6Q7UP3enGIMZmhkk6Jjj9ChSQtlSla1aY+XV6HhfJUQVcXVeStLnb6xm+N30qu3PjUbws9Tn9HLqeFjrdRNZJKCzSOJz+jszux+SWVQ2y5ZWfQPmUPSMtm3wN9E5x2m9x7EOdzjj7JNbjNdo1MbtAqmnjQxDSv9ZsprmycE4WIq/hSTktzRx1b2gi/Z45Z6GoLzQgrQil7CCfsKy9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KXY7e0EB; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KXY7e0EB;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZRw3lwSz3c5Z
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:55:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623737;
	bh=q4+5OBBCLEenVP1yKe6CohEDLCCwiap2I6hvNkW55fo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=KXY7e0EB3BGx5E7XVHv82MJcs3ASoB51ptvWN076nuAeH590G8ZfEN/q7Ab9EA8CW
	 Khjwl2bL3+yFRp0APTP9vsC2Ht0PLScaaGXR29foHsrRoxKqJt1txz/5G67NWSsuQD
	 mqS32ZkI2Kwehg1ggfQlXulhwDMtURE3L3jch+Fj7JWdTtoDP9+KRrl4P93w2LRPMC
	 mNkN3SKCwd1bB1jGYCuw+BWbX9tapFUjnyiZb+VgrCgAFRkuRVYlO9fvc0//RFPkmn
	 JkGAbKFA2yg73p7ue0JCfJCP0FIYFqzX4+vXb7Yt05isB3E7P9LmxbInOPBEfo6Zgy
	 TFSN0OrY0n9nQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZRs2GXHz4x8m;
	Fri,  6 Sep 2024 21:55:37 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240820065705.660812-1-mpe@ellerman.id.au>
References: <20240820065705.660812-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/configs/64s: Enable DEFERRED_STRUCT_PAGE_INIT
Message-Id: <172562357189.467568.5618868163096881920.b4-ty@ellerman.id.au>
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

On Tue, 20 Aug 2024 16:57:05 +1000, Michael Ellerman wrote:
> It can speed up initialisation of page structs at boot on large
> machines.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/configs/64s: Enable DEFERRED_STRUCT_PAGE_INIT
      https://git.kernel.org/powerpc/c/d6b34416b08895a7457c53630595ce84e4aa904c

cheers

