Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B605850B0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:17:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSk26qBgz3drL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:17:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSZC5wGYz3cdM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:10:59 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSZC282Wz4xGD;
	Fri, 29 Jul 2022 23:10:59 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220727143219.2684192-1-mpe@ellerman.id.au>
References: <20220727143219.2684192-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v6 1/3] powerpc/powernv: Avoid crashing if rng is NULL
Message-Id: <165909978923.253830.5419750752675440971.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:03:09 +1000
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
Cc: Jason@zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 28 Jul 2022 00:32:17 +1000, Michael Ellerman wrote:
> On a bare-metal Power8 system that doesn't have an "ibm,power-rng", a
> malicious QEMU and guest that ignore the absence of the
> KVM_CAP_PPC_HWRNG flag, and calls H_RANDOM anyway, will dereference a
> NULL pointer.
> 
> In practice all Power8 machines have an "ibm,power-rng", but let's not
> rely on that, add a NULL check and early return in
> powernv_get_random_real_mode().
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/powernv: Avoid crashing if rng is NULL
      https://git.kernel.org/powerpc/c/90b5d4fe0b3ba7f589c6723c6bfb559d9e83956a
[2/3] powerpc/powernv/kvm: Use darn for H_RANDOM on Power9
      https://git.kernel.org/powerpc/c/7ef3d06f1bc4a5e62273726f3dc2bd258ae1c71f
[3/3] powerpc/powernv: rename remaining rng powernv_ functions to pnv_
      https://git.kernel.org/powerpc/c/978030f054ff97d9079b35f0178e2013918fb316

cheers
