Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7CD5AA10F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 22:53:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJYDP1vNdz308Z
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 06:53:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=erwne72M;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=BiYKXxGF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=erwne72M;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=BiYKXxGF;
	dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJYCW6Db1z2xGS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 06:52:46 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 281KRLn6024971;
	Thu, 1 Sep 2022 20:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=1tMNHePL4xT0E2TFMChCPBoQuHGCX5NV4tQ1QJrWSAw=;
 b=erwne72MlD+T36YNQ9G4cHr3QSfQZkLJesjuo5tzl4Ny+wur1faSKaH/9FwTk8DFgQVC
 Cp+CT6kCcQNpHmqwGw2kqrlIWaQFlyz7oXTXnpwwXQojTFnhbq9q1g0DjgiLX45Jap7W
 E/pUJWi3X4grhZ/5VW0xOnd5NiQN8R3m+KKzX+dkFT6Mh0CM7aIOfcSQ5HeN/ATi/idG
 /TY48cpfhcWvaJkjHiV5tCew5I6XDNovI42AWT5i4x8ujdpuLloitowA7tlkWJ9EMjfp
 LklreJbh6SOhyEBKpLLuOrTS+eAuwW407RaOm6GYg3X6lw/ZWGKllVyU/DbeIBECh0Ie 4Q== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j7avsngdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 Sep 2022 20:51:54 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 281Ic6Mm002238;
	Thu, 1 Sep 2022 20:51:53 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3j79q6y2aq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 Sep 2022 20:51:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OX+F+W3mO4YzEAdN+Er11fTPchjCK/pmjjciWpOHP9zDCBhWBfPjelmX5v/su2UX5H9eJfCeo6NjKLaMMbEaW+z9oKzTTYdkHAdPT8k/HyNHzl7xh2mwT9cilta2gX6ngcSGFOg/TVvsKwKAtrEHSbhycgSYSXX4KmohxXX47MPlRLGNP5v6Mz/7dXkoll1K0H15kC+AkF3a6/OUIj9oeKupt898QD6zTHot6gOZNCoDIQ79SIuAMCvmQp4dpjCz0YDReejXsUFU6reXN1fZmzikEyfoI2MA+XJkM6j4J2orM37SdShc2tLcNm/U8rcApLokB3w0PzuUFtCPy+xhjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tMNHePL4xT0E2TFMChCPBoQuHGCX5NV4tQ1QJrWSAw=;
 b=C2fiwScQePqvDYA746veq7MfG6C2U3Ywmyec60Au71LzuaCUZK4UKvEb9LtnnLZoo0vLHEnPYJvG7jZ5fYMiKuFi2j50KSQIr0+NP2TzNMVReeCwixkAZjxV7dv40h57/62uxNCALVhZAti3b3+NTa4Vu+PSoWj2XZaw1ndzhRn1oa3QAR9i/0XOwC9Qmhfchkj/IxS4jhQKiV1TE1X04kP6cUPUocYnLNFe9AMzKOQKife2hxagt3QevWUvVZIWaiiMC6hVG2kFtFV8/TYGc1fdiJT/nFyS2qOd7eCA8n8/HcGrOvqedv490bMxko7dNZW0/7e8phBpAuhovGMENA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tMNHePL4xT0E2TFMChCPBoQuHGCX5NV4tQ1QJrWSAw=;
 b=BiYKXxGFYNWQn3TB0T2QMAx9yuINXE55mJYZbWfGep6G2vRbcSkbLNRVGwrHLBJxkKboBvKaM3+L+jhAv7c9ytJ+fZ4JQDpAEwc1cctZMxcHXoKdDMHHPX5wGeqOubqsubQcCLyBpGHRw9Yh/Kuah1EDoseElTrKjTwpyn2QHuU=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by CY5PR10MB6167.namprd10.prod.outlook.com (2603:10b6:930:31::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 20:51:51 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::a420:3107:436d:d223]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::a420:3107:436d:d223%5]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 20:51:50 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Subject: Re: [RFC PATCH RESEND 04/28] mm: move mmap_lock assert function
 definitions
Thread-Topic: [RFC PATCH RESEND 04/28] mm: move mmap_lock assert function
 definitions
Thread-Index: AQHYvik+oqqHYdXkPESLRNx1ViJtsa3LBUKAgAAHtQA=
Date: Thu, 1 Sep 2022 20:51:50 +0000
Message-ID: <20220901205144.66ilifzaxr5p4xi3@revolver>
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-5-surenb@google.com>
 <20220901202409.e2fqegqghlijkzey@moria.home.lan>
