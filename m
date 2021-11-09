Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FEC44B19F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 17:59:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpZ2n4TV7z3c5D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 03:59:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rwjrjNIT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rwjrjNIT; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpZ2527HBz2xVt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 03:58:53 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 93DC0611AF;
 Tue,  9 Nov 2021 16:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636477129;
 bh=WiI7yiSsRyGyxbH0M5tEnpuJ2pCthlZoRHEJQiwJXHM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=rwjrjNITo8A74sOBNwFp7ddx6D88aNYNGeIWRE178PEaprjfU7cpkyf+GDManuJEv
 13FTDmQsolCNxzMrEIxf5iKFaLd1kHsYyGlpfKOZfhNr2E+fBdQxMis1KVPYfT5ee3
 2QqkOv3lVj/szLGdo6wrg6UUTDsDLcpo3jwym70c+/aqVYcfk5IVIWzvRvtzw9tCom
 ks2KMjmt7/XwE0Hg0csvj4shtSjVAoTMOZBSvw6ez60wpHYc3o7dr/4TWcJGEnE+Kp
 ZCWqTJqZ25AUSrs/nOn/oHd5XM3rTzYKYmyYb2v4DARXaEhQRzkMfmdZon+Uzgwx9Q
 1NMqS6kUcruFQ==
Date: Tue, 9 Nov 2021 10:58:48 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [PASEMI] Nemo board doesn't recognize any ATA disks with the
 pci-v5.16 updates
Message-ID: <20211109165848.GA1155989@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee3884db-da17-39e3-4010-bcc8f878e2f6@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 "bhelgaas@google.com >> Bjorn Helgaas" <bhelgaas@google.com>,
 Matthew Leaman <matthew@a-eon.biz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 09, 2021 at 04:10:14PM +0100, Christian Zigotzky wrote:
> On 09 November 2021 at 03:45 pm, Christian Zigotzky wrote:
> > Hello,
> >
> > The Nemo board [1] doesn't recognize any ATA disks with the pci-v5.16
> updates [2].
> >
> > Error messages:
> >
> > ata4.00: gc timeout cmd 0xec
> > ata4.00: failed to IDENTIFY (I/O error, error_mask=0x4)
> > ata1.00: gc timeout cmd 0xec
> > ata1.00: failed to IDENTIFY (I/O error, error_mask=0x4)
> > ata3.00: gc timeout cmd 0xec
> > ata3.00: failed to IDENTIFY (I/O error, error_mask=0x4)
> >
> > I was able to revert the new pci-v5.16 updates [2]. After a new compiling,
> the kernel recognize all ATA disks correctly.
> >
> > Could you please check the pci-v5.16 updates [2]?
> >
> > Please find attached the kernel config.
> >
> > Thanks,
> > Christian
> >
> > [1] https://en.wikipedia.org/wiki/AmigaOne_X1000
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0c5c62ddf88c34bc83b66e4ac9beb2bb0e1887d4

Sorry for the breakage, and thank you very much for the report.  Can
you please collect the complete dmesg logs before and after the
pci-v5.16 changes and the "sudo lspci -vv" output from before the
changes?

You can attach them at https://bugzilla.kernel.org if you don't have
a better place to put them.

You could attach the kernel config there, too, since it didn't make it
to the mailing list (vger may discard them -- see
http://vger.kernel.org/majordomo-info.html).

Bjorn

