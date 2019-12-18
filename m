Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7782E124946
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 15:17:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dHCT2MgszDqjd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 01:17:41 +1100 (AEDT)
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
 header.b="BZV0qpJA"; dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dH8y6f2kzDq6M
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 01:15:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2nES9kOBc4cV/fZ0o+JoYgqv77t/8xkE/A+hcyPMYUI=; b=BZV0qpJAM9mgU5zTXeGH9+luw
 0ncgwa+JZofxcOi8owdKKmIwwyoltYlTATau/3PhXu5TTvRQzRGwV7tsHHqHEBeB4pVx4Si4lvZOH
 a4l6FgaINOZzxU9Yy4D8V0rzda3zW81VpI5T0WPLbSA9CSSrh8ycdYYsibY54cfVViEJ+RFrggPY/
 mC9cxGiOs2DDtkRS+AlOaMPh44g/Ij9LksYx78+GAvSQAiMC0x7MeoyWMDrJ8Pe2yWUMFl1Fk2oeC
 jdhSLaImANWgAhXbmEhsyoRPmql01B27AZr546QZPlZq8R7kom+CWd8NMaH12KuIjzi9UVhaupsxh
 eNqPA6S5Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iha6T-0004bj-Jp; Wed, 18 Dec 2019 14:15:05 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9BC8F30038D;
 Wed, 18 Dec 2019 15:13:38 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8933E2B276121; Wed, 18 Dec 2019 15:15:01 +0100 (CET)
Date: Wed, 18 Dec 2019 15:15:01 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 2/3] mm/mmu_gather: Invalidate TLB correctly on batch
 allocation failure and flush
Message-ID: <20191218141501.GT2844@hirez.programming.kicks-ass.net>
References: <20191218053530.73053-1-aneesh.kumar@linux.ibm.com>
 <20191218053530.73053-2-aneesh.kumar@linux.ibm.com>
 <20191218091733.GO2844@hirez.programming.kicks-ass.net>
 <0f0bea3b-b7b5-fa8c-f75c-396cf78c47b4@linux.ibm.com>
 <87v9qdn5df.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v9qdn5df.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, Scott Wood <oss@buserror.net>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, linux-mm@kvack.org,
 akpm@linux-foundation.org, will@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 19, 2019 at 12:13:48AM +1100, Michael Ellerman wrote:

> >> I'm a little confused though; if nohash is a software TLB fill, why do
> >> you need a TLBI for tables?
> >> 
> >
> > nohash (AKA book3e) has different mmu modes. I don't follow all the 
> > details w.r.t book3e. Paul or Michael might be able to explain the need 
> > for table flush with book3e.
> 
> Some of the Book3E CPUs have a partial hardware table walker. The IBM one (A2)
> did, before we ripped that support out. And the Freescale (NXP) e6500
> does, see eg:
> 
>   28efc35fe68d ("powerpc/e6500: TLB miss handler with hardware tablewalk support")
> 
> They only support walking one level IIRC, ie. you can create a TLB entry
> that points to a PTE page, and the hardware will dereference that to get
> a PTE and load that into the TLB.

Shiny!, all the embedded goodness. Thanks for the info.
