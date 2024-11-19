Return-Path: <linuxppc-dev+bounces-3440-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E7E9D2FE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2024 22:09:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtHDS6PKzz2xrb;
	Wed, 20 Nov 2024 08:09:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732050552;
	cv=pass; b=NSE6+8EEJ4Um4bgvvUJA9ICU0AXsl1J03mkGukGzrYanNz2le7gWiKeMidH0+5qYRG7CnUrzH7vJ/eRnGeACQ366IT9VgnBn0QN0h4KSmb+QQOliR/Tj1xprvepmCu9fBYf41fWZ6SEqGyXidrxlkkM9WIMjCDVW3P7IwsxbN7agavxoTGyRbRhL1DSK0fHR5KgN3MyYkPqoyhLcunbLpQzaloiMX34qzonOMKnP851FEAXyz6+Nhd5RoLEuazckwsMcExMwbooX9lNdZQYEdMcGz8LN/+ecBxib7d3UsiDJO9tbFoh7WLovLjV+HooJuPjG89g0IRdf85PHBHHAbA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732050552; c=relaxed/relaxed;
	bh=APhGSXrOmHtfxzBQnsfX2zmcVvvPNdNb43B7sOSVE1A=;
	h=References:From:To:Cc:Subject:In-reply-to:Message-ID:Date:
	 Content-Type:MIME-Version; b=bbQ5d1/CLsECqRQ8Af3Xb6rpaGPL4G5rU2UGCUq7OIXtCe/bB+vCQt6HIcxzppPBnqH+Djd+eBrbCdDfoRfRptfdXF5LvjYLztrTW6HiiudrRKbUIw1tHTb4RbL45yzH6Mz4Xt3xjRqDUMAwHynfAkL9qiHGGKPJmdzz0qcD1RFnP9zmAFZaIzD0dfy1rLdGyF9BMheKlwRsNtIr9g1DaMTbRIvcKtKrlb1IL9UGSLC1dljEkfobSEN3NV4DHFGO3dTDGnpu1HumZm6bZOIxcr4EFjKcqKBDMWIHJ0EVqoJmSIC07wbzLO9zTA4nv5xayX90RGsVI5K1T85epkbIgw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=MoY3USl6; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=j58d4Oq+; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=ankur.a.arora@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=MoY3USl6;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=j58d4Oq+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=ankur.a.arora@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtHDQ633Zz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2024 08:09:09 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJIMd48006291;
	Tue, 19 Nov 2024 21:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=APhGSXrOmHtfxzBQns
	fX2zmcVvvPNdNb43B7sOSVE1A=; b=MoY3USl6VIyrO/re+1L69SLpE1bjnknl37
	nab8W1il8n173Bf0Qt+KJkfdJvy8DIkELoGFkXtMDrCh4CYhvN+qQa28JhoB+K23
	yNxvZKcUC/vgWJ31owsIBOL+k6JRLho7PWeLQNiQu5hxE3tcD/1TKPxC5aW5ov23
	9b+6ZGGtCm6s1udxOlg/bWWxLS07gxxal+OnR6s8ay/tzGK60JqGmcRQahqf1/kg
	40NZdkse3ExDqVYUGf1d8OrBVoWngFKGstjWvfayiq2IjXvvpmRYrsnmjhkKK8Mw
	+Z5MyCdCkuZcLhP6RPMex7nUcTzmlbl8xKf4rxWemb2BoY8xh53Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 430xv4rjex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 Nov 2024 21:08:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJKAkkF024386;
	Tue, 19 Nov 2024 21:08:35 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42xhu9hw2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 Nov 2024 21:08:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+5CmQ+nMGbdS2yCZ8u5G3taqTyeq1FDV0i3TU/9CUTtE8d/BrtdtXUvhiAm6YtAmLipeH635ZtHp/E3k1QvgeBdPIm7/lR4dHlXR4rNOV1uG7hyNHaV797hdhZ9baRJdgRDzCOVtvuTWLaY3l3KThaWerXy7pr9kUu5XvFouXbNhYM2g6XFBNcKOFcngf4KgqSwhBJQbUGBXdYCFR2bmVtLs9kD5tTZAyOPcucRkLiZaxExpMFqliEG2VP1zH3OgIaVDgAATeiMAqqj8pVuRrO+mLZg189GGNTNkaNTYKxoNvMLplkUQcloA/+ePKTzbi+hWJ5qYB/GOmuY2i0xZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APhGSXrOmHtfxzBQnsfX2zmcVvvPNdNb43B7sOSVE1A=;
 b=noHPFCAZ0GZN9wfYJWqmpdz1nu87Sn9l5q4rNMe98a+/TC/CcFVniikGNKv/G20JqkzJTOQoFCk8fkbK3VmGXxagHHauuzpMuML0nVf3ZZXJFjbDe/+gzgX7n3IQmZVk4665rE+rJ10hVUlv0vOZ/0pjeGvv0GWp066VtM3K5qInOl1xUS3heCOqRtNKfAc1I5Fp54CDAndFVONfEBfWCGGwr67XjDdFwpcocEDhu2jhtbNPyUD5/LrRwbe3S4ZsvnbIihrvVDM2T7Pal3QlSiV24UufQCL/d2goeNDelnafJdLTXd2K4LQzPk6rJXZx3dIi9KtWsmnDU83avYQl1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APhGSXrOmHtfxzBQnsfX2zmcVvvPNdNb43B7sOSVE1A=;
 b=j58d4Oq+HXEHbeqbB/oC01izYnIhzf6pn/jywU+idVMnpE4Ojpwm6tY4DI/JPziQdSy5nZKextJh4Zig1EuAC0Dh6/d654mw2X4USURBbhWkq7W0NMKKO3BZVVpHQ16ji2aYnKKx/gWHBiUzl+bE62/nKgGfTINBkDsQjT2GIHw=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by CY5PR10MB6117.namprd10.prod.outlook.com (2603:10b6:930:37::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 21:08:33 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8158.013; Tue, 19 Nov 2024
 21:08:33 +0000
References: <20241116192306.88217-1-sshegde@linux.ibm.com>
 <20241116192306.88217-3-sshegde@linux.ibm.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, maddy@linux.ibm.com,
        bigeasy@linutronix.de, ankur.a.arora@oracle.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] powerpc: Large user copy aware of full:rt:lazy
 preemption
