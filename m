Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B5D1F7F44
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 00:52:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49kGFw5zLjzDqyS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 08:52:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49kGBv2m6BzDqy1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jun 2020 08:49:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49kGBv0g0xz9sS8; Sat, 13 Jun 2020 08:49:58 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200611030559.75257-1-aik@ozlabs.ru>
References: <20200611030559.75257-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel] KVM: PPC: Fix nested guest RC bits update
Message-Id: <159200220505.2257208.15959649065101000471.b4-ty@ellerman.id.au>
Date: Sat, 13 Jun 2020 08:49:58 +1000 (AEST)
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 11 Jun 2020 13:05:59 +1000, Alexey Kardashevskiy wrote:
> Before commit 6cdf30375f82 ("powerpc/kvm/book3s: Use kvm helpers
> to walk shadow or secondary table") we called __find_linux_pte() with
> a page table pointer from a kvm_nested_guest struct but
> now we rely on kvmhv_find_nested() which takes an L1 LPID and returns
> a kvm_nested_guest pointer, however we pass a L0 LPID there and
> the L2 guest hangs.
> 
> [...]

Applied to powerpc/fixes.

[1/1] KVM: PPC: Fix nested guest RC bits update
      https://git.kernel.org/powerpc/c/e881bfaf5a5f409390973e076333281465f2b0d9

cheers
