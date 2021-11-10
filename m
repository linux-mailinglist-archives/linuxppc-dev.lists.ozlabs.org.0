Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDEC44C6DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 19:41:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqDGM4X7Mz307W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 05:41:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WdjIjCcs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WdjIjCcs; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqDFg6mlPz2x9p
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 05:41:11 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1FE736115A;
 Wed, 10 Nov 2021 18:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636569668;
 bh=9089010GwP3SOumZqJ6YAoM6OGlHlqPBle/z9hQgaP0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=WdjIjCcslboX2CBB0ruVR4Zm2dQRaN8+YsWw0v6z3nPuBcxHUxyEoLWhCcM6e5CK+
 tJfDGvqny+grsC0oPLZoO1vaBiUZ2HN3XOvu49C02X43t+48kZzbQ9aCPrUX49bHKZ
 dDZChzvkttgpwDUb2cE3zg6qsp1m0eFXw4kyxVwdYa+/DzGjYzgPslllQzFqfM7NXj
 9YcH56JlqJk+81bs4tMRC1ZVeS1E6wQSo9jSwLqEwS9p2ecrNqQhULAfZBOLFmwcsZ
 GHMyqzosRXlHDUlQAf5od0MA9+AcZwQNGj9Ml/sXRt+p8J7Wk7zw4GdVf2uwzKkPvn
 SfZ5bRzchWZpQ==
Date: Wed, 10 Nov 2021 12:41:06 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [PASEMI] Nemo board doesn't recognize any ATA disks with the
 pci-v5.16 updates
Message-ID: <20211110184106.GA1251058@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78308692-02e6-9544-4035-3171a8e1e6d4@xenosoft.de>
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
Cc: axboe@kernel.dk, Rob Herring <robh@kernel.org>, lorenzo.pieralisi@arm.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Arnd Bergmann <arnd@arndb.de>, kw@linux.com,
 maz@kernel.org, damien.lemoal@opensource.wdc.com,
 Olof Johansson <olof@lixom.net>, Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "bhelgaas@google.com >> Bjorn Helgaas" <bhelgaas@google.com>,
 robert@swiecki.net, Matthew Leaman <matthew@a-eon.biz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 10, 2021 at 07:07:24PM +0100, Christian Zigotzky wrote:
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
> > I was able to revert the new pci-v5.16 updates [2]. After a new
> compiling, the kernel recognize all ATA disks correctly.
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
> 
> Hi All,
> 
> Many thanks for your nice responses.
> 
> I bisected today [1]. 0412841812265734c306ba5ef8088bcb64d5d3bd (of/irq:
> Allow matching of an interrupt-map local to an interrupt controller) [2] is
> the first bad commit.
> 
> I was able to revert the first bad commit [1]. After a new compiling, the
> kernel detects all ATA disks without any problems.
> 
> I created a patch for an easy reverting the bad commit [1]. With this patch
> we can do further our kernel tests.
> 
> Could you please check the first bad commit [2]?
> 
> Thanks,
> Christian
> 
> [1] https://forum.hyperion-entertainment.com/viewtopic.php?p=54398#p54398
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0412841812265734c306ba5ef8088bcb64d5d3bd
> 
> [+ Marc Zyngier, Alyssa Rosenzweig, Lorenzo Pieralisi, and Rob Herring
> because of the first bad commit]

Thank you very much for the bisection and for also testing the revert!

It's easy enough to revert 041284181226 ("of/irq: Allow matching of an
interrupt-map local to an interrupt controller"), and it seems like
that's what we need to do.  I have it tentatively queued up.

That commit was part of the new support for the Apple M1 PCIe
interface, and I don't know what effect a revert will have on that
support.  Marc, Alyssa?

Bjorn
