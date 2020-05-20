Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8471DB109
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 13:08:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RqkM3R07zDqVL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 21:08:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RqXD102FzDqdg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 20:59:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49RqXC6n3qz9sTc; Wed, 20 May 2020 20:59:55 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Jens Axboe <axboe@kernel.dk>,
 Geoff Levand <geoff@infradead.org>, "David S. Miller" <davem@davemloft.net>
In-Reply-To: <cover.1589049250.git.geoff@infradead.org>
References: <cover.1589049250.git.geoff@infradead.org>
Subject: Re: [PATCH v2 0/9] powerpc + ps3 patches
Message-Id: <158997214728.943180.17071530602510223176.b4-ty@ellerman.id.au>
Date: Wed, 20 May 2020 20:59:55 +1000 (AEST)
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org,
 Markus Elfring <elfring@users.sourceforge.net>,
 Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 09 May 2020 18:58:31 +0000, Geoff Levand wrote:
> This is a combined V2 of the two patch sets I sent out on March 27th,
> 'PS3 patches for v5.7' and 'powerpc: Minor updates to improve build debugging'.
> 
> I've dropped these two patches that were in my 'PS3 patches for v5.7' set:
> 
>       powerpc/ps3: Add lv1_panic
>       powerpc/ps3: Add udbg_panic
> 
> [...]

Patches 1-6 and 8 applied to powerpc/next.

[1/9] powerpc/head_check: Automatic verbosity
      https://git.kernel.org/powerpc/c/4c592a34391ea4987d29c1718f931b50416ca015
[2/9] powerpc/wrapper: Output linker map file
      https://git.kernel.org/powerpc/c/f61200d3e3386e78d49677dfb3911c9d7c0dfe4b
[3/9] powerpc/head_check: Avoid broken pipe
      https://git.kernel.org/powerpc/c/331aa46aaf51325d8532a4948f5127b2edc441a5
[4/9] drivers/ps3: Remove duplicate error messages
      https://git.kernel.org/powerpc/c/6a8aa782cece2330322c33452a767f53f8ba38c9
[5/9] net/ps3_gelic_net: Remove duplicate error message
      https://git.kernel.org/powerpc/c/7b27b95a894d6a85c076f8d1f00e35316739bf51
[6/9] ps3disk: use the default segment boundary
      https://git.kernel.org/powerpc/c/720bc316690bd27dea9d71510b50f0cd698ffc32
[8/9] powerpc/ps3: Fix kexec shutdown hang
      https://git.kernel.org/powerpc/c/126554465d93b10662742128918a5fc338cda4aa

cheers
