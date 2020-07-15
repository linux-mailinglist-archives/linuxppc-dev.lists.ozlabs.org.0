Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE83D2217CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 00:30:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6XBy16DTzDqsm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 08:30:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=76.164.61.194; helo=kernel.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6X9N456ZzDqQb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 08:28:56 +1000 (AEST)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 06FMQfq2014030
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 15 Jul 2020 17:26:45 -0500
Message-ID: <627b214e6fc0624093caa8155d7006de111aacfb.camel@kernel.crashing.org>
Subject: Re: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>
Date: Thu, 16 Jul 2020 08:26:40 +1000
In-Reply-To: <CAK8P3a3OEOosC2VEHb3z7hTA=BjVp0nv9bNxBWzEnmgSDDTX3Q@mail.gmail.com>
References: <CAK8P3a3EZX8=649R9cYF6_=ivh1Xyrgsc5mUtS=d5yvQ3doZaQ@mail.gmail.com>
 <20200714234625.GA428442@bjorn-Precision-5520>
 <CAK8P3a3OEOosC2VEHb3z7hTA=BjVp0nv9bNxBWzEnmgSDDTX3Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linux-pci <linux-pci@vger.kernel.org>, Keith Busch <kbusch@kernel.org>,
 Paul Mackerras <paulus@samba.org>, sparclinux <sparclinux@vger.kernel.org>,
 Toan Le <toan@os.amperecomputing.com>, Kjetil Oftedal <oftedal@gmail.com>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sagi Grimberg <sagi@grimberg.me>, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Christoph Hellwig <hch@lst.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Kevin Hilman <khilman@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>,
 Jens Axboe <axboe@fb.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Shuah Khan <skhan@linuxfoundation.org>, bjorn@helgaas.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-07-15 at 08:47 +0200, Arnd Bergmann wrote:
> drivers/misc/cardreader/rts5261.c:      retval =
> rtsx_pci_write_config_dword(pcr, PCR_SETTING_REG2, lval);
> 
> That last one is interesting because I think this is a case in which
> we
> actually want to check for errors, as the driver seems to use it
> to ensure that accessing extended config space at offset 0x814
> works before relying on the value. Unfortunately the implementation
> seems buggy as it a) keeps using the possibly uninitialized value
> after
> printing a warning and b) returns the PCIBIOS_* value in place of a
> negative errno and then ignores it in the caller.

In cases like this, usually checking against ~0 is sufficient

Cheers,
Ben.


