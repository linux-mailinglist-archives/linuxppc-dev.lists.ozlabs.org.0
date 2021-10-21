Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 128324368A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 19:03:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZv2f3LwWz3cH0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 04:03:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xyyonz57;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Xyyonz57; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZv214fSBz2xtS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 04:03:21 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A62BE60EE2;
 Thu, 21 Oct 2021 17:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634835799;
 bh=B5+0YtWgFx3cwkpdx53nV32lUMPe1xDJn8DztZUQl1Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Xyyonz57q+VC6AulUjuxzm5GVacDuwF/SWFrIIy1oyhcEWlWzz0fDjyhBIugxo64R
 yuratoCdQT/0lD8MIDXnT8BOVxcxRqOnIxl8wEp8xfdL3yMmdiDNfYTNKfqlNFHa2k
 OWbZnk9ef67pawSzmSFlo9b+Myo9IJLUcrvVAfEs3U94qC+ErD7iyFigPGDtbQuoHs
 3Rjbu8/eVJabqEygcflgyBUs/2YBU/BaVDnZQK+VY7T8DWSs0zCQBpsux/oa3OCdIS
 fx/S2DOMasq75Ss7qlE/JOigKOXP9YZlRLw4gLWpFEAgLT52Lu1TCiX3KwUgDmrete
 xXGf7/+8TZ8+A==
Date: Thu, 21 Oct 2021 12:03:17 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v4 1/8] PCI/AER: Remove ID from aer_agent_string[]
Message-ID: <20211021170317.GA2700910@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021163021.r4ekhfol42ftw5zw@theprophet>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com,
 bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 21, 2021 at 10:00:21PM +0530, Naveen Naidu wrote:
> On 20/10, Bjorn Helgaas wrote:
> > On Tue, Oct 05, 2021 at 10:48:08PM +0530, Naveen Naidu wrote:
> > > Currently, we do not print the "id" field in the AER error logs. Yet the
> > > aer_agent_string[] has the word "id" in it. The AER error log looks
> > > like:
> > > 
> > >   pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver ID)
> > > 
> > > Without the "id" field in the error log, The aer_agent_string[]
> > > (eg: "Receiver ID") does not make sense. A user reading the
> > > aer_agent_string[] in the log, might inadvertently look for an "id"
> > > field and not finding it might lead to confusion.
> > > 
> > > Remove the "ID" from the aer_agent_string[].
> > > 
> > > The following are sample dummy errors inject via aer-inject.
> > 
> > I like this, and the problem it fixes was my fault because
> > these "ID" strings should have been removed by 010caed4ccb6.
> > 
> > If it's straightforward enough, it would be nice to have the
> > aer-inject command line here in the commit log to make it easier
> > for people to play with this.
> >
> 
> Thank you for the review. Do you mean something like:
> 
> The following sample dummy errors are injected via aer-inject via the
> following steps:
> 
>   1. The steps to compile the aer-inject tool is mentioned in (Section
>      4. Software error inject) of the document [1]
> 
>      [1]: https://www.kernel.org/doc/Documentation/PCI/pcieaer-howto.txt
> 
>      Make sure to place the aer-inject executable at the home directory
>      of the qemu system or at any other place.
> 
>   2. Emulate a PCIE architecture using qemu, A sample looks like
>      following:
>      
> 		qemu-system-x86_64 -kernel ../linux/arch/x86_64/boot/bzImage \
>         -initrd  buildroot-build/images/rootfs.cpio.gz \
>         -append "console=ttyS0"  \
>         -enable-kvm -nographic \
>         -M q35 \
>         -device pcie-root-port,bus=pcie.0,id=rp1,slot=1 \
>         -device pcie-pci-bridge,id=br1,bus=rp1 \
>         -device e1000,bus=br1,addr=8
>        
>     Note that the PCIe features are available only when using the 
>     'q35' Machine [2]
>     [2]: https://github.com/qemu/qemu/blob/master/docs/pcie.txt
> 
>   3. Once the qemu system starts up, create a sample aer-file or use any
>      example aer file from [3]
> 
>      [3]:
>      https://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git/tree/examples
> 
>   4. Inject any aer-error using
>       
>       ./aer-inject aer-file
> 
> This does look a tad bit longer for a commit log so I am unsure if you
> would like to have it there. If you are okay with it, I would be happy
> to add it to that :)

Yes, that's kind of long.  Something like this
https://git.kernel.org/linus/d95f20c4f070 would be enough for the
commit log, especially since you've now provided all the details in
the email thread, where we can find them via the Link: tag.

Bjorn
