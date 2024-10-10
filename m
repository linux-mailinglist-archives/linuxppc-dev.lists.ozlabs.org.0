Return-Path: <linuxppc-dev+bounces-1957-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6347E997EB3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 10:09:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPMqL6CQNz3bjr;
	Thu, 10 Oct 2024 19:09:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728547774;
	cv=none; b=Cq93KRlPoaJXJVNefm/ow5AzkbiFATyCy2/6Sb/CBeBHFgGPbANQleXDLQhCW6fbOp2f6bhyZ7+Vbe/QxAOUQ+FKiWBH2a3M/oFSRQuC9UoIOJ+mykcCEooSHnRa8OsDdg1FzyD2MPgxDid4j7JMNtMGeRBIQSePdQXS5xVPPI1HIhxi51sjD3vqYek0ppqLCr4xJBl12dQFrnwdAWRjvHIf65GFrb5AglGLVkSNUEGUCOfy2aEsoqlL1OPY9xbj/MpFbP2yJ0KDgvLlfD8yMMplQzMrNM/ypGVOz9Xa0CMYUmo8YlyWVHldmyhd2dWrgW5EvyobFbW4JcpIZy9O6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728547774; c=relaxed/relaxed;
	bh=/Wdhm/OhspdybktDkLShz5H7mKJqJW65PYYsUNa0shI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4IWirutEBhRWqp+Ic47ETpPAAqMOYYJX3QpygHX+aYMotcETQr4FM79q6lDmy2By5Q7LkIFjT6E2qmcop2yS6ZZgXDG45UC5GrZ35aEKocrfJibCm+gX55qALMIAB+sFu3AkU5NuCu9c83rgr1LnpY8O8HRu8mwG8uDF6vCI9npZmRtsnVaDkK6t+DIjuRiFhJiM2b1xWJz4i80x7tI3d5VyA8uP7qrPqU5XE5ceUMXeoSnpECCqUPkTadtYKa7JRrivfHTfQ/qxed+r9LTGGjU4WVR87rTOOqLtvL36tcy9JDkXK21Ivo6QaseslMbamAZ7KD1KYA4FCnoIGu+dA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org) smtp.mailfrom=lst.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPMqK1s90z3bgQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 19:09:32 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
	id D079C227A8E; Thu, 10 Oct 2024 10:09:27 +0200 (CEST)
Date: Thu, 10 Oct 2024 10:09:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
	brauner@kernel.org, sfr@canb.auug.org.au
Subject: Re: [linux-next][20241004]BUG: KFENCE: memory corruption in
 xfs_iext_remove+0x288/0x2c8 [xfs]
Message-ID: <20241010080927.GA7980@lst.de>
References: <ae6217b4-7b62-4722-9afe-f8379201cc9e@linux.vnet.ibm.com> <20241008063307.GA22312@lst.de>
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
In-Reply-To: <20241008063307.GA22312@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 08, 2024 at 08:33:07AM +0200, Christoph Hellwig wrote:
> On Mon, Oct 07, 2024 at 07:34:18PM +0530, Venkat Rao Bagalkote wrote:
> > Greetings!!!
> >
> >
> > Observing Kfence errors, while running fsstress test on Power PC platform
> 
> Is this new or is this the first time you run kfence?  Any chance you
> could bisect it?

FYI, Marco Elver ever pointed out that this was an issue with kfence vs
krealloc and the offending changes have been dropped from linux-next.

