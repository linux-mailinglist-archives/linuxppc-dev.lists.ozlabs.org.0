Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89983627D78
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:15:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9pDm2wxDz3cMc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 23:15:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=PH6pLeuT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::624; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=PH6pLeuT;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on0624.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::624])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9pCp6SD9z2xks
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 23:15:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVP/c+8SK+LMNnCCSJ2x+d3ZxpaiOZBU2rB6JCWK9ljE02tZCTIA8SRiwmc5jC9j0XUq6w4LdA46jNh+loLS3TyN8cBuAfjLnF9SZ8W8TW148Mb/hqw+O2bWs0jOFh4xw9MIBJhWBi/4iPNFr4/V+VJAey/DPbIybXRvVCPQUtSAVKk1k+sFffknr0wW4e51jRKeijLsf2jbDTzjt/a5oDyZ1mjBblWzNrysT4IgAhJcMdTfwYj6y0mcVTSOUZHVQ6aSFc4x4/XzCaQFUuD+rE7v1bUyCK5TdghE2UFtnpMkI8P5vG3t7F7YvY8H1tTjAsLiKkPUX95ReamPugsKzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YFP64irhte0G/y1Dlzh70Q5Cm0ldgyd1idLOo+lNeg=;
 b=AeeOT7RJ+EjQ6MTHjX8zoSlG4fmShtgn4XGqiyE78Bu2OoQWuGWVbCmdF4DpTCKjQWkSppgRIQLDjVMVPyh7YQENhr3rgnzf65yyXBHNrjHQktyHEcz4zMGh9TtpuQmFWbpIfmNvUiU1UBu67zqJ/0wFZfFZVIlUBdqiQTKgwGKUqBR3fl+AMlV3uI+DSup7q1JSQX/fjDfyYrErZd8YYp6uxfcPwzNDTjmXa4VxPqQKMFcYOToqZEo4NOAq+DKEiGf3V/TosK3DMtLGJVKFUgfzgwP6Ir44O881mx/xzm0utDS2QRG769I+S3DGyP/ROzJ9qRxAtcA6k6/xCi+Y6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YFP64irhte0G/y1Dlzh70Q5Cm0ldgyd1idLOo+lNeg=;
 b=PH6pLeuT/2EQ2RapOfhseOREt4rn5UEpqqfBayOysB9DxG2nMOUoFJcF0cUaBQlavP+nb/DvJNclVpD019vV9IIHEU8qbQF5g/COwXOla0cc0n0z7Pcs9wfwwU0B0PtB3TlKoarmH3fzY54NhET0s7qOWx07cmCtW24ZDErt3JaaGxgEhmFudXjVsqrd5r069z+0Eq9teUySmtMabk7tNvtpH7m6oAjuVanU0siqdtQEBIudAAbPkCGLHE7wfnfSbL1GODdFPFVDdGACQebgf+KsNIOjB2kndGFR+uQ+CgzW3mnv2mR8buA22I8d6nacSYlh5jIVy2tuxCA5Cr8oCw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2022.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.17; Mon, 14 Nov 2022 12:14:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 12:14:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Samuel Holland <samuel@sholland.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: Save AMR/IAMR when switching tasks
Thread-Topic: [PATCH] powerpc: Save AMR/IAMR when switching tasks
Thread-Index:  AQHYyYnrawisyGt7e0mr4Du3kDJFGq3jSIUAgANtqoCAAoyJAIAAHP2AgDbzwoCAHl7QgA==
Date: Mon, 14 Nov 2022 12:14:43 +0000
Message-ID: <fac9f731-627f-73e8-ca22-4214883f058b@csgroup.eu>
References: <20220916050515.48842-1-samuel@sholland.org>
 <89049105-64fc-8d5b-d090-2841064786d1@csgroup.eu>
 <87h713leu8.fsf@mpe.ellerman.id.au>
 <01281a29-5dff-8868-a1c3-4c4978dca346@sholland.org>
 <ea1cf92d-a388-9f7d-1f86-38afedfeff1e@csgroup.eu>
 <28f0b6b0-cc85-8406-c007-111d44fa06c2@sholland.org>
