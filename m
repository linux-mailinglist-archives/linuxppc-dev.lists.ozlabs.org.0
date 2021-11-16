Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95411453A4A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 20:41:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtxHx3nT4z307x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 06:41:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256 header.s=sel1 header.b=MjmL+m7b;
	dkim=pass (1024-bit key; unprotected) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256 header.s=selector1 header.b=bybsIwlm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=selinc.com (client-ip=148.163.147.191;
 helo=mx0a-000e8d01.pphosted.com;
 envelope-from=prvs=9954212cc3=eugene_bordenkircher@selinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256
 header.s=sel1 header.b=MjmL+m7b; 
 dkim=pass (1024-bit key;
 unprotected) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256
 header.s=selector1 header.b=bybsIwlm; 
 dkim-atps=neutral
X-Greylist: delayed 1701 seconds by postgrey-1.36 at boromir;
 Wed, 17 Nov 2021 06:40:13 AEDT
Received: from mx0a-000e8d01.pphosted.com (mx0a-000e8d01.pphosted.com
 [148.163.147.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtxH14bBcz2yNK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 06:40:07 +1100 (AEDT)
Received: from pps.filterd (m0136170.ppops.net [127.0.0.1])
 by mx0b-000e8d01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AGHd3fR010913;
 Tue, 16 Nov 2021 11:11:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=sel1;
 bh=sVt9L+MheXZDSSjhSqjvFjjOJl05hIeYoJm0kV/h9X0=;
 b=MjmL+m7bmjy5IedfsIOmPfcVO0EYhzQav91Jgx/Mhr/j5VS26CeEtO7jA74Q30BZmv5y
 bFBKFW06iB/UpfnQpZ7OKQL6tBvUDp+TMa+TJhezsmw7i+UiW+G3dfNC2IajuA7HRiT6
 RLkedzOXRJvD1TOyqobeTaA2k2k8x88Nre902CS2XcX43CfQUOoqpyXxYEgrxHLDT0RU
 zblVuq8wLQo/5RE/sNEbfBELaavVKe7+hI+3oa+heFMtMekBWxr1ZXJeJzc4V8JS3n11
 uTfuBdhfGeB4kQbxNK/q76Jf5pGU+dLWdUsYhPwc7aUQ/+5eDutYrCuW2d/Pqs4poAHr kQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=Eugene_Bordenkircher@selinc.com
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by mx0b-000e8d01.pphosted.com (PPS) with ESMTPS id 3cc1x78j3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Nov 2021 11:11:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mO3WJ3rg1gRna6pKPee5FMJ4zDQADsHryJAIyTN2QvVN/BIYuwxxDaTQsAE8QqxQt2xg757PlC+1UOTa+OFYm9jcQ58dQruF7DokCdPJa68eRaCypFoTN2DZ/PTWEJm0TMjjBQq3sSAddeaIu5h5U6JlMm57H0IY374CkyRVPBato6tqWGPYCewOVlfH/kbnBQTcwmT15G2tf/sVz78clemQ0rr5qZSlz8LP+d3JeJoJxU2sr9JJoMP/3tBBf4mp5p971f73baT1ftD8edAhus0/KxdDRKzIqyhD8SqZ6EkIjZyUB/gkczr9rSLUHm8WiIZ6JJ2up1sNO26fblbTiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVt9L+MheXZDSSjhSqjvFjjOJl05hIeYoJm0kV/h9X0=;
 b=iJqcVg4qc41yo3PKYOfoBqZHtmiSG8fFK6kA23Nd+tBfhbdbEFq3JDCp+5zErzY8cZ/God6Ue3znYl/fulQHVOhfrLQ4tqmBMs8k4cQ12Gwb173dMAQ1zeFcLJk3npm9oWaTZbIEcW0wm2RFxzat1B/cxs+PB0veorpqh2eX8LGyW3F3APQo4qJ6o2PGnRw5WC8bKQDAT6eBfQ4lHvuj6SFjAmwtBfgIL/2q9MfsgfmGCQUo1aQF+arQsro3wBET1rHMTSHF77BYkC8rIlthOU5M5kcyxodXtGNNrlTM+kQ0GYwiK0+0BcSaZt7Daoi04nTqJq8h8+C89XAvXV51hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=selinc.com; dmarc=pass action=none header.from=selinc.com;
 dkim=pass header.d=selinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVt9L+MheXZDSSjhSqjvFjjOJl05hIeYoJm0kV/h9X0=;
 b=bybsIwlmk0DHtKR8JybJXKAc4cfNsC8WvgF8Eq5dgUs/qQj7ha5JPmeH5Mq8aE12/zHpHd57bZA/0LZEWY9QQlcUdsRJj3zNotxMDsdXm5FxV5MDQHa7aUfmryISNEVsQrTnEfXubqMUWByfS+MOjF32guxogLv3hsK5UQEwC2c=
Received: from MWHPR2201MB1520.namprd22.prod.outlook.com
 (2603:10b6:301:34::25) by MW3PR22MB2156.namprd22.prod.outlook.com
 (2603:10b6:303:44::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17; Tue, 16 Nov
 2021 19:11:30 +0000
Received: from MWHPR2201MB1520.namprd22.prod.outlook.com
 ([fe80::bc7f:f01f:c0f8:2492]) by MWHPR2201MB1520.namprd22.prod.outlook.com
 ([fe80::bc7f:f01f:c0f8:2492%4]) with mapi id 15.20.4669.016; Tue, 16 Nov 2021
 19:11:29 +0000
From: Eugene Bordenkircher <Eugene_Bordenkircher@selinc.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>
Subject: RE: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Topic: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Index: AdfM5PT/NvfAW0+iTcC+AdIF01azggAtEqGAAKVd5oACc0lYgABIbVXQ
Date: Tue, 16 Nov 2021 19:11:29 +0000
Message-ID: <MWHPR2201MB15209AA4F2457934BDD3293B91999@MWHPR2201MB1520.namprd22.prod.outlook.com>
References: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <2c275adc278477e1e512ea6ecc0c1f4dcc46969d.camel@infinera.com>
 <6659a2c7fd9fffac766b8389244e5885ccbd38bd.camel@infinera.com>
 <bb5c5d0f-2ae7-8426-0021-baeca8f7dd11@leemhuis.info>
In-Reply-To: <bb5c5d0f-2ae7-8426-0021-baeca8f7dd11@leemhuis.info>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b46be373-5b18-40ba-7760-08d9a934e53d
x-ms-traffictypediagnostic: MW3PR22MB2156:
x-microsoft-antispam-prvs: <MW3PR22MB2156FE308FCC6299CB51096991999@MW3PR22MB2156.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jdUdJd/4APK29V9/VTBOWXz4wKw61mdBLM6wGkJgAl2UrVt4XWagQPNKTYBLJxOrCiecsQHCMzw4QGICVyfCFw5V0p/kFm330wIXikBryrNq4q3dDD2xzI+C0f6FR1G3t7WfVMBFHNY3myH/BUB2ayEJn9H7psAcbE4clcpmTiJ4tsEMSt6tl68ZnWnhSYbhgZ1/z+NNysuvqLBmwhnZOvEydUp5+wYptt9ZeJHHUtLbRIOKliAXfaFXxFTIFRIlxYxN9eI/h76HLXRH4aTEf2B/v80hharwll4AewQsgOz8JnMNrxOEXrcwSAZsBUM34Jqf8PcXALlYQ8hMNi9fGcioOzR0jMv8axmIPIgR5A3B3xBhBaIt/CElZB6yExuDYYsTC326p/7U3xis8skFpMwPkbxXAL0kGz5uTSG+a3vTEPrdEjbzwwIv1+7gDF8C1vzvD8A/PV9PXRf0HX7Mbme/Kg3vGyFyN1DN7LAzKFzmDKQgK6oplHuxi/1QJtbBPLyoNKGSpf7yFvol0ZPiZhh7crl3EkH+TLzTc4xWYLXtw9mPK/BQ2bPlcOmVpu2S8yAVBLcsp+AINZmT+GPF5TSmnDJznQ7XpYRaWizUL3kA6ptX7/xtJ8X89dnTituUI+/gGTuKSGFUe9CxzEA2uYsiMZA2kfYcOI9FCptMLZAardqoWvqzI7XJAx7on5pJO57BfvTQZJpA65r7VIYa4g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR2201MB1520.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(83380400001)(76116006)(26005)(86362001)(38070700005)(66946007)(316002)(54906003)(4001150100001)(2906002)(110136005)(8676002)(53546011)(9686003)(6506007)(508600001)(4326008)(33656002)(71200400001)(66556008)(66476007)(66446008)(64756008)(8936002)(38100700002)(52536014)(5660300002)(122000001)(55016002)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2Mrb1psS1h4WnVka1gvYVNNZ3ArV3JuK1U0WWR1aE83TS9RN3BCMnVpbFBD?=
 =?utf-8?B?OTg5bml5YmJiRFZDYUpkcnkwd2ZhaWFYZE8vNklxUVZBeGVoKzBYb1YySnVz?=
 =?utf-8?B?UTVYZkJRRnBVTGNJemtTTFpGaFFHdXNIU3J2aWFITE43NndmaDVQOG1vQkxT?=
 =?utf-8?B?aG0vVDh3Y1I5a1pQYkFydE1HaDFxcXp1V2tMYVJGdFdud0QzZFlycUo3OW9n?=
 =?utf-8?B?NmppaFhYTXBPWXl4ODdoaXNQdDZhTW16V1B1ZGhndDVXbmJFOE8xTWc3Mml6?=
 =?utf-8?B?WkNKajhNYXFETWs2emNqL1Q0OUtocjJhRm9iQWNwSWd2S3h5UHRUVHphaWd0?=
 =?utf-8?B?NThiYkxyd2ZoYWxMZU5rSzgrOWhIak96WEI4NkFuR2poaW5Fa0hMVjRSd3dF?=
 =?utf-8?B?eDZQbjZsQnhTMFBaSzJMUmZzb1krMVM2R3pkR3Jpc3d3SjFIbHlpTTJWTFc2?=
 =?utf-8?B?d295ZnVhd2pTZjF6aStOQVdzVnZPcGVHbUdHNGNTVmZpWkFBcnd2c09QY3pw?=
 =?utf-8?B?Z1NLMmdEbWlkM0J3NEFkQkc4amVUS09QcnB2UlViQ3BYazFKY01CSHdHYzN6?=
 =?utf-8?B?a3FzdXAza29VdUo3cnlXSFFGWkRhcWNLS1ZWbzc0cWFVcCs5Q25ZQlE2YWlh?=
 =?utf-8?B?amtxdWQ1TzAwcVlqZUIvV09zSVB3clU2QUhUQjNaajNMdGZ0c2JNSlV2R25C?=
 =?utf-8?B?Y0lqNzUwTStZR083clJmbU1NZ1pML3NDL2hiWnFjNUtJK3JZL1haRVZpUllG?=
 =?utf-8?B?SlNTcC8yemV2NFg0azE2TzZHR2FzZVBUZUZDZ05GRTlPSkpteFVoY1ZGekhQ?=
 =?utf-8?B?M0ZlclRaSnZRMmxySjlCbFlCMHVZUUNtNFI2VE9udXlyNFZDSENiTldvZm4r?=
 =?utf-8?B?YnhWWk1RTFU0d0lJa0ZtQWY0QU5qeDZVRW83aWt1NExBS0JVQmgzY0x2N2la?=
 =?utf-8?B?ZmlNeXYzNkhFdHhMMHh5anpVMHA2RFBIdlBlSEZRUjA2WlNGTVkwUVcrNGhF?=
 =?utf-8?B?TDVsRzBmVHBXQnUrNXVrVEd3TEc2K1RSZTV3UVhFV3RPaUpGZVFHb0QyN3Zq?=
 =?utf-8?B?R3A3cEcwQnhnZ0RMTHRodExKOGpYcmI3c2VVbk44NnNoVGFkQ0RjOVcwZVpu?=
 =?utf-8?B?SlZZeEJoWm5DYTdlMEx6d2hFNC9abXV5bTlhdnAyWjlaSnhtNmZpWWR5MjQ5?=
 =?utf-8?B?bGFqRnBLZDNDc0t2blZ4Ym9zZSt5Q2JaQytNTzdIeDJ2dWYzVWswL1puNkZm?=
 =?utf-8?B?YVZhVlo2OFZGclJYUFNpaCsrZGRabjlPNW8zVVJkanNzbWxsVVBDWGpIZnFL?=
 =?utf-8?B?UVBQRFkzWFN5c1FHZnNRTittd3NETVdXcDJtMkZpZ01xTkJLMVNOZWoydGFj?=
 =?utf-8?B?ekdWWDMxa1F3Zmc4NHdLRlFCZ1BTUCtaMS80djJjUldvN2VGN3Q4M0d2Slpa?=
 =?utf-8?B?ejFEb1dlNGhzSUtPR2FGUm5JQWZyRm5FSVpZQUJzaThRUVNva2p6UnB0NzJZ?=
 =?utf-8?B?N1p2WHpyZCtpdHJ6cEozVmlud3lwbVNBOFgraFJ0ZEw4Um5lTXF2Wkd5YUlT?=
 =?utf-8?B?RTFBYU5qTUJ5YWdLN005cGlrQmFldGlFeWZJWXU3Q3Y3TnNLM1Boa1FuKy9W?=
 =?utf-8?B?M1QvamhlTWErTkVtck9UeXI4ZU5TZUF1QzFOOFNXQ3A1L1MyS1l5NW1KVGYr?=
 =?utf-8?B?MWNrU3p0cEhGeUJHRlR2aXZ2K2owdHdMNTBXTGRxU1RRUmdzYUdxOFF5TkM3?=
 =?utf-8?B?SWZEVUo3enl0aVlFd0hhaUN5ZzRNUno5WE1iNXhpNzdKaU9JZDAyVUpPQ1Iw?=
 =?utf-8?B?bVZSY0FCUjVNV3ZZSzI4RWVDWCt3a1NqdFB0Wm9yVWcwK0JERG55T2xaeEd5?=
 =?utf-8?B?R3NhczZLemFOQUljQkd6Z1dDdFBabDZIL0Y5SmdWc09aMHNUQ0FESFZRbC9X?=
 =?utf-8?B?M0czTjA0dFRZRFgvd2hHV1FrTjNNVkp5dW1yWVdNL2VCUnJhQ29RREY3Qzl5?=
 =?utf-8?B?OHFWcGFzRXZHTmlvT1ZUUzgycVpjVmd2bFNKT2ljTTdSaHYxTVBSQkxkQnlp?=
 =?utf-8?B?T21ENFR2NkVZTUZEUXBFYUl6Y3phQnlPZVNXcTJTK0VJOVAxWTZaS0o2akg5?=
 =?utf-8?B?UHo3TDB6Zno2OXpnNzd0Vkd4Z1dyRklzRDAyc0puUXliNVpmRFRwN1BqVk1O?=
 =?utf-8?B?RnRnaTU2SEdNcGgvOVlnTVIxKzVCR3hqMkxsOXU3djIzV1JPckJxOGdoVXdU?=
 =?utf-8?B?SFUwcUVoUGFOcmJHZm5DclFkaFBnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: selinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR2201MB1520.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b46be373-5b18-40ba-7760-08d9a934e53d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 19:11:29.7221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 12381f30-10fe-4e2c-aa3a-5e03ebeb59ec
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4XYm0hb5/awQMb6oEG97WjZcMwabaNmBG+DpFBd5w/CQvbxTSrG3wn1uVBhKR7KoMc9r4tiEveXuZhNQvFnJKOc36vATPOcJ0Jyls7lWhKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR22MB2156
X-Proofpoint-ORIG-GUID: WjuI2uUmKF7GrHY_gHFJf0oC-0h9WCVf
X-Proofpoint-GUID: WjuI2uUmKF7GrHY_gHFJf0oC-0h9WCVf
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 phishscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111160091
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "balbi@kernel.org" <balbi@kernel.org>,
 "leoyang.li@nxp.com" <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gMDIuMTEuMjEgMjI6MTUsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+IE9uIFNhdCwgMjAy
MS0xMC0zMCBhdCAxNDoyMCArMDAwMCwgSm9ha2ltIFRqZXJubHVuZCB3cm90ZToNCj4+IE9uIEZy
aSwgMjAyMS0xMC0yOSBhdCAxNzoxNCArMDAwMCwgRXVnZW5lIEJvcmRlbmtpcmNoZXIgd3JvdGU6
DQo+DQo+Pj4gV2UndmUgZGlzY292ZXJlZCBhIHNpdHVhdGlvbiB3aGVyZSB0aGUgRlNMIHVkYyBk
cml2ZXIgKGRyaXZlcnMvdXNiL2dhZGdldC91ZGMvZnNsX3VkY19jb3JlLmMpIHdpbGwgZW50ZXIg
YSBsb29wIGl0ZXJhdGluZyBvdmVyIHRoZSByZXF1ZXN0IHF1ZXVlLCBidXQgdGhlIHF1ZXVlIGhh
cyBiZWVuIGNvcnJ1cHRlZCBhdCBzb21lIHBvaW50IHNvIGl0IGxvb3BzIGluZmluaXRlbHkuICBJ
IGJlbGlldmUgd2UgaGF2ZSBuYXJyb3dlZCBpbnRvIHRoZSBvZmZlbmRpbmcgY29kZSwgYnV0IHdl
IGFyZSBpbiBuZWVkIG9mIGFzc2lzdGFuY2UgdHJ5aW5nIHRvIGZpbmQgYW4gYXBwcm9wcmlhdGUg
Zml4IGZvciB0aGUgcHJvYmxlbS4gIFRoZSBpZGVudGlmaWVkIGNvZGUgYXBwZWFycyB0byBiZSBp
biBhbGwgdmVyc2lvbnMgb2YgdGhlIExpbnV4IGtlcm5lbCB0aGUgZHJpdmVyIGV4aXN0cyBpbi4N
Cj4+Pg0KPj4+IFRoZSBwcm9ibGVtIGFwcGVhcnMgdG8gYmUgd2hlbiBoYW5kbGluZyBhIFVTQl9S
RVFfR0VUX1NUQVRVUyByZXF1ZXN0LiAgVGhlIGRyaXZlciBnZXRzIHRoaXMgcmVxdWVzdCBhbmQg
dGhlbiBjYWxscyB0aGUgY2g5Z2V0c3RhdHVzKCkgZnVuY3Rpb24uICBJbiB0aGlzIGZ1bmN0aW9u
LCBpdCBzdGFydHMgYSByZXF1ZXN0IGJ5ICJib3Jyb3dpbmciIHRoZSBwZXIgZGV2aWNlIHN0YXR1
c19yZXEsIGZpbGxpbmcgaXQgaW4sIGFuZCB0aGVuIHF1ZXVpbmcgaXQgd2l0aCBhIGNhbGwgdG8g
bGlzdF9hZGRfdGFpbCgpIHRvIGFkZCB0aGUgcmVxdWVzdCB0byB0aGUgZW5kcG9pbnQgcXVldWUu
ICBSaWdodCBiZWZvcmUgaXQgZXhpdHMgdGhlIGZ1bmN0aW9uIGhvd2V2ZXIsIGl0J3MgY2FsbGlu
ZyBlcDBfcHJpbWVfc3RhdHVzKCksIHdoaWNoIGlzIGZpbGxpbmcgb3V0IHRoYXQgc2FtZSBzdGF0
dXNfcmVxIHN0cnVjdHVyZSBhbmQgdGhlbiBxdWV1aW5nIGl0IHdpdGggYW5vdGhlciBjYWxsIHRv
IGxpc3RfYWRkX3RhaWwoKSB0byBhZGQgdGhlIHJlcXVlc3QgdG8gdGhlIGVuZHBvaW50IHF1ZXVl
LiAgVGhpcyBhZGRzIHR3byBpbnN0YW5jZXMgb2YgdGhlIGV4YWN0IHNhbWUgTElTVF9IRUFEIHRv
IHRoZSBlbmRwb2ludCBxdWV1ZSwgd2hpY2ggYnJlYWtzIHRoZSBsaXN0IHNpbmNlIHRoZSBwcmV2
IGFuZCBuZXh0IHBvaW50ZXJzIGVuZCB1cCBwb2ludGluZyB0byB0aGUgd3JvbmcgdGhpbmdzLiAg
VGhpcyBlbmRzIHVwIGNhdXNpbmcgYSBoYXJkIGxvb3AgdGhlIG5leHQgdGltZSBudWtlKCkgZ2V0
cyBjYWxsZWQsIHdoaWNoIGhhcHBlbnMgb24gdGhlIG5leHQgc2V0dXAgSVJRLg0KPj4+DQo+Pj4g
SSdtIG5vdCBzdXJlIHdoYXQgdGhlIGFwcHJvcHJpYXRlIGZpeCB0byB0aGlzIHByb2JsZW0gaXMs
IG1vc3RseSBkdWUgdG8gbXkgbGFjayBvZiBleHBlcnRpc2UgaW4gVVNCIGFuZCB0aGlzIGRyaXZl
ciBzdGFjay4gIFRoZSBjb2RlIGhhcyBiZWVuIHRoaXMgd2F5IGluIHRoZSBrZXJuZWwgZm9yIGEg
dmVyeSBsb25nIHRpbWUsIHdoaWNoIHN1Z2dlc3RzIHRoYXQgaXQgaGFzIGJlZW4gd29ya2luZywg
dW5sZXNzIFVTQl9SRVFfR0VUX1NUQVRVUyByZXF1ZXN0cyBhcmUgbmV2ZXIgbWFkZS4gIFRoaXMg
ZnVydGhlciBzdWdnZXN0cyB0aGF0IHRoZXJlIGlzIHNvbWV0aGluZyBlbHNlIGdvaW5nIG9uIHRo
YXQgSSBkb24ndCB1bmRlcnN0YW5kLiAgRGVsZXRpbmcgdGhlIGNhbGwgdG8gZXAwX3ByaW1lX3N0
YXR1cygpIGFuZCB0aGUgZm9sbG93aW5nIGVwMHN0YWxsKCkgY2FsbCBhcHBlYXJzLCBvbiB0aGUg
c3VyZmFjZSwgdG8gZ2V0IHRoZSBkZXZpY2Ugd29ya2luZyBhZ2FpbiwgYnV0IG1heSBoYXZlIHNp
ZGUgZWZmZWN0cyB0aGF0IEknbSBub3Qgc2VlaW5nLg0KPj4+DQo+Pj4gSSdtIGhvcGVmdWwgc29t
ZW9uZSBpbiB0aGUgY29tbXVuaXR5IGNhbiBoZWxwIHByb3ZpZGUgc29tZSBpbmZvcm1hdGlvbiBv
biB3aGF0IEkgbWF5IGJlIG1pc3Npbmcgb3IgaGVscCBjb21lIHVwIHdpdGggYSBzb2x1dGlvbiB0
byB0aGUgcHJvYmxlbS4gIEEgYmlnIHRoYW5rIHlvdSB0byBhbnlvbmUgd2hvIHdvdWxkIGxpa2Ug
dG8gaGVscCBvdXQuDQo+Pj4NCj4+PiBFdWdlbmUNCj4+DQo+PiBSdW4gaW50byB0aGlzIHRvIGEg
d2hpbGUgYWdvLiBGb3VuZCB0aGUgYnVnIGFuZCBhIGZldyBtb3JlIGZpeGVzLg0KPj4gVGhpcyBp
cyBhZ2FpbnN0IDQuMTkgc28geW91IG1heSBoYXZlIHRvIHR3ZWFrIHRoZW0gYSBiaXQuDQo+PiBG
ZWVsIGZyZWUgdG8gdXBzdHJlYW0gdGhlbS4NCj4+DQo+PiAgSm9ja2UNCj4NCj4gQ3VyaW91cywg
ZGlkIG15IHBhdGNoZXMgaGVscD8gR29vZCB0byBrbm93biBvbmNlIHdlIHVwZ3JhZGUgYXMgd2Vs
bC4NCj4NCj4gIEpvY2tlDQoNClRoZXJlJ3MgZ29vZCBuZXdzIGFuZCBiYWQgbmV3cy4NCg0KVGhl
IGdvb2QgbmV3cyBpcyB0aGF0IHRoaXMgYXBwZWFycyB0byBzdG9wIHRoZSBkcml2ZXIgZnJvbSBl
bnRlcmluZyBhbiBpbmZpbml0ZSBsb29wLCB3aGljaCBwcmV2ZW50cyB0aGUgTGludXggc3lzdGVt
IGZyb20gbG9ja2luZyB1cCBhbmQgbmV2ZXIgcmVjb3ZlcmluZy4gIFNvIEknbSB3aWxsaW5nIHRv
IHNheSB3ZSd2ZSBtYWRlIHRoZSBiZWhhdmlvciBiZXR0ZXIuDQoNClRoZSBiYWQgbmV3cyBpcyB0
aGF0IG9uY2Ugd2UgZ2V0IHBhc3QgdGhpcyBwb2ludCwgdGhlcmUgaXMgbmV3IGJhZCBiZWhhdmlv
ci4gIFdoYXQgaXMgb24gdG9wIG9mIHRoaXMgZHJpdmVyIGluIG91ciBzeXN0ZW0gaXMgdGhlIFJO
RElTIGdhZGdldCBkcml2ZXIgY29tbXVuaWNhdGluZyB0byBhIExhcHRvcCBydW5uaW5nIFdpbjEw
IC0xODA5LiAgRXZlcnl0aGluZyBhcHBlYXJzIHRvIHdvcmsgZmluZSB3aXRoIHRoZSBMaW51eCBz
eXN0ZW0gdW50aWwgdGhlcmUgaXMgYSBVU0IgZGlzY29ubmVjdC4gIEFmdGVyIHRoZSBkaXNjb25u
ZWN0LCB0aGUgTGludXggc2lkZSBhcHBlYXJzIHRvIGNvbnRpbnVlIG9uIGp1c3QgZmluZSwgYnV0
IHRoZSBXaW5kb3dzIHNpZGUgZG9lc24ndCBzZWVtIHRvIHJlY29nbml6ZSB0aGUgZGlzY29ubmVj
dCwgd2hpY2ggY2F1c2VzIHRoZSBVU0IgZHJpdmVyIG9uIHRoYXQgc2lkZSB0byBoYW5nIGZvcmV2
ZXIgYW5kIGV2ZW50dWFsbHkgYmx1ZSBzY3JlZW4gdGhlIGJveC4gIFRoaXMgZG9lc24ndCBoYXBw
ZW4gb24gYWxsIG1hY2hpbmVzLCBqdXN0IGEgc2VsZWN0IGZldy4gICBJIHRoaW5rIHdlIGNhbiBp
c29sYXRlIHRoZSBiZWhhdmlvciB0byBhIHNwZWNpZmljIGFudGl2aXJ1cy9zZWN1cml0eSBzb2Z0
d2FyZSBkcml2ZXIgdGhhdCBpcyBpbnNlcnRpbmcgaXRzZWxmIGludG8gdGhlIFVTQiBzdGFjayBh
bmQgZmlsdGVyaW5nIHRoZSBkaXNjb25uZWN0IG1lc3NhZ2UsIGJ1dCB3ZSdyZSBzdGlsbCBwcm92
aW5nIHRoYXQuDQoNCkknbSBhYm91dCA5MCUgY2VydGFpbiB0aGlzIGlzIGEgZGlmZmVyZW50IHBy
b2JsZW0gYW5kIHdlIGNhbiBjYWxsIHRoaXMgcGF0Y2hzZXQgZ29vZCwgYXQgbGVhc3QgZm9yIG91
ciB0ZXN0IHNldHVwLiAgTXkgb25seSBoZXNpdGF0aW9uIGlzIGlmIHRoZSBMaW51eCBzaWRlIGlz
IHNlbmRpbmcgYSBzZXQgb2YgcmVzcG9uc2VzIHRoYXQgYXJlIGNvbmZ1c2luZyB0aGUgV2luZG93
cyBzaWRlIChzcGVjaWZpY2FsbHkgdGhpcyBhbnRpdmlydXMpIG9yIG5vdC4gIEknZCBiZSBjb250
ZW50IGNhbGxpbmcgdGhhdCBhIHNlcGFyYXRlIGRlZmVjdCB0aG91Z2ggYW5kIGxldHRpbmcgdGhp
cyBvbmUgY2xvc2UgdXAgd2l0aCB0aGF0IHBhdGNoc2V0Lg0KDQpFdWdlbmUNCg==
