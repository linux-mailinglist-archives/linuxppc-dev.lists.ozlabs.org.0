Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B705A5F6D53
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 20:08:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjzvt55BJz3ds6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 05:08:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wcGNLkwG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.48; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wcGNLkwG;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120048.outbound.protection.outlook.com [40.107.12.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjztx40kxz3bnY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 05:07:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrOqgZTRO8P0klURLFD9EuUByAPVRQG8Q8l5ldvPR06tslsQuTdzjPXz7nuN/GHfH5fhX+KWgeEIm7GGsnRUOiTQnpaKL0foHDbZ1e0+IgX4sq3acReiwe8uEpT+4iRXTm7S7DZkJMFSoWp3M9q3H/2p1sfEJe6hmnAfGtqsNiDfrtlba03phOwabFehMxgXGAaZYA5YpoSRZHB4FSzevNLLVtChQPFhTCyzLK0QYGTovCq0smKugvxQ89D+aXxCJuuBsrdwdT5f6B3N1Oxm3WkNuUrvdRxF9fnjYqlVWT4t1ZRJp91tceQK9psVcaqOM8WCvcoIZnvUeowlvwpYaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyKyOoTFMqckCLJLA2wTF2PK29Me4/40q2fKtGqZ1SI=;
 b=lZKuJJjbhFiOMBsdvNFPMII6W9MMb8oWSJ1ZLgiXnzw2qb/CaZpYiOix6wzpVeZxIGn9xlXCWyJ1qB1aBwz102zp2TXo0eFnRQshhj593kXhfQDiSzOISjJv+AIOSATw3+Ft9bl8AfNyTg3R2ekmo8h2BwhmIapxFY4xZ/1JTmihdQUHOZssBE+aqmGS00t7BRjKAteV70W4i3LwXkI5osulPKYGJZc1u8obmHEUWM1SAq5Wj/deeSVYJJb1ceOvt3P0xpiVIjWNhKBg3Dg4nbz5XXen+ETcoUKfip77gyZGkIwXc/I5q9BtsP281i5+hGsFj0MqYkme1/KRGUguTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyKyOoTFMqckCLJLA2wTF2PK29Me4/40q2fKtGqZ1SI=;
 b=wcGNLkwGeuZ9p+GyvAemIetGzWuyj2XxNVEW1Okbt4fU8tzV3kDfRo2j5EPAaD/iQ4EMbotV6Dv9zc7pyZj3DVYyxvwaU6s9zh0pSz1p2HwZx07Lbonbs6SfPmb/Xu2f3cI75OPLcqyEiMzoI1blnPHU3iPhfFsbHiVri9M+xs8MF1FHKJ9uagsYPRAZXk/7cYspK6n2ICsZUfyegzAaY6KrNbRu13wSt0T/GvGXVmLfowNg5FLRyPO2UY1W4TuTp3BlRpHERNwOCSeId9lST3Wbs+qpqIebHgSe5bbp9vL6YmILNd7fXO8f0NWtjey0BA/yzYcUb8ekhXt6mV9vow==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB3456.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Thu, 6 Oct
 2022 18:07:32 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%5]) with mapi id 15.20.5676.036; Thu, 6 Oct 2022
 18:07:32 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/64s: POWER10 CPU Kconfig build option
Thread-Topic: [PATCH] powerpc/64s: POWER10 CPU Kconfig build option
Thread-Index: AQHYzvze6FBIhdsQoEmVA7xyGURQl63sga4AgAAKSACAFTMSAA==
Date: Thu, 6 Oct 2022 18:07:32 +0000
Message-ID: <33e5c5e7-a25f-36bf-e7a1-8d6849cd4715@csgroup.eu>
References: <20220923033004.536127-1-npiggin@gmail.com>
 <4141d141-54a8-0771-ea67-1e457e38f329@csgroup.eu>
 <CN3KCU5GOMF4.3T533MQ4U2SF0@bobo>
