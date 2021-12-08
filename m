Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A83C046D5BF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 15:33:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8KQy3qXgz3cCJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 01:33:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61c;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::61c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8KQT27hlz308b
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 01:33:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkVYPslNDyYETFbMQrrNUioFR7AN7tFI7zxRVZLCRIqOUyP6/jMYIgoyKhhXvvboJcn4mvx3eoud0IJr4s29sOBE4bDmYhFjKUt23EuhzF1Dcy6Osy3CskAomvvpWicjH8mqAAv/+FVOi6RhbGgWhUGDrGrSsIc8G8+rHi1rng4J+tGs51fDg7Gj9U0p5GVsotvGGYPJbEPCNNDv0Wej7t6ihURjWXLJdR614Ny0R2xPhSRoyP2VcxZkR0vC+NYWONE/9uIM4fCsTCDS1EKfqyEPrfPWgNcQ6ydynYumlBPJ67I8H10PPznIVRWrj/euD3gzeblqVPjpg1c/XVEY5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rkfug0VHZPb56GAv7HMSb7giuWTIivrBH1l56pwqUwo=;
 b=bA4v9CtWE+M0LI9LWxo4Dgyhqpb1AAd9h8I44G7RpIAsyacLEdr3c+g6KB30yNjtUfImoBax3MCffJJIXaB9W7yq3XQq2yAkZzaMy/t9Bc/o/tvvIOqg50zWx00rLwPf+dVy4qovq4UaenXmUYAS0BQkYUnjDtgwiAN2lO4vmII62HH9ga0nws81BOMmtf1uFVStoVw3DtQAe1czJuIwiO2UTsa2ZKDlO/IR4aM9WAiV13/5rApzpd1EPRU2DgrfV4GtuoJARh1hGju6fKMsxKX/U6VlRGPQY9p4en5L0E6N3de4XMkP4R3+QoAYDp1S3QC0di7zXjbWcsXUclycrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0357.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:18::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 14:32:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 14:32:42 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/2] sizes.h: Add SZ_1T macro
