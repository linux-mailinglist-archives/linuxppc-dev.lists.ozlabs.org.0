Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4D1675DF1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 20:25:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz8bt4lS1z3fHV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 06:25:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=hgQlpWQf;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=NSgqWeOd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=hgQlpWQf;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=NSgqWeOd;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz8Zs4l8lz3bf6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 06:24:52 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30KI41xE016902;
	Fri, 20 Jan 2023 19:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=hM1ruYeoUITTty9mdvyvmgIV9gLfuMQ11cC8pe6NbL8=;
 b=hgQlpWQfw2wYWN+Dn0Q1IbzX77pcYX7Qowq6Q285UTRLrOSO1vywQKpyeugCKeFQADXl
 dPUzJp7yAVLThzaZWLzFiGskCKwD+LwzXoVBoZ5DICS1YFU2XVLKGVvMlXRBcxDgEH6O
 XKMQzd3GUwPlRHz/JqfI6Ud4P7ppb5pnoudjxzA2JLEAlK9lrNx9vNEBF79PF7si1sGv
 5/5x07YPGHdbBW+I6GXWMCUtwjp1NSZ47o83jZeDVWQPhlMsCfTQaCv+c5Qdb1+t8Lis
 ooDMqzbUOrmiX9bEZic3a2yMhCewuJlJocK/7L6wQKiv5MQzLF0QKWb7fcH/uZ1/2pi9 aQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n40mdmw9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jan 2023 19:23:53 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30KIGZL5018680;
	Fri, 20 Jan 2023 19:23:52 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3n6qujh80q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jan 2023 19:23:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PckD7YIB+LtiOA/Yz/typLwyRotXkCXssFLzBSsK0Y+MoTRBf02hEAzc2IUQ8sbYZKfM5dxje/rI7Igspyhb92xAzMBwQImFK8FLf6hwCWzidarHSAY00yWFJCv5G2qGpw1rnU9gFRdqM/EQ3UbdUAP8J1qNbM1BNSvIAGo9DHhP2+rM7bn1o8hvqls4K4GrX3BC6yO7PjIgtmA5ffhldhcuQPP4Z+deIILVNSJoV/ECniXRG1s65FapaMy5hg85lSmVLCd7y7WdyBrxnQtwyH0x/4QCphVbqs27lGpIU/R4eQ6DTTwrkCLj+o/PqRA5yswSe3z88YfQ/ZjBANNBwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hM1ruYeoUITTty9mdvyvmgIV9gLfuMQ11cC8pe6NbL8=;
 b=MsuiWbCIlaByLBVsId66fefumfKTTEqsNltwM8cjprqrqOirJkEzoc73FthaZnonq7XHRkmmGuadCj81ctl7XdML8cOFBvBGK8yrSOfgRz6umNwPsynjxtdpYZ/BREvg1kJuUPftmUHYWFDXehcdxeuPyPzrAyuag0lKJUTIVyIDz0CsaJLClP/4qnlP0syfM4Kb4a9nqW+a91ClZksDf9rji5m+W9ViZ+NYiBjNh026VukFZDwiOF2pVeKt1MFtCDNfQkvaFame/H7hKDDd/CdzOgvfqyKJ/F5XSsJCQdNrzytjpwqfmXncsOn+U4I704HNH3i/5fSMSoQ5sNE8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hM1ruYeoUITTty9mdvyvmgIV9gLfuMQ11cC8pe6NbL8=;
 b=NSgqWeOdgAj4XEzOTKJeq6kXTMuCX8MDGP4ggOlg6VIi2mcr7eAvuW5GllVX/ZFMpz4Ld+7Yfq4u3S4Qoi6/W/CaCGDypp8lNnqsgfKeDx2+wqiN2SKKhfzWxXxd+vo/9RzI8dc/DzKwKEfNv7SGSSBLX9Gd4tmPWJnkGHFsfTA=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by MN2PR10MB4173.namprd10.prod.outlook.com (2603:10b6:208:1d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.5; Fri, 20 Jan
 2023 19:23:48 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::7306:828b:8091:9674]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::7306:828b:8091:9674%5]) with mapi id 15.20.6043.005; Fri, 20 Jan 2023
 19:23:48 +0000
