Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 014168CEE18
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2024 08:51:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=io32y1Nd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VmXTY4F3Kz79y6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2024 16:45:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=io32y1Nd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VmXSs2rD4z79lM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2024 16:44:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPB8LUd4SWokm4/RwSRrBCxxTI2PiDY8HIf1/f6PIw9caONhPaqZVQHi7Z1A3KP5zrlHCv5iXyGDEWaxG7sl0zFKw+luBE76OR+5zsoQuDH0uT8xvBFMy8OuRccW/C1sIBlbnBXJVYXonZfkAi9UKPr60bdB7Gr4PzRTL6N23A1GyCIW0dMf6fqAYkYiO6ryXRgBLLAb5lVRREIhdzW/4/bPw/UXiJqi+l1Hk04W5jI2GCT8+HDp7E6V98Rj2cKezEWNNbBuODcHEqOnip6IqxxsEcbmVKb/qbYI3GX9385w3bHLYR3e9Iij3x/4OegUqnVuBlBjWX12tjAiSEseLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIyxDz97RWBs0pkSooA3We+ZV17leJoU7ZpF+CZkWUE=;
 b=W3nl7wLL/eGeDIA4Z2ALHtXJv/zDyi16xMCfJqM7VwCkZ0vCE2bpg6kifkEttR4zv1WGdNcVjyiWIr6JmIbNVdHLZY9eFUy3Z3O41civ5Ei+zNNCll0YQBQ3IZkBnqQX3KfUt9gBiLgoMrkAXY/JENlgChvCdJ5hoXZMnH+UzB/BERa3Mx0lGI3m07mNZSDKQdFKuNJpVkgoaaw0k+tCYqsqNwqia36VMCGwbwNOzKzl9vBqzrPXn1civ32Gr7qoZxN7KytNKBQ/mhQBJWJXcff1WPK96uWWcQRSzU1VaQzkCKNLiRZX2+CbaDQrw/vgoiCjUJOtD+PPKZJvkwfHJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIyxDz97RWBs0pkSooA3We+ZV17leJoU7ZpF+CZkWUE=;
 b=io32y1NdD5EHwm0XbRcT2LrC9JXdfnnGV0SVemTABE0GZGf6KwfIE73L53HPzsyuFTDHekrv6s00jzgatClbeIyjrcED/A3NmM2u1N+TfZ/6eoZd/qC8pwoYt95GH5Y0FPwCRaFDp8uWlUdDOsYvutp77yZowWLz7N6Li1Vh/ahQdR90DFdy3tJDfEf7lri1GKpdEQFgP07DlTkMHC4Whx252n5f+V1Q6mJm7ADV+7bpewM1RiYJVyaajbFDmFnyK+0zmfQWCMM+721yPVpQsFVw+gxHbcyxiAYEPj9ICeNIYeKvsNNSfasVgOr7ipcXf6Fq35jk+/zhN+nHMpfhFA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Sat, 25 May
 2024 06:44:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7611.025; Sat, 25 May 2024
 06:44:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [RFC PATCH v2 11/20] powerpc/mm: Complement huge_pte_alloc() for
 all non HUGEPD setups
Thread-Topic: [RFC PATCH v2 11/20] powerpc/mm: Complement huge_pte_alloc() for
 all non HUGEPD setups
Thread-Index: AQHaqIx0MP6iulWHnE2alhVNihc8I7GnZ0EAgAAlhYA=
Date: Sat, 25 May 2024 06:44:06 +0000
Message-ID: <d7da9fcb-2516-4233-b24f-22391cc7a553@csgroup.eu>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <59a1390923c40b0b83ae062e3041873292186577.1715971869.git.christophe.leroy@csgroup.eu>
 <ZlFpPBlLoBZNjd73@localhost.localdomain>
