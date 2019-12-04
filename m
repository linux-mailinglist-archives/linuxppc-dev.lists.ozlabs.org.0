Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0688F112B74
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 13:26:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SdPW1G21zDqTT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 23:26:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p01-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5301::9;
 helo=mo6-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="FODUzhHA"; 
 dkim-atps=neutral
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SdJv5qDgzDqM3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 23:22:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1575462134;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=H2XdL0WH9WfdbiDKiy00K13CMFaOvBkQg2NsnPLwBhw=;
 b=FODUzhHA3CE20iMAq9hpsLbt0vbAbjjwwoLDT5coM0CJ+wayW9zmUKqomHVKgFfP4X
 7oYXxMa/mJFCBqJy6nIzwmPUs6DYRh8dDdoWnmfo/e6ecWL3+v86j1yEXlaEz6uq98fI
 FyVWHo5vPa2cKj8nTg+BCtfVKUjrYwqJ7bthcFXv+e6bbz6uO2SaoizbdNo4wMq9Pzqg
 a9rwrAtHL6qJuoBhSL/kgHgYzmdE/kIr+gh/gXh/LymZB76qF6om3EdCxU/vt4jACapt
 4hCPePeBshAibghAO53yMCXjwYK1QKbuo49bYu1ilSOnHWiQxmeTGOZMnNnlJVGrZxPf
 8ZXw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7b2ZxiLpgl3fPNI3J+howFgN/UFpfqH4qvEmeI241"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:b103:5c16:7d2b:6241:f205:b3e2]
 by smtp.strato.de (RZmta 46.0.2 AUTH) with ESMTPSA id v035a1vB4CM2CvE
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 4 Dec 2019 13:22:02 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: Bug 205201 - Booting halts if Dawicontrol DC-2976 UW SCSI board
 installed, unless RAM size limited to 3500M
From: Christian Zigotzky <chzigotzky@xenosoft.de>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <20191204085634.GA25929@lst.de>
Date: Wed, 4 Dec 2019 13:22:01 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <1D79E674-5A47-4268-AA96-DA02E8A51929@xenosoft.de>
References: <dbde2252-035e-6183-7897-43348e60647e@xenosoft.de>
 <6eec5c42-019c-a988-fc2a-cb804194683d@xenosoft.de>
 <d0252d29-7a03-20e1-ccd7-e12d906e4bdf@arm.com>
 <b3217742-2c0b-8447-c9ac-608b93265363@xenosoft.de>
 <20191121180226.GA3852@lst.de>
 <2fde79cf-875f-94e6-4a1b-f73ebb2e2c32@xenosoft.de>
 <20191125073923.GA30168@lst.de>
 <4681f5fe-c095-15f5-9221-4b55e940bafc@xenosoft.de>
 <20191126164026.GA8026@lst.de> <20191127065624.GB16913@linux.ibm.com>
 <20191204085634.GA25929@lst.de>
To: Christoph Hellwig <hch@lst.de>
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
Cc: linux-arch@vger.kernel.org, darren@stevens-zone.net, rtd2@xtra.co.nz,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 paulus@samba.org, mad skateman <madskateman@gmail.com>,
 "contact@a-eon.com" <contact@a-eon.com>, Robin Murphy <robin.murphy@arm.com>,
 nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I think we have to wait to Roland=E2=80=99s test results with his SCSI PCI c=
ard.

Christian

Sent from my iPhone

> On 4. Dec 2019, at 09:56, Christoph Hellwig <hch@lst.de> wrote:
>=20
>> On Wed, Nov 27, 2019 at 08:56:25AM +0200, Mike Rapoport wrote:
>>> On Tue, Nov 26, 2019 at 05:40:26PM +0100, Christoph Hellwig wrote:
>>>> On Tue, Nov 26, 2019 at 12:26:38PM +0100, Christian Zigotzky wrote:
>>>> Hello Christoph,
>>>>=20
>>>> The PCI TV card works with your patch! I was able to patch your Git ker=
nel=20
>>>> with the patch above.
>>>>=20
>>>> I haven't found any error messages in the dmesg yet.
>>>=20
>>> Thanks.  Unfortunately this is a bit of a hack as we need to set
>>> the mask based on runtime information like the magic FSL PCIe window.
>>> Let me try to draft something better up, and thanks already for testing
>>> this one!
>>=20
>> Maybe we'll simply force bottom up allocation before calling
>> swiotlb_init()? Anyway, it's the last memblock allocation.
>=20
> So I think we should go with this fix (plus a source code comment) for
> now.  Revamping the whole memory initialization is going to take a
> while, and this fix also is easily backportable.
