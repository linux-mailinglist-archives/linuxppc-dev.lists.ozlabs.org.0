Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E02496A9D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 08:30:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jgnvk70YSz3cN4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 18:30:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pI1ceGoV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=pI1ceGoV; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jgnv35JS9z2ynt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 18:29:34 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 862CE60906;
 Sat, 22 Jan 2022 07:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2B9C004E1;
 Sat, 22 Jan 2022 07:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1642836570;
 bh=cMWRKsI8TI2NHT84jTQS/VsDVS8oI5QJbf0MXIj7kt0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pI1ceGoVu3CvLVt/6heTjt81u7y+XDx/Uw6BOOSObPJW4WPvVtM5NhbPo6poe2GPQ
 tdZKznbXRQN+CEn4N451Wc8DtVhEyKoAlz4/PwX2FXWc6KDagqwQgHn9TU7nRGlxrr
 UIb/aGYJKpTrwLWT6QFH4a5O2fl+WFVq49KXzpCM=
Date: Sat, 22 Jan 2022 08:29:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nayna Jain <nayna@linux.ibm.com>
Subject: Re: [RFC PATCH 0/2] powerpc/pseries: add support for local secure
 storage called Platform Keystore(PKS)
Message-ID: <YeuyUVVdFADCuDr4@kroah.com>
References: <20220122005637.28199-1-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220122005637.28199-1-nayna@linux.ibm.com>
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
Cc: linux-kernel@vger.kernel.org, Douglas Miller <dougmill@linux.vnet.ibm.com>,
 George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 gjoyce@ibm.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 21, 2022 at 07:56:35PM -0500, Nayna Jain wrote:
> PowerVM provides an isolated Platform Keystore(PKS) storage allocation
> for each partition with individually managed access controls to store
> sensitive information securely. Linux Kernel can access this storage by
> interfacing with hypervisor using a new set of hypervisor calls. 
> 
> PowerVM guest secure boot intend to use Platform Keystore for the
> purpose of storing public keys. Secure boot requires public keys to
> be able to verify the grub and boot kernel. To allow authenticated
>  manipulation of keys, it supports variables to store key authorities
> - PK/KEK and code signing keys - db. It also supports denied list to
> disallow booting even if signed with valid key. This is done via
> denied list database - dbx or sbat. These variables would be stored in
> PKS, and are managed and controlled by firmware.
> 
> The purpose of this patchset is to add support for users to
> read/write/add/delete variables required for secure boot on PowerVM.

Ok, this is like the 3rd or 4th different platform-specific proposal for
this type of functionality.  I think we need to give up on
platform-specific user/kernel apis on this (random sysfs/securityfs
files scattered around the tree), and come up with a standard place for
all of this.

Please work with the other developers of the other drivers for this to
make this unified so that userspace has a chance to use this in a sane
manner.

thanks,

greg k-h
