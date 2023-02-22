Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B947E69F213
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 10:46:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMB9j42Vtz3cHX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 20:46:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=RhPFln+p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::616; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=RhPFln+p;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMB8n0rHRz30CT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 20:45:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkSmANhqqv+5CaV/ep44Wps7hhxVhnXwUY7FMIBY4Kro6XHtUqZUCu1BM00dJDTUKmIhS0smgSxRVrtp/tDus9HrWoACJMOPlehj99o+D2lEOaHL19RMGDBLIryscXkujaVYOXfEAICZacRSxnlBsyYEunWnqoNgwSh//ShiXkUNGo5XodkuwyYswGmvjZZXonKQzOw6S+e+bp2YuMelGwXJR9f+wub4g9SBemr4WfMZ3RmaqNYunLS++Nwy3Spx5hoh9Q8tCQcmk7hkkXLdNMeWA5dq28DAxrqCE9fA49CkTMyrjPGcKGarf/0eMxPEM3OEIij9fywIIqLlnWgd6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwlfBhLx8v9j4iOSkQNZCs6U8qok6D/oLrEjs+yBdUE=;
 b=ArL86oD1RGzs+FkcTd9UqkkI7OqfkBsH1PWttARz9o4aUWKko+4ILEQYQLm4e6BCRvJV3GVOqM1dEKxO6TNnY88oY9XQ8DBqCO7gzxI4d+9R7+PIcqAOC8BNX0sLbVIUCe3Uue3D4kR+NX+RUPkoI+46AHKYA4Zl9wYQmHQm396Exlp6HVZg4lCU1Ks4DcxUaCBzMsZXxAns4vL0hXZhYZI05cZvuqeSb9AMxAc+6QVmHpp61tosxacx3s+ZIc55umB5OOdpSl9O6dyaJ8uVcEQJ9+Ad/INj8sv3bQNJziV9E60ehXSvKdqXf6qfZDec4UbOJqWDz/0qemuPdjpq3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwlfBhLx8v9j4iOSkQNZCs6U8qok6D/oLrEjs+yBdUE=;
 b=RhPFln+p/7cjRLXU51XBymnFAcuKSRjZ0JPSclEuOBkXe2zzUEOLsa63Kvtl58oFYlouIhqvFbOhTxyk0daBxevDhHcPe7BokWxS934fMLI+dcOVOSYYxL3D63PPvyNj3lIRsxoMOK6eepXLryQsHDnp5Mb7NFBNbjoFF1+8XfcrKnwUPVRxeVIEa5OovWt+BvmmD9g7IUJoJV+Maks5DiOXF8kjr7rHAt8SY+un4Rpjj9bNQ5vOgihmRSzCN6U+NlpwpcTCco2SKSViSfsFmx9mlYJJZ7XfHJjeqg1GXGlyreq4PbO5hvwSfB0Fxg3pwBR4WD/jCMWAf8mnQSFLqQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1783.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:16::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 09:44:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 09:44:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Rohan McLure
	<rmclure@linux.ibm.com>
Subject: Re: [PATCH v2] arch/powerpc/include/asm/barrier.h: redefine rmb and
 wmb to lwsync
Thread-Topic: [PATCH v2] arch/powerpc/include/asm/barrier.h: redefine rmb and
 wmb to lwsync
Thread-Index: AQHZRqJRhRqsO1SkrUOVujnHacYAfw==
Date: Wed, 22 Feb 2023 09:44:54 +0000
Message-ID: <b20a6e0e-f421-6b83-dbec-c0177e60db16@csgroup.eu>
References: <20230222090344.189270-1-kconsul@linux.vnet.ibm.com>
 <Y/XgrU9RhuaGCLHp@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
