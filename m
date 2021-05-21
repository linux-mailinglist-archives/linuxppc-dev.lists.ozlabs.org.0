Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 410DD38CA66
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 17:49:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmrdR1LnNz308k
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 May 2021 01:49:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=JWMnQM7j;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=TiXDp0HC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=JWMnQM7j; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=TiXDp0HC; dkim-atps=neutral
X-Greylist: delayed 1424 seconds by postgrey-1.36 at boromir;
 Sat, 22 May 2021 01:48:58 AEST
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmrcp0b6Nz303h
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 May 2021 01:48:57 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LF7quC002566; Fri, 21 May 2021 15:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=EoxR1LSdBqWwPDt4ro3xq2hA/tPIjScIGe/g3A51dwc=;
 b=JWMnQM7jcL86VkQImnZ2wv+9eL00hAxOt/onj21ensPJMW5Y0BZyouRTRA0AOkehHj6N
 CZ6yogio/g7iCT2n4QMshSXBInpHS3y4v4TDWdUKnQajffUr88chMiSFjf0NSFl+GZBB
 XhewPljrzCfEdFWaVTJBkhyij+aYNEsoxw6XB7ZBMVMb93E8TtIEkpIqpt+XEFRlbRLE
 gNdBccAiQEMGseaB+ZH3QMmpm1OUjmJahRr797yZKe9Xt5hJkvTZm66Up7czrmgI2bfo
 WeSIVEhqvF8AL+S9B8ukvSbJVwW1ieDEZVBgUZWkVDtsKI7uXZvdb+3gkNtR1dOoKd2/ MA== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 38n4utrxxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 15:24:52 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14LFIoXV042864;
 Fri, 21 May 2021 15:24:51 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
 by userp3020.oracle.com with ESMTP id 38n492v8f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 15:24:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMZAXko8mhZO5YHSXTPgyxW+czXQTLSW6utrG3WFsKiaeIlazstikkF7JmWv/KVBlEpf5ypu8eWn0ubg4FgRBAQSq55+ihz1JCCL10lRB1A9o7xwN6d+9OmqaFysKVn8oTMjM2yRksb1yoIZT4Uo7rEkMovdh3r1NlIzze+HEht2q3pkBL7GSym8t0x+4G7gLcPdT1hunfWHuXjcfodSeAurca0V2xalBN+s2eXj0dcinekdbDSz0hOp5TtBrb5R9lAhNAKl+hTPDJ39S3wvD5kQ4/JT5+FIJQrtUTAslufGbYChF3pOOcSqf4Lspe6/nfhI4kXbZLsTX7ICtjnRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoxR1LSdBqWwPDt4ro3xq2hA/tPIjScIGe/g3A51dwc=;
 b=m+nkmH8Z6Z3FZad/pansEU+0bV9zD8lOFu8dwGsN5qqfPCEDH0F41V7L6oLsBR7tpnqX7Cq0kD+Qcpym7jnyc0jHy+4U5DuqTF4G+rJNVd8+NsAf17oUFGKReRCdsKJTbWWrojrJRZfU6wq4IinjOEp/Hcj8zPuHVfyuxbNLPci1eIrflw5xOjENgGOO8lQM8cVCoZH4dtnk0uTTZ1sp1BeiyNt9rRW6KcApq1LBSYfUyHXRd32u/yoDInkdUrbME1ugMV/uE+YnxDXBlTktf5gkltfNS20EDPHOQfp7NGAxFNRvt1g+FSNYNuZE1jxVRWrKRql81LRl4uosPsP31A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoxR1LSdBqWwPDt4ro3xq2hA/tPIjScIGe/g3A51dwc=;
 b=TiXDp0HCvYqToRR888YHZaW5DrRGEkqc0kg+muasgMAIfNs5T+Sqcql2dXmpSn0HNvHzhaUvWywD7WW+ifVcnK61UvRKNBamTGkQcUeoIOGk44HSa9fOeO1YENgnDB/jjA1x7Pt2CEBvDioWpuvZeMhkEYFsJpVNgcShuu8MiFg=
