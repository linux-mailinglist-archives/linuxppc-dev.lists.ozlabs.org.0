Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C02662A51
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 16:42:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrJ9f3Q0Wz3cFl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 02:42:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=f9iYRWTs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.105.79; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=f9iYRWTs;
	dkim-atps=neutral
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2079.outbound.protection.outlook.com [40.107.105.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrJ8f0810z3bV1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 02:41:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKYw+KNYBUQ1fI/djoqDjl5NyeIvFCFRgVVm9YEo/5fNZo8Ba2ZXRc+WnrzvKU25EEj6zJx6HFcLdOUrdyDyNFNsD/FcOSEXXs6zDA72FjaKvFBrAwl7ldcuO18mHEDWvzlUHIZP1vylT03Q/a92SFL29Ug7RmcfcoDUzyhhQ1I0R2kCxXXSNWukmin7TGz/VSAZkCklsMDOJtAdI9Ty4ACZdR/bpVlL5vXRWwEh7/+ptUiRzodAWMk6XZwDsoId5mK2X2s5LsPE/9bkQJBTEQsOWa6M6a9whrI2rK5+HjM82gmnWLIoK/FFkeYPvW0F9IobGNhmTjPIajBOHxxzqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRdsqoWdhdBLmgauRXpopVCnpjIw65gEYUiWeBTwtVk=;
 b=aX1mpaFuHQ7/Ye17ftb7ioiIUt0d03NHXjUZIu9stcMZhkDpMlie/2koleqixWzA3lIAl5ZW72R+HS0x0dRRRmOURJChHj2+L8ZAvsO026/L1uAjt2yoDalu+ARzLZ+7znWFzqA/GjomIK9SeLkcV+78wwTRaj4jkD5SG1B6hxYlOUQiiNTNjzivADWvtGC5xArD4oPf+HpSivcbyxn8wPY7a6mBV8+IJx0HF1G4wt6EnfMZfaQERnNLsUnTda0G4clNopOi+CAgVOWH3bZct8Dl7OaFK/w0znZNeTONWxUGfFK+UfyhjNxsu+WUvkXig1SH9iBaMGT7l2KOvIJk0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRdsqoWdhdBLmgauRXpopVCnpjIw65gEYUiWeBTwtVk=;
 b=f9iYRWTs6NLDEGfaAuu+OloOcMHVNx7yodhOCRJ4ajFcglVMq/i32Dv+jABla8/CiQ4jr+QhHfaVfgSGrR4OCa0gucdL+n6Abcgdewvxq53ePHjWVO/iguZoZUlCHDxWOl2bcpOb3Vgc2b+1BqTjVKe480YX6YPLmJQehUScaOM=
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com (2603:10a6:3:24::22)
 by DB8PR04MB6907.eurprd04.prod.outlook.com (2603:10a6:10:119::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 15:41:31 +0000
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd]) by HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd%6]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 15:41:31 +0000
From: Frank Li <frank.li@nxp.com>
To: "M.H. Lian" <minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy
 Zang <roy.zang@nxp.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob
 Herring <robh@kernel.org>, =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?=
	<kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER
 FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, "open list:PCI
 DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, "moderated
 list:PCI DRIVER FOR FREESCALE LAYERSCAPE"
	<linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/1] PCI: layerscape: Add EP mode support for ls1028a
