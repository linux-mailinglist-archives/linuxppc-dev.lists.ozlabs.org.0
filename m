Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09422123E52
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 05:16:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d1sm21ZzzDqW9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 15:16:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d1cl6dt2zDqSM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 15:05:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47d1cl32N3z9sSF; Wed, 18 Dec 2019 15:05:11 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: e352f576d345e5bf1fb62c8559851448a6c1d9cd
In-Reply-To: <20191216103058.4958-1-david@redhat.com>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/pseries/cmm: fix managed page counts when
 migrating pages between zones
Message-Id: <47d1cl32N3z9sSF@ozlabs.org>
Date: Wed, 18 Dec 2019 15:05:11 +1100 (AEDT)
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
Cc: Richard Fontana <rfontana@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 Arun KS <arunks@codeaurora.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-12-16 at 10:30:58 UTC, David Hildenbrand wrote:
> Commit 63341ab03706 (virtio-balloon: fix managed page counts when migrati=
> ng
> pages between zones) fixed a long existing BUG in the virtio-balloon
> driver when pages would get migrated between zones.  I did not try to
> reproduce on powerpc, but looking at the code, the same should apply to
> powerpc/cmm ever since it started using the balloon compaction
> infrastructure (luckily just recently).
> 
> In case we have to migrate a ballon page to a newpage of another zone, th=
> e
> managed page count of both zones is wrong. Paired with memory offlining
> (which will adjust the managed page count), we can trigger kernel crashes
> and all kinds of different symptoms.
> 
> Fix it by properly adjusting the managed page count when migrating if
> the zone changed.
> 
> We'll temporarily modify the totalram page count. If this ever becomes a
> problem, we can fine tune by providing helpers that don't touch
> the totalram pages (e.g., adjust_zone_managed_page_count()).
> 
> Fixes: fe030c9b85e6 ("powerpc/pseries/cmm: Implement balloon compaction")
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Richard Fontana <rfontana@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Arun KS <arunks@codeaurora.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: David Hildenbrand <david@redhat.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/e352f576d345e5bf1fb62c8559851448a6c1d9cd

cheers
