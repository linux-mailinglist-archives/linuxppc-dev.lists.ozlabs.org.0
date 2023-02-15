Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8260697C43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:51:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGycR4BH0z3gGV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 23:51:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGyRR3Fwtz3cdy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 23:43:15 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGyRR23jHz4x8H;
	Wed, 15 Feb 2023 23:43:15 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20230121095805.2823731-1-npiggin@gmail.com>
References: <20230121095805.2823731-1-npiggin@gmail.com>
Subject: Re: [PATCH v2 0/3] powerpc/32: nohz full support
Message-Id: <167646484638.1421441.15668047645206342967.b4-ty@ellerman.id.au>
Date: Wed, 15 Feb 2023 23:40:46 +1100
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

On Sat, 21 Jan 2023 19:58:02 +1000, Nicholas Piggin wrote:
> I'd like to try get this series merged. If Christophe isn't comfortable
> with patch 2/3 yet then maybe we could at least get the first one in
> which shares more code and makes it tidier.
> 
> Since v1 I just split the first patch out so it's not introducing a
> significant functional change.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc: Consolidate 32-bit and 64-bit interrupt_enter_prepare
      https://git.kernel.org/powerpc/c/fb3b72a3f483f81a33a9693ed03dc62158a6f77e
[2/3] powerpc/32: implement HAVE_CONTEXT_TRACKING_USER support
      https://git.kernel.org/powerpc/c/5c4b710a8157ec271fac4806562ee1aa1b44a53d
[3/3] powerpc/32: select HAVE_VIRT_CPU_ACCOUNTING_GEN
      https://git.kernel.org/powerpc/c/01f135506e2ed0403512c2467bd50746bdbd576d

cheers
