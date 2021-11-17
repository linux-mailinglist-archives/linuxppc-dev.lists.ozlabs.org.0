Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 209C0453E26
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 03:01:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv5kw6kflz30Hv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 13:01:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=E+QcX5u9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=0955d447e6=terrelln@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=E+QcX5u9; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv5kB34q0z2xYG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 13:00:46 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AH1cMiB001281; 
 Tue, 16 Nov 2021 18:00:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=lj5UFxAkDLIa+FfCRgmPzHdnLnsOmkd88q1xv/xhK/4=;
 b=E+QcX5u98igOqb6lmEq9/Jd94P3YS8oxxWuypLdYBMOJfC3WuJPb9GFYKwnYYK8PRsXc
 bF1nAN39IxgO9ccZtHfFIltj57JAsFka8cuOAGFxhfQXyYtHH3S4kfRsRBpV2mDazg/X
 o4FZG3dW4xW4WLDqGCKOH9Tug1erBfkADhU= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3ccgr7bush-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 16 Nov 2021 18:00:02 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 16 Nov 2021 18:00:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9tsjDeUgj4IwHJWUwqWqV9ytOPFXWXVo6zu3epZf/5N1QOCU2eBOz0YZQqMAlmw5qxCnv31+NnocoiLVqdgCznukz8hfN5y7lj5A3MZeVjjttp3fn+0/aOLyTc4CGD91KGZPeKqpgYVsMtyGIW+w1O5pPl0GY5x0lS7k1Y8cGNDM5A2MnnokUWDxO7mYQ/fBDoZmE17bwovaCoa8dpmn3ls5ajrCyR1qVZ5SFreVCzOjdn/dg96NKN5riLg6I7Aoqt5Onacmgi+fpO9EU+3gGOzNHF7OV1NNzhU9QV3QdQjhrHR/rmNlsd9CnofyXztYo/LxO1Jfhn3mRWsBSTuRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6lWXSIg+X2cXkfbXTfDBNBBE0zXyL4zHo7XMePdLjU=;
 b=hXSxNYoyAOOxnYJ8gT073WvVtMzYhqUwIyiU03WCnxaZ/bZidB1XtoldZNNIYAPDRYUiSOBPQbPS0OkNb+pZMw7HRdSeTIUUIPp5KtUmy067h1q1lzHvNG7ldWPVTGmW6TMH621ghADs625GPGoYr9nzxo1ajT3gAr2IrFKIrvdnJrfRWaxlRA3xJ6qL91jPkg49b8s8xrKO+v9Zn74JlJO/rarVyZa2CwCiBGQ5qVGOloX5FPflvYfZhg6rmD1MRmkbHQ7PY1xUquIA21MqIrAMenTamd78I7GsZe2X/jER5lVnkylCwxV2ilbGPaVXFI5+KrTElsCvo8jULGX3hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BY3PR15MB4995.namprd15.prod.outlook.com (2603:10b6:a03:3ca::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 17 Nov
 2021 01:59:54 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::8d7d:240:3369:11b4]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::8d7d:240:3369:11b4%6]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 01:59:54 +0000
From: Nick Terrell <terrelln@fb.com>
To: Helge Deller <deller@gmx.de>
Subject: Re: Build regressions/improvements in v5.16-rc1
Thread-Topic: Build regressions/improvements in v5.16-rc1
Thread-Index: AQHX2jynD2CHATmgwEukyh+iAPvEB6wEy7gAgAItboA=
Date: Wed, 17 Nov 2021 01:59:54 +0000
Message-ID: <480CE37B-FE60-44EE-B9D2-59A88FDFE809@fb.com>
References: <20211115155105.3797527-1-geert@linux-m68k.org>
 <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
 <fcdead1c-2e26-b8ca-9914-4b3718d8f6d4@gmx.de>
