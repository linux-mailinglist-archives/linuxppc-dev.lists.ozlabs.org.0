Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 025875AF538
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 22:02:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMbrV6Zhhz3bpr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 06:02:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=uOJbZRmD;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=dPWuqL8f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=uOJbZRmD;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=dPWuqL8f;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMbqg3Wgzz2yxQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 06:01:12 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 286Icrdk007592;
	Tue, 6 Sep 2022 20:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=07mhXwhF+kAKQ0F1Tj3OkTQDrBodMvdNzaaETp9Cg+8=;
 b=uOJbZRmD8Yu5f9GYCZghy6+Bca8S6ufY70WR+nTCz4SoiRy2kEWCni6nCoFbz0opFCnI
 8OoVWPc69tZCHKWYTW4mEX9B7q77NOq5kGBJEGp9Sltl2+wM1OPp1ZXuFwdJaqBwvjYb
 OycgRdJXkRgIrdwbG8GKa+1plTHUQQLeuUSI+w5DMuBszCeJl22/yRuH7cJqkI60qP6I
 mF8XfTowi4UZtUBGVCWbYF7P6/chOz/m2pxRoSBlXlr+CU2y1Nx/EVpoxd+DCBpdgsc0
 pSFE9WWt640R6Fz6fCITkka+NzdjcBfAGaU5AKkHa0G9WBVXbLZqSWBSh0wh9HnG2P3u aw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jbwbc6vh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Sep 2022 20:00:08 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 286JPqwi030700;
	Tue, 6 Sep 2022 20:00:07 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3jbwc3bvs5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Sep 2022 20:00:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzpoAUcSgzob4Eglb4rSkJ7MAJoVR7zRVjnhf2g0FLDrk9st2W5F28hTRfGRIO/KxpS7K/215gocUNZbLR7tok5HXl5VswuT5ZwIZFqIWHIfzFHerl6GYs73dsziFc/9PWH/6mo9+7nq+e60p8gzgoiPZPRPpzu2mdjh3JrR18Zy3RBI9DyHavWBBob015yYU3nWS3p+PZdIoZ6zHvwsfhsejc4QrSGjc4UTHJmkQmT1gUcaevVQyHbEosKDbwqKfwE/NKHIvW1F+AHvUe/dfqI6czgoy+GQJn/lIADXthh69bLVRDZHAuC/6KLCZEgOcrDvwmx+/4lzvQh391iTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07mhXwhF+kAKQ0F1Tj3OkTQDrBodMvdNzaaETp9Cg+8=;
 b=hDANXCLNGqzSu3az+8m0Pyb0GI625N/HTCyUu6L2JSq4impz1+AmsC7ltUX8nTJAKU/uvyLSNw+ZHLAGaiTnYpq5wY2tpHxLVppdo0TdHhmha6+cAjM04MW1GSI1FoJfY5ydm2mpy8KDikAl/QvOOENzhlMQx8mK0XAGSePajYcpA45i4uUG8NxhLLh6MMHGbUlQBgSbGD4arXOFzTAi1iegIF8UKxlH4YhiKxTnsONg7xx2JCZqOJO4nEFFYFhLjh1t2fcgBQFbw8gmNQOx7Snosg8fSxJF1B+VxSWLv0pORLyztrmB3bEzwTmtHfy0DwBybOK87cU5B5+Cvp+6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07mhXwhF+kAKQ0F1Tj3OkTQDrBodMvdNzaaETp9Cg+8=;
 b=dPWuqL8fWImfN2VelM8Ptq+15cT4xOsnluFNY2/8qMhPqzlWwUil4eGid0dGUi2i1KUD9yiyb73Z7jr9E3huN0xWKv3Yoyh38ZpSvQ5qWxAMlYbORXiNDNfwqw3CMdHS9+0tcfRskN/CsKuGgqE7FiK74MFFCvYsasDtgelRkBY=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by IA1PR10MB6123.namprd10.prod.outlook.com (2603:10b6:208:3a9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Tue, 6 Sep
 2022 20:00:03 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::a420:3107:436d:d223]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::a420:3107:436d:d223%5]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 20:00:03 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [RFC PATCH RESEND 06/28] mm: mark VMA as locked whenever
 vma->vm_flags are modified
