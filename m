Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9AA623F35
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 10:59:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7HP81wgvz3cMk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 20:59:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mssVAwTH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mssVAwTH;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7HNF31Kdz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 20:58:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D073560F24;
	Thu, 10 Nov 2022 09:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D42C433D6;
	Thu, 10 Nov 2022 09:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1668074314;
	bh=uQP61uclN3zCWah8qsWvxZZSqrhGlBrNT5+d73E+sQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mssVAwTHgv+HEYcjKI3fif9O9Wm+CZMiRtN3WoqN6cz+qpWZmAEjJWFzNuqP9eyQk
	 AoBpsJ18jUW7Bc1tLmje/fVWWsHy5kIB6SURwqZnHp8j+uLMIKZztZSt8H84FI5ElO
	 GwpRSAAooDgfWc0/4ZRmqyBxs/8Gf2fxFTh9SjPc=
Date: Thu, 10 Nov 2022 10:58:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nayna <nayna@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/4] fs: define a firmware security filesystem named
 fwsecurityfs
Message-ID: <Y2zLRw/TzV/sWgqO@kroah.com>
References: <20221106210744.603240-1-nayna@linux.ibm.com>
 <20221106210744.603240-3-nayna@linux.ibm.com>
 <Y2uvUFQ9S2oaefSY@kroah.com>
 <8447a726-c45d-8ebb-2a74-a4d759631e64@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8447a726-c45d-8ebb-2a74-a4d759631e64@linux.vnet.ibm.com>
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
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, linux-efi@vger.kernel.org, Andrew Donnellan <ajd@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org, npiggin@gmail.com, Dov Murik <dovmurik@linux.ibm.com>, Dave Hansen <dave.hansen@intel.com>, linux-security-module <linux-security-module@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linux-fsdevel@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 09, 2022 at 03:10:37PM -0500, Nayna wrote:
> 
> On 11/9/22 08:46, Greg Kroah-Hartman wrote:
> > On Sun, Nov 06, 2022 at 04:07:42PM -0500, Nayna Jain wrote:
> > > securityfs is meant for Linux security subsystems to expose policies/logs
> > > or any other information. However, there are various firmware security
> > > features which expose their variables for user management via the kernel.
> > > There is currently no single place to expose these variables. Different
> > > platforms use sysfs/platform specific filesystem(efivarfs)/securityfs
> > > interface as they find it appropriate. Thus, there is a gap in kernel
> > > interfaces to expose variables for security features.
> > > 
> > > Define a firmware security filesystem (fwsecurityfs) to be used by
> > > security features enabled by the firmware. These variables are platform
> > > specific. This filesystem provides platforms a way to implement their
> > >   own underlying semantics by defining own inode and file operations.
> > > 
> > > Similar to securityfs, the firmware security filesystem is recommended
> > > to be exposed on a well known mount point /sys/firmware/security.
> > > Platforms can define their own directory or file structure under this path.
> > > 
> > > Example:
> > > 
> > > # mount -t fwsecurityfs fwsecurityfs /sys/firmware/security
> > Why not juset use securityfs in /sys/security/firmware/ instead?  Then
> > you don't have to create a new filesystem and convince userspace to
> > mount it in a specific location?
> 
> From man 5 sysfs page:
> 
> /sys/firmware: This subdirectory contains interfaces for viewing and
> manipulating firmware-specific objects and attributes.
> 
> /sys/kernel: This subdirectory contains various files and subdirectories
> that provide information about the running kernel.
> 
> The security variables which are being exposed via fwsecurityfs are managed
> by firmware, stored in firmware managed space and also often consumed by
> firmware for enabling various security features.

Ok, then just use the normal sysfs interface for /sys/firmware, why do
you need a whole new filesystem type?

> From git commit b67dbf9d4c1987c370fd18fdc4cf9d8aaea604c2, the purpose of
> securityfs(/sys/kernel/security) is to provide a common place for all kernel
> LSMs. The idea of
> fwsecurityfs(/sys/firmware/security) is to similarly provide a common place
> for all firmware security objects.
> 
> /sys/firmware already exists. The patch now defines a new /security
> directory in it for firmware security features. Using /sys/kernel/security
> would mean scattering firmware objects in multiple places and confusing the
> purpose of /sys/kernel and /sys/firmware.

sysfs is confusing already, no problem with making it more confusing :)

Just document where you add things and all should be fine.

> Even though fwsecurityfs code is based on securityfs, since the two
> filesystems expose different types of objects and have different
> requirements, there are distinctions:
> 
> 1. fwsecurityfs lets users create files in userspace, securityfs only allows
> kernel subsystems to create files.

Wait, why would a user ever create a file in this filesystem?  If you
need that, why not use configfs?  That's what that is for, right?

> 2. firmware and kernel objects may have different requirements. For example,
> consideration of namespacing. As per my understanding, namespacing is
> applied to kernel resources and not firmware resources. That's why it makes
> sense to add support for namespacing in securityfs, but we concluded that
> fwsecurityfs currently doesn't need it. Another but similar example of it
> is: TPM space, which is exposed from hardware. For containers, the TPM would
> be made as virtual/software TPM. Similarly for firmware space for
> containers, it would have to be something virtualized/software version of
> it.

I do not understand, sorry.  What does namespaces have to do with this?
sysfs can already handle namespaces just fine, why not use that?

> 3. firmware objects are persistent and read at boot time by interaction with
> firmware, unlike kernel objects which are not persistent.

That doesn't matter, sysfs exports what the hardware provides, and that
might persist over boot.

So I don't see why a new filesystem is needed.

You didn't explain why sysfs, or securitfs (except for the location in
the tree) does not work at all for your needs.  The location really
doesn't matter all that much as you are creating a brand new location
anyway so we can just declare "this is where this stuff goes" and be ok.

And again, how are you going to get all Linux distros to now mount your
new filesystem?

thanks,

greg k-h
