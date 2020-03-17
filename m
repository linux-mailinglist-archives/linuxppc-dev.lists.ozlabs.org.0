Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C44101885F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 14:36:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hZ2n75F7zDqZp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 00:36:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hYYL3XgwzDqfB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 00:14:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48hYYH662sz9sSM; Wed, 18 Mar 2020 00:14:43 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: ffd3eaf178b0f616a071e510e289d937330b0b35
In-Reply-To: <20200224211848.26087-1-joe.lawrence@redhat.com>
To: Joe Lawrence <joe.lawrence@redhat.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/vdso: remove deprecated VDS64_HAS_DESCRIPTORS
 references
Message-Id: <48hYYH662sz9sSM@ozlabs.org>
Date: Wed, 18 Mar 2020 00:14:43 +1100 (AEDT)
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

On Mon, 2020-02-24 at 21:18:48 UTC, Joe Lawrence wrote:
> The original 2005 patch that introduced the powerpc vdso, pre-git
> ("ppc64: Implement a vDSO and use it for signal trampoline") notes that:
> 
>   ... symbols exposed by the vDSO aren't "normal" function symbols, apps
>   can't be expected to link against them directly, the vDSO's are both
>   seen as if they were linked at 0 and the symbols just contain offsets
>   to the various functions.  This is done on purpose to avoid a
>   relocation step (ppc64 functions normally have descriptors with abs
>   addresses in them).  When glibc uses those functions, it's expected to
>   use it's own trampolines that know how to reach them.
> 
> Despite that explanation, there remains dead #ifdef
> VDS64_HAS_DESCRIPTORS code-blocks that provide alternate function
> definitions that setup function descriptors.
> 
> Since VDS64_HAS_DESCRIPTORS has been unused for all these years, we
> might as well finally remove it from the codebase.
> 
> Link: https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-February/204430.=
> html
> Link: https://lore.kernel.org/lkml/1108002773.7733.196.camel@gaston/
> Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/ffd3eaf178b0f616a071e510e289d937330b0b35

cheers
