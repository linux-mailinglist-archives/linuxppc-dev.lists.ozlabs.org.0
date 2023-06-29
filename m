Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A126A74201F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 07:57:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=OurHZQ8V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qs75j48W3z3bfp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 15:57:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=OurHZQ8V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::625; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qs74p2vyrz30PX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 15:56:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtizVpcADhGDxOaqNln/IRSaCkJrDBUEaHKBXnL+/IpRxQBgKxyJg7dhdb7WGGXITd8FMIJtYmgyr442L2hMj3ZS0XCV9o4LEphIlq0KAyKFhPX0xURCt8WFN/Euy124FKJ67cSY+3ZzlGUkfE86b9QiFrjD4uaRlJNtxQTYYCKbuppc1kuo+PCJubCHk8CIBkkP2p0B6RfolRUKVu6FlmIrhm5oXyWmcmSCbVzCSu0VTsD/P/WrGOoQRLdP1vsiiQVl5oXmS4zeOsOeM5N084lZcaOyCosH0zQSgQfSkcFbEux7u0tjriqbrVcMLm1m7p4MMN8m+OK7u1+4osiSyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlAe+p2ISUlHkjV0vd1/Hoz+MUJXB2eT1HGleWj8+cc=;
 b=GSifEBxmarEGIcBno0Oyyi876uJGu9udiRdvJwA8Q5k9JsgC4ACR0QSViq1DWLs3kVfF+e8wBgp2yrN7Q5PiM8PjeDEp4NZ8nwfpiXYl7Ew/deU+FMxnGwkx0IxKhDI8Wto2L2Vjxk8YL3FW7euHTuH3MFZFzIBpdA0txKemNYlHwsGE9vJTqQiVVFbOXLnfrSajC7LRCZK77xm4N4T1YxfdQDUSMpRCM+J2JjZI8q2XtTDlffRIN6FrZgDcoZRqodb2M9SXO16Yiusk5tlbYHsLo3ev9KS3HKnE4xE7Kmi9u/3RPpKzlPRcFn53u1+dftLVqi8t/BTXcu/B2gjpNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlAe+p2ISUlHkjV0vd1/Hoz+MUJXB2eT1HGleWj8+cc=;
 b=OurHZQ8VyNLJv7yRx8cpWipnZBHUyRD/yqu4DCPV6cTUbGZg6Gyv+gon/fhGn+CMfKwNzlM/F97JH48lBIt8SbgJN9OVEIg/H0v0vYi8nvXXsLrTpZMWEjlLqO+jupyX7t7J/ch8CmztxUdEykI/PYtteGFtCsyhasWbZgfjdcncFXgh8h0h9qjwUM48hEQTvQ8EOWz2zuZhJDQpiDVzl99a6BlM4h6xpCKpUmsf1uH0Ii1IqkT0he5VRFY8zt/MoCS6JkmArYHUuWIJji2jQoE7jJeLPNjasoVi0U3sQgWXED168JrmJVLbudChl/UZY4wxGJpD7xA2K7JOyamUGQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1729.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 05:56:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 05:56:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Leo Li <leoyang.li@nxp.com>, Ma Ke <make_ruc2021@163.com>
Subject: Re: [PATCH] usb: gadget: fsl_qe_udc: validate endpoint index for ch9
 udc
Thread-Topic: [PATCH] usb: gadget: fsl_qe_udc: validate endpoint index for ch9
 udc
Thread-Index: AQHZqbkQaP4TFYaOrEeUc/nFP4wqCq+gcZ4AgAArl4CAABkmgIAAkxkA
Date: Thu, 29 Jun 2023 05:56:30 +0000
Message-ID: <7975b5bf-c8e0-237e-d6f4-98e641d39959@csgroup.eu>
References: <20230628081511.186850-1-make_ruc2021@163.com>
 <AM0PR04MB62893E77D085030A6E2C37B28F24A@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <f321287d-8156-b805-26fd-58acfa26e324@csgroup.eu>
 <AM0PR04MB628929736762F5DF46C55D708F24A@AM0PR04MB6289.eurprd04.prod.outlook.com>
