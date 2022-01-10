Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC75489359
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 09:30:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXRq156r8z30gg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 19:30:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60d;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::60d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXRpX0N3Kz2xWd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 19:30:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMK1d7FcOfQdQ6EhxjEo7j0tt2vOVyiOJbw8gd+w5n76TV++YiX+aCna36p8oiTTSiSibklnTINFvkzszNZwJDKT1y457v3veVE/M1atYarf1VN1AzjDsX6eDxjdVjKFOBOaCEDJh34p1vOM4klWCtoGYi9KRkmt4FctqoG9ftc0Hq+7ttTp4ZE4wqfEEsUVEINK0XcL+sWXhpy2B4ytrnO8r5hUd0exiaWH025gfx5sFwUZ+GX6j/3gPhcXWPHwTAKSGC/DseKD5fK9pxzZTZyHCkRzklTdXjk3l8sOojHKZDqspOzvGzZwvLsUIPlTfloodcfFQMe9oxeclxpTMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTpBRdQud1U4UERXIBWUiD2mJk6qaiDMkSWCzosv5gM=;
 b=SWFZqQDfNKOK4ulR9bhfUwfk9aarvUMnWt2RWAjpUmRjuUofoCRBqPS5gF5cOfypZsS5msPYGJwvIjk3NJKEGanZTDl7+dOG6b9iAf2BYmZseRPgY8+XnFHla9OOq1R8rYu3/4muRMMFw/3diOx1pbl9r8ntc72KjAlNgdaNuOEZnwstnXE7sIPWy2GDclV27/moJ0+vhNiZOTbGyWpL+xrLOja8X6hfG+eQ67Sl1nRMvpUNF94PoQpbF88vrmGu6IZPLiTA18pc1hk0eavznoMxgElqh7fDFiSrCdg02CSCAVFFw9rHzkddfjN4fXrUYkmFvhUQycv6wZ62C6ztsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1750.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.7; Mon, 10 Jan 2022 08:29:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%4]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 08:29:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>, Chris Mason <clm@fb.com>, Josef Bacik
 <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
Subject: Re: [PATCH] fs: btrfs: Disable BTRFS on platforms having 256K pages
Thread-Topic: [PATCH] fs: btrfs: Disable BTRFS on platforms having 256K pages
Thread-Index: AQHYAcNpI/31rIPGmkSciqlE7DHs+Kxb9OiA
Date: Mon, 10 Jan 2022 08:29:44 +0000
Message-ID: <3db6dbe8-7190-a2b1-f092-22bbbac6fedd@csgroup.eu>
References: <a16c31f3caf448dda5d9315e056585b6fafc22c5.1623302442.git.christophe.leroy@csgroup.eu>
 <6c7a6762-6bec-842b-70b4-4a53297687d1@gmx.com>
