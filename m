Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1866F527706
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 12:34:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1JfN0CNvz3fS9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 20:34:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1JZN6Htpz3cfZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 May 2022 20:31:08 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L1JZN5Dpdz4xXS;
 Sun, 15 May 2022 20:31:08 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <3c88286b55413730d7784133993a46ef4a3607ce.1646767214.git.christophe.leroy@csgroup.eu>
References: <3c88286b55413730d7784133993a46ef4a3607ce.1646767214.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/6] powerpc/64: Move pci_device_from_OF_node() out of
 asm/pci-bridge.h
Message-Id: <165261052726.1047019.3527577954247343677.b4-ty@ellerman.id.au>
Date: Sun, 15 May 2022 20:28:47 +1000
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

On Tue, 8 Mar 2022 20:20:20 +0100, Christophe Leroy wrote:
> Move pci_device_from_OF_node() in pci64.c because it needs definition
> of struct device_node and is not worth inlining.
> 
> ppc32.c already has it in pci32.c.
> 
> That way pci-bridge.h doesn't need linux/of.h (Brought by asm/prom.h
> via asm/pci.h)
> 
> [...]

Applied to powerpc/next.

[1/6] powerpc/64: Move pci_device_from_OF_node() out of asm/pci-bridge.h
      https://git.kernel.org/powerpc/c/0aa297e73bba35bedadbd2d452c62d643dfd4a32
[2/6] powerpc: Don't include asm/prom.h in asm/parport.h
      https://git.kernel.org/powerpc/c/07071346bb76f4fbc2c1ca8894ec3d3ad2f22577
[3/6] powerpc: Include asm/reg.h in asm/svm.h
      https://git.kernel.org/powerpc/c/eb4713c40a619046af99586743d48b9b4435d371
[4/6] powerpc: Add missing declaration in asm/drmem.h
      https://git.kernel.org/powerpc/c/669df99c957561dddf580ec269fb4255c41dabc1
[5/6] powerpc: Remove asm/prom.h from all files that don't need it
      https://git.kernel.org/powerpc/c/86c38fec69a461846d84f250f281e8cfbe54b25a
[6/6] powerpc: Add missing headers
      https://git.kernel.org/powerpc/c/e6f6390ab7b9d649c13de2c8a591bce61a10ec3b

cheers
