Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF322562CDD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 09:42:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZ6cH52Nvz2yh9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 17:42:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=T+j4uFEM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=T+j4uFEM;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZ6bd1W7Kz3bsy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 17:42:03 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF08E62492;
	Fri,  1 Jul 2022 07:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3AFC3411E;
	Fri,  1 Jul 2022 07:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656661319;
	bh=HZrNIKNTW/tWeEz+OIJTTEr2M6NHVQaxjmpqR/0N95I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+j4uFEMnBrHe5TMnLonc7z2KICIlGfuOKDyGOIPBQGqrpdpUfcWR/nOBnUp2DA8B
	 /fkvewYwjfwkajGpVw+9XFy8t5rN2ncOq6houSKYl2Udvq9Sx0mrhVB+BcknUAfuZm
	 BPrr+KSGehaLBenY4mug8dPWhkkr1pAx7t8AcD/w=
Date: Fri, 1 Jul 2022 09:41:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH] cxl: drop unexpected word "the" in the comments
Message-ID: <Yr6lRMxtX5LVdjwZ@kroah.com>
References: <20220621125321.122280-1-jiangjian@cdjrlc.com>
 <165650492410.3004956.4938254521446368740.b4-ty@ellerman.id.au>
 <fbc5d92a4028349aea0d89232db4795fb189ced4.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbc5d92a4028349aea0d89232db4795fb189ced4.camel@linux.ibm.com>
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
Cc: arnd@arndb.de, Michael Ellerman <patch-notifications@ellerman.id.au>, linux-kernel@vger.kernel.org, Jiang Jian <jiangjian@cdjrlc.com>, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 30, 2022 at 11:10:13AM +1000, Andrew Donnellan wrote:
> On Wed, 2022-06-29 at 22:15 +1000, Michael Ellerman wrote:
> > On Tue, 21 Jun 2022 20:53:21 +0800, Jiang Jian wrote:
> > > there is an unexpected word "the" in the comments that need to be
> > > dropped
> > > 
> > > file: drivers/misc/cxl/cxl.h
> > > line: 1107
> > > +/* check if the given pci_dev is on the the cxl vphb bus */
> > > changed to
> > > +/* check if the given pci_dev is on the cxl vphb bus */
> > > 
> > > [...]
> > 
> > Applied to powerpc/next.
> > 
> > [1/1] cxl: drop unexpected word "the" in the comments
> >      
> > https://git.kernel.org/powerpc/c/882c835b71e22ca82361dab3b60b85b557abd72f
> 
> I believe Greg's already merged this in char-misc...

git can handle merges like this without any problems :)
