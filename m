Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 276298C4BB8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 06:40:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=fbMZQZkW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdkF94dlMz30Vy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 14:40:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=fbMZQZkW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdkDP4nnjz2yvp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 14:40:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEFSjB6rQYFNNS0Q3z3eUHsHo522bR0LNcCTD2ipCYCqmD0341SXJFui2lIRdP62Cq3mlpTx0lPIOlprirUKoltfBcXy3Ri8bz/FCHe7KRdYst164tlh9wigtHxpHu+DZqpT0xX3gxIBUZo/gGnLI9s0rwF3hzraLShJB2wTOmX+ss14ecxcjSS+AkBNW73MHIGAREcKVUuot0yJYmekWLwA3cl37abmG+l45RJf8gJOOJUJfgHS8nAQ8LP+3QimG3G2+cL98iuK6l6E70zo3zIqr2b2F+gpyGGpk3+kDn/q5ld8ypUxZh0on6rSEgXqv7DePP5atENmlZQeg+JD9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdFSa7shWYjZdISK99hs3n+a8BC6rm05P+gX1uiXyV4=;
 b=OSmLc1XDZ3de1evM4w2nKbt7z2vqV9y0kbR//vKgkqfX9E0107z8b2u/qLxHYN/23vYrMW9hCL4qH4psQNOFQU3hKqKpJO7iDl8t0JmGs+N48+9LDmDb9UumwMl+KQX6vYy9RbWIMTWlSwODLbJkUeYIiwAhdFR0EypH8brnJTyAH25vhSijCep8NAO7JintFVk42pwC8FobZe1T1CTU38/E39aHXETanhCtFfxI0rUUTTYTejBnTqqp0OmYSJBkA8i/M5bhS/cZx4Wj1stheba2bI+PJxR5uuO+MZedNsDe4A9ehup46jENfS4vKLNkpyZ1h9C6ita3Pr5qvgn0qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdFSa7shWYjZdISK99hs3n+a8BC6rm05P+gX1uiXyV4=;
 b=fbMZQZkWCa7CqAOKxIGh/ScPJ869Icn9ArWgA2RHDPvewZe/22JtblkMH9RheUefqnhkoEXMOlR1tG9awcI27BEfy55SfVM+lKaDTGJH9/WP9QB1HNDL8DAxqD2+iYfiCjt4JuUvlWJ3xan+kgPVugvZjwrtu8CvrvxLZwWfyRu+7HiJtAeWbt8HwIAeGoyTgtN2txVqSl8L/WUQdVJ1sKIjay1Yb45YjHI+Vva+f1I6fpcu5DD4Z4tCbz2IjQ0gbFa7IJcm5Jti20fFaa2i4NBQEU5uGijUHUp5aEHI1e95dbqhnVHXpudWFqEy6N6kNx8svlpdtcuQQvFt1WCGLg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3458.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:26::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 04:39:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e6d7:9670:c147:b801]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e6d7:9670:c147:b801%3]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 04:39:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH v3 3/5] powerpc/64: Convert patch_instruction() to
 patch_u32()
Thread-Topic: [PATCH v3 3/5] powerpc/64: Convert patch_instruction() to
 patch_u32()
Thread-Index: AQHafnjAdvk5/v2wcEafc1bbu+968bF1x2OAgCCRLICAABvpgA==
Date: Tue, 14 May 2024 04:39:30 +0000
Message-ID: <1cf1c19a-c070-4d86-9351-85e8e58d3180@csgroup.eu>
References: <20240325055302.876434-1-bgray@linux.ibm.com>
 <20240325055302.876434-4-bgray@linux.ibm.com>
 <xjnc3usfjrn3pqitpvvs4fkackuzcrnguqmqm2otocnhtrxmux@cd4d7bsyoweq>
 <8d6ba809067eb332e1c1a8e6103303cd4814df41.camel@linux.ibm.com>