In-Reply-To: <ZlFpPBlLoBZNjd73@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2055:EE_
x-ms-office365-filtering-correlation-id: 44380e68-b4e9-41d6-f97d-08dc7c8612d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?M2NpZTdoNFk3T1FsY0liQ2o0ZFRNbHc1LzFrdHM0eDFEWVY0QWR2cEhFSXYy?=
 =?utf-8?B?SW01dStjSkVKSkdDeGFHQTVOclRsa0R0cWcvcVcwWXYvMWZhalhpNFRucnFk?=
 =?utf-8?B?b2l0UktaMDk2R0dwVVJOb2E1OGZjMVRNSVRreDdqSi9LM2NqMlorbFBmeU1K?=
 =?utf-8?B?ejcxc1o3aUd5V05hd0U5dkk0M2Y0cVozc1lkK1AvMWtGUU9UR2REd2d0dTFr?=
 =?utf-8?B?aTNHdUczbVRqR0FOZ3NIazBQZW8zdHMvNldzYTNxWjBRK0NKRyt0UktkMmlv?=
 =?utf-8?B?ZFRvb0d0Y1hSY1BReGgxc1BISktRcDNOR2ZLQ1FrcmhIdnlnakp4bGFOQXFS?=
 =?utf-8?B?NWwvREtFMVNjM3oyQ2NQR3gwQjN4c0VFOHRINWFIcFAyQkhzQklURGFBQmtx?=
 =?utf-8?B?Q1ZYKy9nOTQ5dFR2NVYyYnF5Tld6OEJ1K1FBcy9hMFpPTFpiMUo0WEViZVRo?=
 =?utf-8?B?eEJFSXlkZW8wZHhoSUQxMk1NZ05kOGZMUW1YMjhTVGtwa1RCNGd5Z3RlRFRD?=
 =?utf-8?B?MngvQTZYeTZVM01EaHFNcmkrNUNzdGplLzViVHd4c0d5M1ArOEVzK1MrYTFM?=
 =?utf-8?B?ZE45WEVrTThQTEFJaGgwWFBoVml0NnZtcjdMSlBGc01NRWpqZERVanZzcHdQ?=
 =?utf-8?B?SFNQYlV4dVpjK3BaSnFLcjI0L2wwV1llZEdwTk5RcGtuY2t3Wjc2cWlJNGw0?=
 =?utf-8?B?dFByRVQwYnNYZkp5M3hFV0pyMCtsR0hiR3ZtMVlnUE1haXFoQ01ZQ0JWbmtl?=
 =?utf-8?B?emJTU2p2Y1dBcFBZWjFOQVNTNHl4d3YzSUFMQ2NveEdMejA0OGh4UnUxQkRN?=
 =?utf-8?B?dGhBWkR2UzQwQTRrSVRWbTRvVHdFTDkxQUlWaE5GVGNOd3ZoM0gvTnVYanBr?=
 =?utf-8?B?T1U4VEcvcVRsbGE1MHZHU1BqRmRTMEQ5cmNCdjRLRkYvOTQxKzBQM3JHREdx?=
 =?utf-8?B?MTFEREFvYWFLWDFJaUdYa3cwQWRZcFkzREhjRHVYYnhydTU0bjdEeFRnd2I1?=
 =?utf-8?B?VDdlaTRjNk5lQnJZT2x3Zk9xc2xLYmVPdWpUWC9mdEZNUUIvcERIU3VkM1dr?=
 =?utf-8?B?c215V3BvSmZRZ3ovVFA2UXdCQWgwcld2cGMyMSt3Q1N0em9LWC9nV3hEM0RI?=
 =?utf-8?B?cnI1aVBSK2x3N3NGQVhFdEwzeDM5TlYvYXg0ekE2YURiWjRXTWUreW50a2Q3?=
 =?utf-8?B?Y3BZaElxVlB1bEJabFRGYWNLdWpOMzNtakVCSHh3VXZNK0pSNytHZUZ6WVVl?=
 =?utf-8?B?Rk9sdGpBRDREZnVZRk9TWVMwNXhUQmhqU01mVXR3UW5IOHJrYzkwYkVmZHZV?=
 =?utf-8?B?MytpdWhLajA1NTVJSzZEM1lYNzZzSjducHhTL3RUL0xvOTJzTHBhMWxqS1Fm?=
 =?utf-8?B?enBLbEkyb1Nud1lSWGNKZWJuTXhWWHc4QWo2Zm1RL1BrZ3grNkM2VHZYdmR2?=
 =?utf-8?B?eElteTdJWDM5SXNOL29TRTQxT1NTck5EaDVVTFNaeko4TjNTV2Yrd0FWYUZ2?=
 =?utf-8?B?SHZldDVoRlJDeVZjd0orTUdrM0FQbTRyYjN5RlV5SFJKWE02eDd5NU56YU1C?=
 =?utf-8?B?Q1J4aE9XSkxJZmhubkJNYWp0QktUUHkvTFY5Zi9adzErTUFWbmd6ZS9LT001?=
 =?utf-8?B?ZVJ2N0hGdTlIOHpjNnIrUHhGby85QXBWZVJNTmRmeVBhVkN4c3ZHZXI1Vlp4?=
 =?utf-8?B?MWNHZW5LbnQ3WXRVNFVqSGhuMnFxcDlzRzN5Wi9ybGh6Zzk5MU9CREN2Y3VQ?=
 =?utf-8?Q?svi2VRzKpEH/zxsgeuo9kxBwGg6i+qSad/aJnNe?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NnFENzlrU09lUTZzTlBMVTRRdi9IdUdVbHFJMWdycGV4RzVpQml6cXB0Zmcx?=
 =?utf-8?B?LzlscExIM3hZSUdVUi8zUUFYS0FLaXNvVUVxamxPVUs5NEFyL0FNWlBFUVAy?=
 =?utf-8?B?VnN4NmIraFUrYlJ5c0QycmtMaUxVbjdSMlV6SUF6c3huamRYTEtLek9nRFhE?=
 =?utf-8?B?bnZEdHk0MlJrTTJIV2dZM2plZkdCcHUxc0FLdFZhZ1NwdlhVKzBXWmZDejVo?=
 =?utf-8?B?RktsRnVFMVRGZmFoU3BPejk3OWxiM0dZLzE4dUxrZVN2ZXhNOWo5WFk0ZFB6?=
 =?utf-8?B?N3Y2emlLZ1VhTk9iSXZpM0hRbkpPMldrR0QvdU5HeGVDZTdkcmsxUUVjNmRt?=
 =?utf-8?B?OU1tOFVScy8wRGJmZXhBUmUyK2F0V2tRUGNvOGdQN1lWRThhRE5DTHR2V2VL?=
 =?utf-8?B?TWo0Nk82Z3R2WmZ3bGt5QXkrR0hwUU5SZTNFdW1CZkxqYVNtQUxkL0t4Y3JG?=
 =?utf-8?B?YjJtRXU3TVAvVmJFYTVHME53aXVTRmRuSlN2SnBsTE1XbGZVU3JrYlE4aDlC?=
 =?utf-8?B?ME5rekI5dzRCU1plSkxpeDF2bkhEbmVKdFZ1QkRVQjBsMjMwTGVuQkpGMjFV?=
 =?utf-8?B?Tmp0LzFDNENWV2pJTlg2dDhPRE9XK0Rrb0Y3N0RYN2pzYjd2SEtUOTFRZkUz?=
 =?utf-8?B?MXlwUmY5YkxKR3Q2bzJPTnFlVG02dUtEOXVjV2hEZEYxdHNzb0IweXZ0NVl0?=
 =?utf-8?B?ZkhBeVlJenJVQ0R0SXBRU3lnNHEzZU54SnR0TkpaM3RJdVdUK01xMmIvZEJm?=
 =?utf-8?B?K0VTcnRYdnhEa09hUm9BWlFmeENxWGdCYjVZZHY2b2hGZWFteXZVck4rekVB?=
 =?utf-8?B?NExmUXRxSFVEZm8rZngvdkJzNzFLd1JxdXVqYU5pcGtFNExYQWRSMURQOXY4?=
 =?utf-8?B?cE5ka2dMelFOMnVWVWdSU0ZrdUJ6TFFBY2ttVWYvVUdOQzhkbEZlN0JRMm53?=
 =?utf-8?B?K0tYSDlaWWt6bWJjR1Y5SHpydkhIWmlzMkhEV1Jld3N6ei9TaTBlVWVCVnpI?=
 =?utf-8?B?N2Y2SGp6RlVvZWRYck40cUFueU15YUNmZkdmRkNoeW0zTWtjTW92enZyN0pQ?=
 =?utf-8?B?aERYOWs2S2tkbEgyaUVvNGc1azBqYW9ENisvUnNiZjhiRXQzdVdobjdXUDhD?=
 =?utf-8?B?RmVsRVQxSUI2N1B0eFN0SzJmRGE3Y25Jd0E0R29BenkzNWxYTEp6VlhMbXEr?=
 =?utf-8?B?Q3ZobmFJQURXVnBwVjhJNXQyTnBSRlVUVzZ4b051cGlMekdRL0FRbGxwSk05?=
 =?utf-8?B?cnIrS3BmWmVPTXVKeFFlY1hPUUE0cXJrQWxVOG9HM0VIQjltZ2VLbUNRbkFU?=
 =?utf-8?B?WmxBNklkRFVSOURUKzJzRVNONHE0cXExTUpXblYyMGlTdGQxRk04UkFvcXlK?=
 =?utf-8?B?Y1BldHdzQ09zakRsUFUvVncvSjJONVUyOWFtL3loN3Myclo3NnFMVGhVbHRw?=
 =?utf-8?B?RWh2eGlPdzRTUGxSclNYRjB5RnlZOVB4UHpIMWpQOXk0VUk4T2ZRbDRDT0xa?=
 =?utf-8?B?SVFpb0I3RTd5a3JkcEVsa081VWhzNks1Z2loVWNsODlPaDhUeDRWSDVHa01o?=
 =?utf-8?B?dnphaFBwcEJaYy9WRGdnYTI2aUZtd0pyK2ZmeHByanFVOGlkSTlqaG9sS1pq?=
 =?utf-8?B?V2IzZzV4R0FWc3dXUzk2Z3JnOWpOQlkyeVl2cnAvTXk3MUxHRForMXVXSFBa?=
 =?utf-8?B?TEtsOW1wTFVLVWJjQzdhcFc5dmlDa2FlOGlNd21JaHdTK04rTHdOMVd2RUxZ?=
 =?utf-8?B?VVBQYUNyMmFDOXV3NitqVkFIY2IxeE5FK1U0S0JYMC9YSjdMWGhrb3FLckZa?=
 =?utf-8?B?K2tMZGRrUXFzQnd1MTVaa2lDT3M3ZkljbSt4VWVtWGFYc2xzcW51WVF0SFZZ?=
 =?utf-8?B?SlRuNFVHZ3NxUkNtaVJJTU5SQVJReERNdjRjczVnS0xqSWsyZ2NkeW5wNFF4?=
 =?utf-8?B?eUJxeUx4eHA3dkJBTkxZcmFFeko5dCt1VXlGVkd5YTNnZm4vc0FGQSt2T3Rt?=
 =?utf-8?B?SzU1ZjRTUlFHZnludWRhb0VUTmtKQVVnWFNqbXdoc2VweE95V0FqSit5aS9u?=
 =?utf-8?B?M3h2c2FyWTBodUZ2S21CeE84am5oRTVLSzIxSzZEc0RJY3FpZ29yY3RWVHgy?=
 =?utf-8?B?alIxTzVlQng3ZFBFUzhLcTNxZys5Y29NS3JVMVEveE8rT2hzaG9nS1BoUjZm?=
 =?utf-8?Q?Zx5B3HxpyDOtIqNh+xM4OIF+GX9MemFwTfPw/S5xQurI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6F8C98B75C45441B2E4BAF66E3019B1@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 44380e68-b4e9-41d6-f97d-08dc7c8612d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2024 06:44:06.2983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oo7HtkzFJSkMNAoEx357ExX56pNjL5qpSdFalLadudT7vpZFRhsnBpWxTgthlvLO+ifuAxROgHzYqmbYDCZ+nz1vek+GJy5WxC+I+98rjgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2055
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

DQoNCkxlIDI1LzA1LzIwMjQgw6AgMDY6MjksIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+
IE9uIEZyaSwgTWF5IDE3LCAyMDI0IGF0IDA5OjAwOjA1UE0gKzAyMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBodWdlX3B0ZV9hbGxvYygpIGZvciBub24tSFVHRVBEIHRhcmdldHMgaXMg
cmVzZXJ2ZWQgZm9yIDh4eCBhdCB0aGUNCj4+IG1vbWVudC4gSW4gb3JkZXIgdG8gY29udmVydCBv
dGhlciB0YXJnZXRzIGZvciBub24tSFVHRVBELCBjb21wbGVtZW50DQo+PiBodWdlX3B0ZV9hbGxv
YygpIHRvIHN1cHBvcnQgYW55IHN0YW5kYXJkIGNvbnQtUHhEIHNldHVwLg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4N
Cj4+IC0tLQ0KPj4gICBhcmNoL3Bvd2VycGMvbW0vaHVnZXRsYnBhZ2UuYyB8IDI1ICsrKysrKysr
KysrKysrKysrKysrKysrKy0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL2h1Z2V0
bGJwYWdlLmMgYi9hcmNoL3Bvd2VycGMvbW0vaHVnZXRsYnBhZ2UuYw0KPj4gaW5kZXggNDJiMTJl
MWVjODUxLi5mOGFlZmExZTczNjMgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0vaHVn
ZXRsYnBhZ2UuYw0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL2h1Z2V0bGJwYWdlLmMNCj4+IEBA
IC0xOTUsMTEgKzE5NSwzNCBAQCBwdGVfdCAqaHVnZV9wdGVfYWxsb2Moc3RydWN0IG1tX3N0cnVj
dCAqbW0sIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLA0KPj4gICBwdGVfdCAqaHVnZV9wdGVf
YWxsb2Moc3RydWN0IG1tX3N0cnVjdCAqbW0sIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLA0K
Pj4gICAJCSAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBzeikNCj4+ICAg
ew0KPj4gLQlwbWRfdCAqcG1kID0gcG1kX29mZihtbSwgYWRkcik7DQo+PiArCXBnZF90ICpwZ2Q7
DQo+PiArCXA0ZF90ICpwNGQ7DQo+PiArCXB1ZF90ICpwdWQ7DQo+PiArCXBtZF90ICpwbWQ7DQo+
PiArDQo+PiArCWFkZHIgJj0gfihzeiAtIDEpOw0KPj4gKwlwZ2QgPSBwZ2Rfb2Zmc2V0KG1tLCBh
ZGRyKTsNCj4+ICsNCj4+ICsJcDRkID0gcDRkX29mZnNldChwZ2QsIGFkZHIpOw0KPj4gKwlpZiAo
c3ogPj0gUEdESVJfU0laRSkNCj4+ICsJCXJldHVybiAocHRlX3QgKilwNGQ7DQo+PiArDQo+PiAr
CXB1ZCA9IHB1ZF9hbGxvYyhtbSwgcDRkLCBhZGRyKTsNCj4+ICsJaWYgKCFwdWQpDQo+PiArCQly
ZXR1cm4gTlVMTDsNCj4+ICsJaWYgKHN6ID49IFBVRF9TSVpFKQ0KPj4gKwkJcmV0dXJuIChwdGVf
dCAqKXB1ZDsNCj4+ICsNCj4+ICsJcG1kID0gcG1kX2FsbG9jKG1tLCBwdWQsIGFkZHIpOw0KPj4g
KwlpZiAoIXBtZCkNCj4+ICsJCXJldHVybiBOVUxMOw0KPj4gICANCj4+ICAgCWlmIChzeiA8IFBN
RF9TSVpFKQ0KPj4gICAJCXJldHVybiBwdGVfYWxsb2NfaHVnZShtbSwgcG1kLCBhZGRyLCBzeik7
DQo+PiAgIA0KPj4gKwlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX1BQQ184eHgpKQ0KPj4gKwkJcmV0
dXJuIChwdGVfdCAqKXBtZDsNCj4gDQo+IFNvIG9ubHkgOHh4IGhhcyBjb250LVBNRCBmb3IgaHVn
ZXBhZ2VzPw0KDQpObywgYWxsIGhhdmUgY29udC1QTUQgYnV0IG9ubHkgOHh4IGhhbmRsZXMgcGFn
ZXMgZ3JlYXRlciB0aGFuIFBNRF9TSVpFIA0KYXMgY29udC1QVEUgaW5zdGVhZCBvZiBjb250LVBN
RC4NCg0KPiANCj4+ICsNCj4+ICAgCWlmIChzeiAhPSBTWl84TSkNCj4+ICAgCQlyZXR1cm4gTlVM
TDsNCj4gDQo+IFNpbmNlIHRoaXMgZnVuY3Rpb24gaXMgdGhlIGNvcmUgZm9yIGFsbG9jYXRpb24g
aHVnZSBwYWdlcywgSSB0aGluayBpdCB3b3VsZA0KPiBiZW5lZml0IGZyb20gYSBjb21tZW50IGF0
IHRoZSB0b3AgZXhwbGFpbmluZyB0aGUgcG9zc2libGUgbGF5b3V0cy4NCj4gZS5nOiBXaG8gY2Fu
IGhhdmUgY29udC17UDRkLFBVRCxQTUR9IGV0Yy4NCj4gQSBicmllZiBleHBsYW5hdGlvbiBvZiB0
aGUgcG9zc2libGUgc2NoZW1lIGZvciBhbGwgcG93ZXJwYyBwbGF0Zm9ybXMuDQoNCkFsbCBpcyBz
dGFuZGFyZCBleGNlcHQgOHh4LCBsZXQncyBqdXN0IGhhdmUgYSBjb21tZW50IGZvciA4eHguDQoN
Cj4gDQo+IFRoYXQgd291bGQgaGVscCBwZW9wbGUgbG9va2luZyBpbnRvIHRoaXMgaW4gYSBmdXR1
cmUuDQo+IA0KPiAgIA0KPiANCg==