Thread-Topic: [RFC PATCH RESEND 06/28] mm: mark VMA as locked whenever
 vma->vm_flags are modified
Thread-Index: AQHYvilBcBP6fhJ2l0iUYDGGGwAzOq3SfRkAgABMhoCAABB+gA==
Date: Tue, 6 Sep 2022 20:00:03 +0000
Message-ID: <20220906195949.7nln7y6urs6rfyyd@revolver>
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-7-surenb@google.com>
 <1624be86-4c17-46e5-fafc-eb8afb7b9b4a@linux.ibm.com>
 <CAJuCfpFi07ZpAuSLwADGO0mfu2Hon9jWb0hsCytorchQ=cgK3Q@mail.gmail.com>
In-Reply-To:  <CAJuCfpFi07ZpAuSLwADGO0mfu2Hon9jWb0hsCytorchQ=cgK3Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85bb7ba0-0448-4d6c-9b97-08da90426373
x-ms-traffictypediagnostic: IA1PR10MB6123:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  sgbdDbjCmkCFqQu7I3XF627mprtwSqjwd3fMp7fGW9HDLGFGE3oVSdXMJxPo9KkG+WorctlBibCroUJHKQUQImRClkLIBovfn0/tNnftWLRD1MqL+1COFYLwSV20nik9CxxdPcWGzajN81oN5oj2LWaAKNaSA+BweEHnljB+C4vhWG3Ai4FhadjT7KUGvLwfwlpTpzlFxtoK9h0uA+JWS9PgnlNcpNZB2scIAv0KqyK39A1rOn8HIi3SDCiUWHu4B2pfcSZaJ4Ozu+M51yt8MkLNhKIIESG8NWC81OxDqe8Ho0069MwXWLE5fBa8wNseLjDZ3KKwcjFyhgr4aeGTPyP8k00ot4c4KeLklPvWIyEo+MTqZLThTcQUzDWjhaI+B580FgNWCbcuAlMXT2d0J/yLmr2jBidwe8ZXcnsWrFOmw6U8SpHPBNaB2ipL7tNJ7BCKk1aC5L8durH3O5CebAUMR3nL7fClLfbNe3+Yfk/oz02XaEk6tK3MoL526LO14XXuqpQvisytj3NiYS9KYr0UxlT8hfifMCl8z77xjuERM+JXZsmcE/T1oC79UcSGuqvh8CvLen4lLIVAHyc4Ks0X9/ASHDjdZ2/Sw7B+LZz+QOlYZ0QW3ViKwQx1Bo+x95E2dwVTs98IuRltq4VV0ah65qw/4KDV4jSv9QDz+MEHDd9RbMuGrkmvZqEggitf1WjrDZXDQ/xSXdJ++or4btEv6xvW2wB1A3VuyZGg4U9DH1t4qPe4V8GexbGuIE5babeOdpmnnEhQTAHYtfgkAA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(39860400002)(346002)(396003)(376002)(366004)(136003)(64756008)(7416002)(41300700001)(8936002)(53546011)(6486002)(66946007)(7406005)(8676002)(6506007)(4326008)(76116006)(66476007)(5660300002)(66556008)(86362001)(66574015)(33716001)(83380400001)(44832011)(2906002)(478600001)(91956017)(6512007)(26005)(122000001)(316002)(66446008)(186003)(38070700005)(1076003)(71200400001)(6916009)(54906003)(38100700002)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?nJTmrcfqYUpw4gB9HtIUBTzF7Bc6dLWyTpbLbkD5VjcJ1kujDgyHQdLvuv?=
 =?iso-8859-1?Q?CQ6KP0sBBooHR6Z6wOU2fe5oX5p3hmKiqy3AbpO0EFTB2rinjZhaziu6tu?=
 =?iso-8859-1?Q?NZkY3hZ9Q6iY6kYiRET9oF45ArnS5S8dHRjRWWeTSMnxlokZVhSVsCFxdP?=
 =?iso-8859-1?Q?9zJn+0E2gR1Jrt9W7otpXWMminPPlSrJOKNjklXu/J24h2ui+s/Z0xSMij?=
 =?iso-8859-1?Q?s3cORGy0E5ICDx2Eb0lcvRl1Tm/18/iqtcpYX3VCV1iHKl5tj0IEjfCL6U?=
 =?iso-8859-1?Q?+XAf05Z6X9QruG06+Zs8yG2hdTt0edHe7yqWPegdfJ5qp4HPFjVmGgjqGd?=
 =?iso-8859-1?Q?edlj0mwDd1E/WaTmpukRL2E9EjrOhGU5vueuZb7Vrb1ZiyM9yAcRa+r8bQ?=
 =?iso-8859-1?Q?K7qIEEbo7XJv9ukW9uLddBasCRggHIR8JBJKMsl2YkY6ChCH00JhHq4Jj+?=
 =?iso-8859-1?Q?KRvT+WkEVGmw3kly2slAGRIgkv1nx4sA5wFh/LtxrRRsCeldSCKL2FhgJa?=
 =?iso-8859-1?Q?ULMGW28UYQbgnbA6UEPDeLJ0ngEHeDeQl+zhx6dbosGN8r8A3Q+Q94nNls?=
 =?iso-8859-1?Q?QQdi1NFrghKlPAynzKhfy2j4QokaXjiO7VY9xQhVh0N5tFe/5+DQt4K6z2?=
 =?iso-8859-1?Q?FHmvoG1UIxDicvyuiX81XWPV+IHNzk4xRvmMA7f3hMt8yRE4PdIEOOUuba?=
 =?iso-8859-1?Q?u4jVLAST9XDzyWsK7s8onLMAbYzLVzqSKL/0wvSGRxVqWihVDCqZlAhbdF?=
 =?iso-8859-1?Q?Hq0IUPviHddXpbpC0hUStK53D5B76SBEeyB8ai9QtV3Gr/YRpqiSLywNPZ?=
 =?iso-8859-1?Q?WGPRD0QMgke5kMkzK0xv4dTxKcpkeAB0o8Qe4yDx6AgKA6v8y5vqc6dz/K?=
 =?iso-8859-1?Q?tDtFV4XNISAAtLCi6EkkuOR9fLqts6c8g868vKhmor8VqqJkHrNrg4P1RD?=
 =?iso-8859-1?Q?Q7JFzBbyxtaBl0SNNBbh2Mvvcd0Znbladzegeb9pXiSmUoXulI4OpYcIYG?=
 =?iso-8859-1?Q?/GO0fCf6U8YqanEmlOU199cK3xfT4t/vyKOsICPq2JP2UxJqiWRTK1WTLK?=
 =?iso-8859-1?Q?UvXAwKjWz/ayFRQFKkSnlNqX880+qD316Po+nsyb0r81Iwx9ecjUqPw/d8?=
 =?iso-8859-1?Q?yyuHlcsghb5FswvuxGFfwQnCn9pAX/+3lpb9x+p0r9GS78UdkaEYmqIMxl?=
 =?iso-8859-1?Q?+ttxWBcmCZ7HJ/sqYhwT/z1b92ieRc2P/GmBJ/HAed1kBdsdxZ9Niyu7oL?=
 =?iso-8859-1?Q?NZi8l5j5vR+7hX/zqH7nIdwRVoLuOVVsr9TCfcpey+tJgoeoaE1oBM8Kpw?=
 =?iso-8859-1?Q?C7l90EIYYgprHNENu004LMoN+Zyn7C0AINJ7U6BEDc70nLE4GWj61QNFzb?=
 =?iso-8859-1?Q?D/zPLlupMjzYVUU93LihgQNYiLageO/tLobFhhO/PP0Y94tz6u+2w0OIUR?=
 =?iso-8859-1?Q?BH473fOOKVEqtxWPaS63pIpMD997FRlQdm3EtkQGzjC9CRMKnTS4aLzg4Z?=
 =?iso-8859-1?Q?c66FvbuLLQpReZhOlkTizn+XBbOFyy4z8kYkaqMNYM0Mk18ID7hHhCCLgW?=
 =?iso-8859-1?Q?Th+NFPVVdbW4MshkdQsZFrTTciRyre6AfefWZ+DHJxmzjEsrR3boMbdGTK?=
 =?iso-8859-1?Q?jhozJ/Q9N577SpA09JDtdk4ULkZu5x/Ms/splRfX60AysgTMfuoe6LDg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <FA7ADC7FE2CF034BAC3C15CF7F3DE293@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85bb7ba0-0448-4d6c-9b97-08da90426373
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 20:00:03.6483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8klWLz1fOdDrjd0R+GkRPBSLGL2oAvH02Ljxrenu9sEHtJ6iDegFscRdr3NhSoyuTlKyx0LIAHADu2RSabaPEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6123
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_09,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 mlxscore=0 phishscore=0 mlxlogscore=886 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209060092
X-Proofpoint-ORIG-GUID: VOHEd7YZaZdxkRxtiOkr5tGOVfiHfMfj
X-Proofpoint-GUID: VOHEd7YZaZdxkRxtiOkr5tGOVfiHfMfj
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
Cc: Michel Lespinasse <michel@lespinasse.org>, Joel Fernandes <joelaf@google.com>, Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Xu <peterx@redhat.com>, "dhowells@redhat.com" <dhowells@redhat.com>, linux-mm <linux-mm@kvack.org>, Jerome Glisse <jglisse@google.com>, Davidlohr Bueso <dave@stgolabs.net>, Minchan Kim <minchan@google.com>, "x86@kernel.org" <x86@kernel.org>, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kernel-team <kernel-team@android.com>, "Paul E . McKenney" <paulmck@kernel.org>, Andy Lutomirski <luto@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@
 lists.infradead.org>, Kent Overstreet <kent.overstreet@linux.dev>, LKML <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Suren Baghdasaryan <surenb@google.com> [220906 15:01]:
