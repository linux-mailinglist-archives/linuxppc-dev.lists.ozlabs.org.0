Return-Path: <linuxppc-dev+bounces-297-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7308E95ACE4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 07:32:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqBg10sSyz2yD5;
	Thu, 22 Aug 2024 15:32:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.95.11.211
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqBg023PRz2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 15:32:43 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 512C9227A8E; Thu, 22 Aug 2024 07:32:38 +0200 (CEST)
Date: Thu, 22 Aug 2024 07:32:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: Christian Lamparter <christian.lamparter@isd.uni-stuttgart.de>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	Stan Johnson <userm57@yahoo.com>,
	Finn Thain <fthain@linux-m68k.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2] powerpc: warn on emulation of dcbz instruction in
 kernel mode
Message-ID: <20240822053238.GA2028@lst.de>
References: <2e3acfe63d289c6fba366e16973c9ab8369e8b75.1631803922.git.christophe.leroy@csgroup.eu> <17fa6450-6613-4c34-804b-e47246e7b39c@isd.uni-stuttgart.de> <9dbf73fe-a459-4956-8dbc-e919d9728f5e@cs-soprasteria.com>
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
In-Reply-To: <9dbf73fe-a459-4956-8dbc-e919d9728f5e@cs-soprasteria.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Aug 22, 2024 at 05:25:10AM +0000, LEROY Christophe wrote:
> > and this results in a call to dma_direct_allocation(), which has one
> > innocent looking memset():
> 
> 
> memset() can't be used on non-cached memory, memset_io() has to be used
> instead.

No, we use memset on uncached memory all the time.  Note that uncached
memory != __iomem memory, for which you DO have to use memset_io.


