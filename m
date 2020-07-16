Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 458C12223B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 15:18:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6vvT1TkNzDqRm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 23:18:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vPY6GHHzDqCh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:55:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vPV6BmRz9sTX; Thu, 16 Jul 2020 22:55:42 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20200706132302.3885935-1-arnd@arndb.de>
References: <20200706132302.3885935-1-arnd@arndb.de>
Subject: Re: [PATCH] powerpc/spufs: add CONFIG_COREDUMP dependency
Message-Id: <159490400659.3805857.11376912001537489857.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:55:42 +1000 (AEST)
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 6 Jul 2020 15:22:46 +0200, Arnd Bergmann wrote:
> The kernel test robot pointed out a slightly different error message
> after recent commit 5456ffdee666 ("powerpc/spufs: simplify spufs core
> dumping") to spufs for a configuration that never worked:
> 
>    powerpc64-linux-ld: arch/powerpc/platforms/cell/spufs/file.o: in function `.spufs_proxydma_info_dump':
> >> file.c:(.text+0x4c68): undefined reference to `.dump_emit'
>    powerpc64-linux-ld: arch/powerpc/platforms/cell/spufs/file.o: in function `.spufs_dma_info_dump':
>    file.c:(.text+0x4d70): undefined reference to `.dump_emit'
>    powerpc64-linux-ld: arch/powerpc/platforms/cell/spufs/file.o: in function `.spufs_wbox_info_dump':
>    file.c:(.text+0x4df4): undefined reference to `.dump_emit'
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/spufs: add CONFIG_COREDUMP dependency
      https://git.kernel.org/powerpc/c/b648a5132ca3237a0f1ce5d871fff342b0efcf8a

cheers
