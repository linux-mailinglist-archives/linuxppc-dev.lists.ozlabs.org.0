Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 190785FAB76
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 05:55:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mmhld0C8fz3dx1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 14:55:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=X+Ikk5Yu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com; envelope-from=prvs=0283e28102=elliott@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=X+Ikk5Yu;
	dkim-atps=neutral
X-Greylist: delayed 6537 seconds by postgrey-1.36 at boromir; Tue, 11 Oct 2022 14:09:37 AEDT
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mmgk939pzz3bjp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 14:09:34 +1100 (AEDT)
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29AJwrwj014334;
	Tue, 11 Oct 2022 01:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=rNZ80xLHv3c97fUATiizr4WJ1qnu5Xm13xUgF7u8mqU=;
 b=X+Ikk5YuN73FQU5hFHWJ4TN0Jl0dMpBJv/tavxmbCHW/R6NQniP9tL/nvfs+h/YnVV9w
 RB3mv7GQHKBrIXvc0ultBRVqGXh/Uqr/ejdPg6GSbY4URtjR8udFKkxotg+N8ZWzti7m
 O4zlBZ+qPd6zgDw9FCRvE9/0nToxJh8oIkHDMVBHZILs9eQs5Gc2xkI+3gzSD8qB6ZLY
 jbFRdsncSoPhY4Kwjz7NtHduE/HsGRFW0Kt0l9di78tZ0erwFNjfrATR6JX87ROwiv+E
 NAUvp7n2HLHFWucf7ZCnotK4v06FqEtFhVLHjNlHO5p2iDjrPYrZErYir7ckTbmtCBeb Bw== 
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3k4sdxa4k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Oct 2022 01:18:51 +0000
Received: from p1wg14924.americas.hpqcorp.net (unknown [10.119.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 1E68D806B5A;
	Tue, 11 Oct 2022 01:18:42 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 10 Oct 2022 13:18:42 -1200
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 10 Oct 2022 13:18:42 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15
 via Frontend Transport; Mon, 10 Oct 2022 13:18:42 -1200
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 11 Oct 2022 01:18:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqAbY6o50Xx8PB9ek6em3oTT4fMjLL49YBcQvmZh6mWlZRDdjtp0RIAVsv1s4to9Fu0I3/d6GqCCTRDO3x5FFtTKHrWEW53lfXz1GfmWHBSQEQth+tUbR/hm6bLOhvsg3k6bNpqP4gcgTmM1ftl5LYhTlLRdnHv2ix/47A/ZIZlg+VGQ10ehSvL8fxYW5n6uaSH4/tqXlqLDB/LMgSaObWJZFM1l6vxzjWB1SCgWqV8L8FOIhtrE+5ZvCC6ToQwd14L3KIhgOqAhIGNO9aCRXrdnnO56PKxQuPjfFTHnGcE9i3XOC2lLfJlOGW+2nbNCkXBXL5T24XMbEzuVknR6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNZ80xLHv3c97fUATiizr4WJ1qnu5Xm13xUgF7u8mqU=;
 b=YAEbMiR0Wj85en4naS7r/WzeuXQ2a+V7KU5V/eFkaj73fqiINtKSFpQKAw8CYdHlMncYvrKF0bdE/wC74PaNlZXW7ovbvZlGGgce4+zvWb1jftM9+z/4d1ax/4l5UQYUTbHWNCTl9WWn08MeQWmHivU7lOwb+MTAFPTBONQPWjz4eXXdqbXlwUUFcKh+i0cCHp87UTZlGp0QkUZASLtxNCs0tTD3l2vl5jr4uUK/kO94qncAB3rcdRZYUv5gpc8cNvYN+5EFNGBOyavUyJk456W7Syw08poH2eKsC1u94N25G/J48Idk4i4D4vhEt9qRgcQiAJ99BgPCUrEFi14QbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c4::18)
 by PH7PR84MB1366.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:15f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Tue, 11 Oct
 2022 01:18:40 +0000
Received: from MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::c023:cb9a:111f:a1b2]) by MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::c023:cb9a:111f:a1b2%5]) with mapi id 15.20.5676.032; Tue, 11 Oct 2022
 01:18:40 +0000