> On Tue, Sep 6, 2022 at 7:27 AM Laurent Dufour <ldufour@linux.ibm.com> wro=
te:
> >
> > Le 01/09/2022 =E0 19:34, Suren Baghdasaryan a =E9crit :
> > > VMA flag modifications should be done under VMA lock to prevent concu=
rrent
> > > page fault handling in that area.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > ---
> > >  fs/proc/task_mmu.c | 1 +
> > >  fs/userfaultfd.c   | 6 ++++++
> > >  mm/madvise.c       | 1 +
> > >  mm/mlock.c         | 2 ++
> > >  mm/mmap.c          | 1 +
> > >  mm/mprotect.c      | 1 +
> > >  6 files changed, 12 insertions(+)
> >
> > There are few changes also done in the driver's space, for instance:
> >
> > *** arch/x86/kernel/cpu/sgx/driver.c:
> > sgx_mmap[98]                   vma->vm_flags |=3D VM_PFNMAP | VM_DONTEX=
PAND |
> > VM_DONTDUMP | VM_IO;
> > *** arch/x86/kernel/cpu/sgx/virt.c:
> > sgx_vepc_mmap[108]             vma->vm_flags |=3D VM_PFNMAP | VM_IO |
> > VM_DONTDUMP | VM_DONTCOPY;
> > *** drivers/dax/device.c:
> > dax_mmap[311]                  vma->vm_flags |=3D VM_HUGEPAGE;
> >
> > I guess these changes to vm_flags should be protected as well, or to be
> > checked one by one.
>=20
> Thanks for noting these! I'll add necessary locking here and will look
> for other places I might have missed.

