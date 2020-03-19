Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 542B718C3E2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 00:43:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48k3PK3d3rzDrQS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 10:43:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48k3Cm67QkzDr69
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 10:34:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=OR2YdyN3; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48k3Cm5glTz9sSN; Fri, 20 Mar 2020 10:34:44 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 48k3Cm4pkTz9sSK; Fri, 20 Mar 2020 10:34:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1584660884; bh=8/nwuYSUP1Qm/RPYgjFE8kvBJjM7phd9M7wZLcqKx/4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OR2YdyN3kPXkjJCutfQ6yInoGe/69l6616eQ3CoTSqkVjJRsvEV0gDG5HUIbQSSJ9
 JdiuSDjOcuhC8SWDJZ+5CelrVpH4A8guUabTUw5wHAozZyq+ZuHH6m1EJ8p+sfrB3h
 IkI2x1Z4iVQHbR3Xerv5lbHbSv/u4eh/yfIFh9iXJLHC5esji+ULI1ITdERwy2jAGJ
 CcL4Wy52sg9ED5/C8Ka/VxNo2h9eyMRKhekcLuY9qQBaucLALPwc94mp72TWYWbni4
 i6dpoCVUPVhJg3SbnDIAURTfJiijrXWL41Tr535gb/hJTQHyxK8yKFTnBYy2Xok6Uc
 LFtu0VsLIPHQw==
Date: Fri, 20 Mar 2020 10:31:19 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Use RADIX_PTE_INDEX_SIZE in Radix
 MMU code
Message-ID: <20200319233118.GB3260@blackberry>
References: <20200218043650.24410-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200218043650.24410-1-mpe@ellerman.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linuxppc-dev@ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 18, 2020 at 03:36:50PM +1100, Michael Ellerman wrote:
> In kvmppc_unmap_free_pte() in book3s_64_mmu_radix.c, we use the
> non-constant value PTE_INDEX_SIZE to clear a PTE page.
> 
> We can instead use the constant RADIX_PTE_INDEX_SIZE, because we know
> this code will only be running when the Radix MMU is active.
> 
> Note that we already use RADIX_PTE_INDEX_SIZE for the allocation of
> kvm_pte_cache.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Thanks, applied to my kvm-ppc-next branch.

Paul.
