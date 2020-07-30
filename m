Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A5D233278
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 14:57:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHVn43J0vzDqkW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 22:57:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHVcm5SGVzDqwh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 22:50:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BHVcm3djVz9sSd; Thu, 30 Jul 2020 22:50:16 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20200727085908.420806-1-aneesh.kumar@linux.ibm.com>
References: <20200727085908.420806-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/book3s64/radix: Add kernel command line option
 to disable radix GTSE
Message-Id: <159611327963.1601380.4493513263223319326.b4-ty@ellerman.id.au>
Date: Thu, 30 Jul 2020 22:50:16 +1000 (AEST)
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
Cc: Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 27 Jul 2020 14:29:08 +0530, Aneesh Kumar K.V wrote:
> This adds a kernel command line option that can be used to disable GTSE support.
> Disabling GTSE implies kernel will make hcalls to invalidate TLB entries.
> 
> This was done so that we can do VM migration between configs that enable/disable
> GTSE support via hypervisor. To migrate a VM from a system that supports
> GTSE to a system that doesn't, we can boot the guest with
> radix_hcall_invalidate=on, thereby forcing the guest to use hcalls for TLB
> invalidates.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/book3s64/radix: Add kernel command line option to disable radix GTSE
      https://git.kernel.org/powerpc/c/bf6b7661f41615c0815fce0a3f27acb5fc005470

cheers
