Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9FE488E73
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 02:56:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXH4K26pLz3cQS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 12:56:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXGyW6Q82z2yP9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 12:51:31 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JXGyW3mS5z4xtf;
 Mon, 10 Jan 2022 12:51:31 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <9e24eedeab44cbb840598bb188561a48811de845.1641119338.git.christophe.jaillet@wanadoo.fr>
References: <9e24eedeab44cbb840598bb188561a48811de845.1641119338.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] floppy: Remove usage of the deprecated "pci-dma-compat.h"
 API
Message-Id: <164177945707.1604045.13531607758042426524.b4-ty@ellerman.id.au>
Date: Mon, 10 Jan 2022 12:50:57 +1100
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 2 Jan 2022 11:29:54 +0100, Christophe JAILLET wrote:
> In [1], Christoph Hellwig has proposed to remove the wrappers in
> include/linux/pci-dma-compat.h.
> 
> Some reasons why this API should be removed have been given by Julia
> Lawall in [2].
> 
> A coccinelle script has been used to perform the needed transformation
> Only relevant parts are given below.
> 
> [...]

Applied to powerpc/next.

[1/1] floppy: Remove usage of the deprecated "pci-dma-compat.h" API
      https://git.kernel.org/powerpc/c/e57c2fd6cdf8db581ac93b909b2664751e7cf30c

cheers
