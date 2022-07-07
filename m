Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8D8569EDB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 11:52:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdsCM4G42z3c5b
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 19:52:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=I1zTJIle;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.73; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=I1zTJIle;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120073.outbound.protection.outlook.com [40.107.12.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdsBZ4Dszz3by6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 19:51:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wzt7J/4OGq3PDNsDBukSyUAg8bluL1YViVedj9Y+kTX4/ItsPlZS00I4vYks60UFhuAxHSdebzbfYCRFB/thbv1Mk3q5hYcWnhgkWSUDIZPzDFKn9M4TG6pTfkC9s8gWng/F+9kOWP74bTvtigqFhDtf2DPDa3T6kcMoDkyvgNFw9776ztJ6ZbmAZ26IZbMys7VJhCKw+YklOYwK1MitHyCruV9I8OBFy6HMPAZiuVvPSSIYxgdyYmmshFZriEYNgVx8TFDyBVF7qA7jJeT8BDl+rKUE4lxgg5l77911plINmk8NMV8XiPOi4kHcKcHRvWGmiDn1rbySh3Mg8Mq69A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3p37faw3+teEoQmv3aRk92sHDtyqTlWE4f/OjFrPMxc=;
 b=kQpWj7HE7dWx0dp5kN3u7BylVaEn6RcaJS4rW4W5wcXWSEtOdEXNIvgm1PaHjcuvQmsBgtkBYlpTlYVZ4EvuURWqJZCHdKQ5Fy7GsN0jMBvE2CSXPt1GDrV1pMIff1XLUSo2f8XPRqZYg8eUtVA2Go4X/YxC1p2mL90XinsFuuH3o8ltD8kxBOC2QBxJTF61QrjtxVvUGdmRXrIQnUwW+eCEYUUCk12ZhWeLKX5mEnAG3D4D6ofql+PVK+RhRE9arMQXVKsJBkxoirHyhaqo7nKoYyWPD5KgvwxCIbDUiVp0tlGNaY7MAt1+N0QExZRpOljV13hdBrWDKtiaMSj5CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3p37faw3+teEoQmv3aRk92sHDtyqTlWE4f/OjFrPMxc=;
 b=I1zTJIleUOxnWrO9R4g7yJ6/8KKeOw+ic/f7cH9X9xi+tBoCQ3o6s8anjiLfDUqTBGJ6JZtITRXKmgy5JHdDfrU6oIfKbejMENAVkEFGDfySYPcdaIGUPJmHRQ+neH4y8F+FigjCHG+ATsfeBcOeyhnsfE7NLs8rPB3j+w9g6EeY6D5DX69Ou/ADpWTgfiFEM5A/JSiqOK4nAzdKVIDQswbYFvziLkr/ekAfrsqAL+YqOsSgD/xJxaIklmc8tZBO5ULC9TJD8oReF/sriSaSjKcWP/b1EpXmY42F28dg7GvDDCgtvn6ei3sUWgEj64iz3NgzZP6AQJ4k8Ggj1adiYw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1723.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 09:51:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 09:51:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Tyrel Datwyler
	<tyreld@linux.vnet.ibm.com>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Vaidyanathan Srinivasan
	<svaidy@linux.vnet.ibm.com>, Michael Bringmann <mwb@linux.vnet.ibm.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
Subject: Re: [PATCH] pseries/hotplug: Add more delay in pseries_cpu_die while
 waiting for rtas-stop
Thread-Topic: [PATCH] pseries/hotplug: Add more delay in pseries_cpu_die while
 waiting for rtas-stop
Thread-Index: AQHYkechX7KO5w2idEeXHGnGlTGL3g==
Date: Thu, 7 Jul 2022 09:51:29 +0000
Message-ID: <55906f6b-796a-ad0f-07d6-22ef3b4279ec@csgroup.eu>
References: <1544095908-2414-1-git-send-email-ego@linux.vnet.ibm.com>
In-Reply-To: <1544095908-2414-1-git-send-email-ego@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 848767df-3f54-40af-0282-08da5ffe4427
x-ms-traffictypediagnostic: PR0P264MB1723:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  VdoeQKCziXkN6daOBtWhLJufHTFdxZgI1Tjv30iBQVYdyvMcJHygaBf6vT6FjH4JFz4fkL8JVzTe0y0zL3rMvCcZa7Uqy5Kj7Ec/M0k7F+1ilJOQXcDgD3RX0ZKrdnDJP5BgM2/7+W3mS4t7MW79UbuMddVkXtGe4FedxYxawcNCcp4YKbn+95KvZ2C/AWLsbUvyBFGtgkQSrnXmCq075vJ2zqVcK8NYq4ovMcOmXL9n9K4bKSJLONT7H1w3D3bi5IRTjnFsE53lG+eodomviio4VDAE6AmeTQgZvww0JEQrnmaXGXuMBSte4wkGzOkVot4yYN52PdNuIYvuKZCa2fKQGJX00yzB7PPHp3BcVgmJ8dxdyiWFpfJFRwaKtXrJ6NZCAqX/iSkl4Yz/N3K8FzXWG4uvLdZ0Gnh3SlhgvicyIGAeDa1qxHz6ly/fAeUab4YcaXvzF5Y8i07DGatpYSgJq4N+n/c159SvN0DbSriSHbGViVY7GEYDq+J6d8ZCeZQIY9W6Q8Eys+2gRy1G40Z77E8dpdZp/n86pSxfyJGPr7tCIW5lHuS6oiUHLIaao1qh41iN2Xh/60TyJlXkSGTIvhh6juWhuF2ajFZrjEt/XTuomwNPZxj3XJdV4Al0KTUxLFHppjBzJhKeE92eLxO0X/k+hmRjV77TAcpA0l8dGniSDqZTmDeEb1BZDfLjnuvgbgeSy0EDOkyTSF45yqfQUcm9L9UjJEa442Ja0X3XtbK0YN3YBswNyXkQUNaBpDR0fynxVypyxLY2RUtIdBLqLgIe2kWzDJjnM7FJ/RTC2/zFl0WELRPPJBaaieQhJiwqu17TqKd85/J4UUUF4VROtCuBJ9yl0c9a6S+wV99VWN8EBvEVxQR957u607sf
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(6512007)(44832011)(66476007)(6486002)(66556008)(45080400002)(478600001)(71200400001)(41300700001)(316002)(110136005)(36756003)(31686004)(6506007)(66946007)(54906003)(76116006)(8676002)(31696002)(7416002)(64756008)(2616005)(2906002)(66446008)(26005)(5660300002)(4326008)(83380400001)(186003)(86362001)(66574015)(91956017)(38100700002)(122000001)(38070700005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RFVQVVhFd2tUeU5ZemJFVExHQTlyYXJzSkl4Z0lkYzYxTGdYNEFndWVqcUtt?=
 =?utf-8?B?V0tncmNOTmM3Z2ZzMlV0U3Z5ZG5iQjhmZTI3YjdmVmVKOEN3Q0xIU3YwNU9N?=
 =?utf-8?B?aE9YVTRlUkt3MHpWMk9DdEdOb0ZzRlBUY2NpNFFsZmFYWDZKVHNNelpHaFdo?=
 =?utf-8?B?ZkhCenlYaDlTbC85bW11clFFL0s3SGZqZW1TNy85bHdCMW9neU5CZ3hyTkhz?=
 =?utf-8?B?YVFUaWpNWEI1QkU0WGI5MjlNdE9lM0F2ZmgzcVVOcnNrSzVuKzVmdWRtZ0F2?=
 =?utf-8?B?UDZkMGNjTUo2T1ZCQzlMZnZlWVFHelo3T25UT0I1Wlk5YWQxd1R3dVg5ZTBE?=
 =?utf-8?B?VHZLM3V5NFBVSi9JNEZEU2g4U0ZESzJ0dUxKeDBuZDZXcEZ0QXdVa1JqczdR?=
 =?utf-8?B?dHk2UzFMYk1oSXg4elROQ0p2MWVrN29uQTVlVEw2aHJiWTZnNjliekM2bHp1?=
 =?utf-8?B?Tnpwc2EvNjV1Wkc3dWg0V2dYVzVlVFlYUjZ0RmFsdmFNb082RndXZFdBcHBk?=
 =?utf-8?B?MmlMWXRYSXAyL3B6d3lMWWRUR2ZJN0FSamhBYys3cXBBcHpkSGFvWnNuaGFu?=
 =?utf-8?B?Z1JiL1dvOXRDRWhLcldjdUhlUHRjTk9aRFJwWG5odkVFTTBmbUZvbUs3VUVE?=
 =?utf-8?B?dG5mY21ScTRoUExMbjBqNjdGZ2xSTWlmdUpqMGlDSlFYM1FvUHh4V1pJL05B?=
 =?utf-8?B?bFZPTlVncE10Vk0yUHB4ZW1pTjJFSk9LZWtaOURBT2l3emFSQkNYYXArR1dV?=
 =?utf-8?B?c2ttb01rc1ZVRWxFc2xtdVIrRUpXNmw2QnpoQnA0VjdFTS9VbHRSMDZJMmVZ?=
 =?utf-8?B?OGZMYk9FeHFPU2lvSEQ4cGdOSUdQUm9ud0JPN1MyVUJLMmNUVk85UFZHZXIx?=
 =?utf-8?B?akdNaDRFNmJKYWFqb3I3WmJoZHdKRjM1dVZJTWFIT0xUcDFKNStNRkVHUkNk?=
 =?utf-8?B?R3V1eFZyQmFiSW9tcXZWSVBWaW8yZDhTTVBKdUIxOXM5bWRUR3dhbVJ5SWYz?=
 =?utf-8?B?REQ3dEVoU2c3ejl1NklWVWVFNWthVnlPbnkwNU5YRndudWptU0NHaE5EL1lM?=
 =?utf-8?B?WlpCQ0VEZThSSTBYYnJlMm85MTdTang3Ny9ITytpOXgyOEpDSlJzMXd1L0RF?=
 =?utf-8?B?S29uRXdHVGlaSXJwVFo3VEFPTlFZRTNlZ1J0aUs2MzNUNCtEaDYvZ0lPdUZT?=
 =?utf-8?B?bkphVHpHTU40MFBtVHJlRWdHaFdQUHdsYjE5ckh0MlpKcGRxVW15QUpkbXMv?=
 =?utf-8?B?aUlTWlhLUXpLZ05tbCs0MDBwbkxyTnBwdGI4R0pNUHBIOG9DaEN5UlhOL0ZJ?=
 =?utf-8?B?Q3NYYmVFZE9VOEYzdm9FQmtqYmVtSjVWWjVremdIcVpEUWR2TVlFV1hGblBY?=
 =?utf-8?B?cUxCV3ZlaTBuaUlXYUpvTk5ZcHIwOVFmQjlNVVhKZktOL1VyMk1oVFZXeVI0?=
 =?utf-8?B?KzZISjBpeGxxLy9IaHZyM2pIMjVwU0VCU1NnbndRcGFXSlNUTkRLUjZmU2FW?=
 =?utf-8?B?bDFSNHlENFIzaitKN1RvSjVSenJHMlloVmNZTUNmVFkxc2kzQUJCNk8yYzdw?=
 =?utf-8?B?SmFtMWNKcUpJQkplb1FnTk1XYkxPSVRRLzZGdmlkK0xUcDczaXBUNFdhZWs3?=
 =?utf-8?B?SHhwbzVSYmRJMlpOT2FRY1NjTUxKbmFab3IzV3pESGRyNUtLeU4zVGdHcjRV?=
 =?utf-8?B?SkZESUpNNXcxbnVubFR4dStyVFp3MVJLVkYzSjAvdTZiZE13RmZ2UUg5OTZP?=
 =?utf-8?B?ZDZobjVWVGxha21kTTgrNHlySHBRUnUvUElDV3J4eFB4dEpwdTNMUjdCT1Vr?=
 =?utf-8?B?eHJVMVFraVJCdGZKK3ErNHBDWHdOc2ZrakpXQUljMVVZVWxaYk80ODZ4VGdQ?=
 =?utf-8?B?NTZrR1JYR1k4NVN1bTJWN2kvTitjUlV2ZTdZY3dBVEszYUFFdzg5VEY0ZFc0?=
 =?utf-8?B?eGkxbEZQWnZXNm16SFVtWVloUy9iSmU3ckZlZG10aEl6QytqaWN5KzVhMWxR?=
 =?utf-8?B?Z3NaZCsxT2NGeDdwT2xhNWZuUTlJVTdQU3dOamJvMUJRNFRxaGxYbTBZVm1s?=
 =?utf-8?B?OUZ6STlpajFHSmcxbk1CdFNmQVNxQVh0Q0gxa1NlSnVEOUdHRlBOV1lsT0RR?=
 =?utf-8?B?K2I3V0g5czlpeURlclJvbHU5Q3U5MnBQTUxOS29MR3ZaVzdLSGJJbmduL3FD?=
 =?utf-8?Q?VMJEEteYAdMXL4vh4U5pobs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E75BDA0547F6B40A12CCC929A69A7A6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 848767df-3f54-40af-0282-08da5ffe4427
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 09:51:29.5458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OQmlzZE6O4bEfcXVJFmJV97MLjG86GvVmrQHg9pIbbQ+bzLWHeVHxL22kG94mj3OI13hsek4+e/dFTVtDeQqPpafVs4wORzst1ptjAIsUZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1723
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

DQoNCkxlIDA2LzEyLzIwMTggw6AgMTI6MzEsIEdhdXRoYW0gUi4gU2hlbm95IGEgw6ljcml0wqA6
DQo+IEZyb206ICJHYXV0aGFtIFIuIFNoZW5veSIgPGVnb0BsaW51eC52bmV0LmlibS5jb20+DQo+
IA0KPiBDdXJyZW50bHkgcnVubmluZyBETFBBUiBvZmZsaW5lL29ubGluZSBvcGVyYXRpb25zIGlu
IGEgbG9vcCBvbiBhDQo+IFBPV0VSOSBzeXN0ZW0gd2l0aCBTTVQ9b2ZmIHJlc3VsdHMgaW4gdGhl
IGZvbGxvd2luZyBjcmFzaDoNCj4gDQo+IFsgIDIyMy4zMjEwMzJdIGNwdSAxMTIgKGh3aWQgMTEy
KSBSZWFkeSB0byBkaWUuLi4NCj4gWyAgMjIzLjM1NTk2M10gUXVlcnlpbmcgREVBRD8gY3B1IDEx
MyAoMTEzKSBzaG93cyAyDQo+IFsgIDIyMy4zNTYyMzNdIGNwdSAxMTQgKGh3aWQgMTE0KSBSZWFk
eSB0byBkaWUuLi4NCj4gWyAgMjIzLjM1NjIzNl0gY3B1IDExMyAoaHdpZCAxMTMpIFJlYWR5IHRv
IGRpZS4uLg0KPiBbICAyMjMuMzU2MjQxXSBCYWQga2VybmVsIHN0YWNrIHBvaW50ZXIgMWZhZjZj
YTAgYXQgMWZhZjZkNTANCj4gWyAgMjIzLjM1NjI0M10gT29wczogQmFkIGtlcm5lbCBzdGFjayBw
b2ludGVyLCBzaWc6IDYgWyMxXQ0KPiBbICAyMjMuMzU2MjQ0XSBMRSBTTVAgTlJfQ1BVUz0yMDQ4
IE5VTUEgcFNlcmllcw0KPiBbICAyMjMuMzU2MjQ3XSBNb2R1bGVzIGxpbmtlZCBpbjoNCj4gWyAg
MjIzLjM1NjI1NV0gQ1BVOiAxMTQgUElEOiAwIENvbW06IHN3YXBwZXIvMTE0IE5vdCB0YWludGVk
IDQuMjAuMC1yYzMgIzM5DQo+IFsgIDIyMy4zNTYyNThdIE5JUDogIDAwMDAwMDAwMWZhZjZkNTAg
TFI6IDAwMDAwMDAwMWZhZjZkNTAgQ1RSOiAwMDAwMDAwMDFlYzZkMDZjDQo+IFsgIDIyMy4zNTYy
NTldIFJFR1M6IGMwMDAwMDAwMWU1Y2JkMzAgVFJBUDogMDcwMCAgIE5vdCB0YWludGVkICAoNC4y
MC4wLXJjMykNCj4gWyAgMjIzLjM1NjI2MF0gTVNSOiAgODAwMDAwMDAwMDA4MTAwMCA8U0YsTUU+
ICBDUjogMjgwMDAwMDQgIFhFUjogMDAwMDAwMjANCj4gWyAgMjIzLjM1NjI2M10gQ0ZBUjogMDAw
MDAwMDAxZWM5ODU5MCBJUlFNQVNLOiA4MDAwMDAwMDAwMDA5MDMzDQo+ICAgICAgICAgICAgICAg
ICBHUFIwMDogMDAwMDAwMDAxZmFmNmQ1MCAwMDAwMDAwMDFmYWY2Y2EwIDAwMDAwMDAwMWVkMWM0
NDggMDAwMDAyNjdlNmEyNzNjMw0KPiAgICAgICAgICAgICAgICAgR1BSMDQ6IDAwMDAwMDAwMDAw
MDAwMDAgMDAwMDAwMDAwMDAwMDBlMCAwMDAwMDAwMDAwMDBkZmU4IDAwMDAwMDAwMWZhZjZkMzAN
Cj4gICAgICAgICAgICAgICAgIEdQUjA4OiAwMDAwMDAwMDFmYWY2ZDI4IDAwMDAwMjY3ZTZhMjcz
YzMgMDAwMDAwMDAxZWMxYjEwOCAwMDAwMDAwMDAwMDAwMDAwDQo+ICAgICAgICAgICAgICAgICBH
UFIxMjogMDAwMDAwMDAwMWI2ZDk5OCBjMDAwMDAwMDFlYjU1MDgwIGMwMDAwMDAzYTFiOGJmOTAg
MDAwMDAwMDAxZWVhM2Y0MA0KPiAgICAgICAgICAgICAgICAgR1BSMTY6IDAwMDAwMDAwMDAwMDAw
MDAgYzAwMDAwMDZmZGE4NTEwMCBjMDAwMDAwMDAwMDRjOGIwIGMwMDAwMDAwMDEzZDUzMDANCj4g
ICAgICAgICAgICAgICAgIEdQUjIwOiBjMDAwMDAwNmZkYTg1MzAwIDAwMDAwMDAwMDAwMDAwMDgg
YzAwMDAwMDAwMTlkMmNmOCBjMDAwMDAwMDAxM2Q2ODg4DQo+ICAgICAgICAgICAgICAgICBHUFIy
NDogMDAwMDAwMDAwMDAwMDA3MiBjMDAwMDAwMDAxM2Q2ODhjIDAwMDAwMDAwMDAwMDAwMDIgYzAw
MDAwMDAwMTNkNjg4Yw0KPiAgICAgICAgICAgICAgICAgR1BSMjg6IGMwMDAwMDAwMDE5Y2VjZjAg
MDAwMDAwMDAwMDAwMDM5MCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMWZhZjZjYTANCj4gWyAg
MjIzLjM1NjI4MV0gTklQIFswMDAwMDAwMDFmYWY2ZDUwXSAweDFmYWY2ZDUwDQo+IFsgIDIyMy4z
NTYyODFdIExSIFswMDAwMDAwMDFmYWY2ZDUwXSAweDFmYWY2ZDUwDQo+IFsgIDIyMy4zNTYyODJd
IENhbGwgVHJhY2U6DQo+IFsgIDIyMy4zNTYyODNdIEluc3RydWN0aW9uIGR1bXA6DQo+IFsgIDIy
My4zNTYyODVdIFhYWFhYWFhYIFhYWFhYWFhYIFhYWFhYWFhYIFhYWFhYWFhYIFhYWFhYWFhYIFhY
WFhYWFhYIFhYWFhYWFhYIFhYWFhYWFhYDQo+IFsgIDIyMy4zNTYyODZdIFhYWFhYWFhYIFhYWFhY
WFhYIFhYWFhYWFhYIFhYWFhYWFhYIFhYWFhYWFhYIFhYWFhYWFhYIFhYWFhYWFhYIFhYWFhYWFhY
DQo+IFsgIDIyMy4zNTYyOTBdIC0tLVsgZW5kIHRyYWNlIGY0NmE0ZTA0NmI1NjRkMWYgXS0tLQ0K
PiANCj4gVGhpcyBpcyBkdWUgdG8gbXVsdGlwbGUgb2ZmbGluZWQgQ1BVcyAoQ1BVIDExMyBhbmQg
Q1BVIDExNCBhYm92ZSkNCj4gY29uY3VycmVudGx5ICh3aXRoaW4gM3VzKSB0cnlpbmcgdG8gbWFr
ZSB0aGUgcnRhcy1jYWxsIHdpdGggdGhlDQo+ICJzdG9wLXNlbGYiIHRva2VuLCBzb21ldGhpbmcg
dGhhdCBpcyBwcm9oaWJpdGVkIGJ5IHRoZSBQQVBSLg0KPiANCj4gVGhlIGNvbmN1cnJlbnQgY2Fs
bHMgY2FuIGhhcHBlbiBhcyBmb2xsb3dzLg0KPiANCj4gICAgbyBJbiBkbHBhcl9vZmZsaW5lX2Nw
dSgpIHdlIHByb2QgYW4gb2ZmbGluZSBDUFUgWCAob2ZmbGluZSBkdWUgdG8NCj4gICAgICBTTVQ9
b2ZmKSBhbmQgbG9vcCBmb3IgMjUgdHJpZXMgaW4gcHNlcmllc19jcHVfZGllKCkgcXVlcnlpbmcg
aWYNCj4gICAgICB0aGUgdGFyZ2V0IENQVSBYIGhhcyBiZWVuIHN0b3BwZWQgaW4gUlRBUy4gQWZ0
ZXIgMjUgdHJpZXMsIHdlDQo+ICAgICAgcHJpbnRzIHRoZSBtZXNzYWdlICJRdWVyeWluZyBERUFE
PyBjcHUgWCAoWCkgc2hvd3MgMiIgYW5kIHJldHVybg0KPiAgICAgIHRvIGRscGFyX29mZmxpbmVf
Y3B1KCkuIE5vdGUgdGhhdCBhdCB0aGlzIHBvaW50IENQVSBYIGhhcyBub3QgeWV0DQo+ICAgICAg
Y2FsbGVkIHJ0YXMgd2l0aCB0aGUgInN0b3Atc2VsZiIgdG9rZW4sIGJ1dCBjYW4gZG8gc28gYW55
dGltZSBub3cuDQo+IA0KPiAgICBvIEJhY2sgaW4gZGxwYXJfb2ZmbGluZV9jcHUoKSwgd2UgcHJv
ZCB0aGUgbmV4dCBvZmZsaW5lIENQVSBZLiBDUFUgWQ0KPiAgICAgIHByb21wdGx5IHdha2VzIHVw
IGFuZCBjYWxscyBSVEFTIHdpdGggdGhlICJzdG9wLXNlbGYiIHRva2VuLg0KPiANCj4gICAgbyBC
ZWZvcmUgUlRBUyBjYW4gc3RvcCBDUFUgWSwgQ1BVIFggYWxzbyBjYWxscyBSVEFTIHdpdGggdGhl
DQo+ICAgICAgInN0b3Atc2VsZiIgdG9rZW4uDQo+IA0KPiBUaGUgcHJvYmxlbSBvY2N1cnMgZHVl
IHRvIHRoZSBzaG9ydCBudW1iZXIgb2YgdHJpZXMgKDI1KSBpbg0KPiBwc2VyaWVzX2NwdV9kaWUo
KSB3aGljaCBjb3ZlcnMgOTAlIG9mIHRoZSBjYXNlcy4gRm9yIHRoZSByZW1haW5pbmcgMTAlDQo+
IG9mIHRoZSBjYXNlcywgaXQgd2FzIG9ic2VydmVkIHRoYXQgd2Ugd291bGQgbmVlZCB0byBsb29w
IGZvciBhIGZldw0KPiBodW5kcmVkIGl0ZXJhdGlvbnMgYmVmb3JlIHRoZSB0YXJnZXQgQ1BVIGNh
bGxzIHJ0YXMgd2l0aCAic3RvcC1zZWxmIg0KPiB0b2tlbi5FeHBlcmltZW50cyBzaG93IHRoYXQg
ZWFjaCB0cnkgdGFrZXMgcm91Z2hseSB+MjV1cy4NCj4gDQo+IEluIHRoaXMgcGF0Y2ggd2UgZml4
IHRoZSBwcm9ibGVtIGJ5IGluY3JlYXNpbmcgdGhlIG51bWJlciBvZiB0cmllcw0KPiBmcm9tIDI1
IHRvIDQwMDAgKHdoaWNoIHJvdWdobHkgY29ycmVzcG9uZHMgdG8gMTAwbXMpIGJlZm9yZSBiYWls
aW5nDQo+IG91dCBhbmQgZGVjbGFyaW5nIHRoYXQgd2UgaGF2ZSBmYWlsZWQgdG8gb2JzZXJ2ZSB0
aGUgdGFyZ2V0IENQVSBjYWxsDQo+IHJ0YXMtc3RvcC1zZWxmLiBUaGlzIHByb3ZpZGVzIHN1ZmZp
Y2llbnQgc2VyaWFsaXphdGlvbiB0byBlbnN1cmUgdGhhdA0KPiB0aGVyZSBubyBjb25jdXJyZW50
IHJ0YXMgY2FsbHMgd2l0aCAic3RvcC1zZWxmIiB0b2tlbi4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBN
aWNoYWVsIEJyaW5nbWFubiA8bXdiQGxpbnV4LnZuZXQuaWJtLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogR2F1dGhhbSBSLiBTaGVub3kgPGVnb0BsaW51eC52bmV0LmlibS5jb20+DQoNClRoaXMgcGF0
Y2ggYmFkbHkgY29uZmxpY3RzIHdpdGggODAxOTgwZjY0OTc5IA0KKCJwb3dlcnBjL3BzZXJpZXMv
aG90cGx1Zy1jcHU6IHdhaXQgaW5kZWZpbml0ZWx5IGZvciB2Q1BVIGRlYXRoIikNCg0KSXMgaXQg
c3RpbGwgYXBwbGljYWJsZSA/IElmIHNvLCBwbGVhc2UgcmViYXNlIGFuZCByZXN1Ym1pdC4NCg0K
VGhhbmtzDQpDaHJpc3RvcGhlDQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9w
c2VyaWVzL2hvdHBsdWctY3B1LmMgfCAxMyArKysrKysrKysrKystDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvaG90cGx1Zy1jcHUuYyBiL2FyY2gvcG93ZXJw
Yy9wbGF0Zm9ybXMvcHNlcmllcy9ob3RwbHVnLWNwdS5jDQo+IGluZGV4IDJmOGU2MjEuLmM5MTNj
NDQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9ob3RwbHVn
LWNwdS5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9ob3RwbHVnLWNw
dS5jDQo+IEBAIC0yMTQsMTQgKzIxNCwyNSBAQCBzdGF0aWMgdm9pZCBwc2VyaWVzX2NwdV9kaWUo
dW5zaWduZWQgaW50IGNwdSkNCj4gICAJCQltc2xlZXAoMSk7DQo+ICAgCQl9DQo+ICAgCX0gZWxz
ZSBpZiAoZ2V0X3ByZWZlcnJlZF9vZmZsaW5lX3N0YXRlKGNwdSkgPT0gQ1BVX1NUQVRFX09GRkxJ
TkUpIHsNCj4gKwkJaW50IG1heF90cmllcyA9IDQwMDA7IC8qIFJvdWdobHkgY29ycmVzcG9uZHMg
dG8gMTAwbXMgKi8NCj4gKwkJdTY0IHRiX2JlZm9yZSA9IG1mdGIoKTsNCj4gICANCj4gLQkJZm9y
ICh0cmllcyA9IDA7IHRyaWVzIDwgMjU7IHRyaWVzKyspIHsNCj4gKwkJZm9yICh0cmllcyA9IDA7
IHRyaWVzIDwgbWF4X3RyaWVzOyB0cmllcysrKSB7DQo+ICAgCQkJY3B1X3N0YXR1cyA9IHNtcF9x
dWVyeV9jcHVfc3RvcHBlZChwY3B1KTsNCj4gICAJCQlpZiAoY3B1X3N0YXR1cyA9PSBRQ1NTX1NU
T1BQRUQgfHwNCj4gICAJCQkgICAgY3B1X3N0YXR1cyA9PSBRQ1NTX0hBUkRXQVJFX0VSUk9SKQ0K
PiAgIAkJCQlicmVhazsNCj4gICAJCQljcHVfcmVsYXgoKTsNCj4gICAJCX0NCj4gKw0KPiArCQlp
ZiAodHJpZXMgPT0gbWF4X3RyaWVzKSB7DQo+ICsJCQl1NjQgdGltZV9lbGFwc2VkX3VzID0gZGl2
X3U2NChtZnRiKCkgLSB0Yl9iZWZvcmUsDQo+ICsJCQkJCQkgICAgICB0Yl90aWNrc19wZXJfdXNl
Yyk7DQo+ICsNCj4gKwkJCXByX3dhcm4oIk9mZmxpbmVkIENQVSAlZCBpc24ndCBzdG9wcGVkIGJ5
IFJUQVMgYWZ0ZXIgJWxsdSB1c1xuIiwNCj4gKwkJCQljcHUsIHRpbWVfZWxhcHNlZF91cyk7DQo+
ICsJCQlXQVJOX09OKDEpOw0KPiArCQl9DQo+ICAgCX0NCj4gICANCj4gICAJaWYgKGNwdV9zdGF0
dXMgIT0gMCkgew==
