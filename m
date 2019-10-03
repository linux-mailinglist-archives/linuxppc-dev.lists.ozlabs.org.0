Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE3DCB229
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 01:11:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kpfC6cYqzDqbm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 09:11:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kpWs2z4vzDqZX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 09:05:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46kpWs0pdbz9sPq; Fri,  4 Oct 2019 09:05:45 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 9123b7914823a7d81dd0e5d8ae40bc6f1ee869c8
In-Reply-To: <20191001132928.72555-1-ldufour@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>, sfr@linux.ibm.com,
 benh@kernel.crashing.org, paulus@samba.org, aneesh.kumar@linux.ibm.com,
 npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries: Remove confusing warning message.
Message-Id: <46kpWs0pdbz9sPq@ozlabs.org>
Date: Fri,  4 Oct 2019 09:05:45 +1000 (AEST)
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

On Tue, 2019-10-01 at 13:29:28 UTC, Laurent Dufour wrote:
> Since the commit 1211ee61b4a8 ("powerpc/pseries: Read TLB Block Invalidate
> Characteristics"), a warning message is displayed when booting a guest on
> top of KVM:
> 
> lpar: arch/powerpc/platforms/pseries/lpar.c pseries_lpar_read_hblkrm_characteristics Error calling get-system-parameter (0xfffffffd)
> 
> This message is displayed because this hypervisor is not supporting the
> H_BLOCK_REMOVE hcall and thus is not exposing the corresponding feature.
> 
> Reading the TLB Block Invalidate Characteristics should not be done if the
> feature is not exposed.
> 
> Fixes: 1211ee61b4a8 ("powerpc/pseries: Read TLB Block Invalidate Characteristics")
> Reported-by: Stephen Rothwell <sfr@linux.ibm.com>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/9123b7914823a7d81dd0e5d8ae40bc6f1ee869c8

cheers