In-Reply-To:  <AM0PR04MB628929736762F5DF46C55D708F24A@AM0PR04MB6289.eurprd04.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1729:EE_
x-ms-office365-filtering-correlation-id: 3582451e-c0c0-4232-d0ab-08db78659628
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  XEgE/RtZ+mkn0KjxIQR55Jp+v0A8O9Re/nAJP5d5so3UiRrmbxzPjehl922pYEuQXOxMVSRuPGAFGy82e13EHQUpdWKi/a2OMAwjNuyc1vpOaYaWxfDefoMUH+9PXYGkvF4KCesZNx+1alIheuwoDc4pVpjw/7g3R4YwJZMsrMd4GrvmYvXNBK4+lRPO0tDxJl3X2Jd5kbFdXW44KhDpScpCicY8I+5cHsKp2zCSJUskxJktTwW216uwH9Ar6yvKc7e4XTHyfPJv0UI3OGyfeG5Ur0H0GzzZw0EH291S8ILedTkp+4UMkO0vARbTVP7EVPFyN092FA6KsCc4lDjFg5JIEteNA+7gDBqfDr/5Hb22qfeCT6Bi5dI4rqRqUzSmJYzdyWrHa06odZ0tI10jbh4vU20bJgODkywyovGTaF/q5EvEWxUmsWfgKbsWOnio7Pi5jOnzFjaYXegt1SKvL6cWrx0UVHH/xZXDe19NutlpqMo0sZYFP8IcqruywH8e3+LmDIqgltK90orKpctfF/T8hUVHLBkQRpaTXti8IjkAIxPQjCpG/B/N/i733zlIKdiB/kIIbZLiFLGNRib5Ow6AWlAtpl2j03mGRE2ddVHrRV7SKk7DMZX/ozFnTUTXkHBsktZ5dDl3wKY0DAMQ3pjoZIIYPq03HAddKQ3li+2yFTQsoVu8Iv+G7bkF6OjQ
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(346002)(39850400004)(451199021)(6506007)(110136005)(6486002)(2616005)(83380400001)(122000001)(38100700002)(66574015)(186003)(71200400001)(53546011)(26005)(31696002)(41300700001)(86362001)(54906003)(2906002)(316002)(4326008)(8936002)(64756008)(66556008)(66946007)(66446008)(76116006)(66476007)(91956017)(36756003)(6512007)(5660300002)(31686004)(8676002)(44832011)(478600001)(38070700005)(15650500001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RzRxT0QyVSt1bTdKZFU1eTJpcU1mSUdWMFhkNnVGM1FEYUZZNktrUUlqanUx?=
 =?utf-8?B?UFNma0ZLaFllTHBOL3phWEZOSWpHOEVQbVAxelJVZnV4MWFUTy9LbFp4S3JF?=
 =?utf-8?B?WmJpOUJKS2pmMUYxSldFc3czaERxdWtYaUh1TzJNSFZ1bml1anpFQkFTNHpN?=
 =?utf-8?B?QUQvOVE1OCtlRHJRYVBGN1VIMk1oRkg5Q2YyQlAwR1UxZzRtamRSaC9aUE8y?=
 =?utf-8?B?c1kybkdpRGpTZzFVa2FHa1NaclV3Z0N2bmkycVl3cDFRRC93N2tOTzZHaE54?=
 =?utf-8?B?eDNIVkhDVDQvUlJkQ3N1dEQzck54NjVzM3RPRFNTeUg2emZvNzRFYlhnNmFV?=
 =?utf-8?B?M0xmZUlhUDZPSlM1RWsvVnUwUU5JMldRaWFZdldsZFhWM1VLMzNNVnJsQWYz?=
 =?utf-8?B?RGxXYjRtSFNIeU0vRi9NOFFaNmZsa09tb0JIcVlTR2l6TnV1SkErM3QzTGI2?=
 =?utf-8?B?bVc2R0NNNzVpUlZvQ1E3RFpnSTk3VGEzNUIyK2UxNEpaOHhTREZ0dFlLMHpp?=
 =?utf-8?B?OEVtWlZ4djFWcnZCM1dmRDZxcUZiVGFMYmF0V2JFRjJzTUhmd0FIVVFLdjN2?=
 =?utf-8?B?bmhGMkIybWtFVXJoYzRUNmQvaUFCTCtSc3BXZERTYWlPRmJCSWRDU1FhN3hF?=
 =?utf-8?B?ci9uK090dDRsQmJJU2dpVnVUR25iZ0U3dm9vTTkrTkZlRjRxV2lXUFZhazhD?=
 =?utf-8?B?Vkd1QWRhTkFFaGNwMXRkSkt0d2RPZHBvM21CMjNwNTk3QkZUSnc5UGhJeE1Z?=
 =?utf-8?B?NDRkSkRiZmdiSzZvUE50VnR5RWNzazhZVzNkTkJWOFp5NDk0N1FBenlRRlBq?=
 =?utf-8?B?eWpNQlE1d0ZtSGwzTFVhWGlvTzBFU2luL2kzT0dJUjRuRWZwR1lYSmJsbCsy?=
 =?utf-8?B?b1VVT05TUytJQkUvbDk0K3JlMzA4cGlUemtnbk0zZDI0SG1iU0hxNGFkNU5D?=
 =?utf-8?B?cXlaS2tldm5GbFhuVzVVQVlXYlZRQmhDRWRnK2FBc3ErSlcxSGlzazhNMi96?=
 =?utf-8?B?M2hhTFZtcklXRTBSWm5iYktIOTlNdHFkV3ZLenNvQnNLMDdydVRya0VzMjV6?=
 =?utf-8?B?eGV1REJqNm9PcGlHNmdXdHpxQkpTcXZyRU5NRVhDMk0xQytaaXNoYUsyT0Na?=
 =?utf-8?B?TGdDWXZLclhsc2N4bGhOa0swUjhZeFpEbkRZZGFaQ0ZNdExWZGxNUzluWTR1?=
 =?utf-8?B?OFRSaFBmeC9GcGRYR255ajJoWkhKcXV3OXE0ME4vTVhJekNRUVdhV084UTgx?=
 =?utf-8?B?dGhsUnVFNzZDOGJjVDRIRzVqNlVmMW9IUEFvZkJlZVVkNXlnOTFzVWlJWUJn?=
 =?utf-8?B?NjMvd0FGS3pXb3I1MTZBZm9BeGltQWE2d2diaW5XK3dtYVR5aHVPd2lOV2VL?=
 =?utf-8?B?Y3drUUx0Y09veGprYVg1U3lBSXNIbXhLOFptZzNZM24xNTdPMTg5ZmdiMkta?=
 =?utf-8?B?OXFLcjgwcTRaYnZLR1Fvd1AvaXgzREpyekd0MFhQTE1qTm5RUGJHUkoxZFVN?=
 =?utf-8?B?d3hDc2JQN2t1R3lXc1NSZE1xYTJ3bEtYSEd0VVlFY21NZHB0aVQzUjFtZGMv?=
 =?utf-8?B?SEQxREFnOXZMV2N0UnRCcWM0NDIvQkxjcUVlaVhHcVhJb3ZsZUhNOXNrM0xN?=
 =?utf-8?B?VjJTWnh0VFNrSk9SQWNXQ2ZtUzl5N0xLRFkrNmJJbENiK1lNVGNBQ096Rm5Z?=
 =?utf-8?B?R2drVGszaUxWY0FsQUwxaEJzNXpOU3RlcnkrTjZINEdpSzZqNkFSR2k2Z1RH?=
 =?utf-8?B?T0Z1THNkblc4cWVQdDRJWmxaSkVaL3dFN083emIzcmphTkl2OUczQ0Y3b0dn?=
 =?utf-8?B?K0hNcFVzZkpFR2Z5SkVBQ0cwZFd1ZTZYL0FSQmFIUWtsNFcrQTc5cnZ4bllZ?=
 =?utf-8?B?SWFHRThHeDErVDduSlBjMWdmNVhMOVY1Sk0xZnpsa0tKK2RSK0pkZTFPaHli?=
 =?utf-8?B?YnhBdktzVjIrWFVtd2s1bzZMTEUrUzRKWmt5d2JiaTA0Y1BYdnh2WkRTRmd3?=
 =?utf-8?B?UE0xSmJKZ0pCdTVwYjVOTVByVm5FbmdnY2xHSGh0ajBMZE96SlI5QUtvL1NW?=
 =?utf-8?B?NzMwYUdmRE5QUHZHN1VwQ3hobkFmUnZvcWl1R2Nyc0dSRkNVWFNzRzMyd0pp?=
 =?utf-8?Q?oNMlW+v0jt/Zl+2KVCHj1bLvQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6FC47F3014D7D48B85B7709312A371C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3582451e-c0c0-4232-d0ab-08db78659628
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 05:56:30.8817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 90w/A23P5Umsi4rcOPsRPOp4IxpgK0cbgteIL2tU/wXUJXqPzTgMg3T8jkGIjKQL2uk/TX6QhKgVYfmVp3ZPgoHz9y4JnAHGxHomBI8gJ40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1729
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzA2LzIwMjMgw6AgMjM6MTAsIExlbyBMaSBhIMOpY3JpdMKgOg0KPiANCj4gDQo+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDI4
LCAyMDIzIDI6NDAgUE0NCj4+IFRvOiBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IE1hIEtl
IDxtYWtlX3J1YzIwMjFAMTYzLmNvbT4NCj4+IENjOiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
ZzsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgbGludXhwcGMtDQo+PiBkZXZAbGlzdHMub3ps
YWJzLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPj4gU3ViamVjdDogUmU6IFtQ
QVRDSF0gdXNiOiBnYWRnZXQ6IGZzbF9xZV91ZGM6IHZhbGlkYXRlIGVuZHBvaW50IGluZGV4IGZv
cg0KPj4gY2g5IHVkYw0KPj4NCj4+DQo+Pg0KPj4gTGUgMjgvMDYvMjAyMyDDoCAxOTowNCwgTGVv
IExpIGEgw6ljcml0wqA6DQo+Pj4NCj4+Pg0KPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPj4+PiBGcm9tOiBNYSBLZSA8bWFrZV9ydWMyMDIxQDE2My5jb20+DQo+Pj4+IFNlbnQ6IFdl
ZG5lc2RheSwgSnVuZSAyOCwgMjAyMyAzOjE1IEFNDQo+Pj4+IFRvOiBMZW8gTGkgPGxlb3lhbmcu
bGlAbnhwLmNvbT4NCj4+Pj4gQ2M6IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBsaW51eC11
c2JAdmdlci5rZXJuZWwub3JnOyBsaW51eHBwYy0NCj4+Pj4gZGV2QGxpc3RzLm96bGFicy5vcmc7
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IE1hIEtlDQo+Pj4+IDxtYWtlX3J1YzIwMjFA
MTYzLmNvbT4NCj4+Pj4gU3ViamVjdDogW1BBVENIXSB1c2I6IGdhZGdldDogZnNsX3FlX3VkYzog
dmFsaWRhdGUgZW5kcG9pbnQgaW5kZXggZm9yDQo+Pj4+IGNoOSB1ZGMNCj4+Pj4NCj4+Pj4gV2Ug
c2hvdWxkIHZlcmlmeSB0aGUgYm91bmQgb2YgdGhlIGFycmF5IHRvIGFzc3VyZSB0aGF0IGhvc3Qg
bWF5IG5vdA0KPj4+PiBtYW5pcHVsYXRlIHRoZSBpbmRleCB0byBwb2ludCBwYXN0IGVuZHBvaW50
IGFycmF5Lg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBNYSBLZSA8bWFrZV9ydWMyMDIxQDE2
My5jb20+DQo+Pj4+IC0tLQ0KPj4+PiAgICBkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2ZzbF9xZV91
ZGMuYyB8IDIgKysNCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPj4+
Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9mc2xfcWVfdWRjLmMN
Cj4+Pj4gYi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2ZzbF9xZV91ZGMuYw0KPj4+PiBpbmRleCAz
YjFjYzhmYTMwYzguLmY0ZTVjYmQxOTNiNyAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy91c2Iv
Z2FkZ2V0L3VkYy9mc2xfcWVfdWRjLmMNCj4+Pj4gKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L3Vk
Yy9mc2xfcWVfdWRjLmMNCj4+Pj4gQEAgLTE5NTksNiArMTk1OSw4IEBAIHN0YXRpYyB2b2lkIGNo
OWdldHN0YXR1cyhzdHJ1Y3QgcWVfdWRjICp1ZGMsIHU4DQo+Pj4+IHJlcXVlc3RfdHlwZSwgdTE2
IHZhbHVlLA0KPj4+PiAgICAJfSBlbHNlIGlmICgocmVxdWVzdF90eXBlICYgVVNCX1JFQ0lQX01B
U0spID09DQo+Pj4+IFVTQl9SRUNJUF9FTkRQT0lOVCkgew0KPj4+PiAgICAJCS8qIEdldCBlbmRw
b2ludCBzdGF0dXMgKi8NCj4+Pj4gICAgCQlpbnQgcGlwZSA9IGluZGV4ICYgVVNCX0VORFBPSU5U
X05VTUJFUl9NQVNLOw0KPj4+PiArCQlpZiAocGlwZSA+PSBVU0JfTUFYX0VORFBPSU5UUykNCj4+
Pj4gKwkJCWdvdG8gc3RhbGw7DQo+Pj4NCj4+PiBUaGFua3MuICBUaGlzIHNlZW1zIHRvIGJlIHRo
ZSByaWdodCB0aGluZyB0byBkby4gIEJ1dCBub3JtYWxseSB3ZSBkb24ndCBtaXgNCj4+IGRlY2xh
cmF0aW9ucyB3aXRoIGNvZGUgd2l0aGluIGEgY29kZSBibG9jay4gIENvdWxkIHdlIHJlLWFycmFu
Z2UgdGhlIGNvZGUgYQ0KPj4gbGl0dGxlIGJpdCBzbyBkZWNsYXJhdGlvbnMgc3RheSBvbiB0b3A/
DQo+Pg0KPj4gQnV0IHdlIGFyZSBhdCB0aGUgc3RhcnQgb2YgYSBjb2RlIGJsb2NrIGFyZW4ndCB3
ZSA/DQo+IA0KPiBCdXQgdGhleSB3ZXJlIGF0IHRoZSBiZWdpbm5pbmcgb2YgYSB7IH0gYmxvY2sg
d2hpY2ggaXMgY29tcGxpYW50IHdpdGggdGhlIEM4OSBzdGFuZGFyZC4gIEkga25vdyBnY2MgaXMg
bW9yZSByZWxheGVkIGZyb20gdGhpcy4gIEJ1dCBpdCBpcyBwcm9iYWJseSBzdGlsbCBnb29kIHRv
IHN0aWNrIHRvIHRoZSBzdGFuZGFyZD8NCg0KU29ycnkgSSBtaXNyZWFkIHRoZSBwYXRjaCBhbmQg
ZmFpbGVkIHRvIHNlZSB0aGF0IHRoZSBkZWNsYXJhdGlvbiBibG9jayANCndhcyBjb250aW51aW5n
IGFmdGVyIHRoZSBjaGFuZ2UuDQoNClNvIHllcyBkb24ndCBpbnRlcmxlYXZlIGNvZGUgd2l0aCBk
ZWNsYXJhdGlvbnMuIExlYXZlIGRlY2xhcmF0aW9uIGF0IHRoZSANCnRvcCBvZiBhIGJsb2NrIHdp
dGggYSBibGFuayBsaW5lIGJldHdlZW4gZGVjbGFyYXRpb25zIGFuZCBjb2RlLg0KDQo+IA0KPj4N
Cj4+IFRoZSBvbmx5IG1pc3NpbmcgdGhpbmcgaXMgdGhlIGJsYW5rIGxpbmUgYmV0d2VlbiB0aGUg
ZGVjbGFyYXRpb25zIGFuZCB0aGUNCj4+IGNvZGUsIHNvIHRoYXQgd2UgY2xlYXJseSBzZWUgd2hl
cmUgZGVjbGFyYXRpb25zIGVuZCBhbmQgd2hlcmUgY29kZSBzdGFydC4NCj4+DQo+Pj4NCj4+Pj4g
ICAgCQlzdHJ1Y3QgcWVfZXAgKnRhcmdldF9lcCA9ICZ1ZGMtPmVwc1twaXBlXTsNCj4+Pj4gICAg
CQl1MTYgdXNlcDsNCj4+Pj4NCj4+Pj4gLS0NCj4+Pj4gMi4zNy4yDQo+Pj4NCg==
