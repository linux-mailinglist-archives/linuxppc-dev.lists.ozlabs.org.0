Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7202569EF3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 11:57:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdsJg4ltCz3c79
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 19:57:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=DZFtcXF7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.53; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=DZFtcXF7;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90053.outbound.protection.outlook.com [40.107.9.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdsHr5qjkz3by6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 19:56:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHGhZ2PMIAb5zP8iag42ymVKSw0KqjemQQywy2r/0kQF/RIueoCe8Y9QlcXXxJyiS5+hcZ6LUqNZGtVzFechE3J9IU2+wjRBvcKosb65XNkF2vND1dS/uzuNU4y8kECVuyu3otNkmB7ARyuBNS1MNTML9/m3Iph3p0t9NU3/8g28ivjH6CRQoMwcYTavGv+dedK3N50i/fqUdDziQToS+b5MHToP/nYUVgIMo+lddtyyq1daiMKMQeJYAligzCDoHnOdl+Rvh8rE85Qqnupdzi961w7PQVIe2ca3TY2DT6iFSWct1ioyp+DwDAOxcbOJaEUJAYagD2Kg0FQ+dqbd3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAu5ajuezKM8PBq9SyWbi4iU4ZmiS14ZYxbzCBlFGyg=;
 b=B9m4k4xpn2acRfl1mvHAdHbkFsUIXj+3KtUxfpvPUEgcOAKuBzRZvsI8wi15GNkad+qcTrG3bSM0c1h0t5227qOwEl4zWe6KlvTUuihrGd+hSyV0bkWmanO5A59gX6GZ+GOZUMYJpjSTxDJUHy9LeYNjsUno8mPgpcQ5iragUofPU2gGKm8rGvcc5rbhC5UyHNjU9Zs9kBZp5oGzbmCuZpoEGy2hyF2xTFxpVOoq3y/+1njH0UYk6n5049f5E0zoBbNShjN4effwFKwPrzQiKTXeORNCDm4h8GTImADRJDtQ5BsyGeYFrBp22yEAyBzkZ245ihAklRXn/Gl0udfk+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAu5ajuezKM8PBq9SyWbi4iU4ZmiS14ZYxbzCBlFGyg=;
 b=DZFtcXF7P74Ndx/nQh0KdO59FcU31z4yk2NVXvG+fIqOJRSZJPlm2JVmqbC0jImCBFe1tpfCl3VWuiTc3PAf+Go/UYDnHqfHFJcCDFmB7IiV5WOUde9Tx+aoshMg9JjPTQW2q7k00ZnGap3FHNnjgwz8vYRq9J5chkHqAlfWkoc7hgb/7XWhXZTzcDDYU7Bd0yolnBO4PVSUS8SZyothaXGu4UOoRP57obbs3zXU2RelVzdndSB4hEYQgA/kQw0oET6mhMA+6iuzoZPAPd1HIMpeBbv+ikn6tpvefoeZPZtPa1T4nMka137GCSXYe18kDFsM040h/jRaLg6Hp6v5tw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3594.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:165::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 09:56:04 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 09:56:04 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@arndb.de>, =?utf-8?B?UGFsaSBSb2jDoXI=?=
	<pali@kernel.org>, Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Thread-Topic: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Thread-Index:  AQHYb1JWsYyBCWIvdkmnZDAus5gR661rEeSAgAMvrICAAASSgIAAGGYAgAASqgCAAAJCgIAAAfYAgAAEDQCABHdtgA==
Date: Thu, 7 Jul 2022 09:56:04 +0000
Message-ID: <80e09b08-81cc-39e2-0fc4-f90d6250259c@csgroup.eu>
References: <20220524093939.30927-1-pali@kernel.org>
 <20220702094405.tp7eo4df7fjvn2ng@pali>
 <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au>
 <20220704103951.nm4m4kpgnus3ucqo@pali>
 <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com>
 <20220704131358.fy3z7tjcmk2m6pfh@pali>
 <CAK8P3a2hfnt+tHiqHrHAVyagSm73LJe4OV8ig=CKFcycfk4Zag@mail.gmail.com>
 <20220704132904.irvs4xefu4esgw6c@pali>
 <CAK8P3a30ecxG-A0_YDSBJAaGjcXXVwSnc7z4k-nreO+0UfJJ3w@mail.gmail.com>
In-Reply-To:  <CAK8P3a30ecxG-A0_YDSBJAaGjcXXVwSnc7z4k-nreO+0UfJJ3w@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 183ec1aa-c2a3-4b54-5735-08da5ffee817
x-ms-traffictypediagnostic: PR0P264MB3594:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 	=?utf-8?B?OFVwSkkrNlRacDVvT2YwTHJNbUxGMkM5WVFLaEVjTkZTRFhRTnVOdHRPMFgz?=
 =?utf-8?B?SXlXU1Zib00wZ0FBemRQTFVZTGlyeDdlVlBqY1RXQnl1eDNKU1BKdFp0NnNn?=
 =?utf-8?B?RVVOYnpXYlMzZ1dwcmZsTWtVbVd2MFc0cExMc1UyV0kxdjlOS051K2YrT1Vj?=
 =?utf-8?B?SVBaV0pBM3o3ajd2R2hveTM5ZTA5UlpVbFNTb2ZYQnpjb0pFZ21tSE5IcFVV?=
 =?utf-8?B?V0poZjM5eGNQbHdaUGhwV1lWR0FsNkYvVEt3MUtBZXZvNlBjUktsYlVSUEtV?=
 =?utf-8?B?R1FXMHFzckVFN3FFM2E1R2wyNkc1UWNWa3J1R1JlUXpNZ2dEdUhONzJNdDVX?=
 =?utf-8?B?NlFjVXE3OVZORG5QOWlMWlNrZ0d2WHd3ZEJQSVo2a28xSHJIVUJGdVNsdzkv?=
 =?utf-8?B?REs4S05HNnkxWlYrYlpHMUlYWGFTa3VhcGRKcExOQm9iOHM1MnF5OUFFcy9V?=
 =?utf-8?B?K3gva1o1VTBJQ3RqNG83d2dBbEZveVRJcE1udkZ0NHpJNk5VV0xDL0JGNGtP?=
 =?utf-8?B?TUQwSS9iQUtUc0Q2ampHb2plSm5oRml5Q29HZ3p5Tm5hb1d2amNKVHc2eEVY?=
 =?utf-8?B?em9iUWZacDJKeWsxYUQ5R3BDOWdEbUViZFhoZUsxRzdjVUxPMG50dnUwYjJH?=
 =?utf-8?B?WkFHdDRvV3lBTTVvMTVaczFzTU9xN2pqR25ENmI4YzMrbkdna3dyZmlCY2RN?=
 =?utf-8?B?WWIraVdCb1drUHVYZVlDTCtLVCs3R1Q4TkN2bTUyNWhZTW1DWkhGa25zS3FG?=
 =?utf-8?B?SFpuVG1OUmJaQ0NSOHBMamRhT3gvb2E0cnAwMEUwK0JZQWp2ZW05T0YyS2tp?=
 =?utf-8?B?akhXMGpSZHNtaHZoU3ZxN1E5Z0pFcHlWalJsQkVIWVhoc3c5STFkL1N1ZEpq?=
 =?utf-8?B?VktaOXVOKzd3dVQzY3FxTkkvRFVmNU9ERXVUOW9zSGFwVGhkdVFTSGpaSXFa?=
 =?utf-8?B?Vml3LzhaeWlSMGJFa1pCbXZ0R1EwbWZKb2ZUcEdzK0hDNnlvSG41cUpqWlE0?=
 =?utf-8?B?VW9vWTJrdW1pU0dYd1FxNmdobmlTVVFXS2JCVTVMb1dGN0NyL1ZhZEtiTENZ?=
 =?utf-8?B?alVNVW8zbFQ4alRxS1IxazlxUjdZcmRtdks5VDBKQVY4OWJ0MExHdXhMOFNO?=
 =?utf-8?B?b0p0cXhURExlS3dxYWxZMEdLZ3ZSZG1LOFBUalMxM1VybmgwRHE1OEd2SkNm?=
 =?utf-8?B?NEpFVGw4cUZkcWw4MUNRMjFlOGtrNUh3eDFFM2QzNzNzNkxFUVZSTlVlUllK?=
 =?utf-8?B?UEIrZ0VuUTh2U0RzV3dCdTJEY2JCTlNRY3AzMnVTb3VndGc1Zz09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(54906003)(110136005)(966005)(91956017)(66946007)(71200400001)(6486002)(76116006)(36756003)(86362001)(478600001)(122000001)(31696002)(6512007)(53546011)(31686004)(41300700001)(6506007)(26005)(38100700002)(64756008)(66446008)(66476007)(66556008)(4326008)(8676002)(316002)(186003)(2616005)(2906002)(4744005)(44832011)(5660300002)(8936002)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SlFmSi9TMUk3T2hYd3NSK1dUd1kvZ0NDSjRiNitDKzdMSFN1N3JlaWY4Rmhm?=
 =?utf-8?B?UDdxMUNvMjlkbnNCMk9uSHN2eVlvb3hlc3R0bHhpKzN1NHBJc2YrZDd3NEZy?=
 =?utf-8?B?ZXkrNHBoYlJTcW5pTGkwY0ZIUHhZRDlkLzM5aFBXb3hyT2YwRFp3TnQrYVNT?=
 =?utf-8?B?RFYzUVZCbmlPRmg2bUlyWDlGZ2hhZ0NDQVhnRnYzWlFsc215aDJiN0dHQmI2?=
 =?utf-8?B?VC9iUEozTFBjL2pJcVZBYzJZK0UxZGhEeGRuM3lydEpYZjhrRU43QWFtY2dF?=
 =?utf-8?B?TE9lazNSbE5FYjNVR1Z5WmVVOW5MdW9LQllWenVuU3NCbWxndGJudFp1NWd5?=
 =?utf-8?B?T0NFRWVCWFRNMnFIdjJUcWZyRXlhckRFZERvYjVPT2Rhazk5UWplUmJjZDBN?=
 =?utf-8?B?clIzVnJxK2R5dWFGM0lheUxTY09oRWJLRlN4QnZHT3JYb0lFMkozdnVIMUp4?=
 =?utf-8?B?WVNqaTh2dWE2VEtQclRGOUpSQlFhTzBQa2lqc3MzYWxpUGNyL3FsYkFReGRE?=
 =?utf-8?B?RVV1MDNJbTZySS9XT1FVUlpaWU52V2hkY1MrcS9Uc2NoT3pxY2pjejVZeURT?=
 =?utf-8?B?QjFqK0RjZU96eENreFZjVitIS2FGUGpHcjlwMmtXWWVjY1FZOERhVG9mZFZU?=
 =?utf-8?B?UWFISUtMOXMxWkNpM05QQkw5eTZxQkNhaHAvQnNkK2dOTFNONnJXSm53Kytk?=
 =?utf-8?B?NVcwOWFZY20vd2x1TXJ0aVJtbzlBMTUvYVZ3YmorZ0pUMjN2dlhVcjdDNkpq?=
 =?utf-8?B?QVZVNzJ5QmFhd2dSVm9UWjFndjlhQS9Qc0ZTTkhhWGRESXdyMWpOcEVRSDJw?=
 =?utf-8?B?L3ovMExQTGZZSnRERTVTZDhXZjV1MHk2Yi9pcm1rb1djZUtwMUhid1l4UXZO?=
 =?utf-8?B?S2hORGcyajI4RWRTOTJJUXNkUjRsSmFQakRzRnB1T3krN0dWUGhQU2ZGWVB4?=
 =?utf-8?B?VW9CaHJnOWJQWnVKcjY2SE5qRWhQR1loRTVwUnhHZjFmd0dmRjBnajdDRVh5?=
 =?utf-8?B?eDZxZ3RlLzNIOENVTExMZFZDaTVsWGIxQWliY1lEMWxjVDRuN0kxUm9QVnhD?=
 =?utf-8?B?TmVFVVNPZTJZb1hjNG9vcXVjZlNBOVQrVXNzcTNta1oyNlBNRWhET0JSK2lH?=
 =?utf-8?B?cWJ0TDZaalhEUXNKUTN5b0szSDJHb3FFOGtiSWx4QTlKR1htOExDOTg3VUdL?=
 =?utf-8?B?TkdRcHkxbVlFbkIyWnhhdWVrVHV6NW5qSjZhVXo3YU5EUGFxYXNRdVp6b0pp?=
 =?utf-8?B?WCtxTm5sMjlwbDVUcS9TVklsTFRUOUhUay85LzFUemE3Y2Y0cWMxZEwvaUdQ?=
 =?utf-8?B?ck15d2k5b2dKTkEvUkFzSjR4dmZxOW1qR01sUkhBU1dSSjhVbWFWRk9BK1dZ?=
 =?utf-8?B?OGQ1OHdNUHNqQTg3RFVJOVBzM1BYaDRteFhDdEUwWTh3M1lLQW1WN2ZPbno2?=
 =?utf-8?B?dGxFVXJwdGhhbzFCQm9xcDN1cFpiQXhyZjFLaUhNdDFXb0R2amZic1JDZWFT?=
 =?utf-8?B?YzFVYnVNbjFkUUJLRkR5MzV2RElueHQzbC9od3daWWxrSUh3cHhSZU5rUUx1?=
 =?utf-8?B?R3ZmWjJuaGppSzEwckJuL2F3S3RNY1Z2TmpTQnRDd1RSK1MzVXY5UzhYWWxa?=
 =?utf-8?B?OHJ0NGw1dXc2WmF6UjIraWo2dDREcDFCSzhSMksrMDQ4RXhtRjdBT0o4aGt6?=
 =?utf-8?B?VUw3UG9aUjJXM0EzT3VlZ2piS240WEEwbkJMU2k3VU0wY3RzVFZUSFNkU0I2?=
 =?utf-8?B?SEMzdUtuZ1pHazRZaVRpaWxsTVhha0ZCRmcxaVlLS3hjRm5EVk9raC9XVFU4?=
 =?utf-8?B?akIzaXJwY3pVRVdTbWQzMXh4QnZ2WDMyRTRxMFJBNFF2cFVhNWUzQzRoSWlV?=
 =?utf-8?B?RjI0ai85KzBpdm82M29BY3lNVDBRQXpURnlWOENrRFR5bnR4QWhjZGwzL1ZX?=
 =?utf-8?B?VXVXVXF0NkFyWDZmeXlHeXhGd2tTcmRCOGVaZFFiU09UN3dLbWpaNS9maEhT?=
 =?utf-8?B?OG9yNGNkcTZYRUlrWFA2VGIzbDJKekN1emU3TktTSTU0K2NZOG1sdC9yUndL?=
 =?utf-8?B?Wmd2RUpET3NxUzJEdU9HR0M5SlhZRWhJSjZMOGVIaWx2WDRiWUYxcUZSWDRY?=
 =?utf-8?B?L2tTTmFMRVZQaVM3dWx5V3orT21ZQ1VTSitWaWcxL2wxaWxBSzlNZTgwb2Jz?=
 =?utf-8?Q?a99sSHoLa2+vHIpi9wt2Fd8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F5C98FFE28B1B4B960FF630DEC62553@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 183ec1aa-c2a3-4b54-5735-08da5ffee817
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 09:56:04.6365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z3Lr3QZLcMw6dFTa4uaHjrYhF+Ms7dchb+lXER9g1NTq606THru5c2m+ECG8vESNpiG/ZUCvRvPdQLrl6HQxsrsp7SD1F774RGcrmIU67Vg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3594
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
Cc: Michael Ellerman <michael@ellerman.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzA3LzIwMjIgw6AgMTU6NDMsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoNCj4g
T24gTW9uLCBKdWwgNCwgMjAyMiBhdCAzOjI5IFBNIFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5v
cmc+IHdyb3RlOg0KPj4NCj4+IEFuZCBzdGlsbCB3aGF0IHRvIGRvIHdpdGggNGJmNGY0MmEyZmVi
ICgicG93ZXJwYy9rYnVpbGQ6IFNldCBkZWZhdWx0DQo+PiBnZW5lcmljIG1hY2hpbmUgdHlwZSBm
b3IgMzItYml0IGNvbXBpbGUiKT8gSSdtIHNvbWVob3cgbG9zdCB0aGVyZS4uLg0KPiANCj4gQXMg
ZmFyIGFzIEkgY2FuIHRlbGwsIHRoYXQgaXMgbm90IG5lZWRlZCwgYXMgbG9uZyBhcyBldmVyeSBj
b25maWd1cmF0aW9uDQo+IHNldHMgYSBzcGVjaWZpYyAtbWNwdT0gb3B0aW9uLCB0aGUgb25seSBy
ZWFzb24gaXQgd2FzIHJlcXVpcmVkIGlzIHRoYXQNCj4gdGhlcmUgd2VyZSBzb21lIGNvbmZpZ3Mg
dGhhdCByZWxpZWQgb24gdGhlIGNvbXBpbGVyIGRlZmF1bHQsIHdoaWNoDQo+IGVuZGVkIHVwIGJl
aW5nIC1tY3B1PXBvd2VyOCBvciBzaW1pbGFyLg0KPiANCg0KDQpJcyB0aGVyZSBhbnkgbGluayBi
ZXR3ZWVuIHRoaXMgZGlzY3Vzc2lvbiBhbmQgdGhlIGZvbGxvd2luZyBwYXRjaCANCnN1Ym1pdHRl
ZCAzLDUgeWVhcnMgYWdvID8NCg0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0
L2xpbnV4cHBjLWRldi9wYXRjaC8yMDE4MTIyNjE0MTUxMS4zYWc3dWY2cnZkZ3psbXh0QGRlY2Fk
ZW50Lm9yZy51ay8NCg0KVGhhbmtzDQpDaHJpc3RvcGhl
