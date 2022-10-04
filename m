Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCA35F44E0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:55:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfNx3PwWz3h0R
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:55:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1l3vvHz30Mn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:39:07 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1l2k6Lz4xH5;
	Wed,  5 Oct 2022 00:39:07 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220921014103.587954-1-npiggin@gmail.com>
References: <20220921014103.587954-1-npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/64s: Fix GENERIC_CPU build flags for PPC970 / G5
Message-Id: <166488989854.779920.12105665642744542088.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:24:58 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 21 Sep 2022 11:41:02 +1000, Nicholas Piggin wrote:
> Big-endian GENERIC_CPU supports 970, but builds with -mcpu=power5.
> POWER5 is ISA v2.02 whereas 970 is v2.01 plus Altivec. 2.02 added
> the popcntb instruction which a compiler might use.
> 
> Use -mcpu=power4.
> 
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/64s: Fix GENERIC_CPU build flags for PPC970 / G5
      https://git.kernel.org/powerpc/c/58ec7f06b74e0d6e76c4110afce367c8b5f0837d
[2/2] powerpc/64s: update cpu selection options
      https://git.kernel.org/powerpc/c/7fd123e544886bf04fa853869efe55cb3f22d0c0

cheers
