Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CCD6160AB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 11:12:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2N3j6PTjz3cht
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 21:12:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ot5EvFph;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.88; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ot5EvFph;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120088.outbound.protection.outlook.com [40.107.12.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2N2l6zNHz2xs1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 21:11:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWjm55U/c6lUYUiFohrV2Cc1QkP6xi3y7mRg33MJqJpje9bItGFcZvUBHgqP3CyXU3rm34dv6heWRgCpo371ZkCaqP07xN4Y7jxk6L2mw43sSgcYE1CXDyybgzXHPUGnGIasSy4RI5cbU/s/2PFz5c5bij7dmfLqdiX5m/Eh8ff4U1fkYYsjBJnVRAq0tm64ZwksezyuSZkiOqCd3v3wd/Aqb2HNqKHfEL8lYsKGFwtDQzL0R44ub/azbLL6NqoTcbJiemhmo5Cf4lBmQlraeefIw0Ks+//57TEkrLfgz9x57ShmYXjlbDpgf3UPd1jXf38eshETSsCTU2RI/EMyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0stby1x2s7jyn6c6BC+rtoLg1PAo4huWRoQ9HiUtoPI=;
 b=M4BTHgYRIcGZkK4jhYczDSLyBEVT+Sc6aBAdxmxTr+60XEAZyEuGkclEqfYMU+PE+Dj/GOPnhzEQxW3pTiQ39d4WH7ubVJWT1hOC80xpWeNseux6otWD6DBeMY8sHCs9a4gHodMaOXUqHJaouppUXomkr3AGyihmixFTHzXpl0OHBAJ6rOSu5p+uBpYyKeAruVI2tjdQ75m8Q6etjByMEoc4J/VUCKp5BiJap16cyy2t2RGF4RpHs/K7Sw247fNwcqt3TyV7aKvPSeX5hXfsOv6TTl+FpRfUSgeduNcEZ7EXvkayIx2j5HiYJKL3skNrpJYVmGl+ZZx7phiOcc7mJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0stby1x2s7jyn6c6BC+rtoLg1PAo4huWRoQ9HiUtoPI=;
 b=ot5EvFphs8i3IlBJc8kxhLBemq7gmN2k3xe4Maq5GtblPK32bEYRuj4eKcUOf8GtwEgupqTozTtVDoW9FJQZYiKFKY0jKlUBdb6f7NFeI617TV6yKt21fl7WHd9TckeCwti52ikIV7IGDeXTlzCUp6LbOu9BWZzhVcXSqeRiMnl+ZKK2OS4iaXbZxUX1xu8/XuCk0uBkq7XSoOV+VwUVdDBCVbnvlDE6p3WbMp+m6VAkUIBULQ7l0WTUeZfynmk+DkzTKDMLu1LrOAkVi8dS8sl590BIniLL415LGEcYncqGE0MfcjMD5YWyEbDho92m2cAzUU8XFNwdPC1+6+k56w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1913.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:169::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Wed, 2 Nov
 2022 10:11:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 10:11:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v9 6/7] powerpc/code-patching: Use temporary mm for Radix
 MMU
Thread-Topic: [PATCH v9 6/7] powerpc/code-patching: Use temporary mm for Radix
 MMU
Thread-Index: AQHY6CyAT+1vk8GFQkGq3EAbNm63IK4rdn2A
Date: Wed, 2 Nov 2022 10:11:06 +0000
Message-ID: <5c1976e4-8a66-2651-3968-5f23d9cb9bd3@csgroup.eu>
References: <20221025044409.448755-1-bgray@linux.ibm.com>
 <20221025044409.448755-7-bgray@linux.ibm.com>
