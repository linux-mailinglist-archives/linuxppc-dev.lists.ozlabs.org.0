Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 299C259B8EE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 08:05:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MB1zf0X1zz3c7M
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 16:05:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=jYmuHYUW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.44; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=jYmuHYUW;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120044.outbound.protection.outlook.com [40.107.12.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MB1yt6558z2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 16:04:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCFSRQXmRVw6+3DfAb8ipB+dtdBaaUaUrmzrh+K33H+JRZrOoLFSUwfpGun1zhZAV66g6bmTjTBAkbOv7q3wdhI+8JMyeFa4VLwcWcZUgKu5FzsgsMRv8rUa9aLL/AtsX/JFUga1uP4lWT0mdu4rSx6QIt6C06iiK/WmV6OThaFLVOvU1eljpZl5ENYosbM+seOgTiwAr4/zBsKkxW4khJXatHQgPbBXRCJkGVpJs0rPkAOczCCB0tssVSuBNsxoGZ7/VAtg9IUSnyA4jZ6jYqd52rVoIPF3T/x+M5s8FanNTQX2c/tc3yHpB4Q57LEvgEAnvpC1KfK1QnO5KwZJcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8Mh78y5jRZzdrmuKGZ9VaD9I+CfJqXhMaAh//KWPIw=;
 b=fUxRleKcSk9St47rMIdf7gpSWYAXrV5WOH+N9rPo5FfohEsHM+CX33VVD9dzQq8mOU+3gODQiJDmWyeDXXGOzzrsQG1ZpqDD4RPmjtdSjWt4HGz1rkDuReXv5NXEDd6jPp3ywh6Z7R4SramZnLy5Rt64F4wjV2BiaH7qQHUoHHqhKSeYVFZRj/GDs0Xdkuucml0jxdrnyJsPMUSchJ0uXLQ4K5n0iMIczXyfmwaY1GFGLPkAQvuqfv0NiPdseVn6pXrLIjXHeQBmkJorextaB7fgagI2XGgAG+6gqj4WT32PcD4nbSt1IbIYLQLTZlv3KIBdL7r8V+LUQ1pQtzfarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8Mh78y5jRZzdrmuKGZ9VaD9I+CfJqXhMaAh//KWPIw=;
 b=jYmuHYUWRu1A1/Btde6h9JqnZm5VaDH8DQ6Rh/XS/dAi8ZuVUhniV5aYAcaNZ9JGfymLMlPvfwsft2JRhvG2C5E38zkjXXFI8CQ3lFEV5NMP0+LZCyAKxBuCwCjCjGKLbw+VORuZ80t8yUz1X4z8Nm08QI4fkucL5pACb8Epwhjj80/eTaRRBS4V5FgcxjsPHG7l76XPSIceh8qY4l9q75Bav6kIWj28ae/WzziPyptnsIbuRMjnPusENsj5n24+ERZJl2zms6hWN0MR0h5Rdhl8J+1AT1X8manPDlAccSWMa1sXzN/zsWCmf23srfUlv4H2xY87+FQTTtvXLOil8A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2895.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Mon, 22 Aug
 2022 06:04:01 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 06:04:01 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"atrajeev@linux.vnet.ibm.com" <atrajeev@linux.vnet.ibm.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lance@osuosl.org" <lance@osuosl.org>, "paulmck@kernel.org"
	<paulmck@kernel.org>, "rcu@vger.kernel.org" <rcu@vger.kernel.org>
Subject: Re: [PATCH linux-next] powerpc: disable sanitizer in
 irq_soft_mask_set
Thread-Topic: [PATCH linux-next] powerpc: disable sanitizer in
 irq_soft_mask_set
Thread-Index: AQHYtPl0/VA1s9ADPEeW7qUGdddrzK26cACA
Date: Mon, 22 Aug 2022 06:04:01 +0000
Message-ID: <6375fd69-d57f-be90-6b17-f183e918dbc8@csgroup.eu>
References: <20220821010030.97539-1-zhouzhouyi@gmail.com>
In-Reply-To: <20220821010030.97539-1-zhouzhouyi@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5da2c265-256b-49a0-797c-08da84041c33
x-ms-traffictypediagnostic: PAZP264MB2895:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  iB5XBfbkSMyXLNCT140nPHMkHENST253PnI35D5PQ0sQ2p3/I0SQgH1G2uKqOpB1V9ciOCqs4vSIKGzLTCkeDe3f25ZC9TRqvTlYBHPsHTKm91EQN0XZuWrHDxn6llyaiMly21Yp1nUzKciGDH1TbiDCfJBiuFaIpvOpl1La0RZAiKOdVRCIeA8pyVJWKfrJegMRsl5v8A7ubfkZ/IZWn5+5PH/xdO7s3ykgKTeEKsE7ToAaAxFC1Gi5AfC40XTiZDTIvGIJrXYNJ/DjTI2p9+0RYc05vHFgFKNbWu258pwZCpSguIiDiXGHXPPWf8gl/XS1P8Fdn1KHVQ9rbrd1A3MFHg/AcWPpxbhbzsd8f45wjs+Y61FQJdJ/C5ymq3/YVlkjw0uSF7Sx8fP8onqLKmIIHiRx9bmiYJJucGMO0aZtVoiLZnkGPJ70R2pCHfPeczdeI6KJy+pLb2ndjsRPvsm8ZdC9XQE+Cq6l50SeyscIJAlYgmOV4Vh1HmXbNZ+46RHuhUa199Gns1HYeXax9WvaOMeNoFm0kdFwsd2cHm5hL7UuS/KVk5C5DahEA9quuno4nk+Mb6g1tXpNub0Yb0YlzFAIspflxjA9abdgnl5uLbWEU6+w1p+470Iyg32Deym3ooKCw7jlcZx55/CNictwb46JwZtSKQycXiR3p57j+5UFHHEOQfadbFliHCi/FwPGvveYmd6HqER+pYZCHHug/N4exvSLxMqMG8bvEZqIyIa6s+2H8NAHvTI7cih0W7vwX7AVUfDK0zcG9av+GvPoNCnt0IfDtGo+QhWdRAJeulFh46hkPTeqHjKOYnhSdZXGMeV0kaigYchONnhsaQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39840400004)(346002)(136003)(366004)(122000001)(76116006)(66556008)(8676002)(64756008)(66476007)(66446008)(66946007)(86362001)(38100700002)(31696002)(38070700005)(110136005)(91956017)(36756003)(31686004)(2616005)(26005)(6512007)(66574015)(6506007)(41300700001)(6486002)(478600001)(71200400001)(186003)(316002)(8936002)(83380400001)(2906002)(44832011)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?b3ZYN3VXZnQ5QSt1YTFUbGdESWk4NFQ0OCswVDdUVEdkOGpreFo4dkh2QjhZ?=
 =?utf-8?B?NFNnUXRuZDZvYm1qdUhlRVhtVUFQL1ZFc1lCL3hJUTdmcVpqRWFBWGlGUFFw?=
 =?utf-8?B?RElTS1NiUElqT0JsdWlKREMzY2szY0MxaWUvLzJ4elBFVENvM0NLbXRySVRl?=
 =?utf-8?B?NDZyY1pNRkt3Q21BaXhWYThFclhuY25QcUpaTzNzTm56MWMvcmhDc2x6ejhx?=
 =?utf-8?B?VUxPeGRJbVNUa3hFRVc2Y3c0Wk1EMUFSTVFwVnlWSHhDQThjbzRFcUh5YzZo?=
 =?utf-8?B?eFNvYU12T3NkOVZRdC96NUJLT3JHQTJYQ2VyUUh3OUlMN1NtNjJBYkJCcFA2?=
 =?utf-8?B?TTIyQjVZdVl3cXhBcUlDQU1RazF6NEdNa1Z2cUhGZHh1NGxkaGlwM0FuR2F0?=
 =?utf-8?B?czVlWEloRS9DeXF0TGtMRmZhT0dHL0liU0hnektBUndLNjFHdGgyMmcxRDQ1?=
 =?utf-8?B?SjlHOTF2Z2FzVGVqTTRKYllTaXE0RjNZWjZFT0hpWk8zZWJmVjZBSHVMNDh3?=
 =?utf-8?B?T1BGYjZJOGpGK1dTZHB4K0RHWWNxWlQydVNPTGxDSnFKVjA1MFRwekJCWnVi?=
 =?utf-8?B?T0NoVXU0YWw2QkIrM3JiUnI2NEpZOVplNVIrOTdvY1ptZmlwZ20yc01QSlFK?=
 =?utf-8?B?ei9wbGpRdlpIdVpucWlKQXNDbzNUTjVIa2VJdytqK2xwQ1BGbVY1eURCYmpY?=
 =?utf-8?B?bFVWdG9vV0N0N3c2aytTeW5OUTVOUDhJclU4U3ZkY1o4dnhzNW95djJpaUZl?=
 =?utf-8?B?NEExdGgzV01YZGc0VUlucUxCdzBzcDV0MGY3cWM0Um9GSTNyQ2dLbzlFN1Vt?=
 =?utf-8?B?R1VjYUJLbmFIbkJWMlNhekxZTXZWUHp6bWtUOU5ySVBITnNIY2ZDdi93eC82?=
 =?utf-8?B?MnRNV2JRSUdQODUyWUFtWVZxOFBzK3NHM20rZy9wdVRlZHRPRUdRWkpCa25z?=
 =?utf-8?B?bGdTRHlWWnJON3dnQ3g4OXd6UVl5ZThBemUxOXJZNlBPemhRZVhyMkFCZnRP?=
 =?utf-8?B?aHI3WFlwMmYrVVdleXFUUFlCM3lDOWczOXJQTDB2akNDRENFbFlJT2RmaVhy?=
 =?utf-8?B?cHpSQVdLNjhxVXFPd0svL2E0amUxTU9xS2d5SWl1cnQ5cUZuVkdod1hTNzdI?=
 =?utf-8?B?OW10eEdhR2gvbHpwbWdKU3R0b1NzaU1hTWpCVGRSREZlay9qK0MvMysxZUpR?=
 =?utf-8?B?RENFQVkxV3VWL0xZT1lweVRmNnQ3ODhGYXZNLzNHWThOc0VYbVBTRXVPUGRD?=
 =?utf-8?B?MmdMWDdGMjhSK3MycUtPcFd6ZlJ5Vk1oeFpVZ1Q0S1hOUmRCbFgvbzUzZmsx?=
 =?utf-8?B?cWpiUVVJVUxjcFRDVUZtSXgxK3QzT2JGZjMwYmhOWXQrOFRmVFJpcEF5NFVz?=
 =?utf-8?B?WlN1T1NCRC91Tk5pWnhHTUlTZ2dKSkxwcWR2Z1ZpUS9qZVNQU0w2a3dWcXpM?=
 =?utf-8?B?MlovZzdEeXFMYzU0c3IxTEVJWlUvOGN4YXExVzUxZDIrSCsrV0c1bzlld0tS?=
 =?utf-8?B?bEs4bVZaWE5UMGZOTW1hU0pLaXBySDBNK253WU5LZzhwNTEvUXpjWEFXaEsz?=
 =?utf-8?B?LzU1c1dIWlpGMHV4MmltSnhRUTRVOTdUVXJzMkhTdWVaNnFHcHloeUgwOXhY?=
 =?utf-8?B?UW13RUNDbGlsOXk5QXovZk9RK1p6aWtseE93UjBINEp2REduMlE1UzZTVnVi?=
 =?utf-8?B?OUJveGltd1lsd1o5RGlzNERJTEFWNDQ4ZXBVaDlESlZhZlBYZ0FlSVJ2dU0x?=
 =?utf-8?B?QWFTODJxdEdRQmVUemZsUTB2aGFNYlpUWUt0YU1rM0NEWW90Rkg5YlpPcTVQ?=
 =?utf-8?B?N1ZvdUhoa0JoMVZRS2VHalRLbFBBVlBFYTBSM1V1YWVMRFBFQTNXbGdlclds?=
 =?utf-8?B?Q2NwMTAxQTNTUldpcGs1NHA1dDZ3TlF2ak00WEV4UlBMaCtqSzRuaC9nRGo1?=
 =?utf-8?B?M3BzQ01lS0FSMVFPanVNTEdtM2Q1WHptb0NpNkU5MFRESi9NQ0xQb0doM0ZK?=
 =?utf-8?B?d0JJbnNnN25ZVXpDZ2RYb0Q4WDJ5VVRkSDBGR3dtSDU0WHVNMEZzYkpYWlJX?=
 =?utf-8?B?YkF0TG5tWlZ2SHhMVmZCanQwVDEzb0l2bnpVdGFHTkJOOTBEdlVsKzV0UFdI?=
 =?utf-8?B?S1c2Qlg2N0h1WFBQWFQzMFJranJKeEZqK1NMT1FwSDR4SDdNTE1iaU1EQUpV?=
 =?utf-8?B?NFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6840CD57CB71624B87EB6C9AE7B02D16@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da2c265-256b-49a0-797c-08da84041c33
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 06:04:01.3592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hbCspK0ftF+apyOHeibp3N9Tc8m7nuaIRiTE6qJPbKNApSPM5/rY3pepSwTLximPeWjSnxxFzR//YT/W/iyfyo9lhd34+8r1WH+LAAznJQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2895
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