Date: Fri, 20 Jan 2023 14:23:42 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in
 vm_area_free
Message-ID: <20230120192342.y4ph7i7amaoi6pxe@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Matthew Wilcox <willy@infradead.org>,
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
References: <Y8k+syJu7elWAjRj@dhcp22.suse.cz>
 <CAJuCfpEAL9y70KJ_a=Z_kJpJnNC-ge1aN2ofTupeQ5-FaKh84g@mail.gmail.com>
 <Y8pWW9Am3mDP53qJ@dhcp22.suse.cz>
 <CAJuCfpHeuckG8YuNTgdDcNHNzJ3sQExD_f1hwXG_xmS7Z-925g@mail.gmail.com>
 <CAJuCfpF20nuP6Meib9h7NVrJv+wybYS==vZFQXxUW6n-ir9bvQ@mail.gmail.com>
 <Y8rGJq8LvX2C+Cr7@casper.infradead.org>
 <20230120170815.yuylbs27r6xcjpq5@revolver>
 <CAJuCfpH4o-iCmzdUcYD9bKieJ6-k-MZYLuHFhH+bN9yE07sibw@mail.gmail.com>
 <Y8rQNj5dVyuxRBOf@casper.infradead.org>
 <CAJuCfpG3YaExGkzsSSm0tXjMiSoM6rVf0JQgfrWu4UY5gsw=-w@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpG3YaExGkzsSSm0tXjMiSoM6rVf0JQgfrWu4UY5gsw=-w@mail.gmail.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT2PR01CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::10) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|MN2PR10MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: 7de21b3c-3728-481e-4b41-08dafb1bdab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	cUdjLH2xgyxdla30MK6uVmFYKlSXDUGwTPuWetKvFhhHMiEW18B+gsSQMzRC2qAkVrFGtQ4EIyQGdrfY5PcjtaoPELhzi60AzUk53A61GOnwdAVZJKQOAEqV8UYU1JDIswJleH21Pgt/fZNExv8ezRaT+Cq0reLaznoG8MmiT99PgMMLgmPjJcwXK0jRyg5lpG/zVN+bghgerP8aLYEH3RGKcb4+NPWXjBoM3UU2ID9h5OFxPu507VGLr6xnGnJpAc6DuzmvRDW7BIr2YegHcBitpPDPHry+kSGdlVJlxoi0MA6gd76ahSgFlRs8dbz2+boqzsB+ANMYtX7IqTsqTHSnA96ljA7h72g2f7z061ZjJzFeoIXJCqkw2ULtJ782G2NDYDcySrWJaRnhLBM5PCbsJBxn56fewLpg5GFOMOkco5sUIvi+BvxlDOIPylbTbDo5pKCfwI/7vot00QbMM0zTA57c/7On/LS6yzkiw8ujvgnWPnViOUgj0/QdUyCA4y9Qzl2BfmD3BWW5jWMWqehLt7NdY3yQNH/uA9xtZndk6C3DsR2YgOs3M/hESHwY1sCfZR3H9LJ10Zy3R4SYuJhEzLeODWJ0jNewzDEeer2lByc74cYPgkQdkklbTptwnNvcEEHIlIEsaTqn9tTrDA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199015)(5660300002)(33716001)(8936002)(316002)(86362001)(478600001)(6666004)(6486002)(6506007)(53546011)(6512007)(2906002)(54906003)(83380400001)(1076003)(4326008)(66946007)(9686003)(7416002)(7406005)(8676002)(66476007)(6916009)(66556008)(186003)(38100700002)(41300700001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?GImipVJmyxk+ux/0h2l+d4HJtSL4rxh0BiF2HMKyync/6kqPo1tzwPmS3KJw?=
 =?us-ascii?Q?lCXT60UTXYuY1wOGczUCW2biEMFk8/Z+em3KGHKidn9MQbIUZ4bI/YErZd4D?=
 =?us-ascii?Q?DNNCr408Z3e8USUYL9XTjt3wxrzyM9/Qf8O1eyjAr/IJWCwFGx43rdbzQfq+?=
 =?us-ascii?Q?3JnE7DIBbXPvd7UZAHafCThlGVIJKdgeqh7hSYRLkqL9WLLNaZyCzbSh7fQz?=
 =?us-ascii?Q?jOvyd4Ze5bFlOoNatSMJLskx6xzVh8fTs0qHqFfrtnSTCdn3Z9+diaN6iuad?=
 =?us-ascii?Q?JbUGs4wu3/01aAhLRFcqc5UkjXouSjONpR12cfDiFiDLo4JB4W3SmDLJBzy8?=
 =?us-ascii?Q?PY78d5hIfHnh3I0Q1x6tt2t6o8d/5zWmLq32WtfHqmDXPNWXwPmHyZTipPO/?=
 =?us-ascii?Q?tictaxd6lXCm3CCQBiO33cLOMxO5sbJ47DsUQ4pscel3xDUsFxgnfRsaX1AS?=
 =?us-ascii?Q?g3fv4B3JoTupI7PWyjv5m/O8wpenognxPaUUy7RQRHzF97m65TkQc2Kq43d+?=
 =?us-ascii?Q?NV+OUtKi28cC+WRxKR7uxYVcsTXkV2a5X+b4c3k7x4uPLcUv4HCR5puvNCVT?=
 =?us-ascii?Q?Z22Ek+Mv5nnL9A5ZK98IjWYUz9200MjhqQtBNPqzM+m7clZCCj5dmmMAa9HJ?=
 =?us-ascii?Q?gxrwOX6UuqE+Owuwc7Of5Wmj8fhDM6InR9x7/eE+ghho3M6eqPjE1xN8F3U/?=
 =?us-ascii?Q?DMJ/JYAdrBXTcP3TGNfvJxDtmcr4bPK6a2ljeps1nbQU9qZXS1XMLbXK9IHU?=
 =?us-ascii?Q?Y6o2pBZ4XxB/84IXNyz6ySJDkTGio6adt0k0VIerfLOvXnJGYHSPe/xDcdse?=
 =?us-ascii?Q?4X8WaEpTJhGY1O8lDJVLA26guIxw7JmS/5Snj3oyfBYDEUBts2c+8E3aVO/4?=
 =?us-ascii?Q?tmnsJ2fDPbjc71ppEkEe80dkRPRjIl2aXJoW0ta/bXvILdxTNG6cgfUS2QJy?=
 =?us-ascii?Q?6lJk9fo2/w8YgTatFvPEURhsKqHNsIHceGpmK7BBoQyYFdSTxzCIRLeykf9P?=
 =?us-ascii?Q?IjYFMs9AUlNu7jiM/+yFWdGvNAHP9fxVxW/T2HtblRDSet6RJjoQELplM2MB?=
 =?us-ascii?Q?ehwe6apv0a5V1eckkbSloJGrdRlP9EvdMYiLDBWNc2Qq+f8kqpseW/kZ0nHs?=
 =?us-ascii?Q?r84cpQSLga7CmnNWO8SQCWAnpkTSX4vB6VdWaHs22eSAmVdgcUIIrLYzF5sz?=
 =?us-ascii?Q?OydiblghwPBca4bJqaxwwabLcMtJfaA8I/bHvYRJXXBJUbyCaQf8Bot53aBv?=
 =?us-ascii?Q?p7NfuIB4PZYFjYr1YOkIHaI0GIaDbPUWX+LNdQWLkVwluxx7BO5/bvvfa5D0?=
 =?us-ascii?Q?8bqqTQRfTvPnXmN7p+HilToclCvPwiKlTY9soyeV3ngh1rDqNY93LITfvmfE?=
 =?us-ascii?Q?Pku2FRKMMxclRKdxIAQiquOT757ejToDTvcDssVOKfq+LPFJNKx5KqskQRhp?=
 =?us-ascii?Q?3L5s1h4vW9uFpcI+smpL6mzT1OVZnSOj6Y7CdOWhxVrIRDm/WZV5+TTIPIgh?=
 =?us-ascii?Q?dJY1QqlCRlmyD+h6NEONlQuHGRkBU/3+kJ/QzABFDfoDCjcUkHrKOGG4iDxP?=
 =?us-ascii?Q?vkizS3redB64kzefm2Itrorjc9facJm5TNl8+5AMiclVL/rifmfr1QTs8fZ9?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?VuHrwNHRcI/zMyyxasna0WGfMIic8PKKm+k/IaW2Ln/wzD14bfovfuZbkQlD?=
 =?us-ascii?Q?J8+6RH+ygVZMvGpwrXZfUM+ZkSnRoQiQME+xsii1zcWS5wffL486/gUdME/h?=
 =?us-ascii?Q?VwBzjivBQyfoe8OA6I5WPCW1HOEjoknk8ZuSmxl2qfD3+oE+XmlOvb27mWB5?=
 =?us-ascii?Q?gaBWpYFQb8MbwCxG5e0f2LM4fGvB4Qp8kqezq9BO37Kjq2CeOvzWZZ/wf+lz?=
 =?us-ascii?Q?YQAPcgSR9Nkz4lFa8l08QXAyyAMeQOkQVELfe9xScY4V9f56zhn04gyf/llH?=
 =?us-ascii?Q?EEd8PWfeVuFLcHFu84rrYsw7OgqL5NcKlx69niunnQbAGEA+vObXYchkBh1O?=
 =?us-ascii?Q?NItUNJ45vtuywKmJjSw4MQRA6FcSurmBBaIHZK++Cv2maEI0xGoGGzfPdEk5?=
 =?us-ascii?Q?Kgw2q4ODH41Xe6H+l9006tvqqZJz325le98eLqDNqsxx65unGlaQoG3xaEFc?=
 =?us-ascii?Q?ohPRXf14i1HPuHQD9w2XQ1pdcdNAoqHT2s3CbVkeHGw97AQLCaUS7rVJhEgB?=
 =?us-ascii?Q?67htPxEiek/BnK99kGaCqXUgeEvRTcegcFlXnHTPzjO0x0hIZ11lvxsBxAJa?=
 =?us-ascii?Q?VKC6UPY9fJX1LM0sO4mmfQUgbc5fzHQCkWabn3lrT5t+eW4m8RwlAbe7lYlv?=
 =?us-ascii?Q?iG8dI/RVrVHDscsO+4N0mjLHIee1cZ45DVq+AvnZLITdYkwu5CRGNxQsMwuw?=
 =?us-ascii?Q?cx9RG7SvMhNONk8aK+7VRxbilKyUwZIqXzh6CEHAqt/P2dBqF4SjTdL92WU+?=
 =?us-ascii?Q?V8TpQx+SCMDYL/IrUdJKOZO2KQVEALTkC+4esRL0TWGfQudLLtOPSKl1panr?=
 =?us-ascii?Q?21WjnDVIOZPyFBZJoZE0xQQPuJ13i1TSXhgxkEfiVOH7m+iutrft3OQD+kjc?=
 =?us-ascii?Q?5v1szGYJLxPg54AOy0P6VRYEoLG0ilKWn4ogQdo7a3S8vISL35edZTTdiC7s?=
 =?us-ascii?Q?oNuVgh/xEnCn1/iFobQFK6iwxL/BSknoIMaBIa79Wf20s77hLDtwIz4pRlYR?=
 =?us-ascii?Q?HeUkIehtvaGEC++Krr7VGomjAiSkQHAKXyza0uxd4MaIS9ZmN/YQgzkv/7ZV?=
 =?us-ascii?Q?DufUaJlCHEgF86uGTR5urxTYQeXZwQg+29r65VbGGXYQs9oW5GulQ/6WRpDg?=
 =?us-ascii?Q?YNcipuKdmL8LZYh2H73ZU2VGTGMmVlD3FZuSvGh1V3LGkF7RJpGLx61+NP/Q?=
 =?us-ascii?Q?V1TwlqCf6NkC9ROatMWhYwS6vTZm7vcewwWP0hVhBiG2J0KUzptzjlrjaGOf?=
 =?us-ascii?Q?Izf/AewP3GtADCbhND9ssJaWVDAS6dQmn2FJx1B2shz7YZdtsACxisaZDVii?=
 =?us-ascii?Q?j84NQw9Lf/HJLC+HV+RLf+ejDKmCVDrHSF8RfT0jcxC04V+/3Ktl2PRCFeWC?=
 =?us-ascii?Q?xnUhLjpZkSpJFhgicCFMz60IOLuJKuQ9iWDYQ0tkZ9taYRYJeW9h2STmA3ig?=
 =?us-ascii?Q?3hfQojTW6bQywS43BbtaodvfvomgWmjvkecgVUYg2pOEjEBq37dxqOLQPuMR?=
 =?us-ascii?Q?8nG9JHsN+ncMM6iz6ZKjfHJEdDDGQpZAdKe2?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de21b3c-3728-481e-4b41-08dafb1bdab6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 19:23:47.9821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0ew9M7hXgj0/ZuLJGe64o4SsyQEd1UYF1+fpHS7sQBSdf0/pfoa57WKsrZUQiTijdE5ShOYX1F1zi8wmgeUkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4173
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_10,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200184
X-Proofpoint-ORIG-GUID: 8ARVmbmcRdECxojjvT9sMPtm6lZb4j6n
X-Proofpoint-GUID: 8ARVmbmcRdECxojjvT9sMPtm6lZb4j6n
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, Michal Hocko <mhocko@suse.com>, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, Matthew Wilcox <willy@infradead.org>, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mg
 orman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Suren Baghdasaryan <surenb@google.com> [230120 12:50]:
> On Fri, Jan 20, 2023 at 9:32 AM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Fri, Jan 20, 2023 at 09:17:46AM -0800, Suren Baghdasaryan wrote:
> > > On Fri, Jan 20, 2023 at 9:08 AM Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> > > >
> > > > * Matthew Wilcox <willy@infradead.org> [230120 11:50]:
> > > > > On Fri, Jan 20, 2023 at 08:45:21AM -0800, Suren Baghdasaryan wrote:
> > > > > > On Fri, Jan 20, 2023 at 8:20 AM Suren Baghdasaryan <surenb@google.com> wrote:
> > > > > > >
> > > > > > > On Fri, Jan 20, 2023 at 12:52 AM Michal Hocko <mhocko@suse.com> wrote:
> > > > > > > >
> > > > > > > > On Thu 19-01-23 10:52:03, Suren Baghdasaryan wrote:
> > > > > > > > > On Thu, Jan 19, 2023 at 4:59 AM Michal Hocko <mhocko@suse.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Mon 09-01-23 12:53:34, Suren Baghdasaryan wrote:
> > > > > > > > > > > call_rcu() can take a long time when callback offloading is enabled.
> > > > > > > > > > > Its use in the vm_area_free can cause regressions in the exit path when
> > > > > > > > > > > multiple VMAs are being freed. To minimize that impact, place VMAs into
> > > > > > > > > > > a list and free them in groups using one call_rcu() call per group.
> > > > > > > > > >
> > > > > > > > > > After some more clarification I can understand how call_rcu might not be
> > > > > > > > > > super happy about thousands of callbacks to be invoked and I do agree
> > > > > > > > > > that this is not really optimal.
> > > > > > > > > >
> > > > > > > > > > On the other hand I do not like this solution much either.
> > > > > > > > > > VM_AREA_FREE_LIST_MAX is arbitrary and it won't really help all that
> > > > > > > > > > much with processes with a huge number of vmas either. It would still be
> > > > > > > > > > in housands of callbacks to be scheduled without a good reason.
> > > > > > > > > >
> > > > > > > > > > Instead, are there any other cases than remove_vma that need this
> > > > > > > > > > batching? We could easily just link all the vmas into linked list and
> > > > > > > > > > use a single call_rcu instead, no? This would both simplify the
> > > > > > > > > > implementation, remove the scaling issue as well and we do not have to
> > > > > > > > > > argue whether VM_AREA_FREE_LIST_MAX should be epsilon or epsilon + 1.
> > > > > > > > >
> > > > > > > > > Yes, I agree the solution is not stellar. I wanted something simple
> > > > > > > > > but this is probably too simple. OTOH keeping all dead vm_area_structs
> > > > > > > > > on the list without hooking up a shrinker (additional complexity) does
> > > > > > > > > not sound too appealing either.
> > > > > > > >
> > > > > > > > I suspect you have missed my idea. I do not really want to keep the list
> > > > > > > > around or any shrinker. It is dead simple. Collect all vmas in
> > > > > > > > remove_vma and then call_rcu the whole list at once after the whole list
> > > > > > > > (be it from exit_mmap or remove_mt). See?
> > > > > > >
> > > > > > > Yes, I understood your idea but keeping dead objects until the process
> > > > > > > exits even when the system is low on memory (no shrinkers attached)
> > > > > > > seems too wasteful. If we do this I would advocate for attaching a
> > > > > > > shrinker.
> > > > > >
> > > > > > Maybe even simpler, since we are hit with this VMA freeing flood
> > > > > > during exit_mmap (when all VMAs are destroyed), we pass a hint to
> > > > > > vm_area_free to batch the destruction and all other cases call
> > > > > > call_rcu()? I don't think there will be other cases of VMA destruction
> > > > > > floods.
> > > > >
> > > > > ... or have two different call_rcu functions; one for munmap() and
> > > > > one for exit.  It'd be nice to use kmem_cache_free_bulk().
> > > >
> > > > Do we even need a call_rcu on exit?  At the point of freeing the VMAs we
> > > > have set the MMF_OOM_SKIP bit and unmapped the vmas under the read lock.
> > > > Once we have obtained the write lock again, I think it's safe to say we
> > > > can just go ahead and free the VMAs directly.
> > >
> > > I think that would be still racy if the page fault handler found that
> > > VMA under read-RCU protection but did not lock it yet (no locks are
> > > held yet). If it's preempted, the VMA can be freed and destroyed from
> > > under it without RCU grace period.
> >
> > The page fault handler (or whatever other reader -- ptrace, proc, etc)
> > should have a refcount on the mm_struct, so we can't be in this path
> > trying to free VMAs.  Right?
> 
> Hmm. That sounds right. I checked process_mrelease() as well, which
> operated on mm with only mmgrab()+mmap_read_lock() but it only unmaps
> VMAs without freeing them, so we are still good. Michal, do you agree
> this is ok?
> 
> lock_vma_under_rcu() receives mm as a parameter, so I guess it's
> implied that the caller should either mmget() it or operate on
> current->mm, so no need to document this requirement?

It is also implied by the vma->vm_mm link.  Otherwise any RCU holder of
the VMA could have an unsafe pointer.  In fact, if this isn't true then
we need to change the callers to take the ref count to avoid just this
scenario.

