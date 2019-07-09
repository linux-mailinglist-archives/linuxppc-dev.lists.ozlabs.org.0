Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C3C63C63
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 22:04:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jtYx01WKzDqYt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 06:04:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="PpnMFYsh"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jtXB0K6PzDqBK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 06:02:33 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0499D2080C;
 Tue,  9 Jul 2019 20:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562702551;
 bh=3ujcdhvP8y1FxfDxwS7Ewl3LQij9HGitLlSZ+d74+mI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PpnMFYshe0qf9LevFM1qAKcJPpp72I997HDkYj+pKZzsm0L5EgmyjAlI+Ix+zfg4J
 GLvS6tEIUGfdhyvj2DxhaO+4oaIoZNZjlOrYG07m3Y0TypBHE26Yx2YkPf9AmcU253
 ucIqQLyZt1qU3gNzzVFaQEuEcwOjn6YMzwjHRozo=
Date: Tue, 9 Jul 2019 22:02:29 +0200
From: "'gregkh@linuxfoundation.org'" <gregkh@linuxfoundation.org>
To: Max Gurtovoy <maxg@mellanox.com>
Subject: Re: [PATCH 1/3] powerpc/powernv: remove the unused pnv_pci_set_p2p
 function
Message-ID: <20190709200229.GB22280@kroah.com>
References: <20190426124917.23789-2-hch@lst.de>
 <99c4c4a9-8a18-61ed-174a-9ffaec3d2e44@linux.ibm.com>
 <20190523075253.GA12946@lst.de>
 <AM0PR05MB5810FF3B4A45B3CA722489EEB6F10@AM0PR05MB5810.eurprd05.prod.outlook.com>
 <20190709135935.GA2511@lst.de>
 <ec1f8638-d97d-bfc7-23e1-9af555654562@mellanox.com>
 <20190709143251.GA3222@lst.de>
 <d9430488-e4ef-7d1f-6b74-c2b8158e4a59@mellanox.com>
 <20190709144049.GA3364@lst.de>
 <14dee448-94bc-aaea-3661-baa92ac8c2f8@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14dee448-94bc-aaea-3661-baa92ac8c2f8@mellanox.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Shlomi Nimrodi <shlomin@mellanox.com>, Paul Mackerras <paulus@samba.org>,
 Bodong Wang <bodong@mellanox.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Oren Duer <oren@mellanox.com>, Idan Werpoler <Idanw@mellanox.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 09, 2019 at 06:06:54PM +0300, Max Gurtovoy wrote:
> 
> On 7/9/2019 5:40 PM, Christoph Hellwig wrote:
> > On Tue, Jul 09, 2019 at 05:37:18PM +0300, Max Gurtovoy wrote:
> > > On 7/9/2019 5:32 PM, Christoph Hellwig wrote:
> > > > On Tue, Jul 09, 2019 at 05:31:37PM +0300, Max Gurtovoy wrote:
> > > > > Are we ok with working on a solution during kernel-5.3 cycle ?
> > > > You can start working on it any time, no need to ask for permission.
> > > I just want to make sure we don't remove it from the kernel before we send
> > > a general API solution.
> > The code is gone in this merge window.
> 
> Ok, so we must fix it to kernel-5.3 to make sure we're covered.
> 
> Understood.
> 
> > 
> > > This way we'll make sure that all the kernel versions has this
> > > functionality...
> > Again, we do not provide functionality for out of tree modules.  We've
> > had the p2p API for about a year now, its not like you didn't have
> > plenty of time.
> 
> I didn't know about the intention to remove this code...

The original email you responded to in this thread was received by you
back in May.  It is now July, 5.3 will not be out for 8-9 weeks.  There
has been plenty of time here...

greg k-h
