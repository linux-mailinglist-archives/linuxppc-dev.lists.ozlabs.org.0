Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B30D75B5360
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 07:25:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MQw6D4y9Sz3bxC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 15:25:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=gQvsGtt2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=104.47.24.107; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=gQvsGtt2;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0107.outbound.protection.outlook.com [104.47.24.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MQw5S0KFYz2x9C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 15:24:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwkrtsPN2Mf1mKHLQTmEegz98byI6IdEVdVB8xNRSKaX8hc08thhNy6f7Z55aIz33OxUa4HEpEJPJp6vfS8L6pJqrnlImnZ7zEfBnWEeV+UAwnHBfVdf48yX/z0hXo7y+nMxzvvQN82TIOx5E6oZoomErWahQGxXRKsrffqkTpiiH2JLRbFDtNebfrdq5B//XvvHfrGh53+rRsDIDDHfSbUasBY4d3rcgMWEsOCE+NQacksefRDKl0A/7e06sw9ANJqr60ktdjuu2yQ4pHJxKzPgIo2Go3XYDxb4bd/ieA6eQ4F9FZVdwO5cwAcwm8zam62Mwo6T2ZBq/6DLyGnx1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rR0ftWWWKNgP5/J2bjYmjFAW2NRAPZB/kIfFw6uRD/w=;
 b=VoI6+gbysYvXyNl4w37iycLZ887d+3NQMxdxrF4cF/cIi6zipvaFIDnVwnHwFcfG5y/rPdZMXVdIeSldmlrtFKRIMfKjtCDWvNuU6bOc9F8lBcnsRj4HE2d9h/bRX8G5LBj6L61po9n844mlEf3eTg8ZddDPHF7v9AzbaKOjM0ZCAtpLenLsfYDV95Er0L3m9zWkYKBtDHHAI/uoREciDVFoAm+XsDxU0hbd0DnV6laUbbE0gIiT0UWCKAELg1rS+5Xh6gwRZkl0OeBsU+VkY8eSAgb/5CMlh6wDwsTPipfexDQzqp/0e/WLFKUNvJ2e/VmBTupJVciPe8YeBMwdYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rR0ftWWWKNgP5/J2bjYmjFAW2NRAPZB/kIfFw6uRD/w=;
 b=gQvsGtt2C/RZSGr/0b0rqr1RMDOhP0T1fJSuvwys84WBfoayyhp7VKrADl7OCM5dNs5wM1NddVaTABfpwGy1dLzRvqbIJ4OUZAfAVKoVIgtAeh5AQDTcknNvspGPIzmVp5Tk4U1cl8kCyj5tqn2GLSI0DWJPU9c9A1HGlmeRR2RSIO+6l/tZJM/ldTAlwKaPnXkTrOltbtbkYVqihaBau/0nZWlylLpFdiaQ7v+2TwRyKcnsekWXB3KcyUHiwCa6Ky6fP1ecLTorFeU0as+ffeuDph6sG52ZpWIdy+o2gQu9S4AX/KBbWktCF4t5TxW8rvwq7Cs5gTYAVyiJQHjFiQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB3381.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:126::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Mon, 12 Sep
 2022 05:24:21 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 05:24:21 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Hari Bathini <hbathini@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: Re: [PATCH] ppc64/kdump: Limit kdump base to 512MB
Thread-Topic: [PATCH] ppc64/kdump: Limit kdump base to 512MB
Thread-Index: AQHYxHNmJTXiUOLLAkC8CLJfIXL6Lq3bRusA
Date: Mon, 12 Sep 2022 05:24:21 +0000
Message-ID: <023c95f4-cee2-221d-0fdd-e3ab677483f6@csgroup.eu>
References: <20220909174034.34086-1-hbathini@linux.ibm.com>
In-Reply-To: <20220909174034.34086-1-hbathini@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAYP264MB3381:EE_
x-ms-office365-filtering-correlation-id: 82edccee-1cad-4bd2-d9f5-08da947f0c13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2BLXHz/7f/xO69xKkUuspn6XuZOROKNWez1Z/w3SfS/LxahypVCKJE+sHSXI/JDfrzqXtcqWmx+g5rgiN2kfGGtnlzrDNHFF709rUmIBx9HCNfNTrJJ0aKEfzEq+C3ry+Y1E89CqDtpnXWSAHo68phBxEZp0VSat3nq+71gkYdGeuKR0OHK4+ocQy6peyZcZu1HaLyJkIGX7uM5s6lbbIuPF+CGrUgW1Epv8E2AUDa0XyfeEqcm3qv68kG+lrlaal6I3W+PhzbVPdBItorqXh+xkjWVbi3TbQIxxTeYC1cLxFBSZ+SgRnDnuW/lT3E6s+YWAVA+dP5t5LqNiPv1JZY3JC+6DbYm3Nq8TQvL584omgRpTgSGjl8VGWDI95uhXKM7SCxjC6lx47ERE4FVpzvAL5aajvM6Pmg0w7neBG6erbDTAE1vbvO1yZGeTXzMQ1cxETbzCmv/n4+ErCl/L7iqEJ1aClnlUG9jyG/NXoDpEuhGgbLI7YZnktL47kMWB2LSwpWXioRkTyLKT26KO5pe33cfEvToUMBrAiplDQhNfFVCeumwZlALcnrsh+j7Ww4HO/HQ7xGQZNVHLWvl2wIFdz3gDCk+UGA8xi85V7pGO9n27LzG2ndKe5L1Wkg7Q/KG8gfA6u5ZbY5QTI9ccNo1zakkU3hT5HkC7ScMZH1xXDmg3XF13njSbfmN+eMGTzRKXxT19FWHEI/+sTMwBRu/SgVdV9TQjZZybI+iAM7dqIpZEePcVjbNUx6GSBdbL4ztNZ3qttU7FHRyNrQNhRx3ITZbH1qt6l4/RZ+O+4fkORgolIGEEHfPs7ZW8QxDXQnZsUfkzJj9byJc1OAoOhA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(136003)(39840400004)(346002)(396003)(26005)(6512007)(71200400001)(41300700001)(6486002)(66574015)(83380400001)(478600001)(6506007)(2616005)(44832011)(8936002)(5660300002)(110136005)(54906003)(2906002)(186003)(316002)(38070700005)(66446008)(66946007)(8676002)(4326008)(66556008)(76116006)(91956017)(64756008)(38100700002)(66476007)(31696002)(86362001)(122000001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TVlpZmM4b2RRVS82S0tmVDJnQ0hQT2ZtM0ExRzd0NDBRa3MwaTZ2UzRpSkw4?=
 =?utf-8?B?Q3hlMHhjQktzTE5xcFFOQWtUYThUaDlBaDQvM2YrL3FpMEtqVDg1ZDh5UUIr?=
 =?utf-8?B?V0xkL3QyVFpIVTlaM3lNa2duMEEvNHE2bkFPNXMvRHNvd2pVS2F1ZEFDSS9S?=
 =?utf-8?B?SGlwandKL1c1dzl6T1RTeHp3Ukt0anVEOGhXU1FNNTZoUVcvcWl5V3JSRmZU?=
 =?utf-8?B?VVVGWlpLNmdqZFZsSUVWTERCZC85UGxpZ09xRjdQaWgyYU5OVDd3NjFXL0dX?=
 =?utf-8?B?eUZGVFZWYXRwNU9Ia0h4ZGFGRnlPaFNwK1lRQ1VhR3JHU2gvMnFOZXJYOG1i?=
 =?utf-8?B?NjVrSlA5MytBaDFHVFkrNEhSQmNoTFFybkViY1N1bVAvTlVocVpLY2puYS9o?=
 =?utf-8?B?OEZpZmdLcVJYeVNVQjNFQnh2ZkdMd2dVWTVOY0VYcWhaL3FLTHdubmV1S1Vi?=
 =?utf-8?B?THpZVUpqbE1CTXJyRGpjemp4ajBNV1Z5WEppbi9iM2Jianl0cVgwNjI2RzVj?=
 =?utf-8?B?RUFxdlE5dE00VFI4cVNKV3pyUUllYlR0UEE2a3FRSFQvdTY3TUU1enBaTTN6?=
 =?utf-8?B?eTM3Q0NESHJSSzVBekZDajdNdlU4UUVGeUhTRWFwSzk3ZDJBVno4Zm9KUWNZ?=
 =?utf-8?B?WkVpTXdjRkFXdmVhNHBQRURaSDQzWkp6dHFmekx6SUk0Qnd5TnRkbWtrL1JM?=
 =?utf-8?B?dm5xVDRzTkhsMUROQktUaUFjOGlCMXZ2bmZMNFhjU3BDbU84eGhuQ0pUdDVP?=
 =?utf-8?B?aFNTZXQ1bnpRTkJvRjg5QlFjUi9MWjdEY0pzNFFRWFgxR3R1c2xvRk4yV0N6?=
 =?utf-8?B?cis5TGhNalpBZVJJWFNTbk5rSzUzK0hvWWpGamRudk5oUFJNNWxqanBrOHM1?=
 =?utf-8?B?ODQ4akNtWFFzeHdvcXpkNWtUR2dUSDlZeFB1RDdxNys1dDhyL0trY3lxUDhx?=
 =?utf-8?B?QkluemxMVjd6dHpEVG9zZFFKeXRRREtsTjB4TGdtZ3hCcDU0QzE5bTM2bXV5?=
 =?utf-8?B?REJ3ZkJKMm1XNFJDbnliWkV5bWVReFNSWDNjeFgvSjJCK1cyYTBtVkQ2UHd0?=
 =?utf-8?B?Z05lVXJyL1JRWWlISUo3S1FIME1CWEFOT3JvUmU0R3dDOFBIU0k1MW9JWGJr?=
 =?utf-8?B?RDhKQXdlalhHQkQ3MzhjR21Ha2QxM016QVV4TW1pSGxkYUpXV0JRVVpLUndB?=
 =?utf-8?B?NzZtWWpVWmRZQk4zajdCVVg4aGh1VXVhTmRCMHlXeWtOVTl5ZG9Rd1pGVVdR?=
 =?utf-8?B?ekdwUVNMYm5pd1NYUVo0N09Fa2xyaFJPaURra3pnUGNGUzg1RDQvb1ZnVTdz?=
 =?utf-8?B?UjZSeXpuVWhxQXRnYlQ4bVI5cCtwWGVuVGVVTEUrcms2dzVZR3pmQUVMLzVi?=
 =?utf-8?B?SUh0aG13ZUduTUFKZ2pReHVoYVp6K3lKZVdqMUxheFN5eUVpK0NqZnJYQmlN?=
 =?utf-8?B?SVJSeGlOOXZFdGhCY2hsRy9FM0ZLa21HRWlGNjhSQ2xyWWtuVmNFV1Z1NVNu?=
 =?utf-8?B?OGdGL3ZCYVBKSSs0Q3pnWGNFQnlqNndteWdvNms1cW41eDhNVHZrKzN2OVdJ?=
 =?utf-8?B?RVljdnZqNmVzTWNDcEU0T1ptQTUvcHJlbU54UTRZU2F3S2RFR1F3NG82VG5H?=
 =?utf-8?B?NXU3TTdsNktFUGQ3cHVMT3M3Unc1elBEV0xud1BscDQwMzMwQUFMWUowbkNx?=
 =?utf-8?B?TEJUVUprK1RuT0pjNmlGMUhNZGVueDIxWnE5OFZMOFV6S1lNRjBwTXJ1czFH?=
 =?utf-8?B?eDZUa1hISjhKRDFHckRWOFZMM0hjc3dWTlp2S3BHa3pQQ2tzT1M0Vk1nRXhO?=
 =?utf-8?B?QitOdk45aE5xYis5QXgrMXJUYzdXcXdrMHNOV3cvbjhQWmt6Y3BTamZ5QTNW?=
 =?utf-8?B?bmduL1BpTU1SMWNKZVp0cjZ3WEtRa09Vd0ZrM0hOUk5KdG5vclFkekJiVXBX?=
 =?utf-8?B?L2Q2QkJPWXM3WUJqdElJay9qNVMyMnZCVFZnSVVxS216MnFSMUlPV0RkZ1ln?=
 =?utf-8?B?VGQwa3V1cmdLR2grc0gyNEcvQU52Q2d4cGVTMXdEZHNodWtnMFZUZnJaVHFj?=
 =?utf-8?B?cU9oVGxwRkNsNjQrbG9uSUpZR29EY1BLNnhjUmpVRnRBeld2TWVGbTdHeDd6?=
 =?utf-8?B?TXNOWUdSRkU3aFJxSnlJVXdpaERpb1dqWEdHUGliblVwNHpveEpDUzBwRzF6?=
 =?utf-8?Q?R7c47l6REHOoHOZLgmD9EpQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A48336DEC6530C468001D5726A018623@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 82edccee-1cad-4bd2-d9f5-08da947f0c13
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 05:24:21.0575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rk1GqNAxTl1jVo5P4ck4KeOJuH2oPAqOlt7zn50ax3zLa7ztRt8/h5DwlwrKL2IkGZgVFg5vEbXTVmYviHVNUWBGZIcEkwuRns/ryJHzZtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB3381
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzA5LzIwMjIgw6AgMTk6NDAsIEhhcmkgQmF0aGluaSBhIMOpY3JpdMKgOg0KPiBT
aW5jZSBjb21taXQgZTY0MWViMDNhYjJiMCAoInBvd2VycGM6IEZpeCB1cCB0aGUga2R1bXAgYmFz
ZSBjYXAgdG8NCj4gMTI4TSIpIG1lbW9yeSBmb3Iga2R1bXAga2VybmVsIGhhcyBiZWVuIHJlc2Vy
dmVkIGF0IGFuIG9mZnNldCBvZg0KPiAxMjhNQi4gVGhpcyBoZWxkIHVwIHdlbGwgZm9yIGEgbG9u
ZyB0aW1lIGJlZm9yZSBydW5uaW5nIGludG8gYm9vdA0KPiBmYWlsdXJlIG9uIExQQVJzIGhhdmlu
ZyBhIGxvdCBvZiBjb3Jlcy4gQ29tbWl0IDdjNWVkODJiODAwZDgNCj4gKCJwb3dlcnBjOiBTZXQg
Y3Jhc2hrZXJuZWwgb2Zmc2V0IHRvIG1pZCBvZiBSTUEgcmVnaW9uIikgZml4ZWQgdGhpcw0KPiBi
b290IGZhaWx1cmUgYnkgbW92aW5nIHRoZSBvZmZzZXQgdG8gbWlkIG9mIFJNQSByZWdpb24uIExp
bWl0IHRoaXMNCj4gb2Zmc2V0IHRvIDUxMk1CIHRvIGF2b2lkIHJ1bm5pbmcgaW50byBib290IGZh
aWx1cmVzLCBkdXJpbmcga2R1bXANCj4ga2VybmVsIGJvb3QsIGR1ZSBSVEFTIG9yIG90aGVyIGFs
bG9jYXRpb24gcmVzdHJpY3Rpb25zLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGFyaSBCYXRoaW5p
IDxoYmF0aGluaUBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva2V4ZWMv
Y29yZS5jIHwgNCArKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2V4ZWMvY29yZS5j
IGIvYXJjaC9wb3dlcnBjL2tleGVjL2NvcmUuYw0KPiBpbmRleCBjZjg0YmZlOWUyN2UuLmMyY2Jm
Y2Y4MWNlYSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tleGVjL2NvcmUuYw0KPiArKysg
Yi9hcmNoL3Bvd2VycGMva2V4ZWMvY29yZS5jDQo+IEBAIC0xMzYsNyArMTM2LDcgQEAgdm9pZCBf
X2luaXQgcmVzZXJ2ZV9jcmFzaGtlcm5lbCh2b2lkKQ0KPiAgICNpZmRlZiBDT05GSUdfUFBDNjQN
Cj4gICAJCS8qDQo+ICAgCQkgKiBPbiB0aGUgTFBBUiBwbGF0Zm9ybSBwbGFjZSB0aGUgY3Jhc2gg
a2VybmVsIHRvIG1pZCBvZg0KPiAtCQkgKiBSTUEgc2l6ZSAoNTEyTUIgb3IgbW9yZSkgdG8gZW5z
dXJlIHRoZSBjcmFzaCBrZXJuZWwNCj4gKwkJICogUk1BIHNpemUgKG1heC4gb2YgNTEyTUIpIHRv
IGVuc3VyZSB0aGUgY3Jhc2gga2VybmVsDQo+ICAgCQkgKiBnZXRzIGVub3VnaCBzcGFjZSB0byBw
bGFjZSBpdHNlbGYgYW5kIHNvbWUgc3RhY2sgdG8gYmUNCj4gICAJCSAqIGluIHRoZSBmaXJzdCBz
ZWdtZW50LiBBdCB0aGUgc2FtZSB0aW1lIG5vcm1hbCBrZXJuZWwNCj4gICAJCSAqIGFsc28gZ2V0
IGVub3VnaCBzcGFjZSB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIGVzc2VudGlhbA0KPiBAQCAtMTQ0
LDcgKzE0NCw3IEBAIHZvaWQgX19pbml0IHJlc2VydmVfY3Jhc2hrZXJuZWwodm9pZCkNCj4gICAJ
CSAqIGtlcm5lbCBzdGFydHMgYXQgMTI4TUIgb2Zmc2V0IG9uIG90aGVyIHBsYXRmb3Jtcy4NCj4g
ICAJCSAqLw0KPiAgIAkJaWYgKGZpcm13YXJlX2hhc19mZWF0dXJlKEZXX0ZFQVRVUkVfTFBBUikp
DQo+IC0JCQljcmFzaGtfcmVzLnN0YXJ0ID0gcHBjNjRfcm1hX3NpemUgLyAyOw0KPiArCQkJY3Jh
c2hrX3Jlcy5zdGFydCA9IG1pbigweDIwMDAwMDAwVUxMLCAocHBjNjRfcm1hX3NpemUgLyAyKSk7
DQoNClVzZSBTWl81MTJNIGluc3RlYWQgb2Ygb3BlbiBjb2RpbmcuDQoNClJlbW92ZSB0aGUgKCAp
IGFyb3VuZCBwcGM2NF9ybWFfc2l6ZSAvIDINCg0KPiAgIAkJZWxzZQ0KPiAgIAkJCWNyYXNoa19y
ZXMuc3RhcnQgPSBtaW4oMHg4MDAwMDAwVUxMLCAocHBjNjRfcm1hX3NpemUgLyAyKSk7DQo+ICAg
I2Vsc2UNCg0KQ2hyaXN0b3BoZQ==