In-Reply-To: <6c7a6762-6bec-842b-70b4-4a53297687d1@gmx.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 028f179d-ad3f-49b0-a298-08d9d4135abc
x-ms-traffictypediagnostic: MRZP264MB1750:EE_
x-microsoft-antispam-prvs: <MRZP264MB175050B6C91B0916DF816734ED509@MRZP264MB1750.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lu3drHF3XcpY3gwSQH1Nc3ViU3ltH9bpC5cEAvpvh3jFBGbWh3/uO3ITjDubPSO4FAuxUQteFVHMWhUeT2Eoyu5lMNLTa23RbuMKBBxNQTyEiA/TJtq7RemxHxj2NE/2dR/uB/imzHJ+DqpiOacne4lZo3JOKZJHzNoEH56bB3XG/DUV7wVrko7PD7OQ/Q0/X3llTVlOJ4pruBOJqv8Sg3Hgnz9yoCFx1nKMzwdqdJxrzyDs44X2+DYDwCZmY/JpSmvuVuacsf9+Bu69XBLEY7SIBTvx/uuVvCil0rELwm41WQKvlhQl9B1wf+DHY+KVGUA8tsAklS68xL/c/VEU+kD0UsV3f7+YLFlLNj66P5wd+5zqV+nvjk5EK7wYt/+tu2ITfTIx9XOfdtdvcz3yOnCk0nHV08GCswF7V42i4IBjJNqGg9jr5DeYdDi9/LKx8nGSPqAQIf/klSZJkXvCKMoefE4OUoKPBKLfvibkVMBAjPpb7+QNYtqljPj8ukdZ8gb31d9yWb/ByYm9XmtAVR/QM5lD1aJBlFHz8yIol/NC0K0rnjAGsOSAGBqUeZwCQE2H2FhReHH8smi/NRFQPaLidZ0u7o7fTU/6u4uTD8qBhi/905vuUGUobFbjgeh/lwlaQKvxxvX9nPITPgyy41SBvcrqjDLQOQD17KHQaepgSMWOPEjMOhdO4s+eoMpNBC3d2096iuTXE2XBTpBlrEbHeBLqfM0nHNNGyZ9RbBp/dgjJeGgJ+eBjFj/cX5XJHr628FXsXlf2Hs9nPd8/N+GMWJLHNTFwbV+Vy/mJqwbgLHgPm7w0FJ4/XhPtaL3CQaDTUD4pxWsvKcK9Vwduu7iXIgE1zp/rV8UCcxC8YdE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(31686004)(44832011)(8676002)(6512007)(6486002)(64756008)(71200400001)(66556008)(66476007)(66446008)(91956017)(86362001)(76116006)(26005)(5660300002)(66946007)(31696002)(186003)(6506007)(316002)(83380400001)(2616005)(4326008)(122000001)(38070700005)(38100700002)(110136005)(54906003)(2906002)(966005)(508600001)(53546011)(66574015)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTllWEFmVDlBU1d0T1lTSXdldU1BK2QwVkFIOExOT0pvUWZNUTRFbUNEVjZT?=
 =?utf-8?B?VUNwbHhjaEpnOWI5RnJhemU1TmtWYXFwdXVlUTBpK0JKanB5VkFpVmFwTzIr?=
 =?utf-8?B?bmM5UXAwM2VkSXlEcHhuVU9mWXRockZrR05CY0Y2MTlUa1hkVDdjUDY5bWZv?=
 =?utf-8?B?Z0EzYjdsdWRmM0hiRVpZbWhmZmtFbFBoUTE4Z2VXeTVCTGVXZFFNSW16T2l1?=
 =?utf-8?B?aWxRejdzMHRYdnBRMWxabDRLWkpEdzNRYm1VajBUdkhDRHJ2Q3pUbjJpT2l5?=
 =?utf-8?B?VUVWakZ1czNSNlBWWktudFd5TDg1U2FiYXlJbEloQnVkOGpEd2VwOGdsL1lv?=
 =?utf-8?B?NlhRY25odUxadVh4RXBDRWxneUllVmNPdFFxSXBDeWJmY2x5QW8zNWVXS1Bn?=
 =?utf-8?B?T09OU2NxZ3BESDZ2akRuNVQ1RFczMFhJSkJBbk8yR2RhSXhvQVQwc1JjOU40?=
 =?utf-8?B?NFZBU0ZwUGtnUU04bkZnVVRWNWV3WW1KMTQ0V0VVUEx1UFhUb3NQZmR1Q3RV?=
 =?utf-8?B?K2RCKzdCQWlUeXFGaE5nSElxV2R0MnRUeXdpL2xiRFRnaGRId2FwWlNKSkgw?=
 =?utf-8?B?WTlBcHNvaHlJNFBnV1ZjRUdsbmh3SjZzclprZVBLV3VtZDlKQ0V6dnFhdURq?=
 =?utf-8?B?MXVQVXI1aUNnNFVrVUUza2wwdG1NQURhVFBDbjR1VU1FeXhnUlBIQUtQZXg3?=
 =?utf-8?B?VG9zbk8rL29NWE9nYlB6dzJSZng5RDMycDZscEd3Rk8xNTMvSnhLVjZTMXl3?=
 =?utf-8?B?cnNJNll0ZkJXUFNOSmhSMlQyMDBOdzAxencwcWE3NzFiSm1NZnFqL2VKTk9h?=
 =?utf-8?B?Wnp2N2NaZ3piNndCVFZVbThLS3QyMllZSnd6UlFJOE9rdmRKYmdXcmY2Tlgz?=
 =?utf-8?B?SXFIczdBQ3BQT0hpcFlaMnlNbWxlTFhzdi9vdzNnVzNmNXZYaXpVU0hxZkJm?=
 =?utf-8?B?QkJzS3h6dkNRVjRTTWE1am12a0RRNm9SS1BraVpZd3JCUFNPbC9EcXl2NXRZ?=
 =?utf-8?B?endSS2NjRGV3VjVvNy93dHZOUEF1Zll4VnpTZFc4cWlUQSs0c1o5R3pjTVRC?=
 =?utf-8?B?eXp3emlvZUQxdVlSdktscC9Ia1NLMG9XdkRBWWFnbDJCMHhOekhRd2ZIMEpu?=
 =?utf-8?B?cUdFWWtVbGJlekFDVTZ6NWowWEErWmRJMkxPZkVxeUtObXQyQld0U0pRc2Zs?=
 =?utf-8?B?NmNYbGFVTXJ3czZ6MFJNeE5PZkZKK2JtMlIvVHNFQnFCNjVoL1huSU53SXAr?=
 =?utf-8?B?MGtDalovOGNjUmZ5YW1sUm1iTmYyMWI0bHdEOFFJckI5NHVmdCs4Wnc4OFMv?=
 =?utf-8?B?Z0hZaWxKNG9WUkwzOEp2dlo4QStKYmV0R3VqTVZ5d0ZaU2NURkVXa3prRVB0?=
 =?utf-8?B?bmZobTB2ZTRyVHg2SldXYnVKOHRIcWp2M1BRNVdudmk0MUY0bytrNTJ6YWZu?=
 =?utf-8?B?TXVablF5d3lwcjYvalpmMWRYUE9Xb1R5enlaRkUzaytWT0NRMkJ0RnZER1lF?=
 =?utf-8?B?cHlpV3IyZVNXc0ozSll4MkJJU2IvWkwrWUNNeUxlWFp3QW85TWF0OTVsMWxm?=
 =?utf-8?B?K2JBeHFITXM0RUVPMHQ1Rk9ZV2tCL3l4K1d2NHRLSStjb1NRRnJzdmtYdGhv?=
 =?utf-8?B?V294bDQ1YjAyYU1RNDlPbmJQQVhhcFp2c0hSZk1RMVgrMDhZaEVWSVE1MUNq?=
 =?utf-8?B?SXlLTVNhMnY0KzVWa1pQOVVBaXVCSVJvN01YNVFjV3d6M2hMYkFaQWRtQ1JB?=
 =?utf-8?B?cU9pT0dpMVZWc3gxeXNpOWlLZE1lR3FFNEVtdWF1eUFOMEtlY2pYUzRTM3RB?=
 =?utf-8?B?VVk4eTNZS2s4UFlNb1lPY1I4VUV3ZUNya0paY1FpanNPYjBScGsvcWdpMHhJ?=
 =?utf-8?B?WU5zRHdKWW9UVFdvelppeFl2UXJnOHVVUUlqcGVRKy8ySDZ2bzJGakVQclll?=
 =?utf-8?B?eGxIVnB1bDE0WGZqRm5YbFZueWVORkJ5NmppOFYyMnBPUlFVVm9FVTZuYWJP?=
 =?utf-8?B?YVJSdkVqMFRlc2RqV3hxVldSc295MzhDOWJ3TGdYSTM1SVQySnhQVVZoTjNT?=
 =?utf-8?B?SkxMbitxTkV4SEM1MHd4OVcyWDh1NHY3dDRKVFRMMm5iMFdSNU5qbjgxV3p3?=
 =?utf-8?B?L0p5d2RvUFJiTzZpNjdvUWxJbmVUMDR2V09OVVVxNm44TTJZb2RRK0g5bVVH?=
 =?utf-8?B?ZDZ2NG1haXNSeERwT29aaTBGQVYvWlRBaDFtUVhxSmNReXNyOVFPd0JFd1Vk?=
 =?utf-8?Q?Bw8hDPeAYllhqbxjxw00s3Nv3cdbQepp8gUSuTbXvY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CDF836275BD8E4DACC3EFBD2A1624BC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 028f179d-ad3f-49b0-a298-08d9d4135abc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 08:29:44.0789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nqd2EDeuQpLpPU6yhW4ihhU9cNcr+jwNLAenOT6x2dRsMMe+8f9xX0HthRSDAqCpLEHbsu/LwccLcWZ0cGSOEZH8gmorGchHmj8byqF2KnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1750
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
Cc: "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgUXUsDQoNCkxlIDA1LzAxLzIwMjIgw6AgMDA6MzIsIFF1IFdlbnJ1byBhIMOpY3JpdMKgOg0K
PiBIaSBDaHJpc3RvcGhlLA0KPiANCj4gSSdtIHJlY2VudGx5IGVuaGFuY2luZyB0aGUgc3VicGFn
ZSBzdXBwb3J0IGZvciBidHJmcywgYW5kIG15IGN1cnJlbnQNCj4gYnJhbmNoIHNob3VsZCBzb2x2
ZSB0aGUgcHJvYmxlbSBmb3IgYnRyZnMgdG8gc3VwcG9ydCBsYXJnZXIgcGFnZSBzaXplcy4NCj4g
DQo+IEJ1dCB1bmZvcnR1bmF0ZWx5IG15IGN1cnJlbnQgdGVzdCBlbnZpcm9ubWVudCBjYW4gb25s
eSBwcm92aWRlIHBhZ2Ugc2l6ZQ0KPiB3aXRoIDY0SyBvciA0Sywgbm8gMTZLIG9yIDEyOEsvMjU2
SyBzdXBwb3J0Lg0KPiANCj4gTWluZCB0byB0ZXN0IG15IG5ldyBicmFuY2ggb24gMTI4SyBwYWdl
IHNpemUgc3lzdGVtcz8NCj4gKDI1NksgcGFnZSBzaXplIHN1cHBvcnQgaXMgc3RpbGwgbGFja2lu
ZyB0aG91Z2gsIHdoaWNoIHdpbGwgYmUgYWRkcmVzc2VkDQo+IGluIHRoZSBmdXR1cmUpDQoNCg0K
SSBkb24ndCBoYXZlIGFueSBzeXN0ZW0gd2l0aCBkaXNrLCBJIG9ubHkgdXNlIGZsYXNoZGlza3Mg
d2l0aCBVQklGUyANCmZpbGVzeXN0ZW0uDQoNClRoZSByZWFzb24gd2h5IEkgZGlkIHRoaXMgY29t
bWl0IHdhcyBiZWNhdXNlIG9mIGEgYnVpbGQgZmFpbHVyZSByZXBvcnRlZCANCmJ5IEtlcm5lbCBC
dWlsZCBSb2JvdCwgdGhhdCdzIGl0Lg0KDQpBbHNvIG5vdGUgdGhhdCBwb3dlcnBjIGRvZXNuJ3Qg
aGF2ZSAxMjhLIHBhZ2VzLiBPbmx5IDQvMTYvNjQvMjU2Lg0KDQpBbmQgZm9yIDI1NiBpdCByZXF1
aXJlcyBhIHNwZWNpYWwgdmVyc2lvbiBvZiBsZCBhbmQgYmludXRpbHMgdGhhdCBJIA0KZG9uJ3Qg
aGF2ZS4NCg0KSSBoYXZlIGEgYm9hcmQgd2hlcmUgSSBjYW4gZG8gMTZrIHBhZ2VzLCBidXQgYWdh
aW4gdGhhdCBib2FyZCBoYXMgbm8gZGlzay4NCg0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiBodHRwczov
L2dpdGh1Yi5jb20vYWRhbTkwMDcxMC9saW51eC90cmVlL21ldGFkYXRhX3N1YnBhZ2Vfc3dpdGNo
DQo+IA0KPiBUaGFua3MsDQo+IFF1DQo+IA0KPiBPbiAyMDIxLzYvMTAgMTM6MjMsIENocmlzdG9w
aGUgTGVyb3kgd3JvdGU6DQo+PiBXaXRoIGEgY29uZmlnIGhhdmluZyBQQUdFX1NJWkUgc2V0IHRv
IDI1NkssIEJUUkZTIGJ1aWxkIGZhaWxzDQo+PiB3aXRoIHRoZSBmb2xsb3dpbmcgbWVzc2FnZQ0K
Pj4NCj4+IMKgIGluY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDozMjY6Mzg6IGVycm9yOiBj
YWxsIHRvIA0KPj4gJ19fY29tcGlsZXRpbWVfYXNzZXJ0Xzc5MScgZGVjbGFyZWQgd2l0aCBhdHRy
aWJ1dGUgZXJyb3I6IEJVSUxEX0JVR19PTiANCj4+IGZhaWxlZDogKEJUUkZTX01BWF9DT01QUkVT
U0VEICUgUEFHRV9TSVpFKSAhPSAwDQo+Pg0KPj4gQlRSRlNfTUFYX0NPTVBSRVNTRUQgYmVpbmcg
MTI4SywgQlRSRlMgY2Fubm90IHN1cHBvcnQgcGxhdGZvcm1zIHdpdGgNCj4+IDI1NksgcGFnZXMg
YXQgdGhlIHRpbWUgYmVpbmcuDQo+Pg0KPj4gVGhlcmUgYXJlIHR3byBwbGF0Zm9ybXMgdGhhdCBj
YW4gc2VsZWN0IDI1NksgcGFnZXM6DQo+PiDCoCAtIGhleGFnb24NCj4+IMKgIC0gcG93ZXJwYw0K
Pj4NCj4+IERpc2FibGUgQlRSRlMgd2hlbiAyNTZLIHBhZ2Ugc2l6ZSBpcyBzZWxlY3RlZC4NCj4+
DQo+PiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAu
ZXU+DQo+PiAtLS0NCj4+IMKgIGZzL2J0cmZzL0tjb25maWcgfCAyICsrDQo+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2ZzL2J0cmZzL0tj
b25maWcgYi9mcy9idHJmcy9LY29uZmlnDQo+PiBpbmRleCA2OGI5NWFkODIxMjYuLjUyMGEwZjZh
N2Q5ZSAxMDA2NDQNCj4+IC0tLSBhL2ZzL2J0cmZzL0tjb25maWcNCj4+ICsrKyBiL2ZzL2J0cmZz
L0tjb25maWcNCj4+IEBAIC0xOCw2ICsxOCw4IEBAIGNvbmZpZyBCVFJGU19GUw0KPj4gwqDCoMKg
wqDCoCBzZWxlY3QgUkFJRDZfUFENCj4+IMKgwqDCoMKgwqAgc2VsZWN0IFhPUl9CTE9DS1MNCj4+
IMKgwqDCoMKgwqAgc2VsZWN0IFNSQ1UNCj4+ICvCoMKgwqAgZGVwZW5kcyBvbiAhUFBDXzI1Nktf
UEFHRVPCoMKgwqAgIyBwb3dlcnBjDQo+PiArwqDCoMKgIGRlcGVuZHMgb24gIVBBR0VfU0laRV8y
NTZLQsKgwqDCoCAjIGhleGFnb24NCj4+DQo+PiDCoMKgwqDCoMKgIGhlbHANCj4+IMKgwqDCoMKg
wqDCoMKgIEJ0cmZzIGlzIGEgZ2VuZXJhbCBwdXJwb3NlIGNvcHktb24td3JpdGUgZmlsZXN5c3Rl
bSB3aXRoIGV4dGVudHMs
