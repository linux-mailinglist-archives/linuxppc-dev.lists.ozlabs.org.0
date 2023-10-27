Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F72E7D9525
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:23:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=awF+gGUp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGzK303yRz3wRG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:23:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=awF+gGUp;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGyzd54JRz3cTF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:08:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698401302;
	bh=4zpW2Ej49O+fw+/4GVGtCLrWkB843lWN/CxSuwPn4BI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=awF+gGUprdTX8E8+1W2BshMTrSwBbWbMXAYFevxbBf1FuEeJAo6dOP3qRpxaPTMaw
	 kt6EiU/bqVeq6hhg3aCnWfLTsd8IodBgc6qPCxjqWh5ab62QxFm1RM6EPWDVGdb8LQ
	 JgxxaKfKr7oTu1J037vGSC3v5MhoBruiOKVXYWqxmMWHLF93Bap+9poA0E49YwoI73
	 Q9IPpIsilq/BvKBhLD+saiTR+f5XmaUzjddq/OlkTvHIX58ZQS9GXazhJYmnN+cZip
	 zhQ4M77LPyqHw1jZpENok3uxVK2era6x9l7r6COeY476XZ4NiA/Pb23/knKKdvB8p6
	 G7RfB40mmoIJw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGyzV3CCcz4xX9;
	Fri, 27 Oct 2023 21:08:22 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Naveen N Rao <naveen@kernel.org>
In-Reply-To: <20230530093821.298590-1-naveen@kernel.org>
References: <20230530093821.298590-1-naveen@kernel.org>
Subject: Re: [PATCH] powerpc/tools: Pass -mabi=elfv2 to gcc-check-mprofile-kernel.sh
Message-Id: <169840079682.2701453.13462664634309720164.b4-ty@ellerman.id.au>
Date: Fri, 27 Oct 2023 20:59:56 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 30 May 2023 15:08:21 +0530, Naveen N Rao wrote:
> Toolchains don't always default to the ELFv2 ABI. This is true with at
> least the kernel.org toolchains. As such, pass -mabi=elfv2 explicitly to
> ensure that we are testing against the correct compiler output.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/tools: Pass -mabi=elfv2 to gcc-check-mprofile-kernel.sh
      https://git.kernel.org/powerpc/c/d42f55e8ae741540d0d2ebab8ff02f68fb0c802f

cheers
