Return-Path: <linuxppc-dev+bounces-5690-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1E7A225A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 22:27:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjwGd0HSGz2xMQ;
	Thu, 30 Jan 2025 08:27:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738186040;
	cv=pass; b=WFQIxjloDyRuy1NWncife8qfRuGNZvkpQYXHq05jKqdKdPkIuuDclyqNwvthgK4LDwL/ULtS8fpYvH3jj57bOX5BWyN08xwWfchsyCZ8EXA/A1CiWGxLPEilN91nZ/0dmhStpM9BH79GUnJfrDysqpNbAvGthHkhjacCV4LQ/R8K/AQGP0YWe4wbIB3J22Yur/wuZpWVq9HrukfEcLoWo1iiTyFuLK3YN5JBx4RBRcerUR2fxAjvYvmZE73OrPbzx6KS/WMDkLPjJUYZvtCVuUYKzYqpPgvcu0F8VYZhT0Sawbg7rjvVvroKZ1GiSzovji7DVibL2he3w6D7GsSigA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738186040; c=relaxed/relaxed;
	bh=mlICB2LZqYBoNcXPOxyH9n6VcIRZchUQew41+3eLiBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=F1rcFuhfWiRwsiuabzTjXHIUxHowUXRicWgY4oKBcn9JMvfZ957z2MYoPGtkjWoXBogHQ3ASelhVFg1z6tJfFjLl9pzWSvzuTW0KAaydSYMixfnnUoRhWbwNgFwVlrXJwZ2SUTzVtk9BgQEArA7VOnje6EjEKDSPAM5wKsraPsMpG11mHvNSVKhpSUx2FWa5gkleck9hL2xPSdxjzAb6cHaoSBXRqjyby7UyIKI+lDQEH7H1mbei4NyNwgwfIXozdvLSmPp2NVMweLKZZD6vxXhur9aATXBAZIWMZrPB24xtIE5JfXkIRljICesZrjJVB3rAw2DxAabZ94gABEDm+Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=OYBi2RnQ; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=eKMSWxak; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=OYBi2RnQ;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=eKMSWxak;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjwGc0H2Fz2xG5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 08:27:18 +1100 (AEDT)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TLBt4Z000756;
	Wed, 29 Jan 2025 21:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=mlICB2LZqYBoNcXPOx
	yH9n6VcIRZchUQew41+3eLiBA=; b=OYBi2RnQTXr+LrzEb3Pw30e4mWf8DLpAK1
	wwJIfjEkHFUMPULRIbWK7m5thiid4zAEsRrT9KGvTqK4GeQZP5kxESYRn3ZIQWzJ
	5FuVWo9HYif9DV2JFee3hO/f1MfcirfWjZzU+Bz/cnDBX/VbwRy/bS52fDryfAJ+
	ySu6aFKyT32bv84em0YyAvF+8nPxbrTvuOj6Nen/UyLwohbjwyAt59s+s1OXcCVX
	6iEHwz4BX7CttVt0fezMgQ3m+gXgqW9/bOCFjwTtMKDe1Jq29qVGono48oKNSBRz
	5vjtiAay4fiLe8eI5SM+Vp95Mlr0EXgNHLM1K0lpnXtD9iZ/+iqQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fu5f87tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2025 21:26:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50TLEuEk022052;
	Wed, 29 Jan 2025 21:26:13 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpdabg8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2025 21:26:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PfAOfZ6laci0xlFH3HetQacc831hPa02rDyqvPeztLbxtQvEt2/S2iq0LoYZ17iMr/JRB7eBXhgctqVCxfluVlAOU++Mbul62anbS/oqJPlZODmsWpIE7RlObVMh6v7Pi62mrdE5lI14M4D9YzV4IDM83OHU1DRdvaw5vkWo/w1JBhOh39/RLkxmqP+/o3TcqX/WSQ7arsEIYAn1EhP9IdqZuLI2S41+hIzD5rfojMT2kttaJotaThGDNyq3YH+0j/sZkzaWFk3AHZT2pcmagY6AOStE5SorE8gIX9StPz/XWY3LcKRcEKBx9L5ApFbGODrwnC1tT4ZRVxgtMbr/3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlICB2LZqYBoNcXPOxyH9n6VcIRZchUQew41+3eLiBA=;
 b=Tm41q/KMqM5AEASOY3KK6OzHYQThl1iyFFyaemEXaHeGiLljeomp1E7Dq6sXy1B+8rUBpr8fTP1occyidp4RiGYmAH+p/YyTBqRy1KtR/04MhTcMm3zbZCicbNaxAwPiIT983Fb94K5i3rNzo8IzUMTlV9l51oWCZhszRSEYRwzZ0R+sI7G3CLAVNB4NjUQKQyGa/4MP6r8PTa8GIIUqsa41zi5+YPTqNUF3iSbuZtA0IVUXE4vn+8g02exM4n7djUU37nNR3iiPM1dP3S8Ax3tPYIvMxNEn+cbmjb6SJixFWwElFMGjq1td3ZTVBJW8uf4zf66zIiNp9mnGkkY8HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlICB2LZqYBoNcXPOxyH9n6VcIRZchUQew41+3eLiBA=;
 b=eKMSWxakGP7AYqTOHi726mmVw1PszKAM2PqHnrR/KR+s0fIG83vMEaUsnYO+Kfwxkd0UH+ZVw8xSFpE+ChA6KgwI8GFW/c6rfpdD+G0koaG/sr7kY8o+WatDTZSyxYhdsOJ5FKwaInIThiKmi6xJ1i76FwR8g3A10I5wqRAjDyw=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by PH7PR10MB6675.namprd10.prod.outlook.com (2603:10b6:510:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 21:26:10 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 21:26:10 +0000
Date: Wed, 29 Jan 2025 16:26:06 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc: tamird@gmail.com, akpm@linux-foundation.org, christophe.leroy@csgroup.eu,
        geert@linux-m68k.org, justinstitt@google.com,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
        maddy@linux.ibm.com, morbo@google.com, mpe@ellerman.id.au,
        nathan@kernel.org, naveen@kernel.org, ndesaulniers@google.com,
        npiggin@gmail.com, Matthew Wilcox <willy@infradead.org>,
        linux-mm@kvack.org
Subject: Re: [PATCH] xarray: port tests to kunit
Message-ID: <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>, tamird@gmail.com, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, geert@linux-m68k.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, mpe@ellerman.id.au, 
	nathan@kernel.org, naveen@kernel.org, ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT1PR01CA0102.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::11) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
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
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|PH7PR10MB6675:EE_
X-MS-Office365-Filtering-Correlation-Id: f546995b-0bc7-4ad4-a448-08dd40ab8c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3FzeSsZ4oWw1XNTzFl6J3T3xRQcW7LyTmjaMH/DQisLCRbNNzwQi848dXgSh?=
 =?us-ascii?Q?k69SaQAEjzmr2w4xYHyOWT865vPQEcRE/bWCaMSG/yDwWYcOQvUXZL3F58Ao?=
 =?us-ascii?Q?jsI47IVmq/Xyhgyg5VC32uxDWxXouAcDpozDnWn7NLjW7jd4zWMSraaY8FRm?=
 =?us-ascii?Q?GNM/NRxUNvwm/5kmIriRr/fQezNFu6Qw+/eLuWdUU13AG3Tw+J7LyLpCWFiQ?=
 =?us-ascii?Q?wqDrDvMz6DnsYyYHCr02lyXBduoBV1i4PczyETDzof5Igpz+0C69GS9D6mOg?=
 =?us-ascii?Q?EaXPzy9HN4xU8bZpNRdVp8dqwb0ekXU9DLFHWbe+wbtHuktC+0pkD7vxExCe?=
 =?us-ascii?Q?u1SEgpcyuionwhWj4GTBYYoqacovmkdf1J6UdRTXZ4wYKBnj6qC1OpBSM9Bz?=
 =?us-ascii?Q?X1rOZNDf3EtpkmBBkZa+fvD54+GVcDOfOA+U2HfPrecT7onWKzrHhZhk9bby?=
 =?us-ascii?Q?e0HE1HspO57JqlbMT6t6rDB/5K41JkM4yMCGj+YiQzC+BDQboQh9T+HfnTRw?=
 =?us-ascii?Q?ZzghQ07WYy9n05xSiZU3fkSUhxlYai/F2S0LS+XfUXqP2wH/GgPbu6kF1nRc?=
 =?us-ascii?Q?0A8sNzLorDcSd4uzZ5ilXrxZP8ptEFs+DTat6Sa0c9yrNZpBVkqRbXwYc/m4?=
 =?us-ascii?Q?LKvP6wUOpoNNYXvjed0j8pUZCdG64NPmsDdSk8K+TK77BgZKIAJOdErwKNDb?=
 =?us-ascii?Q?ocbnIlJl8PTCErnoX4etbwdg3o7ipAOQvgARR2efZdmp0f2Qh3TVMi4TBdRK?=
 =?us-ascii?Q?kqkOuspQ6J5jMe/O98wI7z0P5Rb3En77uqdGj8NvEMiOrtskDq9Nm0MnnBLh?=
 =?us-ascii?Q?WBwQ+IA+SmXPlzKuzSZq7/rUpIXDjQ2E4AQBsRlF8dptgruCMVRSlwJ7R/AW?=
 =?us-ascii?Q?Bl9Wy/z7TRD5xWYvedpBPt517X8qrQ+Uu8WWiex7/K49i5DO4F7G7IcSKKQK?=
 =?us-ascii?Q?87iwjZR1xy2bZ1moSDsrO+4pKYK4eHIPJg3UbM6sFLESQSCTcXsXMMH+MI37?=
 =?us-ascii?Q?dQfWorIxwVtAaMghIxTXbYRqCInnfrJ/VMCXb7X6TayogSeNVBM4prSqJ2WJ?=
 =?us-ascii?Q?VXGq9zhUMQ0vN/FEHPq3ixlGIxdWqiS6GSyuwiLmDhGCgs9x4DqyAU6YNBeu?=
 =?us-ascii?Q?CTyuygIkrM8YA72G9DdPL6HaEmA2rD44FtDa/HxnfIqgjF+OXpBWEN9x7Ctv?=
 =?us-ascii?Q?10p2EabLWzOCtRtEwlc6nErm/q01EZmIynd94s0lWvP4Qbf0ywDmGdx59oRt?=
 =?us-ascii?Q?xOwWEg5vEnXOnWagiHvbgLO6voORlePtMez/M9w2JhAU/MRi7egA8l94d8Eb?=
 =?us-ascii?Q?B7tqVi/il/R+J1sDiLpWuN4h+a1b8rBgCmPjUYlQ2axgBw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/9Q7gk3OX7qNhZ++oU54VkUtiGpjftJVtRELqP3NLhwAOo1EFaU9yl4oEFCK?=
 =?us-ascii?Q?CpPbl2/X4k7SIfv/zRwl+0xpzgH8GraDxETHpMWENRMvjITCDh9rvVfveiZM?=
 =?us-ascii?Q?Oc8H05+0kn+REakHtGIhrKvAD7D0Hi2mXmvYRP8/hUGN3aeVH7zk7f23GQGS?=
 =?us-ascii?Q?tKQI5cJSDci6mtHbUMDSaTzjymubAKt5jbC9NfKsYxkS/p0spOpO2HTXmVDR?=
 =?us-ascii?Q?u/EqwwsbpIAInzjqXrxutUYOZUQOEGXbmq9hjwntINbOIN6ODt5dAl77QWXI?=
 =?us-ascii?Q?QJEX+tu2ObJDa3pqrW+QUEWXMg9yR+DEpZYWKDlCB6bd7Yf1E9/5Yyt4tXDT?=
 =?us-ascii?Q?q4n4moniWBnUDMcoLhurkMKP5aFVykZLoQcU6tGhK12Et2WSOd4tezWUcsMY?=
 =?us-ascii?Q?9dlUZ6T1f18xsgVzIxTfXEBVeulHe3I/p/ij+tvBADW9d6l9A4PiHnVujrYl?=
 =?us-ascii?Q?UBX3wAZ4/emNEzKIvx5XLQIg7cWMfhYYQdVM35QvO/I60SDYM+85n/i9q1hO?=
 =?us-ascii?Q?SqCV0n+nJTFTogkPVdmWEi2RcoSZM3Zr6rrxMhgRla1tLr4thUDh4K7FN6YG?=
 =?us-ascii?Q?ZL1+bMknFsPuDqz08LMnCvZ9XHWHqblDk2wSXBIOEk9nM5c6CSqr6wfGWYWU?=
 =?us-ascii?Q?ZCX8NxlVxydDRBuB7Bw8AZlAMxrMkubxfP4Ntp6vNRVJFi1uAAzcV0pBJuN+?=
 =?us-ascii?Q?kfU1KrKxAZ5AETcqBkyEuqHags8a2gwOiUj8X73PLOeVlSVjVwk7zBg6/Oqn?=
 =?us-ascii?Q?yHPH0kOyNKfELOZpMqWkGOTd7aFtcIUhD+D1A8da1CPXB67laK/YGm9tX+1/?=
 =?us-ascii?Q?ss9en2xiW4MlxCtXLo7kcqhtOc/t0U1h8crOwJJGy1FfTFXMmsZ2+qUxHqyw?=
 =?us-ascii?Q?+psLI0aA6mQfpuKWf4U4SOYU7KcZycWd5QoVVx2tXkur+hOnhyx45KM4lNXB?=
 =?us-ascii?Q?W83l46wHZ0/vs13XFgedtCyMfvo2QcsX8U+AtRewYU7ivrnVu+tZnd9YfiNG?=
 =?us-ascii?Q?d9L74WS0XreOJNMD1l8mlNjgGCyZ3f2y0oJgMCKAejDWOF0kj9ESXbqiHEp5?=
 =?us-ascii?Q?zTihIUI/2sXpR4qJlKqTRA54lBt/Jy4EEjGslipHmwzMjfiqk1GS8bi03rPM?=
 =?us-ascii?Q?uvJ9b8Z501P+FSvSNjBzNNmD06m6WX+ESplKA0qP56pX52YXT6C74j5fTWC+?=
 =?us-ascii?Q?CSUxLBK5lhPX2LIczuBahRyEs/Xdl9l+Nu8GmXEEwGf9+LkdeMnlwti3/MuD?=
 =?us-ascii?Q?WIG7NiaAInhUejyTGcHhhtlTvFQ7PnlvSRbJzNr1dTm9JLQ/xtwDFp1w6Yxd?=
 =?us-ascii?Q?3LtptbyNO4EfUu5JnLiHzasctrDHTS4kTzgSrZ0hVm6VcFwFQCPqsdBN5U+e?=
 =?us-ascii?Q?s4l8l2Q+kBU7BsOVRrkJVAXuW0xrbUoav1qQ3P4PrpEpHJHAL9hgDAwLGUPP?=
 =?us-ascii?Q?J8wcZaj46mS7KFaNWL/CylBw3EFgXsOqTvy4k64/HJ+oFvpOG6vcP+KQZTm1?=
 =?us-ascii?Q?75cWyFDBz0mBZObtt9VBXreqwuCl1R6CJutldCHykR/BNSoOSFghNoltbuNd?=
 =?us-ascii?Q?oDmEszF15/ZaYasHRpueQGnXUavJOqa2asXazjrN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7VcGwYqoDtDhq3wvVpe6LomvX2ElkLahczf7loBJd0V2WoQ8vmZKZyMBwG1YeSGMfPQeSZC8L5H4fi9Whyztv2Aq0655sJizBa1aFKksbDKkug5FADNVzBALJZDpuFrF/Kw/p0Z1tSpApQwTYZhCjD+eU4iCet6oOFccJDYMMx2IpLPR/RApQvOFvtCA1Gftjy59tv6nRSphmAsKKCFQGObq3a2jW3OEcgHxRxxLVBANekXJ63zzKxb/jS5EWDOdQnAB4NuiobonCdENUWW+4IuRYCgfRsN7IQrY4OeOVXjTyFPoO62nY7VCImVmxgE51o/P3OGIJkgv8qEPS8xbYgbD5bTyfzSkX/YCTnn6YJtAUgRXbCvsir7ycEKjxycGXHThs8J5uJXefYmGz7PPszIJc66eK4Hf+NCqoNd9j/zyomGok+BZK9s8lHOmoXujJ9Q2vKDWL4fdUfSmhxxZ2Zz5MrWqrDubtHBpR5duRt/5xQa9UNEeqG+SinjygQe0h8zrO6A/JF0j5wTwtHKfPF88tZ1p+j+7+DPZiTaC9cLXFh+DoseItC5NeedJT3HZ2szfdEX+DHdbxn0GDMWtUIeJA5ZZ48Hm1JClPZzzRiQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f546995b-0bc7-4ad4-a448-08dd40ab8c91
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 21:26:10.3672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rg8CGMzYXhdRKnEU7QaNDM8Clsf1NnF3GfLUULsn4bQGbHztlpoUqU/IBYTrWpiZzAdcoBW0Tiusb9fjhl4yMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6675
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_04,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501290163
X-Proofpoint-ORIG-GUID: 50NzgcVZjlod_ABiyfuU6WYhkfLVxF8C
X-Proofpoint-GUID: 50NzgcVZjlod_ABiyfuU6WYhkfLVxF8C
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

* Sidhartha Kumar <sidhartha.kumar@oracle.com> [250129 16:02]:
> + Liam, Matthew

+ linux-mm

Thank you Sid.

> 
> Hello,
> 
> I believe this patch needs to be reverted for now as it breaks the
> user-space build of /tools/testing/radix-tree with:
> 
> In file included from xarray.c:11:
> ../../../lib/test_xarray.c:9:10: fatal error: kunit/test.h: No such file
> or directory
>      9 | #include <kunit/test.h>
>        |          ^~~~~~~~~~~~~~
> compilation terminated.
> make: *** [<builtin>: xarray.o] Error 1
> make: *** Waiting for unfinished jobs....
> 
> this then prevents the maple tree test suite from building.

How are grammar corrections going to the right person (but not the
mailing list) while an entire conversion to kunit is not [1]?

Does the patch really need to drop the module testing too?

What exactly is the point of converting one testing system to another
besides disruption of actual work?  Who asked for this?  What is the
point?

Is anyone doing work on the xarray running the kunit tests?

This should be reverted as it should never have been merged.

Regards,
Liam

[1]. https://lore.kernel.org/all/20241009193602.41797-2-tamird@gmail.com/

