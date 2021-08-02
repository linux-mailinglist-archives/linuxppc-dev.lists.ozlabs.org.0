Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCBE3DD48F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 13:21:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdbCy2pdFz30HW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 21:21:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OyD8Aq4A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=OyD8Aq4A; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdbCV5F8kz2ymb
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Aug 2021 21:20:37 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GdbCN2p71z9s1l;
 Mon,  2 Aug 2021 21:20:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1627903233;
 bh=Ph52ycwEVB+Kr83e5k5zzEwv6lbCoXALW4ekLWI3mvY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=OyD8Aq4AaqIcoMdaKfnwOqsE8epJkeGEPf9zJ0mxrHVywJVEKvSUZj+8YoIcH1VE0
 honyNi+z9ReapyZ4mk0fGsa4f3+TDmmba0/ty3GP7pNlm6LYVIBMCjhfutrxOxHu8U
 sXMxTIGfAExBHy4IhWp21JGrCbgJ+3wenHoU1iroNBQ5voTWW6vLvDn8IZF88BqEG1
 /H9zBHykLP4zxKizoJFitgHSqjAZTrCPkT/GNtGZIKgGPYlDfFDLg73RL/C+wl4gcp
 xLa/w0jrpy0Nr/i4gK3JpxGP4X4LK3JHpDAQ4j1a8uYsQjEqJM8BSwqNCeKElZLAQp
 CCvt/6/jf5VKA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH] powerpc/svm: Don't issue ultracalls if
 !mem_encrypt_active()
In-Reply-To: <20210730114231.23445-1-will@kernel.org>
References: <20210730114231.23445-1-will@kernel.org>
Date: Mon, 02 Aug 2021 21:20:30 +1000
Message-ID: <871r7cks8x.fsf@mpe.ellerman.id.au>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Will Deacon <will@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, iommu@lists.linux-foundation.org,
 Claire Chang <tientzu@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Will Deacon <will@kernel.org> writes:
> Commit ad6c00283163 ("swiotlb: Free tbl memory in swiotlb_exit()")
> introduced a set_memory_encrypted() call to swiotlb_exit() so that the
> buffer pages are returned to an encrypted state prior to being freed.
>
> Sachin reports that this leads to the following crash on a Power server:
>
> [    0.010799] software IO TLB: tearing down default memory pool
> [    0.010805] ------------[ cut here ]------------
> [    0.010808] kernel BUG at arch/powerpc/kernel/interrupt.c:98!
>
> Nick spotted that this is because set_memory_encrypted() is issuing an
> ultracall which doesn't exist for the processor, and should therefore
> be gated by mem_encrypt_active() to mirror the x86 implementation.
>
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Cc: Claire Chang <tientzu@chromium.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Fixes: ad6c00283163 ("swiotlb: Free tbl memory in swiotlb_exit()")
> Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Link: https://lore.kernel.org/r/1905CD70-7656-42AE-99E2-A31FC3812EAC@linux.vnet.ibm.com/
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/powerpc/platforms/pseries/svm.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Thanks.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>


I assume Konrad will take this via the swiotlb tree?

cheers
