Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65404230220
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 07:56:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BG5Wm0J99zDqFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 15:56:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BG5RS0hCJzDqRK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 15:52:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=LnGgL97V; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4BG5RR6QYSz9sRN; Tue, 28 Jul 2020 15:52:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1595915539; bh=hqi9wl0i8BmJzMLB0DK4D3vfsNHrdTqCEVzktLAKVJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LnGgL97VFXhcniyw8eWKUYdvBXzGiE0IxO5/P7nQx6kpB5yljADLkSAChAoD3buC0
 sAvCWM2DL8HEEFULd8jpx9TPRScCHZf2EmmnzUwuzTt0XVkRISnEC+knlv8E1gEdIX
 3w08JRddPWukAyyFvJy3caYhUGbiNTksepXQ8m3VWHfD/YZFoD0u1STjMJKVHiCFXX
 YM9ezRMQScr4R4NV8X+zNPUJo3e6pA1nCxj500Y3aLz3SZSKkLFcD26OS3dyI1DgLq
 s6vS8/f0+jsz8762K53TimpwU8agM9x6xZT++2oi13++uVZ3slZ9EjOI/laemLd8zZ
 FHzh4PJEFkj3w==
Date: Tue, 28 Jul 2020 15:51:42 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH v6 0/5] Migrate non-migrated pages of a SVM.
Message-ID: <20200728055142.GB2460422@thinks.paulus.ozlabs.org>
References: <1595873238-26184-1-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595873238-26184-1-git-send-email-linuxram@us.ibm.com>
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
Cc: ldufour@linux.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 bharata@linux.ibm.com, sathnaga@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 27, 2020 at 11:07:13AM -0700, Ram Pai wrote:
> The time to switch a VM to Secure-VM, increases by the size of the VM.
> A 100GB VM takes about 7minutes. This is unacceptable.  This linear
> increase is caused by a suboptimal behavior by the Ultravisor and the
> Hypervisor.  The Ultravisor unnecessarily migrates all the GFN of the
> VM from normal-memory to secure-memory. It has to just migrate the
> necessary and sufficient GFNs.
> 
> However when the optimization is incorporated in the Ultravisor, the
> Hypervisor starts misbehaving. The Hypervisor has a inbuilt assumption
> that the Ultravisor will explicitly request to migrate, each and every
> GFN of the VM. If only necessary and sufficient GFNs are requested for
> migration, the Hypervisor continues to manage the remaining GFNs as
> normal GFNs. This leads to memory corruption; manifested
> consistently when the SVM reboots.
> 
> The same is true, when a memory slot is hotplugged into a SVM. The
> Hypervisor expects the ultravisor to request migration of all GFNs to
> secure-GFN.  But the hypervisor cannot handle any H_SVM_PAGE_IN
> requests from the Ultravisor, done in the context of
> UV_REGISTER_MEM_SLOT ucall.  This problem manifests as random errors
> in the SVM, when a memory-slot is hotplugged.
> 
> This patch series automatically migrates the non-migrated pages of a
> SVM, and thus solves the problem.
> 
> Testing: Passed rigorous testing using various sized SVMs.

Thanks, series applied to my kvm-ppc-next branch and pull request sent.

Paul.
