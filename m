Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 730508CC139
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 14:26:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=cPNVHDN+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vkr2v2gjPz3vks
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 22:19:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=cPNVHDN+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vkr2674qZz3gF6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 22:18:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7WMClAu0+ScIeXNV5yf6Nzpb6BZeXb/oU8kmKAHBeir/y4u3o7wzURIsflovkMsbqdtuWgzH7IeFs82RotMK5mVjzw1krl0EkSc+91oRSQWmDkdRKM6Wqjaj37d1wNsL1Y9HxsxNzyr2ZIUlKFgEo0glh7x8NDgYfhJRDj2IJh4UuhiMtb9WL3vJJZzgYoSg010gwilVMintUR5Ud7buvd3stc8gTZQ7mMTf54KiHFRhSIX2abOpqw7RWzrsDOCScq+rWExLMq+Okg+UMh0qS/sUn1Y3efq9ayh6ZQJAeKUcddL8zH5lOrTn3d0z6ozLtsjS9IfMchAbhTtJcIbPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ok+l3LT3gNi7GOeLwZPsnUK7gAt7NKdi6A5dIV1qyI=;
 b=YjrzTVRcxr80E49PLEoREseMQZIJiR3v9KNZUcnVlEHe6ooOdJiSTRt01wQfkP98AM9JS0Jl3+SlsbDmz6Mbj238qeYzlfAuIAKepgIoWucxIQEaecl2KbmPk+8VOuGUA7fKXrXvxYEfsEw7FiGL8n6WfzjajemW6tiURKhHaeYV0zklk8UCJ2lO2hi7GIDT+2RXgU2kH6Bm/egQJpmjfJ0hcO3fpGHA8TFR5f/u6BGpUsUB9Yg5PSo3GzPBUEH4bDe4wCn9XU7oMAH6HsheKPXy+4nyuGpfeGrxSWtadrn9G4gZ5vrtcakNK+TPRtGyJTSwfAoMpOqEzn3r2g+GKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ok+l3LT3gNi7GOeLwZPsnUK7gAt7NKdi6A5dIV1qyI=;
 b=cPNVHDN+rG3Yl/arwtqiIqh4rNzmQvSadkyX3nUV1HwB7YI8bHGqHzkizJydnzil1cYRZ9Pl6gYJVWaQxVKktHofa/lse2kEAqcfWIkUtfHXXpUo1fFrfZ5ywXoVcx1udW/CBmXtFTJM49iApcxFBIX6cNZiloQbqI9Mus4/dudfzkRsUHsf3Qdx0/yKjng9C7/NWGfh3gY1MmnqQ61ETvtBXNgyacsVrc/KHWYkiXo9L8Z/wMucMs3jXTvXQE7jQhqUrdTuTW757l49lrhx7WMGEs+ahWOBRPBS2jC875zXxTMbqNCN3ZX+M5P118IQgN5Pmq+IrbXMmF58BVTqig==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PATP264MB5334.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3f5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 12:18:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7611.016; Wed, 22 May 2024
 12:18:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Oscar Salvador <osalvador@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH v2 06/20] powerpc/8xx: Fix size given to
 set_huge_pte_at()
Thread-Topic: [RFC PATCH v2 06/20] powerpc/8xx: Fix size given to
 set_huge_pte_at()
Thread-Index:  AQHaqIxxLOw0k+xnhUqWHgWN6F7AE7Gf2z2AgAB6CICAAIrJgIAAkNWAgAGDQgCAAD8FgA==
Date: Wed, 22 May 2024 12:18:19 +0000
Message-ID: <3ba5fdd6-8d37-4c82-91bf-0517bb751901@csgroup.eu>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <04f4e737608ea0b177b88057db138fbf0d6ab138.1715971869.git.christophe.leroy@csgroup.eu>
 <ZksUiwNaKx2n1fJO@localhost.localdomain>
 <f26807dd-bbd2-405d-9a88-c0654c525a5c@csgroup.eu>
 <87zfsk2dnu.fsf@mail.lhotse> <Zkxo0xmTHgjgBtKw@localhost.localdomain>
 <f09a21cd-4152-44b2-9874-5afaa894bcbc@csgroup.eu>
In-Reply-To: <f09a21cd-4152-44b2-9874-5afaa894bcbc@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PATP264MB5334:EE_
x-ms-office365-filtering-correlation-id: 1a5091a9-ee30-4d3c-ae2b-08dc7a594450
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230031|366007|1800799015|7416005|376005|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?Uk1CUUd6bnpPUlFrNSs1QjdlWHZzWDJmSWtUY0FlVkVjckhqUzlXV0hXamNY?=
 =?utf-8?B?VGNqeXBtLzh4LythcE9VdWtYbWlkU211NFZrSm5oZWRxM1JUVWgvbGdOb1Bv?=
 =?utf-8?B?bys5V05aNXJKUXV2UkxpcXZqVEhRdTMyRUtia3lBd3N2bUl1TjR4T2VMZ1Fj?=
 =?utf-8?B?UnRJelc0U0xIQ0Yzd1E0YXFjKzFrN0lLeXJhN21MQjhnZ3RUKytUTlExdE4y?=
 =?utf-8?B?dnpwZGs2SG5HUy9MZklzZFNQRk43R2NGbkFJdFd0VUJQOTNrOHBKU2xPUEdK?=
 =?utf-8?B?ZWErSjNJZXdzZDVIb3dXTGxXWEhhMnJCTUNnWkxkcDg4NnlzdE5TZnFucmdL?=
 =?utf-8?B?SUtVb3VTVGRqMTZlNVNYdjNjdlVWbUdTRnZYTis5eUFpUFFRNTAwQnZ0dDlo?=
 =?utf-8?B?ZFJxTE9LcFJVWUhteUQrT0NydXoyTlhPVzJuNkZOU0xDbXpjRllYMDdHMFhw?=
 =?utf-8?B?Tlo5MFZvN0ZHbjdHckFtYktVSzhWWGdrMzlzc3UySUx0RUdzL1R1UWsyQUFr?=
 =?utf-8?B?N2ZzMjE3Yjh4V1ZCNFkvK05aS3NUQzhPWHpNTjZPNFpzanBEK3F1UWlRdzcz?=
 =?utf-8?B?WEJNVk5XY1JFU1lXUWdmMWZuY1grS0pTSzNNVjBaWlp3MlY5NXZuMUx2NXlE?=
 =?utf-8?B?OHc4VC8yVlZoTmdoT1F0T0ViU29IL0VHa0VmcncrOEhtak1CdW9NTkxLU2Ft?=
 =?utf-8?B?Si9JWTZSYUJETlZBYlVlNXVGV0pNVzdCOXZXaGQxWjZqVXlpaFM1Ujk2YXln?=
 =?utf-8?B?STljWUJHaEpyaGp6Z1FFN3FEbFV3K2JMQ3JWR0k2V09oNFlqVzlCUkU3NmJT?=
 =?utf-8?B?d2doZnFiS1V0MnRPaURKa09NeEJyWUJxelZxa1NpbzVMOW9NaDc2TlFUTzBS?=
 =?utf-8?B?YzBwQVBpajJ4bVZFejBCdzBlbUIweGFOTUZLcTA3cm1zQVI4b2gxbThuZTUz?=
 =?utf-8?B?NFFJMjEvZEg4YTFVUGlhYmhlQXZHQjhIME53QktlSGYwcTVMemtJdGN4TGcx?=
 =?utf-8?B?Tk9YZEZ5eXNpWElESHhNb3htS2FDblpFMGI0bTNxbW1UOHFzU2htN0ZDYkZ3?=
 =?utf-8?B?L3prZis4emNLRHRPTGtET0Fndi9uYjJjWVdaL3I5Wkh3OVhGRmxwc3pQaXNP?=
 =?utf-8?B?K3preHFyL2RTemphRXZzd1hjVyt5WDFYMHQ4YlRWNmRQT0VrMWViT3lJV3NK?=
 =?utf-8?B?SU9LL1lqVmF5SWlra3c4T0I2bDN4RVNCd3V6Zzd2aW4xeDFQOE5oNVpDQTRS?=
 =?utf-8?B?Mmd1Y3AzTzZud2Y2MEhLbVVVaGFHcXAzV0xSRktSZ1B1aC96ZmI3WWV1UXFH?=
 =?utf-8?B?MFZuM0l1R0p5SFNVNUhNa1VsRVNqNlhEMVdpWjBVWTNaNVR1TStoOWllNW92?=
 =?utf-8?B?Nlh0ZWFkb1NiQ3hYajAvSzd2ZTdlVmd5MUpoeXk4M0k1N1N6SjJTRmFrMEho?=
 =?utf-8?B?NGs1ZURsZHBaK00vRUprK0I3cHVpb2xONVhPYS9zQnJKaTEvcWZMOVBZWTBH?=
 =?utf-8?B?cDBxUnRTamdsTCt1Y2I4MklHTldoWmNxT3hyWWhtU1lqNm0vTExKaUVldFRY?=
 =?utf-8?B?azVIR29UZDlqOStDbFE5TXdUa1JOM3Y5dk5ZWHdOV0JqL3pUM1RDTllycWZM?=
 =?utf-8?B?d3VrV2VqdDlZZThHc25tVmo3MEpmUkVyZWJKaFZjNkNTWHVRSXQyWGFBbDNk?=
 =?utf-8?B?a09zTW9ONWp2SFE0TUhwVHVFMVNBREIrdVdRTFVnWVhTa3dXcFV1TlVpUXA5?=
 =?utf-8?B?SEJjaWhiRmNrZzJ3QUowYUtGakU5UjkrQU04cWF0TDNwQzBnVmoxbW9YZHk4?=
 =?utf-8?B?dk1DVHNsU0JBOThzWEZ1QT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SWZ5VFpoVXZvY2wva0tyQmV6ZU0vdWhodU95WG1pTk02dDVKSkxoQUg0NGZ3?=
 =?utf-8?B?MVdjU0g2NGRCYWJvWkhlTmhsRWNXRklmQS80bkhOTi80ZnQyWHROandweWN5?=
 =?utf-8?B?WVF2bnA1ZXhVNUJhNUJZQUJnWk8rWFFsR0ljNjlEVTdVLy8rT2JCSFhJSG5Y?=
 =?utf-8?B?eGRoQ2RLU1lFcW55TE1ZY1E3UjVpMmpQWHNrN21Ocm51OUc5bktPZEdoV1E0?=
 =?utf-8?B?U0hwYmpzWVlQZUFhZDl2eTdWbEhVL3J4SkNHT095MWh6QTk1SmtvZVdCc1lX?=
 =?utf-8?B?V3hDejRVcFVvNzluVlp0aitDelIvcnhTTWxESk5ZQlF4VVh0QTNHSDFFTUc4?=
 =?utf-8?B?blpRb2ZGb1FRZjBwOEtmWWZvbFl4ZkdIUEJ4WnZCdG0zWHdWUkxRWEh3d2RZ?=
 =?utf-8?B?ekN0SlQ0eVpGYWgwQkpWR0szVmVoVXd0YXVuMlhPekJuSmZXSXhGTXNvaTZ3?=
 =?utf-8?B?eEEyWHVxekFMMzA0Z3hFc0c1dU9nQWdsSHpVeDZhTlhNVlZFZUpJSk5DdDRq?=
 =?utf-8?B?RVJNeUJ0NlIzN1gxK25EWXNKNFNyZWQrMDZ0OUVLVlErdzM0d0NYMy80VDdi?=
 =?utf-8?B?K0ZxMGFNbGdnYVk0QSswbU5lYllNTWtxbVhLZ2xOaU01YVRuNkJGaXNuWVd6?=
 =?utf-8?B?MGxCcFRvdVlSdFRvMldhb0RGdkVXWGVua1FwSWRKT0tEZzV1dlQwU2FyeHQ2?=
 =?utf-8?B?cFdlNURpYUM5T3gzbkc1c3M3RFFWaytXb1hSUW10NVREdHlDRm1TbjdyNXR3?=
 =?utf-8?B?Mll4TE55U0IxYnlnTVpKSDhIdHVJZlBwNlBrMnNwMG1PU0dkb0pUNFY0Njh0?=
 =?utf-8?B?YWpkU2dCb3FGVzJRR015VkJ0RmFXbTZaSk56MmVYRjlmYmhZbXdrZjNiNi9v?=
 =?utf-8?B?R0laai9BRFNqQ0JGTDJVeXRaWVBVckRydW43VWM5MlFNUDBVM0d5NFppaWwr?=
 =?utf-8?B?L21wRTA5b1NqZ1FUT3RHSUx5aTc5elhhRzFyOTZRVDk1d1dUaDhwaGhnbWpW?=
 =?utf-8?B?ampYb0tHd2c0Sno4VFVQTkFvNjNUOUNOY0N2WFZMVThoRDZkVTkvOWFnM2Ni?=
 =?utf-8?B?YXlMK0xBTSt0dmFUbVBDTWFpQ3EyZzVid01BWG84ODl4aWtEZ3NLTmlIeGxX?=
 =?utf-8?B?VENEVXYrRkxMaFg1UXp1d21VVUxmR0JZdDZ5RGRqUjVpUUhCMENUcVFOeVEv?=
 =?utf-8?B?OXF1Q3FIUHFReUhpbll1a2oraGJJYlB1N255eURIbUczRnQ0RHRiKzZhSE1q?=
 =?utf-8?B?dThuUTl5SlZHY2NhRUdVZkFVaFQzeDdNUUEzOHBaUzVZWXZXRDFzQm9iN0Fh?=
 =?utf-8?B?QjFPTWVMS3M2OURGQWo5dlJqTDVnNHBXaFdWVmVrYk9hdUIxa1EvYk0wWWxX?=
 =?utf-8?B?UjJmbW5tbjZYVDdtOEtOQWRFWlUxNWNNYThOSVlwK2d6QkFQTWhENFFVMS81?=
 =?utf-8?B?dGFUdmJHUUwxS3hUaDY5MC9NajIzSzNzMXN2dEowdWk5akFSdUVHZ3hpUTJY?=
 =?utf-8?B?YURrRUQxVTNqTEtPdTJvNzhKS2FqTlk0TVdML2dwTXRNRVVGVzFuZ2hDZXE4?=
 =?utf-8?B?Q0hqYmcxZE9SOHlqek5SWVVlcS9OZjBtOEZHTzdCeDdGWDBhdHZOTlFFamx4?=
 =?utf-8?B?ZFczMTBXclFMTmdnN3AzdFJxa3c2M21vMVZhNFc2MWdGYm1pRHZESURGOVF0?=
 =?utf-8?B?SG9seGt5Q1BQdnlVclRUUzYwa2xZc21Dd0hlb0VLQWE2WWZSSCtIMFVyVDds?=
 =?utf-8?B?NE9XNEdpWUVlUE5VUlAzNEFzOXNydERReGJPNkJpazRIMVBiNzNVdlVRblpX?=
 =?utf-8?B?RG9MUW5IOW9PaG1FdzM0WUUrM3dFckRvVm9uNWhaQmtjWW8vVkVnVVRCR1JP?=
 =?utf-8?B?NlY0WDg4TnlURFEySzArTVZaU3pZemJkM0tvekVpczVyOFB0WmNTMVMyVDlG?=
 =?utf-8?B?UTd1dW5xSEpEdXMrS0x4a09PaTBCRTJzbFJ0MVZKVUI1V1YyQWZnQ0VVM1hZ?=
 =?utf-8?B?U1lpTlpUaVk5ZERNZkRoMjVZM2hqa0dxVVExMWZnSENRY04yWW1KcjY0RW53?=
 =?utf-8?B?eXNGQUsrSmJUbWE1N0FnOEZkbzNpRnNTZldHMmpFZ21UMFd4TGM5MC9MN2tL?=
 =?utf-8?Q?ueH9pbDNwWbSJT1Z92cIj/jF6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A1DE54CBCBD5549A736273646201088@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a5091a9-ee30-4d3c-ae2b-08dc7a594450
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 12:18:19.6125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sPQxWGNYvHqHi5yu2LGU3ybzsrYAACPqrg+dAiA+P4oxdS/axF9z6oFcev9cO9xrfHuaGPos3AZQ8HmT0qknHtIPwQfxgxV/OBVRagbqaoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PATP264MB5334
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

K1BldGVyIFouIHdobyBhZGRlZCB0aGF0IGNvbW1pdC4NCg0KTGUgMjIvMDUvMjAyNCDDoCAxMDoz
MiwgQ2hyaXN0b3BoZSBMZXJveSBhIMOpY3JpdMKgOg0KPiANCj4gDQo+IExlIDIxLzA1LzIwMjQg
w6AgMTE6MjYsIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+PiBPbiBUdWUsIE1heSAyMSwg
MjAyNCBhdCAxMDo0ODoyMUFNICsxMDAwLCBNaWNoYWVsIEVsbGVybWFuIHdyb3RlOg0KPj4+IFll
YWggSSBjYW4uIERvZXMgaXQgYWN0dWFsbHkgY2F1c2UgYSBidWcgYXQgcnVudGltZSAoSSBhc3N1
bWUgc28pPw0KPj4NCj4+IE5vLCBjdXJyZW50bHkgc2V0X2h1Z2VfcHRlX2F0KCkgZnJvbSA4eHgg
aWdub3JlcyB0aGUgJ3N6JyBwYXJhbWV0ZXIuDQo+PiBCdXQgaXQgd2lsbCBiZSB1c2VkIGFmdGVy
IHRoaXMgc2VyaWVzLg0KPj4NCj4gDQo+IEFoIHllcywgSSBtaXhlZCB0aGluZ3MgdXAgd2l0aCBz
b21ldGhpbmcgZWxzZSBpbiBteSBtaW5kLg0KPiANCj4gU28gdGhpcyBwYXRjaCBkb2Vzbid0IHF1
YWxpZnkgYXMgYSBmaXggYW5kIGRvZXNuJ3QgbmVlZCB0byBiZSBoYW5kbGVkIA0KPiBzZXBhcmF0
ZWx5IGZyb20gdGhlIHNlcmllcyBhbmQgZG9lc24ndCByZWFsbHkgbmVlZCB0byBnbyBvbiB0b3Ag
b2YgdGhlIA0KPiBzZXJpZXMgZWl0aGVyLCBJIHRoaW5rIGl0IGlzIGJldHRlciB0byBrZWVwIGl0
IGdyb3VwZWQgd2l0aCBvdGhlciA4eHggDQo+IGNoYW5nZXMuDQo+IA0KDQpJIHJlbWVtYmVyIG5v
dywgd2hhdCBJIGhhZCBpbiBtaW5kIHdhcyBjb21taXQgYzVlZWNiYjU4ZjY1IA0KKCJwb3dlcnBj
Lzh4eDogSW1wbGVtZW50IHBYWF9sZWFmX3NpemUoKSBzdXBwb3J0IikNCg0KVGhhdCBjb21taXQg
aXMgYnVnZ3ksIGJlY2F1c2UgcGdkX2xlYWYoKSB3aWxsIGFsd2F5cyByZXR1cm4gZmFsc2Ugb24g
DQo4eHguIEZpcnN0IG9mIGFsbCBwZ2RfbGVhZigpIGNvdWxkIG9ubHkgcmV0dXJuIHRydWUgb24g
YSB0YXJnZXQgd2l0aCANClA0RHMuIFdpdGhvdXQgUDREcyBpdCBzaG91bGQganVzdCByZXR1cm4g
MCBsaWtlIHBnZF9ub25lKCksIHBnZF9iYWQoKSwgDQouLi4gYXMgZGVmaW5lZCBpbiBpbmNsdWRl
L2FzbS1nZW5lcmljL3BndGFibGUtbm9wNGQuaA0KDQpTbyBpdCBpcyBwbWRfbGVhZl9zaXplKCkg
dGhhdCBjb3VsZCBldmVudHVhbGx5IHJldHVybiBzb21ldGhpbmcgZm9yIDh4eC4NCkJ1dCBhcyA4
eHggaXMgdXNpbmcgaHVnZXBkLCBhdCB0aGUgYmVzdCBjYXNlIGl0IHdpbGwgcmV0dXJuIGNyYXAs
IHdvcnN0IA0KY2FzZSB0aGUgcmVhZCB3aWxsIGdvIGluIHRoZSB3ZWVkLg0KDQpUbyBiZSBjb3Jy
ZWN0IHdlIHNob3VsZCBoYWQgc3VwcG9ydCBvZiBodWdlcGQgaW4gcGVyZl9nZXRfcGd0YWJsZV9z
aXplKCkgDQpidXQgdGhhdCdzIG5vdCB0cml2aWFsIGFuZCB0aGlzIHNlcmllcyBpcyBhaW1pbmcg
YXQgcmVtb3ZpbmcgaHVnZXBkIA0KY29tcGxldGVseSBzbyB0aGVyZSBpcyBubyBwb2ludCBpbiBm
aXhpbmcgc3R1ZmYgaGVyZSwgZXhjZXB0IG1heWJlIGZvciANCnN0YWJsZSA/DQo=
