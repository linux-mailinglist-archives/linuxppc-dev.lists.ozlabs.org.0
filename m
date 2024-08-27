Return-Path: <linuxppc-dev+bounces-579-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAA496030F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 09:29:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtK1t4bxwz2xXW;
	Tue, 27 Aug 2024 17:29:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724743794;
	cv=none; b=Ipn6/obgivoaGixMeacPs/TEm6cpLJG1teInV2yY3QZQVLLwBnnWH8a5LEcpyjTGDa3mh1KUWsjPZhsn95fTXAvyPE7Oh7NJ7o54S+O+To1h7rlwpUIVUVwL5SrmQVMgXadzdj0E5kWmD+xa83Qmx+Za1Ew2osV18RAqeeQfFTwZBfpAsEk9RaEXB/fEkeOTzkAQt7mjfaTtTz21lll2aeDRCNOgJu2K/O20xtTDcvTPo+V6x/rC7EkeJH8NeskCGXp1MsLD7AtzMj2C8g6gJtSkD5Xk0hYsBZZXae80DcU7AwLQJGnAt4lUYGqcqloHV9Y6Pu/S5TNkK8AkoSsK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724743794; c=relaxed/relaxed;
	bh=ZFpQqqYtZm9wjsN8m0IkwajQEX9Y5SlRHrnKBRCU4mg=;
	h=Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent; b=GpKIwdKh11GwGaPrcfVCXoZlFf1qi0jKWy5jqSiswixmyJPtS4uuHdIeq0U14L38dBTLuYmXPc098SMx/bDIJYyFgBWaJT7icnkQeqxsMSkxcw/jaP7/XQQJ7+KTVOyZxVSniddUuBHjQgHlOvU53eVLGoRyf8vfDRsYux8WbGCmcJXr6IZNpoGLLqLqpuRRS07zgnoSR6ZYMMY4OtX8rOQ3pwoTK1qGpxQhCH/wiPwKz7df1JGxc++8/gxRWU5cp4YsRJW98zCKkwkyeE71Wz1mquweG/YRW/T/W01vnciUDSL/OKVndqao0S0HSwK9Z63Ek1RnT6AXaVtv5LK34A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org) smtp.mailfrom=lst.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtK1s5yKWz2xTq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 17:29:52 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id CC3AE68BEB; Tue, 27 Aug 2024 09:29:46 +0200 (CEST)
Date: Tue, 27 Aug 2024 09:29:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
	Christoph Hellwig <hch@lst.de>,
	Christian Lamparter <christian.lamparter@isd.uni-stuttgart.de>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	Stan Johnson <userm57@yahoo.com>,
	Finn Thain <fthain@linux-m68k.org>
Subject: Re: [PATCH v2] powerpc: warn on emulation of dcbz instruction in
 kernel mode
Message-ID: <20240827072946.GB13080@lst.de>
References: <2e3acfe63d289c6fba366e16973c9ab8369e8b75.1631803922.git.christophe.leroy@csgroup.eu> <17fa6450-6613-4c34-804b-e47246e7b39c@isd.uni-stuttgart.de> <9dbf73fe-a459-4956-8dbc-e919d9728f5e@cs-soprasteria.com> <20240822053238.GA2028@lst.de> <e6acf664-5ebd-4273-9330-cbec283ede23@cs-soprasteria.com> <20240823130600.GI28254@gate.crashing.org> <20240823135459.GA28487@lst.de> <20240823191924.GK28254@gate.crashing.org> <c8127b03-245b-4eaa-98f5-6e14df094669@cs-soprasteria.com> <20240824171757.GL28254@gate.crashing.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240824171757.GL28254@gate.crashing.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sat, Aug 24, 2024 at 12:17:57PM -0500, Segher Boessenkool wrote:
> > Are these functions also used on DMA coherent memory ?
> 
> Most won't show up high on most profiles, heh.  Which you already
> can see from the problem not being attacked yet: if it was so obviously
> a problem, some people would have wanted to do something about it :-)

Most drivers try to avoid coherent allocations in the fast path if
they can.  Another good option for Christians problem would be
to switch the the dmaengine driver to use dma_alloc_pages - it doesn't
actually need uncached memory as far as I can, dma_alloc_coherent is
just the only API we had to allocate guaranteed DMAable memory for most
of Linux's existence.