Received: from MWHPR10MB1582.namprd10.prod.outlook.com (2603:10b6:300:22::8)
 by MWHPR1001MB2335.namprd10.prod.outlook.com (2603:10b6:301:2e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Fri, 21 May
 2021 15:24:49 +0000
Received: from MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::353a:1802:6e91:1811]) by MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::353a:1802:6e91:1811%8]) with mapi id 15.20.4150.023; Fri, 21 May 2021
 15:24:48 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v5 7/9] mm/mremap: Move TLB flush outside page table lock
Thread-Topic: [PATCH v5 7/9] mm/mremap: Move TLB flush outside page table lock
Thread-Index: AQHXNzqwwBFKlf59HEyEUKG3dm/IRarsqneAgAAZiACAAKLsgIAABlIAgAA1JgCAAG78gIAAKwgA
Date: Fri, 21 May 2021 15:24:48 +0000
Message-ID: <20210521152438.jczhe6nxnz5woxpl@revolver>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-8-aneesh.kumar@linux.ibm.com>
 <b3047082-fc82-b326-dbdb-835b88df78d0@linux.ibm.com>
 <2eafd7df-65fd-1e2c-90b6-d143557a1fdc@linux.ibm.com>
 <CAHk-=wjq8thag3uNv-2MMu75OgX5ybMon7gZDUHYwzeTwcZHoA@mail.gmail.com>
 <f676b053-bda4-a1f5-321e-f00fb3de8a40@linux.ibm.com>
 <CAHk-=wgXVR04eBNtxQfevontWnP6FDm+oj5vauQXP3S-huwbPw@mail.gmail.com>
 <5ea8fa4f-a5a2-7dc4-7958-23df6a2c1f3a@linux.ibm.com>
