Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1C24CA52A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 13:47:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7v6B6qXRz3bmP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 23:47:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7v4z2h0Kz3bcm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 23:46:43 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K7v4w64Ldz4xv3;
 Wed,  2 Mar 2022 23:46:40 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <d8b33342d7454f6ca4f368f5206896558dfa06f4.1645538722.git.christophe.leroy@csgroup.eu>
References: <d8b33342d7454f6ca4f368f5206896558dfa06f4.1645538722.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Remove remaining stab codes
Message-Id: <164622488336.2052779.8567395814244091287.b4-ty@ellerman.id.au>
Date: Wed, 02 Mar 2022 23:41:23 +1100
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

On Tue, 22 Feb 2022 15:05:30 +0100, Christophe Leroy wrote:
> Following commit 12318163737c ("powerpc/32: Remove remaining .stabs
> annotations"), stabs code are not used anymore.
> 
> Remove them.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: Remove remaining stab codes
      https://git.kernel.org/powerpc/c/406a8c1d8fa59ae6a6462a6fb6ff892f6a4f7499

cheers
