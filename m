Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E08A8BFF84
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 15:52:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oaLWVIBR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZGms4WZfz794Z
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 23:52:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oaLWVIBR;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZGj56TRCz78YQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 23:49:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1715176169;
	bh=Dj3GCx1b2Hv1ldLYLeGFgz7QVzoUwpL4vNUihbESG4U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oaLWVIBRmA3DNMsBzS2quTFluM+qCWDh/14ih77v55tHuPU6xcCHEa9+v/GzoDcOf
	 IMVg6hOLXBbwYDvPmTPsZZAWz7HB6vTyw1bxfbwxMpw3BZf2tkxFE8BXBJoM3pKGYE
	 82hs7urcc58Sx9blYTSKXvsBscdqpNpKg5BvVp6vko0SJ+fHsUfHVNyXm56aLrNRj+
	 sxXjAIP6L44h7ywCZ6wLl9gz39zwDHcU0AQMbJUarpkI06qm0h2JlVyU0b8vqmrjg9
	 ZUJ/ZyQosH5bhzH0clZBg5A0R2BlCTWQicQTKh5e++64khrEwqEobCmGToMyk40BKT
	 IWMEpPIhadrzA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZGj55p0Gz4wb0;
	Wed,  8 May 2024 23:49:29 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 7/8] powerpc: Fix typos
In-Reply-To: <20240103231605.1801364-8-helgaas@kernel.org>
References: <20240103231605.1801364-1-helgaas@kernel.org>
 <20240103231605.1801364-8-helgaas@kernel.org>
Date: Wed, 08 May 2024 23:49:29 +1000
Message-ID: <87le4kmn12.fsf@mail.lhotse>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bjorn Helgaas <helgaas@kernel.org> writes:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Fix typos, most reported by "codespell arch/powerpc".  Only touches
> comments, no code changes.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org

Applied to powerpc/next.

[1/1] powerpc: Fix typos
      https://git.kernel.org/powerpc/c/0ddbbb8960eaf91c7b432ec80566dfa60a8d79e4

cheers
