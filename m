Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4024835AE5C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 16:32:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHcrz1Hlkz3c7J
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 00:32:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHcp76Ln1z301x
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 00:29:35 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FHcp664vVz9sWH; Sun, 11 Apr 2021 00:29:34 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210208032957.1232102-1-jniethe5@gmail.com>
References: <20210208032957.1232102-1-jniethe5@gmail.com>
Subject: Re: [PATCH v3 1/2] powerpc/64s: Fix pte update for kernel memory on
 radix
Message-Id: <161806492436.1467223.15525755051298950000.b4-ty@ellerman.id.au>
Date: Sun, 11 Apr 2021 00:28:44 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: naveen.n.rao@linux.vnet.ibm.com, npiggin@gmail.com, cmr@codefail.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 8 Feb 2021 14:29:56 +1100, Jordan Niethe wrote:
> When adding a pte a ptesync is needed to order the update of the pte
> with subsequent accesses otherwise a spurious fault may be raised.
> 
> radix__set_pte_at() does not do this for performance gains. For
> non-kernel memory this is not an issue as any faults of this kind are
> corrected by the page fault handler.  For kernel memory these faults are
> not handled.  The current solution is that there is a ptesync in
> flush_cache_vmap() which should be called when mapping from the vmalloc
> region.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/64s: Fix pte update for kernel memory on radix
      https://git.kernel.org/powerpc/c/b8b2f37cf632434456182e9002d63cbc4cccc50c
[2/2] selftests/powerpc: Test for spurious kernel memory faults on radix
      https://git.kernel.org/powerpc/c/29e3ea8cbd2958cf237b84652ec236803f2c6202

cheers
