Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id E868E8D33C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 11:56:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ZIHyxV7+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq4Q92Tjxz79qB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 19:50:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ZIHyxV7+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq4PN5zkXz79Fr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 19:50:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzAFNTLf9dlIjOqVe4EHmFP3cogB/Ljl1Jc9iCcDZU6SWES50HcTATT2j7kBQQauDYGCDp8DIm/WMvBBdnUqT0VDSt30gCOeB3Mp2GyDcbkXvysPovw5MYVvwLhrz33jB4PvPr39lotvxW4zX/P9IO75I93zxmjZa6eSs+1Y5cvn8NMNna7TLg9/Mnm91deVb6zfTiVKgz9lP1rlYhlIiW+u94/8giSsZJ3KmnFkScV7iALVPFmC2edpCmLdw3JWvq4IhpjCZsYkQir/f1m255y5TEL+w33UN14dapOCu6muHH/HCP3Qq2WdgPgDDSOze4SOBmjWncutV3xWAYvEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sM/MIu3b1M0dEjIOPcgrhVJDwPrFyJOVajnvIlExLyQ=;
 b=M+uP07/ttisHUDZ1pGY6sc7FKrQOu8AzFgRbTlXibNWst/XCl6Ir8QJ3GMhEmjU1hxoMj4XLLLj7rQZhrIWUXiN0bBkPgzOdNLdcptouU+4tQzmUuwXSRtKcvedMU7DKaMG0kifAYhULlmESD5IpytP7BpOy7huj/iHn+jQqeDxS9RFav90MZ2XHm8pxVWIeTHfKvClmTDMDs2axzxW6pAUpDT1XR1pxFHF7AEcibB6CJoZjqYzRPNigCPugQIKibXuzVxDk5wbql6aGV7MDQ/TxZ/0wi372cICRRGyhWYg+hqMreTehWLy/fJ0NS1dZZXmzJHjbpo2jUgQxtDQXtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sM/MIu3b1M0dEjIOPcgrhVJDwPrFyJOVajnvIlExLyQ=;
 b=ZIHyxV7+Vjcvdmnsc5/HIna6AVLgy/E265iBTWOSLgu2iyp8ZxYgaalYpnn2K5xSFuwS2ZmPUrufX4PTLNixSu/+KHboF2eVoDyHp2LdkM0i9Q6ZPSyFl8bBSvcLi99KgbDM8iKHPobpTS/k4b1F+KvF+xft/mxKDxz3h4SbRucvWOg0rW6cCts6XF5+En/Xuva0xR4pPHWiUs9jjPDW+WrqZPnK/Vp4QltT6IKqxGLQN4Yt5CkOmlzY68kVm6E66qa1OLS49RupHXliur3eSB+ANPLXTb/Tvh53z3xdc8C2fkmsichqxlLnrVCd1ORzhxziZqrJ2YCXscQgp2aQyA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2066.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Wed, 29 May
 2024 09:49:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 09:49:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Oscar Salvador <osalvador@suse.com>
Subject: Re: [RFC PATCH v4 12/16] powerpc/e500: Encode hugepage size in PTE
 bits
Thread-Topic: [RFC PATCH v4 12/16] powerpc/e500: Encode hugepage size in PTE
 bits
Thread-Index: AQHasDoWurSZr4P1LUWMZLgcwbrJ/LGt3ZwAgAAdBQA=
Date: Wed, 29 May 2024 09:49:48 +0000
Message-ID: <3cf95f5e-cc8b-4417-a3fa-80dc3b24ac63@csgroup.eu>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
 <10eae3c6815e3aba5f624af92321948e4684c95a.1716815901.git.christophe.leroy@csgroup.eu>
 <Zlbh5Bwsx7WqEEWr@localhost.localdomain>
