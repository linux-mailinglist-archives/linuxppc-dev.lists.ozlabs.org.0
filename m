Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2708C28B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 18:25:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=gdeJ0E+V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbZ3v0W81z3cXL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2024 02:25:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=gdeJ0E+V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbZ3369q8z2xjN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 May 2024 02:24:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nl/A/LoudWwMw75EQKs3bNZutGvCvxpr+5sb+DeJjbHY8iV5hapFOIhXbpZ8ZgW2L4PcWxBxHTbL2yaAFIZnudTKYKNgzR5VL9O0+KO5zTpJx9MGO+bXre6aaTZirjZibxWJR8wei9BavMrQVmFDQvTyWnJQ/KHusL0FbX09F0RoIeCq/vK6hk8+FcAe5nh62VDVu0HbzI6vkpi+b0nU69ld5MLjli2m2Z3tKAie8nQ1cAhGclQCtJbon2cRPhBfRkpUn4vdqOEyPGLMQ9WtYMcJhdHApqWIasfLjo4dkhiaHzQJWzknnSlmYWJLLw10TRoGuLzDQ6tu7Obwy4Qm8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcGClGlyuwGMWWvseQlAjfFIGatNC/zXiFt2oZpQJ4s=;
 b=EpkjaWzftsKjBcO9WOpu5/qIbLBj821IFnH40FgWFlXpYzQnsGnHs1sYu8Y32Txb8wL5Jndfax1434H8zXEsR7t99y1sBa4yY73ScA29C4PA9kPdS+U/SXvUybG4MvmMiRsyi5xNvKVC36K4MDHEKAKOV7IDVmEinj7oW7GtNQYDvd/9MpPl/HcFdykkMdthN+3zDAIW4dWrlyV28ohFwKWhMvaXihZCS2M4rCnbaCSqEgJx+4/EdAPeyiAxNxV/e5y3yRV1Ba1lP4uaDVwVST8KvkngVmfRlb3BHmlnp99/1Tbgu9VyGBZphvzej33ZwV/J2fscX8xG8FyE3uaS4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcGClGlyuwGMWWvseQlAjfFIGatNC/zXiFt2oZpQJ4s=;
 b=gdeJ0E+Vs1wCYtXvvaNvmL7eG6Gy8+lhCqOdTKZUqFtjNCT0KVWFpqzFtrLu4BhSrnP9Gd//qaVF8NMShpM01pu9OuGwj2dVPSAle3r3xpwPWSv3W9NquOWL0BoTnzmMnFP3n6rd6x3WNEYoM9n0yumHlX6Vax2wmYJ4ufAZpSa0+b7Wbk93IPAJo2sLJjwnyVTMCK6uXHrZLD2caXYJ3GIQ90Ek7M5Ujm+utxGwaZWuYfAcEYaD80XYH4FEPJKCN2OviBulC5cY1wpTFdR17RwxPuNRjinNMmSJlT31Gh1FCmIzdS1fd6qIbugU4jEaH+z7++a3AhUlsNRswYUjVw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2778.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Fri, 10 May
 2024 16:23:52 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 16:23:52 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?6LW15aSP?= <zhaoxiahust@gmail.com>, Nick Piggin
	<npiggin@gmail.com>