In-reply-to: <20241116192306.88217-3-sshegde@linux.ibm.com>
Message-ID: <874j43hqy8.fsf@oracle.com>
Date: Tue, 19 Nov 2024 13:08:31 -0800
Content-Type: text/plain
X-ClientProxiedBy: MW3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:303:2b::27) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|CY5PR10MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: 24156c23-9627-4363-3728-08dd08de537d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3OFP8HukiniESlKWaGne/TwwvOe2ymYp85wfJxzg9luQSkA4yib7CQunwdXb?=
 =?us-ascii?Q?aERRUHOe0gLoW488WWA5gVB0JnpjlgFBXFcAxrQS6WUZewzHnQtwxLjB7F7D?=
 =?us-ascii?Q?1xZOVGUyJYA0T2a+e8bCRECv+/2ReCBTgL5HIM8wkfTeVmIecpmwMxFnR99v?=
 =?us-ascii?Q?Q9xBnwEG6wmLphXqzkdRBTNMDqbJKpfKPcHNCgZRwGZR3Lpx5ausWXQOikMB?=
 =?us-ascii?Q?erqdX7RWtl9t1SFAbB8lOP2VCNz9jknB2M93roqY7HwSzZNrtX0D3J9QOWEX?=
 =?us-ascii?Q?u1sKLuPilMAUekEuISvSPdtKs60AJOIM9NcrrO1YGZ/sxp0+l07fmoGOxQA+?=
 =?us-ascii?Q?G6IfQPvCj3xH3Av3P2ebsBQ0zSCAOekFrK//Qut2KKOHPEoRKdsqGiDBUwKl?=
 =?us-ascii?Q?skHKIDV9ydvTPxEfA5BrW4uMeJR597rwYPtSegH6W9Uqdge7+Xlpuabc9fUs?=
 =?us-ascii?Q?mF4wG3JGhQeoHBRyBvHoIuI74ODiPDT9PfAkZoY8ISm2KMiNDv8FpgXqeGyc?=
 =?us-ascii?Q?ICFkirURWRSxgxeQoCchEli8yke09hhqVr4MMrbu+kdTVwzqKvlaIfL2WZF0?=
 =?us-ascii?Q?98nSXRM8izVl4CAeQjrOh+nSoWRq+nEeIRIceRCSyKLpZGwADRoXTnWE6T+e?=
 =?us-ascii?Q?qcUg07dz182puRUV4MIJK1m3VBrSYqjQFaTfsUASoSsd3MTCtTIychIqM0+f?=
 =?us-ascii?Q?ZQFfkRMz6NCKrk1GhhP5uHEtwW9PLLJ5tz95o2k7SxkJb9egsGQ3EJTIA3Et?=
 =?us-ascii?Q?Dp1WMLjDSX1xgME85dAsLMKxcUisf2xVopTvZ2agc0xwZPCVhdxZChey94jx?=
 =?us-ascii?Q?HQgOHpoeNayYmTFWEmpExA3UWVTplL5T3PRsgMwOGZboUH3wXvHC3w5esZJm?=
 =?us-ascii?Q?BVQcMjJCBhdl+TP/EOUxF8qfPr/uvD0Ndnjsd80THDzsTY953seXa6ptlkKH?=
 =?us-ascii?Q?8DcfuB3DX7+xl6XmGfr+3LnzH8caRMi2bd5VoPHHfVubGP1G9qUebHfB6xAA?=
 =?us-ascii?Q?MWCCR/ANT8XOs6bSf6djvzYL6gZ6GeuyWyW2G/QX5iuXcJEiwbrhzfGJCwnZ?=
 =?us-ascii?Q?Pqup/vbbM5ZSPb0c0RHJ8AwogV63ITz9DpnwKYpBnpbqD3JeytOQN+eAjN29?=
 =?us-ascii?Q?QQ4MTgFVWtwaKB+SEDSvJK73xf2WQ9CkkxPfiQG7FTjLuSSAwmgAWL5NkvkD?=
 =?us-ascii?Q?u7/fls8DdhtvoI+qxK7KGAMuTQso2P0ulB2M/GYJ0r6z4coX0veS9RtU/Wrg?=
 =?us-ascii?Q?7Bcgldyqu7CGzV5b4+gTr/1XOdZ29ovSVRPk6KiE7FNun6pX7NzfkMWQo8dW?=
 =?us-ascii?Q?SB+zpc3ShK8HLt+OnliZk5Xy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?87eZCnwalshMikaLJLErWrBLPqkDlX3aJXmzk7H6W1LHRhaHIC0rDV6ExQkH?=
 =?us-ascii?Q?8Jex1UJwELB5EBaGBxF1THFJysqs9bEvgTBtnfwsiBpy9FyeQ6VKakbmhMyc?=
 =?us-ascii?Q?sELamc2KYwKtRt+G1kfJSwkUiw2mjoGqRUzJ5AV1z5byOWAf0TjdlGSGYVCz?=
 =?us-ascii?Q?9rlQs4F2ZDj3No6SzsSk7+9J7YPpQCDNUw4lJ3jtqTO7U2N/knlpEsPgRJ04?=
 =?us-ascii?Q?TUSIUK5+205APxd4SJYJ8HGFaCrttn5CYUdmyIJ76JaJ+T73H8e5g+TT3aQ4?=
 =?us-ascii?Q?0n/NAS54iHUQ+qhO1TMmpv63YguwdEi0qbE7AZwd6tHaVsacTrw7upgXLGG1?=
 =?us-ascii?Q?FWyCtn147IYvsASZt5ivfHZFkgQh+36XInstPAsSE+4bceFqDkYH3Pip7cae?=
 =?us-ascii?Q?R3Qd6y5vENWG0B8vn5DQAklAM7HhBD4EtS8jZ00yn1AEJDIQUp7CghVUIUau?=
 =?us-ascii?Q?UFMHboISqalvnzmUTYYiEWPTW/bG8szrH4BtrtXcRS8mhsllBwHKWFBeiYDc?=
 =?us-ascii?Q?vpaJMWeO0xy/evRmclzq2AJ/nDhQ8EEVkGUjamgH9pCOXPlX8nI0YPY32CoX?=
 =?us-ascii?Q?2w0CwWWIdXwvVZNd3JtivO3hcEHWTuxRmI3eP4jPU1WCnmllRfsFNib31yX0?=
 =?us-ascii?Q?2YV9/K8c3PDGugMNKpsj/gCF7oE8vjqvg8DtgfukZA727Kfqxa7beZhWxx9q?=
 =?us-ascii?Q?vJFnSDlgIfa8gi31obK/vEuusTM/zM+Vi55wiURn3mGQMcAvE+mOnrxjkbqk?=
 =?us-ascii?Q?DJ3YenoV3cZOYA5Dy6GGvHB8oonZbjO7rc2FwYyO394L3iEy4xLpsKnhuLsn?=
 =?us-ascii?Q?egroesY4WE91n58I91wMXVaYKnEwOBY5NfszxS6+MGvc7S4REzuzaM2NdiTN?=
 =?us-ascii?Q?DLGxFKo1KhO5Bjkvc46hCQtOD55HZvh00+8n9z4FBo+up/UjoVokgMx/wf2w?=
 =?us-ascii?Q?G8aPgF12KQUSkOV9qKkjHrnaeb89SJC10VdIS42etkyZ0AWRNZswu/C1WLks?=
 =?us-ascii?Q?eFYDpKgiQS6jW5U2d6e3OPNqeWF4mePLJBr1E35XVEor5QUJPu31nzfMVjwu?=
 =?us-ascii?Q?Ltn6z955YaG6+sTRmK7g8cc+mzO/x8Hfn3i/1uHY4Q6jkXGcsg8yhExGFnsT?=
 =?us-ascii?Q?NfHfAGGBxX5ZXGMJIn/I7qftjaMTAUlHTscL0TI+c4ds9al6MhZpDiChzEO3?=
 =?us-ascii?Q?WMS1DU4+lLLkyOHNimwEcNetrONvJIsBX12HtWnBliaB0qZXjlStYdi0FR4n?=
 =?us-ascii?Q?Y2yaT8PIF0FvuWuO3U2Sm6jiOk3HM/XrJYei5ZL7NfvWdE8hOl5Jd5+VvxfF?=
 =?us-ascii?Q?IkOUELH5TA4EkU/gcu7QiNwDtuq6bQ//hqCQBkJIsJz5vEQA2vfDH2cdaUFG?=
 =?us-ascii?Q?YTQHQiLeRLVrT1YRqVzRQBcjXSkZ8Dr2BYbJ49esXhoBZ5CpCdJj59cgtb8l?=
 =?us-ascii?Q?9vU5yXHsy6vYcCiqMjRTcMdG/yLgX3cbv8c1DUuSfMhGfQfcJALhuBykXkv2?=
 =?us-ascii?Q?+LP8W55tFG4buu2+DehFx6LyQhMRcqt6I3efXU8yay78xjQhW9sIGtt7N4BF?=
 =?us-ascii?Q?uFgtu5F17ailRXu7E6PFY9G1nviL6Mla7mpd1Xzs?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Iok8Yo6iZHaR9XaoaatrAMaezMHAKEcIqCiNQ/WkwK26ZbdBBcpqOWH9DSuFAxTzFRGKbmntxepcAQ5+PFr2T0t5uTtpFpszAelEeLXOmZRpRNoyjP6YAVfgPIQtV3STEzj8kbZYfevxUByJAamDisBmNFaZupfiFFJJp8qjEJ3s9IFQyrTeN6JAwLCqvlK5HXp7BxVuQcv+/gm5pLerelel+ccowZqmFZN/W5pQRvGJCr5rSmuGL6ZNquPSNz14jvOPY1EIlDCnZB4G2Dq/yH0itksWAICwVlHbG4fiOsgbBmwL8ZtncQlNw+HQ6ug0HjD70Fr8PKjF6AAB0YjL3Kp1Dhx2T+ZMj7PcPL9A1MzH6qLfg75k7V6xjBzvMVnKWdnGMvwStAgvvwxkPyLSE00Jw1Idv3dfu8dxjJ3PICeMxJi+/Z5X0d4s4zgL9w8btRjVblTflQDYpXRsAPuHDviCc2pv+PxuAxC9IDJgQ6kyP8JW3LchJEEWBK7zTqAkK/MI0M45HWSnXk62EX/MB8whjzJm37BFFF6m/tWLf162SATuv3pcctaXdjXumX3p+3zWdf/Kg0x6hxZtZBeDI76BQsZhp4yocwtXCeFx128=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24156c23-9627-4363-3728-08dd08de537d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 21:08:33.4456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCdskRo9uqEU/BWxbrXJaEFaC+t54sm4A2U1QaCFvQexKbi4cUDbzRfhioWaSzpEHIh8qTJ5YdwzlU9PjlUkPdp3U8AWQI4YIMntUWuvJ/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6117
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-19_12,2024-11-18_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411190153
X-Proofpoint-GUID: fK5D2f7N7D1SxdIPI-RUCCRn-3b5hUUu
X-Proofpoint-ORIG-GUID: fK5D2f7N7D1SxdIPI-RUCCRn-3b5hUUu
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


