Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A88675AD6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 18:10:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz5c34tDxz3fJN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 04:10:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=rHkFr5mW;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=NsvoNw61;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=rHkFr5mW;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=NsvoNw61;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz5b21QWfz3cFW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 04:09:47 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30KGDxll015101;
	Fri, 20 Jan 2023 17:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=hIAjDCJIkyV7Xvx6jxUm7df3QS3DzaAMMvkrTMRP9E0=;
 b=rHkFr5mWohPtiZwdWxgKLUvCds1A8XK6sQfpniP1GvrQyRbe8EfvPW8JKXCe2sPpiNJS
 HqXsHT8vwtnOCN+awpYHEDivkgDP8FzcQsLX/G2e14iIw0wzriyKClEcztya9ewzT6I3
 hmSt3MW4AGy7YzoShxFNW87Tx/jweaSACodrQaEfhYbfZqeLjnmCko9Xg3WXDn2si4FY
 HUEBqnT0OxCacQffA8i4vvkDb3wt9Js3zMiScir+z5Bcd23VJ5eRUC4MxDHROg68vPsb
 M/ilNB6KGUVL3HrDg25f1I7Ji9piAINJNJIqsYZBRW5+7a7BkR3bgUJiORbVmBwlWFhU QA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n3mxtd5kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jan 2023 17:08:44 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30KGZ4gA027915;
	Fri, 20 Jan 2023 17:08:38 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3n6qudar7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jan 2023 17:08:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+qTdvTnTQeSwo1SQKBuBwiRKXH2CiKx+K7celNHud21CcngcX2oOTk9BMbPvRppmGqqXT42B5eQAMqoE70stvGYLlseYF5BvZgo5IaAb6gXF3RkaJPfWyRKPhhlgHaeS6ywoqHF9d4gFfQ7887WRkYgQ6yxfDoWMAAUwxBO88f6AqV5J+tm8N1ZVK1B9LW2crNBpYp0r+CspO4xdChPAhgBtiQSCf3RpsWPvDnGDrDqUbhiYTIjMyAzm25MF1hSv01kGvu9IOUFa8BPZm/PHeaVfSJ46SypST66l/+gGEUKM1qVpOxay3BCq5GKMgpvJUfjabAbkasDASsjcXL/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIAjDCJIkyV7Xvx6jxUm7df3QS3DzaAMMvkrTMRP9E0=;
 b=VcBFtF7dOHA/MNSZ7RIeYJHUHyf5lZgsNdFpXKNnXX3x6b4JAsGzxSzSL2ZIQxT1DNFF/7Iy8Jr7rKEpK8hlvh6j8g5JWp3fWgSM1c9tnzAK5qbth0WZTAL2Na43JLHe6WDbZZ4xw6g7N0wtBHbvupQjBvRtDlymje1yF9/vtxRTvYMnYv4Yxf0TM/YDeWGK5zpkXZuK/fEFoPaSh77xVvpPNh6q+6/Zl+MYmx73HidEukJhUfpLkG3Rgqbok/lYMlHJ5XxckPOofF2xlZS3I5IOm7RJDEVPcrtSJMUosblM6ZPNlHkm9yLd5LHpNGaASBFRFh7w13OMFgasfncoTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIAjDCJIkyV7Xvx6jxUm7df3QS3DzaAMMvkrTMRP9E0=;
 b=NsvoNw61uNv9zG8cUNKUm6LZnxq33GDIeDzPg33Mlyi14VT7r39+Xgb/5HGQAgA2izFwfrDWnpU8d1M5Ao5jqIcKl/daL0ez67i2uc8RGHimOOABqYpVLBFADK7KyMBcMyq06LfOjkIxaGmzpU5CPw3n2cLkemspKA7Ek3Xc/tk=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by MN0PR10MB6005.namprd10.prod.outlook.com (2603:10b6:208:3cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.9; Fri, 20 Jan
 2023 17:08:34 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::7306:828b:8091:9674]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::7306:828b:8091:9674%5]) with mapi id 15.20.6043.005; Fri, 20 Jan 2023
 17:08:34 +0000
Date: Fri, 20 Jan 2023 12:08:15 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in
 vm_area_free
