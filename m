Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB6B63152A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Nov 2022 17:24:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFbT75Ynxz3dtw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 03:24:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=aIVe/EjL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=aIVe/EjL;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFbS911Vqz2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 03:23:51 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 73C6B60BBA;
	Sun, 20 Nov 2022 16:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CF3C433D6;
	Sun, 20 Nov 2022 16:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1668961427;
	bh=VEJFrHA3qn6Rwg4Teu5pGnSV2TQDYMG+LACbP7i1H4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aIVe/EjLxTjJRpEYUbRy4/jlY4n20uQ/Ks7yVzv7byfrCKj1SxALQR5AviL9TGWNM
	 Qs7NhTH5XJ2DOcNN2yPVnkMXYA8Cem1IjKH1LO9B0FogH8mclb99sNBwl9YMjAiikX
	 ZIjmCDCv4H78R91ZVIeWE4TauaBx9CA+FR0cv9jg=
Date: Sun, 20 Nov 2022 17:13:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nayna <nayna@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/4] fs: define a firmware security filesystem named
 fwsecurityfs
Message-ID: <Y3pSF2MRIXd6aH14@kroah.com>
References: <20221106210744.603240-1-nayna@linux.ibm.com>
 <20221106210744.603240-3-nayna@linux.ibm.com>
 <Y2uvUFQ9S2oaefSY@kroah.com>
 <8447a726-c45d-8ebb-2a74-a4d759631e64@linux.vnet.ibm.com>
 <Y2zLRw/TzV/sWgqO@kroah.com>
 <44191f02-7360-bca3-be8f-7809c1562e68@linux.vnet.ibm.com>
 <Y3anQukokMcQr+iE@kroah.com>
 <d615180d-6fe5-d977-da6a-e88fd8bf5345@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d615180d-6fe5-d977-da6a-e88fd8bf5345@linux.vnet.ibm.com>
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

On Sat, Nov 19, 2022 at 01:20:09AM -0500, Nayna wrote:
> 
> On 11/17/22 16:27, Greg Kroah-Hartman wrote:
> > On Mon, Nov 14, 2022 at 06:03:43PM -0500, Nayna wrote:
> > > On 11/10/22 04:58, Greg Kroah-Hartman wrote:
> > > > On Wed, Nov 09, 2022 at 03:10:37PM -0500, Nayna wrote:
> > > > > On 11/9/22 08:46, Greg Kroah-Hartman wrote:
> > > > > > On Sun, Nov 06, 2022 at 04:07:42PM -0500, Nayna Jain wrote:
> > > > > > > securityfs is meant for Linux security subsystems to expose policies/logs
> > > > > > > or any other information. However, there are various firmware security
> > > > > > > features which expose their variables for user management via the kernel.
> > > > > > > There is currently no single place to expose these variables. Different
> > > > > > > platforms use sysfs/platform specific filesystem(efivarfs)/securityfs
> > > > > > > interface as they find it appropriate. Thus, there is a gap in kernel
> > > > > > > interfaces to expose variables for security features.
> > > > > > > 
> > > > > > > Define a firmware security filesystem (fwsecurityfs) to be used by
> > > > > > > security features enabled by the firmware. These variables are platform
> > > > > > > specific. This filesystem provides platforms a way to implement their
> > > > > > >     own underlying semantics by defining own inode and file operations.
> > > > > > > 
> > > > > > > Similar to securityfs, the firmware security filesystem is recommended
> > > > > > > to be exposed on a well known mount point /sys/firmware/security.
> > > > > > > Platforms can define their own directory or file structure under this path.
> > > > > > > 
> > > > > > > Example:
> > > > > > > 
> > > > > > > # mount -t fwsecurityfs fwsecurityfs /sys/firmware/security
> > > > > > Why not juset use securityfs in /sys/security/firmware/ instead?  Then
> > > > > > you don't have to create a new filesystem and convince userspace to
> > > > > > mount it in a specific location?
> > > > >   From man 5 sysfs page:
> > > > > 
> > > > > /sys/firmware: This subdirectory contains interfaces for viewing and
> > > > > manipulating firmware-specific objects and attributes.
> > > > > 
> > > > > /sys/kernel: This subdirectory contains various files and subdirectories
> > > > > that provide information about the running kernel.
> > > > > 
> > > > > The security variables which are being exposed via fwsecurityfs are managed
> > > > > by firmware, stored in firmware managed space and also often consumed by
> > > > > firmware for enabling various security features.
> > > > Ok, then just use the normal sysfs interface for /sys/firmware, why do
> > > > you need a whole new filesystem type?
> > > > 
> > > > >   From git commit b67dbf9d4c1987c370fd18fdc4cf9d8aaea604c2, the purpose of
> > > > > securityfs(/sys/kernel/security) is to provide a common place for all kernel
> > > > > LSMs. The idea of
> > > > > fwsecurityfs(/sys/firmware/security) is to similarly provide a common place
> > > > > for all firmware security objects.
> > > > > 
> > > > > /sys/firmware already exists. The patch now defines a new /security
> > > > > directory in it for firmware security features. Using /sys/kernel/security
> > > > > would mean scattering firmware objects in multiple places and confusing the
> > > > > purpose of /sys/kernel and /sys/firmware.
> > > > sysfs is confusing already, no problem with making it more confusing :)
> > > > 
> > > > Just document where you add things and all should be fine.
> > > > 
> > > > > Even though fwsecurityfs code is based on securityfs, since the two
> > > > > filesystems expose different types of objects and have different
> > > > > requirements, there are distinctions:
> > > > > 
> > > > > 1. fwsecurityfs lets users create files in userspace, securityfs only allows
> > > > > kernel subsystems to create files.
> > > > Wait, why would a user ever create a file in this filesystem?  If you
> > > > need that, why not use configfs?  That's what that is for, right?
> > > The purpose of fwsecurityfs is not to expose configuration items but rather
> > > security objects used for firmware security features. I think these are more
> > > comparable to EFI variables, which are exposed via an EFI-specific
> > > filesystem, efivarfs, rather than configfs.
> > > 
> > > > > 2. firmware and kernel objects may have different requirements. For example,
> > > > > consideration of namespacing. As per my understanding, namespacing is
> > > > > applied to kernel resources and not firmware resources. That's why it makes
> > > > > sense to add support for namespacing in securityfs, but we concluded that
> > > > > fwsecurityfs currently doesn't need it. Another but similar example of it
> > > > > is: TPM space, which is exposed from hardware. For containers, the TPM would
> > > > > be made as virtual/software TPM. Similarly for firmware space for
> > > > > containers, it would have to be something virtualized/software version of
> > > > > it.
> > > > I do not understand, sorry.  What does namespaces have to do with this?
> > > > sysfs can already handle namespaces just fine, why not use that?
> > > Firmware objects are not namespaced. I mentioned it here as an example of
> > > the difference between firmware and kernel objects. It is also in response
> > > to the feedback from James Bottomley in RFC v2 [https://lore.kernel.org/linuxppc-dev/41ca51e8db9907d9060cc38adb59a66dcae4c59b.camel@HansenPartnership.com/].
> > I do not understand, sorry.  Do you want to use a namespace for these or
> > not?  The code does not seem to be using namespaces.  You can use sysfs
> > with, or without, a namespace so I don't understand the issue here.
> > 
> > With your code, there is no namespace.
> 
> You are correct. There's no namespace for these.

So again, I do not understand.  Do you want to use filesystem
namespaces, or do you not?

How again can you not use sysfs or securityfs due to namespaces?  What
is missing?

confused,

greg k-h
