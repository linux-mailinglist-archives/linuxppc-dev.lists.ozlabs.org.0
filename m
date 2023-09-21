Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB9F7AA4DC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 00:23:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs8zm20fgz3cLQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 08:23:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 32476 seconds by postgrey-1.37 at boromir; Fri, 22 Sep 2023 08:22:34 AEST
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs8zG2CvWz3bTN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 08:22:32 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-195-nCruYfTANVavYpk8gD9WoQ-1; Thu, 21 Sep 2023 23:22:12 +0100
X-MC-Unique: nCruYfTANVavYpk8gD9WoQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 21 Sep
 2023 23:22:11 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 21 Sep 2023 23:22:11 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Bjorn Helgaas' <helgaas@kernel.org>, Shuai Xue
	<xueshuai@linux.alibaba.com>
Subject: RE: Questions: Should kernel panic when PCIe fatal error occurs?
Thread-Topic: Questions: Should kernel panic when PCIe fatal error occurs?
Thread-Index: AQHZ7Bag+I9/7O2gw0aXfXPFoWr8dLAl2OAA
Date: Thu, 21 Sep 2023 22:22:11 +0000
Message-ID: <625cdd6c55994bf3a50efd8f79680029@AcuMS.aculab.com>
References: <e486db16-d36d-9e14-4f10-dc755c0ef97d@linux.alibaba.com>
 <20230920230257.GA280837@bhelgaas>
In-Reply-To: <20230920230257.GA280837@bhelgaas>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Linux PCI <linux-pci@vger.kernel.org>, "mahesh@linux.ibm.com" <mahesh@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "bp@alien8.de" <bp@alien8.de>, Baolin Wang <baolin.wang@linux.alibaba.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "james.morse@arm.com" <james.morse@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "lenb@kernel.org" <lenb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> It would be nice if they worked the same, but I suspect that vendors
> may rely on the fact that CPER_SEV_FATAL forces a restart/panic as
> part of their system integrity story.

The file system errors created by a panic (especially an NMI panic)
could easily be more problematic than a failed PCIe data transfer.
Evan a read that returned ~0u - which can be checked for.

Panicking a system that is converting TDM telephony to RTP for the
911 emergency service because a PCIe cable/riser connecting one of the
TDM board has become loose doesn't seem ideal.
(Or because the TDM board's fpga has decided it isn't going to respond
to any accesses until the BARs are setup again...)

The system can carry on with some TDM connections disabled - but that
is ok because they are all duplicated in case a cable gets cuit.

(Yes - that is a live system...)

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

