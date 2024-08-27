Return-Path: <linuxppc-dev+bounces-575-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD21F9602B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 09:14:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtJgx69wKz2xbY;
	Tue, 27 Aug 2024 17:14:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724742861;
	cv=none; b=gzl1A+yVsx/GfqBMuqTLbJSyPBsL6Dy2K5rIRPgzNzjzJ+C4sq5NQ8Y1Hrft4KuiJtoVfh64pMnFvRpCIdiMMBukZ9XvfUMsVd/igk7/Q28T52z5TlT6J9V9iv1vuJRiuxIs3hBUJ42dS2e7tfntVgVxQUEsd5kVIJn9GLA8HFZAmyln8pAViD4zWiorHPODXW3VL+T07FrdiP9mnIuJSnwN1Jl5oFrfR63XQUQ+VXPvjDQ8+xxRUTPwdsNQmHZL4Yefj86Yy6pAj3/c/d8XwwlSB7D7A+JiUXtu3TGcEdkZS4c3pUeuJROE7avPkOrKhx/3VPwoqzJ5It0y4Uty7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724742861; c=relaxed/relaxed;
	bh=ZONpfAn4J/I8AE+o3hedBFPBazPggLrLUOTjUJKE6Nc=;
	h=DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=m509Lc0JMK0ymlK9r8XQ7hswmv98cXjwTNbBy3c31aSdtSPsi5mOIJpG0eOmDoKk+NWO4gXt8Mln1eBSKzqnLWs0pU6ORbWG4snQOLHqT9ux3Zfk8qG1TPDjBtjRgvHzq0ibPg3tLJTeq6+MU/NmKws6h9tXxg35LHk54O/P7GmA+g5GzsOBcoaEmwwxXybs5aLVF+rvHN+0KzQsuCMyJvCGWA0siAN/PnjeqZkm0t8yc5q3Iztc2QR+CFPnQCvBMqVLhZWXzBNB7ytQil9IxJln3SrlcCUW8OTrayEH4e3wsT0TsfofODlDP01W/NS73JDJUmEGCwu92Szksy1SPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WWQ0eP7+; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WWQ0eP7+;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtJgx62Dpz2xWZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 17:14:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724742858;
	bh=ZONpfAn4J/I8AE+o3hedBFPBazPggLrLUOTjUJKE6Nc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WWQ0eP7+oBBJO3+DnUs2DJ9M8S69phvtVxv2/jblE5Eu0iR6tvd6J4dqTGuJlMEjE
	 NnV5n6u1KHngL34b+GEtJdd4YKRaQkTepc9fYc95UH4EX01n5edKhgNgy14jBkD+ev
	 6MTdTQETC/Bxpp3dyTeQ6hi29kkGU//wKlEe+MPdUR8dd3n5iBHqhZiN5KOESoKKDp
	 5eEWtYZrKLkhFqFM02rqF1dB72xkuLOcRFwjDUvVsmxDFas0BwStfE51i1PNBC9XfH
	 Hv3cWchl+xYQKjVzjCSJE87mEs2lpeQ9iEbT5JFuU7kOuKZ6rdahdXDYZDkeSiUeYW
	 YlYZFsvpY0JgQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WtJgs30mkz4x6l;
	Tue, 27 Aug 2024 17:14:17 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: jk@ozlabs.org, arnd@arndb.de, geoff@infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240726123322.1165562-1-mpe@ellerman.id.au>
References: <20240726123322.1165562-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] MAINTAINERS: Mark powerpc Cell as orphaned
Message-Id: <172474280308.31690.5184828859229185339.b4-ty@ellerman.id.au>
Date: Tue, 27 Aug 2024 17:13:23 +1000
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

On Fri, 26 Jul 2024 22:33:21 +1000, Michael Ellerman wrote:
> Arnd is no longer actively maintaining Cell, mark it as orphan.
> 
> Also drop the dead developerworks link.
> 
> 

Applied to powerpc/next.

[1/2] MAINTAINERS: Mark powerpc Cell as orphaned
      https://git.kernel.org/powerpc/c/db9a63913fc7aa6ea419c9a787bfa18937515037
[2/2] MAINTAINERS: Mark powerpc spufs as orphaned
      https://git.kernel.org/powerpc/c/81695066c76fa74aa00aadbcb360cc7ab9c70c51

cheers

