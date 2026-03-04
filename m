Return-Path: <linuxppc-dev+bounces-17727-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJLvC9tMqGmvsgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17727-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 16:16:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DBC202683
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 16:16:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQx8k6SH3z3bt9;
	Thu, 05 Mar 2026 02:16:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772637398;
	cv=none; b=EGJIf7+92MgY9AmYaOAkz+gWHUifRL6x/GN5pDcjEX4nYDcZ6WmHUwfNxrm0tF7GsmW8v36yjwiZd6vrxuVT1NGGGp2S99UIk9HdNPH5Ho+gR+njSc4ndOjy1LjHVTA/E+I3a2fVG+ZRVDKrYQZqAPX2NGJT35mHrH/zYoa509yfGv+XN2ysrGJHV8/oPQGFVmbDw4MqKY/ctceh8MaaambTvbccRsp/A5nFz4dLVKs1IExu5S+k9Vq4C8jhmWH9fs5w7N2MfTv2bz2GrHNpzBEa3hWd90PY2jxmdHb6U5GKGmPJGgThfEPQj6ddzBEShlfhVw/mDRcB2BjWgBpv1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772637398; c=relaxed/relaxed;
	bh=6YOM2WbXA6Qkgtapqxkvfve9MfkbbU3JEb7qOmomVt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYF+OqqF9Wj/AFRVHwWcYySQAlFpifQ9E59nLJYTt7uoWKmew+PGp2DsvvgCaoxxSvGBEC1LToNmYPZ2N/7VGqMNWWz4gDC+QRg1zlERgJUYiVKIA6tm73RdI1XBAEXbkJn9bkuRjIWQ6sAbjVwdqOeTCgUowq/BaJ3yDczQ72Yq4BwU/wyM8lsHVow1aVnUbYnouDnHxLNlsSJ0Qb4wytllwKsvwsPVn2LYsFOEoTuUAx+LajTeTPDBRbdLbFtIg6nKSYP5Q8S7mZdbSVtVK8nHsKnWlW8Q0PfCgXY7djtt9w8Q9DZkdMyxaYTLjOVe9Kg0Cr/cOcQOkw1iyzxLEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=q1J4oN1p; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=q1J4oN1p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQx8h5Rhnz2yY0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 02:16:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6YOM2WbXA6Qkgtapqxkvfve9MfkbbU3JEb7qOmomVt8=; b=q1J4oN1pPBSexJBFfjtr2VdcfT
	cPjNy395v4gDWuxsi/ha9yDNRWUDE6LFqfzn4Yd1LrI2S8TpWPL9z3MhAmoIER+ZDJyxwPon5M1aZ
	AskUH2Doi34eCDyGezZO7dFjB0MasMnhHu+waAlY2mSgI1X8HVcdj0ldXYJVqOQJGTHaRlrHebAgJ
	7wxEvMsC0Uv8vstvbUoelynHMruTuwwfR7BfY5x5rRwbRWYnr5u0aOyOekToDV4C2BditkWs1U/DG
	GZMgOgAqSwHzeMa0C5li6urfh2f+Xx0KFGH88a+OERM2YwXtwihCtup0aktg8uAV14j68e34o5DP6
	1F2fSdZQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnwz-0000000DTMB-31pq;
	Wed, 04 Mar 2026 15:15:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 20C7A300FB6; Wed, 04 Mar 2026 16:15:48 +0100 (CET)
Date: Wed, 4 Mar 2026 16:15:48 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Eric Biggers <ebiggers@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	Song Liu <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>,
	Li Nan <linan122@huawei.com>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-raid@vger.kernel.org
Subject: Re: [PATCH 01/25] xor: assert that xor_blocks is not called from
 interrupt context
Message-ID: <20260304151548.GN1395266@noisy.programming.kicks-ass.net>
References: <20260226151106.144735-1-hch@lst.de>
 <20260226151106.144735-2-hch@lst.de>
 <20260227142455.GG1282955@noisy.programming.kicks-ass.net>
 <20260303160050.GB7021@lst.de>
 <20260303195517.GC2846@sol>
 <20260304145134.GA21983@lst.de>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304145134.GA21983@lst.de>
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: E2DBC202683
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,linaro.org,gmail.com,armlinux.org.uk,arm.com,xen0n.name,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,davemloft.net,gaisler.com,nod.at,cambridgegreys.com,sipsolutions.net,redhat.com,alien8.de,linux.intel.com,zytor.com,gondor.apana.org.au,intel.com,fb.com,suse.com,arndb.de,fnnas.com,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17727-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:ebiggers@kernel.org,m:akpm@linux-foundation.org,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:davem@davemloft.net,m:andreas@gaisler.com,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:herbert@gondor.apana.org.au,m:dan.j.williams@intel.com,m:clm@fb.com,m:dsterba@suse.com,m:arnd@arndb.de,m:song@kernel.org,m:yukuai@fnnas.com,m:linan122@huawei.com,m:linux-alpha@vger.kernel.org,m:linux-kernel@vg
 er.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-crypto@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-raid@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[peterz@infradead.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[56];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,noisy.programming.kicks-ass.net:mid]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 03:51:34PM +0100, Christoph Hellwig wrote:

> > How about "WARN_ON_ONCE(!preemptible())"?  I think that covers the union
> > of the context restrictions correctly.  (Compared to in_task(), it
> > handles the cases where hardirqs or softirqs are disabled.)
> 
> Good enough I guess.  Peter?

Sure. The only caveat with that is that for PREEMPT_COUNT=n this might
not work, it unconditionally returns 0.

