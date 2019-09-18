Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F71B6527
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 15:54:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YM074HrNzF1fC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 23:53:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YLkM3ry6zF4Dc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 23:42:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="OwZKzVnP"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46YLkJ3x8Wz9sNf;
 Wed, 18 Sep 2019 23:42:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1568814121;
 bh=PKzP62Nhvc6oxy8JJMN0bYExGBIfXoqSAQasn8gwXuA=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=OwZKzVnPPxA/NqCnMz3jRwzgz5VkboxsZdCsDilcuaqGxXSQzkug+SKu50ElyRH41
 aL4CgFQi2yvWq6iSWNuhCtFEbF20uXeVpqyCr62hregLFjlOSeLU9CzyBYZI1S6CSM
 S+gNF2LSQ4GC9DhFumiyQ2at54xiVQaw5dpGYcpedPgVbfaEvg0iYGVS/TnPSFv48V
 TeQXosEnhhLTJ5cm4835fEpfiVOyBoFA2LWCrFdQpO6gbrIwBOg0hxqeQlRYCFeb4S
 Utg9lzTO7IE0SQb5tT3WHGzQzIsEu0AlN1iUheMhYb4Hv3vkrRhUfQc4kBF8ufIzex
 gDL9gWKr4NGrQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Laurent Dufour <ldufour@linux.ibm.com>, benh@kernel.crashing.org,
 paulus@samba.org, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] powerpc/mm: Conditionally call H_BLOCK_REMOVE
In-Reply-To: <20190916095543.17496-1-ldufour@linux.ibm.com>
References: <20190916095543.17496-1-ldufour@linux.ibm.com>
Date: Wed, 18 Sep 2019 23:41:54 +1000
Message-ID: <871rwdwwkd.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Laurent,

Thanks for fixing this, just a few comments.

Laurent Dufour <ldufour@linux.ibm.com> writes:
> Since the commit ba2dd8a26baa ("powerpc/pseries/mm: call H_BLOCK_REMOVE"),
> the call to H_BLOCK_REMOVE is always done if the feature is exhibited.
>
> However, the hypervisor may not support all the block size for the hcall
> H_BLOCK_REMOVE depending on the segment base page size and actual page
> size.
>
> When unsupported block size is used, the hcall H_BLOCK_REMOVE is returning
> H_PARAM, which is triggering a BUG_ON check leading to a panic like this:

Missing panic :)

Also can you put that detail in the 2nd commit, so that it's obvious
that it is a fix for an oops.

> The PAPR document specifies the TLB Block Invalidate Characteristics which

Can you give a section/page number for the PAPR reference.

> tells for each couple segment base page size, actual page size, the size of
                 ^
                 "pair of" is better than "couple" I think

> the block the hcall H_BLOCK_REMOVE is supporting.
>
> Supporting various block sizes doesn't seem needed at that time since all
> systems I was able to play with was supporting an 8 addresses block size,
> which is the maximum through the hcall, or none at all. Supporting various
> size would complexify the algorithm in call_block_remove() so unless this
> is required, this is not done.
>
> In the case of block size different from 8, a warning message is displayed
> at boot time and that block size will be ignored checking for the
> H_BLOCK_REMOVE support.
>
> Due to the minimal amount of hardware showing a limited set of
> H_BLOCK_REMOVE supported page size, I don't think there is a need to push
> this series to the stable mailing list.

But the hardware that is exhibiting it, by crashing and not booting, is
mostly (all?) older hardware. So I think we probably should send it back
to stable, otherwise those machines may never get an updated kernel.

Can you add Fixes: tags to the commits, they should point at the commit
that added H_BLOCK_REMOVE support.

cheers

> The first patch is reading the characteristic through the hcall
> ibm,get-system-parameter and record the supported block size for each page
> size.  The second patch is changing the check used to detect the
> H_BLOCK_REMOVE availability to take care of the base page size and page
> size couple.
>
> Changes since V1:
>
>  - Remove penc initialisation, this is already done in
>    mmu_psize_set_default_penc()
>  - Add details on the TLB Block Invalidate Characteristics's buffer format
>  - Introduce #define instead of using direct numerical values
>  - Function reading the characteristics is now directly called from
>    pSeries_setup_arch()
>  - The characteristics are now stored in a dedciated table static to lpar.c
>
> Laurent Dufour (2):
>   powperc/mm: read TLB Block Invalidate Characteristics
>   powerpc/mm: call H_BLOCK_REMOVE when supported
>
>  .../include/asm/book3s/64/tlbflush-hash.h     |   1 +
>  arch/powerpc/platforms/pseries/lpar.c         | 173 +++++++++++++++++-
>  arch/powerpc/platforms/pseries/setup.c        |   1 +
>  3 files changed, 173 insertions(+), 2 deletions(-)
>
> -- 
> 2.23.0