In-Reply-To: <28f0b6b0-cc85-8406-c007-111d44fa06c2@sholland.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2022:EE_
x-ms-office365-filtering-correlation-id: 2d142fdf-32e2-443d-6bd3-08dac639d035
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  jwM2f99wRXuWvmM1oDHYtiSGLSra4NIRS2LpMn/B8jSxYWSU3IfiNGzySGic2y4fUqG6RaUQZ3WqfuW5WeTQUqFU9rhrcRC9dtI1IGngLc8Wfwi5YZzOoQjVizq1Sc4WyaImqsFZqmafiE6AffU39PijFJBQq5sR+OiFYW3ctsuvm9Jo49zXFfR2Ux6zwcQvV7GdtjK9hK65yaLDSjslx8l0hnge5d8qtvyLlW5bhBVmf/1bVuwvNwohVRMGnO3RLJkJpMROQNt+uQwaAftbOUmN0nosf+bdb4KGh8xKAw1ipaTNASRlgejSAsPafqZ8FCCCoOcdYcrpriJES0+QoSnM6kXbWhCiJEoMRnTrS3cdfW3EdzMvzOm/yaT6dTWUe7e55jCbAcKL7zH9DnMgYVPs6W3m27lOF9cSB7IL8RMUVTDRvN15zZeiRvnaGsThFa8mSTBHHTRlRF4o4tzbc2d0jxv/MiYUqlLyaSCmHhVb1AV40cKAsjh7K1kxseswY4VnZtGyOW614tKY9OD9B9V0eh8G9HrnlZCsFxcn0JyOzUw5STljJz3sOJ/Egcc2CsistzJwTMmata65Io0YwESxBXqAxLFA0e8n78R4uPvSMSht+R4ciKwzovAr1gCgui4Arc3NSJCMqHcLUjHJqbAT8pm3Hhb9ReZm4bfVpIDNtIxOQpB82PvexyAU7kOgooh+14s/vkixATJCX8/pUSXEpqOmHVx94CDALprGSw2FyzHdnCVbir6S9ECp1riY42fbXNwFQKcXHJxoniI+tqGoDTmPLZYYu306ibctCDojLeY2csNU5/wBQcUx1wddgyazmeLclTo+t5Qm0xliwRHlwN9rlOYfgWhJilzLKOI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(39850400004)(346002)(396003)(451199015)(2906002)(76116006)(4326008)(64756008)(6512007)(8676002)(66946007)(26005)(91956017)(66556008)(66476007)(66446008)(316002)(53546011)(4744005)(186003)(8936002)(44832011)(41300700001)(36756003)(6506007)(2616005)(38100700002)(31696002)(86362001)(122000001)(38070700005)(5660300002)(71200400001)(478600001)(966005)(6486002)(31686004)(54906003)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UFNnMFYvMFpWQW9keWp3VENpc3dBSmowV2NpeEQwV09zdzN5c1RiQ0VlMmdl?=
 =?utf-8?B?MWpTbTdpRjZxRVBpV2lmTFQxdG93cXVMMTFPejVIWDFvSXdiU1RWem9IeEpm?=
 =?utf-8?B?OGRqQTFRSUVCMk9hMmtCNm1OaE9TcDYreWFoRzFLSjAxYWV3KzJhZlNqcWxK?=
 =?utf-8?B?QUU5amF6alkvUzZjL3RJZy9ieFMzbGN6bHZRakl3azVEUmVHRWJOZzVKUVBG?=
 =?utf-8?B?NmMrb2VYZUgrNjRmbkowRzNZWFRTS1BoKytMQWUxNnRqa0dJYUo0SzhVV0tr?=
 =?utf-8?B?UCt4OEVsaENGcHg2RUgvb0pFL1BydVlOeEdpcmhXVUYzWWdKQWtqbkdaK3Vy?=
 =?utf-8?B?VXVac3pycmtMclBMbWlMbjBOWnpwQ0cvQkNoUUNxRGswNlp5WkFpL2RaNFNI?=
 =?utf-8?B?K1BhN01IY3JOQ3cxb2xqT21jS3lFYmxQZEt4dzRCN3d1RnZSQ2RkT09ySTZJ?=
 =?utf-8?B?ZE8yRWhyTXByQVNqYkdYenRCMlFHSmRMN0dUSDlSeXFhRnZRay9ZQStwMkhL?=
 =?utf-8?B?SUhYeW5tZyt5L2w3MDBWOUNTdDZkT2xHTmMwYSt6TXNIY3hNaHV3QnpXK3Fr?=
 =?utf-8?B?eFNScHM3dGp4Ny81UXJHcnZLbjZwT2h3VXhweVBKN1g0RmR2dkh3ajNTSDZW?=
 =?utf-8?B?eGdiMEoxS3JiYS9jSFdHb0dnOTNVT3FGTmY5QzhmQVYxNkpLdGZBNEs1clNN?=
 =?utf-8?B?RGo1bSs3UWRXbWF0QUlGd0s0ckwwSUFTTVlXSjNFbFpoaTNwaVY2UFJHaHpv?=
 =?utf-8?B?SVZCUXl2T3I4cjUwQnkyZ05IRjR1U0xhUHJuVnVNa3JSV0l1M1BzZjIrOWZ2?=
 =?utf-8?B?UjdObWV6RUJ5ZFp1NStPMmpNWVFWN0hWN0xaa2dsaldPMEVQVk15REtBSDBN?=
 =?utf-8?B?ZVUyM3NHaXRRSmhUN3ZyOWlIZWg4SGNCMXJYZCtZYm85RmN5Ri9HazF3MGxB?=
 =?utf-8?B?YTZsWDJTQm1FS0M2dUNraFNvYVVEbFBiek5uZTVIbnQvNXFrMDA1V0RMTTNH?=
 =?utf-8?B?bFBYMHVlb0lyUFFJWjVCcGtXRmNwRllZdTdrbUZyZDB1ZnJBNHVKYk55UWpt?=
 =?utf-8?B?UlN6MnVIa2tSNDNKRE5hV2RlYi8xelVQV1dKeFpUbnRZeGZQcU1UZjZEMXdM?=
 =?utf-8?B?Ky9xeWpKMmNtMVNiT1R3aFNQL0hYTlJHajVqSzl3Q2xOYk84aFFUcWtubmUr?=
 =?utf-8?B?dGg4NjBPdWZIcHBkTlNCTGI2VG9XcEx1ajlTbURka0Q5NTRRZTc3aUFpU2Vh?=
 =?utf-8?B?Q0hmVGhUcjVLcUVEanU0RVNCTktpWUFBdDV3dms0a092MXhiMzVZQlZ1Q08x?=
 =?utf-8?B?WTc5Q0dVWmh2ZVM5VVhPTTlXYkRTcStZeGNncHlPWXluTEJwLzNkQ3NCUEty?=
 =?utf-8?B?TFFOVUtVN09TY3BjeG5XR1F2alFOazFRVXNWcng5M3VrdjlRWk5kbGZJZ2R3?=
 =?utf-8?B?ODBuN1ZtbWpxb3ZFOVMzWnlSL0ZEZDBMdWRYYTl2dGE1MjVFUXB0NXhscGFM?=
 =?utf-8?B?K0JrS1JCOThDcUx5MXBDM1BPb2krYzVSR3ArQ1lJbnlnOGljbmx1dmtRY2di?=
 =?utf-8?B?TmRXSGVUMVhPaWtqVGpRRHFJa280bTdLWXAwdXRYVlN3NTVyUVB3WEM2QWh3?=
 =?utf-8?B?RU5YRzVsRHVsR2Fpa0FpYjJNcjYzSlpPUDNVNnJEVVNHYVJwdUtUYjh0aTBu?=
 =?utf-8?B?Q2JRS2F5VEdjUm1tclFPVTJqUndXalRDREFNUWFSdUxMb3lCWEJiSEtQOFR6?=
 =?utf-8?B?VWFXRFFlMnBoQlFZQlFjZVRWeXZzWWZETnI2QVR0YnRBWWZYaXd3ZEUyZ0Q0?=
 =?utf-8?B?T2VCMDNPbDlOTGkxWWpycEpyYmNkTXUwMFI1TXM4VFNxS1UreVRqWVh3TTg4?=
 =?utf-8?B?NE1Ickt1RTdJbTIwWUZDa2JMdzU4VXZSTFBFcENOSTNrZlRZUkZlaXlPaWFo?=
 =?utf-8?B?alBkOHRhUTlmeGlGWUdYZ0NDZVR5OVN0UXhvejc4TUdCMXYvT0xpbXJvaXEv?=
 =?utf-8?B?T1hRUHpRUXg3K0Q5cGhHYW9uNHl6L0gvcTcyNGhyMlpFWkxaMytrTC94SUdK?=
 =?utf-8?B?bFBNTzRVTkYybURsMVpCL3hzSWNSQnU5YW5yb0s5ajVJaXducjJ4Z0hHUFVL?=
 =?utf-8?B?a3NUZExDUkFVOUNFc2syRzZ0WURZbTdlT2xTZ2d3eHZHQ2FIZ0RsOExMNGFm?=
 =?utf-8?B?TUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8689C2FCC3B6D43B68627F89EE5E99A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d142fdf-32e2-443d-6bd3-08dac639d035
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 12:14:43.4461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8PqTf7XyD1AUMsdcPwdysMYAgmKWKhwe+kjfOXjHOmHncTKhptonLNwV6NcS3PsMAQ/SPVaa+SkR6VIVIOWa4k8JN/1AoN84Pm1CVJYWRYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2022
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Eric W. Biederman" <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI2LzEwLzIwMjIgw6AgMDY6MjcsIFNhbXVlbCBIb2xsYW5kIGEgw6ljcml0wqA6DQo+
IE9uIDkvMjEvMjIgMDA6MTcsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+Pg0KPj4gSW5zdGVh
ZCBvZiB0aGUgcGF0Y2ggZnJvbSBNaWNoYWVsLCBjb3VsZCB5b3UgdHJ5IGJ5IHJlcGxhY2luZw0K
Pj4gcHJlZW1wdF9lbmFibGUoKSBieSBwcmVlbXB0X2VuYWJsZV9ub19yZXNjaGVkKCkgaW4gZXhp
dF92bXhfdXNlcmNvcHkoKSA/DQo+IA0KPiBJIGZpbmFsbHkgZ290IGEgY2hhbmNlIHRvIHRlc3Qg
dGhpcywgYW5kIHRoZSBzaW1wbGVyIGZpeCBvZiB1c2luZw0KPiBwcmVlbXB0X2VuYWJsZV9ub19y
ZXNjaGVkKCkgd29ya3MgYXMgd2VsbC4NCj4gDQoNClRoYW5rcy4NCg0KVGhhdCBzaG91bGQgYmUg
Zml4ZWQgdXBzdHJlYW0gbm93LCBieSBjb21taXQgDQpodHRwczovL2dpdGh1Yi5jb20vdG9ydmFs
ZHMvbGludXgvY29tbWl0LzAwZmYxZWFhYzEyOWEyNDUxNmEzZjZkNzVhZGZiOWRmMWVmYjU1ZGQN
Cg0KQ2hyaXN0b3BoZQ0K