From: "Elliott, Robert (Servers)" <elliott@hpe.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "patches@lists.linux.dev"
	<patches@lists.linux.dev>
Subject: RE: [PATCH v6 3/7] treewide: use get_random_{u8,u16}() when possible,
 part 1
Thread-Topic: [PATCH v6 3/7] treewide: use get_random_{u8,u16}() when
 possible, part 1
Thread-Index: AQHY3P1NjcMGwqqSWkuLJPkN/lqIja4IYEag
Date: Tue, 11 Oct 2022 01:18:40 +0000
Message-ID: <MW5PR84MB18421AC962BE140DDEB58A8BAB239@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
References: <20221010230613.1076905-1-Jason@zx2c4.com>
 <20221010230613.1076905-4-Jason@zx2c4.com>
In-Reply-To: <20221010230613.1076905-4-Jason@zx2c4.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR84MB1842:EE_|PH7PR84MB1366:EE_
x-ms-office365-filtering-correlation-id: bfaa07c7-2468-4b6d-c263-08daab2687f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M2O6foSQYmsgZteg3U0Bwbzc5ibiulIs7xr1UE+mluU+s+7GvTuJE1Vssm9fNAnEtXQVM0pGUEGupSSSGsELjw9jqrfIj3904SK+cwZpWfVLqeN+mPMaoyohhS4ZNsX3/iBXNFHNmk9HyQ++DAxa8PxEQyDikN/+eM6HXNOIPOc0z0hXgudSe5akaPXlKYdLOC0EbQvHYYuThLY/JueS/9SJkbqvN0wgQKatR8oXodovMOiKsucGk18mNpdKF1NP2jEiflLVUI4jkfYR4OQgU1MfqGgaNbRcBdjiXyL9IoQ5I5tqgMu8ey3b0kIz1HnCNyyYHotGgg7Du47dM441ay+M8oB7OQwKYdEibO/mOop6swOVNE9YuDql5VVuH/d6ZQQgupQFM53JY8dQYPEEeg9q0h9QY3K+ukBDEthFLf2im5hpIojF8/JW1qG0Q9sHqTwpdsYjxbJ8woE5cUE355eLKXxbk6HapuUktPOLKlHmAiI1WWUlb/6wxrRxyOqHGMF81ZwMJ0QxRct1WHmVnQuq40iOA9KcLzdIoUlVvXHiulU4m5KSVw9tZTH3R0DewOU4FS7ZkKIQv+91aT3cjMxLIVivVV6qMxruS4sJ2WhUKeziP250G0m0iFTwAnIASaKOXkTLIdr428ooPRjJdZeZtp9PypV5F7d0em48Z52zg5s0gJ/s5GYej9uLBk1RG91fxm5IQmxPk///KAPd4/pdKTPD7mVti84ggOELBSBNMNX3PPO85MJ/M+y2xuG8t7YmeJQQKKtEz5alzg8EHg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(39860400002)(396003)(376002)(366004)(451199015)(26005)(316002)(38100700002)(33656002)(122000001)(66476007)(4744005)(64756008)(7696005)(76116006)(66446008)(66556008)(66946007)(38070700005)(8676002)(4326008)(86362001)(6506007)(186003)(71200400001)(9686003)(54906003)(110136005)(82960400001)(478600001)(8936002)(52536014)(7416002)(7406005)(7336002)(7366002)(41300700001)(55016003)(2906002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlpvdzRSeVZMVFg5K0dKNVlrcWFNY3BCdktrZFM2QVExUlkvdERnQmNidGhh?=
 =?utf-8?B?c2tYRUJrRE9zT3hrZkRKQXNRMmdtbC9DNWRBajhVeTNRbHVCbFdxYmoveEdY?=
 =?utf-8?B?OExmVTlWR3RUclRWNmlVVTJSdmUwbTc5T21VUlNtTjhlY2ozU1EwbkpudW5T?=
 =?utf-8?B?aVRtSWJ2cHA1cC9GZld0S09GY3AvMXFEem1sRXJtVWd1M1dseE1Qa0l2dENZ?=
 =?utf-8?B?R1B0aVptRHRweklHUk52cW03MXQxYTBpK2VxbWh2b1BPbm5RY1BueVZRNjg2?=
 =?utf-8?B?YTlyUU5VWURucWZNVWdoNXFlQ0VrT3psMXJVN0Rra3BNa0hpME9oN1dZN3c1?=
 =?utf-8?B?Z05zY3BmT0dYNTMydXkzTENmMGlxWmNHbHJqbStsRldVSHVvbUU5OFBZejM5?=
 =?utf-8?B?VG12UTA3VEY0WHprR1V5ZEsxTVlmTXE5bHNuUElwcVlCVlM1cFRhV011b2Za?=
 =?utf-8?B?WFlYOXVocTZKSVRTVWZtM3o2aHdzWUt1YUJ6V1pVdEdCWFAxMHR5QkZZOHlI?=
 =?utf-8?B?N0plaFB1R000SEg1Y282bUVXSElhNmpVcmFTdFJpNjdscGwraVd1cmFiSWZT?=
 =?utf-8?B?clhFM3ZqWXhRS2lMaGc0ak5Vem5uQVRDb1Y3b3U2NkIyYnFwUmkveGZJbHV6?=
 =?utf-8?B?bEZURDJ0eXJ5NExuSWpvaTVyMG5tWjUwS0lTSWJIeDdyelJQR3ZYb21JSjVl?=
 =?utf-8?B?L1FaMHZsTUt4RFdENDhpSCtNZk1aekl5TG5QZ1o2Z28vYmlBdjFlRFpZb2VL?=
 =?utf-8?B?cThPZzI1NlhlS0Q3SysvT204TFFraERjekNnemhHbFBRd1FkTWFyZ3UyNVRM?=
 =?utf-8?B?dCtCVWN5REl6ZENWNkQyWHc2RzFQN2orY0xBRzBWWm1TUzJJdGFCZW44NHZF?=
 =?utf-8?B?ekV0aUZGT0p2SE9tTXdPWGFhOEV3SUpWVEg0WWxpMXMydHh6UDdQc0t6LzQy?=
 =?utf-8?B?aXZQdUt0NDMrbGpHZGQwdWxHTmpOQllYM25nK2gzdXMxRm9IQ1BpaHhJanZE?=
 =?utf-8?B?QUcyRm9uOFhmYitaSFdRMGJLcTAzU1pPOHhYWER5YzNCczBKdUdrTGFLK0c3?=
 =?utf-8?B?QmVVQVBhRlhxWnFUSW5uZE5yV045Y2hzbis0TERuV1ZCWFZZYmM3RUxldjU2?=
 =?utf-8?B?Q25CWjVaY01OOTlHVTF0cERiSzVIM1hGam8xVVRyZnk4d1FGcDVlbUJLSDJa?=
 =?utf-8?B?cDdRbC9waUtBRGdETTlSWUdBMXVvZ3pUaStuYnhwTUtsNzFYR2dlWE04MktP?=
 =?utf-8?B?ek0ycmROQ1BzQTc4SnBtVU5uZm1MZG5NMDVuV2s5akdhTkxOa0U5aHVJaWdL?=
 =?utf-8?B?RGlDcnFBSHdNd1VnOWduLyt0N09USEo2SlU4VHd6QUdoMkNtcy9tbXJtcEhY?=
 =?utf-8?B?ZUpscUFhalYwd3hZMGZaZldBVEJpcTN1dHRiS2NvdmZNOHBtZno1bUNqd2xT?=
 =?utf-8?B?YkJURHZ3UFZGMzgwMll6YXVCUHArdUY0T2V2cTZlcnE5eXIrMGF3M1hBS1Zs?=
 =?utf-8?B?Y1RlVFZWd1d1RGZMMk9zYUJuK3IrMnRVZWdtZXYrQ1BHTGxaSCsxbmNNYktV?=
 =?utf-8?B?Yit1OUJCdmtRUVk4dFpuQTNBUHlvZmRKRHFnR3hwSnpxYU40cnM2SFJITGk3?=
 =?utf-8?B?aUR6bXJtUkM5cE5SMnZBdUVmU0Rwb2tEN1R4OVB1RTk3Mkd3bURjTmY3RVU3?=
 =?utf-8?B?WDVwWG5kQVFGQ0RscTkra0ZCeWRBVCtrSGNqcVdkZFRmcFVXRzZveFkvT3pm?=
 =?utf-8?B?VDdhNXpVV3U0Zi9YVHpkVHFFd3RoVE5Tb1JOOTMvSlJMeWhGeWJwTGp1SHB0?=
 =?utf-8?B?QUxFQlNrak9OQ1hZQ3RhK2VaQWpJVHhtR3FnNEtDRTBWWGxlSkg4QlVSK3Rt?=
 =?utf-8?B?enFYWm9QSlErQ1p0a3lEV0FRVVQ5alZJZGdxc2hvalVpUWhaVzRkQmVyeXNt?=
 =?utf-8?B?Nkw3enlJVlJRRzJqRWluRnI5NTkvc3k0SVlwbndQMjA1bzdiY3NTZXhmZm83?=
 =?utf-8?B?NTJwM0dTWVRRRFVabUFoZlNWUkZRNEdGd1BFanFNT1hub005eXhnNjZ3UFY3?=
 =?utf-8?B?eGtxR2tFcDNJODY5MkFHT1pyOVh3RnRReE95dFhuelpkYXlNcno4NEtTbjh2?=
 =?utf-8?Q?S0YA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bfaa07c7-2468-4b6d-c263-08daab2687f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2022 01:18:40.4146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rJQbQ+h6dy7pzIAU/OPSuJHnLBtLQ/K7M4B/vP3aJNQZx5GDEfgMbuPot67UDylo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR84MB1366
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: qwxpC5pkiQSSTL8jNKSi61y1st3Y1_r0
X-Proofpoint-GUID: qwxpC5pkiQSSTL8jNKSi61y1st3Y1_r0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-11_01,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 mlxlogscore=839
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210110005
X-Mailman-Approved-At: Tue, 11 Oct 2022 14:54:15 +1100
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, "x86@kernel.org" <x86@kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, KP Singh <kpsingh@kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Eric Dumazet <edumazet@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, "linux-rdma@vger.kernel.org" <linux-rdma@vge
 r.kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>, Dave Airlie <airlied@redhat.com>, Paolo Abeni <pabeni@redhat.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Pablo Neira Ayuso <pablo@netfilter.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, =?utf-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>, "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Jakub Kicinski <kuba@kernel.org>, Thom
 as Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Johannes Berg <johannes@sipsolutions.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Florian Westphal <fw@strlen.de>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, =?utf-8?B?Q2hyaXN0b3BoIELDtmhtd2FsZGVy?= <christoph.boehmwalder@linbit.com>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Jan Kara <jack@suse.com>, Thomas
 Graf <tgraf@suug.ch>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQo+IGRpZmYgLS1naXQgYS9jcnlwdG8vdGVzdG1nci5jIGIvY3J5cHRvL3Rlc3RtZ3IuYw0KLi4u
DQo+IEBAIC05NDQsNyArOTQ0LDcgQEAgc3RhdGljIHZvaWQgZ2VuZXJhdGVfcmFuZG9tX2J5dGVz
KHU4ICpidWYsIHNpemVfdCBjb3VudCkNCj4gIAlkZWZhdWx0Og0KPiAgCQkvKiBGdWxseSByYW5k
b20gYnl0ZXMgKi8NCj4gIAkJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspDQo+IC0JCQlidWZb
aV0gPSAodTgpcHJhbmRvbV91MzIoKTsNCj4gKwkJCWJ1ZltpXSA9IGdldF9yYW5kb21fdTgoKTsN
Cg0KU2hvdWxkIHRoYXQgd2hvbGUgZm9yIGxvb3AgYmUgcmVwbGFjZWQgd2l0aCB0aGlzPw0KICAg
IGdldF9yYW5kb21fYnl0ZXMoYnVmLCBjb3VudCk7DQoNCg0K
