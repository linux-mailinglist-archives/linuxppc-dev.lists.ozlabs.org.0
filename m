Return-Path: <linuxppc-dev+bounces-3137-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EED9C6984
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 07:52:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpDW55Tkgz2xHt;
	Wed, 13 Nov 2024 17:52:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731480769;
	cv=none; b=abeMHBPGyeQ4nM7QtYnSRZF+idi4YQPmL+2sjjra8G5JSdvl9WJOf4XCkkd/laZp5lPhHeTRn747tMeevglzs+kojMlhp4Yx9EE52oHLOn32/jexmF1Z6HyJWWn5p66dyMXcj7ZhAwL+KoBC8TFA8TPU7hRjv5GCqeZeWftsjjOTI2wLsK3jV2dYpCfPScbixEheanlV2IBzg0Y5dCPyl+ILoI3EtwSheym00YsU6oO2+tbfhL0rBxYrJZRuXh8VkIj+Sgn2EsbhEXfctlZbdhH/dc6dawRK4v9qxRwfCkP1R7lROavhIJmGVLhjCldwHFFumK+lnt2jvZQjtXQbkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731480769; c=relaxed/relaxed;
	bh=U2vB+01RTK8AvNJhmJ9rKgn9h+oBDOH9xIu6f6Kc5eM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bM99UavRPar8wVeAyE+85nx2Z/eugRSHzQfxCTc37j0vnc1bK3i4w5BSArSNY4c9ieRIbR71Z0ZT13ymV3eflNI6XmwqI8LDYZaDxBCOzhK1HVlYJUFbXZgPlZheTTpk6p39byebpKFZ3AjGtClpqVg03Xo3o1VPaErowW9oCDptfRDT4FWnxxoF3H/ZbGYMS1fTRBHtgKx/6arcYJomo0bmIs5Rq1W02KGIJ3KerI7UnITbf6xUcMuF99zJUV8lga+oFF329z8uAufec7vy4XdnguSgpjjCgS2Ej/dR0/00YJ1INzX23HPNxe7m7303HRK7sKR/JenSscOCtbTc/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=pSQlZt1W; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=pSQlZt1W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpDW44z4Gz2xG5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 17:52:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6E5C9A40410;
	Wed, 13 Nov 2024 06:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6B4C4CEDF;
	Wed, 13 Nov 2024 06:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1731480766;
	bh=xOpcl2VEYuCAnW+x7NWomeilL+Xx2LUb6LUm1ijdC00=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pSQlZt1WbgDhVKpE1A9GMSjJDjfDqOR/P0Lg6FEI2p4tqRQmkRR1qle8LaC9uDRPU
	 6Om0S9Cm6kof/BkO8gQBWiMJYxPRrffbBKf9gIOVsYvCDh7cJaZ5L9LFrnFwY6M/Ng
	 VcwbODd2YhVwvW4Q85DRF5rt/pT2UjOYtqCcCuPU=
Date: Tue, 12 Nov 2024 22:52:45 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Sourabh Jain
 <sourabhjain@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Zi Yan
 <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mahesh J
 Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Donet Tom <donettom@linux.vnet.ibm.com>, LKML
 <linux-kernel@vger.kernel.org>, Sachin P Bappalige <sachinpb@linux.ibm.com>
Subject: Re: [RFC v3 -next] cma: Enforce non-zero pageblock_order during
 cma_init_reserved_mem()
Message-Id: <20241112225245.52d0858536c6fb9ba4a683c0@linux-foundation.org>
In-Reply-To: <87h68bnbko.fsf@gmail.com>
References: <054b416302486c2d3fdd5924b624477929100bf6.1728656994.git.ritesh.list@gmail.com>
	<87h68bnbko.fsf@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 13 Nov 2024 07:23:43 +0530 Ritesh Harjani (IBM) <ritesh.list@gmail.com> wrote:

> "Ritesh Harjani (IBM)" <ritesh.list@gmail.com> writes:
> 
> > cma_init_reserved_mem() checks base and size alignment with
> > CMA_MIN_ALIGNMENT_BYTES. However, some users might call this during
> > early boot when pageblock_order is 0. That means if base and size does
> > not have pageblock_order alignment, it can cause functional failures
> > during cma activate area.
> >
> > So let's enforce pageblock_order to be non-zero during
> > cma_init_reserved_mem().
> >
> > Acked-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> > ---
> > v2 -> v3: Separated the series into 2 as discussed in v2.
> > [v2]: https://lore.kernel.org/linuxppc-dev/cover.1728585512.git.ritesh.list@gmail.com/
> >
> >  mm/cma.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> 
> Gentle ping. Is this going into -next?

I pay little attention to anything marked "RFC".  Let me take a look.

