Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2373A4670F7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 04:55:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4zWQ6tFzz3c59
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 14:55:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ImBzqzy3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4zVp22Mpz2yQK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Dec 2021 14:55:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ImBzqzy3; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J4zVm6JgMz4xQs;
 Fri,  3 Dec 2021 14:55:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1638503713;
 bh=CBcjaqWL5ywYRsLFA1bPdUjs/lKp7sGGKXcCqCVDPpA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ImBzqzy3hk58qj4+MzIK46abtIMGdkXPlKdMKe+c40R+FVcOYZg47nvV28/C7kvMH
 gNNpypJKL1sjYH2+g3vp+qE9/CKJE5T+68Zb3tTGNtPuCITgrHLv22VJis5ANEKfw9
 M23c94ciHb/s0gNLQJzR+wywGldXLYAuaxAHYOBPwQ1ULMRKsBZj5ibQ8zVQiIBJFB
 jCeq01a/NgDzfWoxfRpcy63VjCgY8gBGkFGVz7/1+gcF6MN5VFZMq1RrUYw/iswqy6
 0rusDl2tbQ+G+D+tHEJ5LgPQO3psy0x/vtJ/ePVDYnCBtZTWLZwrudL/3xb1es0/4m
 +P+Y3gR/xGDOw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/32s: Allocate one 256k IBAT instead of two
 consecutives 128k IBATs
In-Reply-To: <ab58b296832b0ec650e2203200e060adbcb2677d.1637930421.git.christophe.leroy@csgroup.eu>
References: <ab58b296832b0ec650e2203200e060adbcb2677d.1637930421.git.christophe.leroy@csgroup.eu>
Date: Fri, 03 Dec 2021 14:55:09 +1100
Message-ID: <871r2upcki.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Today we have the following IBATs allocated:
>
> 	---[ Instruction Block Address Translation ]---
> 	0: 0xc0000000-0xc03fffff 0x00000000         4M Kernel   x     m
> 	1: 0xc0400000-0xc05fffff 0x00400000         2M Kernel   x     m
> 	2: 0xc0600000-0xc06fffff 0x00600000         1M Kernel   x     m
> 	3: 0xc0700000-0xc077ffff 0x00700000       512K Kernel   x     m
> 	4: 0xc0780000-0xc079ffff 0x00780000       128K Kernel   x     m
> 	5: 0xc07a0000-0xc07bffff 0x007a0000       128K Kernel   x     m
> 	6:         -
> 	7:         -
>
> The two 128K should be a single 256K instead.
>
> When _etext is not aligned to 128Kbytes, the system will allocate
> all necessary BATs to the lower 128Kbytes boundary, then allocate
> an additional 128Kbytes BAT for the remaining block.
>
> Instead, align the top to 128Kbytes so that the function directly
> allocates a 256Mbytes last block:
                 ^

I think that's meant to be 256Kbytes, I changed it when committing.

> 	---[ Instruction Block Address Translation ]---
> 	0: 0xc0000000-0xc03fffff 0x00000000         4M Kernel   x     m
> 	1: 0xc0400000-0xc05fffff 0x00400000         2M Kernel   x     m
> 	2: 0xc0600000-0xc06fffff 0x00600000         1M Kernel   x     m
> 	3: 0xc0700000-0xc077ffff 0x00700000       512K Kernel   x     m
> 	4: 0xc0780000-0xc07bffff 0x00780000       256K Kernel   x     m
> 	5:         -
> 	6:         -
> 	7:         -
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>


cheers