In-Reply-To: <Zlbh5Bwsx7WqEEWr@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2066:EE_
x-ms-office365-filtering-correlation-id: 68fdf942-8bb2-4e3a-db53-08dc7fc4adde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?ZFBkUldLTmJkeGQ2ejBoYlhFazlGSmlFOE9jdGphUGRQMGlUemJvUzI0S1ow?=
 =?utf-8?B?UkZQR1dXdEx0bi9Rb3BYbVlPNXFxV3BSK0ZtcHArY3JlY0g5dFFmR1QydEYx?=
 =?utf-8?B?QmtmZGhLdkg1QUExMUFFNGNsYTFXYkxsZENKL041d1VnR240OEI2a2I5dXlm?=
 =?utf-8?B?dUtsSXNXL3B1S2oxL0JtcTcxeXRaR2NkenQ4Vnc2dUVoSG9LcHhydnBxTXMx?=
 =?utf-8?B?SnZDc0NtVkhPVGFFdFkxR1ptRE5UQmV2eFNVelJKanUwNmtkaUFNQ21uR0xN?=
 =?utf-8?B?S092aGo3Q01OK1Zxc2Z5ZmRQQU1GbElhQklmcWRVcm5vQlVmS1NOemtocy9R?=
 =?utf-8?B?TTZMOTNzRGdPSzM4dm14dW56dkxXRE5rVzVRUEFNMjVTVWxjSkVveE15aWZH?=
 =?utf-8?B?Q0NkQUh1NFdsbEdpL2xxZHVvMFkzQnpWb21OcDhWbEh1U0Z3N3RTQXJXL0Jy?=
 =?utf-8?B?SXVyZENUVmx4Si9PbDNUQnNQNmR2and6WnpuTHBaZWxYeTRkaXIvRlM2WWIy?=
 =?utf-8?B?allsS2VwVE1xNnFJRU5YWWZBQUpWMkRXazlNT2I4UFlMdzZRaGRlNTBWS2px?=
 =?utf-8?B?bEplVUhjOVJCa1RKWGxJNVBwd056aU9RaHZUNUxIUHljdkFLRkc4TDZaTTBp?=
 =?utf-8?B?bkRnMVRhSmhRYVByeVJHY3E2bGpXVGU5RFpvOUhTUjNTT0lSK1R4Q1pjU0J1?=
 =?utf-8?B?QlpVRXU5c1M4N0RsNkVGOEYybWpmTlJQMnpmNm5vWks1cmZueis4a1dMMzR3?=
 =?utf-8?B?UDhGeFdkUDVYVmhYQTErMkpZbmpFblVaVHZONElWaVA2V2FmNHRJRGJtT0Uw?=
 =?utf-8?B?S2lqblllR3BJZUtCTWF0ZzhubnJ3bVhTQ211elJPVi9wc3ptWTR4RGdlYWg4?=
 =?utf-8?B?QVloZjFnWUc1UVpTT2JJRW96eUNuNHZBUFY2Qm1pUFF2KzhLK3kzRThJeVlF?=
 =?utf-8?B?emRRQ1NRQWd4N0dUMmxRUVdTL212ajVaVlYvU3RsWDNqOXRKaXU2a1VoSUxh?=
 =?utf-8?B?a0JLVllHb2psKy9raEovNVhTTUpQZ0h2WlNRbEFpUEFQWUI1TDRnNUM3RHdR?=
 =?utf-8?B?OWNmbnEvSzB0Qy83UUMvK29nbERUbVNoYTI2WWhpYW9sWmROWVF2cTlVeXh4?=
 =?utf-8?B?WnJ1aWFYUzVpSHdUUGNGNVZtV0x1dk5BeWE3dS9yZlQxUDR6MVZWbWFJZ2JT?=
 =?utf-8?B?WmpQV1FkT0ErZkdTVndWZll4TGdZdE80RXRhZDhPb3BUQ3RtNXVPNWQxdTBC?=
 =?utf-8?B?djN5ZkJRT29KdXl1dlQyYW9LWU04NWxVN3VCMUk0WFovWUl6RE44aGwveGpZ?=
 =?utf-8?B?UTRHN2xjbkp2WVRiVkkzZlJGZDNaT295UzZUUndkWElPSGZFZjFDTjhqTGpa?=
 =?utf-8?B?NVh6SzN4OGNQdVl6ekJ4bWJFUnZZUTNDSUgyUWNBL3lzaDJVYXVXMThXeGlr?=
 =?utf-8?B?YUJ2RzdpTTRqVHZONzR3TFVSZmxFUGlrQlZYN2dkVGlUeUYvNERKdG9raHU2?=
 =?utf-8?B?UUV2Vy9hMmRDSm0rWHliYTlLdkNqSi9FMWREYVIwNTZSQVZPWFNyWFA2MmFt?=
 =?utf-8?B?TXBwblQ4WGt3WVcvY21YbmJiVDBFL1pXWXc3NnpueEFzMjFQRjAwU3lCajYv?=
 =?utf-8?B?a1RLS215bmtnaDh4R1NzZngrTVREWHhZd0VSeHlhZ1F0dDREcE83bVVsMnZR?=
 =?utf-8?B?OW9mLzFadnEwdmFjMVZHd0hIRTg3OS9pSXVrWDZPRDkzL1pZbklKazViVTlP?=
 =?utf-8?B?b2FXRGdVbFNlR25wc1l4YWlHa3d6WW9KaUVoU2dlOTJ6TVhFRUloNVA4a1JH?=
 =?utf-8?B?cmxrMEVaREN2dFBaVWFBUT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bE1EQ0VxU2FxUnBMbWs2T0grSHhYTW92ZElRQlMraExnTnZ4a2xzWWNlSThy?=
 =?utf-8?B?aWtDZjNqY3NVa1JVSnYvOUVNMnM1NVRWbTRwQUJuNEl4WUJ2TXFhWFJqK1Jp?=
 =?utf-8?B?Unh0T2E4RDhyTlBuR1l3ZklhcWsyeU01c01BM0FHRTFwc0tDWm5jdnhoelBC?=
 =?utf-8?B?dTZLWWVnWEJIU0xnMHJTbmlJa2RPWXdTazJhdXFLb2RlSUJZRjBDRDhwQmJT?=
 =?utf-8?B?YmFrZFkzY3h3M0JKbkFOTWZpcnFZVGNLWWhIdC8ybkdwUk5yQzhsc2plUmJX?=
 =?utf-8?B?dUF2ZW9NY0VYOEwyMEZsY1B3SkV0TXppMDdHb2tJTkhKWlk5Q1BwWFFxMlFn?=
 =?utf-8?B?alZvaW15c2FqdGp6dS9YRTZTUmlzOFVpVUhJcHFoVmZaSEtqZEtCMVZpWnV1?=
 =?utf-8?B?bXE5MEdJK1EzMk5CbXFBWHJybjY3SGFCb294V1U0VlRPRlgyTHFYd1l6VThz?=
 =?utf-8?B?N1dYeHRHNUQzd3F0T2dQRnIzUS83eHVGN0pSZUt1dEttUk0yNDdYeXZaeDFl?=
 =?utf-8?B?RVNUUlVrZTVUTHFiRTlMMjIrNmlvNzVTTlVxTVpmZm9hclQxTjdiRzFJaW1M?=
 =?utf-8?B?QUNsMEQ2TTBWRVd1N0lnUGtKVktjTE9yaS9kRG9FTnluSERzWFN0N1cxc1F4?=
 =?utf-8?B?VFN2bjFXc1BUcDY0Z0RPRkZHSzd5M2J6TmUyRmJ3dENxK3RoVFdKWnF4RzNB?=
 =?utf-8?B?UkdRL1BmZEtsQnprY3BYUFFQTlFMWEZoUHhrbDdZWksxNE1UTzZyL2pmWU5h?=
 =?utf-8?B?VlU3NDZQRitkckxMTDlSSXJ2N09pTUcyREc4dmFBODZmRmFlbzdzc2xYOTVI?=
 =?utf-8?B?eDFNK1NSR0YzNllTWVdtMEZicW9QWXBwcndYS2VaNnZ2OVVGcjVNYXVwZG9S?=
 =?utf-8?B?RzZrZm9mNC82bzNXZGdSVHFWT3hQMGl6SHMra2JOeVZPV256TnIrdEFOdi9p?=
 =?utf-8?B?NDIrVXZFR3k2MGExRFJVNzdkRGNnOUlMTzhWRFpob2xMNGNnbEQ2bUtOMzJU?=
 =?utf-8?B?RElJMitDd3Nac1RadjNLblJGT3FjSVJEb0JaaGVjdTZWZEwxZXZrbFA4ZkZM?=
 =?utf-8?B?SXkzeE10MEt5T0hlTlRSemxBRzVUbndxUEVhR2RlNnpTWkxHV0Q1bjMzSVVT?=
 =?utf-8?B?RzQ0b2hoVVZicVRkNUNuM2RXNFJQZHFrSU5KYWl6RGxyeDJoYi9pYVNHdVRN?=
 =?utf-8?B?ZXpvZUQrd1NEVTRjOXU3bWdpZlpnUzlpVmRwcGtNQWd6ZmVNT0FWTHpjaDNC?=
 =?utf-8?B?RVU4eVA4RGUxYU0yR2xEN1lxQXV3cDRoS1E4QzNxcmx4VnBISUhSRFJQdjNr?=
 =?utf-8?B?akIxSEdXRVNnQTNZSVlwNVhoTnJDUDFTRm9kcHhMbkJwTFNzRGptbGJ1RmpH?=
 =?utf-8?B?b1crU3I2VXlnK0NWWEhPKzlkRjM4Rkl0cFdQR2JLeXgrNURva3c3cHJEVFly?=
 =?utf-8?B?MktwTTZpQUhiT0lJdWVNdmVCc0RZOThkQnVzdEc5M1NBT3lPMWVJK25xdHdH?=
 =?utf-8?B?VEtwVWhaelJ6Sk5XTFBML0JubEpRWTVzaUZOMEV4QnhvSEhuTjdVL21aOEtj?=
 =?utf-8?B?VFRoZlJYVXFXTWZOeG5EaGtlQjJEdnQrVVU0SE5CVFgxWkN0eUtUWHNCdnAw?=
 =?utf-8?B?Nkl3Z21IakJraiszeE1ma3dXWktibTZmQ2JIWDc4Vzk0SHUweGlBeVhxU0k0?=
 =?utf-8?B?S3JuN0V4VFRXWW1CR0s5RUprZERWMFlab3ZkYU9ad2ZGRjZpV1BMbEFSL0Y5?=
 =?utf-8?B?R0ZhelNUNjdTajM1YlhNOW92cm5BdWNOeHdqb1Q1Nk5aUURRZzBPc0E0ckdM?=
 =?utf-8?B?MzQwV0Vpbkt3eld3MjhFVXZnOVNadkNjakdrVENld29yL0pDakwyMWlBMnd3?=
 =?utf-8?B?MFc2SWtON3U1MFZHenFoeFZ3Y0NDUEM4aUNDeHdhNHU0bHo4N1ZIM0RnWkdX?=
 =?utf-8?B?Wml6OGkrT0R3Y0xlVDVlaElSdnFQemxKdG9ySGhFYjhORlRjcXJEcFgzNkNi?=
 =?utf-8?B?ZjlaNUZkaG5sZTV2SG5UeFVEcVhRWkt0U3NkQ1VwbXZBNnFXVzVNdU40ZllB?=
 =?utf-8?B?YzcvSWs3WHU5bmh5MU1uK2I3aytyT3RycXpVMUhaOWFMN0YzbHYyODlWK2lw?=
 =?utf-8?Q?9GMQmoRgbjDJGJTqYPk+O8Hw9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4E597EACE6C4744A4454617BE80C77E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 68fdf942-8bb2-4e3a-db53-08dc7fc4adde
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 09:49:48.6936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +T/WVWMa/JT3N/QoB+yN0E7h1iLNrJ292KVLF7lOXt8VhAmyKuNiuvePZjLvm5g5dT23cYXADTne6Yp7hTa9P2Vuhj7n/aTflgsoHPPwiWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2066
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA1LzIwMjQgw6AgMTA6MDUsIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+
IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIG9zYWx2YWRvckBz
dXNlLmNvbS4gRD9jb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCA/IGh0dHBzOi8v
YWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBPbiBNb24sIE1h
eSAyNywgMjAyNCBhdCAwMzozMDoxMFBNICswMjAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0K
Pj4gVXNlIFUwLVUzIGJpdHMgdG8gZW5jb2RlIGh1Z2VwYWdlIHNpemUsIG1vcmUgZXhhY3RseSBw
YWdlIHNoaWZ0Lg0KPj4NCj4+IEFzIHdlIHN0YXJ0IHVzaW5nIGh1Z2VwYWdlcyBhdCBzaGlmdCAy
MSAoMk1ieXRlcyksIHN1YnN0cmFjdCAyMA0KPj4gc28gdGhhdCBpdCBmaXRzIGludG8gNCBiaXRz
LiBUaGF0IG1heSBjaGFuZ2UgaW4gdGhlIGZ1dHVyZSBpZg0KPj4gd2Ugd2FudCB0byB1c2Ugc21h
bGxlciBodWdlcGFnZXMuDQo+IA0KPiBXaGF0IG90aGVyIHNoaWZ0cyB3ZSBjYW4gaGF2ZSBoZXJl
IG9uIGU1MDA/IFBVRF9TSElGVD8NCg0KRG9lc24ndCByZWFsbHkgbWF0dGVyIGlmIGl0J3MgUFVE
IG9yIFBNRCBhdCB0aGlzIHBvaW50LiBPbiBhIDMyIGJpdHMgDQprZXJuZWwgaXQgd2lsbCBiZSBh
bGwgUE1EIHdoaWxlIG9uIGEgNjQgYml0cyBrZXJuZWwgaXQgaXMgYm90aCBQTUQgYW5kIFBVRC4N
Cg0KQXQgdGhlIHRpbWUgYmVpbmcgKGFzIGltcGxlbWVudGVkIHdpdGggaHVnZXBkKSwgTGludXgg
c3VwcG9ydCA0TSwgMTZNLCANCjY0TSwgMjU2TSBhbmQgMUcgKFNoaWZ0cyAyMiwgMjQsIDI2LCAy
OCwgMzApDQoNClRoZSBoYXJkd2FyZSBzdXBwb3J0cyB0aGUgZm9sbG93aW5nIHBhZ2Ugc2l6ZXMs
IGFuZCBlbmNvZGVzIHRoZW0gb24gNCANCmJpdHMgYWxsdGhvdWdoIGl0IGlzIG5vdCBkaXJlY3Rs
eSBhIHNoaWZ0LiBNYXliZSBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gDQp1c2UgdGhhdCBlbmNvZGlu
ZyBhZnRlciBhbGw6DQoNCjAwMDEgNCBLYnl0ZXMgKFNoaWZ0IDEyKQ0KMDAxMCAxNiBLYnl0ZXMg
KFNoaWZ0IDE0KQ0KMDAxMSA2NCBLYnl0ZXMgKFNoaWZ0IDE2KQ0KMDEwMCAyNTYgS2J5dGVzIChT
aGlmdCAxOCkNCjAxMDEgMSBNYnl0ZSAoU2hpZnQgMjApDQowMTEwIDQgTWJ5dGVzIChTaGlmdCAy
MikNCjAxMTEgMTYgTWJ5dGVzIChTaGlmdCAyNCkNCjEwMDAgNjQgTWJ5dGVzIChTaGlmdCAyNikN
CjEwMDEgMjU2IE1ieXRlcyAoU2hpZnQgMjgpDQoxMDEwIDEgR2J5dGUgKGU1MDB2MiBvbmx5KSAo
U2hpZnQgMzApDQoxMDExIDQgR2J5dGVzIChlNTAwdjIgb25seSkgKFNoaWZ0IDMyKQ0KDQoNCj4g
Q291bGQgeW91IHBsZWFzZSBzcGVsbCB0aGVtIG91dCBoZXJlPw0KPiBPciBldmVuIGJldHRlciwN
Cj4gDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5s
ZXJveUBjc2dyb3VwLmV1Pg0KPj4gLS0tDQo+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9u
b2hhc2gvaHVnZXRsYi1lNTAwLmggfCA2ICsrKysrKw0KPj4gICBhcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vbm9oYXNoL3B0ZS1lNTAwLmggICAgIHwgMyArKysNCj4+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL25vaGFzaC9odWdldGxiLWU1MDAuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9u
b2hhc2gvaHVnZXRsYi1lNTAwLmgNCj4+IGluZGV4IDhmMDRhZDIwZTA0MC4uZDhlNTFhM2Y4NTU3
IDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC9odWdldGxi
LWU1MDAuaA0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC9odWdldGxi
LWU1MDAuaA0KPj4gQEAgLTQyLDQgKzQyLDEwIEBAIHN0YXRpYyBpbmxpbmUgaW50IGNoZWNrX2Fu
ZF9nZXRfaHVnZV9wc2l6ZShpbnQgc2hpZnQpDQo+PiAgICAgICAgcmV0dXJuIHNoaWZ0X3RvX21t
dV9wc2l6ZShzaGlmdCk7DQo+PiAgIH0NCj4+DQo+PiArc3RhdGljIGlubGluZSBwdGVfdCBhcmNo
X21ha2VfaHVnZV9wdGUocHRlX3QgZW50cnksIHVuc2lnbmVkIGludCBzaGlmdCwgdm1fZmxhZ3Nf
dCBmbGFncykNCj4+ICt7DQo+PiArICAgICByZXR1cm4gX19wdGUocHRlX3ZhbChlbnRyeSkgfCAo
X1BBR0VfVTMgKiAoc2hpZnQgLSAyMCkpKTsNCj4+ICt9DQo+PiArI2RlZmluZSBhcmNoX21ha2Vf
aHVnZV9wdGUgYXJjaF9tYWtlX2h1Z2VfcHRlDQo+PiArDQo+PiAgICNlbmRpZiAvKiBfQVNNX1BP
V0VSUENfTk9IQVNIX0hVR0VUTEJfRTUwMF9IICovDQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL25vaGFzaC9wdGUtZTUwMC5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL25vaGFzaC9wdGUtZTUwMC5oDQo+PiBpbmRleCA5NzVmYWNjN2UzOGUuLjA5MWU0YmZmMWZi
YSAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvcHRlLWU1
MDAuaA0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC9wdGUtZTUwMC5o
DQo+PiBAQCAtNDYsNiArNDYsOSBAQA0KPj4gICAjZGVmaW5lIF9QQUdFX05PX0NBQ0hFICAgICAg
IDB4NDAwMDAwIC8qIEk6IGNhY2hlIGluaGliaXQgKi8NCj4+ICAgI2RlZmluZSBfUEFHRV9XUklU
RVRIUlUgICAgICAweDgwMDAwMCAvKiBXOiBjYWNoZSB3cml0ZS10aHJvdWdoICovDQo+PiArI2Rl
ZmluZSBfUEFHRV9IU0laRV9NU0sgKF9QQUdFX1UwIHwgX1BBR0VfVTEgfCBfUEFHRV9VMiB8IF9Q
QUdFX1UzKQ0KPj4gKyNkZWZpbmUgX1BBR0VfSFNJWkVfU0hJRlQgICAgMTQNCj4gDQo+IEFkZCBh
IGNvbW1lbnQgaW4gYWJvdmUgZXhwbGFpbmluZyB3aGljaCBQKl9TSElGVCB3ZSBuZWVkIGNvdmVy
IHdpdGggdGhlc2UNCj4gNGJpdHMuDQo+IA0KPiANCj4gDQo+IC0tDQo+IE9zY2FyIFNhbHZhZG9y
DQo+IFNVU0UgTGFicw0K