In-Reply-To: <CN3KCU5GOMF4.3T533MQ4U2SF0@bobo>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAYP264MB3456:EE_
x-ms-office365-filtering-correlation-id: 1ebe241f-53fe-4f43-6afb-08daa7c5a3fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  wAXFhcZo1j8IHnKYpSbqQ7faNTOHBwZpaTMIoXY76/ysuwyJYRb3ghhdI6imdxH+dstykDuis7D7niAYhqU0L/U7HP/NLBSRvMTcu0WxdYBgJLUlrYHQ6XPFp3lXVQNlQfkjj2qmYwZV181UMYs8BEPxO/27aLM2tPW/wZvRKGf8jWJCK2nwgWy7QJx3MYAE0KAP5ZPTmtj52VRDgX0FPJS7axSGONNjgLVvKAxC2Iv1Kp3XVN5kR1e0tee7FMLffLMN+m5pshliD27TUMLexoo41YiEb1E3Z541PhCwk85673x3tL32JK9KVtpSzLBv0pLzaeREtrF69nMubrSkHMI4MEtsxyIR/myFKwvStCW0rfBniMSl0FkEZSvR0qO3RzOLIG/D0vs89VHEgEUYzMDxFhjH8u+p6dMYu/zR4m+VLFUdEO3rNhtwTLxNmSLluWywN5ujdUgGcklwOR8u7p8yzS0lT/HgXm+DZ9eaDEkg1tNR45kUL3dtdTGanxYxnxc5xMsvcp/W6qs0JgzPysN5a3BtETs6UWQprWoYOFPzQFujPxLWXb7tD0DLjqE53HK3r235NosX+a/L5uIyEHlQ/LiI/wR7bsrJp+ir8MToa3vJX2XtfuNrSH+L3akA11jZaoU6dS9NLhfBqD2qXcRkEChMbfJ+ZfD9HHg/cDZOwNUtDDlZ/hanyoFJDlvYPo8m2WmE1qF+6tGSmV9MiXXixsK5AaBFzzZqqkA4RPu9MxmVpprJu2N12wETZCXox9LBl71abi772J7/lkwJMyzfKbqi+TLYLnEg6M2WHGPUjp2fTv3uubCvZTaNp+rRVy1A+4GY9P1+6ho7KqaKKw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199015)(66574015)(36756003)(316002)(2616005)(66476007)(6506007)(66556008)(66446008)(66946007)(186003)(64756008)(91956017)(5660300002)(26005)(2906002)(122000001)(8936002)(76116006)(38070700005)(31696002)(86362001)(44832011)(38100700002)(110136005)(83380400001)(41300700001)(6486002)(6512007)(31686004)(71200400001)(8676002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?R2ZZQmk4Z2NDMDZNOXE0MFFIYm1sTFd6TWRSSGJrSDRJOGg0MkhxRWNOYUN5?=
 =?utf-8?B?Qlpia3pqTzBwSTNmZlFwOXp5Z1FQYmpzZnM3QjB1LzlZWVRQKzlqUTdOR0hn?=
 =?utf-8?B?NXZMelBVQlRDb242TTBxYmJNamp3OGRBa0Z6OUtmTy9DMUpKbVU5eXJnVElt?=
 =?utf-8?B?MHc0NW5ZNjZpOUMwTW01QVdsTkxNd2NSVDMrOHlRVzRTWDBRM3V2N1pvRmxq?=
 =?utf-8?B?enpkKzE0cFVnNURjdUZEZWdTdDVab3RVSDZ2VGZPNkRDVmsvRUR0aHVZbThI?=
 =?utf-8?B?enVrdHVyS2hnb202YkFodHdoMFVoU25vVStPOERxZ1ptOHFzKzgvUHZ4VFow?=
 =?utf-8?B?TjQ4eEZrVlByU0VPUVRPZmRCM1dzL2JXL2Z3N1VRalZVam51TjhjTmdOeUtN?=
 =?utf-8?B?T3hzN2JXUnNrWi9GMjQ4STVYVG9Uc0VNVWRrT09iRHBwRVdOTFVQcE1pRWVv?=
 =?utf-8?B?S2ovVG1HcWFMaE5VbHNpa250cGx5MnZXV1lPbmYybUtkSFk3RVVYSkk1K080?=
 =?utf-8?B?SXpYKzVNb3J2eHhQcVAzeU8yN3JPaFI3bWs2UGtpRnZycXdSajlFaGNIdVFm?=
 =?utf-8?B?bkcrb2pacmxCdWIzeXBjc3RIUGpsV01lSmpJbnZEME83WTdVYWkxL1c2b3JW?=
 =?utf-8?B?emI2Q0orekMxeTJwWFQxUE9OQk1yaWxzZWU0bERWSXY1d2c0NWtrODZreDcv?=
 =?utf-8?B?OVY0ZE80VmcybVVFbFRnMXRqMHFZYWx3NFpsQ2ZaWWlNaVU1UTUyQmgzVisz?=
 =?utf-8?B?MmJGUHVQckJWakY3YzNZK1pjOFJaQUtYbVRVTVd2dUtKbUdheUl3RVpzZFh2?=
 =?utf-8?B?L0RLV3FWeEI1eE5qa2ZxR1RDY1BCdUhpeU15Snk2TXpSQTMvcWwvc2lkOFhs?=
 =?utf-8?B?RlFxSVUrUHhzdE9hVytvTDJnbWY0OGpHWFFBQzZOWEduN2lRK3BDbnlFL0o4?=
 =?utf-8?B?N2dZR21RTlJpby9rZzdaVnViS3pkNGk2Rk9mK0xMSVk3cWFLd0pQdTJ6c2to?=
 =?utf-8?B?Q0lIRFlIdXVQSWdZOFpGQWRZUHhYdEZCZXlMRzZTZmJkMWNGSHBkYy9QaGMr?=
 =?utf-8?B?WFlGUnZmLzdKdlhtZnFLM3h4MTk1S0crLzBBMTZHcUF0ckdjNENzNFNHVkNr?=
 =?utf-8?B?NUZjL0hYSlZuWXZJMWozY2NDVGhhWTRodERqZHlTeU1NdUlUbHZydFdITEFO?=
 =?utf-8?B?N3k2OVhnQ0hlcExhQXFURnpMQk0vcWc1WE82ZWd2U0hjME9mQzFyZ3gwWFR1?=
 =?utf-8?B?QjdPVit0eTgwNkMyNHZuWFdwUkR3cWpPMzhyWkQ2bXhwdVBhNnZvQ3BTZyt6?=
 =?utf-8?B?TGdpMlJSeVdQZGJVdEU0ZDZrdmxpUkNJa0dQYlVhN1VOSlVyK1QzWWlHZDlU?=
 =?utf-8?B?OE1RdlJHR0g4dnMyNXlTV1g4WU84TElhTnNHTG5wSzVMYndlNDI0cWNhN0F1?=
 =?utf-8?B?YllRYmtqS2E5WGxKVE5vdzBYUDlIK0NsRm5ZcGNEaTZHVlU5azhvMmZXNStw?=
 =?utf-8?B?QUJhSTh0WHJwcVJWK2JDdk5Kby9YUE1PV1BTWGxHOTlKSmY0bVc1eXBxSmdX?=
 =?utf-8?B?S3ptRmQ0b3dieFpJOFVualpCMEJFWHR4RytPdWtMdGxNNU1TVm5ZdzkrV1BJ?=
 =?utf-8?B?b2tuNk1XcDM3aWlIcTNSSHBKUmtzYmxlMURMUUFvdTdYRi9HRUkwN204eVZU?=
 =?utf-8?B?OTIwZXJyVkVoSTZoYUF0SjZzeldlZi82OGNGdjJQSmkyZkZMeUpackczbGhS?=
 =?utf-8?B?ZlpqYkViMlRFQjhiVVFzckdzTDhGeGtjSkc5Tlh5Z1ErZGUxWkRYcXlLYmxz?=
 =?utf-8?B?WHErNy82U285c1ptNThtMmJpMGVJSEpUblVRZEtMQVV3SEU2b0JQdSs2Z3V4?=
 =?utf-8?B?WWZVK3BYbnlaVE5DOWF1b0lzc0NMTldxVTh2TWZJUk1HejBJYUxvMG9CQmNN?=
 =?utf-8?B?Y2ZrdnRncjRIS3B1SDY0dmdybDE3ZENZejhOUjd0Rmt0S1pYT1o2WGtkY3gv?=
 =?utf-8?B?RU9qSTNFUWFCYllaaW42TG96cTBrZTFPcEx6OUNmaDlWSjNVclF1Q3Ircm5P?=
 =?utf-8?B?QTJmYjlJL05yNE8rS011bThSYzdOQlR4c3NtSkR3aTF4R3pBUkRmdld3eFpu?=
 =?utf-8?B?ODhKY0xDa3NMUHZDTmhiVUIwbkFBQ1dNV1R3MnR5R1lPd2dQbEwxc2VEU29t?=
 =?utf-8?Q?+oCVLy7CGLtz/8wcdUCAPBI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F588CD1053D884798F7A70EDCB5594F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ebe241f-53fe-4f43-6afb-08daa7c5a3fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2022 18:07:32.7527
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JfEiMovs2Nz3MZhwext0d85OeM2Mr1NF8THZ6TROcrfMPW2eAVU2jstkVaRmi3+GRz9njDRyuGsWRzg7Bcjin8GhN5sJvYJFLnrWPvC1tRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB3456
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

DQoNCkxlIDIzLzA5LzIwMjIgw6AgMDg6MjMsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBPbiBGcmkgU2VwIDIzLCAyMDIyIGF0IDM6NDYgUE0gQUVTVCwgQ2hyaXN0b3BoZSBMZXJveSB3
cm90ZToNCj4+DQo+Pg0KPj4gTGUgMjMvMDkvMjAyMiDDoCAwNTozMCwgTmljaG9sYXMgUGlnZ2lu
IGEgw6ljcml0wqA6DQo+Pj4gVGhpcyBhZGRzIGJhc2ljIFBPV0VSMTBfQ1BVIG9wdGlvbiwgd2hp
Y2ggYnVpbGRzIHdpdGggLW1jcHU9cG93ZXIxMC4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IE5p
Y2hvbGFzIFBpZ2dpbiA8bnBpZ2dpbkBnbWFpbC5jb20+DQo+Pj4gLS0tDQo+Pj4gVGhlcmUncyBx
dWl0ZSBhIGxvdCBvZiBhc20gYW5kIGxpbmtlciBjaGFuZ2VzIHNsYXRlZCBmb3IgdGhlIG5leHQg
bWVyZ2UNCj4+PiB3aW5kb3cgYWxyZWFkeSBzbyBJIG1heSBsZWF2ZSB0aGUgcGNyZWwgcGF0Y2gg
Zm9yIG5leHQgdGltZS4gSSB0aGluayB3ZQ0KPj4+IGNhbiBhZGQgdGhlIGJhc2ljIFBPV0VSMTAg
YnVpbGQgb3B0aW9uIHRob3VnaC4NCj4+Pg0KPj4+IFRoYW5rcywNCj4+PiBOaWNrDQo+Pj4NCj4+
PiAgICBhcmNoL3Bvd2VycGMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8IDcgKysrKysrLQ0K
Pj4+ICAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvS2NvbmZpZy5jcHV0eXBlIHwgOCArKysrKysr
LQ0KPj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvTWFrZWZpbGUgYi9hcmNoL3Bv
d2VycGMvTWFrZWZpbGUNCj4+PiBpbmRleCA4YTNkNjliMDI2NzIuLmVhODhhZjI2ZjhjNiAxMDA2
NDQNCj4+PiAtLS0gYS9hcmNoL3Bvd2VycGMvTWFrZWZpbGUNCj4+PiArKysgYi9hcmNoL3Bvd2Vy
cGMvTWFrZWZpbGUNCj4+PiBAQCAtMTkyLDkgKzE5MiwxNCBAQCBpZmRlZiBDT05GSUdfNDc2RlBF
X0VSUjQ2DQo+Pj4gICAgCQktVCAkKHNyY3RyZWUpL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvNDR4
L3BwYzQ3Nl9tb2R1bGVzLmxkcw0KPj4+ICAgIGVuZGlmDQo+Pj4gICAgDQo+Pj4gLSMgTm8gQWx0
aVZlYyBvciBWU1ggaW5zdHJ1Y3Rpb25zIHdoZW4gYnVpbGRpbmcga2VybmVsDQo+Pj4gKyMgTm8g
cHJlZml4IG9yIHBjcmVsDQo+Pj4gK0tCVUlMRF9DRkxBR1MgKz0gJChjYWxsIGNjLW9wdGlvbiwt
bW5vLXByZWZpeGVkKQ0KPj4NCj4+IFdlIGhhdmUgbG90cyBvZiBjb2RlIHRvIGhhbmRsZSBwcmVm
aXhlZCBpbnN0cnVjdGlvbnMgaW4gY29kZV9wYXRjaGluZywNCj4+IGFuZCB0aGF0IGNvZGUgY29t
cGxleGlmaWVzIHN0dWZmIGFuZCBoYXMgYSBwZXJmb3JtYW5jZSBpbXBhY3QuDQo+PiBBbmQgaXQg
aXMgb25seSBwYXJ0aWFsbHkgdGFrZW4gaW50byBhY2NvdW50LCBhcmVhcyBsaWtlIGZ0cmFjZSBk
b24ndA0KPj4gcHJvcGVybHkgdGFrZSBjYXJlIG9mIHByZWZpeGVkIGluc3RydWN0aW9ucy4NCj4+
DQo+PiBTaG91bGQgd2UgZ2V0IHJpZCBvZiBwcmVmaXhlZCBpbnN0cnVjdGlvbiBzdXBwb3J0IGNv
bXBsZXRlbHkgaW4gdGhlDQo+PiBrZXJuZWwsIGFuZCBjb21lIGJhY2sgdG8gbW9yZSBzaW1wbGUg
Y29kZSA/DQo+IA0KPiBJIHdvdWxkIHJhdGhlciBjb21wbGV0ZSBwcmVmaXhlZCBzdXBwb3J0IGlu
IHRoZSBrZXJuZWwgYW5kIHVzZSBwY3JlbA0KPiBhZGRyZXNzaW5nLiBBY3R1YWxseSBldmVuIGlm
IHdlIGRvbid0IGNvbXBpbGUgd2l0aCBwY3JlbCBvciBwcmVmaXhlZCwNCj4gdGhlcmUgYXJlIHNv
bWUgaW5zdHJ1Y3Rpb25zIGFuZCB3ZSB3aWxsIHByb2JhYmx5IGdldCBtb3JlIHRoYXQgcmVxdWly
ZQ0KPiBwcmVmaXhlZCwgcG9zc2libGUgd2UgbWlnaHQgd2FudCB0byB1c2UgdGhlbSBpbiBrZXJu
ZWwuIFNvbWUgb2YgaXQgaXMNCj4gcmVxdWlyZWQgdG8gaGFuZGxlIHVzZXIgbW9kZSBpbnN0cnVj
dGlvbnMgdG9vLiBTbyBJIHRoaW5rIHJlbW92aW5nDQo+IGl0IGlzIHByZW1hdHVyZSwgYnV0IEkg
Z3Vlc3MgaXQncyB1cCBmb3IgZGViYXRlLg0KDQpXZWxsIG9rLCBpbiBmYWN0IEkgb25seSBoYWQg
Y29kZV9wYXRjaGluZyBpbiBtaW5kLg0KDQpDb2RlIHBhdGNoaW5nIGlzIG9ubHkgZm9yIGtlcm5l
bCB0ZXh0LiBUb2RheSBjb2RlIHBhdGNoaW5nIGlzIHVzZWQgZm9yIA0KdGhpbmdzIGxpa2Uga3By
b2JlLCBmdHJhY2UsIGV0YyAuLi4uIHdoaWNoIHJlYWxseSBkbyBub3Qgc2VlbXMgdG8gYmUgDQpw
cmVwYXJlZCBmb3IgcHJlZml4ZWQgaW5zdHJ1Y3Rpb25zLg0KDQpJZiB5b3UgYXJlIGFkZGluZyAt
bW5vLXByZWZpeGVkLCBpdCBpcyB3b3J0aCBrZWVwaW5nIHRoYXQgY29kZSB3aGljaCANCnNvbWV0
aW1lcyBnaXZlcyB1cyBzb21lIGhlYWRhY2tlID8NCg0KT2YgY291cnNlIGlmIHRoZXJlIGFyZSBw
bGFucyB0byBnZXQgcmVhbCBwcmVmaXhlZCBpbnN0cnVjdGlvbiBpbiBrZXJuZWwgDQpjb2RlIGFu
eXRpbWUgc29vbiwgbGV0cyBsaXZlIHdpdGggaXQsIGluIHRoYXQgY2FzZSB0aGUgc3VwcG9ydCBz
aG91bGQgDQpnZXQgY29tcGxldGVkLiBCdXQgb3RoZXJ3aXNlIEkgdGhpbmsgaXQgd291bGQgYmUg
YmV0dGVyIHRvIGdldCByaWQgb2YgaXQgDQpmb3Igbm93LCBhbmQgaW1wbGVtZW50IGl0IGNvbXBs
ZXRlbHkgd2hlbiB3ZSBuZWVkIGl0IGluIHllYXJzLg0KDQpXaGVuIEkgc2VlIHRoZSBmb2xsb3dp
bmcsIEknbSBoYXZpbmcgaGFyZCB0aW1lIGJlbGlldmluZyBpdCB3b3VsZCB3b3JrIA0Kd2l0aCBw
cmVmaXhlZCBpbnN0cnVjdGlvbnMgaW4gdGhlIGtlcm5lbCB0ZXh0Og0KDQoJdHlwZWRlZiB1MzIg
a3Byb2JlX29wY29kZV90Ow0KDQoJc3RydWN0IGtwcm9iZSB7DQoJLi4uDQoJCS8qIFNhdmVkIG9w
Y29kZSAod2hpY2ggaGFzIGJlZW4gcmVwbGFjZWQgd2l0aCBicmVha3BvaW50KSAqLw0KCQlrcHJv
YmVfb3Bjb2RlX3Qgb3Bjb2RlOw0KDQoNCgl2b2lkIGFyY2hfZGlzYXJtX2twcm9iZShzdHJ1Y3Qg
a3Byb2JlICpwKQ0KCXsNCgkJV0FSTl9PTl9PTkNFKHBhdGNoX2luc3RydWN0aW9uKHAtPmFkZHIs
IHBwY19pbnN0KHAtPm9wY29kZSkpKTsNCgl9DQoNCg0KQ2hyaXN0b3BoZQ==
