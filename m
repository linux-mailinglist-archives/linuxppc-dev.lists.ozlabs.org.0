Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 697A5E1C4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 14:02:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t3DQ605rzDqRG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 22:01:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=newverein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t3By0D2BzDq9D
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 22:00:40 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 27F0068AFE; Mon, 29 Apr 2019 14:00:21 +0200 (CEST)
Date: Mon, 29 Apr 2019 14:00:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: remove the __kernel_io_end export
Message-ID: <20190429120020.GA30669@lst.de>
References: <20190429115241.12621-1-hch@lst.de>
 <20190429115706.GO8599@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429115706.GO8599@gate.crashing.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 29, 2019 at 06:57:06AM -0500, Segher Boessenkool wrote:
> On Mon, Apr 29, 2019 at 06:52:41AM -0500, Christoph Hellwig wrote:
> > This export was added in this merge window, but without any actual
> > user, or justification for a modular user.
> 
> Hi Christoph,
> 
> > -unsigned long __kernel_io_end;
> >  EXPORT_SYMBOL(__kernel_io_end);
> 
> Does that work?  Don't you need to remove that second line, as well?

Actually just the second line.  That's what you get for hacking things
up on the plane just before falling asleep, sigh..