In-Reply-To: <20220901202409.e2fqegqghlijkzey@moria.home.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a46e8e2-44d3-4834-145d-08da8c5bcb64
x-ms-traffictypediagnostic: CY5PR10MB6167:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Hc39LxsrVSFpDuu474gwUcnlodCmde+9CQEcY8Ef9NrX6deI8YtFrkMKvR6DyqfZTJ6aoanonMmlPqBcUPy/2nchnHSaO6i/nuN7Sl4nkZPIW9sN2RyIAQF4/S8hSVzqBKkCgTxfEuRxoxD74SUR88ctsUa1zGgB2QCTrJzMocXWfrc9iOl6WIdRqjzs9wy4l/2ER/5NQ0n20ElCr0BE/lxy+lKerBP3e5TIFTsN2FgpFFv9qMNIIBg4W54pqjzuZ+Tp5WaCu3i833ew0arwH8LzR66BseDJDMD99fSIMTIKaLKgk4axKJxQ3wntB8XJA6gTLw3J6V1NFSDBI5wpS41aRCKs6ka2LsJkhzI3a5p2ZnWhXb2UaQBT9LINdE1LH1h6yc8Byf4uNs5W0ug+P79xrw6Hwgs/6ZBsinCP5KZCOJOK5Do1Fraqk6x9IJXNEZya5yhVfZK/ifeNBM2r386j8TJoPJSpNmF6UiQPYyM4j5I1dC8jxBOofnrceLNPVWXHW75o8j0oQMjBUBMpZnRmhn1qaf8IM7s+djGBwLQZFv4QV61GnFZTNHIvfOxM0ZsiqbpRQRJGuxr/Yf96Q0rA1PFOw3e14iNhLfU5Dr8bO+hm8ktPQXfm+hOXNlCEW5TEZUueDJ2+Z+X724pwxCTc84/sVVyUG40KggCNkwMwpfJ3YK6JgQuAhZ9+hCaZdexa/68Q6LlYEPmd0MR8c8b8LOOMN4nC2IIABH6Pfz7NhvwB5Qz11kEJ7dytjr5UOIgQW3QRNnc1F0bPLCEW2Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(396003)(39860400002)(136003)(346002)(376002)(83380400001)(6512007)(26005)(186003)(9686003)(1076003)(6506007)(2906002)(86362001)(38070700005)(38100700002)(122000001)(5660300002)(7406005)(91956017)(7416002)(33716001)(66446008)(8676002)(76116006)(41300700001)(64756008)(66476007)(316002)(66556008)(4326008)(66946007)(6486002)(478600001)(54906003)(71200400001)(6916009)(8936002)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?fPwcxqEJh42Im+LDqPqUgsnZ3ywEKKwNZ0g7b5OQdCZBscQz6P8+mnUeFTsD?=
 =?us-ascii?Q?s8Bd2giRas8Jq9ceq+7ZOBz8uZH5UlAC0iwyjb7VUR+RHCR7uBN7MIKXjpJj?=
 =?us-ascii?Q?kBNSdPKWCozuP0flGF6dUmaL3Dh7hZaAFxqdwrYngdWDl7ozVFyjqJkq/yMj?=
 =?us-ascii?Q?1mDarqakuJI+K6PFBUSIqhWuhZD1SlpcMTy1cj8o2s0ho5zJrFm2SeyU38Uc?=
 =?us-ascii?Q?xNBmHfHum2ZVK8KLO0lFfj62G38CGo7WbyNKw2+dnQf2ibYK7+sLQqgINj/7?=
 =?us-ascii?Q?ACoZccVfpOtk4vFAoiQWMLOqjAUUc8RtOwekvh2pLJKqumIfqpoT261LvXbg?=
 =?us-ascii?Q?max41zDKzmJI+X/n2qjJ612ezTX+rteIcXkGfGqj1a2YecbIeJ17NbjO11t4?=
 =?us-ascii?Q?T1cqHpJOHCkt9eUccqx71V85PB6//j30l2d2L/CamQDClsamWnPRfRbppnRv?=
 =?us-ascii?Q?loMygyYFBfPpQN3KPemlMjYJEzXbGeVsgT8yiLCgMbqaUrDV37B6tB3xWOaf?=
 =?us-ascii?Q?oE4tNqzFYM+8AES6j1Tw6JpU8pjxjtAyhkGqNeQd+nYBVqYEqpgDKiuT0icV?=
 =?us-ascii?Q?JzZc3ZJRwN7Ec5nAPIDRpa0yhiPXEjsR9L/STnevOpvcevFbByEMs0ncIw77?=
 =?us-ascii?Q?FOn4MM1Ny3xmbrhAYhwfKVTIi8rQ3IUYEU9vDxKqAOdOoFkc8mSN0BmyZLt+?=
 =?us-ascii?Q?u/sNWh08t/ceIp73VQUlzW6wCU/x3yu+oriSCCKM7hnUBHpY6c0VEjJVhHDU?=
 =?us-ascii?Q?ybnV4jfqa0SrvyZw+wnrJem5CPE0wC23D8cUkoQjwybFiiMVXuIlxhcaI+Ti?=
 =?us-ascii?Q?j3aMxKbzBFHTW+u2a/FDlIWHKUcjsCYMyJL++AabQ7+ZmvI3KIS9bqfF1yJ8?=
 =?us-ascii?Q?KgXbtq0dwJEmcsHIIV4sus+1kc4O0dvJjTILE2pDAVqx9tlSmZQvWWc03gBb?=
 =?us-ascii?Q?72LUQCz86SZ9OFLj/3B2C4ArgZ2fYcYhf3kw9rBYK1i7nmEkYQcMF8W97QCj?=
 =?us-ascii?Q?M5zLhyFkA0fYUHakEizOzG2sQGre3PO6bv9Ggv4Mcs5VmFkB4ikGK9DfxIfz?=
 =?us-ascii?Q?2ZaKTn1wBEimkNT+K8dRn7PUq6COC8w5dt4SOoT8Aqp0F2z5NdmKPPbOYCbS?=
 =?us-ascii?Q?oZLzBOy8OnlU10J4MKU1loMWeBlrtErpIPyNFJx8Hk8NQ7OHqVpn/p1reVsM?=
 =?us-ascii?Q?4v2cTJtCZeQ3QNhkI3pp2+o2pIGRi2QlNiyRx7sxjNLIxRvLo/6qQwn4gsOq?=
 =?us-ascii?Q?g0/7jBbcd3unmodM0mB1nHyvvMQLtCk3AHtxzwws2IZnt2Lqld8mwkCqPIYu?=
 =?us-ascii?Q?sgAIreP7/nafO+Dq+psTBSai5gGGDyV/q9RSQfvCKzr9l6EZ/d/4qhzltT0c?=
 =?us-ascii?Q?GDyVEreQqZjgi8RTzCNSpz29pga/poH8YsxP1Pqx/GGe0IQVuhOo5BAXaay2?=
 =?us-ascii?Q?1sj1rleVNy1ifC2ixLFkzO4+DPBUfHrVx2qYUWbTVA7PoJYrgjO5X/TcTGCY?=
 =?us-ascii?Q?Zk737ZMjaK/60f8wY+jso7DXX9O3FBAbS/2MheiZ2civcGFufl5yGe1DPpBP?=
 =?us-ascii?Q?2g+yH+DGTqpghk6jfSclllKOxHlCoXUNazX2l6RMGeN7ARY75tA8gZkuviC6?=
 =?us-ascii?Q?LA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E69BDBB19177E24192A4FF7F16B2EDF7@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a46e8e2-44d3-4834-145d-08da8c5bcb64
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 20:51:50.8436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SpSYm5/5+6ZImmhNJY5QkvOXkG67+MdOtaYpljB+yjtJ1dKSzlA4Ffx5gKopKwnHb+Tqi1KtU0DYalVq5FoULw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6167
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_12,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010090
X-Proofpoint-GUID: tjL-tgitKqT4jHdrHyqZFE6ML1i0nR8J
X-Proofpoint-ORIG-GUID: tjL-tgitKqT4jHdrHyqZFE6ML1i0nR8J
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
Cc: "michel@lespinasse.org" <michel@lespinasse.org>, "joelaf@google.com" <joelaf@google.com>, "songliubraving@fb.com" <songliubraving@fb.com>, "mhocko@suse.com" <mhocko@suse.com>, "david@redhat.com" <david@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, "bigeasy@linutronix.de" <bigeasy@linutronix.de>, "peterx@redhat.com" <peterx@redhat.com>, "dhowells@redhat.com" <dhowells@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "jglisse@google.com" <jglisse@google.com>, "dave@stgolabs.net" <dave@stgolabs.net>, "minchan@google.com" <minchan@google.com>, "x86@kernel.org" <x86@kernel.org>, "hughd@google.com" <hughd@google.com>, "willy@infradead.org" <willy@infradead.org>, "laurent.dufour@fr.ibm.com" <laurent.dufour@fr.ibm.com>, "mgorman@suse.de" <mgorman@suse.de>, "rientjes@google.com" <rientjes@google.com>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "kernel-team@android.com" <kernel-team@android.com>, "paulmck@kernel.org" <paulmck@kernel.org>, "luto@kernel.org" 
 <luto@kernel.org>, "ldufour@linux.ibm.com" <ldufour@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Kent Overstreet <kent.overstreet@linux.dev> [220901 16:24]:
> On Thu, Sep 01, 2022 at 10:34:52AM -0700, Suren Baghdasaryan wrote:
> > Move mmap_lock assert function definitions up so that they can be used
> > by other mmap_lock routines.
> >=20
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/mmap_lock.h | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> > index 96e113e23d04..e49ba91bb1f0 100644
> > --- a/include/linux/mmap_lock.h
> > +++ b/include/linux/mmap_lock.h
> > @@ -60,6 +60,18 @@ static inline void __mmap_lock_trace_released(struct=
 mm_struct *mm, bool write)
> > =20
> >  #endif /* CONFIG_TRACING */
> > =20
> > +static inline void mmap_assert_locked(struct mm_struct *mm)
> > +{
> > +	lockdep_assert_held(&mm->mmap_lock);
> > +	VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);
>=20
> These look redundant to me - maybe there's a reason the VM developers wan=
t both,
> but I would drop the VM_BUG_ON() and just keep the lockdep_assert_held(),=
 since
> that's the standard way to write that assertion.

I think this is because the VM_BUG_ON_MM() will give you a lot more
information and BUG_ON().

lockdep_assert_held() does not return a value and is a WARN_ON().

So they are partially redundant.
