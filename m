Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C98754AA23
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 09:13:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMfmQ3N5sz3cFN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 17:13:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=oC8m3Ifq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60d; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=oC8m3Ifq;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMflZ0yBmz3059
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 17:12:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKPTAa7bl5nqsQl47z/O2nTdSrJucFXWrXQYFCev0osAz5bojpJSlOCFZbQbgcp4jLWlrQKJqF7Eh7rlDohOm1+nsfZ5VSGOE6VeaifD7vd5PyLCsw3KLYjKZBTbIDptMUZigWXY6ZXHgxFsuh9HWGoCVksfDksySenQDlwdapzE4DyyvzapFA1b2F1XFy0cE/sS8js7OXkMvzxBkYEBjHkc12vBVbpY3N2QdDUlPtpSI0kqT5Z+6NkqnNWXGf7TCLgT6eiKr1xt5QbObenbnY3FAjXcbtO6MVKTOVl0B+qPyUQ6MdDZIMu9+47Ih45ONwUeMXMdGzFlC2c0NGOTfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojA/LJBwvNdmwJ4/22hehqP2ew0Opn/3H3h6CB/5RFU=;
 b=Phz8Irrg5aJGn7E++tad1/ChKTh0/CqVnCkodohUAwPDsSqcdE1CzqsG4Par9Gs+Zvw2+ah9Io21uKCdFZlGCZJPBmAG+z6LspoWqITgyTBcR+5QAVJiBOeEr9FbXABIXmw+kABgaSo++zhWq3ZfIGGX8yuZJxDP0KyvYAkgZF+Z1ahMepgA4sWWrnpi+cUPLVXKiTRKP0U6bc+fQ7jYudVAQkh5aYDySSiqlCNZR/ADVBMQtaf5THF65jgUjffoE6zRmB7RbDUF6quOcRyCEcuVcHlWf8WC75VTLQQAecbENCas28drzV5kp0SAS8Art+Alc+cNUWcMBpF50016qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojA/LJBwvNdmwJ4/22hehqP2ew0Opn/3H3h6CB/5RFU=;
 b=oC8m3IfqIPLXseqTPNRtKQOKe3ncGM88gKCadZ0QThMpg2Yv7ZcMQX3FcNqlsWYQMykeYnzXWZhnKMcZUeVni4+Ws8iwMYRr+axBAhirgPlMbsKEbpENvjX/+4kPMlqDVbd1Q9neC7BVQnwBeAXNnn9HhToL8Ox4LsgAonR35XzwuV0yNEfeoE5Y03lN9umCL8+WGtkdcYOBiH6FMtEG3ZdUq5CgDalBpJjkr4D2dJnNBhmvEgisza7LR8nHX3TvYoQHF2QhnOBGNEEHvl61E4UdWZUolXvyKciBAxbNZpHTX3o5VT3a1S3vrVIa5iho36st+8OjMFJvdE1nnNHSHQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2740.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:39::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11; Tue, 14 Jun
 2022 07:12:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 07:12:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Greg KH <gregkh@linuxfoundation.org>, Wenhu Wang <wenhu.wang@hotmail.com>
Subject:  =?utf-8?B?UmU6IOWbnuWkjTogW1BBVENIIDIvMl0gdWlvOnBvd2VycGM6bXBjODV4eDog?=
 =?utf-8?Q?l2-cache-sram_uio_driver_implementation?=
Thread-Topic:  =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggMi8yXSB1aW86cG93ZXJwYzptcGM4NXh4OiBsMi1j?=
 =?utf-8?Q?ache-sram_uio_driver_implementation?=
Thread-Index: AQHYe+v2lxuFI4e/SkKc+NMp8W40uq1HDpsAgAdkMYCAAAbjAIAACqAA
Date: Tue, 14 Jun 2022 07:12:18 +0000
Message-ID: <fcbb81fc-848e-7de5-6a59-05d8c98b41d6@csgroup.eu>
References: <20220609102855.272270-1-wenhu.wang@hotmail.com>
 <SG2PR01MB295139AA7360917B2C4846E19FA79@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <YqHy1uXwCLlJmftr@kroah.com>
 <SG2PR01MB2951EA9ED70E5F766DD26A069FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <Yqgr5jKEypU83yBF@kroah.com>