DQoNCkxlIDIxLzA4LzIwMjIgw6AgMDM6MDAsIFpob3V5aSBaaG91IGEgw6ljcml0wqA6DQo+IElu
IHBwYywgY29tcGlsZXIgYmFzZWQgc2FuaXRpemVyIHdpbGwgZ2VuZXJhdGUgaW5zdHJ1bWVudCBp
bnN0cnVjdGlvbnMNCj4gYXJvdW5kIHN0YXRlbWVudCBXUklURV9PTkNFKGxvY2FsX3BhY2EtPmly
cV9zb2Z0X21hc2ssIG1hc2spOg0KPiANCj4gICAgIDB4YzAwMDAwMDAwMDI5NWNiMCA8KzA+Oglh
ZGRpcyAgIHIyLHIxMiw3NzQNCj4gICAgIDB4YzAwMDAwMDAwMDI5NWNiNCA8KzQ+OglhZGRpICAg
IHIyLHIyLDE2NDY0DQo+ICAgICAweGMwMDAwMDAwMDAyOTVjYjggPCs4PjoJbWZsciAgICByMA0K
PiAgICAgMHhjMDAwMDAwMDAwMjk1Y2JjIDwrMTI+OglibCAgICAgIDB4YzAwMDAwMDAwMDA4YmI0
YyA8bWNvdW50Pg0KPiAgICAgMHhjMDAwMDAwMDAwMjk1Y2MwIDwrMTY+OgltZmxyICAgIHIwDQo+
ICAgICAweGMwMDAwMDAwMDAyOTVjYzQgPCsyMD46CXN0ZCAgICAgcjMxLC04KHIxKQ0KPiAgICAg
MHhjMDAwMDAwMDAwMjk1Y2M4IDwrMjQ+OglhZGRpICAgIHIzLHIxMywyMzU0DQo+ICAgICAweGMw
MDAwMDAwMDAyOTVjY2MgPCsyOD46CW1yICAgICAgcjMxLHIxMw0KPiAgICAgMHhjMDAwMDAwMDAw
Mjk1Y2QwIDwrMzI+OglzdGQgICAgIHIwLDE2KHIxKQ0KPiAgICAgMHhjMDAwMDAwMDAwMjk1Y2Q0
IDwrMzY+OglzdGR1ICAgIHIxLC00OChyMSkNCj4gICAgIDB4YzAwMDAwMDAwMDI5NWNkOCA8KzQw
PjoJYmwgICAgICAweGMwMDAwMDAwMDA2MDliOTggPF9fYXNhbl9zdG9yZTErOD4NCj4gICAgIDB4
YzAwMDAwMDAwMDI5NWNkYyA8KzQ0PjoJbm9wDQo+ICAgICAweGMwMDAwMDAwMDAyOTVjZTAgPCs0
OD46CWxpICAgICAgcjksMQ0KPiAgICAgMHhjMDAwMDAwMDAwMjk1Y2U0IDwrNTI+OglzdGIgICAg
IHI5LDIzNTQocjMxKQ0KPiAgICAgMHhjMDAwMDAwMDAwMjk1Y2U4IDwrNTY+OglhZGRpICAgIHIx
LHIxLDQ4DQo+ICAgICAweGMwMDAwMDAwMDAyOTVjZWMgPCs2MD46CWxkICAgICAgcjAsMTYocjEp
DQo+ICAgICAweGMwMDAwMDAwMDAyOTVjZjAgPCs2ND46CWxkICAgICAgcjMxLC04KHIxKQ0KPiAg
ICAgMHhjMDAwMDAwMDAwMjk1Y2Y0IDwrNjg+OgltdGxyICAgIHIwDQo+IA0KPiBJZiB0aGVyZSBp
cyBhIGNvbnRleHQgc3dpdGNoIGJlZm9yZSAic3RiICAgICByOSwyMzU0KHIzMSkiLCByMzEgbWF5
DQo+IG5vdCBlcXVhbCB0byByMTMsIGluIHN1Y2ggY2FzZSwgaXJxIHNvZnQgbWFzayB3aWxsIG5v
dCB3b3JrLg0KPiANCj4gVGhpcyBwYXRjaCBkaXNhYmxlIHNhbml0aXplciBpbiBpcnFfc29mdF9t
YXNrX3NldC4NCg0KV2VsbCBzcG90dGVkLCB0aGFua3MuDQoNCllvdSBzaG91bGQgYWRkOg0KDQpG
aXhlczogZWY1YjU3MGQzNzAwICgicG93ZXJwYy9pcnE6IERvbid0IG9wZW4gY29kZSBpcnFfc29m
dF9tYXNrIGhlbHBlcnMiKQ0KDQpCeSB0aGUgd2F5LCBJIHRoaW5rIHRoZSBSRUFEX09OQ0UoKSBs
aWtlbHkgaGFzIHRoZSBzYW1lIGlzc3VlIHNvIHlvdSANCnNob3VsZCBmaXggaXJxX3NvZnRfbWFz
a19yZXR1cm4oKSBhdCB0aGUgc2FtZSB0aW1lLg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaaG91
eWkgWmhvdSA8emhvdXpob3V5aUBnbWFpbC5jb20+DQo+IC0tLQ0KPiBEZWFyIFBQQyBkZXZlbG9w
ZXJzDQo+IA0KPiBJIGZvdW5kIHRoaXMgYnVnIHdoZW4gdHJ5aW5nIHRvIGRvIHJjdXRvcnR1cmUg
dGVzdHMgaW4gcHBjIFZNIG9mDQo+IE9wZW4gU291cmNlIExhYiBvZiBPcmVnb24gU3RhdGUgVW5p
dmVyc2l0eSBmb2xsb3dpbmcgUGF1bCBFLiBNY0tlbm55J3MgZ3VpZGFuY2UuDQo+IA0KPiBjb25z
b2xlLmxvZyByZXBvcnQgZm9sbG93aW5nIGJ1ZzoNCj4gDQo+IFsgIDM0Ni41Mjc0NjddWyAgVDEw
MF0gQlVHOiB1c2luZyBzbXBfcHJvY2Vzc29yX2lkKCkgaW4gcHJlZW1wdGlibGUgWzAwMDAwMDAw
XSBjb2RlOiByY3VfdG9ydHVyZV9yZWEvMTAwXk0NCj4gWyAgMzQ2LjUyOTQxNl1bICBUMTAwXSBj
YWxsZXIgaXMgcmN1X3ByZWVtcHRfZGVmZXJyZWRfcXNfaXJxcmVzdG9yZSsweDc0LzB4ZWQwXk0N
Cj4gWyAgMzQ2LjUzMTE1N11bICBUMTAwXSBDUFU6IDQgUElEOiAxMDAgQ29tbTogcmN1X3RvcnR1
cmVfcmVhIFRhaW50ZWQ6IEcgICAgICAgIFcgICAgICAgICAgNS4xOS4wLXJjNS1uZXh0LTIwMjIw
NzA4LWRpcnR5ICMyNTNeTQ0KPiBbICAzNDYuNTMzNjIwXVsgIFQxMDBdIENhbGwgVHJhY2U6Xk0N
Cj4gWyAgMzQ2LjUzNDQ0OV1bICBUMTAwXSBbYzAwMDAwMDAwOTQ4NzZjMF0gW2MwMDAwMDAwMDBj
ZTJiNjhdIGR1bXBfc3RhY2tfbHZsKzB4YmMvMHgxMDggKHVucmVsaWFibGUpXk0NCj4gWyAgMzQ2
LjUzNjYzMl1bICBUMTAwXSBbYzAwMDAwMDAwOTQ4NzcxMF0gW2MwMDAwMDAwMDE3MTI5NTRdIGNo
ZWNrX3ByZWVtcHRpb25fZGlzYWJsZWQrMHgxNTQvMHgxNjBeTQ0KPiBbICAzNDYuNTM4NjY1XVsg
IFQxMDBdIFtjMDAwMDAwMDA5NDg3N2EwXSBbYzAwMDAwMDAwMDJjZTJkNF0gcmN1X3ByZWVtcHRf
ZGVmZXJyZWRfcXNfaXJxcmVzdG9yZSsweDc0LzB4ZWQwXk0NCj4gWyAgMzQ2LjU0MDgzMF1bICBU
MTAwXSBbYzAwMDAwMDAwOTQ4NzhiMF0gW2MwMDAwMDAwMDAyY2YzYzBdIF9fcmN1X3JlYWRfdW5s
b2NrKzB4MjkwLzB4M2IwXk0NCj4gWyAgMzQ2LjU0Mjc0Nl1bICBUMTAwXSBbYzAwMDAwMDAwOTQ4
NzkxMF0gW2MwMDAwMDAwMDAyYmIzMzBdIHJjdV90b3J0dXJlX3JlYWRfdW5sb2NrKzB4MzAvMHhi
MF5NDQo+IFsgIDM0Ni41NDQ3NzldWyAgVDEwMF0gW2MwMDAwMDAwMDk0ODc5MzBdIFtjMDAwMDAw
MDAwMmI3ZmY4XSByY3V0b3J0dXJlX29uZV9leHRlbmQrMHgxOTgvMHg4MTBeTQ0KPiBbICAzNDYu
NTQ2ODUxXVsgIFQxMDBdIFtjMDAwMDAwMDA5NDg3YTEwXSBbYzAwMDAwMDAwMDJiOGJmY10gcmN1
X3RvcnR1cmVfb25lX3JlYWQrMHg1OGMvMHhjOTBeTQ0KPiBbICAzNDYuNTQ4ODQ0XVsgIFQxMDBd
IFtjMDAwMDAwMDA5NDg3Y2EwXSBbYzAwMDAwMDAwMDJiOTQyY10gcmN1X3RvcnR1cmVfcmVhZGVy
KzB4MTJjLzB4MzYwXk0NCj4gWyAgMzQ2LjU1MDc4NF1bICBUMTAwXSBbYzAwMDAwMDAwOTQ4N2Ri
MF0gW2MwMDAwMDAwMDAxZGU5NzhdIGt0aHJlYWQrMHgxZTgvMHgyMjBeTQ0KPiBbICAzNDYuNTUy
NTU1XVsgIFQxMDBdIFtjMDAwMDAwMDA5NDg3ZTEwXSBbYzAwMDAwMDAwMDAwY2Q1NF0gcmV0X2Zy
b21fa2VybmVsX3RocmVhZCsweDVjLzB4NjReTQ0KPiANCj4gQWZ0ZXIgMTIgZGF5cyBkZWJ1Z2dp
bmcsIEkgZmluYWxseSBuYXJyb3cgdGhlIHByb2JsZW0gdG8gaXJxX3NvZnRfbWFza19zZXQuDQo+
IA0KPiBJIGFtIGEgYmVnaW5uZXIsIGhvcGUgSSBjYW4gYmUgb2Ygc29tZSBiZW5lZmljaWFsIHRv
IHRoZSBjb21tdW5pdHkgOy0pDQo+IA0KPiBUaGFua3MNCj4gWmhvdXlpDQo+IC0tDQo+ICAgYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL2h3X2lycS5oIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9od19pcnEuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9o
d19pcnEuaA0KPiBpbmRleCAyNmVkZTA5YzUyMWQuLmE1YWU4ZDgyY2M5ZCAxMDA2NDQNCj4gLS0t
IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2h3X2lycS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9od19pcnEuaA0KPiBAQCAtMTIxLDcgKzEyMSw3IEBAIHN0YXRpYyBpbmxp
bmUgbm90cmFjZSB1bnNpZ25lZCBsb25nIGlycV9zb2Z0X21hc2tfcmV0dXJuKHZvaWQpDQo+ICAg
ICogZm9yIHRoZSBjcml0aWNhbCBzZWN0aW9uIGFuZCBhcyBhIGNsb2JiZXIgYmVjYXVzZQ0KPiAg
ICAqIHdlIGNoYW5nZWQgcGFjYS0+aXJxX3NvZnRfbWFzaw0KPiAgICAqLw0KPiAtc3RhdGljIGlu
bGluZSBub3RyYWNlIHZvaWQgaXJxX3NvZnRfbWFza19zZXQodW5zaWduZWQgbG9uZyBtYXNrKQ0K
PiArc3RhdGljIGlubGluZSBub3RyYWNlIF9fbm9fa2NzYW4gX19ub19zYW5pdGl6ZV9hZGRyZXNz
IHZvaWQgaXJxX3NvZnRfbWFza19zZXQodW5zaWduZWQgbG9uZyBtYXNrKQ0KPiAgIHsNCj4gICAJ
LyoNCj4gICAJICogVGhlIGlycSBtYXNrIG11c3QgYWx3YXlzIGluY2x1ZGUgdGhlIFNURCBiaXQg
aWYgYW55IGFyZSBzZXQu
