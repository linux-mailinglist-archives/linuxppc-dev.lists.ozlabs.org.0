Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3217A22362
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 13:20:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455jQD41TzzDqTp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 21:20:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455jHZ15GmzDqKt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2019 21:15:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 455jHY5Y1zz9sBp; Sat, 18 May 2019 21:15:05 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c179976cf4cbd2e65f29741d5bc07ccf8747a532
X-Patchwork-Hint: ignore
In-Reply-To: <20190516115054.15220-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 paulus@samba.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/mm/hash: Improve address limit checks
Message-Id: <455jHY5Y1zz9sBp@ozlabs.org>
Date: Sat, 18 May 2019 21:15:05 +1000 (AEST)
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-05-16 at 11:50:54 UTC, "Aneesh Kumar K.V" wrote:
> Different parts of the code do the limit check by ignoring the top nibble
> of EA. ie. we do checks like
> 
> 	if ((ea & EA_MASK)  >= H_PGTABLE_RANGE)
> 	   	error
> 
> This patch makes sure we don't insert SLB entries for addresses whose top nibble
> doesn't match the ignored bits.
> 
> With an address like 0x4000000008000000, we can result in wrong slb entries like
> 
> 13 4000000008000000 400ea1b217000510   1T ESID=   400000 VSID=   ea1b217000 LLP:110
> 
> without this patch we will map that EA with LINEAR_MAP_REGION_ID and further
> those addr limit check will return false.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/c179976cf4cbd2e65f29741d5bc07ccf

cheers