In-Reply-To: <Yqgr5jKEypU83yBF@kroah.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a95b7a13-9ecf-42cb-3fb5-08da4dd53781
x-ms-traffictypediagnostic: MR1P264MB2740:EE_
x-microsoft-antispam-prvs:  <MR1P264MB27400E1A16895B12BFCA68EBEDAA9@MR1P264MB2740.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  n+H4VFgk2qSMVM2iONAMfGy+KdAMaeMyl4heoPtfSocQhnLP3hthQ00RuqCSIWd66jSp5qJeAeLcXw/RLqiDpI4vFT2+j4E2fqCBdgoRJ1ougPtOmLhnkzGQQT41uJGaUJu2Xbn4OCv6heaL+GZV44YUcfRPk8OGWdqhn6sOiFDbz+KB1SGi0cmYxz/km9cxPOSeg0TbzzcTuuUmBt3OtCuEstKkl1MzuaPQOvH3SdtkwVPca7zRyOnLTfkNodaRn0kBlsxTxBM/W9VWnRcl3N6lEYDiA4MfRGFYUpdpTx9TYzIRgh9JFcCfdhRAIzVaLF6qli6pv3k4OgXK7sbr0MyK8b2ueUYt+do+4nJOo3VR9zEbDb02HQuzyBajENEwiaYBYSqyBRY48HVXKsKMR8IWW3rbPmJxwlRVRbNO1/aCGjEy1YWHEPXgNHpIpHsAKFq6v9DsdvSk8ilgiR65U4QclYmN8g/nVoFGkKkJegnlc20HZGngEdsE2ffAiZVwCDB42gE73Lmn0XEqOZpJemmXwBlM9JptFoXZR/Jii87Yvt/s/Qqi0QTFYhzl3pGWmOYdPceQXOo3DZHnwFEAjPkTDwGODkQYbU/zVF+UUszpkklY1xRHcbfn+0uAyzV1pWJJUxRol9KBFsNcoc4I8EdUknByoTOHNLRew5FWoAJzxEVhIrnoHVYWaSqPPPjlqkRwD+ls395Kk1labJRrz02bhGu6GsqseRC+arbQIrUNVGsz21myG0qlCs7CUtxRNJMS6tS8lfNUrhSIagazy/BbY0tes3tjk+cHaKzxi/a/XOJ3evcNkOb+1MPzOJcTTCjKLIgK72KYwg7Byd+mojMg9VDCXxf267Zu0Y9PPKY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(36756003)(66574015)(224303003)(31686004)(110136005)(83380400001)(316002)(6506007)(186003)(6512007)(54906003)(38070700005)(2616005)(8936002)(38100700002)(966005)(5660300002)(44832011)(91956017)(122000001)(66476007)(2906002)(66556008)(66446008)(4744005)(4326008)(66946007)(76116006)(64756008)(86362001)(71200400001)(31696002)(508600001)(26005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NWgyc0dHdUI4cG13T2pHTVNjUWNOeXBoOTYvWDhmZHE4S1JPcHNUSFV5UXc0?=
 =?utf-8?B?aDRaSkNtQW9KOVNKTmdmUWVDcnhQc0NhNTc3NkNRYXF2SGl4b2Q4aXVXc0ZN?=
 =?utf-8?B?RElnampzNWZ6ZjF1Y3VIU05FWGhTejdiRG1OdksyeWowbityWnFNMDhQdUpS?=
 =?utf-8?B?MDc4aHBmY3JPZ1JmdW1CNzJGdWpOaGhZaUtBcHNNK1diL25qekhuVVRLTEdE?=
 =?utf-8?B?cm5iMGFPY3dsUUIvSXpHNnNpclRpbEs1Nm9KYjJGNWE1ZW5Zdlp3WDQvZ2Yw?=
 =?utf-8?B?U2krM1FaSWR0V2F3OXkvcmtCQjUyMXlheXlaZTdEL0dFSld4V1Fqakc5dUdL?=
 =?utf-8?B?R0RiTXBEcGFpZUtZelJQbFBYbEdOS1U1QzFsRTdiS2hGb2VaUUgzZWMzTzNL?=
 =?utf-8?B?cytGRGJwMEVlY3Uzem1BNjJvZU9VbTB5OTFJNG5Dc2JpNCtlZWlPdFRoZ0hj?=
 =?utf-8?B?dDVtTUx5ZDl4bVh6dUNTeWF3aUdrTGhXaVRVR3BhK0ZzdHp3bnFrT1RpMDJ0?=
 =?utf-8?B?SjdEYVpiNFpncHVRRlFnSGR4TkwwaHFYN1orbGhpQVlSQjhRZXJHbm9weHRu?=
 =?utf-8?B?NWlnRDJ3eDRNNG5BMFB6ZWxjTzR4Q0RMSFhONDYyUFpmYWkyTEpHeHErUXFN?=
 =?utf-8?B?bjIzR0hNUGJKbHJTK0RyV1N3akl6NEdheWRBMHlYVmZMbXV6dW9ScyszZjh4?=
 =?utf-8?B?Y3czNlh5bzVjRkViaTUyN0tPNmxxUktvdkNmdGhWaDlRNzR6ekdHVDRGRHlj?=
 =?utf-8?B?M0lNcm9uQTNOd0pyMkxDajR4MEFMSDA2S3hvcVc4U25EeFlIcmRCczZ4Y0w1?=
 =?utf-8?B?V0tiS1lpcWUzZVM1VHh2RUhBemZjSlJ6QWhpYndxK0Y4QU82cnVwSkgvcVBh?=
 =?utf-8?B?R0Z3WDNBZ2pzWHZUbnZQQktJaHZYK3ZQRVBoRGkvL0xpVndxcE00ZHo2WjhR?=
 =?utf-8?B?aVdpV0FXazdrdTZQQ2FMVVE3RkpGU2w5dnRSQjFwTTY1NUxnSFoycXJ3QS8r?=
 =?utf-8?B?RThZNFA0WWxjZVpja0UyZ3o5N0s3c29BSkV4L2l6WURYcHpnSEkyZ3J2bFdY?=
 =?utf-8?B?Qm55dTJvZDFUcVYxTDlEUGI3Qi9mcVQ0K2I4WmlydDIvUkljT0IrVXR2MlZz?=
 =?utf-8?B?R3R0NVFDT0NtNmF5bEUreGV5QStVMjZaS2t2dHNjVWZrYm9FeVdRNGVXQi9B?=
 =?utf-8?B?ZmJEZ2tDYVZRcWtpckVpclhqeGFlSVJUb2xDdjhYQnY3b085Y2lCQU1RbXFU?=
 =?utf-8?B?VEZ6TTNtcEozeVphbGdCNzRjRFZ2Uk05STdjSG1RY0ZGV3BSYUx5YStiWWZq?=
 =?utf-8?B?S1BtdHkzcU91ZVp0TGJMT3QrYjh4bGREWTNNdCtXb1M0MHpUVDhlY05yMStX?=
 =?utf-8?B?V0h1aHRjcVhOYkdpdm9sQmFWcEVBem5JT2hFNEZibWtEek1KWGFtdjNrMzAw?=
 =?utf-8?B?OGJvZlN6dHI4THdUUExSNmtiUDF6OFJYNWpoRDlQQ3Y4dFk5U1RPdmdNa3VP?=
 =?utf-8?B?TzMwbXVJYjd3ZERLRXV4UEpOanR5YkErZU8xNEJJWVcrbDdPT3E1L1QwVnV1?=
 =?utf-8?B?bFA1cGpMdlRVdHJldmYxNzcxTlErNXRxdjRVY2Jsb0p3UnVZcjFEUFo4YVZz?=
 =?utf-8?B?R1hrTUJ4TWdPUllUcFVJQ09xMEVCc0JpVWZaU2p0T2N0aEZJRi9mTkRoL3Az?=
 =?utf-8?B?VDFzbDdVNE5YZWU0VHpySUVFTy9paVc5QkdYc0F3bk84N0VSa2JrZGFyL3hR?=
 =?utf-8?B?SG5zR2RHQVByMjZ1TmMxZEtjeUVCSGNhT2tDQUZqalJEMjJodW1SYjhJNFFW?=
 =?utf-8?B?aklOd3dKUzNFZXdtWnh5dTNwYTRqQ0R2SjFwenAyVWNReWtybkdXN2tUTDZ4?=
 =?utf-8?B?QS84MURwQmhqOU9EVGhCeHJxQXB3U0pSQ25jd1M5MWpjK0tWWGtYRSt4MFBy?=
 =?utf-8?B?RmRTVHVGUU1SelN2amJSbGxKc2hGc1lLWit2ZnREaVF5ZnVNclQzSUdQRmFG?=
 =?utf-8?B?d25HU0YvTlFjU25UWGNTVWU5K2ZkdnRMWGI5YWFDTlM0OTkwR2FJSEpPY0lD?=
 =?utf-8?B?dk9RaVoyYWZ3aTdudDdTaWVuTkJLOHpPWncyeURMRUlaNzlBamVkMFhSQzk2?=
 =?utf-8?B?djJDWFFVY05qY0pqem9UaFd4RGNWNFhHOEdGbnAwbnlVL2I5ZXl4MnFyR2U4?=
 =?utf-8?B?UjNkaVArd2JHaEdydUc4RmpqRlIyaDYvZWRkYnB1LzVxRVB3VzlMNGp2d0tT?=
 =?utf-8?B?LzQyQ25DRjVsU2NHd1BmdVlwMkN0YTFiTzk1RTBKc3p1OWNmNVJDMUtTWElm?=
 =?utf-8?B?M2tYb0JNTWloWkxlQUVmemVxaE9Xbm5ZZEpQQ29ubVVoRThLdXBmaUVVMkl1?=
 =?utf-8?Q?GJpuS+t2ixw/wuo8nX1dNJsSRdPam08u5mQM9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08ACAB388AF04347BE0D9AE085321AC2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a95b7a13-9ecf-42cb-3fb5-08da4dd53781
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 07:12:18.0467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g38LlXRdI14edDLcST4TA3v6XZ37CMmQ85qN3Ele4Aq8wyUYfOYb87xiurxKNesV2o6QkRocBqeKXKUQu4uU+YqNBLaiqFgxp3GGk95UD78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2740
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzA2LzIwMjIgw6AgMDg6MzQsIEdyZWcgS0ggYSDDqWNyaXTCoDoNCj4gT24gVHVl
LCBKdW4gMTQsIDIwMjIgYXQgMDY6MDk6MzVBTSArMDAwMCwgV2VuaHUgV2FuZyB3cm90ZToNCj4+
Pg0KPj4+IE9kZCBpbmRlbnRhdGlvbiwgZGlkIHlvdSB1c2UgY2hlY2twYXRjaC5wbCBvbiB5b3Vy
IHBhdGNoPw0KPj4+DQo+Pg0KPj4gQWN0dWFsbHksIEkgY2hlY2tlZCB3aXRoIHRoZSBzY3JpcHRz
LCBhbmQgdGhlcmUgd2FzIG5vIHdhcm5pbmcgaGVyZS4NCj4+IEkgYWxzbyBjaGVja2VkIGluIHRl
eHQgZWRpdG9ycyBhbmQgdmltLCBpZiBJIHRyYW5zbGF0ZSB0YWIgd2l0aCA0IHNwYWNlcywNCj4+
IHRoZSAidm1hL21lbSIgYXJlYXMgaW4gdGhlIDUgbGluZXMgd2VyZSBhbGlnbmVkLg0KPiANCj4g
VGFicyBpbiBMaW51eCBhcmUgYWx3YXlzIDggc3BhY2VzIHdpZGUuDQo+IA0KDQpTZWUgDQpodHRw
czovL2RvY3Mua2VybmVsLm9yZy9wcm9jZXNzL2NvZGluZy1zdHlsZS5odG1sP2hpZ2hsaWdodD1j
b2Rpbmcrc3R5bGUjaW5kZW50YXRpb24NCg0KVGFicyBhcmUgOCBjaGFyYWN0ZXJzLCBhbmQgdGh1
cyBpbmRlbnRhdGlvbnMgYXJlIGFsc28gOCBjaGFyYWN0ZXJzLiANClRoZXJlIGFyZSBoZXJldGlj
IG1vdmVtZW50cyB0aGF0IHRyeSB0byBtYWtlIGluZGVudGF0aW9ucyA0IChvciBldmVuIDIhKSAN
CmNoYXJhY3RlcnMgZGVlcCwgYW5kIHRoYXQgaXMgYWtpbiB0byB0cnlpbmcgdG8gZGVmaW5lIHRo
ZSB2YWx1ZSBvZiBQSSB0byANCmJlIDMuDQoNCkNocmlzdG9waGU=
