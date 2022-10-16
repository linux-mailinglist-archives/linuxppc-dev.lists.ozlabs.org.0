Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9232A600180
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Oct 2022 19:01:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mr5xD3Gvbz3bhZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 04:01:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=d2sgDrzh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.80; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=d2sgDrzh;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120080.outbound.protection.outlook.com [40.107.12.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mr5wD5rg5z2x9C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Oct 2022 04:00:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbiID483npnCFv2BjvOQiJmEobpPJLpb/nSui2i2DNhR45QXaSNk5uZTavmy9DbhmMForOdtpmu38Lmk61tIzDGpx3oxeV+qekJF6gzZuXw7ra4JIxn4dk+VLu3C/KqkHWOGOozh9PW0SR7lyreMA+G0vvHY/BhiTXZJkTC4YbEWh3vUPtvGOvA78MX2tLaRVSVzE++qSFF4z8WCAI7OhK2Dwzd7kzYBYHi3/yA0x5RmZO0HSYmyjFncj+BM/jF6L/pdDoPeAWyzeKnZVgKBAFFQMt/c88upj6lXVivosxPSmn4kQEbhd7ta4Cw7Xf0kug9qODszxbRMIKrmWdWOqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=macwW2i6h+jhzzblUjJmNkx5O5LdZitQEpeApHar6XQ=;
 b=l49XA5gS6ekshIGNZxE0S8dD3mvHGpo5cwJyaSpXvb04+oCxioqmaqjG7oN8QfcpeZqoAFLw33fyymWNCyjUi0JIJZX/ecdr6vY00+GhrFkB+d0owGveYwNl6Y++X7Lr8Z5KWV5PFPSAWFGhYyBbigXh61TlTBi8uzLWEsO75+wmogJOxzic+bfiylnOWloDdYrX4iv2Yf5ZJngxdIS5nYeD6+ZIQY1XR1MdlRuAq6MwAwrIWIq/MUbCslJAzzrXl7q/8ZSVXUIWK1pgstPmuzNvFWuehjbVNVMMzapkRzoygmcCh3l5JA/0H5lMbziCnI4jMp8wj9AUc9mw+vv05A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=macwW2i6h+jhzzblUjJmNkx5O5LdZitQEpeApHar6XQ=;
 b=d2sgDrzhzvMlPdahXDHjsFrOG6eCZNjUYroViqaXd4EotCht+yjlL/DvBFf6md1KZC1vnoYqy7GlYk6WqqSdxrMiHHjzOHdtFG6zxn6e4InwndTt/O2dRPyjgffHguUfdSfoGlX0B7/R0gSf1CI8SgcC2gNkSbaeI0buZVMETHpQZ6RurahJVaIA/PY/89NTAVK9LetoxYlq1nnqFtWIpF8P/ynf62pWRrsQy2CTbgl76c/BgolYDkdowHTelwvb9FrpQJIG0C4QkmbC1fwJU3S/zqQtc562ziz31AzFFInFP3AkjBVodJGRoszzCEl9WUqhIeAQsl8Np3L5HnljGA==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 PAZP264MB1430.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:121::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32; Sun, 16 Oct 2022 16:59:53 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c489:75f:98f4:b143]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c489:75f:98f4:b143%6]) with mapi id 15.20.5723.032; Sun, 16 Oct 2022
 16:59:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [PATCH 2/7] powerpc/85xx: Mark mpc85xx_ds_pic_init() as static
Thread-Topic: [PATCH 2/7] powerpc/85xx: Mark mpc85xx_ds_pic_init() as static
Thread-Index: AQHYtABEs/XtKdJlskKmHA1duRa+Xq3xsPoAgAAA5QCAH4SHgIAAYvgA
Date: Sun, 16 Oct 2022 16:59:53 +0000
Message-ID: <3111f16b-2e6d-c46f-67e9-6cb5fada4cc7@csgroup.eu>
References: <20220819191557.28116-1-pali@kernel.org>
 <20220819191557.28116-3-pali@kernel.org>
 <fd9c174e-2c89-7e11-9e68-d6044b7eab21@csgroup.eu>
 <20220926094706.km22rqzuuulvfssq@pali> <20221016110529.76bcgq2v2h4pg2of@pali>