In-Reply-To: <20221025044409.448755-7-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1913:EE_
x-ms-office365-filtering-correlation-id: 635b6ddc-8a92-4dad-6c9c-08dabcba8e60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2vfuhWmdiCuFghNrd6Uw7cgfieRRaTwDQ9BfpdTOnoZxAakqFcRKVnF3iiGoUxUUInQTqPVbElYzpinsNqdLwNYKFhjVUqFrdZM6CpovUwgMkF0vduG2C3DvFCj1DGFL3oukibdDKSGZ1nL7PW92JKrNG3x0gUe++qiCVyozQSKOhOvQn36L92CAeATtp55QmopEMLOIWNcPaXFXq/xNKzu0ajEL3GJXhus57cI+BnSyzrXi+urqCkAujv0s1sPwzzjfuQ6fOwDV1wvCmmx988ScmuWsuY+UzD7nzZY9Xk0SohcpT2ef1dfA3813yj2s6xna05pHcTYQ0j9ARPfyuedIZCgMZ+FAYO5sG7HpMNIAQ/hbshl63fxxVBgrRSIOswq95gqTtnPOPbqVmINGJH2BRSZLXTUfwhYFcH/LqXQmvvG35bboCYFZO/poaaCb1qnfgbtZhwFw7OWpMHV3f+oU2C5gFmnHCJnPx47mlZ9SgTqq5JCteyLqHSF4nDcRWLNT7Cp3CjlnnS1mY8bsmZDK9gpl5ogcNkbGxdWG/Bz8HZ3Krjv9S3xE1OhDfkPgUwxF4LbqsdYxNS6jqp2ElExLTmKnvuMHn98V9QvBqby2Z1xZj9xd4pWvUN3C0Sz0chxJB2ipy7dBldVq6N/3e8sLy1DLdKn13HSfYOZ/EYSRq6htflBMVBL3hWJ6gj6QqazdbthlHG33YaXuzF5N+OmdxxE/VW1b+0qPVyOwFwyp3WYoo54s4LD1uY7RF5wh8sFQK7coR+6K19PsnFCnjj1QMlpv34vc+pxrGCUZCVuoONx7JbgOdPOM7y60Qj01pw5zWwQeIUSa+nC4bOnmvMErKBOIEOBoauhi1xZW71E=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39850400004)(376002)(366004)(396003)(451199015)(122000001)(38100700002)(36756003)(38070700005)(2906002)(86362001)(44832011)(30864003)(71200400001)(966005)(6486002)(76116006)(478600001)(316002)(64756008)(4326008)(66446008)(66476007)(110136005)(66946007)(8936002)(91956017)(41300700001)(54906003)(5660300002)(2616005)(6506007)(26005)(8676002)(66556008)(186003)(31696002)(6512007)(66574015)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?T3loWWJxaGJMdklmNHkxV3FBa0dMQ2dob0xlem45cWcvUEZ5NWZPdjZ5dU1M?=
 =?utf-8?B?S0xPcGlaZmFVQmRWZW5LL1hNR2pXSDFxOWhvRWxZQWZnZllyZVBCT3JPZGcw?=
 =?utf-8?B?M0dGRVpySUp5Mzh5RGNRNWZxa1lDM3c2S2tXZzRVNE1Ramx5SDc4eTVyVlhV?=
 =?utf-8?B?MEVWRktpelpWMzFwSHhjSUtudDRlN01KWkYvMHkrVktYNU9jWTArL296clh0?=
 =?utf-8?B?aU96Y2k3NUdHTHVCK1oxNVJ1a2N5WGRESmZMemZBZFk4NUozVHRtWEVEbXRN?=
 =?utf-8?B?WUJEV2dEbTI1L3JWYTdLdGpTejFCUExVdXdvQmllNm1nU0FIc0dyN0xRTjN0?=
 =?utf-8?B?SXJ2WkdzbzZWRWg3c29HY1JSNlpNSUhWcGx0Rm5iVjhEZjVyWjZLcnpPSzcv?=
 =?utf-8?B?SzZ0WDIxUFQ2c0owQ3N0VGl1RWpmRDZVK1NzNmRRaDVqRlN2aWl6RzlWYktE?=
 =?utf-8?B?MENjTjUvQ3NsQXdxZGZFVHlPYkZvU2JqMVVZWlZkaGlRUm9xcXAxVTdoQysy?=
 =?utf-8?B?MkYyNThtNjJ1RUdZYm1CZEYwRHJqa1VTMjNOaW5zZGlUa3RlZlg3anhMOS9n?=
 =?utf-8?B?N1N3aXlVa1Y0VysvSDM4b3pJcW9tTjlNOHRhU09ZeGVna0ZFYUZmUlJ2ZEd2?=
 =?utf-8?B?Zm9vdzcyTHI0cUVuc1VVTGJSSmY1cmpSVzVoYlhOc0lxUHZjVm4wQ3N2SWln?=
 =?utf-8?B?S0p1eldlUmhLTjJzZURGS2ViS1gwMlFHdzdzQ01mZmFybjM2cHNSTzYyUWZP?=
 =?utf-8?B?Q2gyTWcrUE9pV2pWd09MQUVCSzcyenJtZjhpMTI3SHhKaExkYnQvbk4vM0tu?=
 =?utf-8?B?eXNmWUFiQ08yMjRESDlwZEQ0ekFnU0E4SE15bWtJK3RobXlodnNSRW9uK2Vz?=
 =?utf-8?B?NVF3RTA3NFNqYThFaEtRRC9PdWRsRUw4dnlZTHF5MlJ5Mk0zd1RHWjU0Ukhv?=
 =?utf-8?B?b2J5VmI5SStsbEFJUVA1VFNLNURjaWFTU3p0aFNLZEU4MzNCZ0VqUW15Ti9u?=
 =?utf-8?B?SDMxNmtTUzRIcGtEYXMybG13SjJkaXV0TzgxR1JFajVEOVloeGwrcVpDWEdx?=
 =?utf-8?B?VDY3bDhBcEFiN1F4OXJCa1JTbTkrOU42cEdBNTkwb2FuajJlYndnOFRSQkRD?=
 =?utf-8?B?cVpLN254UG1YTnk3WlUzY1oxS1FkZ1ZkVktyT0MyNGJWWlNuYlFJRmRhb24r?=
 =?utf-8?B?aGVYaGg1WUFVT1kydlo5UW5nRDBIWGhRcUNxeE1UYUlRK3R3RHY1bVp6dTUx?=
 =?utf-8?B?dmRXN3R6ZGJlejY5T1drRVFUKzRhSzgrUTc4K1hNa2diRHJPc3FVc2R6TkVS?=
 =?utf-8?B?Rytya0ZvU0VKaTBtRlRQeFZFZWF0SWNRTnVtVkw0UHd5bHdrL0dsUk5hd0xU?=
 =?utf-8?B?OE40NHVUV3VpY29RMWcwaStTWGl1cCtDRkRKSnJuVjd4ZUQ2TmtnWm1IdktW?=
 =?utf-8?B?UmJySHhQcXZ3cU0vbUZvNU9Uc0JIbDB3dnE5L1BQMXdzMERwSGl2eElGWm9m?=
 =?utf-8?B?bXVvZng3clFMem8zR2poRWZRVXcvVE03RWNBVGI5alkrWUhQdFpqd2FJVzlk?=
 =?utf-8?B?SEtxZ1ljUU9nMmVsSGRhTzFncGo1R1h4Qmd3dXEycUo2NGxHUWtySlpWUFhO?=
 =?utf-8?B?SXNCZWJsSndBMy9SSGRjc2pGbVZvOHZTTUltOEx2MjlqUHI4K1hOaEVDc2tm?=
 =?utf-8?B?M1kySk0rSUtpd010cjEyYldLbTNDOElaV0pwelZxNkxMMDRkcTRnazVvRmcx?=
 =?utf-8?B?OEViWnNLa0tIdHphZHBHbFpZaTlTUGZoVXNtalhudGcyWWNZS1BIcHZ0VTUy?=
 =?utf-8?B?SURGa3A2dmV2Y3ZwcDROdHRJTlNxOGF4R3EyZHMvenE1endJdnc3bmFlNFdw?=
 =?utf-8?B?WFZ6UFk4TFVRZWw1MWlzaURKS284QWFMOE5sMVlhM0g3SmkwWVhqSHB6S25J?=
 =?utf-8?B?T1phNGZ4VkdVME9kTSswWnFpN2E3bHRQbnYzRThOTWI1UjRNYVJCMG5XMmlj?=
 =?utf-8?B?Wkpnd2NubHJDRmdoUzFsb00xV0NZckkxY3lpSmNxUWFrbG5aWVpzeVhIT3Za?=
 =?utf-8?B?bldmSlNQVkNMUHI3ekNxbE91TUFDc2hUdlpvckpocjZxNFpiQ2xBL25WbS9I?=
 =?utf-8?B?Y0UxbWE4UlA4TTJXY055WHhZam1IY0FrblIwcmhFKzhzckZacjU0RGMxdGY4?=
 =?utf-8?Q?LSTWuv882GrqZcB4o1p/fhg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F42D8079B188F469C73F99D40FD9BA0@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 635b6ddc-8a92-4dad-6c9c-08dabcba8e60
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 10:11:06.4344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aYg61NxbHuFbgclpvTCl7tsjBWxmMpDTDJBGPFXkZrdFHt8h5PBbAcgrAb4JdwDbxO+a+QWkCUFQg7x9WGK+fy0jFjmeoxiNomue0GT8Yzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1913
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>, "cmr@bluescreens.de" <cmr@bluescreens.de>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzEwLzIwMjIgw6AgMDY6NDQsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
RnJvbTogIkNocmlzdG9waGVyIE0uIFJpZWRsIiA8Y21yQGJsdWVzY3JlZW5zLmRlPg0KPiANCj4g
eDg2IHN1cHBvcnRzIHRoZSBub3Rpb24gb2YgYSB0ZW1wb3JhcnkgbW0gd2hpY2ggcmVzdHJpY3Rz
IGFjY2VzcyB0bw0KPiB0ZW1wb3JhcnkgUFRFcyB0byBhIHNpbmdsZSBDUFUuIEEgdGVtcG9yYXJ5
IG1tIGlzIHVzZWZ1bCBmb3Igc2l0dWF0aW9ucw0KPiB3aGVyZSBhIENQVSBuZWVkcyB0byBwZXJm
b3JtIHNlbnNpdGl2ZSBvcGVyYXRpb25zIChzdWNoIGFzIHBhdGNoaW5nIGENCj4gU1RSSUNUX0tF
Uk5FTF9SV1gga2VybmVsKSByZXF1aXJpbmcgdGVtcG9yYXJ5IG1hcHBpbmdzIHdpdGhvdXQgZXhw
b3NpbmcNCj4gc2FpZCBtYXBwaW5ncyB0byBvdGhlciBDUFVzLiBBbm90aGVyIGJlbmVmaXQgaXMg
dGhhdCBvdGhlciBDUFUgVExCcyBkbw0KPiBub3QgbmVlZCB0byBiZSBmbHVzaGVkIHdoZW4gdGhl
IHRlbXBvcmFyeSBtbSBpcyB0b3JuIGRvd24uDQo+IA0KPiBNYXBwaW5ncyBpbiB0aGUgdGVtcG9y
YXJ5IG1tIGNhbiBiZSBzZXQgaW4gdGhlIHVzZXJzcGFjZSBwb3J0aW9uIG9mIHRoZQ0KPiBhZGRy
ZXNzLXNwYWNlLg0KPiANCj4gSW50ZXJydXB0cyBtdXN0IGJlIGRpc2FibGVkIHdoaWxlIHRoZSB0
ZW1wb3JhcnkgbW0gaXMgaW4gdXNlLiBIVw0KPiBicmVha3BvaW50cywgd2hpY2ggbWF5IGhhdmUg
YmVlbiBzZXQgYnkgdXNlcnNwYWNlIGFzIHdhdGNocG9pbnRzIG9uDQo+IGFkZHJlc3NlcyBub3cg
d2l0aGluIHRoZSB0ZW1wb3JhcnkgbW0sIGFyZSBzYXZlZCBhbmQgZGlzYWJsZWQgd2hlbg0KPiBs
b2FkaW5nIHRoZSB0ZW1wb3JhcnkgbW0uIFRoZSBIVyBicmVha3BvaW50cyBhcmUgcmVzdG9yZWQg
d2hlbiB1bmxvYWRpbmcNCj4gdGhlIHRlbXBvcmFyeSBtbS4gQWxsIEhXIGJyZWFrcG9pbnRzIGFy
ZSBpbmRpc2NyaW1pbmF0ZWx5IGRpc2FibGVkIHdoaWxlDQo+IHRoZSB0ZW1wb3JhcnkgbW0gaXMg
aW4gdXNlIC0gdGhpcyBtYXkgaW5jbHVkZSBicmVha3BvaW50cyBzZXQgYnkgcGVyZi4NCj4gDQo+
IFVzZSB0aGUgYHBva2luZ19pbml0YCBpbml0IGhvb2sgdG8gcHJlcGFyZSBhIHRlbXBvcmFyeSBt
bSBhbmQgcGF0Y2hpbmcNCj4gYWRkcmVzcy4gSW5pdGlhbGl6ZSB0aGUgdGVtcG9yYXJ5IG1tIGJ5
IGNvcHlpbmcgdGhlIGluaXQgbW0uIENob29zZSBhDQo+IHJhbmRvbWl6ZWQgcGF0Y2hpbmcgYWRk
cmVzcyBpbnNpZGUgdGhlIHRlbXBvcmFyeSBtbSB1c2Vyc3BhY2UgYWRkcmVzcw0KPiBzcGFjZS4g
VGhlIHBhdGNoaW5nIGFkZHJlc3MgaXMgcmFuZG9taXplZCBiZXR3ZWVuIFBBR0VfU0laRSBhbmQN
Cj4gREVGQVVMVF9NQVBfV0lORE9XLVBBR0VfU0laRS4NCj4gDQo+IEJpdHMgb2YgZW50cm9weSB3
aXRoIDY0SyBwYWdlIHNpemUgb24gQk9PSzNTXzY0Og0KPiANCj4gCWJpdHMgb2YgZW50cm9weSA9
IGxvZzIoREVGQVVMVF9NQVBfV0lORE9XX1VTRVI2NCAvIFBBR0VfU0laRSkNCj4gDQo+IAlQQUdF
X1NJWkU9NjRLLCBERUZBVUxUX01BUF9XSU5ET1dfVVNFUjY0PTEyOFRCDQo+IAliaXRzIG9mIGVu
dHJvcHkgPSBsb2cyKDEyOFRCIC8gNjRLKQ0KPiAJYml0cyBvZiBlbnRyb3B5ID0gMzENCj4gDQo+
IFRoZSB1cHBlciBsaW1pdCBpcyBERUZBVUxUX01BUF9XSU5ET1cgZHVlIHRvIGhvdyB0aGUgQm9v
azNzNjQgSGFzaCBNTVUNCj4gb3BlcmF0ZXMgLSBieSBkZWZhdWx0IHRoZSBzcGFjZSBhYm92ZSBE
RUZBVUxUX01BUF9XSU5ET1cgaXMgbm90DQo+IGF2YWlsYWJsZS4gQ3VycmVudGx5IHRoZSBIYXNo
IE1NVSBkb2VzIG5vdCB1c2UgYSB0ZW1wb3JhcnkgbW0gc28NCj4gdGVjaG5pY2FsbHkgdGhpcyB1
cHBlciBsaW1pdCBpc24ndCBuZWNlc3Nhcnk7IGhvd2V2ZXIsIGEgbGFyZ2VyDQo+IHJhbmRvbWl6
YXRpb24gcmFuZ2UgZG9lcyBub3QgZnVydGhlciAiaGFyZGVuIiB0aGlzIG92ZXJhbGwgYXBwcm9h
Y2ggYW5kDQo+IGZ1dHVyZSB3b3JrIG1heSBpbnRyb2R1Y2UgcGF0Y2hpbmcgd2l0aCBhIHRlbXBv
cmFyeSBtbSBvbiBIYXNoIGFzIHdlbGwuDQo+IA0KPiBSYW5kb21pemF0aW9uIG9jY3VycyBvbmx5
IG9uY2UgZHVyaW5nIGluaXRpYWxpemF0aW9uIGZvciBlYWNoIENQVSBhcyBpdA0KPiBjb21lcyBv
bmxpbmUuDQo+IA0KPiBUaGUgcGF0Y2hpbmcgcGFnZSBpcyBtYXBwZWQgd2l0aCBQQUdFX0tFUk5F
TCB0byBzZXQgRUFBWzBdIGZvciB0aGUgUFRFDQo+IHdoaWNoIGlnbm9yZXMgdGhlIEFNUiAoc28g
bm8gbmVlZCB0byB1bmxvY2svbG9jayBLVUFQKSBhY2NvcmRpbmcgdG8NCj4gUG93ZXJJU0EgdjMu
MGIgRmlndXJlIDM1IG9uIFJhZGl4Lg0KPiANCj4gQmFzZWQgb24geDg2IGltcGxlbWVudGF0aW9u
Og0KPiANCj4gY29tbWl0IDRmYzE5NzA4YjE2NQ0KPiAoIng4Ni9hbHRlcm5hdGl2ZXM6IEluaXRp
YWxpemUgdGVtcG9yYXJ5IG1tIGZvciBwYXRjaGluZyIpDQo+IA0KPiBhbmQ6DQo+IA0KPiBjb21t
aXQgYjNmZDhlODNhZGEwDQo+ICgieDg2L2FsdGVybmF0aXZlczogVXNlIHRlbXBvcmFyeSBtbSBm
b3IgdGV4dCBwb2tpbmciKQ0KPiANCj4gRnJvbTogQmVuamFtaW4gR3JheSA8YmdyYXlAbGludXgu
aWJtLmNvbT4NCj4gDQo+IFN5bmNocm9uaXNhdGlvbiBpcyBkb25lIGFjY29yZGluZyB0byBJU0Eg
My4xQiBCb29rIDMgQ2hhcHRlciAxMw0KPiAiU3luY2hyb25pemF0aW9uIFJlcXVpcmVtZW50cyBm
b3IgQ29udGV4dCBBbHRlcmF0aW9ucyIuIFN3aXRjaGluZyB0aGUgbW0NCj4gaXMgYSBjaGFuZ2Ug
dG8gdGhlIFBJRCwgd2hpY2ggcmVxdWlyZXMgYSBDU0kgYmVmb3JlIGFuZCBhZnRlciB0aGUgY2hh
bmdlLA0KPiBhbmQgYSBod3N5bmMgYmV0d2VlbiB0aGUgbGFzdCBpbnN0cnVjdGlvbiB0aGF0IHBl
cmZvcm1zIGFkZHJlc3MNCj4gdHJhbnNsYXRpb24gZm9yIGFuIGFzc29jaWF0ZWQgc3RvcmFnZSBh
Y2Nlc3MuDQo+IA0KPiBJbnN0cnVjdGlvbiBmZXRjaCBpcyBhbiBhc3NvY2lhdGVkIHN0b3JhZ2Ug
YWNjZXNzLCBidXQgdGhlIGluc3RydWN0aW9uDQo+IGFkZHJlc3MgbWFwcGluZ3MgYXJlIG5vdCBi
ZWluZyBjaGFuZ2VkLCBzbyBpdCBzaG91bGQgbm90IG1hdHRlciB3aGljaA0KPiBjb250ZXh0IHRo
ZXkgdXNlLiBXZSBtdXN0IHN0aWxsIHBlcmZvcm0gYSBod3N5bmMgdG8gZ3VhcmQgYXJiaXRyYXJ5
DQo+IHByaW9yIGNvZGUgdGhhdCBtYXkgaGF2ZSBhY2Nlc3NlZCBhIHVzZXJzcGFjZSBhZGRyZXNz
Lg0KPiANCj4gVExCIGludmFsaWRhdGlvbiBpcyBsb2NhbCBhbmQgVkEgc3BlY2lmaWMuIExvY2Fs
IGJlY2F1c2Ugb25seSB0aGlzIGNvcmUNCj4gdXNlZCB0aGUgcGF0Y2hpbmcgbW0sIGFuZCBWQSBz
cGVjaWZpYyBiZWNhdXNlIHdlIG9ubHkgY2FyZSB0aGF0IHRoZQ0KPiB3cml0YWJsZSBtYXBwaW5n
IGlzIHB1cmdlZC4gTGVhdmluZyB0aGUgb3RoZXIgbWFwcGluZ3MgaW50YWN0IGlzIG1vcmUNCj4g
ZWZmaWNpZW50LCBlc3BlY2lhbGx5IHdoZW4gcGVyZm9ybWluZyBtYW55IGNvZGUgcGF0Y2hlcyBp
biBhIHJvdyAoZS5nLiwNCj4gYXMgZnRyYWNlIHdvdWxkKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IENocmlzdG9waGVyIE0uIFJpZWRsIDxjbXJAYmx1ZXNjcmVlbnMuZGU+DQo+IFNpZ25lZC1vZmYt
Ynk6IEJlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+DQo+IC0tLQ0KPiB2OToJKiBB
ZGQgYmFjayBDaHJpc3RvcGhlciBNLiBSaWVkbCBzaWduZWQtb2ZmLWJ5DQo+IAkqIFJlbW92ZSB0
ZW1wX21tX3N0YXRlDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5j
IHwgMjIxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMjE2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMgYi9hcmNoL3Bvd2VycGMvbGliL2NvZGUt
cGF0Y2hpbmcuYw0KPiBpbmRleCBiMGExMmIyZDVhOWIuLjNmZTk5ZDAwODZmYyAxMDA2NDQNCj4g
LS0tIGEvYXJjaC9wb3dlcnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMNCj4gKysrIGIvYXJjaC9wb3dl
cnBjL2xpYi9jb2RlLXBhdGNoaW5nLmMNCj4gQEAgLTQsMTIgKzQsMTcgQEANCj4gICAgKi8NCj4g
ICANCj4gICAjaW5jbHVkZSA8bGludXgva3Byb2Jlcy5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L21t
dV9jb250ZXh0Lmg+DQo+ICsjaW5jbHVkZSA8bGludXgvcmFuZG9tLmg+DQo+ICAgI2luY2x1ZGUg
PGxpbnV4L3ZtYWxsb2MuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvaW5pdC5oPg0KPiAgICNpbmNs
dWRlIDxsaW51eC9jcHVob3RwbHVnLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4N
Cj4gICAjaW5jbHVkZSA8bGludXgvanVtcF9sYWJlbC5oPg0KPiAgIA0KPiArI2luY2x1ZGUgPGFz
bS9kZWJ1Zy5oPg0KPiArI2luY2x1ZGUgPGFzbS9wZ2FsbG9jLmg+DQo+ICsjaW5jbHVkZSA8YXNt
L3RsYi5oPg0KPiAgICNpbmNsdWRlIDxhc20vdGxiZmx1c2guaD4NCj4gICAjaW5jbHVkZSA8YXNt
L3BhZ2UuaD4NCj4gICAjaW5jbHVkZSA8YXNtL2NvZGUtcGF0Y2hpbmcuaD4NCj4gQEAgLTQyLDEx
ICs0Nyw1NCBAQCBpbnQgcmF3X3BhdGNoX2luc3RydWN0aW9uKHUzMiAqYWRkciwgcHBjX2luc3Rf
dCBpbnN0cikNCj4gICB9DQo+ICAgDQo+ICAgI2lmZGVmIENPTkZJR19TVFJJQ1RfS0VSTkVMX1JX
WA0KPiArDQo+ICAgc3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCB2bV9zdHJ1Y3QgKiwgdGV4
dF9wb2tlX2FyZWEpOw0KPiArc3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCBtbV9zdHJ1Y3Qg
KiwgY3B1X3BhdGNoaW5nX21tKTsNCj4gK3N0YXRpYyBERUZJTkVfUEVSX0NQVSh1bnNpZ25lZCBs
b25nLCBjcHVfcGF0Y2hpbmdfYWRkcik7DQo+ICtzdGF0aWMgREVGSU5FX1BFUl9DUFUocHRlX3Qg
KiwgY3B1X3BhdGNoaW5nX3B0ZSk7DQo+ICAgDQo+ICAgc3RhdGljIGludCBtYXBfcGF0Y2hfYXJl
YSh2b2lkICphZGRyLCB1bnNpZ25lZCBsb25nIHRleHRfcG9rZV9hZGRyKTsNCj4gICBzdGF0aWMg
dm9pZCB1bm1hcF9wYXRjaF9hcmVhKHVuc2lnbmVkIGxvbmcgYWRkcik7DQo+ICAgDQo+ICtzdGF0
aWMgYm9vbCBtbV9wYXRjaF9lbmFibGVkKHZvaWQpDQo+ICt7DQo+ICsJcmV0dXJuIElTX0VOQUJM
RUQoQ09ORklHX1NNUCkgJiYgcmFkaXhfZW5hYmxlZCgpOw0KPiArfQ0KPiArDQo+ICsvKg0KPiAr
ICogVGhlIGZvbGxvd2luZyBhcHBsaWVzIGZvciBSYWRpeCBNTVUuIEhhc2ggTU1VIGhhcyBkaWZm
ZXJlbnQgcmVxdWlyZW1lbnRzLA0KPiArICogYW5kIHNvIGlzIG5vdCBzdXBwb3J0ZWQuDQo+ICsg
Kg0KPiArICogQ2hhbmdpbmcgbW0gcmVxdWlyZXMgY29udGV4dCBzeW5jaHJvbmlzaW5nIGluc3Ry
dWN0aW9ucyBvbiBib3RoIHNpZGVzIG9mDQo+ICsgKiB0aGUgY29udGV4dCBzd2l0Y2gsIGFzIHdl
bGwgYXMgYSBod3N5bmMgYmV0d2VlbiB0aGUgbGFzdCBpbnN0cnVjdGlvbiBmb3INCj4gKyAqIHdo
aWNoIHRoZSBhZGRyZXNzIG9mIGFuIGFzc29jaWF0ZWQgc3RvcmFnZSBhY2Nlc3Mgd2FzIHRyYW5z
bGF0ZWQgdXNpbmcNCj4gKyAqIHRoZSBjdXJyZW50IGNvbnRleHQuDQo+ICsgKg0KPiArICogc3dp
dGNoX21tX2lycXNfb2ZmKCkgcGVyZm9ybXMgYW4gaXN5bmMgYWZ0ZXIgdGhlIGNvbnRleHQgc3dp
dGNoLiBJdCBpcw0KPiArICogdGhlIHJlc3BvbnNpYmlsaXR5IG9mIHRoZSBjYWxsZXIgdG8gcGVy
Zm9ybSB0aGUgQ1NJIGFuZCBod3N5bmMgYmVmb3JlDQo+ICsgKiBzdGFydGluZy9zdG9wcGluZyB0
aGUgdGVtcCBtbS4NCj4gKyAqLw0KPiArc3RhdGljIHN0cnVjdCBtbV9zdHJ1Y3QgKnN0YXJ0X3Vz
aW5nX3RlbXBfbW0oc3RydWN0IG1tX3N0cnVjdCAqdGVtcF9tbSkNCj4gK3sNCj4gKwlzdHJ1Y3Qg
bW1fc3RydWN0ICpvcmlnX21tID0gY3VycmVudC0+YWN0aXZlX21tOw0KPiArDQo+ICsJbG9ja2Rl
cF9hc3NlcnRfaXJxc19kaXNhYmxlZCgpOw0KPiArCXN3aXRjaF9tbV9pcnFzX29mZihvcmlnX21t
LCB0ZW1wX21tLCBjdXJyZW50KTsNCj4gKw0KPiArCVdBUk5fT04oIW1tX2lzX3RocmVhZF9sb2Nh
bCh0ZW1wX21tKSk7DQo+ICsNCj4gKwlzdXNwZW5kX2JyZWFrcG9pbnRzKCk7DQo+ICsJcmV0dXJu
IG9yaWdfbW07DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIHN0b3BfdXNpbmdfdGVtcF9tbShz
dHJ1Y3QgbW1fc3RydWN0ICp0ZW1wX21tLA0KPiArCQkJICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3Qg
Km9yaWdfbW0pDQo+ICt7DQo+ICsJbG9ja2RlcF9hc3NlcnRfaXJxc19kaXNhYmxlZCgpOw0KPiAr
CXN3aXRjaF9tbV9pcnFzX29mZih0ZW1wX21tLCBvcmlnX21tLCBjdXJyZW50KTsNCj4gKwlyZXN0
b3JlX2JyZWFrcG9pbnRzKCk7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgaW50IHRleHRfYXJlYV9j
cHVfdXAodW5zaWduZWQgaW50IGNwdSkNCj4gICB7DQo+ICAgCXN0cnVjdCB2bV9zdHJ1Y3QgKmFy
ZWE7DQo+IEBAIC04MCwxNCArMTI4LDEyNyBAQCBzdGF0aWMgaW50IHRleHRfYXJlYV9jcHVfZG93
bih1bnNpZ25lZCBpbnQgY3B1KQ0KPiAgIAlyZXR1cm4gMDsNCj4gICB9DQo+ICAgDQo+ICtzdGF0
aWMgaW50IHRleHRfYXJlYV9jcHVfdXBfbW0odW5zaWduZWQgaW50IGNwdSkNCj4gK3sNCj4gKwlz
dHJ1Y3QgbW1fc3RydWN0ICptbTsNCj4gKwl1bnNpZ25lZCBsb25nIGFkZHI7DQo+ICsJcGdkX3Qg
KnBnZHA7DQo+ICsJcDRkX3QgKnA0ZHA7DQo+ICsJcHVkX3QgKnB1ZHA7DQo+ICsJcG1kX3QgKnBt
ZHA7DQo+ICsJcHRlX3QgKnB0ZXA7DQo+ICsNCj4gKwltbSA9IGNvcHlfaW5pdF9tbSgpOw0KPiAr
CWlmIChXQVJOX09OKCFtbSkpDQo+ICsJCWdvdG8gZmFpbF9ub19tbTsNCj4gKw0KPiArCS8qDQo+
ICsJICogQ2hvb3NlIGEgcmFuZG9tIHBhZ2UtYWxpZ25lZCBhZGRyZXNzIGZyb20gdGhlIGludGVy
dmFsDQo+ICsJICogW1BBR0VfU0laRSAuLiBERUZBVUxUX01BUF9XSU5ET1cgLSBQQUdFX1NJWkVd
Lg0KPiArCSAqIFRoZSBsb3dlciBhZGRyZXNzIGJvdW5kIGlzIFBBR0VfU0laRSB0byBhdm9pZCB0
aGUgemVyby1wYWdlLg0KPiArCSAqLw0KPiArCWFkZHIgPSAoMSArIChnZXRfcmFuZG9tX2xvbmco
KSAlIChERUZBVUxUX01BUF9XSU5ET1cgLyBQQUdFX1NJWkUgLSAyKSkpIDw8IFBBR0VfU0hJRlQ7
DQoNClRoZXJlIGlzIHNvbWUgd29yayBpbiBwcm9ncmVzcyB0byBnZXQgcmlkIG9mIChnZXRfcmFu
ZG9tX2xvbmcoKSAlIA0Kc29tZXRoaW5nKSwgc2VlIA0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhL2NvdmVyLzIwMjIxMDEwMjMwNjEzLjEwNzY5MDUtMS1K
YXNvbkB6eDJjNC5jb20vDQoNCj4gKw0KPiArCS8qDQo+ICsJICogUFRFIGFsbG9jYXRpb24gdXNl
cyBHRlBfS0VSTkVMIHdoaWNoIG1lYW5zIHdlIG5lZWQgdG8NCj4gKwkgKiBwcmUtYWxsb2NhdGUg
dGhlIFBURSBoZXJlIGJlY2F1c2Ugd2UgY2Fubm90IGRvIHRoZQ0KPiArCSAqIGFsbG9jYXRpb24g
ZHVyaW5nIHBhdGNoaW5nIHdoZW4gSVJRcyBhcmUgZGlzYWJsZWQuDQo+ICsJICovDQo+ICsJcGdk
cCA9IHBnZF9vZmZzZXQobW0sIGFkZHIpOw0KPiArDQo+ICsJcDRkcCA9IHA0ZF9hbGxvYyhtbSwg
cGdkcCwgYWRkcik7DQo+ICsJaWYgKFdBUk5fT04oIXA0ZHApKQ0KPiArCQlnb3RvIGZhaWxfbm9f
cDRkOw0KPiArDQo+ICsJcHVkcCA9IHB1ZF9hbGxvYyhtbSwgcDRkcCwgYWRkcik7DQo+ICsJaWYg
KFdBUk5fT04oIXB1ZHApKQ0KPiArCQlnb3RvIGZhaWxfbm9fcHVkOw0KPiArDQo+ICsJcG1kcCA9
IHBtZF9hbGxvYyhtbSwgcHVkcCwgYWRkcik7DQo+ICsJaWYgKFdBUk5fT04oIXBtZHApKQ0KPiAr
CQlnb3RvIGZhaWxfbm9fcG1kOw0KPiArDQo+ICsJcHRlcCA9IHB0ZV9hbGxvY19tYXAobW0sIHBt
ZHAsIGFkZHIpOw0KPiArCWlmIChXQVJOX09OKCFwdGVwKSkNCj4gKwkJZ290byBmYWlsX25vX3B0
ZTsNCg0KSW5zbid0IHRoZXJlIHN0YW5kYXJkIGdlbmVyaWMgZnVuY3Rpb25zIHRvIGRvIHRoYXQg
Pw0KDQpGb3IgaW5zdGFuY2UsIF9fZ2V0X2xvY2tlZF9wdGUoKSBzZWVtcyB0byBkbyBtb3JlIG9y
IGxlc3MgdGhlIHNhbWUuDQoNCj4gKw0KPiArCXRoaXNfY3B1X3dyaXRlKGNwdV9wYXRjaGluZ19t
bSwgbW0pOw0KPiArCXRoaXNfY3B1X3dyaXRlKGNwdV9wYXRjaGluZ19hZGRyLCBhZGRyKTsNCj4g
Kwl0aGlzX2NwdV93cml0ZShjcHVfcGF0Y2hpbmdfcHRlLCBwdGVwKTsNCj4gKw0KPiArCXJldHVy
biAwOw0KPiArDQo+ICtmYWlsX25vX3B0ZToNCj4gKwlwbWRfZnJlZShtbSwgcG1kcCk7DQo+ICsJ
bW1fZGVjX25yX3BtZHMobW0pOw0KPiArZmFpbF9ub19wbWQ6DQo+ICsJcHVkX2ZyZWUobW0sIHB1
ZHApOw0KPiArCW1tX2RlY19ucl9wdWRzKG1tKTsNCj4gK2ZhaWxfbm9fcHVkOg0KPiArCXA0ZF9m
cmVlKHBhdGNoaW5nX21tLCBwNGRwKTsNCj4gK2ZhaWxfbm9fcDRkOg0KPiArCW1tcHV0KG1tKTsN
Cj4gK2ZhaWxfbm9fbW06DQo+ICsJcmV0dXJuIC1FTk9NRU07DQo+ICt9DQo+ICsNCj4gK3N0YXRp
YyBpbnQgdGV4dF9hcmVhX2NwdV9kb3duX21tKHVuc2lnbmVkIGludCBjcHUpDQo+ICt7DQo+ICsJ
c3RydWN0IG1tX3N0cnVjdCAqbW07DQo+ICsJdW5zaWduZWQgbG9uZyBhZGRyOw0KPiArCXB0ZV90
ICpwdGVwOw0KPiArCXBtZF90ICpwbWRwOw0KPiArCXB1ZF90ICpwdWRwOw0KPiArCXA0ZF90ICpw
NGRwOw0KPiArCXBnZF90ICpwZ2RwOw0KPiArDQo+ICsJbW0gPSB0aGlzX2NwdV9yZWFkKGNwdV9w
YXRjaGluZ19tbSk7DQo+ICsJYWRkciA9IHRoaXNfY3B1X3JlYWQoY3B1X3BhdGNoaW5nX2FkZHIp
Ow0KPiArDQo+ICsJcGdkcCA9IHBnZF9vZmZzZXQobW0sIGFkZHIpOw0KPiArCXA0ZHAgPSBwNGRf
b2Zmc2V0KHBnZHAsIGFkZHIpOw0KPiArCXB1ZHAgPSBwdWRfb2Zmc2V0KHA0ZHAsIGFkZHIpOw0K
PiArCXBtZHAgPSBwbWRfb2Zmc2V0KHB1ZHAsIGFkZHIpOw0KPiArCXB0ZXAgPSBwdGVfb2Zmc2V0
X21hcChwbWRwLCBhZGRyKTsNCj4gKw0KPiArCXB0ZV9mcmVlKG1tLCBwdGVwKTsNCj4gKwlwbWRf
ZnJlZShtbSwgcG1kcCk7DQo+ICsJcHVkX2ZyZWUobW0sIHB1ZHApOw0KPiArCXA0ZF9mcmVlKG1t
LCBwNGRwKTsNCj4gKwkvKiBwZ2QgaXMgZHJvcHBlZCBpbiBtbXB1dCAqLw0KPiArDQo+ICsJbW1f
ZGVjX25yX3B0ZXMobW0pOw0KPiArCW1tX2RlY19ucl9wbWRzKG1tKTsNCj4gKwltbV9kZWNfbnJf
cHVkcyhtbSk7DQoNClNhbWUgcXVlc3Rpb24sIGNhbid0IHNvbWV0aGluZyBnZW5lcmljIGJlIHVz
ZWQsIHNvbWV0aGluZyBsaWtlIA0KZnJlZV9wZ2RfcmFuZ2UoKSA/DQoNCj4gKw0KPiArCW1tcHV0
KG1tKTsNCj4gKw0KPiArCXRoaXNfY3B1X3dyaXRlKGNwdV9wYXRjaGluZ19tbSwgTlVMTCk7DQo+
ICsJdGhpc19jcHVfd3JpdGUoY3B1X3BhdGNoaW5nX2FkZHIsIDApOw0KPiArCXRoaXNfY3B1X3dy
aXRlKGNwdV9wYXRjaGluZ19wdGUsIE5VTEwpOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+
ICsNCj4gICBzdGF0aWMgX19yb19hZnRlcl9pbml0IERFRklORV9TVEFUSUNfS0VZX0ZBTFNFKHBv
a2luZ19pbml0X2RvbmUpOw0KPiAgIA0KPiAgIHZvaWQgX19pbml0IHBva2luZ19pbml0KHZvaWQp
DQo+ICAgew0KPiAtCVdBUk5fT04oY3B1aHBfc2V0dXBfc3RhdGUoQ1BVSFBfQVBfT05MSU5FX0RZ
TiwNCj4gLQkJCQkgICJwb3dlcnBjL3RleHRfcG9rZTpvbmxpbmUiLA0KPiAtCQkJCSAgdGV4dF9h
cmVhX2NwdV91cCwNCj4gLQkJCQkgIHRleHRfYXJlYV9jcHVfZG93bikgPCAwKTsNCj4gKwlpbnQg
cmV0Ow0KPiArDQo+ICsJaWYgKG1tX3BhdGNoX2VuYWJsZWQoKSkNCj4gKwkJcmV0ID0gY3B1aHBf
c2V0dXBfc3RhdGUoQ1BVSFBfQVBfT05MSU5FX0RZTiwNCj4gKwkJCQkJInBvd2VycGMvdGV4dF9w
b2tlX21tOm9ubGluZSIsDQo+ICsJCQkJCXRleHRfYXJlYV9jcHVfdXBfbW0sDQo+ICsJCQkJCXRl
eHRfYXJlYV9jcHVfZG93bl9tbSk7DQo+ICsJZWxzZQ0KPiArCQlyZXQgPSBjcHVocF9zZXR1cF9z
dGF0ZShDUFVIUF9BUF9PTkxJTkVfRFlOLA0KPiArCQkJCQkicG93ZXJwYy90ZXh0X3Bva2U6b25s
aW5lIiwNCj4gKwkJCQkJdGV4dF9hcmVhX2NwdV91cCwNCj4gKwkJCQkJdGV4dF9hcmVhX2NwdV9k
b3duKTsNCj4gKw0KPiArCS8qIGNwdWhwX3NldHVwX3N0YXRlIHJldHVybnMgPj0gMCBvbiBzdWNj
ZXNzICovDQo+ICsJV0FSTl9PTihyZXQgPCAwKTsNCj4gICANCj4gICAJc3RhdGljX2JyYW5jaF9l
bmFibGUoJnBva2luZ19pbml0X2RvbmUpOw0KPiAgIH0NCj4gQEAgLTE0NSw2ICszMDYsNTMgQEAg
c3RhdGljIHZvaWQgdW5tYXBfcGF0Y2hfYXJlYSh1bnNpZ25lZCBsb25nIGFkZHIpDQo+ICAgCWZs
dXNoX3RsYl9rZXJuZWxfcmFuZ2UoYWRkciwgYWRkciArIFBBR0VfU0laRSk7DQo+ICAgfQ0KPiAg
IA0KPiArc3RhdGljIGludCBfX2RvX3BhdGNoX2luc3RydWN0aW9uX21tKHUzMiAqYWRkciwgcHBj
X2luc3RfdCBpbnN0cikNCj4gK3sNCj4gKwlpbnQgZXJyOw0KPiArCXUzMiAqcGF0Y2hfYWRkcjsN
Cj4gKwl1bnNpZ25lZCBsb25nIHRleHRfcG9rZV9hZGRyOw0KPiArCXB0ZV90ICpwdGU7DQo+ICsJ
dW5zaWduZWQgbG9uZyBwZm4gPSBnZXRfcGF0Y2hfcGZuKGFkZHIpOw0KPiArCXN0cnVjdCBtbV9z
dHJ1Y3QgKnBhdGNoaW5nX21tOw0KPiArCXN0cnVjdCBtbV9zdHJ1Y3QgKm9yaWdfbW07DQo+ICsN
Cj4gKwlwYXRjaGluZ19tbSA9IF9fdGhpc19jcHVfcmVhZChjcHVfcGF0Y2hpbmdfbW0pOw0KPiAr
CXB0ZSA9IF9fdGhpc19jcHVfcmVhZChjcHVfcGF0Y2hpbmdfcHRlKTsNCj4gKwl0ZXh0X3Bva2Vf
YWRkciA9IF9fdGhpc19jcHVfcmVhZChjcHVfcGF0Y2hpbmdfYWRkcik7DQo+ICsJcGF0Y2hfYWRk
ciA9ICh1MzIgKikodGV4dF9wb2tlX2FkZHIgKyBvZmZzZXRfaW5fcGFnZShhZGRyKSk7DQo+ICsN
Cj4gKwlpZiAodW5saWtlbHkoIXBhdGNoaW5nX21tKSkNCj4gKwkJcmV0dXJuIC1FTk9NRU07DQo+
ICsNCj4gKwlzZXRfcHRlX2F0KHBhdGNoaW5nX21tLCB0ZXh0X3Bva2VfYWRkciwgcHRlLCBwZm5f
cHRlKHBmbiwgUEFHRV9LRVJORUwpKTsNCj4gKw0KPiArCS8qIG9yZGVyIFBURSB1cGRhdGUgYmVm
b3JlIHVzZSwgYWxzbyBzZXJ2ZXMgYXMgdGhlIGh3c3luYyAqLw0KPiArCWFzbSB2b2xhdGlsZSgi
cHRlc3luYyI6IDogOiJtZW1vcnkiKTsNCg0KWW91IGFzc3VtZSBpdCBpcyByYWRpeCBvbmx5ID8N
Cg0KPiArDQo+ICsJLyogb3JkZXIgY29udGV4dCBzd2l0Y2ggYWZ0ZXIgYXJiaXRyYXJ5IHByaW9y
IGNvZGUgKi8NCj4gKwlpc3luYygpOw0KPiArDQo+ICsJb3JpZ19tbSA9IHN0YXJ0X3VzaW5nX3Rl
bXBfbW0ocGF0Y2hpbmdfbW0pOw0KPiArDQo+ICsJZXJyID0gX19wYXRjaF9pbnN0cnVjdGlvbihh
ZGRyLCBpbnN0ciwgcGF0Y2hfYWRkcik7DQo+ICsNCj4gKwkvKiBod3N5bmMgcGVyZm9ybWVkIGJ5
IF9fcGF0Y2hfaW5zdHJ1Y3Rpb24gKHN5bmMpIGlmIHN1Y2Nlc3NmdWwgKi8NCj4gKwlpZiAoZXJy
KQ0KPiArCQltYigpOyAgLyogc3luYyAqLw0KPiArDQo+ICsJLyogY29udGV4dCBzeW5jaHJvbmlz
YXRpb24gcGVyZm9ybWVkIGJ5IF9fcGF0Y2hfaW5zdHJ1Y3Rpb24gKGlzeW5jIG9yIGV4Y2VwdGlv
bikgKi8NCj4gKwlzdG9wX3VzaW5nX3RlbXBfbW0ocGF0Y2hpbmdfbW0sIG9yaWdfbW0pOw0KPiAr
DQo+ICsJcHRlX2NsZWFyKHBhdGNoaW5nX21tLCB0ZXh0X3Bva2VfYWRkciwgcHRlKTsNCj4gKwkv
Kg0KPiArCSAqIHB0ZXN5bmMgdG8gb3JkZXIgUFRFIHVwZGF0ZSBiZWZvcmUgVExCIGludmFsaWRh
dGlvbiBkb25lDQo+ICsJICogYnkgcmFkaXhfX2xvY2FsX2ZsdXNoX3RsYl9wYWdlX3BzaXplIChp
biBfdGxiaWVsX3ZhKQ0KPiArCSAqLw0KPiArCWxvY2FsX2ZsdXNoX3RsYl9wYWdlX3BzaXplKHBh
dGNoaW5nX21tLCB0ZXh0X3Bva2VfYWRkciwgbW11X3ZpcnR1YWxfcHNpemUpOw0KPiArDQo+ICsJ
cmV0dXJuIGVycjsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBpbnQgX19kb19wYXRjaF9pbnN0cnVj
dGlvbih1MzIgKmFkZHIsIHBwY19pbnN0X3QgaW5zdHIpDQo+ICAgew0KPiAgIAlpbnQgZXJyOw0K
PiBAQCAtMTg5LDcgKzM5NywxMCBAQCBzdGF0aWMgaW50IGRvX3BhdGNoX2luc3RydWN0aW9uKHUz
MiAqYWRkciwgcHBjX2luc3RfdCBpbnN0cikNCj4gICAJCXJldHVybiByYXdfcGF0Y2hfaW5zdHJ1
Y3Rpb24oYWRkciwgaW5zdHIpOw0KPiAgIA0KPiAgIAlsb2NhbF9pcnFfc2F2ZShmbGFncyk7DQo+
IC0JZXJyID0gX19kb19wYXRjaF9pbnN0cnVjdGlvbihhZGRyLCBpbnN0cik7DQo+ICsJaWYgKG1t
X3BhdGNoX2VuYWJsZWQoKSkNCj4gKwkJZXJyID0gX19kb19wYXRjaF9pbnN0cnVjdGlvbl9tbShh
ZGRyLCBpbnN0cik7DQo+ICsJZWxzZQ0KPiArCQllcnIgPSBfX2RvX3BhdGNoX2luc3RydWN0aW9u
KGFkZHIsIGluc3RyKTsNCj4gICAJbG9jYWxfaXJxX3Jlc3RvcmUoZmxhZ3MpOw0KPiAgIA0KPiAg
IAlXQVJOX09OKCFlcnIgJiYgIXBwY19pbnN0X2VxdWFsKGluc3RyLCBwcGNfaW5zdF9yZWFkKGFk
ZHIpKSk7