In-Reply-To: <5ea8fa4f-a5a2-7dc4-7958-23df6a2c1f3a@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80858931-73ac-48c0-d2f7-08d91c6c9286
x-ms-traffictypediagnostic: MWHPR1001MB2335:
x-microsoft-antispam-prvs: <MWHPR1001MB2335386D8DD9287C96BA8B65FD299@MWHPR1001MB2335.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1091;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XTJdiqjfsk1IdR1/zC6gpU1Gr7zvPyLw9aC5GSPR9dEDVmUPGpu66Z9upF906wj+Ktsjzgte2ExjDGcj2sXnvIKIdhbtXgrGef+1VImQW3NyaVFDOTNreWODu0EoYT/2UMbftR5Txh0/SyyPXsPM4YfQkFlgcOEtcQXblohPIfQ2/xtbYDMnpUuBda9CixWcAxDqrmchWKnMKiNxcV3dlUIORRKc7fy5klp+/XGtW4nZoCZZ/Rxw3xZyJ+JaT75OT67u2GIoJaZAWtjtFWzpDoKITawiliv6Gi6jev6vRZ8ElsYIt7ACyBGujVK6xtjiklIpJNrOCxHPsC/w+AWVlDHsMfiFx0X96t2gm4hygFyZiBGCX+PkiLUnCAtf4yGV/ssWOHhqSuy/OX1ENSwVKWuPzmKpwAK4scbkHbDyRbLhgwX8bYNb/KC5w1SpNVkxs6QYIpq74rmAjnRzGp1hRnfXNfQ8+j3JdaU4j2hnG4EIPvJ+n188ephO8lGFSACgWIdyBTG0AyGEy9oLPHzt4TUlVvl7WWpx+HEcBddzd+F3Aarm5S4UhIsLHfAdFKmaeGOm4fu71o0RYl4h6qR2Fy6puIMFVMZ6kGW2byQdNos=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB1582.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(136003)(39860400002)(366004)(376002)(396003)(346002)(5660300002)(2906002)(6486002)(54906003)(33716001)(478600001)(4326008)(186003)(8936002)(66946007)(26005)(316002)(66446008)(66556008)(91956017)(6512007)(9686003)(76116006)(6916009)(44832011)(86362001)(53546011)(1076003)(64756008)(66476007)(38100700002)(7416002)(8676002)(83380400001)(122000001)(71200400001)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?7Gk45tRWyw1/h50K1IpYNaivo8uGdmOVx4V9f4yLCHVEO86g1S7UOeAeD0lq?=
 =?us-ascii?Q?AGPoty5CydUDYn5dQrkoBqobD9uSkoEcLkJ183uo0XXEmucXslbIihjFhnqk?=
 =?us-ascii?Q?kOJIyF2a+3iOCoC/3i2FwckQ6qDqGKOCKdlA1qWujuiI3+SeubL/tu2Ey2Z+?=
 =?us-ascii?Q?ZlG3HuNnTzVmHck0Ep1OhshLZGi1IFMsr/0SVlQHptw9jyngbFEuRz9vO40U?=
 =?us-ascii?Q?ch1YHieRMh+6u/KMrQC9KyZQu32AZjb/UyoeSpAvUsUTG1lVGVTH9hbmZ6Kc?=
 =?us-ascii?Q?vTaFbNB4KYiuXAj5zfAjpKw7K47S+FZc1xvc6Biq6IAFjHK1koQkqhuF0HVe?=
 =?us-ascii?Q?7JS4N9K2TRUvnZhgZnjLdzRQEAi6E3v0kAGbDWa1xxFoVC3Ok/27cpRnZSck?=
 =?us-ascii?Q?BhkcH2APmcyCHHAcM9vB6sOJnZZC+4tdsaLnxu161TuON4j3KVuwN1DmKMbd?=
 =?us-ascii?Q?azmAxlfjTeJZXekvgM5HBclvAYkuqkS8REKZ7JOye0NasduXPpobg8INOE2h?=
 =?us-ascii?Q?IqGVQ2VuZEEL07V/8fC/3msuD0WR1HznnZV6Lzm7rugsaRNDmUKRTyw5suXa?=
 =?us-ascii?Q?0Z3shbuEaWRKBlKRwxesD9z675FvsG0eTJD5ZBvHKXitPTVLGsJdVhxPZ8IN?=
 =?us-ascii?Q?JwkIH4MYjr2vdem8P5MnNBl4skQprwpd4OI1TQCFtrdQ9NVWh+eLGxbALJI3?=
 =?us-ascii?Q?beYCfCvm5UJGdeZciZUKQhSCh7RzgwwQoVEU2okkmLYngBCtvleTxrrHk10n?=
 =?us-ascii?Q?tBzOydkDLJF8tN398jD8Er+h9UBuaopQma7ZJrheqYN2MDKduxsX+ITHQC+9?=
 =?us-ascii?Q?a0CvIxmgzdwOgEZ3/RssHrOaGveGR9wE0StU1banbEF/WOkmKqwt8C7RjdK8?=
 =?us-ascii?Q?3LuAssC6RTD2P4pa0bDA+eASDUILf6ZaAqfQPyPJyhv1x8H5SpTDIyau/ZOB?=
 =?us-ascii?Q?9SSoGK96DT+AVN+4B54AQM4pl2C1hVD5QSXJQZa8VTtghSYsSAzStn5pmEye?=
 =?us-ascii?Q?UF3zo5cMmLCu+iDB4KuEM2YOt5d91PdDFjqxkTBsvPwNPqFDowxWzWO1LyMN?=
 =?us-ascii?Q?t5Kb5r7ixulyGK+hPlgn0+43D+ZnXOM6QmgLFCJUE8zzkVoEw+F0mpB3kW+/?=
 =?us-ascii?Q?smeW4VWm3Rrzfg/JZOBo8SS2Dy8ttswdgDocUiYKFpgg/Yh7doMfDJEBcnAK?=
 =?us-ascii?Q?uRswLJDweapC6mpCDq0JNx2nsrddU76UiN0+kM6zZEx72Hyi5ZcfP36/gjX3?=
 =?us-ascii?Q?m4SBzKFPyGSlLWzwkLAh68ZDbw8ELHZ+Gn654SGoRT8eDZliaxh1blW1Ce4c?=
 =?us-ascii?Q?2IIM7FapJTryPMNETUUT1M5P?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <85DEDF2B36278E4FAC53C94D972B646C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB1582.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80858931-73ac-48c0-d2f7-08d91c6c9286
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 15:24:48.7901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hWCA24rMs6RLlaz42gOeysVPbu13cHuLOnlbTrAi5SsP4gT3wX6HBFVORUabIpbxTLKX1bjenIRgmu1wNrAlNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2335
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9990
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105210083
X-Proofpoint-GUID: 8eHr6EULBPK0NeHDWhLSNlptuwfhHg4V
X-Proofpoint-ORIG-GUID: 8eHr6EULBPK0NeHDWhLSNlptuwfhHg4V
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [210521 08:51]:
> On 5/21/21 11:43 AM, Linus Torvalds wrote:
> > On Thu, May 20, 2021 at 5:03 PM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> > >=20
> > > On 5/21/21 8:10 AM, Linus Torvalds wrote:
> > > >=20
> > > > So mremap does need to flush the TLB before releasing the page tabl=
e
> > > > lock, because that's the lifetime boundary for the page that got
> > > > moved.
> > >=20
> > > How will we avoid that happening with
> > > c49dd340180260c6239e453263a9a244da9a7c85 /
> > > 2c91bd4a4e2e530582d6fd643ea7b86b27907151 . The commit improves mremap
> > > performance by moving level3/level2 page table entries. When doing so=
 we
