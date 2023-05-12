Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 149A26FFFB0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 06:37:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHbbd00fxz3fN5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 14:37:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qrQabGj5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHbZl6YhLz3c4B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 14:37:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qrQabGj5;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QHbZl5J04z4wgv;
	Fri, 12 May 2023 14:37:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1683866223;
	bh=bFdF3qVgrRQwTQKB2U2Zclw0g6ascaQQQ/vCod6HYPI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qrQabGj51hz+dz3GgYO48fUDv3SpvtZ3BBIFG/OsDWeKuqaxFtQoyBD2HNLaAO30u
	 8JEsuAvf8rqTc2mLlGhgKvCsO0Zb0xeHIhZSNJ7iQMrKT1gXJD+KbB3IRBVlKrO6u3
	 EKyjd1iDbvy85BfrTNvBDHngrc4A+poGervWfhQgxpSpoNkI0ut/Mjl+DfgiZDjTV3
	 vsjGyBr3hA0dznhnnn0GM6l9+Vz14j9enBbsZavd2fVrtQQOsDVrNSQo1eM6ykmGAh
	 QT3unhjiZ+9kEOL7jsOfDTPqmSsUTo69exBDUPtuXy2V2Y+BUOaZpQkm0iHGHgkCuN
	 nPeeVACZuosxg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/embedded6xx: select MPC10X_BRIDGE only if PCI
 is set
In-Reply-To: <20230505230032.19156-1-rdunlap@infradead.org>
References: <20230505230032.19156-1-rdunlap@infradead.org>
Date: Fri, 12 May 2023 14:37:03 +1000
Message-ID: <87wn1ejhcg.fsf@mail.lhotse>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> writes:
> When CONFIG_SMP is not set, CONFIG_BROKEN_ON_SMP is set, and
> CONFIG_PCI is not set, there can be a kconfig warning:
>
> WARNING: unmet direct dependencies detected for PPC_INDIRECT_PCI
>   Depends on [n]: PCI [=n]
>   Selected by [y]:
>   - MPC10X_BRIDGE [=y]
>
> To fix that, make the selects of MPC10X_BRIDGE be conditional
> on PCI.

That would work, but using "imply" would be preferable as it doesn't
have to encode anything about the PCI dependency.

cheers
