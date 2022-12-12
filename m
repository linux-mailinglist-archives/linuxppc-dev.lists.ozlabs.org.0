Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EA96498E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 07:12:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NVrs53pMHz3bh8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 17:12:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=WM0p9cjR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=WM0p9cjR;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NVrr906Lcz2xKX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 17:12:07 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 808ACB80B76;
	Mon, 12 Dec 2022 06:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0E0C433EF;
	Mon, 12 Dec 2022 06:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670825522;
	bh=HNQ+jgM7nK49r0QXRAxcWzevnlOGKXqz3QgiETxRhHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WM0p9cjRA54uIuhCbl3bNcjmtBqXqjXOC3mdqoTPMfXNGFGVY+p2LjDHubsqAvGNB
	 dtfxv2dYaZK0bzf5t8f37JjGjSbnHHD6vnwMO8yrTT4w13cgZukg1Dg/Y2fB2b3TAR
	 5LSj2GE832dWK6oLrVDYpmOMou+L9g4VWVxl5Pls=
Date: Mon, 12 Dec 2022 07:11:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH 2/4] fs: define a firmware security filesystem named
 fwsecurityfs
Message-ID: <Y5bGLuTAARW+T1Lm@kroah.com>
References: <20221106210744.603240-1-nayna@linux.ibm.com>
 <20221106210744.603240-3-nayna@linux.ibm.com>
 <Y2uvUFQ9S2oaefSY@kroah.com>
 <8447a726-c45d-8ebb-2a74-a4d759631e64@linux.vnet.ibm.com>
 <20221119114234.nnfxsqx4zxiku2h6@riteshh-domain>
 <d3e8df29-d9b0-5e8e-4a53-d191762fe7f2@linux.vnet.ibm.com>
 <a2752fdf-c89f-6f57-956e-ad035d32aec6@linux.vnet.ibm.com>
 <Y35C9O27J29bUDjA@kroah.com>
 <6f2a4a5f-ab5b-8c1b-47d5-d4e6dca5fc3a@linux.vnet.ibm.com>
 <deda857ccc949f920ae3b7eca753d41b76acceda.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <deda857ccc949f920ae3b7eca753d41b76acceda.camel@linux.ibm.com>
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
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, linux-efi@vger.kernel.org, Nayna <nayna@linux.vnet.ibm.com>, Nayna Jain <nayna@linux.ibm.com>, "Ritesh Harjani \(IBM\)" <ritesh.list@gmail.com>, linux-kernel@vger.kernel.org, npiggin@gmail.com, Dov Murik <dovmurik@linux.ibm.com>, Dave Hansen <dave.hansen@intel.com>, linux-security-module <linux-security-module@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linux-fsdevel@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "Serge E. Hallyn" <serge@hallyn.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 12, 2022 at 11:58:56AM +1100, Andrew Donnellan wrote:
> On Wed, 2022-11-23 at 13:57 -0500, Nayna wrote:
> > 
> > Given there are no other exploiters for fwsecurityfs and there should
> > be 
> > no platform-specific fs, would modifying sysfs now to let userspace 
> > create files cleanly be the way forward? Or, if we should strongly 
> > consider securityfs, which would result in updating securityfs to
> > allow 
> > userspace creation of files and then expose variables via a more 
> > platform-specific directory /sys/kernel/security/pks? We want to pick
> > the best available option and would find some hints on direction
> > helpful 
> > before we develop the next patch.
> 
> Ping - it would be helpful for us to know your thoughts on this.

sysfs is not for userspace creation of files, you all know this :)

greg k-h
