Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D086C4A72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 13:27:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhSRT61gsz3fCp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 23:27:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhSR045gNz3cCn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 23:27:24 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PhSR02bcJz4xDq;
	Wed, 22 Mar 2023 23:27:24 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Pali Rohár <pali@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <6cb9865d916231c38401ba34ad1a98c249fae135.1676711562.git.christophe.leroy@csgroup.eu>
References: <6cb9865d916231c38401ba34ad1a98c249fae135.1676711562.git.christophe.leroy@csgroup.eu>
Subject: Re: (subset) [PATCH v2 01/10] powerpc/machdep: Make machine name const
Message-Id: <167948793443.559204.11323646799927591600.b4-ty@ellerman.id.au>
Date: Wed, 22 Mar 2023 23:25:34 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 18 Feb 2023 10:15:44 +0100, Christophe Leroy wrote:
> Machine name in struct machdep_calls should never be modified.
> 
> Mark it const.
> 
> 

Patches 1-7 applied to powerpc/next.

[01/10] powerpc/machdep: Make machine name const
        https://git.kernel.org/powerpc/c/0aafbdf35c75cbfec82636d01e6dc7950bc1507c
[02/10] powerpc/machdep: Define 'compatible' property in ppc_md and use it
        https://git.kernel.org/powerpc/c/2fc39acfcacf3dc1392d8062f6d7b7d94eb2537c
[03/10] powerpc/platforms: Use 'compatible' property for simple cases
        https://git.kernel.org/powerpc/c/1c96fcdef8c7492ecf34ed70102a1ae5253ef9d1
[04/10] powerpc/47x: Split ppc47x machine in two
        https://git.kernel.org/powerpc/c/357f82395cd8a0279067805841e5968f4e6dc932
[05/10] powerpc/gamecube|wii : Use machine_device_initcall()
        https://git.kernel.org/powerpc/c/f47b17d51997cd47e0e6fb1b90145d516ebe6b3e
[06/10] powerpc/85xx: Fix function naming for p1023_rdb platform
        https://git.kernel.org/powerpc/c/5a81c02d0cc5067170e49452d55a4dfd21333257
[07/10] powerpc: Make generic_calibrate_decr() the default
        https://git.kernel.org/powerpc/c/0aafbdf35c75cbfec82636d01e6dc7950bc1507c

cheers
