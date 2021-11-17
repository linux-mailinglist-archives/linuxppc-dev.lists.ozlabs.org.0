Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC99453E66
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 03:20:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv69G38Njz2yyf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 13:20:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=SlkrnHDL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=0955d447e6=terrelln@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=SlkrnHDL; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv68V45B0z2yHL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 13:20:08 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AH1pQV2003739; 
 Tue, 16 Nov 2021 18:19:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=CuKDlNRFpTJgzcdhj7Z2C+1OPckrt5vfaMJRaNCD2Lo=;
 b=SlkrnHDL/L6RXZwTu7DdxmwefLqMbXluEnwNTm8ikKK54shwx8iAi87gLSXq94bI4emv
 /hmIy3Nh0dxhskRyF9e1l8K1XhT9OBvR+iyjx4lDAQhQe061Ydh8xoIKyWxQt5uXaGsf
 fThzfP8AH/KS+IgaEy+4nLq/fu7Q8kHLgUo= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3cch9x3fte-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 16 Nov 2021 18:19:39 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 16 Nov 2021 18:19:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cu0X/VvKNm5J7BnHf6kT4jLNevtHTDd0HI5mPp0EnqtEu8ghTTuZSuEcfOjWJNvJKq+0uiPcSEW8koc4VqAWWzhbg/VgCH3S5QUOk74F54R7F80y9Y/SpH4oxAgQKm7XlBspA2DfNX/LkKDH6JrkqDF5tpyR7aDftz6SfQFVG1Hig9nL4mREDK0xxrAZJlXdrci7Xt/AfHPyd3biSxjvKisQZRFCZUQxekq4jdk32oteZQt9qfw8N/ObRXKul75GBuIUb3wFDi5OZ8qc2sQ95s94g9KdkQZ2MyIEck37AtlADgpQ2fWSxIp1OJVazWyEIMBiixgo1lMdJDA5rb9bYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0Za2ACT3ZaRoTY8XTFPQuCzyP9a87pJXo0dcwAl2ak=;
 b=WMLl92vSa0vCC0yB+fwoJzZmsa6dWSbXejlvnUs4OdNK7ne5+sq6lUkP3jkMzCrmnQxVDZEed51ZwqPUh94u52OoPKSP6ubDMwD2jIQVbgKXHQTnynd25+YMLk9rJt8kdPwMNL4WRryKFgoJghPf32XhalqbMgvmYXL/wpI8JOQhUB6ov2PfzRtXWs4MHEEuBzVW5/oQPnNOfglQy3ue3PPbwqrkmbf3cp6OJq9PLfMJiYtIukW+mgdIR2mcmtS9PL+PpNy2dluV0erSOxWPAigxMDexk7WOXRJB0HQp5jZzeMXTcceNX0WBIsIs/ii+VnmVWCAFALLM29vxhCkljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2456.namprd15.prod.outlook.com (2603:10b6:a02:82::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 02:19:32 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::8d7d:240:3369:11b4]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::8d7d:240:3369:11b4%6]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 02:19:32 +0000
From: Nick Terrell <terrelln@fb.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: Build regressions/improvements in v5.16-rc1
Thread-Topic: Build regressions/improvements in v5.16-rc1
Thread-Index: AQHX2jynD2CHATmgwEukyh+iAPvEB6wEy7gAgAItboCAAAGdAIAAA9+A
Date: Wed, 17 Nov 2021 02:19:32 +0000
Message-ID: <B57193D6-1FD4-45D3-8045-8D2DE691E24E@fb.com>
References: <20211115155105.3797527-1-geert@linux-m68k.org>
 <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
 <fcdead1c-2e26-b8ca-9914-4b3718d8f6d4@gmx.de>
 <480CE37B-FE60-44EE-B9D2-59A88FDFE809@fb.com>
 <78b2d093-e06c-ba04-9890-69f948bfb937@infradead.org>
