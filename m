Return-Path: <linuxppc-dev+bounces-471-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A14395D611
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 21:29:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr99x2gP5z2xJ8;
	Sat, 24 Aug 2024 05:29:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724441365;
	cv=none; b=awZtsGqVy6hVkMkl5TCdImRWz5Sp9rNrIkLufmM4BSeAY/G97cJkHzaODFnII5UVjVZfdCyexosz5+AAeRmc5YXcvjQ5Ui0vL9q3xDdTwslhycPJa0PMBAEBFrU3VXlPulsdTsX03EYa8ttzLhXXp3L93PDYUB3ST1bjnXVQdCIBZ8s25Ri6LUn96OtflzlGm38OQAtDj/NRxpvft4T8lCYGPKGPqA3xW3H6ox23TXkl5R5gJ1lXF2zW1Wlp70rYAggey0dQhXvcyiEHadfKvatW81PprlxNzRSvxG6Dhi1JLbOsR2STp6F4PC8wql8rmWo52i6hEzoVKPRKgxuyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724441365; c=relaxed/relaxed;
	bh=od3lokxeMX+WKExbK/APVwv2OpJN5yKgKuK0D542c6U=;
	h=Received:Received:X-Authentication-Warning:Date:From:To:Cc:
	 Subject:Message-ID:References:Mime-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent; b=G/lbuzjtgMtrSmgMzLMtSqEde0O1du+VAxi/ttyzUCaJkRxksoGPPHlq/0KGBGXJoGATsgm1zBa7Y5tyJ2Svv1tUV6Q7ftpBUCXmb/oM/tHh1wpyJsUy1iGF/2C+rg6FfK44iX8bq515wFFgN4xepeyhchZ/mZrKGUPM2fhhbgQUERgu6llv919Q5Vi0oQTCTiwE9lczbyDfb1QOZ6oEulQheR+KsLwr20sOP9UUKA8eTpEahpZQ3jcSfxNnZ60oxufuLhNZRRpeAI5Co0lQpLhK3W5pzk5h2MIFHYh0sliF0aZ4gZhyEP1oC/ntuvyQN/k7n1uAlnoNMnAbC6964w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr99v6jYqz2xF0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2024 05:29:22 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 47NJLSlM032341;
	Fri, 23 Aug 2024 14:21:49 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 47NJJp0F032203;
	Fri, 23 Aug 2024 14:19:51 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 23 Aug 2024 14:19:24 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christoph Hellwig <hch@lst.de>
Cc: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
        Christian Lamparter <christian.lamparter@isd.uni-stuttgart.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        Stan Johnson <userm57@yahoo.com>, Finn Thain <fthain@linux-m68k.org>
Subject: Re: [PATCH v2] powerpc: warn on emulation of dcbz instruction in kernel mode
Message-ID: <20240823191924.GK28254@gate.crashing.org>
References: <2e3acfe63d289c6fba366e16973c9ab8369e8b75.1631803922.git.christophe.leroy@csgroup.eu> <17fa6450-6613-4c34-804b-e47246e7b39c@isd.uni-stuttgart.de> <9dbf73fe-a459-4956-8dbc-e919d9728f5e@cs-soprasteria.com> <20240822053238.GA2028@lst.de> <e6acf664-5ebd-4273-9330-cbec283ede23@cs-soprasteria.com> <20240823130600.GI28254@gate.crashing.org> <20240823135459.GA28487@lst.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823135459.GA28487@lst.de>
User-Agent: Mutt/1.4.2.3i

Hi!

On Fri, Aug 23, 2024 at 03:54:59PM +0200, Christoph Hellwig wrote:
> On Fri, Aug 23, 2024 at 08:06:00AM -0500, Segher Boessenkool wrote:
> > What does "uncached memory" even mean here?  Literally it would be
> > I=1 memory (uncachEABLE memory), but more likely you want M=0 memory
> > here ("non-memory memory", "not well-behaved memory", MMIO often).
> 
> Regular kernel memory vmapped with pgprot_noncached().

So, I=1 (and G=1).  Caching inhibited and guarded.  But M=1 (memory
coherence required) as with any other real memory :-)

> > If memset() is expected to be used with M=0, you cannot do any serious
> > optimisations to it at all.  If memset() is expected to be used with I=1
> > it should use a separate code path for it, probably the caller should
> > make the distinction.
> 
> DMA coherent memory which uses uncached memory for platforms that
> do not provide hardware dma coherence can end up just about anywhere
> in the kernel.  We could use special routines for a few places in
> the DMA subsystem, but there might be plenty of others.

Yeah.  It will just be plenty slow, as we see here, that's what the
warning is for; but it works just fine :-)

The memset() code itself could chech for the storage attributes, but
that is probably more expensive than just assuming the happy case.
Maybe someone could try it out though!


Segher

