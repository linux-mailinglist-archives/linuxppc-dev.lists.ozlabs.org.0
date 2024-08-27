Return-Path: <linuxppc-dev+bounces-577-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2224E9602C1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 09:15:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtJj43M1Mz2xG5;
	Tue, 27 Aug 2024 17:15:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724742920;
	cv=none; b=bxMEG4clMiyn+o2Hpp5ojFSdVPXDQ8Y8I/H6UIl4MhrXYu5EIdwgR+9NhUr3fCyibFkhHcD6HIxOZRcIJ+8lhJdo96LUMNRWtrZwxke8bCZ4zCVsnhMQ4Xp4dfzWcg9NbFUIA6CMAxNHV0i6qzXjjXvDQhwZQPmCRAIwqxN8WwdgDZlKmQgpFpyDVSlZSMNLBAaG3vTICHpCVDdi8sFTTVorkpjXXtuyaiYj5+8GxZRZkYkDLtI9I6IVBIfCp+894cTK8PpAZVMz2wGE0qGSuNvp99ksPOkPXtY9dC/AiSWcSN23w/4P3yVtKlhwPuX4OpNRQXVODy2Ygj4WbgT7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724742920; c=relaxed/relaxed;
	bh=CSeHedfqR6MiSse7v/9PJWgnIs7v/GPZDhsBlXQ0e1o=;
	h=DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=BWFzLG+ykgHXLyaYE4NbR7eNAox+jjCB7cqrXfgV0AlknPDUwQTtGIOy5s4MCeFnNY9UraunWhTB1jnD0cYERupIWU395Y61V0GTKG2xoCqJLCk9SSWyJhcrLQcTxZBe/Qalnjm14G1+yAW+YlWhF74GEofU21QBBmIjKJdfU59Pqq413xAY440KqYIoMYYAOnFk0uka43VpKfhdIj/eS3tyBQmgrbuIrBP+E5MAby2aiGgAivGL13ADfXN0p5HgRPrXaS9hNMLbZBPPiDaXRaEUb9V6Li+iWyIMtKPk6lZk8xArhXqEa1oDllHp6Mck6e2MU3ASmJfe98F3vnU8vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=r4mzUSBI; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=r4mzUSBI;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtJj42QR8z2yY1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 17:15:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724742920;
	bh=CSeHedfqR6MiSse7v/9PJWgnIs7v/GPZDhsBlXQ0e1o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r4mzUSBIh+g6lU4imkIbD0jg8Dc5fQ6CmrVAxV17sJYgp6Ga4NdlBp7guomSM+8H7
	 BbrMgRF6DGLiVIyPlo1+zDyzdPAWcFbebWTjx/fsIcGOwOzf6uwH0huXYyrmrqHYFZ
	 3VdcYiAIqd0dxFOds8oaueU6x82quhyuRvfpw9NdgUW9BrXCrJc9B6KAehfyRhCgof
	 7kApMBTBoEzDBLck+Q10Dv/9ksMJAt+vYT0Wl2Piu9/lNtY8eCJj+574wl9MFhweyG
	 wRv37801q/qCcQtHUKPXpVkvVwCjYL4Lt8nu1YXOB9Zrz/8/Sm1/NSEUbnpAY1Oz+G
	 QqrO9Maj7XKlw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WtJj413Yjz4xKW;
	Tue, 27 Aug 2024 17:15:20 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <45c3e6fc76cad05ad2cac0f5b5dfb4fae86dc9d6.1724153239.git.christophe.leroy@csgroup.eu>
References: <45c3e6fc76cad05ad2cac0f5b5dfb4fae86dc9d6.1724153239.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/vdso: Don't discard rela sections
Message-Id: <172474289343.32718.13009497655223214357.b4-ty@ellerman.id.au>
Date: Tue, 27 Aug 2024 17:14:53 +1000
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

On Tue, 20 Aug 2024 13:28:07 +0200, Christophe Leroy wrote:
> After building the VDSO, there is a verification that it contains
> no dynamic relocation, see commit aff69273af61 ("vdso: Improve
> cmd_vdso_check to check all dynamic relocations").
> 
> This verification uses readelf -r and doesn't work if rela sections
> are discarded.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/vdso: Don't discard rela sections
      https://git.kernel.org/powerpc/c/6114139c3bdde992f4a19264e4f9bfc100d8d776

cheers

