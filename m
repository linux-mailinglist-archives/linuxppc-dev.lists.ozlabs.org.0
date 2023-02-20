Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F2469C51D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 07:01:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKsHk1qJHz3cCn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 17:01:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kI/JF0f+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKsGn053nz3c6Y
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 17:00:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kI/JF0f+;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PKsGm23WDz4x7j;
	Mon, 20 Feb 2023 17:00:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1676872848;
	bh=iolXeOUuWKzcYomt55jMlX8MUnHJcpkscdJ1uF5zKw0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kI/JF0f+wHy5CyAR3A93DGSnEBScZIlEunUMBtYVYXyPKVhJOGrvNcDm0oHP7y3WO
	 Uv+yMSW9OC/wZkBbB61NcIegGy+E3pPLv0zugaVPsPrRl55vAhldfkO6iXJR/z24de
	 r93RFODGuSQIV9+VunlUaQX2cAqD1jK2oP2XtYuDJjv4112O+5hoHbE0EZYJv/OoGL
	 4ptPAFiuXdIFNlkU+/uc9/J+hdWzwPbJzF8mG2BRZjqQZL+Ar0ZfYMyjFs7hTTr7TF
	 vB9TRAlNnbPrLPqnyFXDRlpOByglBc69oo31r8YY24ogbTbBVCCDb2DyKJKwRSXC2A
	 s7JRkI/dwe4lQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>, jbglaw@lug-owl.de
Subject: Re: [PATCH v1 4/5] powerpc: Remove cpu-as-y completely
In-Reply-To: <9e43ad8b173c2fdb540e2555a8ba3e375419f3cf.1671475543.git.christophe.leroy@csgroup.eu>
References: <38a8d765ed9149bc6b5484a7142e3bc59ffa3b1a.1671475543.git.christophe.leroy@csgroup.eu>
 <9e43ad8b173c2fdb540e2555a8ba3e375419f3cf.1671475543.git.christophe.leroy@csgroup.eu>
Date: Mon, 20 Feb 2023 17:00:47 +1100
Message-ID: <873570zxio.fsf@mpe.ellerman.id.au>
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
> cpu-as-y is there to force assembler building options.
> But there is no need for that. Gcc is passed the necessary
> options and it automatically pass the appropriate option to
> GAS.
>
> GCC is given -maltivec when relevant, so no need
> for -Wa,-maltivec in addition
>
> And -Wa,-many is wrong as it will hide innapropriate
> instructions. Better to detect them and handle them on a
> case by case basis.
> -Wa,-many was added by commit 960e30029863 ("powerpc/Makefile:
> Fix PPC_BOOK3S_64 ASFLAGS") in order to fix an issue with
> clang and the passed -Wa,-mpower4 option. But we have now
> removed it expecting the compiler to automatically pass the
> proper options and instructions based on -mcpu=power4

I wanted to apply this one, but it caused a lot of breakage for big
endian Book3S-64 builds - where we build for power4 but have lots of
code that uses >= power5 instructions.

I'll try and get those all fixed and pick this up for the next merge
window.

cheers
