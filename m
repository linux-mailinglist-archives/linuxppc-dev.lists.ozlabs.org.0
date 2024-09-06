Return-Path: <linuxppc-dev+bounces-1115-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6910B96F3C5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:56:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZRr027nz30W2;
	Fri,  6 Sep 2024 21:55:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623735;
	cv=none; b=iib91UAoXGnP0pjP2TiNkJho62TYp4MWPowcYKYfE024oWHHgNgJhyVuGAqt6wtkj4Ri0PsDeNECS1MXmEmZLaRC3x1nhh5vmlNHdHVwgG3wd+Ffu2udYxPFkByYb7opXPsaSFi8lcerj1TyEQTvnfLC/ajC29QztTlU5YKKXpE0snamtxi7D8skypHGwotn0ahmcDoTB1DILy/CCmYfrI1zWEI59SKnnso6RXKDu9QMgVAfSlVHOlLROJ5NkpdIraD/W/QXF6dsLhJuA3YCZLm6Jt8/nst4FJrTgPP17b1eswU+aVSvoHDSBF4pD87a58blZQMmDKstgCr0nMV+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623735; c=relaxed/relaxed;
	bh=ERT06d4QVd8ygJPJyIqRVDKlmwzMMnfAmyFUut2V3co=;
	h=DKIM-Signature:From:To:In-Reply-To:References:Subject:Message-Id:
	 Date:MIME-Version:Content-Type; b=kgqLmJwUDaogE6QP8qQDuqQdLUDKTiSnZmABid6+2yk18vT/CI2fMtBq1d7W7osCrCDIu+mnjQyB9QP5j3Bi+dBE7NkY+hy1UM4ubNlWVPcipU+ZHAKY0Gt1XX9UQDB9SoTgVgWK2NAvjy7wKIAsBhkXfTtNs1y35pcLe0eVRwYsn4vys7Y3CsWdsltuGo27vt01SmQPxzvqif3SBBKJ6OjjtWydKPFPds8JvbXbcgwZGUNVrfzXJoN8/tLwKsvSc7jsAO82MJa3fOW/8XE1v/TPkuTnauPBEL7gNcMMrcSWfuS5ArEJ5uFYxADqBfDW5vyyZ5O+a75RyVthQHfonQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hWAJTFBo; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hWAJTFBo;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZRq70WLz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:55:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623735;
	bh=ERT06d4QVd8ygJPJyIqRVDKlmwzMMnfAmyFUut2V3co=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=hWAJTFBoqFFgQFucVYKGOu9PN67nvHBnESDXdCdhcuMpnxzWI/Bo3UL4L/eyCGcCB
	 fMxXRdTPGu4SWiPVohPyd/HRJGxgIrOdNPtglHvbwI71XLx7/1d9GeQHEHYP7P99XO
	 +yNgOlItubscjbc4paSkjAJc+r/CYqfro5wr2NeyBxhyi67FsAjgyenq02mZFNCjcC
	 o44Sof+zbfJGIISmxIg7q73cD+hbjvd3+y1AFRMqNw7CRecSdL/Z03AvcS+2JJp9lQ
	 +2LssJfanvMkZ0BaUTCpAonTy3akUr+FfCjL5fE31vN4bVSLcwZ1OyU9iArU4MfOzb
	 FUIb+fFgoKAaA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZRq5bkHz4x8g;
	Fri,  6 Sep 2024 21:55:35 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240821080745.872151-1-mpe@ellerman.id.au>
References: <20240821080745.872151-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: Make mmu_hash_ops __ro_after_init
Message-Id: <172562357216.467568.7403760223966123072.b4-ty@ellerman.id.au>
Date: Fri, 06 Sep 2024 21:52:52 +1000
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

On Wed, 21 Aug 2024 18:07:45 +1000, Michael Ellerman wrote:
> The mmu_hash_ops are only assigned to during boot, so mark them
> __ro_after_init to prevent any further modification.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/64s: Make mmu_hash_ops __ro_after_init
      https://git.kernel.org/powerpc/c/8589cdf0cf0b0a03d2285fc46ada2f28113f8620

cheers