Message-ID: <20230120170815.yuylbs27r6xcjpq5@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, akpm@linux-foundation.org,
	michel@lespinasse.org, jglisse@google.com, vbabka@suse.cz,
	hannes@cmpxchg.org, mgorman@techsingularity.net, dave@stgolabs.net,
	peterz@infradead.org, ldufour@linux.ibm.com,
	laurent.dufour@fr.ibm.com, paulmck@kernel.org, luto@kernel.org,
	songliubraving@fb.com, peterx@redhat.com, david@redhat.com,
	dhowells@redhat.com, hughd@google.com, bigeasy@linutronix.de,
	kent.overstreet@linux.dev, punit.agrawal@bytedance.com,
	lstoakes@gmail.com, peterjung1337@gmail.com, rientjes@google.com,
	axelrasmussen@google.com, joelaf@google.com, minchan@google.com,
	jannh@google.com, shakeelb@google.com, tatashin@google.com,
	edumazet@google.com, gthelen@google.com, gurua@google.com,
	arjunroy@google.com, soheil@google.com, hughlynch@google.com,
	leewalsh@google.com, posk@google.com, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-40-surenb@google.com>
 <Y8k+syJu7elWAjRj@dhcp22.suse.cz>
 <CAJuCfpEAL9y70KJ_a=Z_kJpJnNC-ge1aN2ofTupeQ5-FaKh84g@mail.gmail.com>
 <Y8pWW9Am3mDP53qJ@dhcp22.suse.cz>
 <CAJuCfpHeuckG8YuNTgdDcNHNzJ3sQExD_f1hwXG_xmS7Z-925g@mail.gmail.com>
 <CAJuCfpF20nuP6Meib9h7NVrJv+wybYS==vZFQXxUW6n-ir9bvQ@mail.gmail.com>
 <Y8rGJq8LvX2C+Cr7@casper.infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8rGJq8LvX2C+Cr7@casper.infradead.org>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: SCYP215CA0003.LAMP215.PROD.OUTLOOK.COM
 (2603:10d6:300:31::18) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|MN0PR10MB6005:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c5c1bdf-8826-4e51-a397-08dafb08f68d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Vf/5NgiBLcpRS9D2pd0KpESYJXFapWWfU0j1AAMoFdrWd2zX0E2IV+ODjPb5bVQ7/Wr/1tersvN0botO4FHzMhADDnO4gupE7JyoXf6acEgPcqALqwKNIuQ5aODpzVFZxN5a0/hD+pvrgDwlkwPPsPYLO+Y1rkkfOo4zXQZt+YMXumw23L0SETmyof2Zpr+aoQ4aidw9GwiaKrBdkqdHiYW/OKo0gC/8PlFpoi1Svym/z6YYkxh6ZDQAU8X4BqmpHsjLtKdZdL+Gocz0ld49yw/Afb/TMsxKwuwSEV0ssoqBrCh43nkIqS37M6lobCSdPL7SkD/aRoM2sL+QG3NP7yfk4QzPTEjss0IEQubUKqdr/wH8yGOMWmoWnB8TUHP4n8vkgU2Jf4odOgPo7+N5316/72WrYgGLLmW/dBISfTj+EbDTpi9siiprvZaCYGq6PzjManws142Zs7YZJ1oLtBqTFingE+LsVG2Hi2GJxk/nzfR8lCq5NsDFGHGq9tqlmt1BeT3Qvq8YSRA4+g8tptGltuX2MiGVt+Mzmyv7dFvdDU20cLL/mbBjNLOPSyFR3lVJvKl1/+OJochb7sEm1NP2cuiecxS94c5MhM2arfRKN3iCLmPjvF7XhU2MEQyAUFXK4qBDDZipu4MXagdqiw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199015)(6916009)(41300700001)(8936002)(83380400001)(66556008)(66946007)(66476007)(1076003)(316002)(8676002)(4326008)(54906003)(38100700002)(33716001)(86362001)(53546011)(7416002)(5660300002)(2906002)(7406005)(9686003)(26005)(186003)(6666004)(478600001)(6512007)(6486002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?kaXRpA8ciJSLTcnT8FlPEbxU5t3FKre0MruHvV+S+v/t8xe/WDKfXrSg3YtY?=
 =?us-ascii?Q?D1tRgsrR6oY25x8gLSlaNRYXErnkyyk0RkqoXcZpsxwrStHgw9+qsrap3QSf?=
 =?us-ascii?Q?CJBSERjy1XStkcvnhAs3qU/DLAeFudNFWqzpG6DoICQu73XFCFijVArZOwnE?=
 =?us-ascii?Q?eSTjnBdPG6jUOzeN8EJiJO4Dq1aVD2M+lMyr9Qc8YGfaddXoZRStUrWRZKlZ?=
 =?us-ascii?Q?RmmVzmmqOde7hnsdMynlLfLpfugeE+UNSmxseqFFvZ9qRyts5Oq1rj1DBNA9?=
 =?us-ascii?Q?itWMCupnH1p8c/Z6Qf6JCDgsXpN8Pl9AINI+yAhVcm+ewKOZv6iN4Kih1B/m?=
 =?us-ascii?Q?A3TpQr2h762mmHtfc/y8yGe+IvnTus2AJ5Ovq1UPJg33qKUYh70R4YGezZc0?=
 =?us-ascii?Q?jy7LeBInG3NV4pwnvHPaHPEYYcDK1kjkaKqfmkaOYQwJUrqAZlI7JFYL7tui?=
 =?us-ascii?Q?E6i69QcrnvyOsaOB7+CHkcWVWlaxO9Zs5ohi1dKdf9oi1bZP+3x8HuTVWh4j?=
 =?us-ascii?Q?AfYt2+qlzIORJFb4t/atPDG30nWiB8pZnRvPuMyKlRMb74uAkvCK6xRDtZW/?=
 =?us-ascii?Q?D5SjWXjeNCFIKHseKdCJYfovzzqOyvMHAolTiczCrxhEIYYeOUjZtvtBKfHB?=
 =?us-ascii?Q?MH0X+NcunhiTB0i3x/4RUWjLpewv9sI62oFfw5xxrMzNux0HLeLNJ1xPtb/6?=
 =?us-ascii?Q?qarNUR4vjdMFssPJegz3gpht92/xAsNSom49VVkbEcAziMeE/Zn10qKnIkxW?=
 =?us-ascii?Q?wGSCA+95zaTA/MdUtgpngwtrx6s/AJRMKX2b5zyeog9EUz1sMzBbf6Y40lmL?=
 =?us-ascii?Q?AAsqfqso+Cf7zulD8DJgmIQYu0lo+DgEPhMdoAGZ1xG8fCYt8BujAoqIc3Mg?=
 =?us-ascii?Q?19wmbWSm3ZkDsqADc4fP31Kup6xylCEeR9HkFIG52QvYf58l6u4Ah6SAbYlA?=
 =?us-ascii?Q?Knnda56FKgXKxFiB9+a3qgFNWVjMUD6DAoCoa/6/3o2HkF88RI6Lu+2BRV0i?=
 =?us-ascii?Q?u4NVkStMoXLblTSGWimyY+z32eILQMnhQXxWP6O0LAh7iNs5JhCPsjkqFbS+?=
 =?us-ascii?Q?ulC1LHfUpMwDIX3Kf2RW+taBQ+h+lQyam2nN+gsfa3qag1T98v8+Q1IgeeHI?=
 =?us-ascii?Q?p7XElYAou3UOAi/+2Qz0oPBsGNP3wkrpOv1p2tnwZfcoaxUVFPta6d/keB2Q?=
 =?us-ascii?Q?OSDlfiKiMGw7EoWl839tzPfJB0xgnXtXJ1GPai2o1LKLUF3Ovpwa6dbcEnk1?=
 =?us-ascii?Q?jeU3CKhRfH5lCsZdCTsZQlOw30TzLe9vKtqfxfSS95ckCgoMDr1I3Alu72j5?=
 =?us-ascii?Q?4C7FBJqznEQSjkr3m8JOy02RrKIGME6iCWjib+SmdMTcX/UIIKNxYW8q2CIN?=
 =?us-ascii?Q?aucaAJZIoisqCtJIVnPxxXW2PoeMCJPiiC25Y2GmcKX6/6zRxINuwOfSH6yK?=
 =?us-ascii?Q?KPfJ/gsFEPB4DwZ/sA9QdPs7YOu8EQDmU2OwsJp5vEQUD0SJ2UiLcuF+SslF?=
 =?us-ascii?Q?jEGmtP0hLMGtyrUTIB3QkAyOG/jyvoT2m8l9Fm51BlBhl09T6luO3Ph65KqE?=
 =?us-ascii?Q?57JpWZ3xxp9Bcj5txbG/l6CAC8WgEgzeu9B0KNSqTHqP/fbSOReqdlR/ZPUW?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?ynL1LT2h30mNXy3xHndWdX/TvQkQsT2SpZzg5u7nUUggVeWeZxTkCRS1uGlR?=
 =?us-ascii?Q?nx2r5HaFdJb4dcajrKjXSlSqeXRFqaPkkGJ2MX9L5aw+UsgquGGVyf6ctb51?=
 =?us-ascii?Q?HrDiNp7SaomN9I2VCPmZ6dT3L0TgHdyuqwxEf7SviuxXzU4pwBSIiMc4Z9tE?=
 =?us-ascii?Q?s8SxgcQhrHrtnrcGbhvx6eMJWW+r1dc3C+7pr8yX2x9Xin1fnPybWxms9dx8?=
 =?us-ascii?Q?Wt18KAUxPM5Gi50alB6/qtJRt/X+znRJffoqFYIva5WiBaRs9u9sAJcoOATz?=
 =?us-ascii?Q?IZztzrBtM8koNbYq2LqEinALJQPQIMFh3Fd84Q224SFJTQ9XnQgrIbqoJ/77?=
 =?us-ascii?Q?7XmYk558kiM3SsUhZcjfrYR+iFxqq+EHaHyUDxxfKAnZBZG4pCXnS+k67q6E?=
 =?us-ascii?Q?SBUohaoW/Dwhc/Myl+L58eUFHAKx/JN0YRpURnDdQlplvzwjSkhsm0G/3cnB?=
 =?us-ascii?Q?4vw7huwZ5CQ5LjF0eSvuOb/EprH+NpuBOu1HxtjoTrbWAgx3EIyOIX+dFA0o?=
 =?us-ascii?Q?q0NhP9uHLvZBImDUZGKT/iTIC1R5177yVtVvG0vyMDPRnPJzFnsY2NHsX1gU?=
 =?us-ascii?Q?r6m78cRxbyp2BuF9BPWN0ubg2hzoCzEHEM97ZNXU/jDj8gJH9CBvoDz/pNLY?=
 =?us-ascii?Q?KpX3PhdJLEEdLk1aEBnhyoZ2W9I571LzfSNf1mKpkEq0yVS/YmoIDxj/Dogs?=
 =?us-ascii?Q?wTemqlgjgl5SYXXbw3pYyxAvQYmWK64I8wt72D59Aip29Ut3zH59j4zaZwZz?=
 =?us-ascii?Q?0PAe3WAK2n7LSJdpELRr1TBRTDMST4mmYa0rdkrWaxfjGRfmpHyGudavfaJr?=
 =?us-ascii?Q?1y7Nf8nnPVriy2qG6WUZSBLbIAepZ+tu4MjhS7z7wXCf4v8+F/tLDNBRyr3H?=
 =?us-ascii?Q?BL9AtBj5zzqdOxPG4l1bA/mk+P5/e3QeuW19BbrUmNJb1bvhnUqorbDVJg5Q?=
 =?us-ascii?Q?SuZ9p6svaotTWpR8UH8ozVbbq2T9FDnkQM4xw9sV9JbEPkkHX6kvagr+ZWdY?=
 =?us-ascii?Q?Xa7/RTFlygNxS3D7FsF5ivaA4SHB8Q8WukV4pGxuYUdH1+4QEbCJR3AQ62Q7?=
 =?us-ascii?Q?ZOw0egh4Mpn7EOGrWfXcmVm/BGj1ktxWVq0dmU+VjMX0I1Xqh5ltPOf2V9ZO?=
 =?us-ascii?Q?JzAsIKqTkFw0N0q6bzMNcGj9UA+xVdZrNdlTPi4AgrqgpNT1ESB8UJUxgCTa?=
 =?us-ascii?Q?mMY38RSb4x0Le0zLzbcCcU0juGjET0HFmA5qYEXO+6GHLINnSCpwFgtatqq4?=
 =?us-ascii?Q?sNpLGLLOm4eclGwj6d3im8zey9QxD4/D9qPwClybjjhnmEA8DJZTqhI+YTXp?=
 =?us-ascii?Q?AmZWBj6+3QB4onACsfSgiYzQb6IPtSkumS2/E5crCG2L1HJdS1JoHtSJnvR8?=
 =?us-ascii?Q?a0V+srVQwi3ykhgKTTZU0HUgi1lnOlGgvTg5GyD+nf0mzumK29ILXZ9v7B3I?=
 =?us-ascii?Q?dDuFThhKYlKjJgU3d+BC4coYOcfERM4TTxoXDpJv86sykJjiIm2W6U+gpDXn?=
 =?us-ascii?Q?x2mMiFfswaD6iZ0+nmmfeKU0j+6xONQVmib7?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5c1bdf-8826-4e51-a397-08dafb08f68d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 17:08:34.3946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQZXM//pXjgDcHWrgZYGRzqLZ/+UCybXd/TW/Jcwh8lehOWQCuuLX3uiIuPyI/Ib/9AjaFDq/puVeMX3W734iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB6005
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_09,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301200164
X-Proofpoint-GUID: UG1YrPNHsYVTSLOF9E4iOvTDWHilwB-8
X-Proofpoint-ORIG-GUID: UG1YrPNHsYVTSLOF9E4iOvTDWHilwB-8
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, Michal Hocko <mhocko@suse.com>, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, 
 mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Matthew Wilcox <willy@infradead.org> [230120 11:50]:
> On Fri, Jan 20, 2023 at 08:45:21AM -0800, Suren Baghdasaryan wrote:
> > On Fri, Jan 20, 2023 at 8:20 AM Suren Baghdasaryan <surenb@google.com> wrote:
> > >
> > > On Fri, Jan 20, 2023 at 12:52 AM Michal Hocko <mhocko@suse.com> wrote:
> > > >
> > > > On Thu 19-01-23 10:52:03, Suren Baghdasaryan wrote:
> > > > > On Thu, Jan 19, 2023 at 4:59 AM Michal Hocko <mhocko@suse.com> wrote:
> > > > > >
> > > > > > On Mon 09-01-23 12:53:34, Suren Baghdasaryan wrote:
> > > > > > > call_rcu() can take a long time when callback offloading is enabled.
> > > > > > > Its use in the vm_area_free can cause regressions in the exit path when
> > > > > > > multiple VMAs are being freed. To minimize that impact, place VMAs into
> > > > > > > a list and free them in groups using one call_rcu() call per group.
> > > > > >
> > > > > > After some more clarification I can understand how call_rcu might not be
> > > > > > super happy about thousands of callbacks to be invoked and I do agree
> > > > > > that this is not really optimal.
> > > > > >
> > > > > > On the other hand I do not like this solution much either.
> > > > > > VM_AREA_FREE_LIST_MAX is arbitrary and it won't really help all that
> > > > > > much with processes with a huge number of vmas either. It would still be
> > > > > > in housands of callbacks to be scheduled without a good reason.
> > > > > >
> > > > > > Instead, are there any other cases than remove_vma that need this
> > > > > > batching? We could easily just link all the vmas into linked list and
> > > > > > use a single call_rcu instead, no? This would both simplify the
> > > > > > implementation, remove the scaling issue as well and we do not have to
> > > > > > argue whether VM_AREA_FREE_LIST_MAX should be epsilon or epsilon + 1.
> > > > >
> > > > > Yes, I agree the solution is not stellar. I wanted something simple
> > > > > but this is probably too simple. OTOH keeping all dead vm_area_structs
> > > > > on the list without hooking up a shrinker (additional complexity) does
> > > > > not sound too appealing either.
> > > >
> > > > I suspect you have missed my idea. I do not really want to keep the list
> > > > around or any shrinker. It is dead simple. Collect all vmas in
> > > > remove_vma and then call_rcu the whole list at once after the whole list
> > > > (be it from exit_mmap or remove_mt). See?
> > >
> > > Yes, I understood your idea but keeping dead objects until the process
> > > exits even when the system is low on memory (no shrinkers attached)
> > > seems too wasteful. If we do this I would advocate for attaching a
> > > shrinker.
> > 
> > Maybe even simpler, since we are hit with this VMA freeing flood
> > during exit_mmap (when all VMAs are destroyed), we pass a hint to
> > vm_area_free to batch the destruction and all other cases call
> > call_rcu()? I don't think there will be other cases of VMA destruction
> > floods.
> 
> ... or have two different call_rcu functions; one for munmap() and
> one for exit.  It'd be nice to use kmem_cache_free_bulk().

Do we even need a call_rcu on exit?  At the point of freeing the VMAs we
have set the MMF_OOM_SKIP bit and unmapped the vmas under the read lock.
Once we have obtained the write lock again, I think it's safe to say we
can just go ahead and free the VMAs directly.