Shrikanth Hegde <sshegde@linux.ibm.com> writes:

> Large user copy_to/from (more than 16 bytes) uses vmx instructions to
> speed things up. Once the copy is done, it makes sense to try schedule
> as soon as possible for preemptible kernels. So do this for
> preempt=full/lazy and rt kernel.

Note that this check will also fire for PREEMPT_DYNAMIC && preempt=none.
So when power supports PREEMPT_DYNAMIC this will need to change
to preempt_model_*() based checks.

> Not checking for lazy bit here, since it could lead to unnecessary
> context switches.

Maybe:
Not checking for lazy bit here, since we only want to schedule when
a context switch is imminently required.

> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  arch/powerpc/lib/vmx-helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx-helper.c
> index d491da8d1838..58ed6bd613a6 100644
> --- a/arch/powerpc/lib/vmx-helper.c
> +++ b/arch/powerpc/lib/vmx-helper.c
> @@ -45,7 +45,7 @@ int exit_vmx_usercopy(void)
>  	 * set and we are preemptible. The hack here is to schedule a
>  	 * decrementer to fire here and reschedule for us if necessary.
>  	 */
> -	if (IS_ENABLED(CONFIG_PREEMPT) && need_resched())
> +	if (IS_ENABLED(CONFIG_PREEMPTION) && need_resched())
>  		set_dec(1);
>  	return 0;
>  }


--
ankur

