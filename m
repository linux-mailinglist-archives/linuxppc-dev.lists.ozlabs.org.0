Return-Path: <linuxppc-dev+bounces-485-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6211695DF2A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2024 19:22:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WrkK252gZz2yFL;
	Sun, 25 Aug 2024 03:22:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724520150;
	cv=none; b=ZSP9XyyvUo6gWcJbhqyIIE7YlgerNU3HzpdBiYNnjV65fk2G/aJRoAvn7kS9K51PgQcuYN3EOQbkoNCtWW4UA8zRAthTZHU8mlXTTE4s7XwCUQ1sTI41E0NEycTR8f2dSe43iSnDY7lw1Jc5By6nK5Y5YxO4OPEJTwTAlclNvRDioB/+VyqICCPK1+nhqgtgGybF2wpS/6vP1ORFqsGuIYMrARnK9rj8prMCDVUpicAKzhOP3gLmiMsLOnR1hEemFWNm4johiKQxTD/DMIRTT2iZ3PUGpyKFKDbTEqcBFsfRmPSfnv8omC4ZDyKLcXrOOdbcxWsHEqkQE/IHcQNmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724520150; c=relaxed/relaxed;
	bh=8ADWPIKaBDikTUBMZnxYqan+zdqXxva7yEqxS4yoPug=;
	h=Received:Received:X-Authentication-Warning:Date:From:To:Cc:
	 Subject:Message-ID:References:Mime-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 User-Agent; b=nZi5CVEminaUq6PNlwaCcuzUR5tcS82/t8HeG1ZO3VJIguRI3SMaNGaJTJORF67IXX3PwcOiDqsfy+7aNPXGFwlzsKJ2wlt5u8pXd/GKJMdNQWld9fGaxSXN4tODb9kbZd4aCqzUJFm9hbYzWPcnO8QW1iB3YUvCZGh/sDlAVsfBxmRnO2cnEnKUjShu0MHe5ZbcLOo+UjQ+p0+ifMRjvl/G4r/wHffQNwpd0QcTzs7EWZwzPPtCLUX4Pd0jLCrcGUcHuqpMh8t6VLJjNe6lIPG9337bzyCs+9tVkK5yqNYri5Cfd3W+BGeVFmXNVFrYyY05uSgkgqs122PqHfJyZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WrkK15JjJz2y33
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2024 03:22:27 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 47OHI0J9004252;
	Sat, 24 Aug 2024 12:18:00 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 47OHHveN004249;
	Sat, 24 Aug 2024 12:17:57 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sat, 24 Aug 2024 12:17:57 -0500
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
Message-ID: <20240824171757.GL28254@gate.crashing.org>
References: <2e3acfe63d289c6fba366e16973c9ab8369e8b75.1631803922.git.christophe.leroy@csgroup.eu> <17fa6450-6613-4c34-804b-e47246e7b39c@isd.uni-stuttgart.de> <9dbf73fe-a459-4956-8dbc-e919d9728f5e@cs-soprasteria.com> <20240822053238.GA2028@lst.de> <e6acf664-5ebd-4273-9330-cbec283ede23@cs-soprasteria.com> <20240823130600.GI28254@gate.crashing.org> <20240823135459.GA28487@lst.de> <20240823191924.GK28254@gate.crashing.org> <c8127b03-245b-4eaa-98f5-6e14df094669@cs-soprasteria.com>
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
In-Reply-To: <c8127b03-245b-4eaa-98f5-6e14df094669@cs-soprasteria.com>
User-Agent: Mutt/1.4.2.3i

On Sat, Aug 24, 2024 at 09:01:33AM +0000, LEROY Christophe wrote:
> Le 23/08/2024 à 21:19, Segher Boessenkool a écrit :
> > The memset() code itself could chech for the storage attributes, but
> > that is probably more expensive than just assuming the happy case.
> > Maybe someone could try it out though!
> 
> But is it only memset() the problem ?
> 
> dcbz instruction is also used in:
> - memcpy()
> - csum_partial_copy_generic()
> - clear_page()
> - copy_page()
> - clear_user()
> - copy_to_user()
> - copy_from_user()

That is just a handful of functions.  Not sure about the _user things,
and the _page things for that matter, but the rest is certainly
measurable in real-life conditions.  So if we can avoid the problems
completely, and cheaply, we probably should.

I'm not so sure about the cheaply though :-/

> Are these functions also used on DMA coherent memory ?

Most won't show up high on most profiles, heh.  Which you already
can see from the problem not being attacked yet: if it was so obviously
a problem, some people would have wanted to do something about it :-)


Segher

