Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB75F698795
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 22:59:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHBnG6JPxz3brK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 08:59:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pKqCwJlj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHBmM08j3z3bhH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 08:58:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pKqCwJlj;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PHBmJ4JzKz4x4n;
	Thu, 16 Feb 2023 08:58:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1676498320;
	bh=66RYPVgMpz94tBHchX7oiuUA6G3IDTuSBU9OW1M8NeY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pKqCwJljTt4SGKmbz+G4Yk1mAMdnLK4MLIleTw2C8g8lB+dmvGgsx9dgI11EarFab
	 BoJf8gOMSeG3XTGzG2k0JeJQ6Gpj7rb881NYX+mRrBm+n13jEfiqkCEn280RXYS78I
	 EU32BxU1ArVbJJHmrqFgWLkqWhvmOCBm9TrGox3ec50VLDMjQxrcc1E6PBYuiCwwB9
	 bhi2+y8QOI3ncfNmNAghVA9I/8qhjje5ub5e27MRis44edHg/jyfHWajHmgTas1Y6z
	 iAbN0Gfxu7C8L6LC9rMuvfEZ9YAfnng7i7HV9x8GjNuSR/fa4iNLdmHk/xJSe17s2W
	 jvsNxsc0oTLQw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH v1 3/9] powerpc/47x: Split ppc47x machine in two
In-Reply-To: <ae59e5bec0293b09a1e31690570cd1347b2d6fa6.1676465585.git.christophe.leroy@csgroup.eu>
References: <04ed69b4226633ab90983d7efb5bd4791078fe71.1676465585.git.christophe.leroy@csgroup.eu>
 <ae59e5bec0293b09a1e31690570cd1347b2d6fa6.1676465585.git.christophe.leroy@csgroup.eu>
Date: Thu, 16 Feb 2023 08:58:35 +1100
Message-ID: <87v8k2616c.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> This machine matches two compatibles and sets .pci_irq_fixup
> on one of them.
>
> Split it into two machines, then the probe function can be dropped.

That will break the machine initcalls that look for ppc47x:

  arch/powerpc/platforms/44x/ppc476.c:machine_device_initcall(ppc47x, ppc47x_device_probe);
  arch/powerpc/platforms/44x/ppc476.c:machine_arch_initcall(ppc47x, ppc47x_get_board_rev);

It still compiles, because of the weak attribute in machine_is(), but
those initcalls will never match and so never run.

cheers