In-Reply-To: <8d6ba809067eb332e1c1a8e6103303cd4814df41.camel@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3458:EE_
x-ms-office365-filtering-correlation-id: 69a0fcb3-a9b7-4c3b-0d34-08dc73cfd8a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?R1diTEJlWEtWUEFDcXF4V1NXY3I5ZWF4QnpRVWJxTTVqZEFiRWxpRlFoZEJj?=
 =?utf-8?B?VnIzY1IyYkcwV3N3Vi9lSkpOaHA5b1pybU1EUUx6NnEvZERCaDhldHVLQzlu?=
 =?utf-8?B?S3JCdkZxdjliaFpBTThLRzVpM3k5OGRlUmp3NGk2dzA4dzhkdzhBMi9URHRI?=
 =?utf-8?B?N2JyWlE2U1pzNW9RYUZLREVMS09kRVlMTDZXaXJFTytBTEQ1aGJJT3lOQitj?=
 =?utf-8?B?NWRrQW1jM0luZHpZTGpaMVFvK2JhWll2dWdBWTdrOWsyYVQ5MXZGN2wzaXBR?=
 =?utf-8?B?cEdNbFEzTzMxSDRkcCt2R1oyN01jdWh1V0MrUVNlNWN3ajZLdC9wV1Vadkxy?=
 =?utf-8?B?SlVaWkhFVE5KN1RCQm45cThOcWo2QVltbWZKKzg3b0k4RE1ZUGQyS0dSaUdi?=
 =?utf-8?B?TktXVWMwU3hwL3hSb1JRdE9ZeXN4SHR1bFkzMFpFSHpMT0xRQ2VTL0U3Qzdy?=
 =?utf-8?B?Yy90MEEweTNFMmdVU3JocjdERG45M1JsbnlYZVhXdjRIUnJIeGFtdHZ0MmFh?=
 =?utf-8?B?cHJ2YjJ0c0JUVWNEZ2VMQktiRGJWVHpIY0lVMENEWjlFT2dVR1M2VnFvTjBL?=
 =?utf-8?B?NFpFNHVlOWRmNzUwTWR3RDZaY3V0Y1RWbkZBSy8ySm4waVd2dHIwOVlQb0RX?=
 =?utf-8?B?ZnJhanBDeVFhMWQyYWlGajZEVzdOdHFaNjYyUWtiOVFBL2F4bVFFQlJSU3lh?=
 =?utf-8?B?ejdoL1lnZkxLMnQ2MVRTYmpKSU5icmpOZlBOcXVwRDFSQWJDWkxYTTNrbzNa?=
 =?utf-8?B?dmxldEpVRHRVSHlxdFJDQ0NrR0VubVBEaVcydnRwRkVRdWcwNTBhd01oR00w?=
 =?utf-8?B?STF3TEg5b2RmRFBWR2pHZG14bGJ0VXUxU3VxVUUzaVdyVUM1UlM0N1NvS3V1?=
 =?utf-8?B?SkVqLytlcmNHKzZRWEhhMk5VVWl2cjBKdTRsbHlLKy9ZUlBUNXJ4UzNrSXFh?=
 =?utf-8?B?MzZ5dlpqb21RQ3RzQzkyemxTd21WQzlUM3NtaS80b1FETlQrSkl0MDJNU29i?=
 =?utf-8?B?OVlZeS9FU00vNG5yelU3Y3F1Y0grNEtLem45U2RFdEJvd2F0UCtlYk8vNkxs?=
 =?utf-8?B?RFovdE8rMTZZSjY5bWw4d2hnL1dYbHlHbTJsNW1LSlJXais1aXJwOW4vYjVu?=
 =?utf-8?B?UjRJc2IweDFGd2NRT1dZamtaZ2twYVhjck5yV1FlSEFZdzZuZXU5OTRQZVBQ?=
 =?utf-8?B?b01Zc056UHFVeHd1cC9sQUJwOUUyZk9FbWFyT00wV082K0o3QU14ODNDclp5?=
 =?utf-8?B?NHF2b0hHb0d4aGhqb0FFT1diUHFlNE1YV2RDN1luZ0dObUNkZkh0OEtsUVNB?=
 =?utf-8?B?eHQ4dGZsdnF6ZjdqTnJibGpQR3VrVldZdGlwYlNIQjJxNmlWdlNBR29aY21B?=
 =?utf-8?B?WDNvMi9sSHJyMi9nUTYrNkFkNTk0VnZ6NVZGVnVsWXg2S1JFamEvQTNoZHJz?=
 =?utf-8?B?dEl1ZDdqZXh0RkIvMXJEZU44Yzg1N1EyTm9MR3ZkNUV4UlNNb2d6TEQ1Y2Z0?=
 =?utf-8?B?UzdEV3Mvby9xWWJpc0tkc3hHbGZ0ME03UkN2R1VkTzdSVnliWnhtSWdhZHRi?=
 =?utf-8?B?aTFCcmx1bDdUcG1JK09aMldaNjViZGlhOUhWSnY3ZXRja08rWFd2dmo4Mjcx?=
 =?utf-8?B?SlZmaVJWLzR6TUowRVVDVGNnNXhRL3BQV2xaanlxS0dEQXAxRFBuWndUYXBQ?=
 =?utf-8?B?Smo2Y0ZzQnphem9VbFl4UjVEQ2RwV2VjeUhLYkd4dGlhdmZOTjBmUjhBPT0=?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SHFDOHRJWGs4OWhnalRTWmpKSFJmNGI2R1FJb2hvVGdpeHhYU2lPQTU4VTQ0?=
 =?utf-8?B?ejdxWUdIVExZMCtvNDVoeERsRFBsRWVTbmVqLzJmTFk4NGpBaExqMElybnFj?=
 =?utf-8?B?SXpkQ3llbWUwbjNmOFlPZURheENPQXJwWTBSTXp2RTRVa3hOeWFDdC9JbElq?=
 =?utf-8?B?a3o2endDRFZ6c083blJ1QjlvakhKME56RGhuRFJWUUlSN3FBUzJLWEl2N0FF?=
 =?utf-8?B?NWppNlp2WTJQN2tnZHZRVTZwUG5wSkdjV3lYRE9TR1A4TW5za202RHJRVUkw?=
 =?utf-8?B?QmJZNW9GVkU1dGxaVlE3cFhtWVZyL2hIQ1BnaEY0NjlnOHhjV0RWZHlvQlEz?=
 =?utf-8?B?ZnVYMnZhRnN3SFZOcHdmaXRCWHVkOHI4YjNITmxWdlI5QngwbWU2eDl1cENn?=
 =?utf-8?B?WlZUbzJoVm9qTU5GZzg2cDI3UXhubzJXOUxaVkplREFhWjdEL3ZtZHZVNXFT?=
 =?utf-8?B?bkpyaFUxaTJkMkpVQzZJNnpKVyswQTB1VUlaZ2x0UGJyckxDeGZsV0F6TzZ1?=
 =?utf-8?B?a1FTZ2RXd0lab0E4L2FVNFRJWTdsUHBNU0M3ODJvSm91bk9qTytFR0Fwd3dH?=
 =?utf-8?B?a2YwSzZHaUdYM2p6YmZVV0FCQ0VGZUxIM2M1NGI2eTFLN2puUytRWE1XU05J?=
 =?utf-8?B?cDM4Q256NnUvTmovQ3ZOK0JiRlM2SFBFV3NoM09Dalg3MnBqamNNRS8wRzJ1?=
 =?utf-8?B?ZnY2Y3hQRUh4amIxalhnM1V2RXBRL05zYnZ1VnJoUVQ2QkZXT3MxZ2pncjU1?=
 =?utf-8?B?aWl2QlBBSWNpZFBjbXVoZXFkMkVINm5jS0llM3d3MTRZaFY2VXQxUnR2d1Vz?=
 =?utf-8?B?OUxJYjJCZ0RHNTdnQkgzbTlBdlVHYW04RmlpY0FyZ3ZadUdDeUdBS3VZU1VJ?=
 =?utf-8?B?UmlNMTlJdUwwc0NXVWp6c3hMQVpOUitpcmtFWVNHSjZBUkRXOHVzQVhCOENN?=
 =?utf-8?B?Ulk5TmcyeGtYZHc5ZGI5NUxlZFFaSDNWd2RnN0VlYnBXRXB3bDF1MTVCRzdr?=
 =?utf-8?B?aDdCdGJoU3VxUkZvVE1aWkVIR29LdVU0bUFGVTNmK2NzU2lKRFllWlJtTGd2?=
 =?utf-8?B?UlkreHFabzI5NFBEOTVDQUFMbVAzaDZNNHlvVTcxaEpITHlEbVZQbTNtOFlt?=
 =?utf-8?B?YXp1Sk82dFZoeGJYY04zZVNPSzNNWWQ3a2s3R09kdENKMjhPSmY1SFVqQVl0?=
 =?utf-8?B?K1psb1dFWlpYMkY5bG5FV1I0eFFKN2Q1cHpnQTdzc1BZdXluNEhiZnNIMnp3?=
 =?utf-8?B?Sk4xZlE1R0cyQURKV3IyOEUwOVlnb29Rc0NLTis5c29oRitDUGFqbnVDd3Ev?=
 =?utf-8?B?NGU3U1NwYlZnSTdVS1lDVU1jYThBeWF3YnBwRlNJMnltcm5sRnNXZjU2Vy9I?=
 =?utf-8?B?emU0WnBXQ2Zja0ZiZlZ3MGlPc25wNVBTNHZ6by9jYXgxTjRjK21WRnIvcFBv?=
 =?utf-8?B?dkFXSXF4dVRHSmV2dVdwaSszN05KaUZhQjJJb2l1M1paUmpBaHhKeG5JbzRB?=
 =?utf-8?B?R3I4STFnSlpESzh5T2UyRE1VWEE4Y3lTNHRhdnJFVzQ1bHpWZDI1S3ZoZGts?=
 =?utf-8?B?emN0NzJwbVRMb1pPNDVPTWtXbkc0VTg1djRoWUdrUUcxT3JYbWdLYW5sQnBO?=
 =?utf-8?B?Q09qOVVySyt0U3hyTjRXclBlN1RWRTNubDMya01FWStTdEhzQURuU1RnNGcw?=
 =?utf-8?B?YnpPU1JFanRMMHdMc09GUDNFaElqeGowbWdqbHVpdDJYdzVyVTJrenlGWDEz?=
 =?utf-8?B?VGNHVlQ5bWlDVEhJSWM3NnlkMnE2MkxCb2QyNTlwSFNlNnpPbmlTdVd3Y250?=
 =?utf-8?B?VnZUeDh3OHBTM1NWQUtzVC9BOHQ3VVdQSXdJTzJBOSt5ZXhNQXI5K0p4ZVR2?=
 =?utf-8?B?SmxGQm5hdkV6VGpWV3J2VFZYcjVWRStaTy9JdUowVGFSMW1ZbFJCejFac3o5?=
 =?utf-8?B?V1g0b1FKa0tXZXZkV0dNQlByRDRCb1M5alVpUDIraXdYT3RjaVJjcW5sRVBs?=
 =?utf-8?B?ZmVrWE9vMEZPMGJEYjNid295akVPM3I3OEZIOTIvUmttUHREcE5EV0t6d2ZX?=
 =?utf-8?B?Qi9tZ1pycC9TWXBRL1lyVTIrYmwreE9NZ3hkTDVESUtGQUlsckxkanlibTA3?=
 =?utf-8?Q?ZuFSkOS29Moz3BM64kOgO7PjV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <95256B5CBCE2BE4B878ECB143636E10A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a0fcb3-a9b7-4c3b-0d34-08dc73cfd8a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2024 04:39:30.9540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DVaMtczO6z1YC/VJqdrFvYn0SOuRQ9g9EvToNUvVam5CKuabLL3IjSdcY+3WzactsLDy4gfSZaKmuxvjitaUpMzajr3J8fGy/4Kctxct+s4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3458
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

