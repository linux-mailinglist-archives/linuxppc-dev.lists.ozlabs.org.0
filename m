Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 582602162DD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 02:11:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B12sJ24CyzDqfX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 10:11:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B12qV3sj7zDqXb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 10:09:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=qO/OMYnK; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B12qT2dbbz9s1x;
 Tue,  7 Jul 2020 10:09:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1594080566; bh=vfriFgCEX80IKc2W7gQxZwAofw9bTCTuRySBYJfviU4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=qO/OMYnKuE38IEhe1s+zk43bHqptD1dX1GHLx14XQi8vWYubVanp4ogu0lDyWfzGB
 YFLVBGSH/Wn+jZIBFV98PBV3i1RZV16l/EtGbC3VDdO+yr6c95ohALXx60UOxzg2K2
 nBOK13r4VYrJv09TGiOlueddmGXMGRRZDLxR79v1k3o1UNGXdg02r4Z7lho1EHNBue
 zpYM0XfVqYbbU5GMhsbA0nOz0KlpyJQm8hlZzlUi+iBpdUyoFLLP/yHMaOFCPVF2tV
 Rvl6lVnBzFKDod37nKXW9d/HG0nhsgvyXc54FVgVNqIGM9Louh/LUwZBSiILcTVvFw
 b6iSsKNFvwkhQ==
Message-ID: <824bc474550e8ddd2534d56d57e2a929d4116b9e.camel@ozlabs.org>
Subject: Re: [PATCH] powerpc/spufs: add CONFIG_COREDUMP dependency
From: Jeremy Kerr <jk@ozlabs.org>
To: Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 07 Jul 2020 08:09:21 +0800
In-Reply-To: <20200706132302.3885935-1-arnd@arndb.de>
References: <20200706132302.3885935-1-arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

> The kernel test robot pointed out a slightly different error message
> after recent commit 5456ffdee666 ("powerpc/spufs: simplify spufs core
> dumping") to spufs for a configuration that never worked:
> 
>    powerpc64-linux-ld: arch/powerpc/platforms/cell/spufs/file.o: in
> function `.spufs_proxydma_info_dump':
> > > file.c:(.text+0x4c68): undefined reference to `.dump_emit'
>    powerpc64-linux-ld: arch/powerpc/platforms/cell/spufs/file.o: in
> function `.spufs_dma_info_dump':
>    file.c:(.text+0x4d70): undefined reference to `.dump_emit'
>    powerpc64-linux-ld: arch/powerpc/platforms/cell/spufs/file.o: in
> function `.spufs_wbox_info_dump':
>    file.c:(.text+0x4df4): undefined reference to `.dump_emit'
> 
> Add a Kconfig dependency to prevent this from happening again.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me, thanks.

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy

