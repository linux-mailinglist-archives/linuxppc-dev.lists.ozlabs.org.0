Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD888C3B2F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2024 08:11:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=le/OhMpE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vd8JR6wSGz3cTM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2024 16:11:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=le/OhMpE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vd8Hg5168z30Wc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2024 16:10:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4FCTUH09MhW63KeCT1Hnpf8rGiyvNHz32F39MFuQW1TmNWO/wYzqoToqUuvTfP5NgcXLjYM2bJ/JhaGxXx8xIh+fyvhiODmhC5XjmtFZcDszKB4pA2tzkwCHdT0EaHmULdTxstgG7wAdizy2NiMxkhQaLYgQpTCLknVtk9ASI7oGyQqfoVZrYsMOIqlvx3Yj47zPTQo1O99B5sd6ah04u8KuRROtGSaSDRl2GLMpXHi0t3bcF4Q+Af2x9dDua3T6bPxPb2pEsvKYaADHRk5A/wfrT36xY8JwT6bSGQoXfEPwXB3X+oS8aC9UY8NZYIKWV+dGdX7w3k9Kxz8zLcpzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFm7ivKcvEXB1NsffKoE//d/NxzGfpSIHk9X9zolp7A=;
 b=QOyfALRtGp1ATlxlUW5stLOfxcdvEfgy5RXqF5Sw0K21YFrfcuH4glEWMBb+R3582Hp4uRPRtuq92kqyYIzqEmEHMEAXbPOH1H4bsoFIhh75o+AIrLuy7Tey25/d1xVrMgo2LeGlNjN3rfXPHCaETHikwvZbZ0rkvDz2tplOSwN7rWTJmJOW+1MjBS6Nk+RcVa72uIu0NRNOBoqemxezaFlYtbbNgbpes707eQnKCxVI2Pbe0N6mjlepbeHc2aaMteQ0ziaj2kSu1hbka8TdmQkcMdlKhugEK+2YallTiOL+VyAEsJHpTg2AWt67HND6GxoZIKgx+bY7io7ESCrFYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFm7ivKcvEXB1NsffKoE//d/NxzGfpSIHk9X9zolp7A=;
 b=le/OhMpEdioTiSAx6CwWZoAv6AyIg07zWuEWEEBfHQxXMCkKekD/Cg3N1uIedSVzGxZC4/iMVZoLFjYKoxPzKOw3PfScSb9lM4YvXWRJHMw5+fwushXICEcAtMjJpnLg4/Az50qWP/qKx+91pgh0IyXfVW0n+gRKJYWBFBzQqSj9ji/KN9QyGHm/gztPIhJt+gr7cRTC7wSplwQTReckigb7EvcfhP7rUn9MEA2TYj4+xg9h2om2gXiZ+wIxDNyQF6oNK03MZh8jcFjYKm7tt0g/2Nusas8OvkICjpUznNNtKn1NvaIzCOMSZ+CXGB4FqdjxWEsUNPSXC0PtUCdzuQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PARP264MB5165.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 06:10:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e6d7:9670:c147:b801]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e6d7:9670:c147:b801%3]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 06:10:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Puranjay Mohan
	<puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
	<song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nicholas Piggin
	<npiggin@gmail.com>, Aneesh Kumar K.V <aneesh.kumar@kernel.org>, Hari Bathini
	<hbathini@linux.ibm.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf] powerpc/bpf: enforce full ordering for ATOMIC
 operations with BPF_FETCH
Thread-Topic: [PATCH bpf] powerpc/bpf: enforce full ordering for ATOMIC
 operations with BPF_FETCH
Thread-Index: AQHaoKewN2nvArUtl0mr1bMbD+rNUrGMyW4AgAftxQA=
Date: Mon, 13 May 2024 06:10:30 +0000
Message-ID: <880aa33e-aa83-400b-abe5-f7e7978ddb42@csgroup.eu>
References: <20240507175439.119467-1-puranjay@kernel.org>
 <87o79gopuj.fsf@mail.lhotse>
In-Reply-To: <87o79gopuj.fsf@mail.lhotse>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PARP264MB5165:EE_
x-ms-office365-filtering-correlation-id: 9ae19f07-c625-473d-c7cf-08dc7313647a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230031|366007|7416005|1800799015|376005|921011|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?ZE9wcW9sN0Q4M1Z5L09uRElkZG9SWDFFejFWc0ZUN1VubXpxeXVCKzVKWm45?=
 =?utf-8?B?SlQ5U1Nabkt3WDBCdjg2ZTJIeGp4bkNvMXBKdEd3aGh2YU5laHZtd1Q1SjJh?=
 =?utf-8?B?QVdJWlRCV2twYkJmSHE5cnJnQWpPSVFRY2Q5TDJjU0lTQ1E1MlhWSWFXSDZp?=
 =?utf-8?B?d2tXVjNYWnhENHJtTS8vaUZSYzdjbmZhWm0rQWpnS3BHcFpRYitZZHlYTnZ2?=
 =?utf-8?B?LzNaK3lQM0M4S1dwRFJzcHltbXNRSjhaNzFlZVRaclNCeTg5b3hkR1kzQ2hE?=
 =?utf-8?B?UGlXWnpUVWs5WHQyM3ZnOFFGVGI0VlBzN0dhUERNbTNxR3JqcEVmVmhENTli?=
 =?utf-8?B?VkVQQXR4aUYwcDRMcG1FN09DMkRsamhOUW9rSGx2cFB3OWRncW9PUkR4Mmxv?=
 =?utf-8?B?OEUrTVhQVVkwekF1OEswMEN3d0xsZTVGVVdWNVN6YnNTV1lzWnBvZUx4YkdR?=
 =?utf-8?B?bXE4eVFEVHFabDFVb0dUVVMxOVBqYmQxdHBDaGQrRDVGcDVlZCtMQUxVOFp2?=
 =?utf-8?B?bFhtaTRHWVRCYjhyMG9hSWR6RWtQZ3c4K3pqcGVEMWd4VG1PN2kvdDlNL2Zt?=
 =?utf-8?B?dkhQNnlUcE9taXZ1cGN4am0vdndNZk5MMFRqWDdvRll3cEg5aFFtUkladTBJ?=
 =?utf-8?B?MGlqUG5ieXRteDdReWR4elZEQWN1OC9xd0hIYUwvVE5yK2tQV0lZMWpKbERP?=
 =?utf-8?B?OXNabXpCRTJZK0RjWG5kTnpsbnd5ZW16UGlWUzJZeENxRXU4NnFucEZMMHpP?=
 =?utf-8?B?N1Y2NlVyNnVKaFZteWFHbDRROHBiM3U2RE14cGRSQUtudWRRZWJjMTVzMmMx?=
 =?utf-8?B?Z1MxVFdPUng4Vlk1d2VMdVdWTFEvU2RNbDJzL2p3NGtEL3J3bnpiMUEyK2Z6?=
 =?utf-8?B?ZG4yeGxiZHZJOUpuVTNUMlJyaHRheHVnQkQ0RzVzVEsvWVhoV3lSSXNWaTMy?=
 =?utf-8?B?b3lNZ0owNThMaUtkaG5HWjFnZ2pDeTZmdGg2TFJwRTVrNFdGN3hKK1d4UFJx?=
 =?utf-8?B?S2ZHZUo4NFByMS9odzZGTlFmK3h5VEFDcExBODI2czJ6SlM0Z2pGYWYyVm9Y?=
 =?utf-8?B?WTQ0cWVINm9POWpEYi83aW1xdTArTmxEczhHVnZWN1V5dWExQUJxNnlOZEZ1?=
 =?utf-8?B?NW5zNXNaZ2ZwYmQyaW8vWkpXNlErTnZ3K1M4eHRFVElkZE1sTi9ySW5RRldP?=
 =?utf-8?B?eGhEL1FMZ29VeUI4cDJmMXNHbFU2dHQ5YlY4ZmpveFFrd1lTNXkvZEJpdVlB?=
 =?utf-8?B?T0NuZjljNTVGdlpyVmV0QkNXb2NLaS91SmhvNW1Bb3JjYU5lYzk5cFJINEZN?=
 =?utf-8?B?cHFEV3o0a3h1RjcvVGN3WjIxcWVkQjBDRUt3UjdsUEI0Y3ZQWGpSQW9VcGM3?=
 =?utf-8?B?dWl3YndGWUJvcnlreVFHczBIZGovS0dOMEFRZTAydTAxa0Y5eHBZdzdybTB6?=
 =?utf-8?B?NUx6dldwWWFMN0xnUXpMczlSVWZJOXFiS01uV3JYMWIrTkM2c05FUFVBdWZz?=
 =?utf-8?B?SjRyUmJ3bjFWeGsxVHZyK3RJVnVkOHhzaFdRalJGMEtoL1lLbXJBenBMWWxp?=
 =?utf-8?B?M0dncTZPV0FyZXZCcTFLRWhGM2ZJQ0FDd3JRZXRiUmNkaFR0Y3hSalJsOENE?=
 =?utf-8?B?ZWtnUGhEdURmOENRRGhlWDREL3JsejIrSDdqN3g1dk5Scm4zelEza1FpN1ZJ?=
 =?utf-8?B?OVdlOWhCSlpzWE5ESzRCS2lNbVIxdnFPcStJOWxYcTdzRnh2OXRnRXZIbW1F?=
 =?utf-8?B?ZDVzL1FGSThYeUgrQjlicHE2eHExMHNlSVJuRU00WDhZSEU2ME9CZWFUc2N0?=
 =?utf-8?Q?QwTEpc1Co13SjbgtLGqKHxZde2vSv2Svu1Pak=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(376005)(921011)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?blAzVVFDUnJzcFB2eUY2SkRGcldsNlIxem56UjQycmVSUWlwZWhHMktWVnh4?=
 =?utf-8?B?R05LZS8zdW9LbVpMREF5M08wTk96b3Nrb3psSWpNdGY0Sm13KzhrMU0veXpC?=
 =?utf-8?B?a1JkUjNPaU5RRm9GWWRWandxM0NpWGlyS20zSFN2dzFTU1BUcGtZU1piV091?=
 =?utf-8?B?bmdzK3pOeFppV2tYbzBZVzByVjJlNHFSdk5UeFFJQmxWUlhtRnplNUFwb3cv?=
 =?utf-8?B?dVBORFdMbnUzZ0M3V1JxRW9pcXNZbHZ6UGQzcDZzalRKdUhOUjliYm1MRkdF?=
 =?utf-8?B?clphdkNSSy9VRWFsTjI0OGhOWThTWisxUG5MYXBNMm1CUlZMUzBWdUZwQ3A2?=
 =?utf-8?B?TzQ3ZExOaHJTYWxUbUxLV1hMSk9RY000MkVGTUY3S2trYjkvYzZuMFBvaFJH?=
 =?utf-8?B?ZVRvWlZsTEdDM0FIM3k2UEdpeTdFVlFkanoyczlHQ0toUVYvSk9zTGhMZFkx?=
 =?utf-8?B?S3V3WWZubFA2dE02SGVDSUxiSGdUZDlHZm96cTM1bnR3YS84cmpVU1J3RGt2?=
 =?utf-8?B?eTVqdFJQU0d5N3BacXp3YU1LcFpQMHdXQmx1WW15MzhtdjkzSXZneEJtWU90?=
 =?utf-8?B?TXBJazlBQTJOcWtIRUN4MXNnSEtNMy80SVVBYW9XcmlTSC9waGUvWGdvNERS?=
 =?utf-8?B?YmIxNGtpR0hNV29XUmc1UXhsZU5ZWWVQR0EzaUJFZDQ1ZFpZMmpBWW5nZEll?=
 =?utf-8?B?VGRVQ1BiK3FHQ0lMV1luVk4xTldMT3hOSVkwUXFBU3l1MUtvRlA1d2Q2WlJW?=
 =?utf-8?B?b1ZnaWdZWFZ5RjlqaXFuTzVIZFRheGE1cEdnSzBIR1A0OW9oZHk4ZGM4ZXlQ?=
 =?utf-8?B?Y2NRbHZTRDJDcFd0a3B0ZEN5T1gzNjR4MytLZlVUZGZxcU1xVStkekJlOEZ6?=
 =?utf-8?B?K0o0ZnBXNFhEWE1XazJYSmJkanlFTzhXS1Vaa2xOZy90NWF6RklNejZVZGM2?=
 =?utf-8?B?RWpweUhHdlAvQ3FNVGNZcWkzY3BMQitMTVZMT1pvMnJ6ekY1U0xmelJoZUs2?=
 =?utf-8?B?ZDdYN2JiQ2k3ckRVMEpMWkZlUEFpa1UrbU1RaWFtSHFySmZzUW4wUTBkQUUv?=
 =?utf-8?B?dkpUZ00rdXRCR0xVbGVWNlBOL3NxQUNOdEtCLzQwRjFqdkd2bjBiV1ZDQlJ3?=
 =?utf-8?B?Y0swck10L1gyd29TRmVoQmk1UHpOcmZvb3NzVUZhYS95bmdDbFhHWks0K080?=
 =?utf-8?B?bm8rMFpPd1hmZFo1YkdBaHBQL2Jya0pCQnhGWXBUNFRnSjY2anlXUk9lRGlh?=
 =?utf-8?B?bE1qL2hIYVRQT1JoakQreTU2V2VaY0NEMmlhTC9ldTRTV0JFTUNHWStTZlEx?=
 =?utf-8?B?RVB4L0tDZkYya0pjeHJVVTVqZnJzZUgyV3k2VVEveFo4RitQZyt2dE1CbVJt?=
 =?utf-8?B?aDVUQnpGbFFlbU9ybXRqT3NGcll4N3c5SVNYaTVQRUNrN2FtSS9ydDFXRWRM?=
 =?utf-8?B?d21FTkw0WDQxKytwc1NrU0lWWTdERmR6WkhzalNMMjh2R2tPUTJtOTR2MktY?=
 =?utf-8?B?ZzQ0OHdGNCtPeGR4ajN0VG9ia3EvVHZzK3pxOUVPT2tGTWdwTjlVVTdHL2lT?=
 =?utf-8?B?aWcvZytLRFdJN3BZSEhhTXVuOGFobEU1T1NrWXBLS3FyeU5Dd0VlS2dLcHdW?=
 =?utf-8?B?Z3c2eXlhM0Jrd2lhbnBPRzdvZlNDT0k4ZmlsNGpzMEsxZTNtUVhQYnJxeWNm?=
 =?utf-8?B?TEQwa1puTzJwZC9TUjFtbnQvR2liV2ladGh6NnlMd25MM2ZNZmkwdzgrczFx?=
 =?utf-8?B?cWU4UlM1WmZaYlZsbGxzZDZCOGdpempSMHg2OWF4dWRiMTlGcG5vdHBjMHZ5?=
 =?utf-8?B?WC9VQWNwZlN6YjNtRDdQNll1aXptQm5XYlpUNTY0dWxPdzBBeFdLNFhkOXlH?=
 =?utf-8?B?bDdGUmF2cEdadFdzclBPYzJKalljaTJ0YW83K0dMbk43K2FWZ3NZUlprRHlj?=
 =?utf-8?B?MlpvNmNwWk5oV0FSZ0ZxV1NJSW5mTkpuSEtGUitVM1hIZ3ZENU5mbXBmZUtX?=
 =?utf-8?B?dEtHcE5zT3BUUTEvTDI4ZWJpc3FRd2Y2aUluTnY5WDZubDExV3d4VG8rdm5H?=
 =?utf-8?B?Ri9hWnNCRXIzSnF0RUtQNHVDQllnZTZJK2l2Z01zRXV1Z0hKaUw0dHhOeWJT?=
 =?utf-8?Q?EwXGborLWHO8XAs9wCdq2Ha0M?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D71A5900D6B03F42B9C281A86C70FC5A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae19f07-c625-473d-c7cf-08dc7313647a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 06:10:30.6711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TBBwYGstTkW4epxr/ldC9OHquBOUeY7ll3YZb5WPofPbH47kKfSmO8PKPCLQ4dG4wmE6xm2md1EEM/KiYjvz1gPd1A7Mk6+j9kv5KgnBAKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PARP264MB5165
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
Cc: "puranjay12@gmail.com" <puranjay12@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzA1LzIwMjQgw6AgMDc6MDUsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5QGtlcm5lbC5vcmc+IHdyaXRlczoNCj4+IFRoZSBM
aW51eCBLZXJuZWwgTWVtb3J5IE1vZGVsIFsxXVsyXSByZXF1aXJlcyBSTVcgb3BlcmF0aW9ucyB0
aGF0IGhhdmUgYQ0KPj4gcmV0dXJuIHZhbHVlIHRvIGJlIGZ1bGx5IG9yZGVyZWQuDQo+Pg0KPj4g
QlBGIGF0b21pYyBvcGVyYXRpb25zIHdpdGggQlBGX0ZFVENIIChpbmNsdWRpbmcgQlBGX1hDSEcg
YW5kDQo+PiBCUEZfQ01QWENIRykgcmV0dXJuIGEgdmFsdWUgYmFjayBzbyB0aGV5IG5lZWQgdG8g
YmUgSklUZWQgdG8gZnVsbHkNCj4+IG9yZGVyZWQgb3BlcmF0aW9ucy4gUE9XRVJQQyBjdXJyZW50
bHkgZW1pdHMgcmVsYXhlZCBvcGVyYXRpb25zIGZvcg0KPj4gdGhlc2UuDQo+IA0KPiBUaGFua3Mg
Zm9yIGNhdGNoaW5nIHRoaXMuDQo+IA0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9uZXQv
YnBmX2ppdF9jb21wMzIuYyBiL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wMzIuYw0KPj4g
aW5kZXggMmYzOWM1MGNhNzI5Li5iNjM1ZTUzNDRlOGEgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bv
d2VycGMvbmV0L2JwZl9qaXRfY29tcDMyLmMNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9uZXQvYnBm
X2ppdF9jb21wMzIuYw0KPj4gQEAgLTg1Myw2ICs4NTMsMTUgQEAgaW50IGJwZl9qaXRfYnVpbGRf
Ym9keShzdHJ1Y3QgYnBmX3Byb2cgKmZwLCB1MzIgKmltYWdlLCB1MzIgKmZpbWFnZSwgc3RydWN0
IGNvZGUNCj4+ICAgCQkJLyogR2V0IG9mZnNldCBpbnRvIFRNUF9SRUcgKi8NCj4+ICAgCQkJRU1J
VChQUENfUkFXX0xJKHRtcF9yZWcsIG9mZikpOw0KPj4gICAJCQl0bXBfaWR4ID0gY3R4LT5pZHgg
KiA0Ow0KPj4gKwkJCS8qDQo+PiArCQkJICogRW5mb3JjZSBmdWxsIG9yZGVyaW5nIGZvciBvcGVy
YXRpb25zIHdpdGggQlBGX0ZFVENIIGJ5IGVtaXR0aW5nIGEgJ3N5bmMnDQo+PiArCQkJICogYmVm
b3JlIGFuZCBhZnRlciB0aGUgb3BlcmF0aW9uLg0KPj4gKwkJCSAqDQo+PiArCQkJICogVGhpcyBp
cyBhIHJlcXVpcmVtZW50IGluIHRoZSBMaW51eCBLZXJuZWwgTWVtb3J5IE1vZGVsLg0KPj4gKwkJ
CSAqIFNlZSBfX2NtcHhjaGdfdTY0KCkgaW4gYXNtL2NtcHhjaGcuaCBhcyBhbiBleGFtcGxlLg0K
Pj4gKwkJCSAqLw0KPj4gKwkJCWlmIChpbW0gJiBCUEZfRkVUQ0gpDQo+PiArCQkJCUVNSVQoUFBD
X1JBV19TWU5DKCkpOw0KPj4gICAJCQkvKiBsb2FkIHZhbHVlIGZyb20gbWVtb3J5IGludG8gcjAg
Ki8NCj4+ICAgCQkJRU1JVChQUENfUkFXX0xXQVJYKF9SMCwgdG1wX3JlZywgZHN0X3JlZywgMCkp
Ow0KPj4gICANCj4+IEBAIC05MDUsNiArOTE0LDggQEAgaW50IGJwZl9qaXRfYnVpbGRfYm9keShz
dHJ1Y3QgYnBmX3Byb2cgKmZwLCB1MzIgKmltYWdlLCB1MzIgKmZpbWFnZSwgc3RydWN0IGNvZGUN
Cj4+ICAgDQo+PiAgIAkJCS8qIEZvciB0aGUgQlBGX0ZFVENIIHZhcmlhbnQsIGdldCBvbGQgZGF0
YSBpbnRvIHNyY19yZWcgKi8NCj4+ICAgCQkJaWYgKGltbSAmIEJQRl9GRVRDSCkgew0KPj4gKwkJ
CQkvKiBFbWl0ICdzeW5jJyB0byBlbmZvcmNlIGZ1bGwgb3JkZXJpbmcgKi8NCj4+ICsJCQkJRU1J
VChQUENfUkFXX1NZTkMoKSk7DQo+PiAgIAkJCQlFTUlUKFBQQ19SQVdfTVIocmV0X3JlZywgYXhf
cmVnKSk7DQo+PiAgIAkJCQlpZiAoIWZwLT5hdXgtPnZlcmlmaWVyX3pleHQpDQo+PiAgIAkJCQkJ
RU1JVChQUENfUkFXX0xJKHJldF9yZWcgLSAxLCAwKSk7IC8qIGhpZ2hlciAzMi1iaXQgKi8NCj4g
DQo+IE9uIDMyLWJpdCB0aGVyZSBhcmUgbm9uLVNNUCBzeXN0ZW1zIHdoZXJlIHRob3NlIHN5bmNz
IHdpbGwgcHJvYmFibHkgYmUgZXhwZW5zaXZlLg0KPiANCj4gSSB0aGluayBqdXN0IGFkZGluZyBh
biBJU19FTkFCTEVEKENPTkZJR19TTVApIGFyb3VuZCB0aGUgc3luY3MgaXMNCj4gcHJvYmFibHkg
c3VmZmljaWVudC4gQ2hyaXN0b3BoZT8NCg0KWWVzIGluZGVlZCwgdGhhbmtzIGZvciBzcG90dGlu
ZyBpdCwgdGhlIHN5bmMgaXMgb25seSByZXF1aXJlZCBvbiBTTVAgYW5kIA0KaXMgd29ydGggYXZv
aWRpbmcgb24gbm9uIFNNUC4NCg0KVGhhbmtzDQpDaHJpc3RvcGhlDQo=
