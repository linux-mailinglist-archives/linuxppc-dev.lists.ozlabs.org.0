Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6AD93A257
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 16:12:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=dNOGBS4c;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=oZjswSl3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSzd54TG2z3fnt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 00:12:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=dNOGBS4c;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=oZjswSl3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSzcN1R5jz3dV9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 00:12:15 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46NCGPXH009363;
	Tue, 23 Jul 2024 14:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=VHNeLkoKGL0BzVg
	1/Ma34Lx5wCI+s6v9gA66gMSBUm0=; b=dNOGBS4cs2kC/htHJlawB2BroqyIayr
	Bk/e0hJbBKKT150AOpd1kdxBDAXx42Q0oBH335RNje3QbPkZSOkJh0ihX3Z19yCo
	MWhp5ZHkvA0+hZZPmWbJq+3gKTIZdALY1y1LGEEh+mAoCelgeN1/A+sY3XRgkj2v
	WzFVr3PyesBxI8vxuSdx82BA/gC0bwpy6aI4hFzud8nro+bLWWkoXcX+4utMZYfm
	F8XdNyYRjFtx45uPE3vKlNWcJ3MZPGy9satdcWRxqKEkuK6fJo/9iyzhxPG+c3OW
	bP8FX83Rrxrl9w79xC8IMo32S/YgPXK5JJaDf8A5g8UvF1NzDOMgssQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hgkqxh98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jul 2024 14:11:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46NDCWrM010971;
	Tue, 23 Jul 2024 14:11:51 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h29r8bgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jul 2024 14:11:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbXagOLcF3kngpP6SPyU2/ol4Vr9+gYMjZrNR7dEB4SuPGZZo8PACD1/wOQt7ulZEDrwnkwitkeuLm/V59c3KrfRb+qpUQffcLEhk6u5Scc7ucO+DJNTJMLOn0zxgj8myLzEolGdFGDnnaLPYa8FCXsWCVFyJMkE01hhVLuPvdAoK4z9rVDFWPOIWWICmbkqfbVHKvhgHaZXNSHd0FBacAu+Z2ke6NxT/WoUbj03BVU2kioJOxLDxmGFcjBXXNbxKVEbH+vM+2giMsiKsa6ug6W23050M0su/un5krXFPf7MB4bcxjIiqm2uh5DvasGRACv8dxr0GNKhmxTUnp8htg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHNeLkoKGL0BzVg1/Ma34Lx5wCI+s6v9gA66gMSBUm0=;
 b=pPjvqiRy3ECvK3bfUF1fghjCuMti4mBuPAXJmDxs74DXXd6JGINu3OrJDzay7NwJ6aaUZnTFt+4Amegdu3Z69aavTYC7Z0TJfIVuRY3vDfLXTgJbCfo1z2PCjukIUDKJ2h3IZiGJ7QdlUADBo/kD8S+etTskZeneUeU27uczjXVwS2zKkTfQyhBtP+7nrYywO4GFuhf1ZD5hj1QhCoZUVoCJh6Gr5/S5un1K4/ltY32yELDGyZwhMhe4cuX+zVt1CDazrFbOBrtH9dNZzEyqSq1jJIWW//4SDitF+oTREAqOH3tgVxi/Bgq+u9tLZPDO6Cp6Qgd+DVA09/l+5nPXsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHNeLkoKGL0BzVg1/Ma34Lx5wCI+s6v9gA66gMSBUm0=;
 b=oZjswSl3hXd5fy2Spl3er/9KR3iHetuwZpKBgdM2ZLZmeW3R5FNxiyu5GzArHr05DJixukRKpZiJSeISwq4FQ2FbnvYJyWnAOFAtimlP/vFCpRSF525O51W7Rh/v2+ZsFMGU98nBhH85lXER+NibeIC+2XapPrnIB9uTgichXrU=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by CH0PR10MB5067.namprd10.prod.outlook.com (2603:10b6:610:da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Tue, 23 Jul
 2024 14:11:47 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%3]) with mapi id 15.20.7784.016; Tue, 23 Jul 2024
 14:11:47 +0000
Date: Tue, 23 Jul 2024 10:11:44 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH v5 17/21] mm/mmap: Relocate arch_unmap() to
 vms_complete_munmap_vmas()
