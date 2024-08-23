Return-Path: <linuxppc-dev+bounces-425-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDA195C76A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:07:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt3Q0hCfz2yvl;
	Fri, 23 Aug 2024 18:07:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400466;
	cv=none; b=Ns8aRvOtgrV5ZYxz8bT2mcTOYfg+fEpJrOKKaoMr4wE8bPjvZNvQQ7Q7QmVHUBrzNbjVdYKaA/K+DRj6flvxsYKXSf93rJZeiZK2S7leYCatX0yu0afGy5JpGUFCTFobvaTyrY5WbVHwlevP6+ZF6K+DEfJiN8GNweamACFw7kEM/6K1wgmvfRMhAmRCCUfD8jh484lsWKYIsLL6G1/Xx85T5K84KIyDSiJPariWuqOsHxD5qnNIPRnfpAJNi5pT/cEgfaJ0hJhpEFgj2HqWpwuFAE9n4upMZFd/eQV78PJzdNt2/l0YxpVUWABi/TYXcG/d+XILsxZNLlsKKCT/iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400466; c=relaxed/relaxed;
	bh=JC+8hrd5RHFB82X4ipOQZrVZk07qB3aeToFBl8f08Uo=;
	h=Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent; b=Vt9l51zzOFB3BHidNA6TDAE0VlHtJJN9uNv2oTlkIHoBXK3oAFlQKcYeEk5v0IIBfXDSBpGRc1/imqNzK1j0MQtdSwU1+gY3DwzoqGyCQMY1XXm6/LfkCTjY9+UrIO2indiKeOhuxp+Y6822b+ofbjpPLXPyeCfaeC6Z+vbW27DUMgM2HfL/cNtiMOTz4XxNdRYgDNR2SanXeeewGbFrdYwpg5ojh7zIqPNLOQ1fRydu8o6z2LaM+gJWn+Cszxwz7asMIfYVc8iZIOrghrTu+66s0Q3LHI1LnilDwGqoeNEYUPGIemudvfu0OEqeIONVSb7umAfRrWYEc3xwSjXUzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org) smtp.mailfrom=lst.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt3P1ltjz2yn1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:07:44 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9C3F9227A87; Fri, 23 Aug 2024 10:07:36 +0200 (CEST)
Date: Fri, 23 Aug 2024 10:07:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>,
	LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	Stan Johnson <userm57@yahoo.com>,
	Finn Thain <fthain@linux-m68k.org>, Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH v2] powerpc: warn on emulation of dcbz instruction in
 kernel mode
Message-ID: <20240823080736.GA3068@lst.de>
References: <2e3acfe63d289c6fba366e16973c9ab8369e8b75.1631803922.git.christophe.leroy@csgroup.eu> <17fa6450-6613-4c34-804b-e47246e7b39c@isd.uni-stuttgart.de> <9dbf73fe-a459-4956-8dbc-e919d9728f5e@cs-soprasteria.com> <20240822053238.GA2028@lst.de> <e6acf664-5ebd-4273-9330-cbec283ede23@cs-soprasteria.com> <20240822071443.GA6395@lst.de> <b039012c-1b04-40cb-a760-b1ef942fe23c@gmail.com>
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
In-Reply-To: <b039012c-1b04-40cb-a760-b1ef942fe23c@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

dma_alloc_from_pool is the allocator used when the caller can't
sleep, and as that is reusing memory it really has to call memset
or a memset-like function on the already uncached memory
unfortunately.  The dma engine operation that is doing this allocation
is documented as not being able to sleep, which is a bit unfortunate
as the storage driver above it could sleep just fine.

Adding the dmaengine maintainer and list if there is a way to pass a gfp
flag or some other indicator that the implementations can sleep,
which would avoid the need to use the not very scalable dma pool,
and thus also the need to memset on uncached memory.


