Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A95BB46BC99
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 14:30:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7h4n4SLhz3dkf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 00:30:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7h2N1VRvz3054
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 00:28:28 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J7h2N0WRxz4xgy;
 Wed,  8 Dec 2021 00:28:28 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <f16c30f5c9185a63335322cf1a8b22f189d335ef.1637922595.git.christophe.leroy@csgroup.eu>
References: <f16c30f5c9185a63335322cf1a8b22f189d335ef.1637922595.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/ptdump: Fix display a BAT's size unit
Message-Id: <163888364104.3690807.15744779328710272705.b4-ty@ellerman.id.au>
Date: Wed, 08 Dec 2021 00:27:21 +1100
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

On Fri, 26 Nov 2021 11:30:03 +0100, Christophe Leroy wrote:
> We have wrong units on BAT's sizes (G instead of M, M instead of ...)
> 
> 	---[ Instruction Block Address Translation ]---
> 	0: 0xc0000000-0xc03fffff 0x00000000         4G Kernel   x     m
> 	1: 0xc0400000-0xc05fffff 0x00400000         2G Kernel   x     m
> 	2: 0xc0600000-0xc06fffff 0x00600000         1G Kernel   x     m
> 	3: 0xc0700000-0xc077ffff 0x00700000       512M Kernel   x     m
> 	4: 0xc0780000-0xc079ffff 0x00780000       128M Kernel   x     m
> 	5: 0xc07a0000-0xc07bffff 0x007a0000       128M Kernel   x     m
> 	6:         -
> 	7:         -
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/ptdump: Fix display a BAT's size unit
      https://git.kernel.org/powerpc/c/cdc81aece8041fd5437bdabde6c543cdeb2891a8

cheers
