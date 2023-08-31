Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AF778E550
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 06:09:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbnjL270pz3dS0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 14:09:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbncL1KQgz2xdb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 14:04:50 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RbncL0Pjzz4x3F;
	Thu, 31 Aug 2023 14:04:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230823055430.752550-1-mpe@ellerman.id.au>
References: <20230823055430.752550-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Drop zalloc_maybe_bootmem()
Message-Id: <169345455028.11824.5523013276138425964.b4-ty@ellerman.id.au>
Date: Thu, 31 Aug 2023 14:02:30 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 23 Aug 2023 15:54:30 +1000, Michael Ellerman wrote:
> The only callers of zalloc_maybe_bootmem() are PCI setup routines. These
> used to be called early during boot before slab setup, and also during
> runtime due to hotplug.
> 
> But commit 5537fcb319d0 ("powerpc/pci: Add ppc_md.discover_phbs()")
> moved the boot-time calls later, after slab setup, meaning there's no
> longer any need for zalloc_maybe_bootmem(), kzalloc() can be used in all
> cases.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Drop zalloc_maybe_bootmem()
      https://git.kernel.org/powerpc/c/fabdb27da78afb93b0a83c0579025cb8d05c0d2d

cheers
