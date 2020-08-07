Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD7923E56B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 03:13:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BN6mZ5qz6zDqwJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 11:13:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BN6kl2PtJzDqtS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 11:11:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=DoPP0Gly; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BN6kk5tDLz9sPB;
 Fri,  7 Aug 2020 11:11:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596762686;
 bh=u5zf4/bro4rM+kmKuG0gCl3w7S6mFaF1AR/q99n5TD0=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=DoPP0GlylvFL+XPMjoZDgsgwgOmtwyR+d1pk6p30FAdoI1F7BOtppCbOvf/p8opGj
 8GNZeRUV0x/ltHwssZ39e2t4dRHBzcgZBh3kPo3uMSneS+SDiGx1RYkNFZxqJR2EFc
 fzDURYa/IfrsdZTVs18/NCUjZKRr/lg+3I/Z0foSuvZRuxcyQTB3guAbFKm54+mZZR
 yxsCF6atd9nfAOOE8xlyWfL3GbMfMlwEeIMgZwHPEIfvCswjSCztnvw7lAFWesOBze
 dPFyUTHnqL2jQ6tK0esxXK1poIjzJ2NyDhDB7oLWdEg7nVdK+kY98aL8CvD+Au6M0T
 JO8/YXKPZm42Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/book3s64/radix: Make radix_mem_block_size 64bit
In-Reply-To: <878sesq6yl.fsf@linux.ibm.com>
References: <20200806081415.208546-1-aneesh.kumar@linux.ibm.com>
 <874kpgymty.fsf@mpe.ellerman.id.au> <878sesq6yl.fsf@linux.ibm.com>
Date: Fri, 07 Aug 2020 11:11:24 +1000
Message-ID: <87sgczxnsz.fsf@mpe.ellerman.id.au>
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

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>
>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>>> Similar to commit: 89c140bbaeee ("pseries: Fix 64 bit logical memory block panic")
>>> make sure we update different variables tracking lmb_size are updated
>>> to be 64 bit.
>>
>> That commit went to all stable releases, should this one also?
>>
>
> radix_mem_block_size got added recently and it is not yet upstram. But
> the drmem_lmb_info change can be a stable candidate. We also need this
>
> I will split this as two patches?

Yes, sounds good.

cheers

> modified   arch/powerpc/include/asm/drmem.h
> @@ -67,7 +67,7 @@ struct of_drconf_cell_v2 {
>  #define DRCONF_MEM_RESERVED	0x00000080
>  #define DRCONF_MEM_HOTREMOVABLE	0x00000100
>  
> -static inline u32 drmem_lmb_size(void)
> +static inline u64 drmem_lmb_size(void)
>  {
>  	return drmem_info->lmb_size;
>  }
>
> -aneesh
