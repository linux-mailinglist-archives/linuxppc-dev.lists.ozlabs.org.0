Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0398E4B62CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 06:31:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyV833h7Pz3cjS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 16:31:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyV682LVZz3cP5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 16:30:08 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JyV681Pdrz4xmx;
 Tue, 15 Feb 2022 16:30:08 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <cc89d3c11fc9c742d0df3454a657a3a00be24046.1643538554.git.christophe.leroy@csgroup.eu>
References: <cc89d3c11fc9c742d0df3454a657a3a00be24046.1643538554.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32s: Make pte_update() non atomic on 603 core
Message-Id: <164490280591.270256.978317263917716851.b4-ty@ellerman.id.au>
Date: Tue, 15 Feb 2022 16:26:45 +1100
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

On Sun, 30 Jan 2022 10:29:34 +0000, Christophe Leroy wrote:
> On 603 core, TLB miss handler don't do any change to the
> page tables so pte_update() doesn't need to be atomic.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/32s: Make pte_update() non atomic on 603 core
      https://git.kernel.org/powerpc/c/4291d085b0b07a78403e845c187428b038c901cd

cheers
