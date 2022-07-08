Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 641AD56BC06
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 17:07:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lfc8d2dKgz3c9K
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 01:07:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=AIzJCWVb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.48; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=AIzJCWVb;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90048.outbound.protection.outlook.com [40.107.9.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lfc7r2YpJz3c3D
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jul 2022 01:07:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sb7TBTQEIdNKcxYufOVPNOYZT24d0INdyiAJOL8nUWTwIVkQeTmOPKuXbNdp7pmRJcHMMhXC3bxceZmSTZLXVR79G5mW6nnZuRe1hvUaiwKgxXBIojklkK+EDASyH2wwzWoLx8U0etgp8JoKbMLdIegheR6dSF8hw5IpeBKnMC8X11ZApIYMEE6WoE6OqrhO12NRyszWa0912KfLVaXtglM7O6du32Q0b1u69NtkRUJULrmY2+rdPjKbkzJtILqWKUAVLayHd1Ag9A4c0e0R9GQ9GWaXOcbd3JG8wMGWUFUu5hQKi/8KwIT8naEnDO7hGgwIXfKmR9d9ClhAc4HIWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPH0x6OJg0KFjbxAoPd1ITfGcgRtHLre+h+p0A4NFfA=;
 b=fqzX1FlvkrtI3AiFwBV3wTMIiBTQDjL6Kc5XK0WTmKPZlD3gc2DBBEEJ7v24H0XnLeQnLn07bD9Ys2W92I7+VW5XJ7jHrNuT9n9N8+pVVPb97IsMRkO4zilUb35rf8y62HK+2JAaqT14SKpeY7SIbupxYWWcEDC9MbgW7bKpnhF0JGsnGIEJQ4E5HVIhSHlfjtQHXTKRGgPx73GBI4wUaJtn5OhI/2CFDGOHESO0IrR4QdTTFWmOJ6+ayXDHZFqjkV6RMWf92wwEdtTYy1Hbbihmgm9KjWfgdNETvCusaCTQq0ntuw9heQjvaJ2gBPRv16pYRUERMbHY8iDeo0uebg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPH0x6OJg0KFjbxAoPd1ITfGcgRtHLre+h+p0A4NFfA=;
 b=AIzJCWVbKwKDVNHBLeXIUb4wQAQp31IZWPm2bshC/8JVFJp9wprQRi/B3ujiEL3yfpCr5vj3NC2FKncbav0pmYqY96ZRvyeEdQ7AWuYosNgfEPDzG5K5ZvjR/k23zStNZX9k6eyRXUF00PgTfKT3r58fSNVsxVsF7/THPYd18vwAC2QellHnh7RBkqfgT6+Y/9QkbpouzJ//J/VS40K0yr9a4+1yAoYbUrMm1YrfMI8yiggTWraloIfejijUAtNCEM3g3t69MaeNQ+MJIfrPNJJjSdHPnx825O0ee0/vSATSChVD7Knvuet1bqIHIvcZZwMBLVU1HMj9GmaJAZ4mpQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3701.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:12b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 15:06:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 15:06:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH v3 00/12] objtool: Enable and implement --mcount
 option on powerpc
Thread-Topic: [RFC PATCH v3 00/12] objtool: Enable and implement --mcount
 option on powerpc
Thread-Index: AQHYh/jTt4XM9iGd6U+iyGUaTIL9hK10qLaA
Date: Fri, 8 Jul 2022 15:06:43 +0000
Message-ID: <ae669ab4-681b-1a0d-3bbc-4fdf13b501a0@csgroup.eu>
References: <20220624183238.388144-1-sv@linux.ibm.com>
In-Reply-To: <20220624183238.388144-1-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f9c1d8a-7ec1-46d4-c4b3-08da60f377e7
x-ms-traffictypediagnostic: PAZP264MB3701:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  S/qPaHDLVb/eyYmAFGq/z65vStJP7eGQTCIT5kYYuNR0plKkd4jqFfd5oLmS4RJEihSqv+sm9cec5TsiL/iHcyaNvEbaWBthWRioHD9QtVzZAz9/8ESWTSeg7QmdPBkR/GD54w1M0Yq5NcjEjchfarYDQJoagXjfTh+vDDj9WOqTJ53UbreV3y0U6QCYseJK99BU8zD19V6TE9/6UWuQW0/Yyvx8w/Ii4p0Lvtzl7LmZCqPY+MekxD+ZHPFDQKUgJNt/vJPMpuVH5+uM3TsrzZgI1Xe+ibx+iq5qFBXhksnUeRDepb0ZaW8NT2LwvRu5I9VUUSzM/NVi0EdlabmIkIJhw3dEaEVw098yL4yqiSWxwodPulOoTckZ7UNvewTx6aaa2ft8yoejYtsT1H6lA/+uXCDTBRLMTZTkman2NsWCUpZ1mH6PslK0FF8YqEk0BtsufrZ99lPWaT7iZRHLmG5L3bPExAwthT8DdbCFoICUMYNcpUQuQNCwcHwT+vq3crlqtheUOUeBtlS73fnap6qKNGrhNbrvoQlQ1gXt0oT/dRXTXFy/f9myvC4LQa/Ak2yUy2cORl9oryBEPMPodErLSpqrROLq1lWxCue8UpnRbYNgd8Kv7rg808EVWMdcpt/4gfHyI2OyV6JmeVj6HNZIoykBj7q0QeF/fczXSRk4oma/g6dEYzqWiEWi+T+wkS+oFO/8wfSenoaiXyrIeGePBOxp8hKzEVoR9eYVSfwHGdOQUv1NK+90TPJbmUixe2jWUy4QIHrti9U2rN16nFAl910eKxqrZzhF41TN3XOs7n09cVPW9cKodMSZCTueCFRsb5JDOsB+Z4YLZjap+ws2JbvGelC0TlW6QMZhPmjHiPAUUsD2PdkaesDriC0q
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(44832011)(8676002)(83380400001)(5660300002)(7416002)(71200400001)(110136005)(54906003)(38070700005)(8936002)(122000001)(76116006)(66446008)(66574015)(66946007)(4326008)(66476007)(66556008)(186003)(2616005)(91956017)(64756008)(6486002)(38100700002)(478600001)(6506007)(316002)(31686004)(31696002)(36756003)(41300700001)(2906002)(26005)(86362001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NEEyQmNhT0xGR1ZwWTdxQWFFaGYvdmRRUk9NdG0xZVFWb0V2enpZbVNqQmhz?=
 =?utf-8?B?L2tIQlFxTXRZSExuQ0JmYWJHU3Y1dnpDTjltY1o0YXlFamlvQS9YdGVtcXI1?=
 =?utf-8?B?M0tWTTEvU0lBL2pjcC94aGxMb29FRnBZWnErSGFUTlhBZWdlN1ZnMFpRcXUw?=
 =?utf-8?B?Z2lwTG53ZU1DaFc5bTJDY25zTmErMTl0UHkvdng3WUt1dDNyQktoR1pDNVNE?=
 =?utf-8?B?S1RqRWhrcENNbEZYenRYTjJVYy9ZVlhhanlrOFJwcnZ4ejdCbWducTJnY1Ni?=
 =?utf-8?B?U25aRHhuM0lTMGVQWm01cElRQi9WREJ0MTFjNUl2cnE3cFVXeUNyUzJzUEdx?=
 =?utf-8?B?Q01oRDlnL3pKSmNWY0x3dGFCa09ibWlHdTd5SnpiNGdEenB3RGx2MnNIaWN0?=
 =?utf-8?B?WlU4NjdsOFphbGk4NUpiRW9JSTNkcUpEVDJjcWVxS2ZnYm1rR01KaGpSc2w4?=
 =?utf-8?B?Rzdyb1U4b1QzUjkzMjlQQ3hhb1dlZ2pKZm5Na2NuUjdsOFVJVDJ3OUE0Zi9T?=
 =?utf-8?B?U3NGMDV5VEtxZGovbnRnb3hPWjJlRkVzSldPdlphVm1SdkMwV29MakVFSHRD?=
 =?utf-8?B?M2tOdStmQys4QmhGNUFSQ3RQU2VKdWFyUUxJcTlhRVBOemU5a1RkeDVITVFw?=
 =?utf-8?B?a2ZYNnptbzd2VHIxdzdmVG1ITXNaS3ZpdjlXclY5N0h0Q0NCZmZXTGkwbTMw?=
 =?utf-8?B?VXFUTU1McWZIejM3Wk15YUM4Y2tnZTVrbmlSeDdudHhhTi9HK0plZTF2REtj?=
 =?utf-8?B?cGlCdXJYaDdpY0VKSVdEc0FyZURTWWZTV3VqaXRWWDdxeFlyZXZVTHcrMjUx?=
 =?utf-8?B?YS9DM05MWXJCd0JNRGJKRmtEVGJONDBKS05TamlHTGFWdERYZ091NzA0bFRH?=
 =?utf-8?B?MFVtc2p3V21YdkRyNjE2YUZGdnBnaU5mckpBQTRCL2ZPV2FwZ3o3T21PZFBG?=
 =?utf-8?B?MkZKaWs2QjJ3UHEvQno2WTltK05LZGg3L3c2NnV6bTBXcXFTVDhRTWhnaFJK?=
 =?utf-8?B?dVVMVjVXN25Pakc2U1JPNkJhVDlOT1FrS1J1UXFUM2w1YTRFOUVkWTFuRHlm?=
 =?utf-8?B?SFRPTXRJdlhRYVdHUmtGbmdIL3l0Snp2cy9WanJxU0t6SzVQc2FNU2t1UkRl?=
 =?utf-8?B?dXpTbjZUc0NmUHFFL0t6SDE3K0dLMTUvd3hNUXdqcUl1dFY5Ymc5NWlwWWdG?=
 =?utf-8?B?Ukkxd0wyRGFzcDJUL0lkeGVvWitlaUtnUjFCbEY4eVMzRGo3blpWbTBCb0JY?=
 =?utf-8?B?WFlqZHNBWjRSbmp4VlVNREFBVzF0ZzF5dFdaMzhFV2F1Qm1MV01acjJlUWJz?=
 =?utf-8?B?M2pTbHIzVHNuL2VPbDE5MVNONDUwY1lZWTV3L2RPZTNmc2E1Szg4WE9xMXdt?=
 =?utf-8?B?dVhNdklLeUtvR0NKRmVuc1Vja1pHM09kVDh6OGt4L0t2UlNibnhLQTEvK0tT?=
 =?utf-8?B?SHRqWit1OVFQSU1sQzgrd3BmOGZ0V3dPbFg0L2tMVXJDSDlyTzd3Z3pNWGFu?=
 =?utf-8?B?ZTd4N2RVUDFZNFZIN0V2UXJKc2hqdG9UWWZWZzY0MUFtS3o5bUIyZ0wyVTl6?=
 =?utf-8?B?S2g4SUIyakNiVVp6cDJlYnlqc0loSis1VFpoN3RJUis0RG1YSUlzQUNxcHlp?=
 =?utf-8?B?eWtlVUs1NFB3bGh3UHFzcXhzMG9CVHNJQW9NOHczZUcxbCtCQ2Z1UEZOeWV5?=
 =?utf-8?B?T3BhWlpkMUJNdzR3WGRPK1J2MGp5eEtjTktYSWVpbWc5TElrMmFTbVdIRHpM?=
 =?utf-8?B?S2FMTFFNNjhxQXo2RnpPZG94UzZ1UG5NSHIvdzdKcXd0VUk5WTliOUduekZW?=
 =?utf-8?B?KzlkZkIwTmVBOEZZaFJmUUxrV0FEU2dBTG10Zi8rRHB4RFdYK1lsMGJ0cVE0?=
 =?utf-8?B?MDdyb0RiU2EzUWZncjQ3bEcvcUdiS0ZVWHVNWDhJR3JhQnVIcTFRZUx0MDNs?=
 =?utf-8?B?NkNma3lzbXVYMFAxbXdnL21ML2c2NWc4NmxMd0VxU1ZkZTkvekJyajhER0ls?=
 =?utf-8?B?Qm5tNVd2bEJYa0srdEMyQ1NaQWZWVUI3ZHdCUjN2V3N0elhVbmJHQStJTkU3?=
 =?utf-8?B?K3EvYkxIZEtwc2N1Q29QTkJTNk1lbXFmKy9ETWVZTnJET29YWDdRY2xpYmU3?=
 =?utf-8?B?SHhZRmVLWGk4MXdpODF3YTRQVWluYkRFSCs5MWNScjFvRi9TWThjeFBIMnp1?=
 =?utf-8?Q?1bdMbvtQHyDcyFKuSeWuS+E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <161E8020B3BCD4428EDA4B149EE661F9@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9c1d8a-7ec1-46d4-c4b3-08da60f377e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 15:06:43.0718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GalC2A/FuxX287+JQStvHWgbGvO80S6W3zg/yBvDj24RN+hltjxYUM2XxFi5YNxXT7E88cymjsvOVnUqy3pDJs7TXHE3Dd14CDG0ZxOAYy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3701
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "paulus@samba.org" <paulus@samba.org>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA2LzIwMjIgw6AgMjA6MzIsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBUaGVzZSBwYXRjaGVzIGFyZSByZWJhc2VkIG9uIHRvcCBvZiBvYmp0b29sL2NvcmUNCj4g
YnJhbmNoIG9mIHRoZSB0aXAgdHJlZSwgYW5kIGFyZSB0ZXN0ZWQgb24NCj4gcHBjNjRsZSB3aXRo
IHBwYzY0bGVfZGVmY29uZmlnLg0KDQpTZWVtcyBsaWtlIG9ianRvb2wvY29yZSBoYXMgYmVlbiBt
ZXJnZWQgaW4gNS4xOS4gSSB3YXMgYWJsZSB0byBhcHBseSANCnlvdXIgc2VyaWVzIG9uIHRvcCBv
ZiBwb3dlcnBjL21lcmdlIGJyYW5jaC4gT25seSBhIHNtYWxsIGNvbmZsaWN0IHdpdGggDQpwYXRj
aCAib2JqdG9vbDogQWRkIC0tbW5vcCBhcyBhbiBvcHRpb24gdG8gLS1tY291bnQiIGJlY2F1c2Ug
b2YgY29tbWl0IA0KYjQyZDIzMDY1MDI0ICgia2J1aWxkOiBmYWN0b3Igb3V0IHRoZSBjb21tb24g
b2JqdG9vbCBhcmd1bWVudHMiKQ0KDQo+IA0KPiBDaHJpc3RvcGhlIExlcm95ICgzKToNCj4gICAg
b2JqdG9vbDogRml4IFNFR0ZBVUxUDQo+ICAgIG9ianRvb2w6IFVzZSB0YXJnZXQgZmlsZSBlbmRp
YW5uZXNzIGluc3RlYWQgb2YgYSBjb21waWxlZCBjb25zdGFudA0KPiAgICBvYmp0b29sOiBVc2Ug
dGFyZ2V0IGZpbGUgY2xhc3Mgc2l6ZSBpbnN0ZWFkIG9mIGEgY29tcGlsZWQgY29uc3RhbnQNCj4g
DQo+IFNhdGh2aWthIFZhc2lyZWRkeSg5KToNCj4gICAgb2JqdG9vbDogQWRkIC0tbW5vcCBhcyBh
biBvcHRpb24gdG8gLS1tY291bnQNCj4gICAgcG93ZXJwYzogU2tpcCBvYmp0b29sIGZyb20gcnVu
bmluZyBvbiBWRFNPIGZpbGVzDQo+ICAgIG9ianRvb2w6IFJlYWQgc3BlY2lhbCBzZWN0aW9ucyB3
aXRoIGFsdHMgb25seSB3aGVuIHNwZWNpZmljIG9wdGlvbnMgYXJlIHNlbGVjdGVkDQo+ICAgIG9i
anRvb2w6IFVzZSBtYWNyb3MgdG8gZGVmaW5lIGFyY2ggc3BlY2lmaWMgcmVsb2MgdHlwZXMNCj4g
ICAgb2JqdG9vbDogQWRkIGFyY2ggc3BlY2lmaWMgZnVuY3Rpb24gYXJjaF9mdHJhY2VfbWF0Y2go
KQ0KPiAgICBvYmp0b29sL3Bvd2VycGM6IEVuYWJsZSBvYmp0b29sIHRvIGJlIGJ1aWx0IG9uIHBw
Yw0KPiAgICBvYmp0b29sL3Bvd2VycGM6IEFkZCAtLW1jb3VudCBzcGVjaWZpYyBpbXBsZW1lbnRh
dGlvbg0KPiAgICBwb3dlcnBjOiBSZW1vdmUgdW5yZWFjaGFibGUoKSBmcm9tIFdBUk5fT04oKQ0K
PiAgICBvYmp0b29sL3Bvd2VycGM6IEZpeCB1bmFubm90YXRlZCBpbnRyYS1mdW5jdGlvbiBjYWxs
IHdhcm5pbmdzDQo+IA0KPiAgIE1ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICA0ICstDQo+ICAgYXJjaC9wb3dlcnBjL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDIgKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9idWcuaCAgICAg
ICAgICAgICAgICB8ICAxIC0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL2VudHJ5XzY0LlMgICAg
ICAgICAgICAgICAgfCAgMiArDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9leGNlcHRpb25zLTY0
cy5TICAgICAgICAgIHwgIDcgKy0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL2hlYWRfNjQuUyAg
ICAgICAgICAgICAgICAgfCAgNyArLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvbWlzY182NC5T
ICAgICAgICAgICAgICAgICB8ICA0ICstDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvL01h
a2VmaWxlICAgICAgICAgICAgIHwgIDIgKw0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvdmVjdG9y
LlMgICAgICAgICAgICAgICAgICB8ICA0ICstDQo+ICAgYXJjaC9wb3dlcnBjL2t2bS9ib29rM3Nf
aHZfaW50ZXJydXB0cy5TICAgICAgIHwgIDQgKy0NCj4gICBhcmNoL3Bvd2VycGMva3ZtL2Jvb2sz
c19odl9ybWhhbmRsZXJzLlMgICAgICAgfCAyNSArKystLQ0KPiAgIGFyY2gveDg2L0tjb25maWcg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsNCj4gICBzY3JpcHRzL01ha2VmaWxl
LmJ1aWxkICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArDQo+ICAgdG9vbHMvb2JqdG9vbC9h
cmNoL3Bvd2VycGMvQnVpbGQgICAgICAgICAgICAgIHwgIDIgKw0KPiAgIHRvb2xzL29ianRvb2wv
YXJjaC9wb3dlcnBjL2RlY29kZS5jICAgICAgICAgICB8IDk2ICsrKysrKysrKysrKysrKysrKysN
Cj4gICAuLi4vYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXJjaC9jZmlfcmVncy5oICAgICAgfCAxMSAr
KysNCj4gICB0b29scy9vYmp0b29sL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FyY2gvZWxmLmggfCAx
MCArKw0KPiAgIC4uLi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hcmNoL3NwZWNpYWwuaCAgICAgICB8
IDIxICsrKysNCj4gICB0b29scy9vYmp0b29sL2FyY2gvcG93ZXJwYy9zcGVjaWFsLmMgICAgICAg
ICAgfCAxOSArKysrDQo+ICAgdG9vbHMvb2JqdG9vbC9hcmNoL3g4Ni9kZWNvZGUuYyAgICAgICAg
ICAgICAgIHwgIDggKysNCj4gICB0b29scy9vYmp0b29sL2FyY2gveDg2L2luY2x1ZGUvYXJjaC9l
bGYuaCAgICAgfCAgMiArDQo+ICAgLi4uL2FyY2gveDg2L2luY2x1ZGUvYXJjaC9lbmRpYW5uZXNz
LmggICAgICAgIHwgIDkgLS0NCj4gICB0b29scy9vYmp0b29sL2J1aWx0aW4tY2hlY2suYyAgICAg
ICAgICAgICAgICAgfCAxNCArKysNCj4gICB0b29scy9vYmp0b29sL2NoZWNrLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgfCA1MSArKysrKy0tLS0tDQo+ICAgdG9vbHMvb2JqdG9vbC9lbGYuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDggKy0NCj4gICB0b29scy9vYmp0b29sL2luY2x1
ZGUvb2JqdG9vbC9hcmNoLmggICAgICAgICAgfCAgMiArDQo+ICAgdG9vbHMvb2JqdG9vbC9pbmNs
dWRlL29ianRvb2wvYnVpbHRpbi5oICAgICAgIHwgIDEgKw0KPiAgIHRvb2xzL29ianRvb2wvaW5j
bHVkZS9vYmp0b29sL2VsZi5oICAgICAgICAgICB8ICA4ICsrDQo+ICAgdG9vbHMvb2JqdG9vbC9p
bmNsdWRlL29ianRvb2wvZW5kaWFubmVzcy5oICAgIHwgMzIgKysrLS0tLQ0KPiAgIHRvb2xzL29i
anRvb2wvb3JjX2R1bXAuYyAgICAgICAgICAgICAgICAgICAgICB8IDExICsrLQ0KPiAgIHRvb2xz
L29ianRvb2wvb3JjX2dlbi5jICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstDQo+ICAgdG9v
bHMvb2JqdG9vbC9zcGVjaWFsLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKy0NCj4gICAz
MiBmaWxlcyBjaGFuZ2VkLCAzMDUgaW5zZXJ0aW9ucygrKSwgNzEgZGVsZXRpb25zKC0pDQo+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL29ianRvb2wvYXJjaC9wb3dlcnBjL0J1aWxkDQo+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL29ianRvb2wvYXJjaC9wb3dlcnBjL2RlY29kZS5jDQo+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL29ianRvb2wvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXJjaC9jZmlfcmVncy5oDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL29ianRvb2wvYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXJjaC9lbGYuaA0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29s
cy9vYmp0b29sL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FyY2gvc3BlY2lhbC5oDQo+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHRvb2xzL29ianRvb2wvYXJjaC9wb3dlcnBjL3NwZWNpYWwuYw0KPiAgIGRl
bGV0ZSBtb2RlIDEwMDY0NCB0b29scy9vYmp0b29sL2FyY2gveDg2L2luY2x1ZGUvYXJjaC9lbmRp
YW5uZXNzLmgNCj4g