In-Reply-To: <20221016110529.76bcgq2v2h4pg2of@pali>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB2980:EE_|PAZP264MB1430:EE_
x-ms-office365-filtering-correlation-id: b5ad816d-e626-4c4e-940e-08daaf97d8c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  RkrSkfjalzqaUDIxywBeupC/MlspTV/qPhCD7NHBznOEQsxBsIghQN7Pb9z8iLE8YsbJC0lr8E/T1WQws9um6AJF1dwv+BJo5Yr6atKqjilyXZLINBJque/YZYTeSP+UFjBtwyaI3mBXyoTNnUeLSo5Rhwa6o0C//QwMqesftYUxPYu98RzrqjmO3dtSIvmUjKjezqh/eDPmvcUPUI2jIr/auXFf3junB3Y3OfDKkRW8BGscA9n4SKXR6Fr1jofopbS6LtOK8ZOxoibhJjHDjl2XgbZ5oec09Cmx2FhzfvWVEy3P155oWZpWgMA3aT3W/p0gMN8uz3SlZf901Hxu3ebIa50DHmRMnDi0fY/p+Q+IgHq6B/RHZAurluBH3v4ZnVoxI3HG+1a5PQ9/40FroDsPORgHByJxPf57z/sP56cDfa+LUc6zkfxQf2tMjb2wZXyDxsPB2ZChaJ5reTmwF39HAk/pbsw/J3pKx1FUzzqhyy8F8o0+PR+fq2LP0zYLj+1ExcwG6lmVsEMdK9sgcplINuXZunHsGKf6SluOyaAph6KtTqu92g/wj+Gg83Ywb3C/d1zFTAs3EI2rhb7Cj6hjVgzvEqqI/NXz7mWI2esWdz27gu52q8GdyNSHm0GR8Ycq8rdBzczx8qRCxoheovIIozcU0vhLxTTi6WIkRtK3Or4lWtVnnBcu8Al7525/nNu88mMcKXWUVp9FBsObigRB7SmMz0nzpBExfgGZM/j/mXFdrRhY2wjSgO+Qg3Wd+WrIfmOw5cX7K55Y/mnZlBlWDxmNkwZIjg7Du0YWOtNyNEtBIOIoNX6kCPE6eZwicaxRGdpKcbPupdWI/SJXwQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39850400004)(376002)(346002)(396003)(136003)(451199015)(66574015)(38070700005)(36756003)(122000001)(86362001)(31696002)(38100700002)(83380400001)(91956017)(76116006)(66556008)(66476007)(64756008)(8676002)(66446008)(5660300002)(54906003)(316002)(6916009)(31686004)(66946007)(44832011)(4326008)(186003)(71200400001)(6486002)(2906002)(8936002)(2616005)(6506007)(478600001)(6512007)(26005)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RjNzYnNVVjcrbnd5czFUbDZjY0R4YkxKOXlpcHZoMlNhV0U2NVhpa3phakMz?=
 =?utf-8?B?d3krd2YyUDYzQlRzeVU0Z0U0Mi9kcUZMeFh2RHRMbDU2RExXWWtBZ3JuaFB1?=
 =?utf-8?B?NEhaS01SMk4zNmtBOHljVzhGMjVwMGpCZU8yTEZSOTdmUnRwYjVZNkRwV3N0?=
 =?utf-8?B?eERCaWgwQXZ3aVUvQ3YzMkdBSGF6cjVNakVxMDdEQmJTcnFIaGw2MWlSb3ph?=
 =?utf-8?B?V01la0ZDc1V2U0owWnhvNmRibjFWSXI2S3djY3J2M3FCU1lxL2lYeEJ1UDNE?=
 =?utf-8?B?SG5INkFwUUxvVjFIQ3pLVFVVNkRBWGpWOFNYeTFqUEVGQzFBSUF4NkJQeTY1?=
 =?utf-8?B?TjY2ZGZCR21KV2lKL0taVUJuVDgwazhka1hHUktNNEw3THYxa0ZMd0FTNFJx?=
 =?utf-8?B?eS8xMXhudzJkQjU5RndLN1VablZrTHhOWUkveHhNa1lISWFCMTN5ZmdyMkMr?=
 =?utf-8?B?OWtBbUhjYmF0aUZJNTNYbXh6d0V0djNDTVJIc2hiQmFnUTVsZjhPeXI5cXJJ?=
 =?utf-8?B?bC9wUWQrU2I0QlpycGc2b0M4RFRVMlJNRGtVU29QeWsxSGxUNEZzOHZNd1Fo?=
 =?utf-8?B?dDZJU3FRSXBpM0t3N21Zamx1MUovZXNka2plOGxWQnlyRk44SVg2OVNqSklT?=
 =?utf-8?B?cFZvNGkwU2Y2NmRmdzBVbXQwNnhvRW85Q3VZZHR0MStFcnJtZmoxSi9mWjVm?=
 =?utf-8?B?N081TlFaTXFlUEF0K3B2aHU2NC9MS0RGYlJDV0krYUtLUjkvekgrNE5UL3VU?=
 =?utf-8?B?VSt2amwyazRhK2JzTUI1YWltNlRVS09HQTNjQ2orckRRUHk1WjFESVR1QzVS?=
 =?utf-8?B?Qm0xRWJtUGx0SUFHbUIrelM1NGE0UE1VK2txSlZjem5SVWZvbExMZjZ5dDNR?=
 =?utf-8?B?TlFZVDljdzV2dEJ2T3Y1aStENTdhMWxHNzd5ek0xTzJjbXZ6a2lCYlY1UHQw?=
 =?utf-8?B?WU05U2JtYzhzWVI1OFlxVngvQVNGT1AyR3BiaUt6YW1CODRrbWRBUGVuOG9B?=
 =?utf-8?B?YUpDak80Ni9GTGcvTytNajB1S1hRNzRJb0loc3hyTDM2bTlzN04xcldBc09n?=
 =?utf-8?B?OHVqVVhsb2FHdnBwOXlLZ29TZnJLNk5KTFlsLyt4b3BlZlRCV2djSlVXcGwy?=
 =?utf-8?B?NkJYRmExd202dzNGRlU0eWlldjVpVDZldXcwcDBnVVpPN2dTVjZtYjFEYk1H?=
 =?utf-8?B?dzVGbjZYSjlCYkRFWHFZWFJjcUNyWDRSVjhFdXdLdnpYajM1TSsvNmE3VXBP?=
 =?utf-8?B?emRlQnJFTzZHWHdhTmphVVY3VnluY2tadmJZNEFwMkJSd2tKZlM0RnNSWXlF?=
 =?utf-8?B?Z1E5VS9kdEZncEJjQllUamNUL2tNeElDcnJKVk9VSFRQVjh4ZDBhUGdhQkdj?=
 =?utf-8?B?QUtobFlobjNMZmRvTVkxUWhrQWtlblVxOG1pajVzcTludHJrYVh4cWU3U1VI?=
 =?utf-8?B?NlcyVVNXQmJMNHF3c1dINkdYVjMyL2Jlbjk3Ulg5a2NYYXZETGpSNXE0ZENi?=
 =?utf-8?B?R1BCQi9heXdwS0RaWFdCTDJkOUc4UWRiNnp5WlRFd3p5b0wrMHdoRDB0bjcy?=
 =?utf-8?B?YVAzT1EySmU5SXVIQ1pUZytNSllxOHBidUhYV3kzNW41ZDBCL0NaenB4QzhM?=
 =?utf-8?B?WWFDNERQQ0V6RnJ6R0k2QlJTdzZmeVBOZTRob3dEM25BbkdCcDhxNU9WZi84?=
 =?utf-8?B?Q1BDRkIvR29MNXJOMU8vWFVib2h0TU9MRlpGMGlOVm1zRjJHMUlOOEp1Ukta?=
 =?utf-8?B?KzE4MlFNTGFoaG9WVjlIdGVCUWJnOXVtRlRnSFluNFEyeFJjTXV2N0Y3ZUNN?=
 =?utf-8?B?SzlRaE8rWDkrc09lSHVXYkl6SGhwRXRjZTNBdWNlTUt1NFQ0TVYrU2huUnNX?=
 =?utf-8?B?ZUhpUXNjd2dsbnN2TmJyUDhuaDJNQTRFYVd4TzAvVWx3ellrUU9BelF4UW1D?=
 =?utf-8?B?K0F2QzlDK0VKKzhEREovNEdCR3pPUGJlMlM1Z01IZ2hnQ0tpWW1CWVJPeE9P?=
 =?utf-8?B?TlIrd3g2Q3pHelV3TnBQbGN2VTdYcXdtSGZBQ01hNlJaVXU2OFJBTEtBei96?=
 =?utf-8?B?YjMzRXJteTd5WHk3ZVZVeFhnWHFmS1RoNjBsQkE0ZHc4ZXJpZ092dHlBZXpr?=
 =?utf-8?B?UjZvQWhSbEl1Nk91ZlZIMUZEM1M3U0Nza25SRHBIRG9TaFJxNGlwYnFjQUFo?=
 =?utf-8?Q?lyGbNa3jZ1sABCnH0/XrQN4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE29AD3B91D9624CBBBE527B55E51B9F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ad816d-e626-4c4e-940e-08daaf97d8c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2022 16:59:53.7914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FDlE3sno4VAWOHIabkya/6lKFb3cu2bvVR0mTFULq7WQONNwgCD/M2OTDW5ZdUm6Dsdw4FVqAQHtUXouA0G/ZhJF+LH+Wp0JlAVJnWv+KkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB1430
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
Cc: Sinan Akman <sinan@writeme.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGVsbG8sDQoNCkxlIDE2LzEwLzIwMjIgw6AgMTM6MDUsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6
DQo+IEhlbGxvIENocmlzdG9waGUhIERvIHlvdSBoYXZlIGFueSBvdGhlciBjb21tZW50cyBmb3Ig
dGhpcyBwYXRjaCBzZXJpZXM/DQoNCkknbSBBRksgZm9yIHR3byB3ZWVrcywgYnV0IGFzIGZhciBh
cyBJIHJlbWVtYmVyIEkgZG9uJ3QgaGF2ZSBhbnkgbW9yZSANCmNvbW1lbnRzLg0KDQo+IA0KPiBP
biBNb25kYXkgMjYgU2VwdGVtYmVyIDIwMjIgMTE6NDc6MDYgUGFsaSBSb2jDoXIgd3JvdGU6DQo+
PiBPbiBNb25kYXkgMjYgU2VwdGVtYmVyIDIwMjIgMDk6NDM6NTUgQ2hyaXN0b3BoZSBMZXJveSB3
cm90ZToNCj4+PiBMZSAxOS8wOC8yMDIyIMOgIDIxOjE1LCBQYWxpIFJvaMOhciBhIMOpY3JpdMKg
Og0KPj4+PiBGdW5jdGlvbiBtcGM4NXh4X2RzX3BpY19pbml0KCkgaXMgbm90IHVzZWQgb3V0IG9m
IHRoZSBtcGM4NXh4X2RzLmMgZmlsZS4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogUGFsaSBS
b2jDoXIgPHBhbGlAa2VybmVsLm9yZz4NCj4+Pg0KPj4+IFRoaXMgcGF0Y2ggc2hvdWxkIGJlIHNx
dWFzaGVkIGludG8gcGF0Y2ggMS4NCj4+DQo+PiBObyBwcm9ibGVtLiBKdXN0IHRvIGV4cGxhaW4g
dGhhdCBJIHNwbGl0IHRob3NlIGNoYW5nZXMgaW50byBkaWZmZXJlbnQNCj4+IHBhdGNoZXMgYmVj
YXVzZSB0aGV5IHRvdWNoIGRpZmZlcmVudCBmaWxlcyBhbmQgZGlmZmVyZW50IGJvYXJkIGNvZGUu
DQo+PiBBbmQgSSB0aG91Z2h0IHRoYXQgZGlmZmVyZW50IHRoaW5ncyBzaG91bGQgYmUgaW4gZGlm
ZmVyZW50IHBhdGNoZXMuDQo+Pg0KPj4+PiAtLS0NCj4+Pj4gICAgYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy84NXh4L21wYzg1eHhfZHMuYyB8IDIgKy0NCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9hcmNo
L3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvbXBjODV4eF9kcy5jIGIvYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy84NXh4L21wYzg1eHhfZHMuYw0KPj4+PiBpbmRleCBmOGQyYzk3ZjM5YmQuLjlhNmQ2Mzdl
ZjU0YSAxMDA2NDQNCj4+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L21wYzg1
eHhfZHMuYw0KPj4+PiArKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvbXBjODV4eF9k
cy5jDQo+Pj4+IEBAIC01NCw3ICs1NCw3IEBAIHN0YXRpYyB2b2lkIG1wYzg1eHhfODI1OV9jYXNj
YWRlKHN0cnVjdCBpcnFfZGVzYyAqZGVzYykNCj4+Pj4gICAgfQ0KPj4+PiAgICAjZW5kaWYJLyog
Q09ORklHX1BQQ19JODI1OSAqLw0KPj4+PiAgICANCj4+Pj4gLXZvaWQgX19pbml0IG1wYzg1eHhf
ZHNfcGljX2luaXQodm9pZCkNCj4+Pj4gK3N0YXRpYyB2b2lkIF9faW5pdCBtcGM4NXh4X2RzX3Bp
Y19pbml0KHZvaWQpDQo+Pj4+ICAgIHsNCj4+Pj4gICAgCXN0cnVjdCBtcGljICptcGljOw0KPj4+
PiAgICAjaWZkZWYgQ09ORklHX1BQQ19JODI1OQ==
