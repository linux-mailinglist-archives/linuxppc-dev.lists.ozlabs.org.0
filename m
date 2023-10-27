Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 239447D94DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:12:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Oydjz4Pn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGz3t01Wlz3c13
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:12:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Oydjz4Pn;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGyzP37Pnz3bx0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:08:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698401297;
	bh=HIiuIblWmUwKBLfr5E+dwEIl0kur8dk5dqSlJMaUuB4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Oydjz4Pnt5L2pyLZ40VdI5wD8BKnUj5VXQPmb4dXk92o+86rvK1Tx/rK4XsttL7Vq
	 xWn1EeTS+WHcqpPiXXODUwM8A0DYs0zsAU+tyl3U6L9SAscdj/kpfFFWQpO2ILktlb
	 OQBiaq2aWSHs8gYf1f1BF/H4Ei6ozWhS9z2OD+Le3kqe9L+fXh2mRqt2Nrgc+CnTsw
	 xNEuzEklqDeoMf4OBPVQP3HVqbdedKjUFZg9t3CcJdXCXTGicasmNC6WhRsjWaKjsn
	 t1xUxjPJifDYt5sWGB9j4Cu65G1QipWJsA2VV7A/n6m0v1pSbMR54RjpzkxEnp3FwD
	 CK4URafB0W5QA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGyzP1mjmz4xWY;
	Fri, 27 Oct 2023 21:08:17 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <3aaa40bf706afeab8fe9a74b8437704a4269a6a2.1697005615.git.christophe.leroy@csgroup.eu>
References: <3aaa40bf706afeab8fe9a74b8437704a4269a6a2.1697005615.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Remove cpm_dp...() macros
Message-Id: <169840079683.2701453.1626668836711742489.b4-ty@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 11 Oct 2023 08:27:03 +0200, Christophe Leroy wrote:
> Since commit d3c511ac1d72 ("powerpc/cpm: Remove
> !CONFIG_PPC_CPM_NEW_BINDING code") cpm_dp...() macros have no added
> value anymore.
> 
> Last user of those macros were fixed by commit 5e6cb39a256d ("net:
> fs_enet: Use cpm_muram_xxx() functions instead of cpm_dpxxx() macros")
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Remove cpm_dp...() macros
      https://git.kernel.org/powerpc/c/ad496f8f83960c211b00fdbd8ae4ac1e55e4f3d5

cheers
