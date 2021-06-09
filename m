Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 427FF3A0BF6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 07:51:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0GT14rGrz3bx8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 15:51:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jc8qOTt8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jc8qOTt8; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0GSW52bxz2yx4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 15:51:22 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id o27so22607405qkj.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 22:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Q8sTBTD7rqUBliLRHrxCmEIR6SotTCZJtXQ0xNJl0ps=;
 b=jc8qOTt8Oip/8bbn8zI7lQ382Nv/JjOqm0/85z3jXtEs02APBXJte68vjIBeLPaAgr
 8thN6vFm7LY859Yzo4JhsA0RXTv849sULwn2NTBgRVFZvWQ7bW5S4wV+bqbn8jACftVM
 PadCgvjVGYYCQ294hAV+xd3LCnTD+wDTnxBZugD8CAUXZ7Mk6ClNUXsscIob/debc9Yb
 ++TTO539UY5TfFdbjsHQENMRryzxavGBVGwlc42EF21Kbp2x5gXqwBzKa3jedwGOzcNb
 WpRGbRa7ISr2BUaTX+p05ClXCyPc75YaA+r5EhhCjf7rG59SHYoz/9GzyyHLJ9l5DncY
 1BDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Q8sTBTD7rqUBliLRHrxCmEIR6SotTCZJtXQ0xNJl0ps=;
 b=izb8MlgrduWiNX+Z7Mw8OaeOGq0SrZmESs52XxrPxhis0UsaZSV4KifSaa0wXqwLAm
 dio4pzDlz76WdbqkPoq5+iNLeX+eFg1aOU5m0iHVP5/WQJOQbcWM9Vw+2dIoAU05mxRo
 EMEuD1+4rWEQUw3kYq5R6FmxY2h98Lisi/8UyCw8RpboyiSnXmlTVJFp6cu3Rcb7Fs+P
 IanZ3UfhxyoIO6ZjauOhuJuztE5YXtxZoO4oBsmSEdywqHvw5NCyplkHXv06HqGguBRW
 U98C9ma+iYvMd2IMSLmtuAduJj9rC1LRjyoLXIaFXU2T1BsVPiVXOJBaYS3WM7KPOYNO
 xZFQ==
X-Gm-Message-State: AOAM531aAGDMEV5fNIbo19Z/AHr9Iqy1eZEfi8XMiBTeCneIaA/5Huqk
 GddIdvbly8RA3CJWqmD3C8k=
X-Google-Smtp-Source: ABdhPJxxA8J8MOBhkHg6pxRDuQxesUSikSLI8O9AegUX7qOIzZD2LHX5Ab14oRo0m7F/p9XkLgjFEQ==
X-Received: by 2002:a05:620a:228b:: with SMTP id
 o11mr9373599qkh.426.1623217878471; 
 Tue, 08 Jun 2021 22:51:18 -0700 (PDT)
Received: from ?IPv6:2804:14c:482:87bb::1000? ([2804:14c:482:87bb::1000])
 by smtp.gmail.com with ESMTPSA id g2sm7003048qtb.63.2021.06.08.22.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 22:51:18 -0700 (PDT)
Message-ID: <a69f18159b90c5ede95e6d3769e224b883cc974f.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] powerpc/mm/hash: Avoid resizing-down HPT on
 first memory hotplug
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 09 Jun 2021 02:51:49 -0300
In-Reply-To: <YMBGW3RQOzoQxBqy@yekko>
References: <20210430143607.135005-1-leobras.c@gmail.com>
 <20210430143607.135005-2-leobras.c@gmail.com> <YL2obsnp4rWbW6CV@yekko>
 <648b382159009c5f4277d9b9c3f896142ea75d6c.camel@gmail.com>
 <YMBGW3RQOzoQxBqy@yekko>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 
MIME-Version: 1.0
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Scott Cheloha <cheloha@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Sandipan Das <sandipan@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2021-06-09 at 14:40 +1000, David Gibson wrote:
> On Tue, Jun 08, 2021 at 09:52:10PM -0300, Leonardo Brás wrote:
> > On Mon, 2021-06-07 at 15:02 +1000, David Gibson wrote:
> > > On Fri, Apr 30, 2021 at 11:36:06AM -0300, Leonardo Bras wrote:
> > > > Because hypervisors may need to create HPTs without knowing the
> > > > guest
> > > > page size, the smallest used page-size (4k) may be chosen,
> > > > resulting in
> > > > a HPT that is possibly bigger than needed.
> > > > 
> > > > On a guest with bigger page-sizes, the amount of entries for
> > > > HTP
> > > > may be
> > > > too high, causing the guest to ask for a HPT resize-down on the
> > > > first
> > > > hotplug.
> > > > 
> > > > This becomes a problem when HPT resize-down fails, and causes
> > > > the
> > > > HPT resize to be performed on every LMB added, until HPT size
> > > > is
> > > > compatible to guest memory size, causing a major slowdown.
> > > > 
> > > > So, avoiding HPT resizing-down on hot-add significantly
> > > > improves
> > > > memory
> > > > hotplug times.
> > > > 
> > > > As an example, hotplugging 256GB on a 129GB guest took 710s
> > > > without
> > > > this
> > > > patch, and 21s after applied.
> > > > 
> > > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > > 
> > > Sorry it's taken me so long to look at these
> > > 
> > > I don't love the extra statefulness that the 'shrinking'
> > > parameter
> > > adds, but I can't see an elegant way to avoid it, so:
> > > 
> > > Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> > 
> > np, thanks for reviewing!
> 
> Actually... I take that back.  With the subsequent patches my
> discomfort with the complexity of implementing the batching grew.
> 
> I think I can see a simpler way - although it wasn't as clear as I
> thought it might be, without some deep history on this feature.
> 
> What's going on here is pretty hard to follow, because it starts in
> arch-specific code (arch/powerpc/platforms/pseries/hotplug-memory.c)
> where it processes the add/remove requests, then goes into generic
> code __add_memory() which eventually emerges back in arch specific
> code (hash__create_section_mapping()).
> 
> The HPT resizing calls are in the "inner" arch specific section,
> whereas it's only the outer arch section that has the information to
> batch properly.  The mutex and 'shrinking' parameter in Leonardo's
> code are all about conveying information from the outer to inner
> section.
> 
> Now, I think the reason I had the resize calls in the inner section
> was to accomodate the notion that a) pHyp might support resizing in
> future, and it could come in through a different path with its drmgr
> thingy and/or b) bare metal hash architectures might want to
> implement
> hash resizing, and this would make at least part of the path common.
> 
> Given the decreasing relevance of hash MMUs, I think we can now
> safely
> say neither of these is ever going to happen.
> 
> Therefore, we can simplify things by moving the HPT resize calls into
> the pseries LMB code, instead of create/remove_section_mapping.  Then
> to do batching without extra complications we just need this logic
> for
> all resizes (both add and remove):
> 
>         let new_hpt_order = expected HPT size for new mem size;
> 
>         if (new_hpt_order > current_hpt_order)
>                 resize to new_hpt_order
> 
>         add/remove memory
> 
>         if (new_hpt_order < current_hpt_order - 1)
>                 resize to new_hpt_order
> 
> 


Ok, that really does seem to simplify a lot the batching.

Question:
by LMB code, you mean dlpar_memory_{add,remove}_by_* ?
(dealing only with dlpar_{add,remove}_lmb() would not be enough to deal
with batching)

In my 3/3 repĺy I sent you some other examples of functions that
currently end up calling resize_hpt_for_hotplug() without comming from 
hotplug-memory.c. Is that ok that they do not call it anymore?


Best regards,
Leonardo Bras

