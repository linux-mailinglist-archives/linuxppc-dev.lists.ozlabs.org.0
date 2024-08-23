Return-Path: <linuxppc-dev+bounces-457-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7849395CD8D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 15:15:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr0v12cqSz2ywq;
	Fri, 23 Aug 2024 23:15:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724418957;
	cv=none; b=B4f+8uru+EVg7EZVvZ0ImmUH/F7fBnfCKh2O/k4R0xgvwaGAclPspapFQ4LVADpveUY4iGChRX45XkAyeF9Vaiks+XaZ08hgluCwIBIHrMsnWVwYxYyQstMPdg6TqCbF4lTkI/yRm8Bxf1EYIpp7JnH6d5584oHhlHDckllJ3dZk2tcqHomwC/Yc6HY6mM8KWMvQfLgd1suv1R9TlFxqwp7zZUqrqHjQlNR7DeVmfeL13wxfC2IUAty9fRypHFWgj2oXBLqZuvL9SOYHShsCeQz25cajjW+Vcml8vkPoX0yyoZKdq2QY+EbXUD5/HqjNdgTskOJUWY7gvdkQ+iG5Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724418957; c=relaxed/relaxed;
	bh=J1oVTHoHeN5+/BixwcHWopjA1mCGVBsl5lWAq5PbBW4=;
	h=Received:Received:X-Authentication-Warning:Date:From:To:Cc:
	 Subject:Message-ID:References:Mime-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 User-Agent; b=jZyzfoa7aV+NA0Gvv1V7WGeRqavGdEivjO0J9FWexPLph/mNt7Fzi7ZfC+/sjmBJe5EsR5Kz9xB0IZZSSW2j65mXbS9KjUuD/oQBongYe8H19CoVsjOSL0uWxssYg6k7xR6oI0LzUEE2fNlE1xB9qsQCWqVK+MNGWKaXg039ergIv3MrF0dSsz2msfMc4MZa4D74qQAVwtBTBW2d6IWPzmkgKMcGhSdtdi0eI/1vXkqoRosfwwLgB+6t5Cs0K8OK9f5vy0no6CQjPTFWQYOXReL4iTfelg95XguCSyKCmMvIVmydTklW1yc1CFWJilTtPab5PzWXdc5lTUqa8KrOmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr0tz4t16z2yvj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 23:15:54 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 47ND83oS013063;
	Fri, 23 Aug 2024 08:08:24 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 47ND6LFc013001;
	Fri, 23 Aug 2024 08:06:21 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 23 Aug 2024 08:06:00 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: Christoph Hellwig <hch@lst.de>,
        Christian Lamparter <christian.lamparter@isd.uni-stuttgart.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        Stan Johnson <userm57@yahoo.com>, Finn Thain <fthain@linux-m68k.org>
Subject: Re: [PATCH v2] powerpc: warn on emulation of dcbz instruction in kernel mode
Message-ID: <20240823130600.GI28254@gate.crashing.org>
References: <2e3acfe63d289c6fba366e16973c9ab8369e8b75.1631803922.git.christophe.leroy@csgroup.eu> <17fa6450-6613-4c34-804b-e47246e7b39c@isd.uni-stuttgart.de> <9dbf73fe-a459-4956-8dbc-e919d9728f5e@cs-soprasteria.com> <20240822053238.GA2028@lst.de> <e6acf664-5ebd-4273-9330-cbec283ede23@cs-soprasteria.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6acf664-5ebd-4273-9330-cbec283ede23@cs-soprasteria.com>
User-Agent: Mutt/1.4.2.3i

Hi!

On Thu, Aug 22, 2024 at 06:39:33AM +0000, LEROY Christophe wrote:
> Le 22/08/2024 à 07:32, Christoph Hellwig a écrit :
> > On Thu, Aug 22, 2024 at 05:25:10AM +0000, LEROY Christophe wrote:
> >>> and this results in a call to dma_direct_allocation(), which has one
> >>> innocent looking memset():
> >>
> >>
> >> memset() can't be used on non-cached memory, memset_io() has to be used
> >> instead.
> > 
> > No, we use memset on uncached memory all the time.  Note that uncached
> > memory != __iomem memory, for which you DO have to use memset_io.
> > 
> 
> Then we have a subject here.
> 
> powerpc has a magic instruction 'dcbz' which clears a full cacheline in 
> one go. It is far more efficient than a loop to store zeros, and since 
> 2015 memset(0) has been implemented with that instruction (commit 
> 5b2a32e80634 ("powerpc/32: memset(0): use cacheable_memzero"))
> 
> But that instruction generates an alignment exception when used on 
> non-cached memory (whether it is RAM or not doesn't matter).

What does "uncached memory" even mean here?  Literally it would be
I=1 memory (uncachEABLE memory), but more likely you want M=0 memory
here ("non-memory memory", "not well-behaved memory", MMIO often).

M=0 memory shouldn't ever have memset done on it, that is insane.  And
I=1 memory should not have the same optimised routines used, since
those only make things slower still.

> It is then 
> emulated by the kernel but it of course leads to a serious performance 
> degradation, hence the warning added by commit cbe654c77961 ("powerpc: 
> warn on emulation of dcbz instruction in kernel mode"). Until now it 
> helped identify and fix use of memset() on IO memory.
> 
> But if memset() is expected to be used with non-cached RAM, then I don't 
> know what to do. Any suggestion ?

If memset() is expected to be used with M=0, you cannot do any serious
optimisations to it at all.  If memset() is expected to be used with I=1
it should use a separate code path for it, probably the caller should
make the distinction.


Segher

