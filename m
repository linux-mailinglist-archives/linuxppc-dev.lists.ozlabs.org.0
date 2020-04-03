Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D551619CF4A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 06:28:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tn4n0sPzzDrR5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 15:28:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tn3J5dwjzDrPT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 15:27:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Vsp7iefS; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48tn3F11cNz9sRR;
 Fri,  3 Apr 2020 15:27:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585888059;
 bh=P6pDV2mWC3/QGwHFGntoCWhQeeo1qFFM1tqWOPVJ5GQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Vsp7iefSuq2qUc2BqgDgoqQSz9nPDU/JrItc+oEyG61KFugv7uQPx8toJGFzcyDE9
 fbHOnTwHuQ5nU9Y2XDcNSY0Z2d2hDCzlqQhElxnt0lWMHCdM5Xj8YLhG/Gvt02ZsjQ
 H2QG7o77rzF7weuVSVcwCohP50hpM4jeI0X/jbE8sTucOI8vacLjjbZb6LfDQZrQvF
 s44uAO8q4NgYv5YD8W76eyM++ks7SvH51Mshmbfai8akqeelai+Lq2HG+OMgjeqjzs
 QWv7sKW0TVJeK8e+qAjnA0G4PeqL7511jU+g7m3hAZHA3+DqAaMDtXDp7bogX/2lG5
 13TfLzlBAQuTQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH v4 03/25] powerpc/powernv: Map & release OpenCAPI LPC
 memory
In-Reply-To: <f763d9d8487e77006b233bc16e0883f956850b6c.camel@kernel.crashing.org>
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-4-alastair@d-silva.org>
 <CAPcyv4iGEHJpZctEm+Do1-kOZBUDeKKcREr=BqcK4kCvLWhAQQ@mail.gmail.com>
 <f763d9d8487e77006b233bc16e0883f956850b6c.camel@kernel.crashing.org>
Date: Fri, 03 Apr 2020 15:27:46 +1100
Message-ID: <87v9mhry65.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Rob Herring <robh@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
> On Wed, 2020-04-01 at 01:48 -0700, Dan Williams wrote:
>> > 
>> > +u64 pnv_ocxl_platform_lpc_setup(struct pci_dev *pdev, u64 size)
>> > +{
>> > +       struct pci_controller *hose = pci_bus_to_host(pdev->bus);
>> > +       struct pnv_phb *phb = hose->private_data;
>> 
>> Is calling the local variable 'hose' instead of 'host' on purpose?
>
> Haha that's funny :-)
>
> It's an oooooooold usage that comes iirc from sparc ? or maybe alpha ?

Yeah it was alpha, I found it in the history tree:

  https://github.com/mpe/linux-fullhistory/blob/1928de59ba4209dc5e9f2cef63560c09ba0df73b/arch/alpha/kernel/mcpcia.c

And airlied found an old manual which confirms it:

  The TIOP module interfaces the AlphaServer 8000 system bus to four I/O channels, called "hoses."

  https://www.hpl.hp.com/hpjournal/dtj/vol7num1/vol7num1art4.pdf


So at least now we know where it comes from.

It's also used widely in mips, microblaze, sh and a little bit in drm.

cheers
