Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A9759956A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 08:42:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8Byl07CGz3dy7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 16:42:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=u61wtF1G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.82; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=u61wtF1G;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120082.outbound.protection.outlook.com [40.107.12.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8Bxx5Tt3z3dw2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 16:42:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIwVeTSPeSiNa6Dn4xWEYj5B9OBa+q73h/XR+NNIdJh19nm2Ftiq8AV7SuIQdl+exsoKlxWHyi2TNZxy26Q91FL59ya7aDq8CNxByXr9r8i2hx14d4BuYq7eerb+mxwPjCiiDsMBXUcYs+f5JLiOTEd5mJmiJvoru3MLzruQA18fk5a8FXJswW2sJNSwwA+xmcqWMsqEbNWP5sW224X952J2MvY7uLt5b6nO+uYg6plNZrwrFxlR+PdusphIcFru8lqaw5Q3yz/KmLLJvWz+MhIIOiDnYNxtIZyB7KhcaiUeVXkHzAbyn9qYACLoHI7tXhxRZNz7SH121SoaPmUMLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQSF2qcZXW/qbWjBLuaq9Y2I9wHJPS/kBm62zM9JEDw=;
 b=R7q6qlrhtjkYLThEeHEEVooStYvw86vhJyi6O3Ybr68C9YpBAPFfkRqfobZv8Eo1XbhJo2DgOooUCNxafQs/EnAAwxUxq4iULmlKYd+BgsJBJBL9VdlYo+3+LmBkA5Sw7mbExXtBVt+vGHKDmhy5ks/zLz5KF4JickxFeliD9lj6mZ1hzgIxoNGm2QHFO1TxqIF9d2/lV4KFJV8yKi2POjU8xu3k2ovkCEXaAriPHn23UiFtAfAEGinlihl8I7OKj2wy472YI5rUAhQExX8Fhxzq5Pl1YYbf7TdtNDMANU9BEGAqHPk1lIv7NRepXahdIcZY+ZL6a9OCbK9U1xPRJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQSF2qcZXW/qbWjBLuaq9Y2I9wHJPS/kBm62zM9JEDw=;
 b=u61wtF1GfrDjFJTjvHCi0iSd/2CHUMyJJHric4eNW8WStKNFwLSgjvrNIYL7LABntSUxHi9ZMwumF2Qhp8RMCSHJbpSmEvEPcOTkGlP+DSQLr2aIzEsw+zp8Gta1/UceUedFrVRKSIEFpfg3CeWAWbbJiqfYwKaaWSBNP7K5EXfgu//JsobGrpAF6/pfthqlib4p9AxV/P+CERqxQ6QeP3h60LRiuwbrhyVmQnNpurU3tl13wp89FOAp6/mCNBSsGzCc5G9jUgnuzR2XE+gLzi4lJtlf78lzFzfkgNHfcyw6oTHRogSjDgtdimhAQSbZ27+beXcQmOZLvOi/181w/g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB4229.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:254::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 06:41:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5546.018; Fri, 19 Aug 2022
 06:41:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 07/18] powerpc: Remove direct call to mmap2 syscall
 handlers
Thread-Topic: [PATCH v3 07/18] powerpc: Remove direct call to mmap2 syscall
 handlers
Thread-Index: AQHYs37NDa6rBRtEskuq86exAvlAMq21xowA
Date: Fri, 19 Aug 2022 06:41:55 +0000
Message-ID: <0046495f-f560-1041-6690-006c0fa5e5eb@csgroup.eu>
References: <20220819033806.162054-1-rmclure@linux.ibm.com>
 <20220819033806.162054-8-rmclure@linux.ibm.com>
