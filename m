Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD4914018E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 02:48:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zP972hC0zDrK2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 12:48:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=YLuQ4iN8; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zP6t4MvyzDr6l
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 12:46:29 +1100 (AEDT)
Received: from X1 (nat-ab2241.sltdut.senawave.net [162.218.216.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 38BFA2075B;
 Fri, 17 Jan 2020 01:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579225587;
 bh=kF0McEzzIna+OlNxDDvv0BFj+tanfJPabCZ9hgpDZTw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YLuQ4iN8bF+tZrRX09LQTvkHEz92ULIHS5nIyWSwrfb4VbMtXxH/Oe5XZvuePIEYo
 sF47+mV/+zMy6nfyYfcd5nDd1MXB36Ni+9+XvwIfqY6iK0mnRcIs4F6WqZkN0XwLIK
 SBIuF6vqcLWRDG/ZIbepRDIL+/bqD5sHlh96ZRAA=
Date: Thu, 16 Jan 2020 17:46:26 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v4 3/9] asm-generic/tlb: Avoid potential double flush
Message-Id: <20200116174626.0244f71bbff64eee6c7faa1d@linux-foundation.org>
In-Reply-To: <c12bb139-9eda-74a9-b4de-b147a88ed1b0@linux.ibm.com>
References: <20200116064531.483522-1-aneesh.kumar@linux.ibm.com>
 <20200116064531.483522-4-aneesh.kumar@linux.ibm.com>
 <c12bb139-9eda-74a9-b4de-b147a88ed1b0@linux.ibm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, peterz@infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, will@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Jan 2020 12:19:59 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> On 1/16/20 12:15 PM, Aneesh Kumar K.V wrote:
> > From: Peter Zijlstra <peterz@infradead.org>
> > 
> > Aneesh reported that:
> > 
> > 	tlb_flush_mmu()
> > 	  tlb_flush_mmu_tlbonly()
> > 	    tlb_flush()			<-- #1
> > 	  tlb_flush_mmu_free()
> > 	    tlb_table_flush()
> > 	      tlb_table_invalidate()
> > 		tlb_flush_mmu_tlbonly()
> > 		  tlb_flush()		<-- #2
> > 
> > does two TLBIs when tlb->fullmm, because __tlb_reset_range() will not
> > clear tlb->end in that case.
> > 
> > Observe that any caller to __tlb_adjust_range() also sets at least one
> > of the tlb->freed_tables || tlb->cleared_p* bits, and those are
> > unconditionally cleared by __tlb_reset_range().
> > 
> > Change the condition for actually issuing TLBI to having one of those
> > bits set, as opposed to having tlb->end != 0.
> > 
> 
> 
> We should possibly get this to stable too along with the first two 
> patches. I am not quiet sure if this will qualify for a stable backport. 
> Hence avoided adding Cc:stable@kernel.org

I'm not seeing any description of the user-visible runtime effects. 
Always needed, especially for -stable, please.

It appears to be a small performance benefit?  If that benefit was
"large" and measurements were presented then that would be something
we might wish to backport.