DQoNCkxlIDE0LzA1LzIwMjQgw6AgMDQ6NTksIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
T24gVHVlLCAyMDI0LTA0LTIzIGF0IDE1OjA5ICswNTMwLCBOYXZlZW4gTiBSYW8gd3JvdGU6DQo+
PiBPbiBNb24sIE1hciAyNSwgMjAyNCBhdCAwNDo1MzowMFBNICsxMTAwLCBCZW5qYW1pbiBHcmF5
IHdyb3RlOg0KPj4+IFRoaXMgdXNlIG9mIHBhdGNoX2luc3RydWN0aW9uKCkgaXMgd29ya2luZyBv
biAzMiBiaXQgZGF0YSwgYW5kIGNhbg0KPj4+IGZhaWwNCj4+PiBpZiB0aGUgZGF0YSBsb29rcyBs
aWtlIGEgcHJlZml4ZWQgaW5zdHJ1Y3Rpb24gYW5kIHRoZSBleHRyYSB3cml0ZQ0KPj4+IGNyb3Nz
ZXMgYSBwYWdlIGJvdW5kYXJ5LiBVc2UgcGF0Y2hfdTMyKCkgdG8gZml4IHRoZSB3cml0ZSBzaXpl
Lg0KPj4+DQo+Pj4gRml4ZXM6IDg3MzRiNDFiM2VmZSAoInBvd2VycGMvbW9kdWxlXzY0OiBGaXgg
bGl2ZXBhdGNoaW5nIGZvciBSTw0KPj4+IG1vZHVsZXMiKQ0KPj4+IExpbms6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDIzMDIwMzAwNDY0OS4xZjU5ZGJkNEB5ZWEvDQo+Pj4gU2lnbmVk
LW9mZi1ieTogQmVuamFtaW4gR3JheSA8YmdyYXlAbGludXguaWJtLmNvbT4NCj4+Pg0KPj4+IC0t
LQ0KPj4+DQo+Pj4gdjI6ICogQWRkZWQgdGhlIGZpeGVzIHRhZywgaXQgc2VlbXMgYXBwcm9wcmlh
dGUgZXZlbiBpZiB0aGUgc3ViamVjdA0KPj4+IGRvZXMNCj4+PiAgwqDCoMKgwqDCoCBtZW50aW9u
IGEgbW9yZSByb2J1c3Qgc29sdXRpb24gYmVpbmcgcmVxdWlyZWQuDQo+Pj4NCj4+PiBwYXRjaF91
NjQoKSBzaG91bGQgYmUgbW9yZSBlZmZpY2llbnQsIGJ1dCBqdWRnaW5nIGZyb20gdGhlIGJ1Zw0K
Pj4+IHJlcG9ydA0KPj4+IGl0IGRvZXNuJ3Qgc2VlbSBsaWtlIHRoZSBkYXRhIGlzIGRvdWJsZXdv
cmQgYWxpZ25lZC4NCj4+DQo+PiBBc2tpbmcgYWdhaW4sIGlzIHRoYXQgc3RpbGwgdGhlIGNhc2U/
IEl0IGxvb2tzIGxpa2UgYXQgbGVhc3QgdGhlDQo+PiBmaXJzdA0KPj4gZml4IGJlbG93IGNhbiBi
ZSBjb252ZXJ0ZWQgdG8gcGF0Y2hfdTY0KCkuDQo+Pg0KPj4gLSBOYXZlZW4NCj4gDQo+IFNvcnJ5
LCBJIHRoaW5rIEkgZm9yZ290IHRoaXMgcXVlc3Rpb24gbGFzdCB0aW1lLiBSZWFkaW5nIHRoZSBj
b21taXQNCj4gZGVzY3JpcHRpb25zIHlvdSBsaW5rZWQsIEkgZG9uJ3Qgc2VlIGFueSBtZW50aW9u
IG9mICJlbnRyeS0+ZnVuY2RhdGENCj4gd2lsbCBhbHdheXMgYmUgZG91Ymxld29yZCBhbGlnbmVk
IGJlY2F1c2UgWFlaIi4gSWYgdGhlIHBhdGNoIG1ha2VzIGl0DQo+IGRvdWJsZXdvcmQgYWxpZ25l
ZCBhbnl3YXksIEkgd291bGRuJ3QgYmUgY29uZmlkZW50IGFzc2VydGluZyBhbGwNCj4gY2FsbGVy
cyB3aWxsIGFsd2F5cyBkbyB0aGlzIHdpdGhvdXQgbG9va2luZyBpbnRvIGl0IGEgbG90IG1vcmUu
DQo+IA0KPiBQZXJoYXBzIGEgc2VwYXJhdGUgc2VyaWVzIGNvdWxkIG9wdGltaXNlIGl0IHdpdGgg
YXBwcm9wcmlhdGUNCj4ganVzdGlmaWNhdGlvbi9hc3NlcnRpb25zIHRvIGNhdGNoIGJhZCBhbGln
bm1lbnQuIEJ1dCBJIHRoaW5rIGxlYXZpbmcgaXQNCj4gb3V0IG9mIHRoaXMgc2VyaWVzIGlzIGZp
bmUgYmVjYXVzZSB0aGUgb3JpZ2luYWwgd29ya3MgaW4gd29yZHMsIHNvIGl0J3MNCj4gbm90IHJl
Z3Jlc3NpbmcgYW55dGhpbmcuDQoNCkFzIGZhciBhcyBJIGNhbiBzZWUsIHRoZSBzdHJ1Y3QgaXMg
NjQgYml0cyBhbGlnbmVkIGJ5IGRlZmluaXRpb24gc28gDQpmdW5jZGF0YSBmaWVsZCBpcyBhbGln
bmVkIHRvbyBhcyB0aGVyZSBhcmUganVzdCA4eCB1MzIgYmVmb3JlIGl0Og0KDQpzdHJ1Y3QgcHBj
NjRfc3R1Yl9lbnRyeSB7DQoJLyoNCgkgKiAyOCBieXRlIGp1bXAgaW5zdHJ1Y3Rpb24gc2VxdWVu
Y2UgKDcgaW5zdHJ1Y3Rpb25zKSB0aGF0IGNhbg0KCSAqIGhvbGQgcHBjNjRfc3R1Yl9pbnNucyBv
ciBzdHViX2luc25zLiBNdXN0IGJlIDgtYnl0ZSBhbGlnbmVkDQoJICogd2l0aCBQQ1JFTCBrZXJu
ZWxzIHRoYXQgdXNlIHByZWZpeCBpbnN0cnVjdGlvbnMgaW4gdGhlIHN0dWIuDQoJICovDQoJdTMy
IGp1bXBbN107DQoJLyogVXNlZCBieSBmdHJhY2UgdG8gaWRlbnRpZnkgc3R1YnMgKi8NCgl1MzIg
bWFnaWM7DQoJLyogRGF0YSBmb3IgdGhlIGFib3ZlIGNvZGUgKi8NCglmdW5jX2Rlc2NfdCBmdW5j
ZGF0YTsNCn0gX19hbGlnbmVkKDgpOw0KDQo+IA0KPj4NCj4+PiAtLS0NCj4+PiAgwqBhcmNoL3Bv
d2VycGMva2VybmVsL21vZHVsZV82NC5jIHwgNSArKy0tLQ0KPj4+ICDCoDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9wb3dlcnBjL2tlcm5lbC9tb2R1bGVfNjQuYw0KPj4+IGIvYXJjaC9wb3dlcnBjL2tlcm5l
bC9tb2R1bGVfNjQuYw0KPj4+IGluZGV4IDcxMTJhZGM1OTdhOC4uZTliYWI1OTlkMGMyIDEwMDY0
NA0KPj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvbW9kdWxlXzY0LmMNCj4+PiArKysgYi9h
cmNoL3Bvd2VycGMva2VybmVsL21vZHVsZV82NC5jDQo+Pj4gQEAgLTY1MSwxMiArNjUxLDExIEBA
IHN0YXRpYyBpbmxpbmUgaW50IGNyZWF0ZV9zdHViKGNvbnN0DQo+Pj4gRWxmNjRfU2hkciAqc2Vj
aGRycywNCj4+PiAgwqAJLy8gZnVuY19kZXNjX3QgaXMgOCBieXRlcyBpZiBBQkl2MiwgZWxzZSAx
NiBieXRlcw0KPj4+ICDCoAlkZXNjID0gZnVuY19kZXNjKGFkZHIpOw0KPj4+ICDCoAlmb3IgKGkg
PSAwOyBpIDwgc2l6ZW9mKGZ1bmNfZGVzY190KSAvIHNpemVvZih1MzIpOyBpKyspIHsNCj4+PiAt
CQlpZiAocGF0Y2hfaW5zdHJ1Y3Rpb24oKCh1MzIgKikmZW50cnktPmZ1bmNkYXRhKSArDQo+Pj4g
aSwNCj4+PiAtCQkJCcKgwqDCoMKgwqAgcHBjX2luc3QoKCh1MzINCj4+PiAqKSgmZGVzYykpW2ld
KSkpDQo+Pj4gKwkJaWYgKHBhdGNoX3UzMigoKHUzMiAqKSZlbnRyeS0+ZnVuY2RhdGEpICsgaSwg
KCh1MzINCj4+PiAqKSZkZXNjKVtpXSkpDQo+Pj4gIMKgCQkJcmV0dXJuIDA7DQo+Pj4gIMKgCX0N
Cj4+PiAgIA0KPj4+IC0JaWYgKHBhdGNoX2luc3RydWN0aW9uKCZlbnRyeS0+bWFnaWMsDQo+Pj4g
cHBjX2luc3QoU1RVQl9NQUdJQykpKQ0KPj4+ICsJaWYgKHBhdGNoX3UzMigmZW50cnktPm1hZ2lj
LCBTVFVCX01BR0lDKSkNCj4+PiAgwqAJCXJldHVybiAwOw0KPj4+ICAgDQo+Pj4gIMKgCXJldHVy
biAxOw0KPj4+IC0tIA0KPj4+IDIuNDQuMA0KPj4+DQo+IA0K
