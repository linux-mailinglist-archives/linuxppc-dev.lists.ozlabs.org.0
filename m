Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA12442CF3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:41:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7Jr4WjFz3c7g
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:41:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7Fd62mhz2yNT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:38:29 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7Fd596nz4xcb;
 Tue,  2 Nov 2021 22:38:29 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <24d4ca0ada683c9436a5f812a7aeb0a1362afa2b.1630398606.git.christophe.leroy@csgroup.eu>
References: <24d4ca0ada683c9436a5f812a7aeb0a1362afa2b.1630398606.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/machdep: Remove stale functions from ppc_md
 structure
Message-Id: <163584790792.1845480.7374008304551839348.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:11:47 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 31 Aug 2021 08:30:24 +0000 (UTC), Christophe Leroy wrote:
> ppc_md.iommu_save() is not set anymore by any platform after
> commit c40785ad305b ("powerpc/dart: Use a cachable DART").
> So iommu_save() has become a nop and can be removed.
> 
> ppc_md.show_percpuinfo() is not set anymore by any platform after
> commit 4350147a816b ("[PATCH] ppc64: SMU based macs cpufreq support").
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/machdep: Remove stale functions from ppc_md structure
      https://git.kernel.org/powerpc/c/8f7fadb4ba87f6639d817a9b2d99112e9507dc63

cheers