In-Reply-To:  <Y/XgrU9RhuaGCLHp@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1783:EE_
x-ms-office365-filtering-correlation-id: 5f234cde-6d5e-4fdc-2339-08db14b9738c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  MHkDig/nnT42fOA7cMXpld3hWntiMjLfHUQHIMvsrGzww56+5HdG4yJJUjD6LA0ODvFUd7zvNnlNiJNtV1OHGT3CPY0xkXCy0Hote0r08f5PDbNHBnBnGbasutb67klXQiMsdjvsVcpZfl47RRGBFe3lgilYZUImA5sp5WO2nwCV9131M4f6trGY8Zzo8dxT0S3ZQpp66sfaTTmY0Q6Luv9U8z45SZN/WiE6DLJ4Z0FOQP/MrwexE8azN9BW+IVHTGzJZ5Jcs5qpxKB+7wZUfutqb2cv+zuojRzy3xkWoYDStJ0HVp6R5bJOxnnlM3OZmx5RdnuGaidfe3RFktaSVqKwXVDlbeP5ctjOuFVNW3BhiRZyUM2syqEO50Nzn+IGEMXwOL95hicBJOy2K+3Z1gaMIa4ie0Ef5+SvxOalcSxvIeaNt4kXpUW7gssvgubffAyx1cBGwOoIip51TOSSRQKwKsSDGGyn7Hs9skbco3EuIeru6xfpCZUnooQmJbKSVPJDR4r3TWGw4pIt0LGTp2Z16WZXs65EFCMToycMe6gy1+S30BD0XMkIAzcGUE1//+otdX/TuyNy22rxjAwC4KWEtKznOzwmzxkCBLrymwQfAhVP0uGDUG+V9qJQmg2LnR6ES0Il6SpV4vpXMmjcTvlBsTrOwdDjZ5A3UMdZVDF+My5p/mJLnwzLohMUOwXQhPr6VoSicXy51VFCtVp3qSM70etiCnoysPr4N0zoy0i8qPs8OGNhPFBk7Hdjci+Eju/4jSZ1FTq/YZuehiJk8w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(346002)(39850400004)(136003)(376002)(451199018)(558084003)(36756003)(71200400001)(6506007)(186003)(6512007)(26005)(6486002)(2616005)(478600001)(31696002)(41300700001)(4326008)(91956017)(8676002)(44832011)(76116006)(66556008)(86362001)(66946007)(64756008)(66446008)(66476007)(2906002)(5660300002)(8936002)(122000001)(38100700002)(54906003)(110136005)(316002)(38070700005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dTVYM0svanhJdGZ2UzM0MUJMSzYzSkZUeTdiV3I3REJNVVpaME1HV2FFUEZN?=
 =?utf-8?B?Nng2Rm1ONWdXd1pBQS8wUzluLzVxTmNFdXEwbE9mTVV3dkEybjZ1R1F3UWxy?=
 =?utf-8?B?a2NWVGpBTzc3bUkyYXpyQjhMVjFJV0dmS3A2UEhra0FSemJIWHZEaUNXRzAy?=
 =?utf-8?B?aEdnd01sQ1B2UjJSSSs2VVZaUjQ1blIybWNUempadjgwbys2dXZndU0rYjFm?=
 =?utf-8?B?eHpic1hMMHdOdHUvc09ycjZJb3lQamVZeWNIUGVlSGZOTXN4ekJBb0IrNENC?=
 =?utf-8?B?RXp2U3p5V1ZPWStnN09sdTV2c0MvajZ4VTVmOEkveUUwbE9oRGhjbFNWZjVl?=
 =?utf-8?B?SGdyeUxTOFM4VitURTV4NzdZSTZ0RFJ5NEJhN05pbFBjd253TG5rUFRGaFhH?=
 =?utf-8?B?dWhpVDhXYlBTS0lZUHNaQVNoZkRDRkhLYmJJV0lmNnh4SjlhTVNpcUMyRmpw?=
 =?utf-8?B?TExlb3dlQnN3aWVOUWVDb0xBbi9wTFI0ZzlSMDM0QmoraTVRelA1bFUrSjFa?=
 =?utf-8?B?L3lnN0JYOWRpcEdTVTByaXpSNGQ3a1N2QUdWV253M0NvL0hVMXFLbEViQkNT?=
 =?utf-8?B?UnBHalpBUkpGRmMyTFZsT3pobVp3eFhRbGxsWmY1OEFuZG9SQ3FJaDdsZE1F?=
 =?utf-8?B?MHJQc0paQWZyY2tsQjFpOWZGQkhCT0U0ZThKcHkwMWFsYUFCSEFLWlUvcjNm?=
 =?utf-8?B?NGZSaGRyY3JUOWUxc005WW9iRTNMcUFSQlNpNEJSYWdEV2NHTVVlK25GRXRU?=
 =?utf-8?B?YnFJemFKYVFzSFEvRG9XcUZHZ1dzUTdKZjFCNFozMzhyYnhmeHN3UTVKRUVP?=
 =?utf-8?B?OVNYRTlJZDdkR0tlWEpxVFh5WFJrZ3ZTK0pPelNnbldrWDhES3RTZ0RuZnZ4?=
 =?utf-8?B?aGJuVTgvbE5uVlVELzl3eis2WkhYZ1lSSGkyTDZiL3BBSUdPZ2l6aThJRGsw?=
 =?utf-8?B?NkdidStWMlZMZi9GZzE2VDdpdHFVeXFKWk53a1RrM2FSVHBtQ3ZHMi92U1Jv?=
 =?utf-8?B?WVpSNXdrWVhBbytvVGxtNElISjZUNDNmVEtrU0o3K2Q0amtEK3lMQkpzNHc4?=
 =?utf-8?B?R1FwOEVrRnFhQXZEOUZma0puV0VLUlhYem45TU82bDFodFJ0RTdVSHZ3aS9L?=
 =?utf-8?B?WlpiUWhLcXJlTVExQTdHZDZ0NnpJa2ZMNlBJRWYxeWtGTnc4b01JUkt3cDk5?=
 =?utf-8?B?OFc5OHlmdCtnUWxrR3dEYy9YbTdZdXJ1TFlEQ3lxR3lZRU5KUFFBemIzLzVF?=
 =?utf-8?B?b1lnWHZsQlpBOEdHREwrOEVmbUdVTnhtaDlFMVRIamFoTWpIaDNFb3lpOEFR?=
 =?utf-8?B?blcvMzR3TWVNeGxWWUpIN1JhNldLdmh1cE1wanJzNjMrcTdaWlNRMWVjeDFj?=
 =?utf-8?B?RlYxNXdNUHdDWHFkY3RPb1kvY1MwOEdOOHJERWx3d0h6NDJMRUFHZHFWVFFt?=
 =?utf-8?B?ZDlQR1JOTSt3L3Y3OFVtSDhoT1pvL3NTMEpPL1RxdUZKb3lZbDBVNHFXb3la?=
 =?utf-8?B?UDlyM3E4YWh3VmxFeHZzZlJxSnFwelltQklnL2ZKbDhOOGxWUWlQQVl1V2xH?=
 =?utf-8?B?a3Ywakc1V2dSTTVYQlJBMzFadlJpTklGSVhac05MYzFBbk1xeUg3cVNudEow?=
 =?utf-8?B?MHBzWFQzQ0ttQ2lzQ2tRRjlaaWtjZDdNeTVTUXkrNk9qaU5lMlIxdVIrNXdG?=
 =?utf-8?B?SkZLVmJORG1pS0dHdStOZHF4TGphRlQ5V0t6VEl4K1BOckcyRVFEWml1VHR2?=
 =?utf-8?B?MVZTMXlyTG9HZXNYd2lWMlhVTkZqSGdpRmU1S2lJTGliZUtYVWo1bUd3b3M0?=
 =?utf-8?B?V3JJNHo0LzRjRTc5bzlucThleU1seUVhTWh1Z0QwSG1pS0ZuZlBmdU5YZS9M?=
 =?utf-8?B?dHVUNWlmODdYcXRTQWJwRngrN0NSam9iTzBhRVdPMmpvdHFXYkhQRDFQZ3JF?=
 =?utf-8?B?TVB2ZG9scDZ0T3JMQ2NqYkRpMWdUUVd6bkw1aE9ac1hLemFrbDVUTWZiRGxH?=
 =?utf-8?B?bzc1QzJhQm1udzFzRWluWlBPYWdGa1BVakhGOC81NUVlYjZQZDRzb0VUeUdZ?=
 =?utf-8?B?ZER6MTBpc2ZLMml6ejQ1cGRhcnVhVEtIY3FJVG96UjBkVzhybEgxRWxkUGh5?=
 =?utf-8?B?RjRkdDFjWEdhSkNEVHBnL0xIUytKeVRETGdjdmh5SkVPdUVQNEdlclFrUlVp?=
 =?utf-8?B?MkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6363F314C168144CA6528669F5D945C5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f234cde-6d5e-4fdc-2339-08db14b9738c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 09:44:54.2501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xYhdD3y/Saw+JOqer7m6coHSEF7Ge4aEB56zRrdxkb+63ij80R68wP1w0OU8tY59M1HLEKjm5h+Rja6z/eJk0QwYFcvSQAbIhRX5Z9Ehjkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1783
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

DQoNCkxlIDIyLzAyLzIwMjMgw6AgMTA6MzAsIEthdXR1ayBDb25zdWwgYSDDqWNyaXTCoDoNCj4g
QWdhaW4sIGNvdWxkIHNvbWUgSUJNL25vbi1JQk0gZW1wbG95ZWVzIGRvIGJhc2ljIHNhbml0eSBr
ZXJuZWwgbG9hZA0KPiB0ZXN0aW5nIG9uIFBQQzY0IFVQIGFuZCBTTVAgc3lzdGVtcyBmb3IgdGhp
cyBwYXRjaD8NCj4gd291bGQgZGVlcGx5IGFwcHJlY2lhdGUgaXQhIDotKQ0KDQpBbmQgY2FuICdu
b24tSUJNJyAnbm9uIGVtcGxveWVlcycgZG8gc29tZXRoaW5nID8gOikNCg0KPiANCj4gVGhhbmtz
IGFnYWluIQ0KPiANCg0KRGlkIHlvdSB0cnkgb24gUUVNVSA/DQo=