Subject: Re: About the code updte of the arc/linux/arch/beta/kernel/irq_64.c
Thread-Topic: About the code updte of the arc/linux/arch/beta/kernel/irq_64.c
Thread-Index: AQHam5ACGYYHUXCmF0mLLbW2q/Pos7GQtcKA
Date: Fri, 10 May 2024 16:23:52 +0000
Message-ID: <af47c98a-b88f-4852-be24-defacbfc69c6@csgroup.eu>
References:  <CAO0ZshJsdmcGvdAOiMkFd9JdEyvKAgHU9oW8DOpPTAykjKDbsw@mail.gmail.com>
In-Reply-To:  <CAO0ZshJsdmcGvdAOiMkFd9JdEyvKAgHU9oW8DOpPTAykjKDbsw@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2778:EE_
x-ms-office365-filtering-correlation-id: 8b6c05db-f456-4628-1963-08dc710d94d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?bWd3akVUVkVZU3gvM1JIL2pGcVVhc1BZY3lBcXd3YzI3OXkzZlhsZUpiZTVi?=
 =?utf-8?B?Q3JSNlRMdnVDUis5ZDN3ODl4NUN2SllLcnZBOGg2ME9YMjZWc2hEclA1cE85?=
 =?utf-8?B?RUttb3RETnNlUmRNK0hXNVUwc1U3ckw2d0JiMXpzSGUzdnppczNZQ1A1RzV6?=
 =?utf-8?B?dGU1SVF5dkJyajZsMHk1QXpMdmJ6dHRwNVRML2NmTFAzdThZYzF2b0ZQZDg2?=
 =?utf-8?B?anp0YWN1eEJnYytqdElhS1JxdjdtU0dhZGdhNk0rNWVMM0ZTQ2phQjZvNUZ6?=
 =?utf-8?B?ZWZHZEZYM1FvZHp3dHpzWnJBM1ZRY1ZkdWNyS3FCT2RHNXdhajNiaHFSRHZX?=
 =?utf-8?B?TjN1aDlxejRiOVVncnoycnRLbHFmL1Q4T3lUK1BpVVRKazVzUVV2MjBhN1My?=
 =?utf-8?B?d0l1aFQ4VnFZd01TM3dBREsrNzROVmoza3JGSlhMbFY2N1ZBck8vcytoKzFC?=
 =?utf-8?B?aXF2KzZ5L0JyUTVNVjZuVExyUzhFZy8vZjZwU1krWndBcTJZY1BDN3hLUFNq?=
 =?utf-8?B?TDRaVXRzQXZ4dTZNZEdLUnV2R2t1RnhHcVEwYmJpR1gwR3NnaVpUNDFiMDdi?=
 =?utf-8?B?UFdYRGZBTnNZWExqMi9DOUhLQ3JQNDEvbmttTDg2aG1FVHAzcHU0TEorK2FU?=
 =?utf-8?B?UWVPenZCYjBkYVl4YW9sdEU0TUNBNCtFUXIza082RDNqL0ZoRHJ5OURCcHF3?=
 =?utf-8?B?U0RvN3krS0xYUEZzQW9Zdm1PVENyZHJpVGw3dnNQZ3hKZGZ4NmRtNHorRHY1?=
 =?utf-8?B?d0FTVTl2KzFZWjM4NDdZc1lXSm5YL3Y1MEgweWxsM1pzdnZaYlZ0YkNvczNN?=
 =?utf-8?B?NG00OWdYVDVkRGFacktoN1paL1pmbVdVQ2VJQ3d3b3JHOTRFak5zR3F1Mncv?=
 =?utf-8?B?d2h0VTZLZkR3OWo2bzdGeXhxaVV0K0VpZzI5S1Q5Z1BiNGI5c2ZuMTZZYnpZ?=
 =?utf-8?B?K0VrOVV5Um05U0NqTEdRYmREVmYyazFmaTh4OS94V21keStPRUNCWE1ZQlov?=
 =?utf-8?B?U1Q3ekZkUlFzSjF4TVNmNC85alZINFl1c0Y4OWRyR09pTzJaL1UxNVJHV0tN?=
 =?utf-8?B?ekYxOTdDNjNRQi9PSDVIU2ZWa0duZ0dGRjhEb0xuQzVRNGM0K3ptNE5lMXJ2?=
 =?utf-8?B?Nk9qR1VpSm1PZE1iRDRSdUQvckc1MEZWdUdxM1lhMDNJemp0UW5kYnFZZ1A0?=
 =?utf-8?B?WGxIUjlXNUFpNlpwY2ZIaG5mYUxsK0ZaVC9ZVE9GKytjeFRYeUN1TlQrNHZT?=
 =?utf-8?B?dTRiVHFrMHo0VmNtSnYxY0ZqWkJlV1VWdnpqZGN5N2xMS0dJcCtPNUtYbVJS?=
 =?utf-8?B?eDNMbWE4bGllbHJCeS9NeFRYUUZhNlpIelQwZ0hnUXBEaXBSUGlMT2JUdnlS?=
 =?utf-8?B?MWJYWkltbUxCRmg5UE13Ri8raHVwakFQSjNZWGZ6dFpodG8rSGhOZHJnb2Js?=
 =?utf-8?B?Z1UxMnhvTFVIS3k4c0tpZ3dwbzhRaDExWmFVSUx3MHBoY3UvVFFKb2lJMHJq?=
 =?utf-8?B?WHpQWkJKL3doekY1dUhQd0ZUQXN1WVRYOEJNVnZLenZFdHR3TEovR1hGZEZC?=
 =?utf-8?B?eTN4bHhtRHNpbjFsODFzMjhwajU3aTFtYjlLTTZmcFBzck0zOGI4ZzZCUFYz?=
 =?utf-8?B?T2I0aGZHcnI3ZGkremFRdEw4Yk1tMzBmdzdPRFVaMGwrVGtpc1lvejgzWE1h?=
 =?utf-8?B?RXo0TFVUSzZEWnY1SW9XbE1BRzYrOXpzZThDb1dyekZ2Q0Q0bnVlRXRyWUtv?=
 =?utf-8?B?RytrdHQ0b2lFSVdRQUhRV0xtRk83ZGYvVCtOKzFwUUhQckRiVHorZFNOdGZj?=
 =?utf-8?B?Zi9pMjZxUkROWWtrdFRKQT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SmxlSVRsUVJOc2F1b2VNWXB1NXJRNnZQN2N2b21jNTdsbHJzTXp2UmtuNHdr?=
 =?utf-8?B?MmRBb1dOaXJNcUVObkMveWhnVklSRWhiVzI0N2NEamIrNmNIazhmb0hTeXd2?=
 =?utf-8?B?NjltS0ZMdmVPWEtqdVozYTVKUjI3TTk0Tm5nR1dXUm1uZlhaSUxNYXZNRTRj?=
 =?utf-8?B?bGJ3SXZ2RXRoK1FDYUxVYS9jZFRmelRwTnVLZzZCQVovVkg3Zjg3VUF6WjRT?=
 =?utf-8?B?NXRSNCtTbEdWNDh1cXVsNmQ2enNmc3RaeWhzeGFQOG55WDdqRGRVeXNjTVVm?=
 =?utf-8?B?TFdKN1RjT0o3T3hpOHNCU1dZNVBDZVZRNUhVcGR4MGtXSWdaNkJLTk05Rmc1?=
 =?utf-8?B?aS9aVE9ZQ3dGRGdvSFVGaWZqcVZSZEpYYllyQ1FhVVh4TW1DVVMxT0FiM0t5?=
 =?utf-8?B?ZUl0S2dQRWFHcmt3QldreER6c01UcmZiWVlWOEFlZytYU1lRQWthU3ovWDhE?=
 =?utf-8?B?ZmR6MEhnSWczZlJzcDlWWTFwUHVlTWY5WlorbiswYXNjZmFiOWRuUG5zakpD?=
 =?utf-8?B?bTdVUi9tdHF1UHhVWUVxU2NFaVByZjBHQjg5c2VURFJycmY4c1JIZUd6alIx?=
 =?utf-8?B?dGJwS001MWNWMzF5RjlIRE5qMEJSeHpoNjhzbjZTSHA3Q015YU1DZDJMUEkr?=
 =?utf-8?B?SlFwaDM0b25DMGZmYnZWeUE4aDkyS1pkY0JPcHhjVzk4VkRHVmFodG5rNXVM?=
 =?utf-8?B?MnZCMEpnbHpORW9ob25xK255M054MnFJcWVDZUtvaGFnQ1o1NkdqRDhtc0dF?=
 =?utf-8?B?VHdGQTZjaTNGNlRLMTdkQjVqbzlYbW5kdWNMTVlWOERzc2FHRmY1V1dNYVVY?=
 =?utf-8?B?cFMzSlphMU1aeE56THUvWVFmT1kwaXB0VkZLSFlyK0NoNi8vZVVEZjdma2ZT?=
 =?utf-8?B?NGRIeUdkaXFtaUZUSXlTMmhaMVVqSWZRaXlBTTVpaHhjRlVHcm56RTZoVGox?=
 =?utf-8?B?NE9CRkwyYnJUMzQ0MFVTZ2VsMFhtWldyL1hnZWNxbS84U1MzdFBGZjNvN0g3?=
 =?utf-8?B?MVppOWxWQlQyTlpzcDh4QUYwN2tXY2tKakJJdEx6cDZrdzdFT1BBQzBUUS94?=
 =?utf-8?B?NDkwaDYraHMvR2VST1ZIcDZYWDR3M2toVktVaXkwczNvaG5NQkdoc0s1OUxv?=
 =?utf-8?B?cEdCMUtOaGh1TU5WVXEyUHFHMHVkem05cVp1TWR2TkRRVGQzeE90U25qczVy?=
 =?utf-8?B?alh4K2xGMzV6RnBmVUp3U0ZyUElnT2JZcTZRaG1yRythNVB4anBRMFhGM2Rv?=
 =?utf-8?B?bSt2ZHo0SDdWSE55VmltUE1ZMGhqVEdUczVubGpkcTVVVTRPeE82aGVsK1ky?=
 =?utf-8?B?d2t2MlFoN1hBOUtCc21WajZKWFNIUUlsMXc0QmxwMmRSeUtzY2hqaXRPS3pQ?=
 =?utf-8?B?VFFzcmtSNUhGbi84MDJqREhlMHg2ME44MkN1WVdtWXVydTY0VG5yS01uem5M?=
 =?utf-8?B?YU4wV01QV2hXVGpOamwxSjN2R1c0VDc4d1dxMXB5S0dBeWRkZkRYRnp3OGd6?=
 =?utf-8?B?QkYwdDh3VThsWE9QbGtBelJMWWxxZTFEZFl2RGZKUXRWWHVSVTNwTzIvS3ZX?=
 =?utf-8?B?U1ZBZTZLY2VoMHlsSjQrWEt5ZzJmTjYrNVFEMzdIUWp4S3Y5OHRITGY3RUx2?=
 =?utf-8?B?T0RHcDcrNmtka3pTQVd4aVNIbVYrSEYzQVp2YkFsTWNHaDNtWUdLREFJSUkz?=
 =?utf-8?B?V3FRMVhRd01iais1S3o4VFE1WU8yNTV6aXVDdW5vVGdXcTRrMVpzVTMrdzE3?=
 =?utf-8?B?QUIrZlArSUhBVDkyT2tQeG1uME5ZVlJxaDdjVHVGSkRrNnJnU3dHM0ZiMzVD?=
 =?utf-8?B?cFBKSy9IMFlZeVJ0N1lJZUd0VzFiYS9QbXpkTzZ3dTI3UGszcmgzeERzbTYr?=
 =?utf-8?B?alZQTkVCL1ZvRWIwRm9VdS92a0QvQjlFRXpzUEV0bW1pZDFsc2s3ZUEwWVps?=
 =?utf-8?B?ZGlaVG1KNENVVGFxaUJMT01xNG9DUFg3N1NBZXJ1TGRwQld3UnZPYlJwYkpX?=
 =?utf-8?B?SzJVSVdxdWl6T0pWemZMS0xHdUM1aW8ydG85RE9SMG9jNFlGVFNsaE0rdzJu?=
 =?utf-8?B?My9jQ2ZLUTZ5OWV5R056T2JZdnZZQjV6NmpQT2thOHQwTHlKd1N5d3BnZ2cw?=
 =?utf-8?Q?F+9oNobMtZIrPoBXg6PJR0xtI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9B85F8FD72CA444870BD63C0478631D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6c05db-f456-4628-1963-08dc710d94d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2024 16:23:52.4490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qmyiFP+gIcJ948eu8FVmPFvDsAvblEv0zjtNLTgWv2NkHU20OSYbTLSKPXyVkNMS6FFzSQlViMin6aL+ovQrMVLAWDApKIAq4tlIIVCdKJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2778
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgWGlhLA0KDQpMZSAwMS8wNS8yMDI0IMOgIDA4OjIyLCDotbXlpI8gYSDDqWNyaXTCoDoNCj4g
SGnCoENocmlzdG9waGUsDQo+IA0KPiAgwqAgSSBpZGVudGlmaWVkIHRoYXQgdGhlIGZ1bmN0aW9u
IG5hbWVkICJhcmNoX2xvY2FsX2lycV9yZXN0b3JlIiBvZiB0aGUgDQo+IGZpbGUgaXJxXzY0LmMg
d2FzIHVwZGF0ZWQgYnkgeW91IGZyZXF1ZW50bHkgaW4gdGhlIGxhc3QgdHdvIHllYXJzLg0KDQpZ
b3UgbWVhbiBhcmNoL3Bvd2VycGMva2VybmVsL2lycV82NC5jIEkgZ3Vlc3MgPw0KDQpJIGRvbid0
IHRoaW5rIEkgImZyZXF1ZW50bHkiIGNoYW5nZWQgaXQuIFdoYXQgSSBkaWQgd2FzIG1haW5seSAN
Cm1haW50ZW5hbmNlLCBJIGZpcnN0IGV4dHJhY3RlZCBhbGwgNjQgYml0cyBjb2RlIGZyb20gaXJx
LmMgaW50byBpcnFfNjQuYyANCnRvIGVhc2UgbWFpbnRlbmFuY2UsIHRoZW4gSSBkaWQgYSBmZXcg
Y29zbWV0aWMgY2hhbmdlcyB3aXRoIG5vIA0KZnVuY3Rpb25uYWwgaW1wYWN0cy4NCg0KQXMgZmFy
IGFzIEkgY2FuIHNlZSBzb21lIG1vcmUgaW1wb3J0YW50IGNoYW5nZXMgd2VyZSBkb25lIGJ5IE5p
Y2ssIG1heWJlIA0KSSdsbCBiZSBhYmxlIHRvIGFuc3dlciB5b3UgYmV0dGVyLiBJIGFtIG15c2Vs
ZiBub3QgYSBQUEM2NCBleHBlcnQsIG15IA0KZG9tYWluIGluIG1haW5seSBQUEMzMi4NCg0KPiAg
wqAgSW4gdGhlIHByZXZpb3VzIGNvZGUgdmVyc2lvbiAoc3VjaCBhcyBMaW51eCBLZXJuZWwgNS4x
MC43KSwgSSB0aG91Z2h0IA0KPiB0aGF0IGFuIGludGVycnVwdGlvbiBzdWNoIGFzIGRvb3JiZWxs
IG1pZ2h0IGhhcHBlbiBiZWZvcmUgDQo+ICJsb2NhbF9wYWNhLT5pcnFfaGFwcGVuZWQgPSAwOyLC
oCB3aGljaCBjYW4gY2F1c2UgYSBwcm9ibGVtLiBJcyB0aGlzIHRoZSANCj4gY29ycmVjdCB1bmRl
cnN0YW5kaW5nPyBJIGhhdmUgdHdvIHF1ZXN0aW9ucy4NCj4gDQo+ICDCoCAxLiBJZiB0aGUgcHJl
dmlvdXMgdmVyc2lvbiBjYW4gY2F1c2UgdGhlIHByb2JsZW0sIGNhbiB0aGUgY3VycmVudCBmaXgg
DQo+IHNvbHZlIHRoZSBwcm9ibGVtPw0KPiAgwqAgMi4gSWYgd2UgZG8gbm90IGNhcmUgYWJvdXQg
dGhlIG9zIHBlcmZvcm1hbmNlLCBjYW4gd2UgY2xvc2UgdGhlIA0KPiBuZXN0ZWQgaW50ZXJydXB0
IG1lY2hhbmlzbSB0byBhdm9pZCB0aGUgcHJvYmxlbT8gSWYgd2UgY2FuLCBob3cgdG8gY2xvc2Ug
DQo+IHRoZSBuZXN0ZWQgaW50ZXJydXB0Pw0KPiANCj4gS2luZCByZWdhcmRzDQo+IFhpYQ0KDQoN
ClRoYW5rcw0KQ2hyaXN0b3BoZQ0K