In-Reply-To: <fcdead1c-2e26-b8ca-9914-4b3718d8f6d4@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmx.de; dkim=none (message not signed)
 header.d=none;gmx.de; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9eb4ef5-0756-42dc-80ce-08d9a96df341
x-ms-traffictypediagnostic: BY3PR15MB4995:
x-microsoft-antispam-prvs: <BY3PR15MB4995CD83649C35790F6E173FAB9A9@BY3PR15MB4995.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X5VGjqcbJvIvPaZF4Fr7MLSphffu3Er8/67htxugzFa0zhWV0SdUAlOa3H//NZiH+uI4WryG5YJK/iwIk2pQ8t7t4CdzJlbuC/sAoGCCpbXNiaEKcCEwr/CnzFNjhv0r747eoukC2eQDzuah4JiqIc3DP8Jf/dn5Yyp6hdwdKpmYN0QL46PJxBj9PLRzTMm3AaK9j47FIVT2ir/nttr0YT2zqvVNTaDOISz05UZBr62fa0noaYSVBmh2aJSV29/SyfKeu5wdmypUXoPOMgn6vj3dC/fxBmRKM2UZ3udrv+isepr5SH0AcC1KY9sxmef0rGSCj4NyIRilVWXFV9kvQOhz91wmFVpw0Asus/tV6/IMKqQuLTOFGfAOFxfNCzVcfxTzqC4igB4GXDDb2O3UwVR42GaHxouA/RR0Rdu74cLN7w+BeRfTADtiQUScgWnTui+ykjoML0ns3ifOhpjyZyDUAOs4TA24aGy/yhrYt5a9XDQs1hZn1zH+nVgdzl21b+pv200dBsRZ9a4+ygJvPmbhLzhQluQMRrlPyBaQcFDcY8bJuMKuT79yNimRh2RnMTAOORwh5g55y6smHaKNOmrXbuTBey1riXWO2d+pbDH5Oqif3ebA/Dhx+EeqnslPGnNXcxhEW65zjosGYN1MeLWU032iTMRI7yuMsV1/tCphI2OVjTN/Xfq/CcWvkMKjLRhxeeceUjMTiEt1ugbyqxoeNrpALIXe1vzEzClzTbWe00udzdorhYcKScM3ydcnmo38teYVzRwC8Y0Epdh3YyV2KbdVeBmy/Uh2wUC2+/uYnYlIx1TTBMDypFW5/82HEeM6mJkEjAns3yIWhjPRrA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(91956017)(316002)(508600001)(83380400001)(76116006)(6506007)(64756008)(6916009)(122000001)(71200400001)(66476007)(66446008)(33656002)(66556008)(36756003)(2616005)(38070700005)(2906002)(966005)(66946007)(8936002)(53546011)(186003)(8676002)(5660300002)(7416002)(6512007)(38100700002)(4326008)(6486002)(86362001)(54906003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YktWQVlYd3lEVWgzNTJNeTI1NGtHODk0NUkzcE9DM3diQjdWK1B1dlhwaTJZ?=
 =?utf-8?B?ekJmZFB3TzNHeTREZkhYcXNkcG11b21uUUJTRDcxUUl5RXNhdnZaUzNaZWtE?=
 =?utf-8?B?R2FzWnROTUhZM1VOZWF5RlI2bzYrQ0plN25hcEZGT2FVZko0d2VlbldkYkJl?=
 =?utf-8?B?OG9scUI2MGx3cWxYWTVnVVdLSTlqdTJlY01qZmZKN1ZPYTk3aGZ2TmoyOXBQ?=
 =?utf-8?B?MTJMUis0VXpyY0tNRXUzeEdvRWxZSzBIYlp2bWo5NHFCV0J0bHBQd1ovMmI2?=
 =?utf-8?B?cGgwekhrUHI5dUI1djlFWWxIQjhZZG12UFpKSTdQWTNOSVdhdStVVFZSNkdu?=
 =?utf-8?B?Wk5mR0VoREt2Y0lIU09BZ0pOaGtCcm5LQTNRSnp2YkZqWTRrYmJoem0yZjI3?=
 =?utf-8?B?c0FVMjFTbFJQNmNwVmpEMHZlY3hkY1NYaEVPaGc0VWorVlRMOE1rR2x3RTZI?=
 =?utf-8?B?M0hZb3lTWmczd3FuM3pUazNMclJSV3Bxei9UU3FJS09XVzd3NFowbG5XTC9E?=
 =?utf-8?B?cjN0ekxwNEhVTzFxSStkYWZhcVlQQVYyZVk0aDVTdDEwVXZyZ1lGbWo3S2tP?=
 =?utf-8?B?aG4xaElidHhoMGJ4VGtFbkRRdGdSaTRHeTVuOCtmT1pYR2d2VmExWkZtRy9u?=
 =?utf-8?B?VWdJempnbXFPcG5Hc3QxUVhFT2UvNTZwYm1wRTR0dmdob2N6Q1VuTm5kZ0s0?=
 =?utf-8?B?aFJYSTgrWlBIdkZKUWZiN0RwY1B1eGR0VlVUaWtWa0czdjdONTY2czJjQkNZ?=
 =?utf-8?B?Uy9rUngwc3pZQ1ROM0gwWUdESXNaUEdnRXpNck5rdk14NVhxQ2E5aU5EMG4z?=
 =?utf-8?B?aVVBREpkK1Vxam1yejdCMHEvandTSGFWOEUzWFBTVmkwVHZGM0R4eVFhcW9J?=
 =?utf-8?B?aUpuY0k2ejhQVkFURmxOUmpDb09iSjQ2WXdneFlvOWxNdjRzK2hJUWJ2eWIr?=
 =?utf-8?B?eHltSmlLZnJ3bGJ5S0I3QjhTZTY5bXN0cjBWUExmQnZwQUx4VDZqelh6a2Ro?=
 =?utf-8?B?NEpnWnZnZjdqZ0JOQlAvTWlWRXNEc09FVlNHUTVxUXlGYXM0UjErRmV5NHB2?=
 =?utf-8?B?dm42RURWamp6bjFYQzlkTmFmekI2Smhvd1VydWZvMmZHOGNsSWxkdkVLZ2po?=
 =?utf-8?B?TklaUGlDNVNsc0d1OU41VytGT3hrQ3JxM2JGUm83ZnEvTUdBVjlDWjEwenlY?=
 =?utf-8?B?UjAvVHZ4VXd5VGhiOXdPNWFYSjdHOTYxMmFpQ0N4STJWNE1QcFRFUmJkeU15?=
 =?utf-8?B?eW9uUW5NRWFZZ1Zsay9uKzc5aVA5aTl0OWtHS1RrdnBhenZhSHhMdUxZdzNo?=
 =?utf-8?B?MVBjQXFRZCswRUgrODZkVjE5Q1ZtWWwray9qK3ZOeEZnOVo0ZDh0WE5rK0dw?=
 =?utf-8?B?TEJUSVFiUXowTkhKSnVjdGh5cGliM3lCelcyTFRhdG9iOTEwSWRDS0RwK1p1?=
 =?utf-8?B?ODc3bklWN3R6L2hUWDlHcGJSRFZBT2ZoT1lQZWNmS2hRK1U4TyswVStaWUJx?=
 =?utf-8?B?dCttYUhnUHIzQWxKV0NHZFNCN1ZjRFYvK3k2UmFCUzFENTZyK2UwSVJ2cWxV?=
 =?utf-8?B?RmxnSXp5YmRWYWhmMTNVWURMY0swdnBSeVZjdkdsUE9XVHdPN1JjZXpuZEl5?=
 =?utf-8?B?ZDlidkFkWWJCV1FsUlJETDNmTUExTUlaeFRZT2s1a1ZQWUZXemxZNXh4TzIr?=
 =?utf-8?B?SmFrY2VneEg5WUlhZVVQYVlNSzRDL3lCdk82Z1dLODJjbGdDTklDK003bUdG?=
 =?utf-8?B?b0VmWThzSjhJZmw1NDJ6SmgwWHhCcXUxc211SEpPZ2dRcCsyaTdKVll3UVlM?=
 =?utf-8?B?VWluampwVEVDa3F2eVRkd0lBNGRSRjFJOW9aZDdpYW5EcXRQVk1wbmVnZEhr?=
 =?utf-8?B?Q1ZoZUpzV1NtekVlbWhvMlRVVTNFSXNVWTNnSFJ1cnlDWEc0bGNUSk4rTm9z?=
 =?utf-8?B?VU5LWXY2SjJnVVEzUjFPdWZXeXZBc2ZxSVhkNnJGdmU5QWwwR2Vwa09tL0hy?=
 =?utf-8?B?b01YK0h1UDFsTzZndEcvWC9LVTRGNm9ZT0lUWXRRcWQyTlNRWXFkampBdXhY?=
 =?utf-8?B?UkN2WHljVDVEelJmTjJBQllEMjBXcFIyRURHcitwamV1bHcwSkhBR2t4TGRa?=
 =?utf-8?B?UXFUWXJuU1RkUzVTTVdyTWtKYzFDcDJMUExMY0VqTnV2VDZGSHlQMDQvbDVG?=
 =?utf-8?B?ZkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E602ED3A1C78A4D8F9DEAFA8A6CBBFB@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9eb4ef5-0756-42dc-80ce-08d9a96df341
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 01:59:54.5832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: trODfFguX9Tz1CVPSDlB4blnHx4S/lrzJLfU0Ib9rOLloyVrj82zKJdEMcInNW2p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR15MB4995
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: KPMP0YXMvmoEisLTn4S9VhDiOaCdBctz
X-Proofpoint-ORIG-GUID: KPMP0YXMvmoEisLTn4S9VhDiOaCdBctz
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 2 URL's were un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-16_07,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111170007
X-FB-Internal: deliver
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, Andrey
 Ryabinin <ryabinin.a.a@gmail.com>, Stan
 Skowronek <stan@corellium.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 kasan-dev <kasan-dev@googlegroups.com>, Sergio
 Paracuellos <sergio.paracuellos@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Anton Altaparmakov <anton@tuxera.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Joey Gouly <joey.gouly@arm.com>,
 =?utf-8?B?QW5kcsOpIEFsbWVpZGE=?= <andrealmeid@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 "linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>,
 Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Linux
 Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gT24gTm92IDE1LCAyMDIxLCBhdCA4OjQ0IEFNLCBIZWxnZSBEZWxsZXIgPGRlbGxlckBn
