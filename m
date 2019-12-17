Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DADD122737
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 10:00:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cXDM6nnBzDqdc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 20:00:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="dmixie/n"; dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cXBL2dLVzDqZL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 19:59:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=umUpQwNCFcx4pJ445vi4RUlvQ3RCBfh2CumoCKRy+mk=; b=dmixie/nerThIK4dsyBBVW4EI
 eYS7fSANuZVJl7nMZkU+KmMDZgIrp7uFvjbNKnCto4kwOuUvebXu7miWQjkatuoUKChmlGdg7LNB+
 5I8HS7wI1IVkTYfF26Q96j89zUo+N4dddai0r7GnJtXnnH1gBHPdt0sMxmFsNZ8AaBuA2aeVUI0LA
 KzRV5OW6rp0WgrpGx0PQbZqH+VtItNULFEfyhl8Ku9WQF5UKRC4pqJCBpgrOJCHjusjwr5JXNCI8J
 KWSYIhRRu8LAF7Pqo6BE0WwAuk6Bl/omWYsAOQFfvGYB1Fssr992VAjtBT4h5bfpsEarqEVPtiYkM
 W0v6zSaTw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ih8gz-0001jU-7R; Tue, 17 Dec 2019 08:58:57 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CE79E3007F2;
 Tue, 17 Dec 2019 09:57:32 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id F36782B3D7E90; Tue, 17 Dec 2019 09:58:54 +0100 (CET)
Date: Tue, 17 Dec 2019 09:58:54 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 2/2] mm/mmu_gather: Avoid multiple page walk cache
 flush
Message-ID: <20191217085854.GW2844@hirez.programming.kicks-ass.net>
References: <20191217071713.93399-1-aneesh.kumar@linux.ibm.com>
 <20191217071713.93399-2-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191217071713.93399-2-aneesh.kumar@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com, linux-mm@kvack.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 17, 2019 at 12:47:13PM +0530, Aneesh Kumar K.V wrote:
> On tlb_finish_mmu() kernel does a tlb flush before  mmu gather table invalidate.
> The mmu gather table invalidate depending on kernel config also does another
> TLBI. Avoid the later on tlb_finish_mmu().

That is already avoided, if you look at tlb_flush_mmu_tlbonly() it does
__tlb_range_reset(), which results in ->end = 0, which then triggers the
early exit on the next invocation:

	if (!tlb->end)
		return;
