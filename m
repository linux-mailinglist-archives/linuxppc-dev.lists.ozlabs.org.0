Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C5D695409
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 23:45:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFzth24kbz3ccr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 09:45:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFzt24pWsz3bgk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 09:44:24 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-91-bQdp4kpzOVOJNtCS0YM40g-1; Mon, 13 Feb 2023 22:44:17 +0000
X-MC-Unique: bQdp4kpzOVOJNtCS0YM40g-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.45; Mon, 13 Feb
 2023 22:44:16 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.045; Mon, 13 Feb 2023 22:44:16 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Bjorn Helgaas' <helgaas@kernel.org>, Ira Weiny <ira.weiny@intel.com>
Subject: RE: [PATCH RFC] PCI/AER: Enable internal AER errors by default
Thread-Topic: [PATCH RFC] PCI/AER: Enable internal AER errors by default
Thread-Index: AQHZP/OWtZukbVOH0kqW0g36cswuDK7NdzVQ
Date: Mon, 13 Feb 2023 22:44:16 +0000
Message-ID: <f5d13d0d67a34567a586a1171ba44b52@AcuMS.aculab.com>
References: <20230209-cxl-pci-aer-v1-1-f9a817fa4016@intel.com>
 <20230213213820.GA2935044@bhelgaas>
In-Reply-To: <20230213213820.GA2935044@bhelgaas>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Alison Schofield <alison.schofield@intel.com>, Dave Jiang <dave.jiang@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ben Widawsky <bwidawsk@kernel.org>, Oliver O'Halloran <oohall@gmail.com>, Jonathan
 Cameron <Jonathan.Cameron@Huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Stefan Roese <sr@denx.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bjorn Helgaas
> Sent: 13 February 2023 21:38
>=20
> On Fri, Feb 10, 2023 at 02:33:23PM -0800, Ira Weiny wrote:
> > The CXL driver expects internal error reporting to be enabled via
> > pci_enable_pcie_error_reporting().  It is likely other drivers expect t=
he same.
> > Dave submitted a patch to enable the CXL side[1] but the PCI AER regist=
ers
> > still mask errors.
> >
> > PCIe v6.0 Uncorrectable Mask Register (7.8.4.3) and Correctable Mask
> > Register (7.8.4.6) default to masking internal errors.  The
> > Uncorrectable Error Severity Register (7.8.4.4) defaults internal error=
s
> > as fatal.
> >
> > Enable internal errors to be reported via the standard
> > pci_enable_pcie_error_reporting() call.  Ensure uncorrectable errors ar=
e set
> > non-fatal to limit any impact to other drivers.
>=20
> Do you have any background on why the spec makes these errors masked
> by default?  I'm sympathetic to wanting to learn about all the errors
> we can, but I'm a little wary if the spec authors thought it was
> important to mask these by default.

I'd guess that it is for backwards compatibility with older hardware
and/or software that that didn't support error notifications.

Then there are the x86 systems that manage to take the AER
error into some 'board management hardware' which finally
interrupts the kernel with an NMI - and the obvious consequence.
These systems are NEBS? 'qualified' for telecoms use, but take
out a PCIe link and the system crashes.

It is pretty easy to generate a PCIe error.
Any endpoint with two (or more) different sized BARs leaves
a big chunk of PCIe address space that is forwarded by the upstream
bridge but is not responded to.
The requirement to put the MSI-X area in its own BAR pretty much
ensures that such addresses exist.

(Never mind reprogramming the fpga that is terminating the link.)

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

