Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F280046BCA4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 14:31:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7h5f6pHVz3cWL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 00:31:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7h2Q0H3Kz3bXJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 00:28:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J7h2P6bVJz4xh1;
 Wed,  8 Dec 2021 00:28:29 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <e6f815d9181bab09df3b350af51149437863e9f9.1632236981.git.christophe.leroy@csgroup.eu>
References: <e6f815d9181bab09df3b350af51149437863e9f9.1632236981.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v5 1/3] powerpc/bitops: Use immediate operand when possible
Message-Id: <163888362384.3690807.10443788415015128934.b4-ty@ellerman.id.au>
Date: Wed, 08 Dec 2021 00:27:03 +1100
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

On Tue, 21 Sep 2021 17:09:47 +0200, Christophe Leroy wrote:
> Today we get the following code generation for bitops like
> set or clear bit:
> 
> 	c0009fe0:	39 40 08 00 	li      r10,2048
> 	c0009fe4:	7c e0 40 28 	lwarx   r7,0,r8
> 	c0009fe8:	7c e7 53 78 	or      r7,r7,r10
> 	c0009fec:	7c e0 41 2d 	stwcx.  r7,0,r8
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/bitops: Use immediate operand when possible
      https://git.kernel.org/powerpc/c/fb350784d8d17952afa93383bb47aaa6b715c459
[2/3] powerpc/atomics: Use immediate operand when possible
      https://git.kernel.org/powerpc/c/41d65207de9fbff58acd8937a7c3f8940c186a87
[3/3] powerpc/atomics: Remove atomic_inc()/atomic_dec() and friends
      https://git.kernel.org/powerpc/c/f05cab0034babaa9b3dfaf6003ee6493496a8180

cheers
