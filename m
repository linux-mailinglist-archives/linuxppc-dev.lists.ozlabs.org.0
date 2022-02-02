Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB004A6C13
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 08:06:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpXrs2dGZz3cNW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 18:06:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mVs87Bvy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=mVs87Bvy; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpXrC2Mmvz2yfh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 18:05:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 40F5BB820B3;
 Wed,  2 Feb 2022 07:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34AF7C340EC;
 Wed,  2 Feb 2022 07:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643785527;
 bh=coZm+4It0SjWaIfb3t2MkJl7FPFYDrkHgtvlecwJN5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mVs87BvyssNJyznmo0e3HSuwEwBXAzALSzWcRcNheffVRi6Kf1JR4ut64f5BwbxRL
 0zuRUCPC31fUxEJf1CRFr7nm141jlrxB6se24fPrLHYhFx58Np6AE78JgAbusQ6sTQ
 FIz2pChVjifI/SZQpkCdf9dRaQKsmn9pnzG5MIBI=
Date: Wed, 2 Feb 2022 08:05:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v7 0/5] Allow guest access to EFI confidential computing
 secret area
Message-ID: <YfotMyQiQ66xfCOQ@kroah.com>
References: <20220201124413.1093099-1-dovmurik@linux.ibm.com>
 <Yfk6vEuZFtgtA+G+@kroah.com>
 <37779659ca96ac9c1f11bcc0ac0665895c795b54.camel@linux.ibm.com>
 <20220202040157.GA8019@srcf.ucam.org> <YfogOurPZb7+Yelo@kroah.com>
 <20220202065443.GA9249@srcf.ucam.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202065443.GA9249@srcf.ucam.org>
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
Cc: linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 Lenny Szubowicz <lszubowi@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 gcwilson@linux.ibm.com, Ard Biesheuvel <ardb@kernel.org>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Andi Kleen <ak@linux.intel.com>,
 Nayna Jain <nayna@linux.ibm.com>, James Morris <jmorris@namei.org>,
 Dov Murik <dovmurik@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@suse.de>,
 "Serge E. Hallyn" <serge@hallyn.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Ashish Kalra <ashish.kalra@amd.com>, dougmill@linux.vnet.ibm.com,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, linux-coco@lists.linux.dev,
 gjoyce@ibm.com, dja@axtens.net, Dave Hansen <dave.hansen@intel.com>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Andrew Scull <ascull@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 02, 2022 at 06:54:43AM +0000, Matthew Garrett wrote:
> On Wed, Feb 02, 2022 at 07:10:02AM +0100, Greg KH wrote:
> > On Wed, Feb 02, 2022 at 04:01:57AM +0000, Matthew Garrett wrote:
> > > We're talking about things that have massively different semantics.
> > 
> > I see lots of different platforms trying to provide access to their
> > "secure" firmware data to userspace in different ways.  That feels to me
> > like they are the same thing that userspace would care about in a
> > unified way.
> 
> EFI variables are largely for the OS to provide information to the 
> firmware, while this patchset is to provide information from the 
> firmware to the OS. I don't see why we'd expect to use the same userland 
> tooling for both.

I totally agree, I'm not worried about EFI variables here, I don't know
why that came up.

> In the broader case - I don't think we *can* use the same userland
> tooling for everything. For example, the patches to add support for 
> manipulating the Power secure boot keys originally attempted to make it 
> look like efivars, but the underlying firmware semantics are 
> sufficiently different that even exposing the same kernel interface 
> wouldn't be a sufficient abstraction and userland would still need to 
> behave differently. Exposing an interface that looks consistent but 
> isn't is arguably worse for userland than exposing explicitly distinct 
> interfaces.

So what does userspace really need here?  Just the ability to find if
the platform has blobs that it cares about, and how to read/write them.

I see different platform patches trying to stick these blobs in
different locations and ways to access (securityfs, sysfs, char device
node), which seems crazy to me.  Why can't we at least pick one way to
access these to start with, and then have the filesystem layout be
platform-specific as needed, which will give the correct hints to
userspace as to what it needs to do here?

thanks,

greg k-h