Thread-Topic: [PATCH 1/2] sizes.h: Add SZ_1T macro
Thread-Index: AQHX7EB14E671PmylUi/GGPQpSm/KQ==
Date: Wed, 8 Dec 2021 14:32:42 +0000
Message-ID: <b03f5cf556f1a89ccb4d7ae2f56414520cfd9209.1638973836.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ff06acd-447e-4821-8ed9-08d9ba579830
x-ms-traffictypediagnostic: MRXP264MB0357:EE_
x-microsoft-antispam-prvs: <MRXP264MB03573814BF9FE7FF33E31C26ED6F9@MRXP264MB0357.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:639;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mQbJYUIOTIwGebZ7e9j6pw1b2XHT4HxDrCO15xNiaHKtjoNj5UBD71uctVLvqxtc0jnE2Sm7rgYbVZ/E0JQwL9Vp6ayDLc8QwwFt04ZP/wNCdSouqBID5y4iDE6EqjlxWp4d4qNb6gckh0UAfziQFfFcIMKQkVcPwleofzczfTQIwQJLVB2mnU7e4dsMGOSsPw/3ra42TLUS0bPQ4HU8vW0Y9/3o4Mqo71mb9Oitau+7iMEaVD1qjsc3iE5TYrO3bx1BHtZ/p9lenRVi5QZsys1KPCsLCjeekReOhdKMhjOZJF8vuyUogDyKWQPF+2Y00wLA6tgq6o1iabtsnazUgERFbbLIeIAej7kWwFTbgGqWoSqNvWYhniDM+pCG2HIlQlJjEadXJr2o3uYhe7zJ5YyeedgbiXkwwkVhM+1qycxWvBV89hrrCZTWdJV2yNJ8Isw+m9ftZ5czFg0n+X/bjuHjp4sGzEKtSBEwHQ2RyAYbMw6V4mLr5KmKZMEkZfC2BsPyQXybEOYzQqSvZc2ZzfzGuWD3yzUSsvDxauAl3dY+XjYWgwUHHY6hLt8igfPBtVIbLHc55ZJ91oDXjfsWUL9dcxIYWHdet1A+LhCTPgXsUPGUrbLJbpDcB9c4oZqMotO7dQAFKphajkmUBPlr4gC69NPwVwjs5P+BiSQ92xhho77b2ZhbEctLlGiD3LioerzbsGD3z2qFmEzW8+KVzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(8936002)(36756003)(4326008)(5660300002)(66446008)(38100700002)(122000001)(8676002)(186003)(86362001)(38070700005)(54906003)(83380400001)(66556008)(66946007)(2616005)(316002)(6512007)(64756008)(91956017)(2906002)(76116006)(66476007)(6506007)(44832011)(71200400001)(6486002)(26005)(508600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MfUv9wetvW7ULBNWWU1vqIjiiW4HtWq1HJQ5e+3XiTcBzh4Ml7jCm1He7K?=
 =?iso-8859-1?Q?6YabLc90OUIGUfGiK9MkFxpM9Ub9QI8nWjMGz6uZVQG5wvGnIUKFV2H+mY?=
 =?iso-8859-1?Q?6hLdze5zVIYg6kq5xx6rPuvu2CLwPzOjoamp3/8c392uLhW16hcuBJjLbX?=
 =?iso-8859-1?Q?tLS5VzaLHEIVP69iKTsPcngpMoZ0QLvbT7THA3xpvxqvoNUyoaJLJK0w0V?=
 =?iso-8859-1?Q?jiFWgnqqpVt7YYwFZDwY8VQ1qmn2Enb6Q5bIO2Jlt9C67z/5NWNQjho2iC?=
 =?iso-8859-1?Q?5mhimUZL+NB+Tt189g67U9XklY2bW98/hDWcA7q0ZCNeSWJGCmPzThEtUu?=
 =?iso-8859-1?Q?h7nwcBtAG1XpBpx1TfeJkNAzpxXcmDshAptQs1P332QLAY/r/EluTZEcY6?=
 =?iso-8859-1?Q?nSo1ajEnyqfVKqF32QvyRwtyZdBci5ZqU4XNGs1k1/QeFNnd8PefPN1vyd?=
 =?iso-8859-1?Q?p+FCewjAQ+EEwtt2xH+NAxLLmb5jAiOE8KZqxNK9VMk9TkVn4R54Xlr5IC?=
 =?iso-8859-1?Q?I5X+BfCaZQydtLKsaYAM/373Gba2+U5w3IxnPKgFSe4S7jqOfVHA822RTn?=
 =?iso-8859-1?Q?bu4N17SiutZH5IHh+Jfpo6OIiEpCRD2OT0lGzZYi4Els5+jRXTvbVgi/a5?=
 =?iso-8859-1?Q?35yaUMAYUrDS/BZmvsyDbunnDowyQw6xHmejipjJu7yUg+xVMkfOxPpDsg?=
 =?iso-8859-1?Q?CTTC5yb9S/2lxilQDFWgohT/Kj4lZ94jsC3RY1XQ9zzm3jisPeqXIF/C35?=
 =?iso-8859-1?Q?USfbij+OSKknXjztCIqnx5uIF1VonRZp/AmueO2IaGfTS1BOxy445xd1vI?=
 =?iso-8859-1?Q?ojmcgdis5qwjzhV5n567OVp5RiqUWEUcJFnwaLO+uBRH3XXhcADDlfRX0n?=
 =?iso-8859-1?Q?5E12a2+A49lsu5Wj/+9oU+kDPbsEqNXVmCE042CeOl/ReBZgtbU8uMXR1g?=
 =?iso-8859-1?Q?2Fskr4ejiGg0YL0qhDJqjhOvyq5/B/5JEvqUKqFGR3dnAlSrknbEp/fHlW?=
 =?iso-8859-1?Q?31MQbSPv3VcjK84aoCokcQqu8LUTexyXp3nFqLm9f/92bunoHZqpJpUQ/d?=
 =?iso-8859-1?Q?QoFTA1nNAz3QCRoufkRXMYdN+hzdebtoYhQk6HZ/ZzVL/FkN/wamB3X/dA?=
 =?iso-8859-1?Q?RT4+xX4LfkjhiVDir6QrmWz+RHXveV8jj2LUUZEIXTB9OrmKBG+6QaWcBw?=
 =?iso-8859-1?Q?2k+tcLIVKNGQn/Qut+w796u9hqagtTaibOQAbx9H4eTBBfWzSAtm5iia3X?=
 =?iso-8859-1?Q?d1m2q3PB7kIgNHgzb89C282c6rjxJnhwVSs3n0/xfar+CxQHeEVbrkKBx8?=
 =?iso-8859-1?Q?Q5OgI4pbmTlyoyxEL8PMTSa1N01YmRIzpvuX9SmEP3yCo+g2PWr4YhD0HX?=
 =?iso-8859-1?Q?Qd8BEvlUy+celIkdyMmK9roPwmRQE4IYmf+tA9icqBYpC3Svj9Mlmi0U04?=
 =?iso-8859-1?Q?EtI6qaX92JeNISu2iRDPMZP3m+BRF67IA2UJg5BsslDSTc7QIQoVvJAGx/?=
 =?iso-8859-1?Q?s0QhPlwKBGqPndt1D+b+JjxeVodIP7jH8fvt9zj8WZ00uUat0rqkp19vb0?=
 =?iso-8859-1?Q?dKRQTZHIWCA5uDxjpMY58eqdcaawNk33iILUVsonTf/zrEEHdG3x+zzPhD?=
 =?iso-8859-1?Q?gn3+h6AfRJEDFjaErnlBTtphST+WeSzx8qGlIgnSu5yDWAsD2wjsarOqMS?=
 =?iso-8859-1?Q?WwT87jqzyiPM3Wp3QKuI4rmr74sVWNUlVUQCkOyYWgwStDrgdsKTTpRQca?=
 =?iso-8859-1?Q?mhJkjZd3pTO3dkrWgfZ23I524=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff06acd-447e-4821-8ed9-08d9ba579830
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 14:32:42.6900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fyK7QgwRehhbWlgkPgM319lLK7NOS9JcI7e15RUndcfUtMvDvKDIHMtlBsZhoa/cSv1/iooFNO7jTRJ+MtCt88JwZV+gJvTuWHEROb8ZI2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0357
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
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Toan Le <toan@os.amperecomputing.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Today drivers/pci/controller/pci-xgene.c defines SZ_1T

Move it into linux/sizes.h so that it can be re-used elsewhere.

Cc: Toan Le <toan@os.amperecomputing.com>
Cc: linux-pci@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/pci/controller/pci-xgene.c | 1 -
 include/linux/sizes.h              | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pc=
i-xgene.c
index 56d0d50338c8..716dcab5ca47 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -49,7 +49,6 @@
 #define EN_REG				0x00000001
 #define OB_LO_IO			0x00000002
 #define XGENE_PCIE_DEVICEID		0xE004
-#define SZ_1T				(SZ_1G*1024ULL)
 #define PIPE_PHY_RATE_RD(src)		((0xc000 & (u32)(src)) >> 0xe)
=20
 #define XGENE_V1_PCI_EXP_CAP		0x40
diff --git a/include/linux/sizes.h b/include/linux/sizes.h
index 1ac79bcee2bb..84aa448d8bb3 100644
--- a/include/linux/sizes.h
+++ b/include/linux/sizes.h
@@ -47,6 +47,8 @@
 #define SZ_8G				_AC(0x200000000, ULL)
 #define SZ_16G				_AC(0x400000000, ULL)
 #define SZ_32G				_AC(0x800000000, ULL)
+
+#define SZ_1T				_AC(0x10000000000, ULL)
 #define SZ_64T				_AC(0x400000000000, ULL)
=20
 #endif /* __LINUX_SIZES_H__ */
--=20
2.33.1
