Return-Path: <linuxppc-dev+bounces-5713-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D79DA22F86
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 15:22:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkLpL5tDlz306x;
	Fri, 31 Jan 2025 01:22:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738246970;
	cv=none; b=P4n/P3h78d5kc7OBnCU9EFJjA6gRFSBiSh9/gA3IVHEM4w/pQlrqveonTFrUbYo4qzE8pHGuj7IPpzVnUDXPmxra9lNTL573KfNICERgAiWDVPC1+LaK4L8A2JDqVFus+7TPlmJUh7nw9ewb/DOPUZJQzEr1TtQk6gQKg2iDVWoT7QARMMMiQ51jFdkqllUmHCIQ2MPhz7/1k93caOFP4KWxz6cp9w6fRCgIMHTB481/sNxEb04oU4HKlcEr/fymBHPfKQ5wymacw4aqSYQ282S1oZkTz+kr5KmslWp5OZuZTgZfSI+pykqh/3YUdW487rCgMCkyMp61kd09GXV3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738246970; c=relaxed/relaxed;
	bh=zBPwFHdewPI4agr5Oh0ubR+XXLYYmNdQxuFDAt/itGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1ZHcv+mFYcS5O6sj8qtV9xBYvIdvrZsW7xW7QKCMc+l9kkWDR03UDYFfulio881UUP4B9W1Uq8xBr1Bb2swQQt6MleMrTTEp2h+7HLe5Mq0OSSCr8ntSmk2Gre/EuP7M0F15NKwmHNF4hEVxTcQxl03S9mMD8HpaMcp19E/0uevKXyhbGeEL98MLhSNK/XQj3BbUKJmit9K3skujscqxYIgaRqqDuW04T98Iubbhbhn/84V2qaFwNoV+aLSBjHZwnRH38OlLaZN/kmnavRS7RMdyDlJDHKMHooFga2dyfodcNQg0oixVfrw658yYVbPUDdOQNHIjSL6tkszdX6EVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=XmC540MW; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=XmC540MW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkLpH51Trz2ykT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 01:22:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zBPwFHdewPI4agr5Oh0ubR+XXLYYmNdQxuFDAt/itGs=; b=XmC540MWIRUY45L1ZCKLWbQEFZ
	bFzbA57v/pSPALqI/QMDIzNsLcNmdbaK1Pw7benRStsfZ+yD89AllrhvD/9SSvYZLKwc/HEZap7H5
	Tmo/lLD6pflRJt8WceDAkoaBVdmiYQD+nyRDSzgntYutmfwHb1IDYBwlkL37uXMzFS1lzpeeed0/F
	8aZdMxv6lowImW7mKCVtHuMrQtgvtL8SrMOToNw+4KsytgZA6Unq1YwUnRDciVNwTa9y8RdYAINco
	DUkHdD5f2u4J/1SyNI31E1jbCNH49TJczCyNKDwfzveGbfDpHYm79SEfAtWr90iEO+L7Vq2kTwh2O
	aFiEUMsg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVRI-0000000DRjY-17hY;
	Thu, 30 Jan 2025 14:22:40 +0000
Date: Thu, 30 Jan 2025 14:22:40 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu,
	justinstitt@google.com, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com,
	mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org,
	ndesaulniers@google.com, npiggin@gmail.com, linux-mm@kvack.org
Subject: Re: [PATCH] xarray: port tests to kunit
Message-ID: <Z5uLMC7J4KKjuax4@casper.infradead.org>
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com>
 <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
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
In-Reply-To: <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 30, 2025 at 09:21:12AM +0100, Geert Uytterhoeven wrote:
> The long and obscure command line is a red herring: a simple
> "modprobe test_xarray" is all it takes...

That's all I've ever done.  I'm confused/annoyed by all this "let's
wrap everything up in some complex and obscure new thing" practice.

> > You should look at the userspace testing (that this broke) as it has
> > been really useful in certain scenarios.
> 
> BTW, how do I even build tools/testing/radix-tree?
> "make tools/help" doesn't show the radix-tree test.
> "make tools/all" doesn't seem to try to build it.
> Same for "make kselftest-all".

I've never heard of any of those things.  So I didn't try to make any of
them work.

> When trying the above, and ignoring failures due to missing packages
> on my host:
>   - there are several weird build errors,
>   - this doesn't play well with O=,
>   - lots of scary warnings when building for 32-bit,
>   - ...

Really?  Turns out I haven't built for 32-bit on this laptop, so I'm
installing all the packages I need now.  I seem to reemember it being
painful due to liburcu packaging not allowing me to install both a
32-bit and 64-bit package at the same time.

> At least the kunit tests build (and run[1] ;-) most of the time...

That's unworthy.  kunit isn't trying to do anything nearly as hard
as the radix tree tests are.

> [1] test_xarray started failing on m68k recently
>     https://lore.kernel.org/all/CAMuHMdU_bfadUO=0OZ=AoQ9EAmQPA4wsLCBqohXR+QCeCKRn4A@mail.gmail.com/

I really wish Andrew would stop merging xarray patches.