In-Reply-To: <20220819033806.162054-8-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 678b0ae6-57f9-4e5a-b552-08da81ade829
x-ms-traffictypediagnostic: PR1P264MB4229:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  WhCEwHCU8izF4GIE3OC0GVPLi26esswiuDrQrC7KKhJKitffb3kZDu8NfPcuaIpFAh4yUxJZsNooap27qO6mb1eeE4rKHGTp5n9FHWoItTEZyURdQnd/oUHmx69wiseSLGHuePWaCQBqT5eVtz/hWnGSmBsbRksk09QhTn04BXs8K8XNsURpYPDsbJzMaqo2qJO6PBEiVbpRjaRj98Y6e0oipay5XyHtnqPDtrqiDYLHIbuWWga4zlI5oxVK3DHb49vfWfeDcT9qHnGWg6V4o6GeNycRCiCTfzqZpE37BtdmXWYPESnV1RrHrvBQEaYN0XtwLguS2DztALFhalnNRRQtILmDIiuZgXOPRDRBO5mM9kbrfR5mrJA8qqC/BppMRGOYXL/tbXWjRHg2wJOToHUHwbggcjiIjChAlwYy7+BCcibtqqMF62U02fL/CmfQUessJA5e46rz6RRBXLZZQ/A0lBgLDIZophT1wbNMjauUN2VxrJWB7s7Jhd1YErwvqF70vfNojSJA0pf5JbUAn1BJJ9i9ALNopQv0QpEL99IxTFr9U50CMHSNeJTBXV63d2vx3TO+mqjpaVoy8dD9LlYVf5b1l81UIK648r8dFiDAgL0Sx2dgHvC374PpNhHpICopGXJIzWpPw9MCABTrSv3eU5blWHR9oFXi9yQKVMdjmwcST9A+VtVQ42Zu/fmRk94/lCohVSl1/39W/0leYlpVSblemKzmAxgsxQvwrVAX2IM3lD16SX0hQIyD5wekNfJwr+EiWfJpbmREXTCyKZ3eHW1kgTK9/No9DEaAyiUTr2ZiJ4EPdOjCYGgejoKEP9X2fOfCesz+g6RilcsteQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(39850400004)(366004)(396003)(83380400001)(110136005)(41300700001)(2616005)(6512007)(6486002)(6506007)(186003)(31686004)(36756003)(478600001)(26005)(86362001)(66446008)(44832011)(31696002)(66946007)(8676002)(2906002)(66556008)(64756008)(66476007)(71200400001)(5660300002)(122000001)(91956017)(38070700005)(76116006)(8936002)(38100700002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eWlQb0ZKS3daSjhyUmpvUCtIQkhVMVhTS3NHY1Z1aldRblFva21ES1RWdFRJ?=
 =?utf-8?B?WWJ0LzZNSGd0UTlzWUlIVFBHVkRnK01oTjl6ZWM5Mm94cExIczVXT3dpeThO?=
 =?utf-8?B?TXBSOHhheC9yb0toYzUwS0V6SU5QM2ZVL1l6MFZlTkhMOEJqWlpIbzh1bGw4?=
 =?utf-8?B?Nko1TTdLaGRKdXNLbG50aHMzSXVsczRMaG1IN3dQMWJYbGZjTGxiTEJXU3Vq?=
 =?utf-8?B?Mk9DWWorbENoQ0M3NUJod25FM3ZybWM0d0VSWjg5UEFqQTBrVC9NMlZ6OE8y?=
 =?utf-8?B?eFJLVHN3emIwS1BLTjFTclE5amtRYnpGR044azNON1JLL1Bxa01mNGRSODJj?=
 =?utf-8?B?MHlFbytUKzRKQ1k5cDVmdEdvU25RL0NmZk5MRWRhSHFGRVhvWTBIemRZcDJU?=
 =?utf-8?B?S2piWllIWjUwT0tGTnpiNm5LVFNUaHp5UG4zd2RYQ24wU083TjdqWEV1aUNq?=
 =?utf-8?B?Sk1QMnE3UTg4R2hucElWU2RES3JIVEMxMFppQXZBZE1Vek1YN21ydW1rWFdi?=
 =?utf-8?B?UGxuVVhPOHVrRFJTSjBhcDlTQ2VwOFEzZDZ3TnZ6eXY4aURzY3lBWHlHZUFL?=
 =?utf-8?B?YTJJK1BFWlgrNnVFWWNVaFluWFoxTXRjb29PQ3ZzM0lZVzlpSHVpTW4zbExX?=
 =?utf-8?B?TmZ3U2RjMUtJRlhPWThUZGVldUF3d29kcW9heUxjR1JTclBBMjFvZ3VSalpo?=
 =?utf-8?B?dUxYRXp4TGJkdTlyZEQ5WHFsWTZDN2x5dnpXVmVxUnVGNkVLa042aEorYVkz?=
 =?utf-8?B?ZzV0V1VLY3ZrZWpSaE5Wejd0YThFdmpqaGU3VFhqaVlFOVByc00zTGg2azdP?=
 =?utf-8?B?a3JMYjhyaXp0bFJTSlJJSkVmWTFBUERwSGMzdHNxWllud3l6cWM2RGFpdzhs?=
 =?utf-8?B?Rlg3d1BpOVpPVDhBb25qL3ZTeVR2ZzI2QytMUGpQQWZqbG5wSlFlU09sRGp5?=
 =?utf-8?B?Yzc2cXdvK2NjWkEvUnpCVk1lcXg2dTQyZGs5alJFcVA1MzhySUVQaUwvNDQz?=
 =?utf-8?B?UUdpdHJKOXllOEwwQmEzaHNld0FEeHJSOHh1Z1E2a3F3YVhlMHZYT1BPeGtm?=
 =?utf-8?B?ZXNrQi9XcEtBVWE1WEs2M2hnUUtYZVRYNGRiUWlhMS82YVg3enBrQTR3d01z?=
 =?utf-8?B?cndRWVFoRDJVVGVNQzkrSUJtd3VrZjhFL2lvNEJLbjVnQVBodDVjSEVObnZR?=
 =?utf-8?B?UXJKem1KeGdKWG1GSlpqc1BVQjlXeWVtU21BQzRaczBadTVGclY1bHl4WlJ5?=
 =?utf-8?B?WW1OVUsraUg2MVVlbnZtZDBubG1QcmFGSzJ6ZytZZWxLUnpMRDBOZzlzK290?=
 =?utf-8?B?SkVIY2lkOGFYck1Jb3JzMS9iRVRCN2NDUDR0dlNwbXRkNURraUkvTVorTno4?=
 =?utf-8?B?cTRDV2ZjN01VdXRGUGQxVEpURDd4N2daQ3o1OWUvRnNZVzJINnQyV3NNb0NB?=
 =?utf-8?B?N01QMC82UUZPaGZQZWx0N1ZxQ0JmSjdqRGU2djgrRXlDTXpTSmQ5aUFIRFg5?=
 =?utf-8?B?OG9MTVIxZ2oxV05NTnJNZlVSS2R2WDdrOUJNV1lBVHN4dHZkbDNES3dpOFRz?=
 =?utf-8?B?c0ZjVjJraVhXdGp3b3dTUmNFYnBIRC9TRzdobGFpcjRxWjIzR0tGWlNkcnoy?=
 =?utf-8?B?eVdUSjBMSWQ5ZEhFd1liQmZ4Sm5pWU4zMFJ2ZjZkMDJrV2E2MEJrMWpuWVht?=
 =?utf-8?B?T0J6U3lMMFRXMFhXU1RmcUx1UGRvcFpQNHc4M0Z3blBrSHhNemRYblcrd21M?=
 =?utf-8?B?MklPMXRKMytFUXVzQmVUN1dNRUdiVFNMRnhaWURWSkQzK0JqUll5OVRjMVlz?=
 =?utf-8?B?Y0xaMW9sbnhZY1dqcUhhZmoycGhDZ3BtMmExaC8xM01ITStOTklHTHhLZEhV?=
 =?utf-8?B?bmpKc3R1UHNpWlIzNVBFYlB5TGIxSURnNkl0R01xQmlWcndiY3JnZTJHc2VN?=
 =?utf-8?B?NDBZT3dYWmV2WVI3RS8rMUNFeG0rd3FvV1h3SFpsb2RVM2VsVnRVblZUcjhl?=
 =?utf-8?B?TVpJN1ZoUUJxZU8zMzJjSG91S01xUlphZkxWL0V3d09kc2VqbVBsaHUwRmNp?=
 =?utf-8?B?eGh5cFd3UzczbXlFMFRnSElxRDc0d3hlTkRKRjBVbksrN2piWDNEY0NxdXcy?=
 =?utf-8?B?NThvQUZqeEoycUorU21XQjkyaXlUam5WOXdIUDh1RnJySmFVRHFxbU5COTQy?=
 =?utf-8?Q?ZXVi+70cqeWvoyCCiFYlJSY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22147E1CB347A34CA78B938C466164BB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 678b0ae6-57f9-4e5a-b552-08da81ade829
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 06:41:55.0250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KZTaAPdOqZlpY1ySz0SRRlwcEOKWrjvO+bTVQkFcFCE3yxKVdxlL8Fnk9hKAE4HejW89K6D9dhWA30ts0e3E+2HQlWhq9dMcMdQd7J/vQV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB4229
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA4LzIwMjIgw6AgMDU6MzcsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBT
eXNjYWxsIGhhbmRsZXJzIHNob3VsZCBub3QgYmUgaW52b2tlZCBpbnRlcm5hbGx5IGJ5IHRoZWly
IHN5bWJvbCBuYW1lcywNCj4gYXMgdGhlc2Ugc3ltYm9scyBkZWZpbmVkIGJ5IHRoZSBhcmNoaXRl
Y3R1cmUtZGVmaW5lZCBTWVNDQUxMX0RFRklORQ0KPiBtYWNyby4gTW92ZSB0aGUgY29tcGF0aWJp
bGl0eSBzeXNjYWxsIGRlZmluaXRpb24gZm9yIG1tYXAyIHRvDQo+IHN5c2NhbGxzLmMsIHNvIHRo
YXQgYWxsIG1tYXAgaW1wbGVtZW50YXRpb25zIGNhbiBzaGFyZSBhbiBpbmxpbmUgaGVscGVyDQo+
IGZ1bmN0aW9uLCBhcyBpcyBkb25lIHdpdGggdGhlIHBlcnNvbmFsaXR5IGhhbmRsZXJzLg0KDQpT
aG91bGRuJ3QgdGhpcyBiZSBkb25lIHByaW9yIHRvIHBhdGNoIDUgPw0KDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+IFYx
IC0+IFYyOiBNb3ZlIG1tYXAyIGNvbXBhdCBpbXBsZW1lbnRhdGlvbiB0byBhc20va2VybmVsL3N5
c2NhbGxzLmMuDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvc3lzX3BwYzMyLmMgfCAx
MCAtLS0tLS0tLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNjYWxscy5jICB8IDExICsr
KysrKysrKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMCBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3N5c19wcGMz
Mi5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNfcHBjMzIuYw0KPiBpbmRleCA2MGNiNWI0NDEz
YjAuLmRkOTAzOTY3MTIyNyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNf
cHBjMzIuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3N5c19wcGMzMi5jDQo+IEBAIC0y
NSw3ICsyNSw2IEBADQo+ICAgI2luY2x1ZGUgPGxpbnV4L3BvbGwuaD4NCj4gICAjaW5jbHVkZSA8
bGludXgvcGVyc29uYWxpdHkuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvc3RhdC5oPg0KPiAtI2lu
Y2x1ZGUgPGxpbnV4L21tYW4uaD4NCj4gICAjaW5jbHVkZSA8bGludXgvaW4uaD4NCj4gICAjaW5j
bHVkZSA8bGludXgvc3lzY2FsbHMuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvdW5pc3RkLmg+DQo+
IEBAIC00OCwxNSArNDcsNiBAQA0KPiAgICNpbmNsdWRlIDxhc20vc3lzY2FsbHMuaD4NCj4gICAj
aW5jbHVkZSA8YXNtL3N3aXRjaF90by5oPg0KPiAgIA0KPiAtQ09NUEFUX1NZU0NBTExfREVGSU5F
NihtbWFwMiwNCj4gLQkJICAgICAgIHVuc2lnbmVkIGxvbmcsIGFkZHIsIHNpemVfdCwgbGVuLA0K
PiAtCQkgICAgICAgdW5zaWduZWQgbG9uZywgcHJvdCwgdW5zaWduZWQgbG9uZywgZmxhZ3MsDQo+
IC0JCSAgICAgICB1bnNpZ25lZCBsb25nLCBmZCwgdW5zaWduZWQgbG9uZywgcGdvZmYpDQo+IC17
DQo+IC0JLyogVGhpcyBzaG91bGQgcmVtYWluIDEyIGV2ZW4gaWYgUEFHRV9TSVpFIGNoYW5nZXMg
Ki8NCj4gLQlyZXR1cm4gc3lzX21tYXAoYWRkciwgbGVuLCBwcm90LCBmbGFncywgZmQsIHBnb2Zm
IDw8IDEyKTsNCj4gLX0NCj4gLQ0KPiAgIC8qDQo+ICAgICogbG9uZyBsb25nIG11bmdpbmc6DQo+
ICAgICogVGhlIDMyIGJpdCBBQkkgcGFzc2VzIGxvbmcgbG9uZ3MgaW4gYW4gb2RkIGV2ZW4gcmVn
aXN0ZXIgcGFpci4NCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvc3lzY2FsbHMu
YyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc3lzY2FsbHMuYw0KPiBpbmRleCBlMDgzOTM1YzViZjIu
LjBhZmJjYmQ1MDQzMyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNjYWxs
cy5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc3lzY2FsbHMuYw0KPiBAQCAtNTYsNiAr
NTYsMTcgQEAgU1lTQ0FMTF9ERUZJTkU2KG1tYXAyLCB1bnNpZ25lZCBsb25nLCBhZGRyLCBzaXpl
X3QsIGxlbiwNCj4gICAJcmV0dXJuIGRvX21tYXAyKGFkZHIsIGxlbiwgcHJvdCwgZmxhZ3MsIGZk
LCBwZ29mZiwgUEFHRV9TSElGVC0xMik7DQo+ICAgfQ0KPiAgIA0KPiArI2lmZGVmIENPTkZJR19D
T01QQVQNCj4gK0NPTVBBVF9TWVNDQUxMX0RFRklORTYobW1hcDIsDQo+ICsJCSAgICAgICB1bnNp
Z25lZCBsb25nLCBhZGRyLCBzaXplX3QsIGxlbiwNCj4gKwkJICAgICAgIHVuc2lnbmVkIGxvbmcs
IHByb3QsIHVuc2lnbmVkIGxvbmcsIGZsYWdzLA0KPiArCQkgICAgICAgdW5zaWduZWQgbG9uZywg
ZmQsIHVuc2lnbmVkIGxvbmcsIHBnb2ZmKQ0KPiArew0KPiArCS8qIFRoaXMgc2hvdWxkIHJlbWFp
biAxMiBldmVuIGlmIFBBR0VfU0laRSBjaGFuZ2VzICovDQo+ICsJcmV0dXJuIGRvX21tYXAyKGFk
ZHIsIGxlbiwgcHJvdCwgZmxhZ3MsIGZkLCBwZ29mZiA8PCAxMiwgUEFHRV9TSElGVC0xMik7DQo+
ICt9DQo+ICsjZW5kaWYNCj4gKw0KPiAgIFNZU0NBTExfREVGSU5FNihtbWFwLCB1bnNpZ25lZCBs
b25nLCBhZGRyLCBzaXplX3QsIGxlbiwNCj4gICAJCXVuc2lnbmVkIGxvbmcsIHByb3QsIHVuc2ln
bmVkIGxvbmcsIGZsYWdzLA0KPiAgIAkJdW5zaWduZWQgbG9uZywgZmQsIG9mZl90LCBvZmZzZXQp
