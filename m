Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 355595AA96E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 10:07:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJr9v0lPhz30Lb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 18:07:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Y/Edrkzu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.53; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Y/Edrkzu;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90053.outbound.protection.outlook.com [40.107.9.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJr961Cptz2xmm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 18:06:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7TX9jS03CZEsL8skSRUn6hHffRdxvExHJWkfNyPGE7graURib06s0ibo2vU/bYzxi2Gru78gXVYjQKmxhAX72DqZPa2QNYl9rDOxf5z5bARHRExh1Ia/pvEpYELA0ezKtNb937kb6ZGOPBPYAqLiH5oHXQLx+zXK9+hJ4MGs7wxpg67JMBrgUFuGCEPf6n4EWHZTIE+d+Ko120eR7wRBO5bbWIGhL6zuXgKCt6q6jApWe6oQLDKTZpp2aIA3C99VYKINOfK9vrkN8nCr8joo9XRNRq39Jkugtbvu2I5Lcpe+tK3jsqn8Qw7kMF60YIKmplybdy5iranXJdOSF2I7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coi+0oDi2U4bqUcEoIPmyWkHQ6Q8e59cv9VOspVpB8Y=;
 b=f3BHkuqdPbn3JLYpHoBDvQf9KhTv3lI5bZ/k8O60yoQO1TBG2XWGLM0dsgvx/y1l7dviIohgkn1EFycVusI/VQXOZWLr4CmtrKYL3iD4tL0LeVBVZjtIM8YqPDA6xkOVeaM7Cl+o0Wv1EF8jtH9h4Bf60kUNPH3ilGCJcB5Ja7avpr681jKntC4uQ1HSGl2Vof5Iykb8BdgpX2j2Bdb9X/7a+6lJ5eWfBdDuCzfynGNUglfrTfLUIYQ3mkRx3Oq2rBnPYT7ItZXq35bb4/PeZSndaTaaOhuiunDT3bBe3qq4soauPNoLk2c/WbZftCaKBdzz61AB0L6h0tIdT+Ss8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coi+0oDi2U4bqUcEoIPmyWkHQ6Q8e59cv9VOspVpB8Y=;
 b=Y/EdrkzuU/7HaGdsuZzhqdLM9qUu1+vCQ/xOZLj3MZrUbk0EfOgcRiDMxGKS3/g582Gf2I+XQmcBzAWrtLQmoAFiZmdUgwt87A2/CzkrI0bUyE4aRrVXxJPurSqYg3nLdhP7ZDaIVOnpWsxOlac4gQIMd8AQ3JMSZlgRDbVU3+s/TC8M9i0au3CNdHdYYGm7N61uHU9Bk6V1//z2ew/H3XGzfche/4PbQV7EPIZaC6nmUkBHMtdu5Qltol6DekohOrSYrHOao6mJ2Otd52UPpCPt9Lbin41Hi27+Lwy8p5dET/mfChr1kSAti50BIwFjX8FZzXE8xiunR9vAlD0gKw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1425.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:22::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 08:06:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.014; Fri, 2 Sep 2022
 08:06:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>, Sathvika Vasireddy
	<sv@linux.ibm.com>
Subject: Re: [PATCH v2 08/16] objtool: Fix SEGFAULT
Thread-Topic: [PATCH v2 08/16] objtool: Fix SEGFAULT
Thread-Index: AQHYu2unkLMstLXaD0C1mCs9GH1+rq3K+QmAgADV7IA=
Date: Fri, 2 Sep 2022 08:06:28 +0000
Message-ID: <66a3976b-48c1-f8c4-aee0-d04c2c11f5af@csgroup.eu>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-9-sv@linux.ibm.com>
 <YxEGD0TVWtXTjcGR@hirez.programming.kicks-ass.net>
In-Reply-To: <YxEGD0TVWtXTjcGR@hirez.programming.kicks-ass.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45c464a4-1685-4391-115c-08da8cba0a3b
x-ms-traffictypediagnostic: MR1P264MB1425:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  bblG5hJDnBclWu1w0igpVK/E0yOXaaXDdShX335PSeJ5U9n48TxxMa2RSZOKcliZ20B683cqpfv+SCH0BPJYe2BsvQON0vxO2Gl9IM/+E0nPAjgmj2A0mAuuQprOXuB7uzLy788BvHbYkrFk+WapTIRzYmq0TIwpnk2xvKRwxe1IjoR9kdr+YaypaKwAAnopz7TIpahiiD4xox1AfopbgjMaCeCw6gQLvRvGzZLXBkH/nUC1W4+8yw52mBS/7w1z6cA8wchMTv6MrnNvMLRSV1BE6tYfXmqQMBW9fEfkvIspWSiJlokbTgHgjcSx+6FaXNP0hUbXi+ifw0o+W43tbAEgs3SDmbwpqSSgQMmFnPi3lJeEgLpIHlshxgSyk5eUXKe6LPMSrTjyLxvgDALbB4XWZJdOTcdVjx+CglydviS65YbUv6J7KLo4ADs4gvvQof3emFei36EKAx/7HEJ2wpoERoNJTn5nGEQ73Va7Oj4qfiDkctTw0kkNoBegj1vI61za/tVZ70lPjyIGo/fCADD+NOoxIeKBx9Xk5LkCypu4MRUqKxIXzs2jvpl7eczcRBYy0D78XmU2q2YEBIYmD7TkC/cxphe1DcR2TS1rTZAY7xaLyVMOJm/z5Yormxo6Lces2SFeZTeTtDXtrofMuEYQFXmRNIiPVJBVXb0G8R4jeRSSH7bWlYo/o67rFdGvAX+TPJvLMRQd41oOKzf87BKzGl3MN9x402x4B2CLcKgzCJEh6I2vI9mVEHutld1YT+lwysynKKHzHWtuGOOitfj5rQUQE/TFrpIQpm0RT6sHrUkTkbxVzt6X9VUaMlA0IwvsRnc0zyUMJJ2dDHRbsw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(396003)(346002)(136003)(39850400004)(186003)(6512007)(2616005)(26005)(66574015)(83380400001)(31696002)(86362001)(122000001)(38100700002)(91956017)(76116006)(31686004)(8676002)(66556008)(66476007)(66446008)(64756008)(4326008)(66946007)(54906003)(316002)(38070700005)(110136005)(36756003)(5660300002)(8936002)(44832011)(2906002)(7416002)(6486002)(478600001)(41300700001)(71200400001)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?T3ZydzNKdXJmUVhyOEhRQTdLOENkVVdIMjFRcWdCd1FVbHFaaVBoTjF1aUtX?=
 =?utf-8?B?SW9EZzM5UXBodnBZSTA1azUrK2QyU0paKy9td0dPNWpyV0RZN3A1RTUrSDdx?=
 =?utf-8?B?WUdleTlpUXJ6M0xIem1PdWt1bUNna3RPaUNTbzdhNHAybWRPWHA1L0V5N1Zr?=
 =?utf-8?B?L2pyajkyN0d2aVpPYUlpZHl4MTMrZ3dWV09rZ2tpUUs4WDJjZmk2eXpoSk91?=
 =?utf-8?B?SmhDUFlNTUVEb2pDUFkrWGhhTG10MUd4RVFtZ2xDVDJ3TVBSdGxiRktZN2g2?=
 =?utf-8?B?bmUyQ2xtcm1OZnZXZDRRRnNDeE5tM2VLTTgwMTNWVys1d2lVRUdjT0pMQk13?=
 =?utf-8?B?dnY5eTByWDZLMXIzWGNzams3TzhucVhiT2NMMjZMVjV6UStWUlEzL3lYSmJC?=
 =?utf-8?B?Y2VSOTk4S3VtUDZRNEFUU1g4K3M0QmZ0d1MvVWlPa2NlejhiajZNS3R5YkEv?=
 =?utf-8?B?OXI2aE9rMlVSQis2UzNmUGV4Tk03RnlmWWNDU1dKR0l3a1JZN3NBaTFaWGh0?=
 =?utf-8?B?dVJicHFNMGE3SXdBcWdWUURXNXhaaC9RbFZseGNRZXdmZlBkUGVRVWFTKzFP?=
 =?utf-8?B?d016VFRucExNTkxHclBGSzhRUHVEcW1KdVUvMC9uNjNKZTJtTlozY2VtQW9a?=
 =?utf-8?B?YWVKQ1BhQTJveFBWTWkraS83NUcyWG5xWWY2YjYrTWxCSVhLbVpSQXRxYTlx?=
 =?utf-8?B?a29RVktzYy81NTdETkg5NjB0ZXhDendzaHpFM09hNHJFMHhOZGg5bXprMlA3?=
 =?utf-8?B?WGpqTGI5YlY0UTFZb0x0L3JFM0xPRTU1cWw1OU5qSWRwSE1KQXRQaFlpdFZa?=
 =?utf-8?B?S2F1dVB3bEUvRlN2OXAreXV0UUt0UDFVRVRua0V0TElFSVVtM2o2cTdNR2lO?=
 =?utf-8?B?YzNUUDEwbzh5RllZTVUzaUsvZUVmdHYwU3o2Y1AydUhVaEMzTEtMcHB4cGJj?=
 =?utf-8?B?Z21GV3lVdWI2VGYvNzNlUmp3N3NKcWVXTld0V0ZnWURERGNzdmliTW93NnJE?=
 =?utf-8?B?Y0liNXNoNkFmeEZkbVQ2bzMyU0pwY3BDYytlWGpBcTZ3K0I4YUY2WlIvSWZK?=
 =?utf-8?B?Vk5xS2xvcVBGSHhTQWJCYm43dDRqcEg1MTA3OWxOMUdMbDQwdmkwKytXTWVI?=
 =?utf-8?B?c0M5MzhNRXV0NEI3bFQ2ekRuZEpTa0FVbTUxQlVTYTM1M0k1VDJIc3ZHbU9W?=
 =?utf-8?B?YXcxZFpQZDk3WllXWktrcmFibVZiMlhQYXpVNlIrVVlUYW5KZnprVFFzK3JM?=
 =?utf-8?B?K0xUNzFqNHZ1WE1MdSs0TGg5ZDhVOXYvOFdNRzRod3k5S01iYVM2V2hibE1Y?=
 =?utf-8?B?RUJYYTJmRWNzNHR3d3FkTE9yanJRTklpYSt0dHZDbWpyWStuTHBXTnU2WWNN?=
 =?utf-8?B?T3lUYzRIRmVoSmVKOGhoQmxzRzZMTmNPamx2Q2hqUHFHaEIrRHhKOW00SE1q?=
 =?utf-8?B?SGVtSXRCdm5WUExOT3lXbGtxNE14YWZDVW9NdENheUUyZCtObkx6ZnRlTEpt?=
 =?utf-8?B?T0JzL3l1MHF4YkZRT1FQTWU0NDliMmd2R0p2TjRaZ3Q2MEFWR1pwZHdjNWFK?=
 =?utf-8?B?WnZjOHRNbTJQRnk2SU1LWkhNT0d6dldSSk02aU5LRG9PQjNkQmxOVHZJWUMy?=
 =?utf-8?B?OUVxVVdXRkNwSGdVNjFsQng4cWd0Y0t0ajBEM1BmMTd1bEI2Q2xGK3Y0Sy9V?=
 =?utf-8?B?YUlmaVBJbDdBaVp2KzNLZGk1SHNHNjJLS1NqU0VaQ2gxSTZXOUNJOFl5S2tp?=
 =?utf-8?B?UzY4Ylh3WFVEc2xYeWFSQlhRSmhUeVZRZzN4a0tIUlZXWllVR2RXMk5Ob2lh?=
 =?utf-8?B?RFVPTUV5SStEaThTeXVVY2ZrMUw5Q2w2bmxxMU9XbFpSc1FOdjkwQWp2ZFNQ?=
 =?utf-8?B?TXdrbW1mRVVUTWxOOCtyN2F1ZGt6ZTEwNW1Yd3NIOWdTYlVXYndJYUdnZ0t1?=
 =?utf-8?B?Q20walNsQWtUTUhPZzhyOUJiL2tGLzk5NkdiblNvT2R5eEJrYld1OEtnb1Bz?=
 =?utf-8?B?ZWhvQjRlVjQxWVRxcVRTNmo1cEtvY2RCTFhhQ0QvSUxwNVVzbGFXK2NnQVo2?=
 =?utf-8?B?VDJGYk1jS2V1dmtLQmFzRFZKT05oQjIyZ3pKcXFYdjllTVpXVGEzT2JrTGhS?=
 =?utf-8?B?ZDBFMjUxajRXVzJLZXRHb1BPOHpnM2JPOFQ3RzdyMHhwTUtnb3hKYjFOREZx?=
 =?utf-8?B?QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6486F80DBBD735409A03E84AD2F00BE7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c464a4-1685-4391-115c-08da8cba0a3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 08:06:28.9327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NQX+luC7s7MRlksmhPV4N6VAX2T5uNUB5vUIpelNedL85QVAhB/curY8EtbXdXNSok12DAsR8kuVjP+64x3m0V6lwYfA7tLkqSt96kIFiJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1425
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA5LzIwMjIgw6AgMjE6MjAsIFBldGVyIFppamxzdHJhIGEgw6ljcml0wqA6DQo+
IE9uIE1vbiwgQXVnIDI5LCAyMDIyIGF0IDExOjIyOjE1QU0gKzA1MzAsIFNhdGh2aWthIFZhc2ly
ZWRkeSB3cm90ZToNCj4+IEZyb206IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lA
Y3Nncm91cC5ldT4NCj4+DQo+PiBmaW5kX2luc24oKSB3aWxsIHJldHVybiBOVUxMIGluIGNhc2Ug
b2YgZmFpbHVyZS4gQ2hlY2sgaW5zbiBpbiBvcmRlcg0KPj4gdG8gYXZvaWQgYSBrZXJuZWwgT29w
cyBmb3IgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4+IC0tLQ0KPj4g
ICB0b29scy9vYmp0b29sL2NoZWNrLmMgfCAyICstDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90b29scy9vYmp0
b29sL2NoZWNrLmMgYi90b29scy9vYmp0b29sL2NoZWNrLmMNCj4+IGluZGV4IDkxNjc4MjUyYTli
Ni4uZWQyZmRmZWIxZDljIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvb2JqdG9vbC9jaGVjay5jDQo+
PiArKysgYi90b29scy9vYmp0b29sL2NoZWNrLmMNCj4+IEBAIC0yMDUsNyArMjA1LDcgQEAgc3Rh
dGljIGJvb2wgX19kZWFkX2VuZF9mdW5jdGlvbihzdHJ1Y3Qgb2JqdG9vbF9maWxlICpmaWxlLCBz
dHJ1Y3Qgc3ltYm9sICpmdW5jLA0KPj4gICAJCXJldHVybiBmYWxzZTsNCj4+ICAgDQo+PiAgIAlp
bnNuID0gZmluZF9pbnNuKGZpbGUsIGZ1bmMtPnNlYywgZnVuYy0+b2Zmc2V0KTsNCj4+IC0JaWYg
KCFpbnNuLT5mdW5jKQ0KPj4gKwlpZiAoIWluc24gfHwgIWluc24tPmZ1bmMpDQo+PiAgIAkJcmV0
dXJuIGZhbHNlOw0KPiANCj4gSSBzdXBwb3NlIHRoaXMgaXMgb2ssIGJ1dCBob3cgY2FuIHRoZSBs
b29rdXAgZm9yIGZ1bmMtPnNlYywgZnVuYy0+b2Zmc2V0DQo+ICpub3QqIGZpbmQgYW4gaW5zdHJ1
Y3Rpb24gPyENCg0KVGhhdCBoYXBwZW5lZCB0byBtZSBhdCB0aGUgYmVnaW5pbmcgd2hlbiB0aGUg
cG9ydCB0byBwb3dlcnBjIHdhcyBub3QgDQpmdWxseSBmdW5jdGlvbm5hbC4NCg0KSSBndWVzcyB0
aGF0IGNvdWxkIGFsc28gaGFwcGVuIHdpdGggYSBjb3JydXB0ZWQgb2JqZWN0IGZpbGUgc28gYmV0
dGVyIA0Kc2FmZSB0aGFuIHNvcnJ5Lg==