Message-ID: <eg3ktkcfhy7ocijsctqskxnp3csfpheg4mm4yjj5uvzf2qcqxx@u7b55d3vpav7>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lstoakes@gmail.com>, Matthew Wilcox <willy@infradead.org>, sidhartha.kumar@oracle.com, 
	"Paul E . McKenney" <paulmck@kernel.org>, Bert Karwatzki <spasswolf@web.de>, 
	Jiri Olsa <olsajiri@gmail.com>, linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	Jeff Xu <jeffxu@chromium.org>, LEROY Christophe <christophe.leroy2@cs-soprasteria.com>, 
	linuxppc-dev@lists.ozlabs.org, Dave Hansen <dave.hansen@intel.com>
References: <20240717200709.1552558-1-Liam.Howlett@oracle.com>
 <20240717200709.1552558-18-Liam.Howlett@oracle.com>
 <1c3d5079-8568-4bb7-b2ad-05c5ec03fac3@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c3d5079-8568-4bb7-b2ad-05c5ec03fac3@lucifer.local>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT1PR01CA0108.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::17) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|CH0PR10MB5067:EE_
X-MS-Office365-Filtering-Correlation-Id: 324d75fe-88c5-4d4a-1275-08dcab2163ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?jXtXDSkV4oTVGv8EBhfLZaVBdcrxiuA8KmlKdPhhSWvCKwHk69w0OYApDYpA?=
 =?us-ascii?Q?Lpp13Tzz5iQcRgZeE7wic3gQGuIrZQaWkTE34NO9jahnpo6T7nOyoEffiohh?=
 =?us-ascii?Q?y9JJe1pz0B+X8wEIGwAuhshIHgFiOIhUgS0fkoiYtQNK5E1E3FbzvhfRb1yy?=
 =?us-ascii?Q?r0LxCOew7P1bpzOG6B+SPzvV/TbTQ60IMDk534yaAWsbxpZfOcVGKe/vRTrn?=
 =?us-ascii?Q?GMswcX9xOw8MqRwdEpIp493QgkmP+rKz8IKK13GtmNNaJJT6a9O5ArwmEksq?=
 =?us-ascii?Q?uoeFZ1+P3OFdK8DJ7uguv6VB6YQM7ovb4w2F106P+rw9qKEupy2Lj9eyo82Q?=
 =?us-ascii?Q?S4CUv50DwuWUm1g46mHd2icegFsQqR7f6lOkPi78WX6N5X+fbdcEfe0Dxtmx?=
 =?us-ascii?Q?z+x9obtoCzMQpDpJDVeaPcqlTrhwJQvDnpW+W7pUMrJZCDwSZIfytuIhgdCi?=
 =?us-ascii?Q?0RjpkQe/vC4PoevLQQ+RGo658M+N8Tt1x8UR2tJuOLwh2O0NS3XIAhFQLfYo?=
 =?us-ascii?Q?/od8khFT4uvmq7hRtWhbYMr1AqWMlRYaiJWYrzM69M3L8gm67JitmZN2VGoi?=
 =?us-ascii?Q?jKmEJN7v78Lv3GQH1gEHoIqu10XphU77r8BwmGs/bX5KbNdUxfUTcMezFqcv?=
 =?us-ascii?Q?Dxuk4UvISnmoo16V+AZBZ4mH6pyyOIaJF5AUgwnU2s/beRgPL0Q15iHXvIBO?=
 =?us-ascii?Q?lPXyUvydA/tY3JA8TKFnjzKR3jCXK6MPJVZTA9s5ilP3Bv8MQEwbf3YrHNDz?=
 =?us-ascii?Q?Q9k+EbL8ZwnU44dXxfLtJdtEqWY5P/6ocqTJGXMK+qD2nDvN5H8N4VJN1N0Y?=
 =?us-ascii?Q?59e2B67QK96BPhXWRpUE7br5mXWtqJsus9rLM9x7/0fjfc5QVHBbm44LgDgs?=
 =?us-ascii?Q?xxFWT+y5j217ervxU0sglywr2Z6B+KNUmx+YBTxzF3m82Yl78H0Zq8fNI5BT?=
 =?us-ascii?Q?k/RoUja7LLqSBET+8wZRteUpUhsTDzso7mn5yNqElgntukUeML2hAohOaL4q?=
 =?us-ascii?Q?9hKX6pGNoVkDCrS02ZbNhWV/eLphElES1jvTExppP0nK+98CAYGmS4Hq0pbe?=
 =?us-ascii?Q?2aLJ5zw8BEmnZ/yLEC8BwISn4HzWhJTq0AkBVJQ0xB93x+AtdvYjZC1sF8mT?=
 =?us-ascii?Q?tLIlUlwXeCpIdpDY6sXDV0KmhClHUiOozOMx4s57+wlDwo2+O6fJ5XVkHWDE?=
 =?us-ascii?Q?h/td6qAwot/hj/Lr1CMp+Ga1HLxQ9urFHzMYLw6RNWS3kNqkiVOg0yU2n1r2?=
 =?us-ascii?Q?BqknxaCdWtA8tbp+/JBd76eHN7uxUxIVOrMKFo0B6AbiP9gHTVp93RHYMtHg?=
 =?us-ascii?Q?znypzEsQpCr0f+aBz0p+IAoC4imCQJyLNL56qjEffgJVmA=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?a8MyWyqhNmum/E4kn0zMn+hY4Koxq4nHxCU5ofsJcDHM2ZWrH0N6fQOacWn/?=
 =?us-ascii?Q?+A1iHQs56UYweCTDjYLj9J2rhz/dHrjyja7ssiq2vdgyxcaIJr4LslmoopDv?=
 =?us-ascii?Q?nXFeJfzGFodDcSyjkyvqRBdjOtYQlXv5SnLCBM0FZPP4wfbf/HFXosFNwkbr?=
 =?us-ascii?Q?KzujEvkTO9cRQuN1OhB+8eLqY9Kntzgt/4MCy0AmH9FGBe68EvpQRA7qhTIO?=
 =?us-ascii?Q?WaB2fbtrS+hxYxNH1RRzuofB7LK8ZU6dWbwRVs9HvQRSUQBDYSA6Czi+Plnf?=
 =?us-ascii?Q?x6JaZIflQ9AvNvlmdlEyy6wBjha18hqhjh86WWLPfnyIbfBIapTWjlJDN5Ti?=
 =?us-ascii?Q?mgczhJvp/tLF32olwD9p7FdpnXC/U40Nctzrgwobc7IT3EnOTxtOiOBldYEk?=
 =?us-ascii?Q?LyU1Zte9MGCaGke9sM61adwfmbi7ghKc4z4VkeH+nWO7Yjwes7AFZ42cdDRD?=
 =?us-ascii?Q?o972hX/OYZRm7CxDZL/pYktoolx3/mFecVKT8jbx2HYTM+jdaVDeziyUM7Kn?=
 =?us-ascii?Q?2YxgnxCHRpsv1MGuRs/euWSHrKf32ppChHgymk4qeIsXoKWlbjxxuyuBsqP1?=
 =?us-ascii?Q?LTjwiV6nLtrqRbo7I9sXgXbLPks9WkwkoZWZpo8vLoWvn7FyDwBRD260f3Ok?=
 =?us-ascii?Q?uZoFl7Vzbct5VGjkj+7rv0mqav3nIwCVcpGgpTVhEULJw2cfq5Y8xM2f0qku?=
 =?us-ascii?Q?ZzoBzolgkRcfgMWmZ8fsU9cLijUYXVoap3UZwtHj+AFurfapBGPUOzifhAgT?=
 =?us-ascii?Q?bpfZQbQH4AtrQxmWVQxsQA39ZaHcstOENRwoB+QBAHtgAcwbpuahElyBr3yJ?=
 =?us-ascii?Q?bb7fkzuxNOs5WUy9cyNrBTdfRjrWM4ZHz2KlwVGAYwpOoVTy+ISHbiRVy1zr?=
 =?us-ascii?Q?FxVkJx+87rQcUR9t0uCyyNz6eyx390a4/nfEPd55sid0WCJupi3HYy+OuhvU?=
 =?us-ascii?Q?EF9/IFeU1Qce2LSOEpjdOmDvdkB+IWkA0gep4wb8Y2c9I1LYcNVb/46pnGms?=
 =?us-ascii?Q?cYda6dtHwlYcxuilRxie62OG/Tr3xvEbRv/y45h6oiNbFrUyBolqupDC/qWr?=
 =?us-ascii?Q?QBKxHe5JsokFExQEgOYRTdEpcHHHOxpQBwIk80uaIwfdCvww6A0GexsfuioN?=
 =?us-ascii?Q?iyExSnGFYfISC8NS/nwPnlWLkzX2YLWi094EavYYphPlas342ymyKNTyzEET?=
 =?us-ascii?Q?svmlJBB3rm+FWo10GbJro3OgP/q03zr6JeATn9dyd2HQ2qDR/nMgByYi84SH?=
 =?us-ascii?Q?Yp46Otf3goceUGzJQljNLrnQFNPCqLGLJoJmfb4O4ZqJCh4cDHyj615tfOQQ?=
 =?us-ascii?Q?li+Yic0BRnGxtnmTrCD3PFvM9TeHP1Yn1XJ/h7ow/JoUKRPmCgyLZ+bmHzwW?=
 =?us-ascii?Q?eEY5fQ19kDRptBxm0tLjWvyFYr/H27vZGE1watCapnrzrrDs68eqoDt9tJjl?=
 =?us-ascii?Q?dXHEEWLgGd1WdXFzb5JfFV55HF4WavdMpP+TyoFg+zRpJ6bY2MFT9oB2/1ST?=
 =?us-ascii?Q?WXeR1iMe2ysMdF7liyUCwbMMFfuxybwkzLi+yHZqwYPqzUzLrekFgm82y9sd?=
 =?us-ascii?Q?rziRGOYAWNsvTEu4pvTNXZaz0zA4n3/YTjG6xyR6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	cLMp0vzvRwAgoaRbnBTtJhgzs2T0IqJdjA/ZJakiHw1ofkTW/3ZInMiiUKMCjXXMlPpOfu/xagP5Y+Y06bKWO8CJTtF0iGLSCSdUgXyd/+kyOGyGOwQj4vrGdUwL0FsccoiEgwQxeE5p+WJZdXr6qvWxxeEFK0KQ22Y3J21f6QZF7aYz8i9iRVuSlTae5hi8hB+5t358DS2d5BDZ//7rOAqfojnSI46aTrl56uCXOO0XhmIo0b8Mq7WupSL4Es1tWOQpP3tlYfE18epnYAFgceFxO+3OhVP/BTTGv3OYPG/12IADEvv3l1bsFSpLJDuEMb7rangyF14Wf4VVenDsCU2Ei7TqqUIlk171geiQMw3E5tu6jDNh0SRMYyG87Q/2zb+laCtRVrZbCapNSpeMVkASLO4yxRYkioPFOa0F2yk/iBjFw6NNX2tQNapvhogezj8itVac6adgsqUwXmkSOxspVSMi5nc4RomxvKUHmMhi+ix/jJbyJ8SkIlDO7i7rUIkdlrRSBdJMXnpZZQ2gkrueA2Tigbpo4M+lihasQcWWjAiF8SbE+z0RZuwMjmOv6IPiZd+4ts84Dnom55AAPPXCCICKZPQRRzaFGcktEmc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 324d75fe-88c5-4d4a-1275-08dcab2163ac
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 14:11:47.5789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TR6kKye+dYKhqskCpwVV7S6MhnekZT2ffOfLOgigGZNg54v8gI7imOnHiNhpHh5sWbZ2e06MzPT7z7boppRG1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5067
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-23_03,2024-07-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407230101
X-Proofpoint-ORIG-GUID: mOavw-TxLRJi3Ub5OCLEbHBuT1R7MS2d
X-Proofpoint-GUID: mOavw-TxLRJi3Ub5OCLEbHBuT1R7MS2d
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, Jeff Xu <jeffxu@chromium.org>, Kees Cook <kees@kernel.org>, Jiri Olsa <olsajiri@gmail.com>, linuxppc-dev@lists.ozlabs.org, Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Bert Karwatzki <spasswolf@web.de>, Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, sidhartha.kumar@oracle.com, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [240722 10:25]:
> On Wed, Jul 17, 2024 at 04:07:05PM GMT, Liam R. Howlett wrote:
> > From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
> >
> > The arch_unmap call was previously moved above the rbtree modifications
> > in commit 5a28fc94c914 ("x86/mpx, mm/core: Fix recursive munmap()
> > corruption").  The move was motivated by an issue with calling
> > arch_unmap() after the rbtree was modified.
> >
> > Since the above commit, mpx was dropped from the kernel in 45fc24e89b7c
> > ("x86/mpx: remove MPX from arch/x86"), so the motivation for calling
> > arch_unmap() prior to modifying the vma tree no longer exists
> > (regardless of rbtree or maple tree implementations).
> >
> > Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
> > Cc: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: Dave Hansen <dave.hansen@intel.com>
> > ---
> >  mm/mmap.c | 12 ++----------
> >  1 file changed, 2 insertions(+), 10 deletions(-)
> >
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 9f870e715a47..117e8240f697 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -2680,6 +2680,7 @@ static void vms_complete_munmap_vmas(struct vma_munmap_struct *vms,
> >  	mm = vms->mm;
> >  	mm->map_count -= vms->vma_count;
> >  	mm->locked_vm -= vms->locked_vm;
> > +	arch_unmap(mm, vms->start, vms->end); /* write lock needed */
> 
> Worth having a mmap_assert_write_locked() here? Would make this
> self-documenting also.

No, this is just to point out it cannot be lowered further in this
function.

> 
> >  	if (vms->unlock)
> >  		mmap_write_downgrade(mm);
> >
> > @@ -2907,7 +2908,7 @@ do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
> >   *
> >   * This function takes a @mas that is either pointing to the previous VMA or set
> >   * to MA_START and sets it up to remove the mapping(s).  The @len will be
> > - * aligned and any arch_unmap work will be preformed.
> > + * aligned prior to munmap.
> >   *
> >   * Return: 0 on success and drops the lock if so directed, error and leaves the
> >   * lock held otherwise.
> > @@ -2927,16 +2928,12 @@ int do_vmi_munmap(struct vma_iterator *vmi, struct mm_struct *mm,
> >  		return -EINVAL;
> >
> >  	/*
> > -	 * Check if memory is sealed before arch_unmap.
> >  	 * Prevent unmapping a sealed VMA.
> >  	 * can_modify_mm assumes we have acquired the lock on MM.
> >  	 */
> >  	if (unlikely(!can_modify_mm(mm, start, end)))
> >  		return -EPERM;
> >
> > -	 /* arch_unmap() might do unmaps itself.  */
> > -	arch_unmap(mm, start, end);
> > -
> >  	/* Find the first overlapping VMA */
> >  	vma = vma_find(vmi, end);
> >  	if (!vma) {
> > @@ -2997,9 +2994,6 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
> >  	if (unlikely(!can_modify_mm(mm, addr, end)))
> >  		return -EPERM;
> >
> > -	 /* arch_unmap() might do unmaps itself.  */
> > -	arch_unmap(mm, addr, end);
> > -
> 
> It seems to me that the intent of this particular invocation was to ensure
> we have done what we can to unmap before trying to unmap ourselves.
> 
> However this seems stupid to me anyway - 'hey maybe the arch will do this
> for us' - yeah probably not.
> 
> So this should definitely go regardless, given we will invoke it later now
> anyway.

This was covered in the commit message, it was because we needed to
remove the VMAs earlier for a dead feature (mpx).

> 
> >  	/* Find the first overlapping VMA */
> >  	vma = vma_find(&vmi, end);
> >  	init_vma_munmap(&vms, &vmi, vma, addr, end, uf, /* unlock = */ false);
> > @@ -3377,14 +3371,12 @@ int do_vma_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
> >  	struct mm_struct *mm = vma->vm_mm;
> >
> >  	/*
> > -	 * Check if memory is sealed before arch_unmap.
> >  	 * Prevent unmapping a sealed VMA.
> >  	 * can_modify_mm assumes we have acquired the lock on MM.
> >  	 */
> >  	if (unlikely(!can_modify_mm(mm, start, end)))
> >  		return -EPERM;
> >
> > -	arch_unmap(mm, start, end);
> >  	return do_vmi_align_munmap(vmi, vma, mm, start, end, uf, unlock);
> >  }
> >
> > --
> > 2.43.0
> >
> 
> I hope we can find a way to eliminate these kind of hooks altogether as
> they reduce our control over how VMA operations are performed.

Agreed.  I see a path forward on doing just that.

> 
> LGTM,
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
