Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 719EA4545A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 12:27:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvLHf2sN1z3ckG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 22:27:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvLFw1T17z2ywW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 22:25:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HvLFv1hzMz4xdV;
 Wed, 17 Nov 2021 22:25:39 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <99ef38d61c0eb3f79c68942deb0c35995a93a777.1636966353.git.christophe.leroy@csgroup.eu>
References: <99ef38d61c0eb3f79c68942deb0c35995a93a777.1636966353.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/signal32: Fix sigset_t copy
Message-Id: <163714821584.1508509.9112860111598863862.b4-ty@ellerman.id.au>
Date: Wed, 17 Nov 2021 22:23:35 +1100
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
Cc: Finn Thain <fthain@linux-m68k.org>, Stan Johnson <userm57@yahoo.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 "Christopher M . Riedl" <cmr@bluescreens.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 15 Nov 2021 09:52:55 +0100, Christophe Leroy wrote:
> The conversion from __copy_from_user() to __get_user() by
> commit d3ccc9781560 ("powerpc/signal: Use __get_user() to copy
> sigset_t") introduced a regression in __get_user_sigset() for
> powerpc/32. The bug was subsequently moved into
> unsafe_get_user_sigset().
> 
> The bug is due to the copied 64 bit value being truncated to
> 32 bits while being assigned to dst->sig[0]
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/signal32: Fix sigset_t copy
      https://git.kernel.org/powerpc/c/5499802b2284331788a440585869590f1bd63f7f

cheers
