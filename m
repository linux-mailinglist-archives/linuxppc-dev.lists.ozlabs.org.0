Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8354A89FB9E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 17:32:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=LpdqUZvy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF6Jl1tbmz3vXR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 01:32:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=LpdqUZvy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF6Hy5dBhz3bs0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 01:31:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aI9iht2S+jnY3zX9k3oLYlzIm94HNLU2EnjCFMocvaRXOL/Kqpuh21kUOMEjlRr49UbgK3mX4mdF06aSI+3CoAXIRS1nNR4DqogFLc2fWSL86LhKugocou/ZL28s7jDrcCtbvL3R9wVMbeJRXepepp2BaaMR3swHA6Fve+6tA089PcS5u9M9LGe8zY0mguEGW4VKE/yDsCEyxH48mfCn9Mo4rKZL/4adGlNX9HsRlxxFfueWi+ZdzphQBJEf8Q9tZrRX98fqV5N4afTmlt/GeP4yGUrEswkoGhHBaLrHhyvSiIYKnsb0exPp9YmhNmyXH8luOvP5D7I6+CDIBsGi6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtsa9byHKfIuT4apTnJPxiVL47VLLSsX5+Gox16Jap0=;
 b=dLYzDlRSU+lZUiiKI9NRkjbd+PBvn2VilRShbAU6/VnkdLPwK0wMXcMmNF4Yg7XAJ+swksUwYBDFB0Pskt3s/p9VuwTYV0UVyhFYwm4kj5J6CHX+sONnJ8dxjCSsKsqckv/gOPoE8O2QKIOrj/2GP/5yIKn2uMeAhWBgrvA8hEHSCkhvK3iJ/aGmvctQsJlpXu4TzJBWgJU3KJaQpgVV4bzukFnt2h953SCohW23L3tQ4N+dxaZZ2cKJ5aXGPTShFXkyzq958lHwZuLs18iwSJpjDWjrl5rpM8B5v8Eu7gIRonjwPoZOEHFLT5+FxHSrcTFGa+I7IhBbmEBs1kdmFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtsa9byHKfIuT4apTnJPxiVL47VLLSsX5+Gox16Jap0=;
 b=LpdqUZvyLk8i5R77NLrnsZU6P21hUgghKRs54MTfoA1KcPwI6LjT2iJwgeBVcoeFNnjitmX5K5ADz95wdTJpp0qTWlLQ/aeDobTnVKnz4A855+DqSa2uRVUfK2nGmbu+S2DI/A6yl90RzJa06zHJlBBb3tXZBe+lKEyjjgEapr7aV16z12ABgMG27IOkb0rn1/x63WaFJPV4+8FIKMNPSsfqs2AS34ig3zY8ecOyRgGaEbWPdCvG5yFzJh+TMZmsPsHcpqUnWTd2ClV1O1Q6klS++Xcjn2icXDn9brJAAblUoRvMmuxQxHGVBthQOeoEGmC4c1s/fQEBoFQf4CFiXQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PARP264MB4613.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:42e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 15:31:15 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 15:31:15 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Joel Savitz <jsavitz@redhat.com>, Aneesh Kumar K.V
	<aneesh.kumar@kernel.org>
Subject: Re: [PATCH] powerpc: align memory_limit to 16MB in early_parse_mem
Thread-Topic: [PATCH] powerpc: align memory_limit to 16MB in early_parse_mem
Thread-Index: AQHabBdQUeoDAfnrD0ySERDoCv8kgLEtq8OAgBvs2QCACg3RgIAON0SAgAACXwA=
Date: Wed, 10 Apr 2024 15:31:15 +0000
Message-ID: <39df36ad-91a4-4bc1-bec9-a1b3ea619200@csgroup.eu>
References: <20240301203023.2197451-1-jsavitz@redhat.com>
 <87jzmduiva.fsf@kernel.org>
 <CAL1p7m5BoxFDeK0MryQCmTDCeBLN3rMLRGx3cHa6teS02wsgZw@mail.gmail.com>
 <CAL1p7m5VHGL+-st7zgGA9LPft6DND=qz0ifiD_ki1hLvfRv=7Q@mail.gmail.com>
 <CAL1p7m7f=b_qJrU8qea2n1+-1KzEVLMOpY9ov5fH2ZZxGrDK5A@mail.gmail.com>
