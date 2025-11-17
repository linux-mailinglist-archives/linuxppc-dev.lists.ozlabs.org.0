Return-Path: <linuxppc-dev+bounces-14216-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F76EC637B2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 11:19:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d93ck2SCLz2yxl;
	Mon, 17 Nov 2025 21:19:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763374742;
	cv=pass; b=R7mf25H4xXeCy2na9riAt36bb7L6OAdYHbQELyTx6b/2oWVJyQOqnLjFa3+x5y7sHEeubBBUmafS5cgD+xIxVNY9ZIWZqC8pWAvneM3BNMOleVdmRpol0nT2qqUwEa7TGubuojCXRWUWQ+uMopDSIAEKAXL6RnbkJqMwjwMyDUJbLdx6LmpGBSPxldVW3MTUejSs+TLpxtxTl2+DkS54RN9ZMluS3zd3pSC3Z3QtCVQUv4F0dEiWt5sRVZbAgzWpbUEBWNrpeGEfklLZvz9wa17YeF7SKV1K/HHSerbjzqh9J229Hf+VoiGw++zI8Av5qIW4gnnbwqmtf19xyZn7fw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763374742; c=relaxed/relaxed;
	bh=whSJElc9QXLHM96Y4WkKkf8sHFkdx8KhmtZEBjI9Lj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YGvCNy3TW1nII/ip8jUBxqfymumNO+35aLBzgL9pKB2ME0E/wLHDeHHl/hHVkdexxql0H6p80cZRvp1KJQgBlwTbYzCYc3tRQHn6834lRBs6gPxMfEsJxvn5LPNkfSgzcNe3Y/6BOcORXt9tngIy0tzBn8Cp5Gkxr0vF+lUE4cx/80Zu4OX6t7XujS14m7XGyygkcB5HMnmQU7lUbekrwKXLULee/vLWaKmaXf4PdkMEs4I5zel1zv+9GEojaD8Ta16m2IbXCenHvNpbhRjq5WioiRJuK1UJ8s0gAYIPUEPKgLgVmf+8RRc+tnaRZuoHWw9ySrZCSWphezPJ/R6dTA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=lBMsE8Fk; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=rAzNnZ+Q; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=lBMsE8Fk;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=rAzNnZ+Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d93cj3kW9z2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Nov 2025 21:19:00 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AH9uJHO011525;
	Mon, 17 Nov 2025 10:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=whSJElc9QXLHM96Y4W
	kKkf8sHFkdx8KhmtZEBjI9Lj4=; b=lBMsE8FkyOH4uoAFgGdmG8b3O0j+IN5ryJ
	8qbnoQPz26JpHfETS4ZqhaXJtHFJl+75PnHpuviR/ITag8mODr4tnyJMhRBHXXgf
	+vx2ljWNJjkqVrD74NanHoABwpkO/wua72mAt6z0nyw9US0yi+//BBrd1Vl+7WSr
	xK11BJq2ouCDMZHJ+TXoPULFZTiTQ7dWDfTyxLFm2l2Fhjau3V0iDXIZoZ7toZ8z
	jxHWL5pBMlwRngBBIYCJ8On+Y+9msHvCj9WZdXETr9WKd8hivNdoh23PDrTNA2nb
	0uQRFc/BicJ3hN++w15MTfFNUgDbsK9toLPxnh1Xd3HyDMYMOQNw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aej8j277u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Nov 2025 10:18:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AH7sNYx035884;
	Mon, 17 Nov 2025 10:18:37 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012047.outbound.protection.outlook.com [40.107.209.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aefyhqtd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Nov 2025 10:18:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5xp/7H4uBrOKcTycicbGjhdtJn8SSeNy3rYweCDwFlD8HHF4+mwxctDlFB3FLVuSWXlhjov0pd1HZ6OVE/7lsklBv/O4Qy94QovnzKh3AUkKb2+kat+fj2RQ0829W9VDLNg1AQDRi4BOWphHv0kI8SWDLizglXPG5RIzMC8O6c0GgjPD0J/bEb14sy0pBaMB1pk7qUVeQHr6WkgB1UT6uqqDCQyA5AWkkrYm+5w4ib/bGh37kK0H5UvJ6KCcBoc+ddP27Gy3ex/XjximUD1L/rJG0KBVhYH2cZt1IqrIL1rpvjfa3yc2KeihwxDhG7kHUK868JdpxBuMT4oecRcnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whSJElc9QXLHM96Y4WkKkf8sHFkdx8KhmtZEBjI9Lj4=;
 b=IanF4lDg+79YqMRJ60slvRdS09Q7jaMEJcfL1dpxu1Xh/Mt8XiwoJfpDdr7vQ5mv6PgQVQF+Y0A/fqD+tIRi4mdV8iXXEYOnqIcRNbu+TWvHoaaGzdvDmLPc21NoAM/HKlXX6KjYZ4BdzF2DcH42dH1b+AZj1Aw4KTZIkpQOox+6WX9wGPaTkV41MUwVBpfiz7RI0qS6P5Q4A4ehUbt+jkPpeQJWTIZ4xVlMjoXH5U5un5OyjkdPddnDZ51x+RbUFITQ8hkIWHIXnNaUbaYp2pIH9svrcJlJD87mDcMu8APvDE+iP9dIB84JJjHcNe47bYnfEUVLWRdsH8WLC4UjEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whSJElc9QXLHM96Y4WkKkf8sHFkdx8KhmtZEBjI9Lj4=;
 b=rAzNnZ+QG9HTLL53XpKylQR3yQGDYsBF35F8R2mIyDcZfIjtIz22+jeDy6q6boeBZ7MtM+PnzGTOjMHn56ZlA8Ocu0yd4v4sIoc4DPmpoKqQwQuerolVG1fjs0V92oHZws0C3k7x3vslfDfCvHxMMWryv0vWc6t6PYC3MX4y79w=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB7816.namprd10.prod.outlook.com (2603:10b6:806:3a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Mon, 17 Nov
 2025 10:18:33 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 10:18:32 +0000
Date: Mon, 17 Nov 2025 10:18:28 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Donet Tom <donettom@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2] mm: fix MAX_FOLIO_ORDER on powerpc configs with
 hugetlb
Message-ID: <a85680e1-ca01-4e50-ab16-2544480b85d8@lucifer.local>
References: <20251114214920.2550676-1-david@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114214920.2550676-1-david@kernel.org>
X-ClientProxiedBy: LO4P123CA0341.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: 609ff2ba-ec10-4251-83ed-08de25c2a937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+9Q21kQN368Go+uT/PW6/FD7AiS6tfgXjdZp/2HOdU9sP4EZ0Vxi825by9T4?=
 =?us-ascii?Q?FKai4vKNvx8rut3cwcMigk1tjhS4IpNR6qlqbwPpDP1tm6MtSghltSzbyATN?=
 =?us-ascii?Q?JhscqOP6RWve+78hEhbwoBCUbBTrI1cQt9vkLcTewgn12kUzgXimH8kORZVt?=
 =?us-ascii?Q?GPN2DiyLlqAMI7GfUwGeVkmaBG4mJLxifO+ycgWgNC26ICyJtVVFTWUYdnJo?=
 =?us-ascii?Q?B5p9Lz0d52GQvfUxp3asujZ3C81y6DIH1Ry/GDFiz/9epPIJAd0Z8iGM/hxD?=
 =?us-ascii?Q?2Rp+cEGTlslyGKPmQRWYFgn2lxTNhm6CV1Gfm8z56/hotOU4nAOPEPNVfqE3?=
 =?us-ascii?Q?CEtl2LHy9d1UL1iapas50jjK76+L2qPGsmCcfnoU7tQahXUOmgQ5pnfh6U8h?=
 =?us-ascii?Q?s7lehztPKKAZDZInTlGpNdt8dICzvAu5sG+QMcLRxa/ILVM0XnoD1lKneEnQ?=
 =?us-ascii?Q?Qu0ygN5piUcO2byKmLLgjlkbYYGAtDyAAdvbL/tS8/iFAk5BjWZuKWKnrRv9?=
 =?us-ascii?Q?kJO2gaxc0RY65df2n744gRoi36cMMYlIlR+j3qJsnDTm6l/LVNFnHzLY2fY6?=
 =?us-ascii?Q?raBIbzzVyWYsJQ/l2Vn1RoXXngjFYZzJQRzT+RqhYN25yyHPRwt1EMk19srM?=
 =?us-ascii?Q?WmHhk4uyvY8oumQAC18la0fbH7gFsmNuMR3MaSaPdVLd5B5l0MH3LWdnS5cL?=
 =?us-ascii?Q?W9Ytd2FDbczA9PzGqJeUzNROxzG2ILT1iNONEu29/T4N3E1mp23Kel3JcTvV?=
 =?us-ascii?Q?EK2cc76wAiB/Zkpgd01/0TUUogQKSfvyAmCXBNwXwAyX0dsREjXZE1/hVyFm?=
 =?us-ascii?Q?qFjVLICiGrV8QzJjhCknBElNIcxlWuQqwjzU4F3bYaWrPjLKalEHSWNEtiyW?=
 =?us-ascii?Q?6uGYIP2pAzdnnVLAyn+GvDJJL+6+DrAIbHidEbmFHfyBcPddb7Z41aHmELfB?=
 =?us-ascii?Q?/0Zj0m2TOLak5Zl1ZHHd11cJ2qSDtXL4vRFtgqreBTv5sCdkTj8EzqbWnl0c?=
 =?us-ascii?Q?sRbVkzPRfXqMk/yyKCdVj2Q+owfc2vM4J/J982wxtwJzC0CZ7WtouKxAPuUX?=
 =?us-ascii?Q?/pGCEnnr2Su2+gPkRNc5/OyfE20tZPlU0THIy2Mep1E8l48XZfeUF6MnXPMX?=
 =?us-ascii?Q?O7QUPes5+YI2PdaezSpAl2sF9lDN+CTiy/P+FTKkYF89eoROXLHrcbiUswE7?=
 =?us-ascii?Q?T0h6rLYWMHe5VmNaLlwnDmUfEwBTH0FsarpxHHQzdAJlXRtrW/yTN5X15dpt?=
 =?us-ascii?Q?mdo0RETM/BiwDcnGifzF04+6Fukjho6syfqEjXoQAmJlqtVpE0Zq3QPFFkj9?=
 =?us-ascii?Q?SeyDt7s8HVkgcQImDyzrx/Hmbfzv5DYav4XWlzVTKf4X7xViYYqcHNI0+daq?=
 =?us-ascii?Q?QHzfmq5xJzYpkWInmK8hsquVIj0h35zzIto6raZvwvzvD+bbpwT9hkM4yvrD?=
 =?us-ascii?Q?czM7rRSzhrJfWQIOTbQ9MGpcawzEwkR0ehxNm8S112sMMcxWM3VUhw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z4mTxDtrVdu3fidKtFBoYRsFjZV/Sm9uiexbInh8UpRL8e8U0AkMyhTYKHmj?=
 =?us-ascii?Q?ayRsfVHzuKr9+HHSCH1vpki9pug/wg7GkzsLqELQbeVdV1fQ6O7TYCpgTs/u?=
 =?us-ascii?Q?SUibcsahv9yfT/kMjMABiW8wDmLzQIfYV/AF6UtNqBd+ZvP6YmH0018JYIu5?=
 =?us-ascii?Q?N6VUGP6hM8tCAqW6uaCJB/5JyDfFOpfjHHqOQVCkZjTONQ4dVFsBoyRBxf3f?=
 =?us-ascii?Q?fFD2mhL0GBHW5Lhk0+IJNChbqAYpxAN+U3bljD9INl+1Ne8TipoVU0cYkxzu?=
 =?us-ascii?Q?pJUHXWOldfHnGl1moyQspz2ml5pNJJoODOTNdosDmhalXA1m//Y1fvDjozfe?=
 =?us-ascii?Q?UGD9gLX5XLYr4NlGY31WAwqaQWzo5ofzb2kvPKYSyKyr5ffYGA9sSQ4kUZs/?=
 =?us-ascii?Q?XO/GJ+VdmGIdG5ej1Ij8AiCEo4ULbGVyRe0GU6+6Avx18W1xhqpu4PCReaXC?=
 =?us-ascii?Q?Ukt489v9V1jebjVFovgTdHnfyanrrk3aOJOdVurqKADOC3rWBBoZYopU26sP?=
 =?us-ascii?Q?JJKNPbeMgQNOMXM24222ik6zr0/BBNWZpTs9kVKZ/wyjZEJPjdqxl1Cd+mGt?=
 =?us-ascii?Q?1yZjt/4KuyHg1+CaO5ryX5ZCEdP/dBR9F4jjefahKVO3nEUqhnRutYYL8LC4?=
 =?us-ascii?Q?nVnZNX+6NWxVowhdPf2YUQmetOfOhv4B+oQr+LMv4y6OXdSJFGPhkClhzLRN?=
 =?us-ascii?Q?llz5y2CVmWDZ4864KIchpSVBVPN6P7yk7DJw6RawYKP7kiTXrTpTHMveIaNE?=
 =?us-ascii?Q?WITIZ0Kqcd/dsXyvCqlaw4wm7TIMRHey/NN5p1y1fzi4J+CQO/GY5TU6JJ/9?=
 =?us-ascii?Q?oMj/xMfsyuGXRaX/TWLGSgJp8MLnTk79vZU4nKr4C18/Z3udz3kIyuAmVYR1?=
 =?us-ascii?Q?qyGvh3dx5k2I+gUQsnGHm+kY6BxCun0kb+JPaBA6nakVLwsnP6M+Q0BPiRrj?=
 =?us-ascii?Q?00vWEnpnVu2nnmjjzVqaKf8Pvp5Zo1sTw94P+rtvsEqTL2kORz/xOXl3h+vC?=
 =?us-ascii?Q?ccUfvVghPb17evHAZ8XsfNCafbDMzmn1hTOvpBLA9pOhfgVBmKL0EZAVa5iR?=
 =?us-ascii?Q?KSO+G31Bc/BF1PHf92RFg7WJEyVJC289OTb6kxIsCSL/mRemec23Y1rgIpjq?=
 =?us-ascii?Q?dXb9jT6E/ez7+FtW3rnzWaggerFxY0KQsSuwJgSX1R0hfQtqOhpf23OM4LZ8?=
 =?us-ascii?Q?DBrCa5FPoVhCRccZxDxgaHMQSd80Wu66qk2LpEnkmEp1y8MZcKrruMxZrvTs?=
 =?us-ascii?Q?3FrP7+yLuwf2796M1dEsh7VpVlrn78guzx0ddG/m8fKQiWAAEqh6YEvA26C/?=
 =?us-ascii?Q?APfFErzSL3wxypHsJtZxZKQZ9AcM2SUyHmCdDM8Dx4IxWNLa/Fbs/JQR6Iuj?=
 =?us-ascii?Q?+IsRis9DuIRjNkpO7gTfoUqqf2twyLEvMDsyk65Zv8VYYyC0k+2yHeH6vcH2?=
 =?us-ascii?Q?kP/VyOKVHKxFvQIxmFyU+P9MbF2Gzw9r0blG5TCSdRxWhz4kxoUFIVam2l/r?=
 =?us-ascii?Q?8RbyabFPhxEA5zQAc2JdmH+iFB3FqqVhJsumOoin43ygPps6+thwbCHstu3d?=
 =?us-ascii?Q?n3rTnFCAwhTe1QHFY79R/1EYZ1LLLqMAt9SwRrT+65E8s4Na+H9NOstLGayO?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Vs1fLFV7wcl+FKHwG6d1lTNhDFgEKlNebfiLXvx+LIiM3wibK5JWWxpWToT1F9gjmNVo+fI/T5GSHEIpgsGha/tQ5GXCx9H5jreE9PkamgMr5zmVDNhzbCvE4huISjh7i1NWtv/eHNx39fPaOzZ7CPZlSvJEnpGlE6QRdZsxAXvJOyc48fWAunKNOYDIqwnms/FmTbh7vDAPi1ypxuU5nWYZEjQ0ANcT9boS42xG0AgCXkYJ6YOxxrqU8+w7xOJQC4Awkq12dYK43ibtiAI0GJZ5/vGo44iPgjqtlqiovonFzr76rger13RRrDJevvBH5WSacvSrr8+O1XhyTnHBxZ4rdMIAhgZ5SjhM1XMm45NgQL5aoM2JpNnEdNB0VWI06qtFaiDCWwLYPW4xdpGUzR1FfBt6uzKHwGJPnLZJME0/06NAkKxKxyhTnKvIabt8IKv6Os6gN837cJxXt+MmYC5CUTObLzAKjLGMMXtD0yP/fN7svVH/cIYXs6TMOEisoenKmSN0F0W/GrbUH6G1WGpUZK9OPrn6h1E7UXwb9ang/+Ec0SDr0y1Jg9ymbo8ckyGf+vFSJlkIBq/mB736Omn6WbYfhM4tbShJDRkpcaA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 609ff2ba-ec10-4251-83ed-08de25c2a937
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 10:18:32.9375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySAc1QaZ5Z/rFHeX7y+Z/b44THE5EJJmFkGfJ9w9M2w/Bo5WIjwFd/HHYgqHQ3LMx2mdX7T1vaAF4sNklJ1G5U0QzCVB4wia9nhakPJKmnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7816
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511170087
X-Proofpoint-ORIG-GUID: oNJHwxgAvoN0PEF0XJG3AD4XjVw-F0si
X-Proofpoint-GUID: oNJHwxgAvoN0PEF0XJG3AD4XjVw-F0si
X-Authority-Analysis: v=2.4 cv=I7xohdgg c=1 sm=1 tr=0 ts=691af67e b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=1UX6Do5GAAAA:8 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8
 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=1XWaLZrsAAAA:8 a=iox4zFpeAAAA:8
 a=_5h0iVJzMp2VppeC0vEA:9 a=CjuIK1q_8ugA:10 a=Et2XPkok5AAZYJIKzHr1:22
 a=HkZW87K1Qel5hWWM3VKY:22 a=WzC6qhA0u3u7Ye7llzcV:22 cc=ntf awl=host:12098
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMSBTYWx0ZWRfX1OGsv8hhCZ0K
 7p0S4PZ4JRK/cG0r1JuVvkVM0gs7zFINh0P4BIeuvGSOFTDYvEuEHMvX547jLY0Kr90bEIaBL4T
 pdJR2oQ1jGErmBXap1Gq2mvGxHoNNsm37FG858lTRbnHw/JV1WYNr0a00ZgrogeM28P9h56XWy6
 SqZ3Bm2LYHddC4HeiMeXPpeLh4eBcp2pVIbwBCW7AES2Hb1G9lvMyDh0Fc+Mp3TOIXX1GbrUsyg
 r6c+PPHRwfLvBEEEqb2QcLp/WogwGSOaWdZK9QEnUSEO/frnDr6EclzWEpOam74czINEc9ZqsEq
 aSx+Oih4xxpsaHZe1PewRdDXvEh4qq08pVYTrnkhcmMfnwp/fYn2xqWVdR7SoKbv5l0XbGUWevq
 buz896Wwjf/pwNnf+Ys/XsostAN3L9gyJtxUBHtyKXfVXdbF2hs=
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 14, 2025 at 10:49:20PM +0100, David Hildenbrand (Red Hat) wrote:
> In the past, CONFIG_ARCH_HAS_GIGANTIC_PAGE indicated that we support
> runtime allocation of gigantic hugetlb folios. In the meantime it evolved
> into a generic way for the architecture to state that it supports
> gigantic hugetlb folios.
>
> In commit fae7d834c43c ("mm: add __dump_folio()") we started using
> CONFIG_ARCH_HAS_GIGANTIC_PAGE to decide MAX_FOLIO_ORDER: whether we could
> have folios larger than what the buddy can handle. In the context of
> that commit, we started using MAX_FOLIO_ORDER to detect page corruptions
> when dumping tail pages of folios. Before that commit, we assumed that
> we cannot have folios larger than the highest buddy order, which was
> obviously wrong.
>
> In commit 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes
> when registering hstate"), we used MAX_FOLIO_ORDER to detect
> inconsistencies, and in fact, we found some now.
>
> Powerpc allows for configs that can allocate gigantic folio during boot
> (not at runtime), that do not set CONFIG_ARCH_HAS_GIGANTIC_PAGE and can
> exceed PUD_ORDER.
>
> To fix it, let's make powerpc select CONFIG_ARCH_HAS_GIGANTIC_PAGE with
> hugetlb on powerpc, and increase the maximum folio size with hugetlb to 16
> GiB on 64bit (possible on arm64 and powerpc) and 1 GiB on 32 bit (powerpc).
> Note that on some powerpc configurations, whether we actually have gigantic
> pages depends on the setting of CONFIG_ARCH_FORCE_MAX_ORDER, but there is
> nothing really problematic about setting it unconditionally: we just try to
> keep the value small so we can better detect problems in __dump_folio()
> and inconsistencies around the expected largest folio in the system.
>
> Ideally, we'd have a better way to obtain the maximum hugetlb folio size
> and detect ourselves whether we really end up with gigantic folios. Let's
> defer bigger changes and fix the warnings first.
>
> While at it, handle gigantic DAX folios more clearly: DAX can only
> end up creating gigantic folios with HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.
>
> Add a new Kconfig option HAVE_GIGANTIC_FOLIOS to make both cases
> clearer. In particular, worry about ARCH_HAS_GIGANTIC_PAGE only with
> HUGETLB_PAGE.
>
> Note: with enabling CONFIG_ARCH_HAS_GIGANTIC_PAGE on powerpc, we will now
> also allow for runtime allocations of folios in some more powerpc configs.
> I don't think this is a problem, but if it is we could handle it through
> __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED.
>
> While __dump_page()/__dump_folio was also problematic (not handling dumping
> of tail pages of such gigantic folios correctly), it doesn't seem
> critical enough to mark it as a fix.
>
> Fixes: 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes when registering hstate")
> Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Closes: https://lore.kernel.org/r/3e043453-3f27-48ad-b987-cc39f523060a@csgroup.eu/
> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Closes: https://lore.kernel.org/r/94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com/
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Donet Tom <donettom@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>

LGTM from a general point of view, obviously dependent on PPC guys confirming in
general :) So:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>
> v1 -> v2:
> * Adjust patch description (typo, 16G vs 1G)
> * Remove ARCH_HAS_GIGANTIC_PAGE from arch/powerpc/platforms/Kconfig.cputype
> * Mention CONFIG_HAVE_GIGANTIC_FOLIOS in comment
> * Use 1 GiB on 32bit to avoid unsigned-long capacity issues
>
> I yet have to boot-test this on 32bit powerpc. Something for Monday.
>
> ---
>  arch/powerpc/Kconfig                   |  1 +
>  arch/powerpc/platforms/Kconfig.cputype |  1 -
>  include/linux/mm.h                     | 13 ++++++++++---
>  mm/Kconfig                             |  7 +++++++
>  4 files changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index e24f4d88885ae..9537a61ebae02 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -137,6 +137,7 @@ config PPC
>  	select ARCH_HAS_DMA_OPS			if PPC64
>  	select ARCH_HAS_FORTIFY_SOURCE
>  	select ARCH_HAS_GCOV_PROFILE_ALL
> +	select ARCH_HAS_GIGANTIC_PAGE		if ARCH_SUPPORTS_HUGETLBFS
>  	select ARCH_HAS_KCOV
>  	select ARCH_HAS_KERNEL_FPU_SUPPORT	if PPC64 && PPC_FPU
>  	select ARCH_HAS_MEMBARRIER_CALLBACKS
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 7b527d18aa5ee..4c321a8ea8965 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -423,7 +423,6 @@ config PPC_64S_HASH_MMU
>  config PPC_RADIX_MMU
>  	bool "Radix MMU Support"
>  	depends on PPC_BOOK3S_64
> -	select ARCH_HAS_GIGANTIC_PAGE
>  	default y
>  	help
>  	  Enable support for the Power ISA 3.0 Radix style MMU. Currently this
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index d16b33bacc32b..7c79b3369b82c 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2074,7 +2074,7 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
>  	return folio_large_nr_pages(folio);
>  }
>
> -#if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
> +#if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
>  /*
>   * We don't expect any folios that exceed buddy sizes (and consequently
>   * memory sections).
> @@ -2087,10 +2087,17 @@ static inline unsigned long folio_nr_pages(const struct folio *folio)
>   * pages are guaranteed to be contiguous.
>   */
>  #define MAX_FOLIO_ORDER		PFN_SECTION_SHIFT
> -#else
> +#elif defined(CONFIG_HUGETLB_PAGE)
>  /*
>   * There is no real limit on the folio size. We limit them to the maximum we
> - * currently expect (e.g., hugetlb, dax).
> + * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
> + * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
> + */
> +#define MAX_FOLIO_ORDER		get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
> +#else
> +/*
> + * Without hugetlb, gigantic folios that are bigger than a single PUD are
> + * currently impossible.
>   */
>  #define MAX_FOLIO_ORDER		PUD_ORDER
>  #endif
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 0e26f4fc8717b..ca3f146bc7053 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -908,6 +908,13 @@ config PAGE_MAPCOUNT
>  config PGTABLE_HAS_HUGE_LEAVES
>  	def_bool TRANSPARENT_HUGEPAGE || HUGETLB_PAGE
>
> +#
> +# We can end up creating gigantic folio.
> +#
> +config HAVE_GIGANTIC_FOLIOS
> +	def_bool (HUGETLB_PAGE && ARCH_HAS_GIGANTIC_PAGE) || \
> +		 (ZONE_DEVICE && HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
> +
>  # TODO: Allow to be enabled without THP
>  config ARCH_SUPPORTS_HUGE_PFNMAP
>  	def_bool n
>
> base-commit: 6146a0f1dfae5d37442a9ddcba012add260bceb0
> --
> 2.51.0
>

