Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8674063D4E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 23:28:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jwQs47yZzDqYC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 07:28:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=40.107.2.42; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=maxg@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mellanox.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="JepUTIH7";
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20042.outbound.protection.outlook.com [40.107.2.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jkFL4gYwzDqWK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 23:49:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7G98CoSGojswj3G7wdpmZjr+xK5S6IlyBgDmwk1+cOCN7Kg3/YXJj5+1ssR1I/lmpknJIDw9Sz0IM95Wi/DU0fKLvCoJjsnwZn1YAziCp6fCsD+9tjlL7hBQDNf4PFRnMleYfSrCurPpXSZqAvxZF6u8haW8To0TrlAlV7Kl+1+itAEb52qAqjN9586G8Ood6MwVxZuMXzH4ItWQEfkgYySMRAFMqK3RuOldBOIR+81Wxn0HsyfjOd1kB3FeG0VlTH45UcgcR6e9cOrxD039HOrhkf5K0fHN+xf8uzPYrkcTQqRSwG88QEwhL02wKwTlWLUUUu0xDdk97/phOxq1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZVyJNNQXg3TQoED7oCXeWgqIs1Nz5x6FErfRhazP/0=;
 b=C42WguOmUXDagIxGNZyubIbY0InNWVwoj43/EABqDYH3dQ8N5mibfMO0DjZ13imGYfK0pfzrY9Y+NTzqw7Vuc8BiHm0rUiJBjLCifP3xwlHXlhfsaNsi5vmr6QY5TmF/oEqmdhMz6fbXEye5F0DOuaUODPlH9vb8Rrzf6U0QeAjx1RBolIPnQoVwUMd17X9zMaiPXceU1oJzWyQNDb5/bNKkCl+EkX1HzDFY+5VgBtb3qZssvxcXM6Knx2I+kI2lxOJjapaET/8+RGKHYi+ToSAFFOHMG+93PVM3DIQh6IRYy1uZrp1VgBQxJ/nLGPhQVoRq//Fk5ZueH4IAZrdRzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZVyJNNQXg3TQoED7oCXeWgqIs1Nz5x6FErfRhazP/0=;
 b=JepUTIH7lVQDUVizoKg7rKpqu88tx3AkSVbZJpZlErDpAr2aJa54F2QbaZJG/rt0BaORh+pi4dsaVP6RcDpbxOQDisg2wDiYNxsbcl9DtXFyhE4zbCOeW8gF0QWx1qMPnxuYd383aZZW83ENRREuZOAvg86wXaoqCUSRg6FHLXg=
Received: from AM0PR05MB5810.eurprd05.prod.outlook.com (20.178.116.18) by
 AM0PR05MB4115.eurprd05.prod.outlook.com (52.134.90.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 9 Jul 2019 13:49:04 +0000
Received: from AM0PR05MB5810.eurprd05.prod.outlook.com
 ([fe80::4419:a576:939c:8e8f]) by AM0PR05MB5810.eurprd05.prod.outlook.com
 ([fe80::4419:a576:939c:8e8f%4]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 13:49:04 +0000
From: Max Gurtovoy <maxg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>, Frederic Barrat <fbarrat@linux.ibm.com>,
 "'gregkh@linuxfoundation.org'" <gregkh@linuxfoundation.org>
Subject: RE: [PATCH 1/3] powerpc/powernv: remove the unused pnv_pci_set_p2p
 function
Thread-Topic: [PATCH 1/3] powerpc/powernv: remove the unused pnv_pci_set_p2p
 function
Thread-Index: AQHVETyVx+UWJsTa3k2QA9Ii0zay/qbClMtg
Date: Tue, 9 Jul 2019 13:49:04 +0000
Message-ID: <AM0PR05MB5810FF3B4A45B3CA722489EEB6F10@AM0PR05MB5810.eurprd05.prod.outlook.com>
References: <20190426124917.23789-1-hch@lst.de>
 <20190426124917.23789-2-hch@lst.de>
 <99c4c4a9-8a18-61ed-174a-9ffaec3d2e44@linux.ibm.com>
 <20190523075253.GA12946@lst.de>
In-Reply-To: <20190523075253.GA12946@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=maxg@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9818d940-c064-46db-4011-08d7047434a2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM0PR05MB4115; 
x-ms-traffictypediagnostic: AM0PR05MB4115:
x-microsoft-antispam-prvs: <AM0PR05MB41151289619BCDCAD10045AAB6F10@AM0PR05MB4115.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(13464003)(495844002)(199004)(189003)(76176011)(478600001)(7736002)(4326008)(6436002)(5660300002)(99286004)(2906002)(53546011)(66066001)(52536014)(6506007)(229853002)(74316002)(8936002)(186003)(26005)(110136005)(256004)(54906003)(316002)(305945005)(102836004)(9686003)(11346002)(6246003)(81166006)(81156014)(33656002)(486006)(55016002)(25786009)(86362001)(446003)(68736007)(6116002)(3846002)(53936002)(8676002)(76116006)(476003)(7696005)(73956011)(66556008)(64756008)(66476007)(66446008)(107886003)(71200400001)(14454004)(66946007)(71190400001)(491001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR05MB4115;
 H:AM0PR05MB5810.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lI5XNBOZi9Zqs6MB3yvTQkzJXQMygT4mLr05p2Gg1fegOvz1WyGRGT80lc1y3WaH/DvxyQoVzS8rlLLDrm//Gjel2v1B94PxOOEIT1/yk9NATFBZaYFSkKIVBCbGtsxzwofvQV8tRMzuaEPRmyQ2MGVpS8T8AN64PWB8mwCBoJB05P41BjRa0iES1m2XolCbfXJKo4xSO46no8YbVmagYrArOWWq8HkGdpvDeDMeByT6nJYTZf78nV7tj42STfxMnGlHjvqjl1SrN2fsawMB0Gio9hbs8HoJsJmeBuvpeGIwBOBzGBPVAiEB8ceRDBEbTqWMvXMhOxJ1qTXDP1gR4jjhEzoNbSUj0B853XBNqn5FPfTqxGbXUNmRc146ZczBjVmAHm0XYdIlQJw1WSZVhG2SLdhwHVS/ELuOzLzZvJ0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9818d940-c064-46db-4011-08d7047434a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 13:49:04.1480 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: maxg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB4115
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:26:45 +1000
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
Cc: Shlomi Nimrodi <shlomin@mellanox.com>, Paul Mackerras <paulus@samba.org>,
 Oren Duer <oren@mellanox.com>, Idan Werpoler <Idanw@mellanox.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Greg/Christoph,
Can we leave it meanwhile till we'll find a general solution (for the upcom=
ing kernel) ?
I guess we can somehow generalize the P2P initialization process for PPC an=
d leave it empty for now for other archs.
Or maybe we can find some other solution (sysfs/configfs/module param), but=
 it will take time since we'll need to work closely with the IBM pci guys t=
hat wrote this code.

-Max.


-----Original Message-----
From: Christoph Hellwig <hch@lst.de>=20
Sent: Thursday, May 23, 2019 10:53 AM
To: Frederic Barrat <fbarrat@linux.ibm.com>
Cc: Christoph Hellwig <hch@lst.de>; Benjamin Herrenschmidt <benh@kernel.cra=
shing.org>; Paul Mackerras <paulus@samba.org>; Michael Ellerman <mpe@ellerm=
an.id.au>; linuxppc-dev@lists.ozlabs.org; Max Gurtovoy <maxg@mellanox.com>
Subject: Re: [PATCH 1/3] powerpc/powernv: remove the unused pnv_pci_set_p2p=
 function

On Mon, May 06, 2019 at 10:46:11AM +0200, Frederic Barrat wrote:
> Hi,
>
> The PCI p2p and tunnel code is used by the Mellanox CX5 driver, at=20
> least their latest, out of tree version, which is used for CORAL. My=20
> understanding is that they'll upstream it at some point, though I=20
> don't know what their schedule is like.

FYI, Max who wrote (at least larger parts of) that code is on Cc agreed tha=
t all P2P code should go through the kernel P2P infrastructure and might be=
 able to spend some cycles on it.

Which still doesn't change anything about that fact that we [1] generally d=
on't add infrastructure for anything that is not in the tree.

[1] well, powernv seems to have handles this a little oddly, and now is on =
my special watchlist.