In-Reply-To: <78b2d093-e06c-ba04-9890-69f948bfb937@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a2d3ab0-18e6-487c-08cc-08d9a970b13d
x-ms-traffictypediagnostic: BYAPR15MB2456:
x-microsoft-antispam-prvs: <BYAPR15MB24563099488E2EBD125C88E1AB9A9@BYAPR15MB2456.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8uBXr6FaQzF4nFe/MM+0Tzr+HhKUgN/Le0Crea7p8PZiUtyh2gsvKqVmdGhkCDz8UTh8F59PtQ9eP5oOGy+rd4v/Paxvv4kjNOt0QU41qAxjIAnnzomQUabeCpYg3lCWec8WGOY90clvOSX2AYWjIk0dbE4+mzvwwmvt2Q4p6sHpyIaqgTP1BBT/pX/xwOJjqlrqtDB8XaNL6KStVzeRvh/7NLsiOekDOo8TuRLSBmRH+vZ8n+i9UyKvTraGesjWh+9cmagCWplSzeAFpKItOXE59axgmo7qUmkB9LQ+fxd/2Yv7tMpBrYKfAyag+PuQxxmjJFEGP7H4poKi8z2Izke1wwrqGCAF/l0lXGbYOWScOv3KdX1bQqMooYRquIjU51Pfh32s4RoG4YjTP0w2PFIWURmZqeyRQGoLVAvahPecQrZVW46StZRHOjnsVyxZYD4ynG8A5/xWozn1UMeIFBSxPxg4eqIFF/WUJjQyxx6NjKAIPbgCMl9/zx/nEV9U9LHuyeHMbCK0Y6poQjNxSfJItZ9DdQKNLBt0HdQk0AohRf++7ksjxXi27qISOF+KQllCbgPXy26zdP1RMEWBV7FO0imv1ANPlQtFMBSFZNlnfqgg+q2RiQXwF8leMk1oF5NPc49AAyjGkTJEzQHW3WyTNEEszbbKQ3ZRaTmw3Z0S9plZMYQVmKqm+WXyL0faLr+3F9hlMpO3qmTusorUNxsV8D/hk4smh9yNs8dP9B7gKfm0qpKQMU4z9NDvgXls0O+2AVaTOUP2Q8x2XxPyskKD2KstAVXzP6UkvAuoCcupgAhPCN7pj8fYceErf58InV+JhPkVvIQt73i27tc7+A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3667.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(8936002)(6916009)(316002)(91956017)(54906003)(508600001)(8676002)(186003)(7416002)(5660300002)(966005)(2616005)(6506007)(71200400001)(86362001)(53546011)(33656002)(66946007)(66476007)(122000001)(36756003)(64756008)(66556008)(6512007)(76116006)(66446008)(38100700002)(4326008)(6486002)(83380400001)(2906002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEk4c1RSRnhPd1NndUZIb3RlOS90RFBjd1RRQ2ZMQ3ZOM0NVbWdSTDRBcVBM?=
 =?utf-8?B?NnJwOS9rOVUvSDM0MWtnV0RQaWcyTG5vQmF3TVJ1S01Gb2ZGaURKRXpqMlJN?=
 =?utf-8?B?bmxKS1RkanZkODF4cDRpZ2lwa0NxQnorc0R6eFkxTzRVQWoxemVzTWVvbUJw?=
 =?utf-8?B?eCtSRjVHQ1lzbG1wMnZncmxWZklzUitWR1NKUVdZdGNCTFpucmdyZXZ3VndN?=
 =?utf-8?B?TFVycHp4SHhHSUtLR2IyVGJhQS9DVWZQM3FPalplT255MnpsYStmTmwxODBN?=
 =?utf-8?B?T2E0SXBRN3ZFSEl5TlR4YlhDWnFLY3JCTmwzVUNiU1ZSYU9xZzVjVEhQTVI2?=
 =?utf-8?B?UnNOT0wvb2FFWENxOXBvczZiKzBtVUE1dWU3VW1OTTBUeXJrNkt3WjNqei9W?=
 =?utf-8?B?alJDTVg4U2padlFSUlA4M1lIdnlDSUZzMlFSZlMzbDhHN1M0KzNHMitHUmpZ?=
 =?utf-8?B?R0JaMUhWTEEzZnhDaG5vVVVMVEtYaW5qQStRYmdWM1ZHY0pQZ0Irc0NlbTRs?=
 =?utf-8?B?UWVYdCtrcUtDVERQUUNZY0pJN09JQUJwNnRuZDF3eFliYURlRk1nZkZadytt?=
 =?utf-8?B?Wk5wZW1DLy92czVZM2REN3NwQjJuelNBREphanpkZW00eDdUbFU0L3ZXV1R5?=
 =?utf-8?B?TG9sUTRqNmN3Y1AvcFVLcDVyekt3dmJmTTFkSnpIeXlndE5MRjdtNmZMdENC?=
 =?utf-8?B?MThBUnA1dTc0TERkMkV3ZUNiQUtWa2VBYzVhR21HNmQvTDlYNU9tZ0g4SUJy?=
 =?utf-8?B?RHU0U1JVSzF1b2ZKWE8vOU03YmZXbmlGN21JWi9vVDJyNHZMVFd2Q2V6U3g3?=
 =?utf-8?B?dGtrT3pFT2htTjZxa0lXUW5GTURRUkhqWmorTjd0alpuRWk2WW9UeGZnOVJ5?=
 =?utf-8?B?dk8vMUhaMFNtamJHS2gyR25xNURscUpmTE1ROUJSaG5BN29kNnVCbk1HL2Zw?=
 =?utf-8?B?REJ0NzRWS0d2UDMySzJnU1J4U0xCWXhjaWR4c3ZweGlZcE5aYXV6UzhxZHFp?=
 =?utf-8?B?S1A5dG9YVytLcEYvSGdkWTRsNit3azlJeWVLSStzdnRKV1M3OExsNEJiZWt1?=
 =?utf-8?B?SFRpcGVmK0Fiek1uS2pGaGNtdjdyZFc4cFA2RHBIbmRtN0ZlUlFOMVM5SU15?=
 =?utf-8?B?WHhJdmdLRjhrdkhWaG9KbDE1SGlsajE5TTZDdkcrWnhSL1JQVVlkcnc1aHl0?=
 =?utf-8?B?eHhPdHJFckJQOGM3WXMybGZUYlR3WDd2RnRuUmx3YmNoOGp0YVRMQmZWSkZS?=
 =?utf-8?B?RzN5K29jNzVlTGUyR0NSbzF6OXZySU1DR0hBNnhsVXh2Q2N5ZDZlZGNBMDJG?=
 =?utf-8?B?cjJvNmxoemFRTFYwWmpIcGFvUWdjc2t1T1R3b1N1dnoxN1Z5SlRvUS9HSjNs?=
 =?utf-8?B?N0xNSkVOQ2dqSi9rdXUxQ0p0RjNheE9QcThWV1I0MGFVMHN1WnJSWEpBUlpv?=
 =?utf-8?B?TnFhMDRwK0lQUlZSZVVKUnZYamltclQ1K2l3Q0hScDBTQTh2SnJjOHFERXc1?=
 =?utf-8?B?QzJ2a3lFUTJjcUdvZERtVlVodEdMVTIrcngxNG5BdFJyOGNBSXdoUncvM1Ex?=
 =?utf-8?B?QzNIS1VFNGNrS1ppWlhDckwydnYzV0Q3eDB5WEdLZFlldndRNm5zbW42Y2VY?=
 =?utf-8?B?c21hTUFLZjJBZG15VUF2c01DYk1LM0lWS0JBZjZVSFRiMnU0V3d6NTczQUxo?=
 =?utf-8?B?RHRjOWwyUm5SRlZ5YmwrL3o4T0ZzdjUzbTB1ckZEK2JOeXlQRTBYYkM0SjB5?=
 =?utf-8?B?ZDhBL1BUODBWZFdNUU5uR2JtRHMyT1FPUDJxSDB6Vzh4aDlOenhaY2taL0xk?=
 =?utf-8?B?ZDhMN1llWFdaT28xZDhnTlBLbmkwZ2ZsQUFINzR6cHp4OFhpb24xbGJxNVgr?=
 =?utf-8?B?c2h4ZjFZdEtjN0pZblRDVHVtNWkyaHJtTUt0ZzNZN25LMzBUQWdzcWdiamxS?=
 =?utf-8?B?WWF6NWsyRnhxWWQwUFFGSGtETHVJSkZWREorVytmdUZWYy81MzVoaHlxeWV1?=
 =?utf-8?B?RjBKUHBIdHkzNWVsanF2QUJLcWk0S0N0SWtTZ1ZvaUpZRTV0RDhUNnZZQVlu?=
 =?utf-8?B?TkU5NDVCV2Q2NWU5T0FUSFJmbFBzblh1ai95OGdSMlE0WWpvcEpHcDQxVnFI?=
 =?utf-8?B?QlAxZEN2a21CQmlYdWxTWkhaWnBRRlR4MGwrbDM0eC9VM3Uva01PY0x2Tmt6?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DE18F7773349D4497C4E2636E96C550@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2d3ab0-18e6-487c-08cc-08d9a970b13d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 02:19:32.2285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Z4KzT+7g04BlBqEn7A9dAvPkSDqWfCvR7Tc3XOl08TB29zgDxDwcd4ZF13jklqe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2456
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: eEaB03tzDHzivai07-_NT1UhvUKsSgdP
X-Proofpoint-GUID: eEaB03tzDHzivai07-_NT1UhvUKsSgdP
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 2 URL's were un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-16_07,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 mlxscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170008
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
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Andrey
 Ryabinin <ryabinin.a.a@gmail.com>, Stan
 Skowronek <stan@corellium.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Helge Deller <deller@gmx.de>, kasan-dev <kasan-dev@googlegroups.com>, Sergio
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

DQoNCj4gT24gTm92IDE2LCAyMDIxLCBhdCA2OjA1IFBNLCBSYW5keSBEdW5sYXAgPHJkdW5sYXBA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiAxMS8xNi8yMSA1OjU5IFBNLCBOaWNrIFRl
cnJlbGwgd3JvdGU6DQo+Pj4gT24gTm92IDE1LCAyMDIxLCBhdCA4OjQ0IEFNLCBIZWxnZSBEZWxs
ZXIgPGRlbGxlckBnbXguZGU+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDExLzE1LzIxIDE3OjEyLCBH
ZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+Pj4+IE9uIE1vbiwgTm92IDE1LCAyMDIxIGF0IDQ6
NTQgUE0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6DQo+
Pj4+PiBCZWxvdyBpcyB0aGUgbGlzdCBvZiBidWlsZCBlcnJvci93YXJuaW5nIHJlZ3Jlc3Npb25z
L2ltcHJvdmVtZW50cyBpbg0KPj4+Pj4gdjUuMTYtcmMxWzFdIGNvbXBhcmVkIHRvIHY1LjE1WzJd
Lg0KPj4+Pj4gDQo+Pj4+PiBTdW1tYXJpemVkOg0KPj4+Pj4gIC0gYnVpbGQgZXJyb3JzOiArMjAv
LTEzDQo+Pj4+PiAgLSBidWlsZCB3YXJuaW5nczogKzMvLTI4DQo+Pj4+PiANCj4+Pj4+IEhhcHB5
IGZpeGluZyEgOy0pDQo+Pj4+PiANCj4+Pj4+IFRoYW5rcyB0byB0aGUgbGludXgtbmV4dCB0ZWFt
IGZvciBwcm92aWRpbmcgdGhlIGJ1aWxkIHNlcnZpY2UuDQo+Pj4+PiANCj4+Pj4+IFsxXSBodHRw
Oi8va2lzc2tiLmVsbGVybWFuLmlkLmF1L2tpc3NrYi9icmFuY2gvbGludXMvaGVhZC9mYTU1Yjdk
Y2RjNDNjMWFhMWJhMTJiY2E5ZDJkZDQzMThjMmEwZGJmLyAgIChhbGwgOTAgY29uZmlncykNCj4+
Pj4+IFsyXSBodHRwOi8va2lzc2tiLmVsbGVybWFuLmlkLmF1L2tpc3NrYi9icmFuY2gvbGludXMv
aGVhZC84YmI3ZWNhOTcyYWQ1MzFjOWIxNDljMGE1MWFiNDNhNDE3Mzg1ODEzLyAgIChhbGwgOTAg
Y29uZmlncykNCj4+Pj4+IA0KPj4+Pj4gDQo+Pj4+PiAqKiogRVJST1JTICoqKg0KPj4+Pj4gDQo+
Pj4+PiAyMCBlcnJvciByZWdyZXNzaW9uczoNCj4+Pj4+ICArIC9raXNza2Ivc3JjL2FyY2gvcGFy
aXNjL2luY2x1ZGUvYXNtL2p1bXBfbGFiZWwuaDogZXJyb3I6IGV4cGVjdGVkICc6JyBiZWZvcmUg
J19fc3RyaW5naWZ5JzogID0+IDMzOjQsIDE4OjQNCj4+Pj4+ICArIC9raXNza2Ivc3JjL2FyY2gv
cGFyaXNjL2luY2x1ZGUvYXNtL2p1bXBfbGFiZWwuaDogZXJyb3I6IGxhYmVsICdsX3llcycgZGVm
aW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWxhYmVsXTogID0+IDM4OjEsIDIzOjEN
Cj4+Pj4gDQo+Pj4+ICAgIGR1ZSB0byBzdGF0aWNfYnJhbmNoX2xpa2VseSgpIGluIGNyeXB0by9h
cGkuYw0KPj4+PiANCj4+Pj4gcGFyaXNjLWFsbG1vZGNvbmZpZw0KPj4+IA0KPj4+IGZpeGVkIG5v
dyBpbiB0aGUgcGFyaXNjIGZvci1uZXh0IGdpdCB0cmVlLg0KPj4+IA0KPj4+IA0KPj4+Pj4gICsg
L2tpc3NrYi9zcmMvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2Lmg6IGVycm9yOiAiQ09ORCIg
cmVkZWZpbmVkIFstV2Vycm9yXTogID0+IDUzMQ0KPj4+Pj4gICsgL2tpc3NrYi9zcmMvbGliL3pz
dGQvY29tcHJlc3MvenN0ZF9kb3VibGVfZmFzdC5jOiBlcnJvcjogdGhlIGZyYW1lIHNpemUgb2Yg
MzI1MiBieXRlcyBpcyBsYXJnZXIgdGhhbiAxNTM2IGJ5dGVzIFstV2Vycm9yPWZyYW1lLWxhcmdl
ci10aGFuPV06ICA9PiA0NzoxDQo+Pj4+PiAgKyAva2lzc2tiL3NyYy9saWIvenN0ZC9jb21wcmVz
cy96c3RkX2RvdWJsZV9mYXN0LmM6IGVycm9yOiB0aGUgZnJhbWUgc2l6ZSBvZiAzMzYwIGJ5dGVz
IGlzIGxhcmdlciB0aGFuIDE1MzYgYnl0ZXMgWy1XZXJyb3I9ZnJhbWUtbGFyZ2VyLXRoYW49XTog
ID0+IDQ5OToxDQo+Pj4+PiAgKyAva2lzc2tiL3NyYy9saWIvenN0ZC9jb21wcmVzcy96c3RkX2Rv
dWJsZV9mYXN0LmM6IGVycm9yOiB0aGUgZnJhbWUgc2l6ZSBvZiA1MzQ0IGJ5dGVzIGlzIGxhcmdl
ciB0aGFuIDE1MzYgYnl0ZXMgWy1XZXJyb3I9ZnJhbWUtbGFyZ2VyLXRoYW49XTogID0+IDMzNDox
DQo+Pj4+PiAgKyAva2lzc2tiL3NyYy9saWIvenN0ZC9jb21wcmVzcy96c3RkX2RvdWJsZV9mYXN0
LmM6IGVycm9yOiB0aGUgZnJhbWUgc2l6ZSBvZiA1MzgwIGJ5dGVzIGlzIGxhcmdlciB0aGFuIDE1
MzYgYnl0ZXMgWy1XZXJyb3I9ZnJhbWUtbGFyZ2VyLXRoYW49XTogID0+IDM1NDoxDQo+Pj4+PiAg
KyAva2lzc2tiL3NyYy9saWIvenN0ZC9jb21wcmVzcy96c3RkX2Zhc3QuYzogZXJyb3I6IHRoZSBm
cmFtZSBzaXplIG9mIDE4MjQgYnl0ZXMgaXMgbGFyZ2VyIHRoYW4gMTUzNiBieXRlcyBbLVdlcnJv
cj1mcmFtZS1sYXJnZXItdGhhbj1dOiAgPT4gMzcyOjENCj4+Pj4+ICArIC9raXNza2Ivc3JjL2xp
Yi96c3RkL2NvbXByZXNzL3pzdGRfZmFzdC5jOiBlcnJvcjogdGhlIGZyYW1lIHNpemUgb2YgMjIy
NCBieXRlcyBpcyBsYXJnZXIgdGhhbiAxNTM2IGJ5dGVzIFstV2Vycm9yPWZyYW1lLWxhcmdlci10
aGFuPV06ICA9PiAyMDQ6MQ0KPj4+Pj4gICsgL2tpc3NrYi9zcmMvbGliL3pzdGQvY29tcHJlc3Mv
enN0ZF9mYXN0LmM6IGVycm9yOiB0aGUgZnJhbWUgc2l6ZSBvZiAzODAwIGJ5dGVzIGlzIGxhcmdl
ciB0aGFuIDE1MzYgYnl0ZXMgWy1XZXJyb3I9ZnJhbWUtbGFyZ2VyLXRoYW49XTogID0+IDQ3Njox
DQo+Pj4+IA0KPj4+PiBwYXJpc2MtYWxsbW9kY29uZmlnDQo+Pj4gDQo+Pj4gcGFyaXNjIG5lZWRz
IG11Y2ggYmlnZ2VyIGZyYW1lIHNpemVzLCBzbyBJJ20gbm90IGFzdG9uaXNoZWQgaGVyZS4NCj4+
PiBEdXJpbmcgdGhlIHY1LjE1IGN5Y2wgSSBpbmNyZWFzZWQgaXQgdG8gMTUzNiAoZnJvbSAxMjgw
KSwgc28gSSdtIHNpbXBseSB0ZW1wdGVkIHRvDQo+Pj4gaW5jcmVhc2UgaXQgdGhpcyB0aW1lIHRv
IDQwOTYsIHVubGVzcyBzb21lb25lIGhhcyBhIGJldHRlciBpZGVhLi4uLg0KPj4gVGhpcyBwYXRj
aCBzZXQgc2hvdWxkIGZpeCB0aGUgenN0ZCBzdGFjayBzaXplIHdhcm5pbmdzIFswXS4gSeKAmXZl
DQo+PiB2ZXJpZmllZCB0aGUgZml4IHVzaW5nIHRoZSBzYW1lIHRvb2xpbmc6IGdjYy04LWhwcGEt
bGludXgtZ251Lg0KPj4gSeKAmWxsIHNlbmQgdGhlIFBSIHRvIExpbnVzIHRvbW9ycm93LiBJ4oCZ
dmUgYmVlbiBpbmZvcm1lZCB0aGF0IGl0DQo+PiBpc24ndCBzdHJpY3RseSBuZWNlc3NhcnkgdG8g
c2VuZCB0aGUgcGF0Y2hlcyB0byB0aGUgbWFpbGluZyBsaXN0DQo+PiBmb3IgYnVnIGZpeGVzLCBi
dXQgaXRzIGFscmVhZHkgZG9uZSwgc28gSeKAmWxsIHdhaXQgYW5kIHNlZSBpZiB0aGVyZQ0KPj4g
aXMgYW55IGZlZWRiYWNrLg0KPiANCj4gSU1PIHNldmVyYWwgKG9yIG1hbnkgbW9yZSkgcGVvcGxl
IHdvdWxkIGRpc2FncmVlIHdpdGggdGhhdC4NCj4gDQo+ICJzdHJpY3RseT8iICBPSywgaXQncyBw
cm9iYWJseSBwb3NzaWJsZSB0aGF0IGFsbW9zdCBhbnkgcGF0Y2gNCj4gY291bGQgYmUgbWVyZ2Vk
IHdpdGhvdXQgYmVpbmcgb24gYSBtYWlsaW5nIGxpc3QsIGJ1dCBpdCdzIG5vdA0KPiBkZXNpcmFi
bGUgKGV4Y2VwdCBpbiB0aGUgY2FzZSBvZiAic2VjdXJpdHkiIHBhdGNoZXMpLg0KDQpHb29kIHRv
IGtub3chIFRoYW5rcyBmb3IgdGhlIGFkdmljZSwgSSB3YXNu4oCZdCByZWFsbHkgc3VyZSB3aGF0
DQp0aGUgYmVzdCBwcmFjdGljZSBpcyBmb3Igc2VuZGluZyBwYXRjaGVzIHRvIHlvdXIgb3duIHRy
ZWUsIGFzIEkNCmRpZG4ndCBzZWUgYW55dGhpbmcgYWJvdXQgaXQgaW4gdGhlIG1haW50YWluZXIg
Z3VpZGUuDQoNClRoYW5rcywNCk5pY2sgVGVycmVsbA0KDQo+IC0tIA0KPiB+UmFuZHkNCg0K
