Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D464262FDF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 16:39:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bml6D3t7wzDqQB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 00:39:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjWL4hZWzDqHR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:27:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BmjWJ5cLFz9sTS; Wed,  9 Sep 2020 23:27:56 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjWJ0yNRz9sVn; Wed,  9 Sep 2020 23:27:55 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200819015704.1976364-1-mpe@ellerman.id.au>
References: <20200819015704.1976364-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: Remove unused generic_secondary_thread_init()
Message-Id: <159965717336.808686.6287536807019959920.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:27:55 +1000 (AEST)
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

On Wed, 19 Aug 2020 11:57:04 +1000, Michael Ellerman wrote:
> The last caller was removed in 2014 in commit fb5a515704d7 ("powerpc:
> Remove platforms/wsp and associated pieces").
> 
> As Jordan noticed even though there are no callers, the code above in
> fsl_secondary_thread_init() falls through into
> generic_secondary_thread_init(). So we can remove the _GLOBAL but not
> the body of the function.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64: Remove unused generic_secondary_thread_init()
      https://git.kernel.org/powerpc/c/529d2bd56ada4b8a4904909042792879868208cd

cheers