> > > are not holding level 4 ptl lock (pte_lock()). But rather we are hold=
ing
> > > pmd_lock or pud_lock(). So if we move pages around without holding th=
e
> > > pte lock, won't the above issue happen even if we do a tlb flush with
> > > holding pmd lock/pud lock?
> >=20
> > Hmm. Interesting.
> >=20
> > Your patch (to flush the TLB after clearing the old location, and
> > before inserting it into the new one) looks like an "obvious" fix.
> >=20
> > But I'm putting that "obvious" in quotes, because I'm now wondering if
> > it actually fixes anything.
> >=20
> > Lookie here:
> >=20
> >   - CPU1 does a mremap of a pmd or pud.
> >=20
> >      It clears the old pmd/pud, flushes the old TLB range, and then
> > inserts the pmd/pud at the new location.
> >=20
> >   - CPU2 does a page shrinker, which calls try_to_unmap, which calls
> > try_to_unmap_one.
> >=20
> > These are entirely asynchronous, because they have no shared lock. The
> > mremap uses the pmd lock, the try_to_unmap_one() does the rmap walk,
> > which does the pte lock.
> >=20
> > Now, imagine that the following ordering happens with the two
> > operations above, and a CPU3 that does accesses:
> >=20
> >   - CPU2 follows (and sees) the old page tables in the old location and
> > the took the pte lock
> >=20
> >   - the mremap on CPU1 starts - cleared the old pmd, flushed the tlb,
> > *and* inserts in the new place.
> >=20
> >   - a user thread on CPU3 accesses the new location and fills the TLB
> > of the *new* address

mremap holds the mmap_sem in write mode as well, doesn't it?  How is the us=
er thread
getting the new location?

> >=20
> >   - only now does CPU2 get to the "pte_get_and_clear()" to remove one p=
age
> >=20
> >   - CPU2 does a TLB flush and frees the page
> >=20
> > End result:
> >=20
> >   - both CPU1 _and_ CPU2 have flushed the TLB.
> >=20
> >   - but both flushed the *OLD* address
> >=20
> >   - the page is freed
> >=20
> >   - CPU3 still has the stale TLB entry pointing to the page that is now
> > free and might be reused for something else
> >=20
> > Am I missing something?
> >=20
>=20
> That is a problem. With that it looks like CONFIG_HAVE_MOVE_PMD/PUD is
> broken? I don't see an easy way to fix this?
>=20
> -aneesh
>=20
> =