In-Reply-To:  <CAL1p7m7f=b_qJrU8qea2n1+-1KzEVLMOpY9ov5fH2ZZxGrDK5A@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PARP264MB4613:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  JGBKIltRlG7p/2/yq+ZlkZTwC+Pkeway0GXj3N8tiDrlguCu9IZtmnXH1ahZBW2MzThjGkXdqJRgonW+sHnn7xDmQoAzWsJ2C5JdnQGf+PWKzvzVnrDOpQi3AqqVkOo76amHuGrmCswu2qtCAnpjFyCDxiLmmYy/RAhOJpzRyhOX8u8t1lY2Pun1nlcCPArgJZmBGhtHaqj2L9CzDEFRujS8kLuk2SXmVb0zXIzr9EkzeeL4R/is3ibELdqzu4/LNbkAARuu1jDUBzITsOm0nCxQ5w7wD92PRXeTdL7TGd/8MMDdLs6q94lUc5Zy9ZKXPkfhtKGh2vGWCmQy91PpK3xuQLZu7dTX31aIlaAkvZ+P3+Nqs4C7Iaajp+oFbPkV/5CwQMV69shR+xRXbJzrqqN/pmyw4v1LkthbKXZNEsAHfwkK9n9MQg/IVWXJM0E/ThgR2sTU384iw1yCNjKnrxl3sy4EXV9x3J59UoXj6XEbvmt+8Mly6269rCmB3u9xuDHm1xUpYGtikG49vOs/rxg2Xg+cVi+xtG4EnmrtOCKFeoCHSAYyLXI0DCI/4lW0Zz806rDUZeP6pL6a4PhpN1pClDUbXCDhY+3lzMQ4xVaipIhLzvkpxeJce/cabzjcDmnYr1iRBn5pdlFV/IJOHydFPyajHPGCuSMTpY5Ntx4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dFA2NkRnVnl1YTE1K1JFaThlMXN1dUlrMU0wVWFOWmV0dnJEanlUblVQbGRx?=
 =?utf-8?B?SU9IeG5IcFhPTWlLRHRMc2xtM3ppYVlqTTdET21sWGxSM2dSQytMc3hrRGpw?=
 =?utf-8?B?dFBXd3NnbTJ6NU1kaEF4ci95eWlJblZhTlk1QVZ5WnhiMWdlTDdRZ0RXUEdV?=
 =?utf-8?B?dE84cW5PT0pRT1Rib1BaQURicTYyMUlFWXU0ZUZqWkFvZjN5dmo0QzBvV1ZC?=
 =?utf-8?B?dU8xbm5lV3VQWVc3MTNUNCtWYVJpYWdSbTVuZFowNUY3ZjBPTGxPREdEcGI0?=
 =?utf-8?B?c3N1T1d1WkFydlBITGFXMzR1Y0lORG5oSlJHcU1tdWlQNlJNSVNDL1RERGhR?=
 =?utf-8?B?U3JtY3ExRnh2Y3A0cXJ2RHJYUEwyUERkaUs0VS91aFdYWTdBSGxEU1FucHNW?=
 =?utf-8?B?YlJha0t1MmpoQzkvRlhtQWplZUc4WU5UVnpYWXZ2K1Jocm44bTJGT1REVVZy?=
 =?utf-8?B?MVlSazVVTkdZWE5aUGdzbExEbzJNajdHcDdFWkt2OVB0MFVjOUw1UlovUDVi?=
 =?utf-8?B?MFkzMGRTU0dIS1o1cW1ITzVIaFJ4WTlmcUR6Zmc4ekZGN2swcDYrUWxBUDYz?=
 =?utf-8?B?Y3RqeUE5Ry9peXdQTTlkVWlkMXRmV1F6TnpIMEQvQnpja1J2U3lpVGdKS0tV?=
 =?utf-8?B?dXhlaU1hTG9jZVRXSVgzSjk0TThOSS8zYXBObWhMdWpWbnJjTytqaGlaY2k2?=
 =?utf-8?B?R0Rta21UekRZOFEvYzdYYzVReW0zeDFvSUpQWjdFcVdJZm1jNW53U09HL3BQ?=
 =?utf-8?B?Q0FhSVdpaDVlZFhTMWhtVEtJa1g2cWFOWkc5QWt0KzlrQjRtSlRTS2tmMkxO?=
 =?utf-8?B?OTVvamZjM1FkV3krR3FYcnhON1JSN1lhQTBleWlqb2pnQlhYUDZtVEV0cHRM?=
 =?utf-8?B?cnNrSTBpckRnSUsvQWxENWJHQzI0bmU1ci8rTzJVN2Z1eENTUFdBR0V1MFZk?=
 =?utf-8?B?dXpFL3RicnpjeTcyMENuSW1TTVorQ1lZM1lYOFc1SjQ1eFY4dFRucWVvSmNp?=
 =?utf-8?B?d2E1MXpJVTZuZWxRKzFTdjRXaEV5c2tKNGo0OWU3SWxyUGxubnJvTEZmakZC?=
 =?utf-8?B?elNteU5seVlyMDRmS2ZsL2FnaE5IMmhkVnFJR05JbjZYWTdYSVFpQzRldVFU?=
 =?utf-8?B?NEFtYTN3dE9XcFNoYVIwVXFCMVowZjVPTlNMMjJ0SzFKeFU4bFZLU1d0V0sx?=
 =?utf-8?B?aHl0VXVyRVdCa2dtbmhYYXFuOUw5TThnZS8xd2lxbFJJNm1YYWRXbmZWSWpD?=
 =?utf-8?B?eVFrZ3BoczA3bHIvOEg3UWpKUnVHdG5mVS96QitlV3hERUhHTTdLZ1F4T2Z5?=
 =?utf-8?B?cW1pS3RrcjRzbHUwcS95Si9iYzcwbWJKT2ErcVUwb2JETVpENGhFQXlEWWRG?=
 =?utf-8?B?TmRzaUY4OFJaakdqQXVoZmlhZTFDbTU2aG13YmhiZUNxOHlwWllFUFdMWjVo?=
 =?utf-8?B?NmZLWXRpUmNXS2pwUjdRL21DcGZTOXZrL05oQXE5WURmOHgyUGRoWXREZjNk?=
 =?utf-8?B?OTBVTnVNdHBwUnhEbzAyamozZzE1N1plWXZ6YmpCZ2xCdXgzdU9sRGtzV3B3?=
 =?utf-8?B?OHBoRUlZMXlncmhIb3c2b0hicHR2UXY4WDJuc0o2MmhNTjFTVzlCb1VvTWlJ?=
 =?utf-8?B?VEt4bVhnMyswdUkrL3hIcmx6QUtnQ05DUUI4YUdqK3FwQjFGUU5GdmN3c0x1?=
 =?utf-8?B?cDJJUVJwaitSckRqQUw0YWp3MXJ0RmdUWnQ2ZG1LSGhXaXhTbkdodVpxa09s?=
 =?utf-8?B?U1ZRdHhpSmN3eUhBaTZhMzY0bTZNaGxpSGpwTWhFbnBzODg2d1dUM01CbDRS?=
 =?utf-8?B?cnl6T3N4Z2g4Wjlqd3hBMmZrOHIvbi9tRmpCenJockhSMlUzdDliM3ZZK3Ur?=
 =?utf-8?B?TitHY3VMRWVoWXRMRDltbWNkUXgxbmtIU0tDbDltSjhHYjlxVWpyUlkwMGFs?=
 =?utf-8?B?QVNRYmE4SjI4VzB5VDMxOERaejl4bzFIQ3VXZUZGL3lDelMzT2NXalR2WGJn?=
 =?utf-8?B?NnJ6c3RiY3RCRHJSSXlLZkpKelhCZ1hZcUFjMUNCdTRaZ0lsd0RSZnk3Z2RZ?=
 =?utf-8?B?TjYyVko0UllHTlEwdFhkZ1AxWUVmNHN6cUhIWVFnNTl1S2tIbEZVSHBoNkZG?=
 =?utf-8?B?QmxFajJoMDVEdFJsREc0VWJpcUNuN1FNWmQ1UFluWk9HRHdCSXErWEltNHlh?=
 =?utf-8?B?TXkraWE0c3lKNFBLTDFPcVlRUHdkRytaL2lTNEkrZEhyYjVRKzVrU2loeFhW?=
 =?utf-8?B?MkZpOFJIKzdQUXpnbXZoWGhYWlB3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F1B06DE91C90E49876F511E61E04A38@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3a1e68-9d5b-4250-f172-08dc59734282
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2024 15:31:15.1455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AaBQ7oQCdhsKvm90HCm0g4HyVXw6k9ToqMQY14/2t2LW2re9pD7W0KWrAxRxXh+5WCrilz7KdGsB6zpTc4t8tU5f0inMVhq4hgWA/iktYzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PARP264MB4613
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
Cc: Gonzalo Siero <gsierohu@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzA0LzIwMjQgw6AgMTc6MjIsIEpvZWwgU2F2aXR6IGEgw6ljcml0wqA6DQo+IFtW
b3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIGpzYXZpdHpAcmVkaGF0
LmNvbS4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQgw6AgaHR0cHM6Ly9h
a2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IE9uIE1vbiwgQXBy
IDEsIDIwMjQgYXQgMTA6MTfigK9BTSBKb2VsIFNhdml0eiA8anNhdml0ekByZWRoYXQuY29tPiB3
cm90ZToNCj4+DQo+PiBPbiBUdWUsIE1hciAyNiwgMjAyNCBhdCAxMjo0NeKAr0FNIEpvZWwgU2F2
aXR6IDxqc2F2aXR6QHJlZGhhdC5jb20+IHdyb3RlOg0KPj4+DQo+Pj4gT24gRnJpLCBNYXIgOCwg
MjAyNCBhdCA1OjE44oCvQU0gQW5lZXNoIEt1bWFyIEsuViA8YW5lZXNoLmt1bWFyQGtlcm5lbC5v
cmc+IHdyb3RlOg0KPj4+Pg0KPj4+PiBKb2VsIFNhdml0eiA8anNhdml0ekByZWRoYXQuY29tPiB3
cml0ZXM6DQo+Pj4+DQo+Pj4+PiBPbiA2NC1iaXQgcG93ZXJwYywgdXNhZ2Ugb2YgYSBub24tMTZN
Qi1hbGlnbmVkIHZhbHVlIGZvciB0aGUgbWVtPSBrZXJuZWwNCj4+Pj4+IGNtZGxpbmUgcGFyYW1l
dGVyIHJlc3VsdHMgaW4gYSBzeXN0ZW0gaGFuZyBhdCBib290Lg0KPj4+Pj4NCj4+Pj4+IEZvciBl
eGFtcGxlLCB1c2luZyAnbWVtPTQxOTg0MDBLJyB3aWxsIGFsd2F5cyByZXByb2R1Y2UgdGhpcyBp
c3N1ZS4NCj4+Pj4+DQo+Pj4+PiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBwcm9ibGVtIGJ5IGFsaWdu
aW5nIGFueSBhcmd1bWVudCB0byBtZW09IHRvIDE2TUINCj4+Pj4+IGNvcnJlc3BvbmRpbmcgd2l0
aCB0aGUgbGFyZ2UgcGFnZSBzaXplIG9uIHBvd2VycGMuDQo+Pj4+Pg0KPj4+Pj4gRml4ZXM6IDJi
YWJmNWMyZWMyZiAoIltQQVRDSF0gcG93ZXJwYzogVW5pZnkgbWVtPSBoYW5kbGluZyIpDQo+Pj4+
PiBDby1kZXZlbG9wZWQtYnk6IEdvbnphbG8gU2llcm8gPGdzaWVyb2h1QHJlZGhhdC5jb20+DQo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBHb256YWxvIFNpZXJvIDxnc2llcm9odUByZWRoYXQuY29tPg0K
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSm9lbCBTYXZpdHogPGpzYXZpdHpAcmVkaGF0LmNvbT4NCj4+
Pj4+IC0tLQ0KPj4+Pj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3Byb20uYyB8IDYgKysrKystDQo+
Pj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+
Pj4+DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tLmMgYi9hcmNo
L3Bvd2VycGMva2VybmVsL3Byb20uYw0KPj4+Pj4gaW5kZXggMGI1ODc4YzMxMjViLi44Y2QzZTI0
NDVkOGEgMTAwNjQ0DQo+Pj4+PiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3Byb20uYw0KPj4+
Pj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tLmMNCj4+Pj4+IEBAIC04Miw4ICs4Miwx
MiBAQCBzdGF0aWMgaW50IF9faW5pdCBlYXJseV9wYXJzZV9tZW0oY2hhciAqcCkNCj4+Pj4+ICAg
ew0KPj4+Pj4gICAgICAgIGlmICghcCkNCj4+Pj4+ICAgICAgICAgICAgICAgIHJldHVybiAxOw0K
Pj4+Pj4gLQ0KPj4+Pj4gKyNpZmRlZiBDT05GSUdfUFBDNjQNCj4+Pj4+ICsgICAgIC8qIEFsaWdu
IHRvIDE2IE1CID09IHNpemUgb2YgcHBjNjQgbGFyZ2UgcGFnZSAqLw0KPj4+Pj4gKyAgICAgbWVt
b3J5X2xpbWl0ID0gQUxJR04obWVtcGFyc2UocCwgJnApLCAweDEwMDAwMDApOw0KPj4+Pj4gKyNl
bHNlDQo+Pj4+PiAgICAgICAgbWVtb3J5X2xpbWl0ID0gUEFHRV9BTElHTihtZW1wYXJzZShwLCAm
cCkpOw0KPj4+Pj4gKyNlbmRpZg0KPj4+Pj4gICAgICAgIERCRygibWVtb3J5IGxpbWl0ID0gMHgl
bGx4XG4iLCBtZW1vcnlfbGltaXQpOw0KPj4+Pj4NCj4+Pj4+ICAgICAgICByZXR1cm4gMDsNCj4+
Pj4+IC0tDQo+Pj4+PiAyLjQzLjANCj4+Pj4NCj4+Pj4gQ2FuIHlvdSB0cnkgdGhpcyBjaGFuZ2U/
DQo+Pj4+DQo+Pj4+IGNvbW1pdCA1NTU1YmM1NWUxYWE3MWY1NDVjZmYzMWUxZWNjZGI0YTJlMzlk
Zjg0DQo+Pj4+IEF1dGhvcjogQW5lZXNoIEt1bWFyIEsuViAoSUJNKSA8YW5lZXNoLmt1bWFyQGtl
cm5lbC5vcmc+DQo+Pj4+IERhdGU6ICAgRnJpIE1hciA4IDE0OjQ1OjI2IDIwMjQgKzA1MzANCj4+
Pj4NCj4+Pj4gICAgICBwb3dlcnBjL21tOiBBbGlnbiBtZW1vcnlfbGltaXQgdmFsdWUgc3BlY2lm
aWVkIHVzaW5nIG1lbT0ga2VybmVsIHBhcmFtZXRlcg0KPj4+Pg0KPj4+PiAgICAgIFRoZSB2YWx1
ZSBzcGVjaWZpZWQgZm9yIHRoZSBtZW1vcnkgbGltaXQgaXMgdXNlZCB0byBzZXQgYSByZXN0cmlj
dGlvbiBvbg0KPj4+PiAgICAgIG1lbW9yeSB1c2FnZS4gSXQgaXMgaW1wb3J0YW50IHRvIGVuc3Vy
ZSB0aGF0IHRoaXMgcmVzdHJpY3Rpb24gaXMgd2l0aGluDQo+Pj4+ICAgICAgdGhlIGxpbmVhciBt
YXAga2VybmVsIGFkZHJlc3Mgc3BhY2UgcmFuZ2UuIFRoZSBoYXNoIHBhZ2UgdGFibGUNCj4+Pj4g
ICAgICB0cmFuc2xhdGlvbiB1c2VzIGEgMTZNQiBwYWdlIHNpemUgdG8gbWFwIHRoZSBrZXJuZWwg
bGluZWFyIG1hcCBhZGRyZXNzDQo+Pj4+ICAgICAgc3BhY2UuIGh0YWJfYm9sdF9tYXBwaW5nKCkg
ZnVuY3Rpb24gYWxpZ25zIGRvd24gdGhlIHNpemUgb2YgdGhlIHJhbmdlDQo+Pj4+ICAgICAgd2hp
bGUgbWFwcGluZyBrZXJuZWwgbGluZWFyIGFkZHJlc3Mgc3BhY2UuIFNpbmNlIHRoZSBtZW1ibG9j
ayBsaW1pdCBpcw0KPj4+PiAgICAgIGVuZm9yY2VkIHZlcnkgZWFybHkgZHVyaW5nIGJvb3QsIGJl
Zm9yZSB3ZSBjYW4gZGV0ZWN0IHRoZSB0eXBlIG9mIG1lbW9yeQ0KPj4+PiAgICAgIHRyYW5zbGF0
aW9uIChyYWRpeCB2cyBoYXNoKSwgd2UgYWxpZ24gdGhlIG1lbW9yeSBsaW1pdCB2YWx1ZSBzcGVj
aWZpZWQNCj4+Pj4gICAgICBhcyBhIGtlcm5lbCBwYXJhbWV0ZXIgdG8gMTZNQi4gVGhpcyBhbGln
bm1lbnQgdmFsdWUgd2lsbCB3b3JrIGZvciBib3RoDQo+Pj4+ICAgICAgaGFzaCBhbmQgcmFkaXgg
dHJhbnNsYXRpb25zLg0KPj4+Pg0KPj4+PiAgICAgIFNpZ25lZC1vZmYtYnk6IEFuZWVzaCBLdW1h
ciBLLlYgKElCTSkgPGFuZWVzaC5rdW1hckBrZXJuZWwub3JnPg0KPj4+Pg0KPj4+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3By
b20uYw0KPj4+PiBpbmRleCAwYjU4NzhjMzEyNWIuLjliZDk2NWQzNTM1MiAxMDA2NDQNCj4+Pj4g
LS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tLmMNCj4+Pj4gKysrIGIvYXJjaC9wb3dlcnBj
L2tlcm5lbC9wcm9tLmMNCj4+Pj4gQEAgLTgyNCw4ICs4MjQsMTEgQEAgdm9pZCBfX2luaXQgZWFy
bHlfaW5pdF9kZXZ0cmVlKHZvaWQgKnBhcmFtcykNCj4+Pj4gICAgICAgICAgICAgICAgICByZXNl
cnZlX2NyYXNoa2VybmVsKCk7DQo+Pj4+ICAgICAgICAgIGVhcmx5X3Jlc2VydmVfbWVtKCk7DQo+
Pj4+DQo+Pj4+IC0gICAgICAgLyogRW5zdXJlIHRoYXQgdG90YWwgbWVtb3J5IHNpemUgaXMgcGFn
ZS1hbGlnbmVkLiAqLw0KPj4+PiAtICAgICAgIGxpbWl0ID0gQUxJR04obWVtb3J5X2xpbWl0ID86
IG1lbWJsb2NrX3BoeXNfbWVtX3NpemUoKSwgUEFHRV9TSVpFKTsNCj4+Pj4gKyAgICAgICBpZiAo
bWVtb3J5X2xpbWl0ID4gbWVtYmxvY2tfcGh5c19tZW1fc2l6ZSgpKQ0KPj4+PiArICAgICAgICAg
ICAgICAgbWVtb3J5X2xpbWl0ID0gMDsNCj4+Pj4gKw0KPj4+PiArICAgICAgIC8qIEFsaWduIGRv
d24gdG8gMTYgTUIgd2hpY2ggaXMgbGFyZ2UgcGFnZSBzaXplIHdpdGggaGFzaCBwYWdlIHRyYW5z
bGF0aW9uICovDQo+Pj4+ICsgICAgICAgbGltaXQgPSBBTElHTl9ET1dOKG1lbW9yeV9saW1pdCA/
OiBtZW1ibG9ja19waHlzX21lbV9zaXplKCksIFNaXzE2TSk7DQo+Pj4+ICAgICAgICAgIG1lbWJs
b2NrX2VuZm9yY2VfbWVtb3J5X2xpbWl0KGxpbWl0KTsNCj4+Pj4NCj4+Pj4gICAjaWYgZGVmaW5l
ZChDT05GSUdfUFBDX0JPT0szU182NCkgJiYgZGVmaW5lZChDT05GSUdfUFBDXzRLX1BBR0VTKQ0K
Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tX2luaXQuYyBiL2FyY2gv
cG93ZXJwYy9rZXJuZWwvcHJvbV9pbml0LmMNCj4+Pj4gaW5kZXggZTY3ZWZmZGJhODVjLi5kNjQx
MDU0OWUxNDEgMTAwNjQ0DQo+Pj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHJvbV9pbml0
LmMNCj4+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tX2luaXQuYw0KPj4+PiBAQCAt
ODE3LDggKzgxNyw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlYXJseV9jbWRsaW5lX3BhcnNlKHZv
aWQpDQo+Pj4+ICAgICAgICAgICAgICAgICAgb3B0ICs9IDQ7DQo+Pj4+ICAgICAgICAgICAgICAg
ICAgcHJvbV9tZW1vcnlfbGltaXQgPSBwcm9tX21lbXBhcnNlKG9wdCwgKGNvbnN0IGNoYXIgKiop
Jm9wdCk7DQo+Pj4+ICAgI2lmZGVmIENPTkZJR19QUEM2NA0KPj4+PiAtICAgICAgICAgICAgICAg
LyogQWxpZ24gdG8gMTYgTUIgPT0gc2l6ZSBvZiBwcGM2NCBsYXJnZSBwYWdlICovDQo+Pj4+IC0g
ICAgICAgICAgICAgICBwcm9tX21lbW9yeV9saW1pdCA9IEFMSUdOKHByb21fbWVtb3J5X2xpbWl0
LCAweDEwMDAwMDApOw0KPj4+PiArICAgICAgICAgICAgICAgLyogQWxpZ24gZG93biB0byAxNiBN
QiB3aGljaCBpcyBsYXJnZSBwYWdlIHNpemUgd2l0aCBoYXNoIHBhZ2UgdHJhbnNsYXRpb24gKi8N
Cj4+Pj4gKyAgICAgICAgICAgICAgIHByb21fbWVtb3J5X2xpbWl0ID0gQUxJR05fRE9XTihwcm9t
X21lbW9yeV9saW1pdCwgU1pfMTZNKTsNCj4+Pj4gICAjZW5kaWYNCj4+Pj4gICAgICAgICAgfQ0K
Pj4+Pg0KPj4+Pg0KPj4+DQo+Pj4gU29ycnkgZm9yIHRoZSBkZWxheWVkIHJlcGx5LiBJIGp1c3Qg
dGVzdGVkIHRoaXMgcGF0Y2ggYW5kIGl0IGZpeGVzIHRoZQ0KPj4+IGJ1ZyBmb3IgbWUuDQo+Pg0K
Pj4gSGksDQo+Pg0KPj4gSnVzdCBhIHF1aWNrIGZvbGxvdyB1cCBvbiB0aGlzLg0KPj4NCj4+IFRo
ZSBhYm92ZSBwYXRjaCBmaXhlZCB0aGUgYnVnIGZvciBtZS4NCj4+DQo+PiBIb3cgZG8gd2Ugd2Fu
dCB0byBwcm9jZWVkPw0KPj4NCj4+IEJlc3QsDQo+PiBKb2VsIFNhdml0eg0KPiANCj4gSGksDQo+
IA0KPiBJIGhhdmVuJ3QgaGVhcmQgYW55dGhpbmcgb24gdGhpcyB0aHJlYWQgc28gSSdtIGp1c3Qg
c2VuZGluZyBhIHF1aWNrIGZvbGxvdyB1cC4NCj4gDQo+IERvIHdlIHdhbnQgdG8gbWVyZ2UgdGhp
cw0KPiANCg0KSXMgaXQgdGhlIHNhbWUgYXMgDQpodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvbGludXhwcGMtZGV2L3BhdGNoLzIwMjQwNDAzMDgzNjExLjE3MjgzMy0xLWFuZWVz
aC5rdW1hckBrZXJuZWwub3JnLyANCj8NCg==
