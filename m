Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CDA21E330
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 00:49:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5JkN1jWGzDqdh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 08:49:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=MWvKJTjv; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5HgF1JTmzDqXv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 08:02:01 +1000 (AEST)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A520620663;
 Mon, 13 Jul 2020 22:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594677718;
 bh=HSAUHsS9kXD1HIJNE6WsRPhRQVem0B8cFajFbFBR0EI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=MWvKJTjvl/1YEIl1J2bYU68QOMCk3laZW9SifUEehjNOErgOIYQha/bgzSaTFKI2l
 QuIAmIsupUSbzYcZR4NjPAxoi7WbrMXAjLRHTnmV/Yc0VJOJrp/0Y79w5eZfIKt71L
 +1J5CchrY3/xdkH17Ff+7DtiGZ9FgLPSUNKvv7eo=
Date: Mon, 13 Jul 2020 17:01:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
Subject: Re: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
Message-ID: <20200713220156.GA284762@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
X-Mailman-Approved-At: Tue, 14 Jul 2020 08:35:04 +1000
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
Cc: Rich Felker <dalias@libc.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-sh@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-nvme@lists.infradead.org,
 Yicong Yang <yangyicong@hisilicon.com>, Keith Busch <kbusch@kernel.org>,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, sparclinux@vger.kernel.org,
 rfi@lists.rocketboards.org, Toan Le <toan@os.amperecomputing.com>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-scsi@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-atm-general@lists.sourceforge.net, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Christoph Hellwig <hch@lst.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Chas Williams <3chas3@gmail.com>, xen-devel@lists.xenproject.org,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Kevin Hilman <khilman@baylibre.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Ray Jui <rjui@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Yue Wang <yue.wang@Amlogic.com>, Jens Axboe <axboe@fb.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-m68k@lists.linux-m68k.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Michael Buesch <m@bues.ch>,
 skhan@linuxfoundation.org, bjorn@helgaas.com,
 linux-amlogic@lists.infradead.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Juergen Gross <jgross@suse.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Jingoo Han <jingoohan1@gmail.com>, netdev@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Brian King <brking@us.ibm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-alpha@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 13, 2020 at 02:22:12PM +0200, Saheed O. Bolarinwa wrote:
> This goal of these series is to move the definition of *all* PCIBIOS* from
> include/linux/pci.h to arch/x86 and limit their use within there.
> All other tree specific definition will be left for intact. Maybe they can
> be renamed.

More comments later, but a few trivial whitespace issues you can clean
up in the meantime.  Don't repost for at least a few days to avoid
spamming everybody.  I found these with:

  $ b4 am -om/ 20200713122247.10985-1-refactormyself@gmail.com
  $ git am m/20200713_refactormyself_move_all_pcibios_definitions_into_arch_x86.mbx

  Applying: atm: Change PCIBIOS_SUCCESSFUL to 0
  .git/rebase-apply/patch:11: trailing whitespace.
	  iadev = INPH_IA_DEV(dev);
  .git/rebase-apply/patch:12: trailing whitespace.
	  for(i=0; i<64; i++)
  .git/rebase-apply/patch:13: trailing whitespace.
	    if ((error = pci_read_config_dword(iadev->pci,
  .git/rebase-apply/patch:16: trailing whitespace, space before tab in indent.
		return error;
  .git/rebase-apply/patch:17: trailing whitespace.
	  writel(0, iadev->reg+IPHASE5575_EXT_RESET);
  warning: squelched 5 whitespace errors
  warning: 10 lines add whitespace errors.
  Applying: atm: Tidy Success/Failure checks
  .git/rebase-apply/patch:13: trailing whitespace.

  .git/rebase-apply/patch:14: trailing whitespace.
	  iadev = INPH_IA_DEV(dev);
  .git/rebase-apply/patch:15: trailing whitespace.
	  for(i=0; i<64; i++)
  .git/rebase-apply/patch:21: trailing whitespace.
	  writel(0, iadev->reg+IPHASE5575_EXT_RESET);
  .git/rebase-apply/patch:22: trailing whitespace.
	  for(i=0; i<64; i++)
  warning: squelched 3 whitespace errors
  warning: 8 lines add whitespace errors.
  Applying: atm: Fix Style ERROR- assignment in if condition
  .git/rebase-apply/patch:12: trailing whitespace.
	  unsigned int pci[64];
  .git/rebase-apply/patch:13: trailing whitespace.

  .git/rebase-apply/patch:14: trailing whitespace.
	  iadev = INPH_IA_DEV(dev);
  .git/rebase-apply/patch:23: trailing whitespace.
	  writel(0, iadev->reg+IPHASE5575_EXT_RESET);
  .git/rebase-apply/patch:32: trailing whitespace.
	  udelay(5);
  warning: squelched 2 whitespace errors
  warning: 7 lines add whitespace errors.
  Applying: PCI: Change PCIBIOS_SUCCESSFUL to 0
  .git/rebase-apply/patch:37: trailing whitespace.
  struct pci_ops apecs_pci_ops =
  .git/rebase-apply/patch:50: trailing whitespace.
  static int
  .git/rebase-apply/patch:59: trailing whitespace.
  struct pci_ops cia_pci_ops =
  .git/rebase-apply/patch:94: trailing whitespace.
  static int
  .git/rebase-apply/patch:103: trailing whitespace.
  struct pci_ops lca_pci_ops =
  warning: squelched 10 whitespace errors
  warning: 15 lines add whitespace errors.
