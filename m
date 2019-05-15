Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D931F515
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 15:10:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453vzm1LNXzDqQg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 23:10:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="NaTpMBcw"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453vxq3cHJzDqD3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 23:08:30 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CED420843;
 Wed, 15 May 2019 13:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557925708;
 bh=P/T1WxbT7QsT7n7T6kKsFUprJ4xg3X1OufDN3pOJn6s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NaTpMBcwvLyk0lxuChYO5NCNr6wrhTgRpvZ3Te9tvINP1yrMpr8UTn0dGzFkqQbPh
 dyIQga3BTA4d9o+md+t0r51V1Pj+KITYxqtB4BAnmeSHiUy0pFJqe13Iv2rRP47qHt
 wrrz+EgagCu310C8uIhsaCn2RElw6r2qgoVZDYmU=
Date: Wed, 15 May 2019 15:08:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH stable 4.9] powerpc/lib: fix book3s/32 boot failure due
 to code patching
Message-ID: <20190515130825.GA3794@kroah.com>
References: <629c2acb1fcd09c2d2e3352370c3d9853372cf39.1557902321.git.christophe.leroy@c-s.fr>
 <20190515082931.GA28349@kroah.com>
 <9e58348f-da2d-34bc-d016-7817b3566e01@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e58348f-da2d-34bc-d016-7817b3566e01@c-s.fr>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: erhard_f@mailbox.org, Michael Neuling <mikey@neuling.org>,
 linux-kernel@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 15, 2019 at 02:35:36PM +0200, Christophe Leroy wrote:
> 
> 
> Le 15/05/2019 à 10:29, Greg KH a écrit :
> > On Wed, May 15, 2019 at 06:40:47AM +0000, Christophe Leroy wrote:
> > > [Backport of upstream commit b45ba4a51cde29b2939365ef0c07ad34c8321789]
> > > 
> > > On powerpc32, patch_instruction() is called by apply_feature_fixups()
> > > which is called from early_init()
> > > 
> > > There is the following note in front of early_init():
> > >   * Note that the kernel may be running at an address which is different
> > >   * from the address that it was linked at, so we must use RELOC/PTRRELOC
> > >   * to access static data (including strings).  -- paulus
> > > 
> > > Therefore init_mem_is_free must be accessed with PTRRELOC()
> > > 
> > > Fixes: 1c38a84d4586 ("powerpc: Avoid code patching freed init sections")
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=203597
> > > Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> > > 
> > > ---
> > > Can't apply the upstream commit as such due to several other unrelated stuff
> > > like for instance STRICT_KERNEL_RWX which are missing.
> > > So instead, using same approach as for commit 252eb55816a6f69ef9464cad303cdb3326cdc61d
> > 
> > Now queued up, thanks.
> > 
> 
> Should go to 4.4 as well since the commit it fixes is now queued for 4.4
> ([PATCH 4.4 056/266] powerpc: Avoid code patching freed init sections)

Ok, can someone send me a backport that actually applies there?

thanks,

greg k-h