Thread-Topic: [PATCH 1/1] PCI: layerscape: Add EP mode support for ls1028a
Thread-Index: AQHZEWmyQszXKE+SiEOtDSsQo9pf5a6WXqnQ
Date: Mon, 9 Jan 2023 15:41:31 +0000
Message-ID:  <HE1PR0401MB2331BA1F1CDF8F8B8A4D26E488FE9@HE1PR0401MB2331.eurprd04.prod.outlook.com>
References: <20221216161537.1003595-1-Frank.Li@nxp.com>
In-Reply-To: <20221216161537.1003595-1-Frank.Li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR0401MB2331:EE_|DB8PR04MB6907:EE_
x-ms-office365-filtering-correlation-id: 7307195c-7296-4050-c4b8-08daf257faf4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  zti6F5hTPXmqeWa2rvOjoO7KYxsvesXz0Xl9ISBBaDrlBhK2qqx0t6wLAPdr38zs1p+bTZ2HvOhQqFTA40uODbsp99vKFsq3KzIPVJfMPGR+OhWLSlEOKfZTFB+G04sSq0e/4ZYLQgTE85IAJDpGENQy4eVqnr1F5jHPEhAnO3ZDSEdAkQVN3FCjVm3M/4iHVH2cqQiLZttQ8V5oXCf3ZNPgF2hsIc9s28YJj0g6qjoztlUPCmQDMS+fsANVx7AA4UokX+3SHAbpwbii96pOvhYhTWxz2qSsXVpl2s8FXqeMiRUcA1E5PQCKXmME/3O+BDA79pnJk4ylCeYVR0Xtpn8n/+AfoEHpfPJ3oRLJJd1rl3VdhONZ24mlMCLEjaNlMnizi9DsCP0XjJKE8U1Cp3QCq2brssekQ6iUbNwqZFEXC9bxzP4LfbCZbD9e4S5IQ8tHSq2Af66MpGw/BiBI2xeWCYF/Rg//zhdM5aos/uC1epmt7J8pPaZgX2qkwPkYOxafC9XMbIe3Y0wIbp8LwBL/ugz73c5deEdG5boLpBsGhl7D9YC2SGg2/gRY6TfaE5QL/csRQNr3WeEYHvTd6nOBR2HFrGOcLtglMGMUPm9UIccCU7HV1UV/L8yY5Io86oJIuL3fo7S3zlb2CVu5wYH/XjYhrmI1Bo7eV3EoF8ekXsSStRCkT9GDlUr/qH3WdYjccm/MUtD6LmtOc5ZPvWWbhwHdgYthFMaZgG1eq46Ll5qTHBp9TgtPGqZ9EqWn
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0401MB2331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199015)(8676002)(9686003)(33656002)(4744005)(316002)(5660300002)(71200400001)(26005)(44832011)(7696005)(966005)(478600001)(186003)(41300700001)(110136005)(66946007)(4326008)(64756008)(66556008)(76116006)(66476007)(66446008)(52536014)(8936002)(38070700005)(86362001)(55016003)(55236004)(6506007)(122000001)(38100700002)(921005)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-2?Q?8xvpevg3IdbvnSA5pd9linDnhXBnJvzR94tMYBhIZxYyCEn0Qk86zjN/tj?=
 =?iso-8859-2?Q?MZEX+Lj3iX8CU01FG6QCJ48dLUGkgBipUwwRYpGSgBGY6dVDpApMr7ukSO?=
 =?iso-8859-2?Q?dZUwrXS3PgYByG18fETwSXJ8Zvd+XtpifeOYPYyVgzA8vwOwbaEtVXnlcy?=
 =?iso-8859-2?Q?2JKpg6eIKQryp1RF+u/0apOLCCPYmKKsk8IROuvHHouwC0QU61SFZR3QK1?=
 =?iso-8859-2?Q?CcbO3xazDUkyn/EL27g0zpP/08oaaA0n/B7o/xehPaBOhMX7yr83SPiAFt?=
 =?iso-8859-2?Q?PI+TUm90ecKG+HLXNASOYN3SiUEojVLPO1BDRqo112rP0ZaDECdeSw6gxj?=
 =?iso-8859-2?Q?UiFgrsOMD+Yl+cSf+fl+AHTp4obmsFK/JFwzN66/FKwXeML65SIJsMlRoF?=
 =?iso-8859-2?Q?CIcKTotH67xLoSKt1zKabiyd/gv+5W1LJCITpKY3Rzzs9YUlWtKiCF5ZdV?=
 =?iso-8859-2?Q?O4FwrqQVoX28ValJXYdwhK1M7s1T9KscpQdU8G1rrlwuqUDsC/4OFoBK9o?=
 =?iso-8859-2?Q?VxwIT5OerLaKGabd2yguBR9rpH+gAYUc6infNZGy1xTlAf+cZCOfbIOBcM?=
 =?iso-8859-2?Q?E8dCR3BGmAVqrME1bR+xkSjICtKMUVa0leVyocb023reiij6Jmqq05T7g4?=
 =?iso-8859-2?Q?wQKfuqAbAJZeZWG/jCYl4udgyaBEZHtWG672ljizW+PN8jLPUjVZRRSlIH?=
 =?iso-8859-2?Q?sFQwXR34Zf6LiBD0jp23nRExgVi6lr4A6FRAjdJvwgtZQGZfomJA43Ua1f?=
 =?iso-8859-2?Q?xhHmyVQ7uh+DDSjHP6XR08u/gydGh+k1W/taKYK2o0eUHOcsJH4yo5BDST?=
 =?iso-8859-2?Q?BI6xVF92UwdcmDWRXiqmWkao1xClNmvNby8gECs6VrrECwOpercpOYXC8y?=
 =?iso-8859-2?Q?8DzEoB7KCSmniF24oFnbrxA5Z829cb3OFvm7+D3gk2SH5GqBdgRqTcTlt1?=
 =?iso-8859-2?Q?M6VRbcI4VRWIb3KWdBM+6Q1kNt8z+8u6Yb0EAGlxyd51D4G44/NPbGb8nZ?=
 =?iso-8859-2?Q?rG0IAhxNpIoqcVVqYQj3969nE9F9FrsehRQvue/YOYB9Pj3+ccdKG4aqj4?=
 =?iso-8859-2?Q?e+Zs/nJLqCm1ctUov3FLgV1WwNACKq3aZspngcIgL+JovX8CPJ4CydBAC6?=
 =?iso-8859-2?Q?xVPRnEwsij0tK9vErGXMwnRIGc6WiIlZlecvylNVo0z/tJ902eIHmKbaG6?=
 =?iso-8859-2?Q?lC7BpkHhXPbm66Fxg85HHd+lZHViH9UBXqm5K7Ql3otPl7NT/+EvYsxZHe?=
 =?iso-8859-2?Q?hzD7Rmup8fppo+xaC+hSMTypZOatNLdQoJtK+Ec1szBZKFg+QtxiIGRPDp?=
 =?iso-8859-2?Q?dnj2u3BJjX+vKF6dzwreRyAhBmeZya/37Imp0Fmpjkc08Wsmh6AwqLgmky?=
 =?iso-8859-2?Q?cn8OOEEc9U9Yh6LlRiS8/rAE8+h3sCFvDmLQJUqvpcVlImfxdPkUXTXb7J?=
 =?iso-8859-2?Q?9q/jTh4TqN5nahMBmoz+QOLlgutV8quIw90dHI7Tzy0Xac01qUZD2w70HM?=
 =?iso-8859-2?Q?RM3H3y6wma5K1obeiavOZEcgWI23au5pPopnahvifj80XkBaWoP+tLYKgs?=
 =?iso-8859-2?Q?+c5Hr0P5DScjf+aGMxUFzGu5ap8dw0C6WiAVUM+BMoCFblJlfXp1j4Zab5?=
 =?iso-8859-2?Q?8+4yDSWZwCrF8=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0401MB2331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7307195c-7296-4050-c4b8-08daf257faf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 15:41:31.2388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B9/E4hOU/1teRUPIoMUPUB0VqN8Y3CF2YXbJ09QbLlW8NI1CDisVer5jDoIL2+5n6+1sCbnBpJRRLpnD1xKjFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6907
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
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>=20
> From: Xiaowei Bao <xiaowei.bao@nxp.com>
>=20
> Add PCIe EP mode support for ls1028a.
>=20
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
>=20
> All other patches were already accepte by maintainer in
> https://lore.kernel.org/lkml/20211112223457.10599-1-leoyang.li@nxp.com/
>=20
> But missed this one.
>=20
> Re-post.
>=20

Ping.