Would an inline set/clear bit function be worth while for vm_flags?  If
it is then a name change to vm_flags may get the compiler to catch any
missed cases.  There doesn't seem to be many cases (12 inserts) so maybe
not.

>=20
> >
> > >
> > > diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> > > index 4e0023643f8b..ceffa5c2c650 100644
> > > --- a/fs/proc/task_mmu.c
> > > +++ b/fs/proc/task_mmu.c
> > > @@ -1285,6 +1285,7 @@ static ssize_t clear_refs_write(struct file *fi=
le, const char __user *buf,
> > >                       for (vma =3D mm->mmap; vma; vma =3D vma->vm_nex=
t) {
> > >                               if (!(vma->vm_flags & VM_SOFTDIRTY))
> > >                                       continue;
> > > +                             vma_mark_locked(vma);
> > >                               vma->vm_flags &=3D ~VM_SOFTDIRTY;
> > >                               vma_set_page_prot(vma);
> > >                       }
> > > diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> > > index 175de70e3adf..fe557b3d1c07 100644
> > > --- a/fs/userfaultfd.c
> > > +++ b/fs/userfaultfd.c
> > > @@ -620,6 +620,7 @@ static void userfaultfd_event_wait_completion(str=
uct userfaultfd_ctx *ctx,
> > >               mmap_write_lock(mm);
> > >               for (vma =3D mm->mmap; vma; vma =3D vma->vm_next)
> > >                       if (vma->vm_userfaultfd_ctx.ctx =3D=3D release_=
new_ctx) {
> > > +                             vma_mark_locked(vma);
> > >                               vma->vm_userfaultfd_ctx =3D NULL_VM_UFF=
D_CTX;
> > >                               vma->vm_flags &=3D ~__VM_UFFD_FLAGS;
> > >                       }
> > > @@ -653,6 +654,7 @@ int dup_userfaultfd(struct vm_area_struct *vma, s=
truct list_head *fcs)
> > >
> > >       octx =3D vma->vm_userfaultfd_ctx.ctx;
> > >       if (!octx || !(octx->features & UFFD_FEATURE_EVENT_FORK)) {
> > > +             vma_mark_locked(vma);
> > >               vma->vm_userfaultfd_ctx =3D NULL_VM_UFFD_CTX;
> > >               vma->vm_flags &=3D ~__VM_UFFD_FLAGS;
> > >               return 0;
> > > @@ -734,6 +736,7 @@ void mremap_userfaultfd_prep(struct vm_area_struc=
t *vma,
> > >               atomic_inc(&ctx->mmap_changing);
> > >       } else {
> > >               /* Drop uffd context if remap feature not enabled */
> > > +             vma_mark_locked(vma);
> > >               vma->vm_userfaultfd_ctx =3D NULL_VM_UFFD_CTX;
> > >               vma->vm_flags &=3D ~__VM_UFFD_FLAGS;
> > >       }
> > > @@ -891,6 +894,7 @@ static int userfaultfd_release(struct inode *inod=
e, struct file *file)
> > >                       vma =3D prev;
> > >               else
> > >                       prev =3D vma;
> > > +             vma_mark_locked(vma);
> > >               vma->vm_flags =3D new_flags;
> > >               vma->vm_userfaultfd_ctx =3D NULL_VM_UFFD_CTX;
> > >       }
> > > @@ -1449,6 +1453,7 @@ static int userfaultfd_register(struct userfaul=
tfd_ctx *ctx,
> > >                * the next vma was merged into the current one and
> > >                * the current one has not been updated yet.
> > >                */
> > > +             vma_mark_locked(vma);
> > >               vma->vm_flags =3D new_flags;
> > >               vma->vm_userfaultfd_ctx.ctx =3D ctx;
> > >
> > > @@ -1630,6 +1635,7 @@ static int userfaultfd_unregister(struct userfa=
ultfd_ctx *ctx,
> > >                * the next vma was merged into the current one and
> > >                * the current one has not been updated yet.
> > >                */
> > > +             vma_mark_locked(vma);
> > >               vma->vm_flags =3D new_flags;
> > >               vma->vm_userfaultfd_ctx =3D NULL_VM_UFFD_CTX;
> > >
> > > diff --git a/mm/madvise.c b/mm/madvise.c
> > > index 5f0f0948a50e..a173f0025abd 100644
> > > --- a/mm/madvise.c
> > > +++ b/mm/madvise.c
> > > @@ -181,6 +181,7 @@ static int madvise_update_vma(struct vm_area_stru=
ct *vma,
> > >       /*
> > >        * vm_flags is protected by the mmap_lock held in write mode.
> > >        */
> > > +     vma_mark_locked(vma);
> > >       vma->vm_flags =3D new_flags;
> > >       if (!vma->vm_file) {
> > >               error =3D replace_anon_vma_name(vma, anon_name);
> > > diff --git a/mm/mlock.c b/mm/mlock.c
> > > index b14e929084cc..f62e1a4d05f2 100644
> > > --- a/mm/mlock.c
> > > +++ b/mm/mlock.c
> > > @@ -380,6 +380,7 @@ static void mlock_vma_pages_range(struct vm_area_=
struct *vma,
> > >        */
> > >       if (newflags & VM_LOCKED)
> > >               newflags |=3D VM_IO;
> > > +     vma_mark_locked(vma);
> > >       WRITE_ONCE(vma->vm_flags, newflags);
> > >
> > >       lru_add_drain();
> > > @@ -456,6 +457,7 @@ static int mlock_fixup(struct vm_area_struct *vma=
, struct vm_area_struct **prev,
> > >
> > >       if ((newflags & VM_LOCKED) && (oldflags & VM_LOCKED)) {
> > >               /* No work to do, and mlocking twice would be wrong */
> > > +             vma_mark_locked(vma);
> > >               vma->vm_flags =3D newflags;
> > >       } else {
> > >               mlock_vma_pages_range(vma, start, end, newflags);
> > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > index 693e6776be39..f89c9b058105 100644
> > > --- a/mm/mmap.c
> > > +++ b/mm/mmap.c
> > > @@ -1818,6 +1818,7 @@ unsigned long mmap_region(struct file *file, un=
signed long addr,
> > >  out:
> > >       perf_event_mmap(vma);
> > >
> > > +     vma_mark_locked(vma);
> > >       vm_stat_account(mm, vm_flags, len >> PAGE_SHIFT);
> > >       if (vm_flags & VM_LOCKED) {
> > >               if ((vm_flags & VM_SPECIAL) || vma_is_dax(vma) ||
> >
> > I guess, this doesn't really impact, but the call to vma_mark_locked(vm=
a)
> > may be done only in the case the vm_flags field is touched.
> > Something like this:
> >
> >         vm_stat_account(mm, vm_flags, len >> PAGE_SHIFT);
> >         if (vm_flags & VM_LOCKED) {
> >                 if ((vm_flags & VM_SPECIAL) || vma_is_dax(vma) ||
> >                                         is_vm_hugetlb_page(vma) ||
> > -                                       vma =3D=3D get_gate_vma(current=
->mm))
> > +                                       vma =3D=3D get_gate_vma(current=
->mm)) {
> > +                       vma_mark_locked(vma);
> >                         vma->vm_flags &=3D VM_LOCKED_CLEAR_MASK;
> > -               else
> > +               } else
> >                         mm->locked_vm +=3D (len >> PAGE_SHIFT);
> >         }
> >
> >
> > > diff --git a/mm/mprotect.c b/mm/mprotect.c
> > > index bc6bddd156ca..df47fc21b0e4 100644
> > > --- a/mm/mprotect.c
> > > +++ b/mm/mprotect.c
> > > @@ -621,6 +621,7 @@ mprotect_fixup(struct mmu_gather *tlb, struct vm_=
area_struct *vma,
> > >        * vm_flags and vm_page_prot are protected by the mmap_lock
> > >        * held in write mode.
> > >        */
> > > +     vma_mark_locked(vma);
> > >       vma->vm_flags =3D newflags;
> > >       /*
> > >        * We want to check manually if we can change individual PTEs w=
ritable
> >=
