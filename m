Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 592E54D6E25
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 11:31:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFzcL23J1z30Fs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 21:31:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFzbb2WBsz2yxV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 21:30:51 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KFzbZ3swXz4xPt;
 Sat, 12 Mar 2022 21:30:50 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <adc9c9d6378f6b5008246ca717993d7870188efb.1644569473.git.christophe.leroy@csgroup.eu>
References: <adc9c9d6378f6b5008246ca717993d7870188efb.1644569473.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/bitops: Force inlining of fls()
Message-Id: <164708098783.827774.9289683232577719958.b4-ty@ellerman.id.au>
Date: Sat, 12 Mar 2022 21:29:47 +1100
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

On Fri, 11 Feb 2022 09:51:32 +0100, Christophe Leroy wrote:
> Building a kernel with CONFIG_CC_OPTIMISE_FOR_SIZE leads to
> the following functions being copied several times in vmlinux:
> 
> 	31 times __ilog2_u32()
> 	34 times fls()
> 
> Disassembly follows:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/bitops: Force inlining of fls()
      https://git.kernel.org/powerpc/c/0b0057cc4193c7cd9c0829a440e4901b29ce4ff8

cheers
