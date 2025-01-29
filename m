Return-Path: <linuxppc-dev+bounces-5701-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B852DA226AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 00:03:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjyNz3hF9z30T3;
	Thu, 30 Jan 2025 10:02:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738191779;
	cv=none; b=T4O11QNIMAjYeggm+K9LLq+MtvdOJGnZZ27m9fLsVUrj968BjrEAxbW9QIJEcD4NKxn09tfIqG+zDb1vnHgERYv+SFU63DKzycp1JNi4xBcm5irh3tzZsnA9RWSAzMoJ51j17FFNeuAaU6x4FFFOS+HPRu5Ans2bFmnUNgd/pffzM3kEVoKI5YgieA6IEUtKCCq0HKaIN4qmG2HW/dEVNDfaNNY0BYsvcfKJESFR/OObxRdLqe9Pykev7Bd5sBF+Dmz06nUXWmk46i9Es4vQF29P2HzCCHl4lFuUSdqMeK7bMSg4e2E2tBMAftVNhmy197k6jKm2R5J/eNJ+BZKHHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738191779; c=relaxed/relaxed;
	bh=KfRVwiVvoIL5yKlVMJTKUtLAc62tnU62cuq5lssPDUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dX0/GMOg6D/Os2QdZZ9RlO7oAs0ddiGvVApLDihAqCYUfSOLi6tTBJ/2maTZxkTOLJEDTZxCgp1JnrNosbi3DZuwhK+Ud+kRpJq2ikdmTK6vH/e+fGxePtLvC51NP3LP+48r0E30wEYNZQi46gfSqDSS+RXcvXC2918e7uatZUXW1QE5yhqOe5wnONzO95NyGQr3M+HilSDc2R7smDZS6RhVG7f+ro+1C+ntcXYLgKGeFEARUjiT59Tnzlv/8mTyxLMLSozNlOGQerY7rxUX56Y8IlC3+MzJpANp3ve3gNOEbEH/urzo3cu8ZNOIaIEs6T6JTQ3yBAr0hKI9vLL7jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=itWlX2OR; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=itWlX2OR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjyNs5zjyz2yYy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 10:02:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KfRVwiVvoIL5yKlVMJTKUtLAc62tnU62cuq5lssPDUQ=; b=itWlX2ORYkxDIMR7KkPfVOS3of
	mA85c29LcGu6a4faK14Mlody6Myv+SWb1GHg19xlyJhbt5kNYKL2B6FpdlCzEbLARSUcwIQ41cQp2
	X3vUGRs2gB+fEnK2awaGyv8k71Lho6DGBejeORiCL09uQN8gi/TjYFeHTA8uo4HmrpRscM4j6aLIz
	P3lIYaOUS7rd0pVqvJZizXk+7R5iOVbXpM+PqOLscrJzqevkL7Q7zxDqivU4iNaKk9v71jIu7WHqj
	TR4S7YHpuau7rMlzD3CKsqBglLYiS4B7CSyb0omVXOzya/c7BmEEinKDhwyRgTc5VhdLT/3KJbYAk
	J771SZTQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tdH51-0000000CYOC-1aDq;
	Wed, 29 Jan 2025 23:02:43 +0000
Date: Wed, 29 Jan 2025 23:02:43 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu,
	geert@linux-m68k.org, justinstitt@google.com,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
	maddy@linux.ibm.com, morbo@google.com, mpe@ellerman.id.au,
	nathan@kernel.org, naveen@kernel.org, ndesaulniers@google.com,
	npiggin@gmail.com, linux-mm@kvack.org
Subject: Re: [PATCH] xarray: port tests to kunit
Message-ID: <Z5qzk_92KU0xoLcP@casper.infradead.org>
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com>
 <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAJ-ks9=hNGRFbr3sTQBma3u84Yhog7i33Oc=16FqFjE_JYNERA@mail.gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ-ks9=hNGRFbr3sTQBma3u84Yhog7i33Oc=16FqFjE_JYNERA@mail.gmail.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 05:33:06PM -0500, Tamir Duberstein wrote:
> >  $ ./scripts/get_maintainer.pl --git lib/xarray.c
> > Matthew Wilcox <willy@infradead.org> (supporter:XARRAY,commit_signer:1/3=33%,authored:1/3=33%,added_lines:19/52=37%,removed_lines:4/23=17%)
> > Andrew Morton <akpm@linux-foundation.org> (supporter:LIBRARY CODE,commit_signer:3/3=100%)
> 
> I'm not sure what you're asking. I used `b4 prep --auto-to-cc`. It
> doesn't know that test_xarray.c and xarray.c have the same maintainer.

You need to use your brain.  You can't just say "I used the tool".
Tools are just tools.  Sometimes they're wrong.  My email address is
listed as the Author: of test_xarray.c.  You should have noticed that.

> For what it's worth the kunit invocation, while obscure, is
> self-documenting. There's usage information that's reasonably
> understandable embedded in the tool itself. I looked for the userspace
> testing initially but failed to find
> tools/testing/radix-tree/xarray.c. Even now, I'm not sure how I'm
> meant to compile this.

kunit is useless.  The test_xarray.c module is useless.  If you break
xarray, the kernel won't boot far enough to load any modules.  You
haven't thought about this AT ALL.

cd tools/testing/radix-tree
make

Then you can run the tests, whichever ones make sense for you to run.

