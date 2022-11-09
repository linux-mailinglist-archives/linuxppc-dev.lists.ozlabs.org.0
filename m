Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1608B622CB7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 14:47:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6mWG6J8rz3cXX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 00:47:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=yilDZTQV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=yilDZTQV;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6mVK6zyVz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 00:47:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AD487B81CD7;
	Wed,  9 Nov 2022 13:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FE1C433C1;
	Wed,  9 Nov 2022 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1668001619;
	bh=T8ZpCfeDrYRnXim+EtribWm92PpPSXe5RMsnfAotB4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yilDZTQVRk/dQ6ZjPzjqvsk7gjmJ/ywI9HPUjKi20aCPrjgXYmUwjckntNGsnqPeV
	 OVgTzAcVyN1BnZ3Ofu/6wLcRP7+Msh6bQ75oLO7maLPj9bNjjKgnASzOY7FMZb/WBo
	 ziaNbBLpVAhRioTwS6CD7/5TLkPzIquE2AJTNFDI=
Date: Wed, 9 Nov 2022 14:46:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nayna Jain <nayna@linux.ibm.com>
Subject: Re: [PATCH 2/4] fs: define a firmware security filesystem named
 fwsecurityfs
Message-ID: <Y2uvUFQ9S2oaefSY@kroah.com>
References: <20221106210744.603240-1-nayna@linux.ibm.com>
 <20221106210744.603240-3-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221106210744.603240-3-nayna@linux.ibm.com>
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
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, linux-efi@vger.kernel.org, Andrew Donnellan <ajd@linux.ibm.com>, linux-kernel@vger.kernel.org, npiggin@gmail.com, Dov Murik <dovmurik@linux.ibm.com>, Dave Hansen <dave.hansen@intel.com>, linux-security-module <linux-security-module@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linux-fsdevel@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 06, 2022 at 04:07:42PM -0500, Nayna Jain wrote:
> securityfs is meant for Linux security subsystems to expose policies/logs
> or any other information. However, there are various firmware security
> features which expose their variables for user management via the kernel.
> There is currently no single place to expose these variables. Different
> platforms use sysfs/platform specific filesystem(efivarfs)/securityfs
> interface as they find it appropriate. Thus, there is a gap in kernel
> interfaces to expose variables for security features.
> 
> Define a firmware security filesystem (fwsecurityfs) to be used by
> security features enabled by the firmware. These variables are platform
> specific. This filesystem provides platforms a way to implement their
>  own underlying semantics by defining own inode and file operations.
> 
> Similar to securityfs, the firmware security filesystem is recommended
> to be exposed on a well known mount point /sys/firmware/security.
> Platforms can define their own directory or file structure under this path.
> 
> Example:
> 
> # mount -t fwsecurityfs fwsecurityfs /sys/firmware/security

Why not juset use securityfs in /sys/security/firmware/ instead?  Then
you don't have to create a new filesystem and convince userspace to
mount it in a specific location?

thanks,

greg k-h
