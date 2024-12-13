Return-Path: <linuxppc-dev+bounces-4077-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D46A9F03D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 05:29:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8bw82Wrwz30gH;
	Fri, 13 Dec 2024 15:29:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.166.238 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734062137;
	cv=pass; b=UXGrJdsLqXF7AGgMBu4CSqPlIiNNKjWeximffJ8fvZ0LTvHnVv0yH0NkJg3LETy1h9pMJBfHR4KZ5BqTnxJIbF2VDMKdAsrRmLuR51rYL6Se4qzUQL1fH8yVxEnDV+OwHsLxXU8jp5jL3PeVw93e4UoupQ4KiEyNT4ClpOEYFcKcdF2+Om7Q7/5jm7eiPi2vy285KA5m7pAFjxagUeKhUUpd0VSNddKn/y0unfGxqqofgBv2Wc+PijZZHO9ri8YfwuKJmD3SwxnmKxI22Sd/U7lAF9ekQi3yzBWytRXq3ahci6N4ClWFEmMg9B58HcMtzB6mUm0RJkM8OdhsYbw3VQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734062137; c=relaxed/relaxed;
	bh=Nu6RQU/LTW8yN8pssV66KmGwFOFhG5kpDpj+iwhaUXk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Veyp01mffh7XuyOsW1CoxBI1NL8XFia1KnglXiUrQbqaF3LJRyy3FdXYhq29EjAgiD9DFzqsL9YMbp2rCBgp21Z8BLGqvWx5tSgGakFRdMIaNQLR+mLMSUYa4iS4CE1P8iUEeUP4P7s/cu4vjcrXaoM5k5UD5XLJVqfOxnVfjs9fRxbMhh+jdiqM1mBebcSji+j9sPQqdK3ityfUOFuRPcuylt0vJcjWnr/YDWXb9tX6TAk06TuhHkIRjwLmVgleNJwIJENkvwr5+aTj70nY0Pb0rDeWibDUJvvqLw3yeNkquoqruIY7digSvWCr6FFKhcQdnSlkzcfwEtVlm7LKaw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=eng.windriver.com; spf=pass (client-ip=205.220.166.238; helo=mx0a-0064b401.pphosted.com; envelope-from=prvs=20770c4ad4=haixiao.yan.cn@windriver.com; receiver=lists.ozlabs.org) smtp.mailfrom=windriver.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=eng.windriver.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.166.238; helo=mx0a-0064b401.pphosted.com; envelope-from=prvs=20770c4ad4=haixiao.yan.cn@windriver.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 607 seconds by postgrey-1.37 at boromir; Fri, 13 Dec 2024 14:55:35 AEDT
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8b8l1ZBLz30T1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 14:55:33 +1100 (AEDT)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD32DDK013484;
	Thu, 12 Dec 2024 19:45:11 -0800
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2043.outbound.protection.outlook.com [104.47.73.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy1xn78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 19:45:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEPZOuFwjcexB6OccltaAMW147EM4fZN0pCT/22SU8VRBQUeNpjnB/z4q8X59ByTIqxlxizz1fesSPb4D9gam4Gy1oM5kRnj2xHrcRk69bkdD99Vc3u7YxlaKVvBLPAzFn/OlWQKR+akgu3YrKpxMWTlZg1qqIqowDerb9Me7d4e5Z2tXaF54g0jf+X5SzotgZAUW4h4zW6GgBNB/40n1sImdwOfbCos44Pihwv+aLcyV0Xg6McLHztLGGlQ2lhGrNNvIpunTZKLeVQrfbcSUqMM8HQo4BLsEeVbuSWzuBAcS1jtn09RdiLuaenstauTKDXdBJTzp5bKdOihGYpBPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nu6RQU/LTW8yN8pssV66KmGwFOFhG5kpDpj+iwhaUXk=;
 b=BOvjDhI8clJpD9gtiUhSq0mJNseosjcagUN2WbprsbvRA+7wfT8tt55jsrJ6QapoxBY08E3yfGDMK4PC/aMV0XZkWuIBT2iEmiW4KuiYmJpUZjhxeVNk3liMRvF+P0fUw7J1a11T1VXljNBjZM/jmfryY6iF5a84ZwrpO6XKZLtCt/AdrR/93KMqq0m86uEyb32o7jX03cbdwHvVsFvjnNOMlUKhiH3C6lIc0oz6jrVhbz1b2H9VOBwTKna5YlWDao/3F7SXmvX3dL2weso62oFcbXwMXpUoleJHjrXl+gB4CilGX8udBwYCYOkkIR9E2zSt/HVCrNHx7LcXRE5now==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SA3PR11MB8120.namprd11.prod.outlook.com (2603:10b6:806:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 03:45:06 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%6]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 03:45:05 +0000
From: haixiao.yan.cn@eng.windriver.com
To: nathanl@linux.ibm.com, gregkh@linuxfoundation.org
Cc: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, haixiao.yan.cn@windriver.com
Subject: [PATCH] powerpc/rtas: Prevent Spectre v1 gadget construction in sys_rtas()
Date: Fri, 13 Dec 2024 11:44:22 +0800
Message-Id: <20241213034422.2916981-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0131.apcprd02.prod.outlook.com
 (2603:1096:4:188::6) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
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
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SA3PR11MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: dc6bf9d7-66b5-46c4-4828-08dd1b2887ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y3MzmcCzG2Wcz93FRc/OwY0+3W7FwJhD+aFUS+8WXyf4KFnkdcdDw1x9B+hY?=
 =?us-ascii?Q?RQ84ukz+gaCgeTXlA7RgIODXdIqgrb4Y/GBlZsPG/Cd6uqgnIOr00RC0UHo+?=
 =?us-ascii?Q?uI4vHDv/bQI9/oDb8KRUvsIcgUEc0DJI2BamX/T4iEUl6Kk70z0JzdbpSwpK?=
 =?us-ascii?Q?L9l7rjBr3fWNZlOV8R6pP0r0Po6Sn6QUm9HOGkJGj8XuUKuIyZXthYiyz+5L?=
 =?us-ascii?Q?g8Jk1jaUaNKOvqJE5b69Bes9RPeOxAB6l6RkQjiI55IVP8tWs8jjBMx+k2sd?=
 =?us-ascii?Q?Eq1Q5jq3XtUcBUfCsg+DVmPRKLxxGqKvbfGa7nBECFuhjabcnfIyASCn/bFJ?=
 =?us-ascii?Q?Pr496uXVcUcfZ5ItUJBapvyYJCsDBAtxRJaYXEGDLCwgUGJwFsp4y0/v7GOR?=
 =?us-ascii?Q?3LFnDmOC2Bb158sxBE2ENS9XCE6tlrhpBOfkUvLEKr7AyuHTSsy3PfSKw4lj?=
 =?us-ascii?Q?ogKXcrjyLPGEpfHsodxFTu5zsrAx2q+C7DDEJdDHwm/1EbKT+r8AIC9loNwt?=
 =?us-ascii?Q?yf5tivDbYHis+A74Rpn+C2fIUUB9Cb005HIW0dlQrPkFoeCj2Ek8XTvowm5z?=
 =?us-ascii?Q?EmJteuzIV3FUAEXfOfu1vSFvcyXGTYO/6N4p7Gy9nrzut/mduWeajDMcVLQ/?=
 =?us-ascii?Q?+A1lSHFaAlyTVfaFXyO4f3vCirO4wpW3mUX4brFMFyQmkc8T/VlTagj3BP4d?=
 =?us-ascii?Q?0FQ+H8ZdDZPPL/nVflYJ8uXurhI9CmYT7dWC04Up7PKIEd75BAsHlCNm+hak?=
 =?us-ascii?Q?xmUwmhy1MHI8Kd+QRCtj/BKw765unQbKNOWhLT2IsU12+VNSJ/EpwBgmTgc5?=
 =?us-ascii?Q?+ldBc5h3uu7DyN3ch2T73RWMw/9Joi4YeuqyhuJVxUCUrNorHHBOQlb4IEdP?=
 =?us-ascii?Q?VCkeNgrSqCyRNnXwaoEfhzYUICztrherh/PdRbuHerYScLmu391hsYyrm4h7?=
 =?us-ascii?Q?TjP9XXgA8R1zRJS2W+iv8L5LrpjD3cJAchHKAHXEZ6jxIOto+WdK/2IXbB4n?=
 =?us-ascii?Q?ZUzHktzJ+WX+rUy8II19zbumFwjJbVJoHY3Vcz8B9HIv0FYXcK/q2UPghBhM?=
 =?us-ascii?Q?W+AroE2Zza0zh/y4Q74Cxy5dvglGZPgOqYmKVJZVBp9Mz/V6zTqtNKPV9bRe?=
 =?us-ascii?Q?QLcGdeeG/Ip/eoumwWR/ZpcYSNKkJsoi1fI8Y8xSGVf2B3xEuVE8yC8YlRL6?=
 =?us-ascii?Q?Kt2HwIi/BbC8JOi5JyTI19u829BCjz9Zn7264iqxvfeCMGZ2HvL7V6UwjMVF?=
 =?us-ascii?Q?qvkPH5c6A7HcnY3ine26evGLlcV0RAjht5RLniYat7Pls6W0WrLivgc/a65Y?=
 =?us-ascii?Q?APvOGoY2ctr07y6hLXZRtdcNG7Eks3CaQBgG7kb0Gj2mHrN6gto9ojwUxptM?=
 =?us-ascii?Q?etDFtg8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8OS5JGJ/4G2e56N8wjbtJLl3UvJBERxVrZ5ARs7+E6M7dcaf+ey0FFQ65Xay?=
 =?us-ascii?Q?EyBTFsGESi/YUNwnT5jWnHzbwSNXLWx/Mj31jFoKYbPIblyPqqfV4cdR4NDG?=
 =?us-ascii?Q?+RB7hSnw47/vOIrTGvXvpg6VvAi7hpf0r8EmZNJ3uPmCcns9MeNBCFiPhX2P?=
 =?us-ascii?Q?z3vcqE94Cx8KoK2tjyBklS/tX+xkXtrSiKkROQbkANH5/HhlmEar+XZ4HZ/a?=
 =?us-ascii?Q?3dVekAA4vV35Q5xF7YjcvPgKmshq1o8StnQ5mfNzuQuht+rbwjR65gCmBfIY?=
 =?us-ascii?Q?WRbzlZLdP2npasEYmAdYk+v0Vlqc3fT84lygxV8TCvCxqjfKTab3OAoSfJzJ?=
 =?us-ascii?Q?nfpnyaJYyW3FcKFY19SYYrQaldPAmZAqyMtdyy0IHnKLIqS41LjRmV6zkQGO?=
 =?us-ascii?Q?InpypYloP/WR5UMQwmQDR3LTKFZuaA4Eu0s6+chy72U1DBNfqjuWtYLI9KKP?=
 =?us-ascii?Q?holk0tNITzp/QaDoPj8IWH1VpbtMzz6M1KNlr5xCFhWOTixzWHC+goDfUn0o?=
 =?us-ascii?Q?kaUyg0gro8yf2pyPyFDmokp2VbQ2CoNo/4G0jmUOcY/icY0f+3dw746oEcXl?=
 =?us-ascii?Q?CRfXGh15A4bAhArwgTehGN5wZY2sq0W0i48pcCedhkOLJ0XTv2sbgmkd+3q2?=
 =?us-ascii?Q?urNvPwvSFWPe7w1E5awh2l6j7eiR7/fTYAA6O5M0936dcEiyNLaG8ucoma+g?=
 =?us-ascii?Q?uVt9TE8ewQkTujWa0LLwWux17rTvLLfndVQMRZAB/pKnRP4FfrQOMqrYbpoo?=
 =?us-ascii?Q?HKrEjdkjqwNLpQSz0qfgTVisW0KE3u7B98G2GS55Dx8JCZgx70K6xJWp5tYm?=
 =?us-ascii?Q?3PpvIU5VEYUw5tD8Ka2R1PglElCFG2xdiM6eAdulczpojI0AwH+QwBUTRFzF?=
 =?us-ascii?Q?F7Igsw/8+sjewl5lPvLi+UgTticQGP7tGBIMrIl9Na+kb6jBGF7qlGJxQmZ0?=
 =?us-ascii?Q?0CKT+Zrult0qfB9js0C6GBLZShlsHmZyfto3Wezxc/NtEcNtlxh4cbigVbDP?=
 =?us-ascii?Q?9zUyIqLYBgSDmchtT0Dr9xYVn+F3FZWE0X8cpmnAaSeBMMReDtPLuEI0WZXs?=
 =?us-ascii?Q?8zLvM43snOykhowM0LwGMDeu/ZVESxkYUTpqPTDD5EyabYyUb1WVdbhAMMm0?=
 =?us-ascii?Q?hTQ+JAZH9Q3zL7pEtrZ92vdBbYwc9u0I3gD1m2ENe+bsaAr5LDzNN0Kgy+fw?=
 =?us-ascii?Q?SDBqIlBzHrx965OXGr+NdWN0rVE0d1o1GIVJN9g1jLA2+mamBmFj2BhRUnQA?=
 =?us-ascii?Q?A07ZGQ/MusdZxPS1aVsHePoErriWf3PocFxqtl4YWUmdf7KyMjBT25BpcJJO?=
 =?us-ascii?Q?IMD9I3hd5gKBZQJ2I86d+lK90X/s5nMsJYwgWlLonzZj2q/dRX+xgBrRSP5A?=
 =?us-ascii?Q?H7thOfd2u7533jV24AEUPbCURn5zcQBzvxNpa/X3pnFoqhI89Cl6RgqzyIwO?=
 =?us-ascii?Q?0HZg3nuA2HgNzZ/jHlYtOWvbIq4lf9Zo0MwkIN2+6YE9MPy+pu1AN0uz+RP/?=
 =?us-ascii?Q?G9y7EnZ3GF+fjYmRvsFBwG9FTohwunKJ5VmuI4I5K2ZW9rQgCy4ot9VYcrdL?=
 =?us-ascii?Q?DAbraj/5zsu+XSL9ahkIg/GFGnSNAo/rqLVXLGIzOWlTAi4mhpf8f+XUhUxz?=
 =?us-ascii?Q?mA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6bf9d7-66b5-46c4-4828-08dd1b2887ec
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 03:45:05.1292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: us73g4S83E+LA9lGa8K7V/IUkGj8XJlWqimtOKuETdqs6sP0x7QaCmrMl5CjeKSmaq3Efx4s9H7LLouDXZdZJGtlkRMUlzVQdBGTvl+1AT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8120
X-Proofpoint-ORIG-GUID: E0py6JzpYIosEBhWRWbd1Aeez9IW0WmM
X-Authority-Analysis: v=2.4 cv=eePHf6EH c=1 sm=1 tr=0 ts=675badc6 cx=c_pps a=YmitjTGdGiwdiEq1Q8pHfg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=_Eqp4RXO4fwA:10 a=bC-a23v3AAAA:8
 a=VnNF1IyMAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=u2LiicgN0kIDZIMe9SoA:9 a=-FEs8UIgK8oA:10 a=FO4_E8m0qiDe52t0p3_H:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-GUID: E0py6JzpYIosEBhWRWbd1Aeez9IW0WmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-13_01,2024-12-12_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412130026
X-Spam-Status: No, score=-0.7 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Nathan Lynch <nathanl@linux.ibm.com>

[ Upstream commit 0974d03eb479384466d828d65637814bee6b26d7 ]

Smatch warns:

  arch/powerpc/kernel/rtas.c:1932 __do_sys_rtas() warn: potential
  spectre issue 'args.args' [r] (local cap)

The 'nargs' and 'nret' locals come directly from a user-supplied
buffer and are used as indexes into a small stack-based array and as
inputs to copy_to_user() after they are subject to bounds checks.

Use array_index_nospec() after the bounds checks to clamp these values
for speculative execution.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Reported-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/20240530-sys_rtas-nargs-nret-v1-1-129acddd4d89@linux.ibm.com
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
This commit is backporting 0974d03eb479 to the branch linux-5.15.y to
solve the CVE-2024-46774.

 arch/powerpc/kernel/rtas.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index d01a0ad57e38..f2378f51cbed 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -16,6 +16,7 @@
 #include <linux/capability.h>
 #include <linux/delay.h>
 #include <linux/cpu.h>
+#include <linux/nospec.h>
 #include <linux/sched.h>
 #include <linux/smp.h>
 #include <linux/completion.h>
@@ -1076,6 +1077,9 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	    || nargs + nret > ARRAY_SIZE(args.args))
 		return -EINVAL;
 
+	nargs = array_index_nospec(nargs, ARRAY_SIZE(args.args));
+	nret = array_index_nospec(nret, ARRAY_SIZE(args.args) - nargs);
+
 	/* Copy in args. */
 	if (copy_from_user(args.args, uargs->args,
 			   nargs * sizeof(rtas_arg_t)) != 0)
-- 
2.35.5


