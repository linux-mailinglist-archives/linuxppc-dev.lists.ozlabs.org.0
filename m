Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE87730192D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 03:11:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DNc174JppzDrQ4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 13:11:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=JupcgCB/; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DNbz3530YzDqkL
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 13:09:17 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FA3B229F0;
 Sun, 24 Jan 2021 02:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1611454154;
 bh=NoOjEaGp85QcxUqBSDOe0ipjgea3PrHuHrnXFNVCOGo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JupcgCB/e52p8vQoWbH826PMyiDiMnQ6vnNe1BbDf2dY+wnkR5tkKG2eCWovj16mg
 v9GqEW/1Lme9ZLgF+wRxV8qLFFFeMQyby0X3GdKKz03k2DKYNO7IKusRjn0EVhYInL
 RV/vFF0dvv2I1+m5dCnTh4jMCeap8kD7LytqMOAs=
Date: Sat, 23 Jan 2021 18:09:11 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] memblock: do not start bottom-up allocations
 with kernel_end
Message-Id: <20210123180911.aafa8404a3a7a30779713456@linux-foundation.org>
In-Reply-To: <20210122043714.266075-1-bauerman@linux.ibm.com>
References: <20201220064959.GB392325@kernel.org>
 <20210122043714.266075-1-bauerman@linux.ibm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
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
Cc: riel@surriel.com, kernel-team@fb.com, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, mhocko@kernel.org, linux-mm@kvack.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Konrad Rzeszutek Wilk <konrad@darnok.org>, iamjoonsoo.kim@lge.com,
 linuxppc-dev@lists.ozlabs.org, guro@fb.com, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 22 Jan 2021 01:37:14 -0300 Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:

> Mike Rapoport <rppt@kernel.org> writes:
> 
> > > Signed-off-by: Roman Gushchin <guro@fb.com>
> > 
> > Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
> 
> I've seen a couple of spurious triggers of the WARN_ONCE() removed by this
> patch. This happens on some ppc64le bare metal (powernv) server machines with
> CONFIG_SWIOTLB=y and crashkernel=4G, as described in a candidate patch I posted
> to solve this issue in a different way:
> 
> https://lore.kernel.org/linuxppc-dev/20201218062103.76102-1-bauerman@linux.ibm.com/
> 
> Since this patch solves that problem, is it possible to include it in the next
> feasible v5.11-rcX, with the following tag?

We could do this, if we're confident that this patch doesn't depend on
[1/2] "mm: cma: allocate cma areas bottom-up"?  I think it is...

> Fixes: 8fabc623238e ("powerpc: Ensure that swiotlb buffer is allocated from low memory")

I added that.