bXguZGU+IHdyb3RlOg0KPiANCj4gT24gMTEvMTUvMjEgMTc6MTIsIEdlZXJ0IFV5dHRlcmhvZXZl
biB3cm90ZToNCj4+IE9uIE1vbiwgTm92IDE1LCAyMDIxIGF0IDQ6NTQgUE0gR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6DQo+Pj4gQmVsb3cgaXMgdGhlIGxp
c3Qgb2YgYnVpbGQgZXJyb3Ivd2FybmluZyByZWdyZXNzaW9ucy9pbXByb3ZlbWVudHMgaW4NCj4+
PiB2NS4xNi1yYzFbMV0gY29tcGFyZWQgdG8gdjUuMTVbMl0uDQo+Pj4gDQo+Pj4gU3VtbWFyaXpl
ZDoNCj4+PiAgLSBidWlsZCBlcnJvcnM6ICsyMC8tMTMNCj4+PiAgLSBidWlsZCB3YXJuaW5nczog
KzMvLTI4DQo+Pj4gDQo+Pj4gSGFwcHkgZml4aW5nISA7LSkNCj4+PiANCj4+PiBUaGFua3MgdG8g
dGhlIGxpbnV4LW5leHQgdGVhbSBmb3IgcHJvdmlkaW5nIHRoZSBidWlsZCBzZXJ2aWNlLg0KPj4+
IA0KPj4+IFsxXSBodHRwOi8va2lzc2tiLmVsbGVybWFuLmlkLmF1L2tpc3NrYi9icmFuY2gvbGlu
dXMvaGVhZC9mYTU1YjdkY2RjNDNjMWFhMWJhMTJiY2E5ZDJkZDQzMThjMmEwZGJmLyAgKGFsbCA5
MCBjb25maWdzKQ0KPj4+IFsyXSBodHRwOi8va2lzc2tiLmVsbGVybWFuLmlkLmF1L2tpc3NrYi9i
cmFuY2gvbGludXMvaGVhZC84YmI3ZWNhOTcyYWQ1MzFjOWIxNDljMGE1MWFiNDNhNDE3Mzg1ODEz
LyAgKGFsbCA5MCBjb25maWdzKQ0KPj4+IA0KPj4+IA0KPj4+ICoqKiBFUlJPUlMgKioqDQo+Pj4g
DQo+Pj4gMjAgZXJyb3IgcmVncmVzc2lvbnM6DQo+Pj4gICsgL2tpc3NrYi9zcmMvYXJjaC9wYXJp
c2MvaW5jbHVkZS9hc20vanVtcF9sYWJlbC5oOiBlcnJvcjogZXhwZWN0ZWQgJzonIGJlZm9yZSAn
X19zdHJpbmdpZnknOiAgPT4gMzM6NCwgMTg6NA0KPj4+ICArIC9raXNza2Ivc3JjL2FyY2gvcGFy
aXNjL2luY2x1ZGUvYXNtL2p1bXBfbGFiZWwuaDogZXJyb3I6IGxhYmVsICdsX3llcycgZGVmaW5l
ZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWxhYmVsXTogID0+IDM4OjEsIDIzOjENCj4+
IA0KPj4gICAgZHVlIHRvIHN0YXRpY19icmFuY2hfbGlrZWx5KCkgaW4gY3J5cHRvL2FwaS5jDQo+
PiANCj4+IHBhcmlzYy1hbGxtb2Rjb25maWcNCj4gDQo+IGZpeGVkIG5vdyBpbiB0aGUgcGFyaXNj
IGZvci1uZXh0IGdpdCB0cmVlLg0KPiANCj4gDQo+Pj4gICsgL2tpc3NrYi9zcmMvZHJpdmVycy9n
cHUvZHJtL21zbS9tc21fZHJ2Lmg6IGVycm9yOiAiQ09ORCIgcmVkZWZpbmVkIFstV2Vycm9yXTog
ID0+IDUzMQ0KPj4+ICArIC9raXNza2Ivc3JjL2xpYi96c3RkL2NvbXByZXNzL3pzdGRfZG91Ymxl
X2Zhc3QuYzogZXJyb3I6IHRoZSBmcmFtZSBzaXplIG9mIDMyNTIgYnl0ZXMgaXMgbGFyZ2VyIHRo
YW4gMTUzNiBieXRlcyBbLVdlcnJvcj1mcmFtZS1sYXJnZXItdGhhbj1dOiAgPT4gNDc6MQ0KPj4+
ICArIC9raXNza2Ivc3JjL2xpYi96c3RkL2NvbXByZXNzL3pzdGRfZG91YmxlX2Zhc3QuYzogZXJy
b3I6IHRoZSBmcmFtZSBzaXplIG9mIDMzNjAgYnl0ZXMgaXMgbGFyZ2VyIHRoYW4gMTUzNiBieXRl
cyBbLVdlcnJvcj1mcmFtZS1sYXJnZXItdGhhbj1dOiAgPT4gNDk5OjENCj4+PiAgKyAva2lzc2ti
L3NyYy9saWIvenN0ZC9jb21wcmVzcy96c3RkX2RvdWJsZV9mYXN0LmM6IGVycm9yOiB0aGUgZnJh
bWUgc2l6ZSBvZiA1MzQ0IGJ5dGVzIGlzIGxhcmdlciB0aGFuIDE1MzYgYnl0ZXMgWy1XZXJyb3I9
ZnJhbWUtbGFyZ2VyLXRoYW49XTogID0+IDMzNDoxDQo+Pj4gICsgL2tpc3NrYi9zcmMvbGliL3pz
dGQvY29tcHJlc3MvenN0ZF9kb3VibGVfZmFzdC5jOiBlcnJvcjogdGhlIGZyYW1lIHNpemUgb2Yg
NTM4MCBieXRlcyBpcyBsYXJnZXIgdGhhbiAxNTM2IGJ5dGVzIFstV2Vycm9yPWZyYW1lLWxhcmdl
ci10aGFuPV06ICA9PiAzNTQ6MQ0KPj4+ICArIC9raXNza2Ivc3JjL2xpYi96c3RkL2NvbXByZXNz
L3pzdGRfZmFzdC5jOiBlcnJvcjogdGhlIGZyYW1lIHNpemUgb2YgMTgyNCBieXRlcyBpcyBsYXJn
ZXIgdGhhbiAxNTM2IGJ5dGVzIFstV2Vycm9yPWZyYW1lLWxhcmdlci10aGFuPV06ICA9PiAzNzI6
MQ0KPj4+ICArIC9raXNza2Ivc3JjL2xpYi96c3RkL2NvbXByZXNzL3pzdGRfZmFzdC5jOiBlcnJv
cjogdGhlIGZyYW1lIHNpemUgb2YgMjIyNCBieXRlcyBpcyBsYXJnZXIgdGhhbiAxNTM2IGJ5dGVz
IFstV2Vycm9yPWZyYW1lLWxhcmdlci10aGFuPV06ICA9PiAyMDQ6MQ0KPj4+ICArIC9raXNza2Iv
c3JjL2xpYi96c3RkL2NvbXByZXNzL3pzdGRfZmFzdC5jOiBlcnJvcjogdGhlIGZyYW1lIHNpemUg
b2YgMzgwMCBieXRlcyBpcyBsYXJnZXIgdGhhbiAxNTM2IGJ5dGVzIFstV2Vycm9yPWZyYW1lLWxh
cmdlci10aGFuPV06ICA9PiA0NzY6MQ0KPj4gDQo+PiBwYXJpc2MtYWxsbW9kY29uZmlnDQo+IA0K
PiBwYXJpc2MgbmVlZHMgbXVjaCBiaWdnZXIgZnJhbWUgc2l6ZXMsIHNvIEknbSBub3QgYXN0b25p
c2hlZCBoZXJlLg0KPiBEdXJpbmcgdGhlIHY1LjE1IGN5Y2wgSSBpbmNyZWFzZWQgaXQgdG8gMTUz
NiAoZnJvbSAxMjgwKSwgc28gSSdtIHNpbXBseSB0ZW1wdGVkIHRvDQo+IGluY3JlYXNlIGl0IHRo
aXMgdGltZSB0byA0MDk2LCB1bmxlc3Mgc29tZW9uZSBoYXMgYSBiZXR0ZXIgaWRlYS4uLi4NCg0K
VGhpcyBwYXRjaCBzZXQgc2hvdWxkIGZpeCB0aGUgenN0ZCBzdGFjayBzaXplIHdhcm5pbmdzIFsw
XS4gSeKAmXZlDQp2ZXJpZmllZCB0aGUgZml4IHVzaW5nIHRoZSBzYW1lIHRvb2xpbmc6IGdjYy04
LWhwcGEtbGludXgtZ251Lg0KDQpJ4oCZbGwgc2VuZCB0aGUgUFIgdG8gTGludXMgdG9tb3Jyb3cu
IEnigJl2ZSBiZWVuIGluZm9ybWVkIHRoYXQgaXQNCmlzbid0IHN0cmljdGx5IG5lY2Vzc2FyeSB0
byBzZW5kIHRoZSBwYXRjaGVzIHRvIHRoZSBtYWlsaW5nIGxpc3QNCmZvciBidWcgZml4ZXMsIGJ1
dCBpdHMgYWxyZWFkeSBkb25lLCBzbyBJ4oCZbGwgd2FpdCBhbmQgc2VlIGlmIHRoZXJlDQppcyBh
bnkgZmVlZGJhY2suDQoNCkJlc3QsDQpOaWNrIFRlcnJlbGwNCg0KWzBdIGh0dHBzOi8vbGttbC5v
cmcvbGttbC8yMDIxLzExLzE2LzEyMTcNCg0KPj4+ICArIC9raXNza2Ivc3JjL2ZzL250ZnMvYW9w
cy5jOiBlcnJvcjogdGhlIGZyYW1lIHNpemUgb2YgMjI0MCBieXRlcyBpcyBsYXJnZXIgdGhhbiAy
MDQ4IGJ5dGVzIFstV2Vycm9yPWZyYW1lLWxhcmdlci10aGFuPV06ICA9PiAxMzExOjENCj4+PiAg
KyAva2lzc2tiL3NyYy9mcy9udGZzL2FvcHMuYzogZXJyb3I6IHRoZSBmcmFtZSBzaXplIG9mIDIz
MDQgYnl0ZXMgaXMgbGFyZ2VyIHRoYW4gMjA0OCBieXRlcyBbLVdlcnJvcj1mcmFtZS1sYXJnZXIt
dGhhbj1dOiAgPT4gMTMxMToxDQo+Pj4gICsgL2tpc3NrYi9zcmMvZnMvbnRmcy9hb3BzLmM6IGVy
cm9yOiB0aGUgZnJhbWUgc2l6ZSBvZiAyMzIwIGJ5dGVzIGlzIGxhcmdlciB0aGFuIDIwNDggYnl0
ZXMgWy1XZXJyb3I9ZnJhbWUtbGFyZ2VyLXRoYW49XTogID0+IDEzMTE6MQ0KPj4gDQo+PiBwb3dl
cnBjLWFsbG1vZGNvbmZpZw0KPj4gDQo+Pj4gICsgL2tpc3NrYi9zcmMvaW5jbHVkZS9saW51eC9j
b21waWxlcl90eXBlcy5oOiBlcnJvcjogY2FsbCB0byAnX19jb21waWxldGltZV9hc3NlcnRfMzY2
JyBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSBlcnJvcjogRklFTERfUFJFUDogdmFsdWUgdG9vIGxh
cmdlIGZvciB0aGUgZmllbGQ6ICA9PiAzMzU6MzgNCj4+IA0KPj4gICAgaW4gZHJpdmVycy9waW5j
dHJsL3BpbmN0cmwtYXBwbGUtZ3Bpby5jDQo+PiANCj4+IGFybTY0LWFsbG1vZGNvbmZpZyAoZ2Nj
OCkNCj4+IA0KPj4+ICArIC9raXNza2Ivc3JjL2luY2x1ZGUvbGludXgvZm9ydGlmeS1zdHJpbmcu
aDogZXJyb3I6IGNhbGwgdG8gJ19fcmVhZF9vdmVyZmxvdycgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1
dGUgZXJyb3I6IGRldGVjdGVkIHJlYWQgYmV5b25kIHNpemUgb2Ygb2JqZWN0ICgxc3QgcGFyYW1l
dGVyKTogID0+IDI2MzoyNSwgMjc3OjE3DQo+PiANCj4+ICAgIGluIGxpYi90ZXN0X2thc2FuLmMN
Cj4+IA0KPj4gczM5MC1hbGx7bW9kLHllc31jb25maWcNCj4+IGFybTY0LWFsbG1vZGNvbmZpZyAo
Z2NjMTEpDQo+PiANCj4+PiAgKyBlcnJvcjogbW9kcG9zdDogIm1pcHNfY21faXM2NCIgW2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tdDc2MjEua29dIHVuZGVmaW5lZCE6ICA9PiBOL0ENCj4+
PiAgKyBlcnJvcjogbW9kcG9zdDogIm1pcHNfY21fbG9ja19vdGhlciIgW2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvcGNpZS1tdDc2MjEua29dIHVuZGVmaW5lZCE6ICA9PiBOL0ENCj4+PiAgKyBlcnJv
cjogbW9kcG9zdDogIm1pcHNfY21fdW5sb2NrX290aGVyIiBbZHJpdmVycy9wY2kvY29udHJvbGxl
ci9wY2llLW10NzYyMS5rb10gdW5kZWZpbmVkITogID0+IE4vQQ0KPj4+ICArIGVycm9yOiBtb2Rw
b3N0OiAibWlwc19jcGNfYmFzZSIgW2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tdDc2MjEu
a29dIHVuZGVmaW5lZCE6ICA9PiBOL0ENCj4+PiAgKyBlcnJvcjogbW9kcG9zdDogIm1pcHNfZ2Ny
X2Jhc2UiIFtkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbXQ3NjIxLmtvXSB1bmRlZmluZWQh
OiAgPT4gTi9BDQo+PiANCj4+IG1pcHMtYWxsbW9kY29uZmlnDQo+PiANCj4+PiAzIHdhcm5pbmcg
cmVncmVzc2lvbnM6DQo+Pj4gICsgPHN0ZGluPjogd2FybmluZzogI3dhcm5pbmcgc3lzY2FsbCBm
dXRleF93YWl0diBub3QgaW1wbGVtZW50ZWQgWy1XY3BwXTogID0+IDE1NTk6Mg0KPj4gDQo+PiBw
b3dlcnBjLCBtNjhrLCBtaXBzLCBzMzkwLCBwYXJpc2MgKGFuZCBwcm9iYWJseSBtb3JlKQ0KPiAN
Cj4gV2lsbCBzb21lb25lIHVwZGF0ZSBhbGwgb2YgdGhlbSBhdCBvbmNlPw0KPiANCj4gDQo+IA0K
PiANCj4gSGVsZ2UNCj4gDQo+IA0KPj4+ICArIGFyY2gvbTY4ay9jb25maWdzL211bHRpX2RlZmNv
bmZpZzogd2FybmluZzogc3ltYm9sIHZhbHVlICdtJyBpbnZhbGlkIGZvciBNQ1RQOiAgPT4gMzIy
DQo+Pj4gICsgYXJjaC9tNjhrL2NvbmZpZ3Mvc3VuM19kZWZjb25maWc6IHdhcm5pbmc6IHN5bWJv
bCB2YWx1ZSAnbScgaW52YWxpZCBmb3IgTUNUUDogID0+IDI5NQ0KPj4gDQo+PiBZZWFoLCB0aGF0
IGhhcHBlbnMgd2hlbiBzeW1ib2xzIGFyZSBjaGFuZ2VkIGZyb20gdHJpc3RhdGUgdG8gYm9vbC4u
Lg0KPj4gV2lsbCBiZSBmaXhlZCBpbiA1LjE3LXJjMSwgd2l0aCB0aGUgbmV4dCBkZWZjb25maWcg
cmVmcmVzaC4NCj4+IA0KPj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+PiANCj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgR2VlcnQNCj4+IA0KPj4gLS0NCj4+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBU
aGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcN
Cj4+IA0KPj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUs
IEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0K
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo+PiAN
Cj4gDQoNCg==
