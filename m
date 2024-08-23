Return-Path: <linuxppc-dev+bounces-461-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C7295CE76
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 15:55:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr1mB5qgSz2yxY;
	Fri, 23 Aug 2024 23:55:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724421306;
	cv=none; b=HpjU3TsftGIeafPY/0Idsph5P4f1i5lqAGD0HvZGRWcTG+W9wi7npHDFctsftAX1V2t5topMr0NlviXpqJ9MtOi4GrcsW1xXIV192+QjW+qBN7Dym4d4ArjHiidMM7oDbAdFxuRgbA+oQmZ5VFNaZVKgL+62gIuBs5uyzIsC2RUvC6Irl9hHONZHjhgLGCEbKuuEW3v7fp7m/JM2qCsV9UvLsBis6y9V3q+7awwFiOPgjfoxjHlElxXeY3w67XdfzQ7ojCXaTt7UFrscSvnYlUMBafD1E8ynqnb1QwmhQvX6vLC/xuk+78lxkFGzjykw7apuMwXABNOFA88wgvyP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724421306; c=relaxed/relaxed;
	bh=VzutM+f8nAE25t7ABCoTLpEanQaSGd0+coex3CQCaO8=;
	h=Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent; b=n0N4syqoSrevWvaLVOfWC60l9rXgC/ndWReQN31mM08YAfm5yriL6FAALehgoLc0+KykVYmiA4rBQh+wXCJ9sMlNgWMBaLpchMGri2gHSwoLRn9yLqWJhhL99r+A+Wwq2ychDdyp9Ac170/9tGN4v2skf2kX/MHMGZbgv25qkisaTWkXovnRapd7ZKdKzURKioiPMzisTYLVhU8kZJx2jC3GUrWxdEna/lb256DhF8cURKXab4fVBGFKSQFs3swKTp/c8BjKpkwRaRmmEjmn6R8MuCmskSU0LlKFT5CJOzDK2lZggEHQmrXUQgvvkwrysqAxLQMJB0aCox7hropnVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org) smtp.mailfrom=lst.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr1m96KThz2yw3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 23:55:04 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 75626227A87; Fri, 23 Aug 2024 15:54:59 +0200 (CEST)
Date: Fri, 23 Aug 2024 15:54:59 +0200
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
Message-ID: <20240823135459.GA28487@lst.de>
References: <2e3acfe63d289c6fba366e16973c9ab8369e8b75.1631803922.git.christophe.leroy@csgroup.eu> <17fa6450-6613-4c34-804b-e47246e7b39c@isd.uni-stuttgart.de> <9dbf73fe-a459-4956-8dbc-e919d9728f5e@cs-soprasteria.com> <20240822053238.GA2028@lst.de> <e6acf664-5ebd-4273-9330-cbec283ede23@cs-soprasteria.com> <20240823130600.GI28254@gate.crashing.org>
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
In-Reply-To: <20240823130600.GI28254@gate.crashing.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Aug 23, 2024 at 08:06:00AM -0500, Segher Boessenkool wrote:
> What does "uncached memory" even mean here?  Literally it would be
> I=1 memory (uncachEABLE memory), but more likely you want M=0 memory
> here ("non-memory memory", "not well-behaved memory", MMIO often).

Regular kernel memory vmapped with pgprot_noncached().

> If memset() is expected to be used with M=0, you cannot do any serious
> optimisations to it at all.  If memset() is expected to be used with I=1
> it should use a separate code path for it, probably the caller should
> make the distinction.

DMA coherent memory which uses uncached memory for platforms that
do not provide hardware dma coherence can end up just about anywhere
in the kernel.  We could use special routines for a few places in
the DMA subsystem, but there might be plenty of others.


