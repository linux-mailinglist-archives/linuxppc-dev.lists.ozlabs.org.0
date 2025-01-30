Return-Path: <linuxppc-dev+bounces-5710-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BACA22D19
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 13:52:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkJpD6HkXz2yXd;
	Thu, 30 Jan 2025 23:52:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738241556;
	cv=pass; b=iWceR4uN2tBooFLBmgTpLalpH/hAXPLCG2j/xwbN66SvyF0ydfkFsaWtsTPiHbRb2ocAyMAUzmtJKwo5OQvhrkO9yBGTeKvOgGpQjDtqYwgEItRVXql3+VF/LUx6638yHXRn8higzW9RK527DEqitiHLTY4DWwpb4sJ3+225rc3GmwKfWVHFWFvT0RH8acg8DyntpNkP3yzTNAjE+INYMo1E9sds9c48d7Dae1ELZ0vRJHQVtXq8cBYHr+WbDtUu4BxXbtK7c7eqxyC1mKH/TbwuNgtVJ0ZXwuZrPpE055CKWDocMc52P0A9x5QiRi/K6XR4fnRVndGxovkLbv8hMg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738241556; c=relaxed/relaxed;
	bh=qYezRoozm9Wjx2E3RJHan+GQspple+HA5+1gMy2bn3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YFWC3450YtFVKsBF7lnqbHUsrSg2Pp9jnL39FZXAwcnXSZ7Wpwvxws8/3e5GkYJUJ5u1MQbN6Tdf7QAH6X9a+zKJWx7X59N0uUHErMl7gzH5FrtH49VN9qGCS5aWZLcYJlc3MQ8N3FXjHxw/WZFRMv3brzbJsdcv3HLk0vv0btN4wIt14ZGWIAWo/29/edX3jyw711hi/FNmh+eKNf4I0pzn5vGjId2a3+m1yuNKd4UoR1JBteitWtWXoqyQZGwKVs28pKO56PbIzV8WbYNNBUd0jNhzc1DURBsxt/1MxKZ7uNAXAypOYvWA6g2fIXwdflfummKj/XEGFnBkMKR6bw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=RIoGbK9C; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=YEr3RMzs; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=RIoGbK9C;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=YEr3RMzs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkJpB6Hdlz2yRM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 23:52:31 +1100 (AEDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UCauux022582;
	Thu, 30 Jan 2025 12:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=qYezRoozm9Wjx2E3RJ
	Han+GQspple+HA5+1gMy2bn3E=; b=RIoGbK9CY/eTLbG/tu0tu3KIbOpCRteVoX
	qAaO1/I9jv0QBPE8A7xFO8RF5xVfpVV91TnqlqvMfHhW1UfRkF9t9C9sXJHp9S6n
	LPcF6rBuaoRpxWqmEgrSbF36Lm8pHxG7xrOijqS/R3vQK1fpSfRXTG+mKfN8pU8i
	vjrbRKQbxrqYJMBgXaj967maYNfR6xH1i2nBrVkYKy5DBRCbspv2LyfnN0anYcJC
	FLkxUAD2ZOCvZ20FG23j+ZCRIJzYDpwIo4QL9FT4FycgVqMHSKgp5QufbCarZSCp
	kB1IeHSzezgvlYpsnLVoMN4ZAnUIIRQ4e7h8ia4sg78A8f2YFbXQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44g9k4r0m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 12:51:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50UATX2J005386;
	Thu, 30 Jan 2025 12:51:54 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2042.outbound.protection.outlook.com [104.47.57.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpdb6496-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 12:51:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzHepfceB838+17Bvdu4NpQWw3cwU2Z954Jo4W0eh1ipdUAJLvqVcC3C/81NPDI2Ti3C+M5toUBZaoT0CRO8XB1e4U5FSBufZ5ML/lkaWHWRBH0AjGM0XjDfSzH/pvcK20OrU4xY/zt6P1WBQbAb1mFCKQM+a/W9KLp0LO6GVvWtgkXYLLEp7cq1djPwqXgelOAO3z3+JSVFfeimhpuBfgKps2la4X8Gm0g7Q+HheXSSdAXJd6oGmmoI1XxVWCOZoRe3iPnHdWl6NTYp7I4lzDNxEWZ2Skgjsx9XBUKYK2j2md8WNXAMJQWZu6JaixK11LlE4dKzdJ/FvyXPqMPrbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYezRoozm9Wjx2E3RJHan+GQspple+HA5+1gMy2bn3E=;
 b=mWjYkWgqYFE1EWcygmGKwBy72UDzV22V6spN3R1uwN1xclm0sUn9GpRZ8euV6OvDapJEdMiN5zv6CTg0QYc3iZmkGUREcQcj2bUjspkFn56mYg1wYhaX9XdKI+DbYZ+WqKK0qCVgqWPqZsjIN0mnqUzVSV95Zpaa8fFh/N14BSVmh6ro9jWYK/OMc+b9kYkPIzhd3sVHHOtpJePqZCybolxICw3vltYHdK/H4RKAJz+7Jw3+MjKqCEOQWDrPGEMGyrkdzpKsTQUn/UK1DgtPY+1X2vk2b0tHidjE0UqRFPYuSQanzy8OWZ3d0XEHLW11hecKlOq8042zAhczpUtpgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYezRoozm9Wjx2E3RJHan+GQspple+HA5+1gMy2bn3E=;
 b=YEr3RMzs3kIhPEi9NCdv5jU0nu59mOBUT7z3UXsKxjKuNWHsEWe57zbnP6R5UeYGR9hNs/sni1+qKaqdOGqa8UsWPK5lbGn7MkqjBzMJvdFlGztvjcFUK1BNypDDtbRDErCSD6YwSrujP5sQHFvveS5byZOi5NeRF0Zge2qkFnU=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by MN2PR10MB4333.namprd10.prod.outlook.com (2603:10b6:208:199::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 12:51:52 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 12:51:52 +0000
Date: Thu, 30 Jan 2025 07:51:48 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org,
        christophe.leroy@csgroup.eu, justinstitt@google.com,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
        maddy@linux.ibm.com, morbo@google.com, mpe@ellerman.id.au,
        nathan@kernel.org, naveen@kernel.org, ndesaulniers@google.com,
        npiggin@gmail.com, Matthew Wilcox <willy@infradead.org>,
        linux-mm@kvack.org
Subject: Re: [PATCH] xarray: port tests to kunit
Message-ID: <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, mpe@ellerman.id.au, 
	nathan@kernel.org, naveen@kernel.org, ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com>
 <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT1PR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::15) To PH0PR10MB5777.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|MN2PR10MB4333:EE_
X-MS-Office365-Filtering-Correlation-Id: ce4013fb-8d7b-45d7-c303-08dd412cde2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6IldgG4hhoXTuXGTTfK6YIpMJFZjxg3e9yam6GFTmYo6t0hMkpH92oTDwWSB?=
 =?us-ascii?Q?wTGA1ahRi4RVW8UJQa9M7/JJYUT8GT5jcD0uJjtGtxIOsbpwlsJRgOIiyTO5?=
 =?us-ascii?Q?YsxiouSzb85KPck+hYoZVWvl5S7KSdtLfWMPaXKiI3mWbCo8z3HtBnLqXeIo?=
 =?us-ascii?Q?WXv7RIFaqHWjAmy/UFEc0f1gFv6hvRyKSUQtVulZUJ9yFa1b9P0vVN9242RQ?=
 =?us-ascii?Q?hhYQrnOnxQDqiwzFklTsChf0aRy1alRcSZ6oMlTsxrkwA9w8UtOnwfvQX7/i?=
 =?us-ascii?Q?92reNv99XdNBb6OhYzekmtgDeltRZJo1j1OLapoXmza89A2seV4YkqZLfE47?=
 =?us-ascii?Q?4tq5YOCfqu+3WG+Leu235dhyD6p5wGcM/bnK9U+a5ExMBxqUPmKQEKmCvEiK?=
 =?us-ascii?Q?YfwS50D9pHoPR+LlsenQL/nWdlwcbVIkJsleZ2OI5LLvpvqRFWWsCPVQbW/q?=
 =?us-ascii?Q?kf6u9r2CZnL9d9kEJhUqSdxiSnZ+6Maz9ejHREfy7swya4dBOfNRiZ/KOOYN?=
 =?us-ascii?Q?Ip2ZtMGXK+oF1ka+iAJVvqzMWRRxz59fArEnrt+rts4Rug54DolKpdDtq/pp?=
 =?us-ascii?Q?oHfd7/uaPhItYqJ8P+EasxMv6MpFi9IShOOttm6rHakaJKyvtQZEjCK2eTu8?=
 =?us-ascii?Q?UbZoUcG37DzCygIScViNfctZm1alPec80SgOFZLrMcknQERP0b3CNjZLbI6B?=
 =?us-ascii?Q?GVueFUN4tLTejOnp3KCfFudMJYB+layTqEFjYSiWPxDuMWJcaTHYTaiiRi2+?=
 =?us-ascii?Q?OWzj6sboIIo/kS//h5Nt5J9Ae48TevTv/BdqmvonFobRYVJeU9J+hNEaPfXT?=
 =?us-ascii?Q?g0gptSgVEMfws8eFD43o9XrmbSUELrPCUc7BsftinFwZy/DAKqm9dLbSDkaQ?=
 =?us-ascii?Q?Oqe4UgAkh35AIAj8a1EWGCRR6ewprchcofOuznOx9883lIOiyACz+8OLFIlS?=
 =?us-ascii?Q?8PY2hfrbmxLGFSRAu5HeLhalOZLkpPXMLOiCbfpWB0uJqIKtO2wQ7hQUvFhl?=
 =?us-ascii?Q?cKkfZ4nlkPaXmjbZgL5B6kxH1EeE+zdxplqinTIYoekCxpDx+GQ0Dn+XOgq1?=
 =?us-ascii?Q?hljV32etrZJu/LEP/PcIaGAwJ0jgUhJVZU4QeTF2KYvzH403wGavKUQymMgf?=
 =?us-ascii?Q?U2j7bFaTPzPfgh+gqJoZ8JlSXh/ho9K+nfewXSwnFCybzuiZKzMgLgV6frXg?=
 =?us-ascii?Q?1e/YnYxjEBk2jd5g+JBG2QOP67spDj+OHx+i2W1yBKJdZM7i9aujek+5/+dW?=
 =?us-ascii?Q?b+Z496JxZq2Nx5fhjCHKK0WkLU51lJfS6k4tNY9P9uONs2S1jfJMt2ACa9mg?=
 =?us-ascii?Q?wz1bNWDC0TUoE5u7eTbtufzxvJvECRBheukM4KS0ALmIIw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3ivupZKyebXgnmVGHdVKBJpOXwUilbtnIsFptNVTdKCQc2p9wl+wi8BjKWVQ?=
 =?us-ascii?Q?brVPyZcWqD6rGWVx7ChXZ0fb4T+/XyePbBGV7SZWyv8VIayNg4NkLrYqbyGL?=
 =?us-ascii?Q?LNn/oWFWuEq3Xzrdsw5f8TXocPJsCUjn+AUDoMQk6PYAs8fWAYyg1htvZYXp?=
 =?us-ascii?Q?V05ewxpJb4EML0hrhB42cyJjOHPdi419x5dATzLkbhnbDIJJIR5BGirRmPfG?=
 =?us-ascii?Q?9QLPdXjlJ1tc1VQGNn/VzGKOK0eBWIXEhl1+yGLKlRfX0pAZCX0N33pRWD1k?=
 =?us-ascii?Q?7b1T5kfL9JjJ601ubjZitH/pCFI+UYsaBP+y+/dTJPDmXX0/4Ot86KLmm6SY?=
 =?us-ascii?Q?GH75jmn4bSUAtKAGMAJYN89CunYhN8zR96VBMAWp1zCD9hFy6FbKcyd1qzfs?=
 =?us-ascii?Q?edSkK19iievHDKMq1DtO/9ffx8zlB77N/lAH+cZoBdQCtSf6HlOtJN6V/eGV?=
 =?us-ascii?Q?lcPEhQHmppNbEPp1VwEjkIqCo4NHEhSwVnClLVF+dR91ad4zA5ViA75XaYI1?=
 =?us-ascii?Q?sd3fduzZDHiFqNDFeVfw8VmS8/z6ZBUEIc6jSXawh+R/RMuO8uecw3jd+B4K?=
 =?us-ascii?Q?XaLxwoIBT1d4/rUx+2pcOcVt2PkrxO4n639rAM1wwWBlrOhDragQXsBgd3uY?=
 =?us-ascii?Q?lYVoO1MojguGvNeHbE1vho4fF9rVrtgyDqIT6ZgXjrP45uRTygAZkcEgwKSf?=
 =?us-ascii?Q?4Z42XAqOv5rQRaVpc6W0fTe1BbuCFStjZlNjaxc3PZpWncJC4LVGZFwHYZ8R?=
 =?us-ascii?Q?CSq5kGdMJ2vQc0JhXQe5hleyxX0kXG531s7AAaB4csqBAwbOXSPAIySg84f4?=
 =?us-ascii?Q?IyzzxElt9PB345igU9u2DJZiiyES2w0qoiQZXOrPZHfuPrnBNX9tPN2cHlNw?=
 =?us-ascii?Q?gQxmNcBqk5N4hddPqEcA9ItHSuAoOqq92Hm226iwUJetbVSStcipads8RB1E?=
 =?us-ascii?Q?gPOCJaQvEbk/bFxHRMgRsdRlK2VJQa66D0w4pimHkf8MmdAOBdTjZt5ktFhY?=
 =?us-ascii?Q?+msVx3H793mVtaHoGr/GxsNsInW8d4uR25xQqZWLs3bUhqsyAamWNkYvd3HT?=
 =?us-ascii?Q?vLFKXhgss2NWxj9+B8sfdEELwHib/QrPPAVpolTCg6TmbPS6pej/am9LeVoE?=
 =?us-ascii?Q?57jvWlV2U8xxUunG/AUiVo65UJO6SazWmjsE1JfjoT+sL7U3yc/gFtDytJD/?=
 =?us-ascii?Q?vpV6DxfrZTDvM0OATP+o7kRqlyuzHcSMJ+wcPArKHC4PX9OzQixUHoIowoJY?=
 =?us-ascii?Q?Vr2Xs2fn11GCN6ZwfhPTDO9wglEb3OEcyHcmEkRWYlDaabS49GkShX0Xm2cz?=
 =?us-ascii?Q?ftE6l9cCTOs047eEP7EMLONK1puuisZCdDrB5HqjlU6RAe/UTlQgiBV57aQ0?=
 =?us-ascii?Q?SAan1MDIuWTlBZop7y7pU2vLANhn4Khw4FIEDO/cxBOhi8eGKtvbWs753FYZ?=
 =?us-ascii?Q?t0EoZE5CXsQAMDYJZAtrNexIyey6HIm79H7htGyevC7tMZTxGSApWKjmFiHe?=
 =?us-ascii?Q?kUuKDFgwYrEKRDeRlLg2Nj0YQRieysh2GMWkCh/NNbPfkzc9HiVNv5NBRBiF?=
 =?us-ascii?Q?BKtDhDl1yiFvyn9m3CXn+aE0qys4e2tume8xJi2j?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TM1nm1/RjP28+db3kK4v3WmzYna6OIcteNyGZ+OF9uYRXFbDMNCjzP29FAPQWMnMZpjxuuNJBMqLCmV8/c8WLACuDFy1dS0zfztb+fk+cim/wHMk+GbRaU6QQYij94ieCDA1eLcoPPvFEFzP/XcgY3rsFxuov6i2vtj0+cezbWyJfCjqUxPoLFGjc/rARc6loWfn5VYLI1qv3ydTp1D4z+t2ZG7bREjwDIOz0+f+Jk0d7fjXhUzuYnNWQRT3T8xdt0D2CqEYncotErmQ8ROKrosuRj1JGDQxxTYQhpnn7ANGBcO2FbLRPCp07y5zJRhMYa8w82LyEC/qU626OVMGC3lzHFWxbkSgvRWvv3rPQwXYU2gbqcIPvncuuUEZKAPnaC7zEHoeDGIwuvVoUGIsCVSYnYiNnz9NrpxMEzIRzTTrCnISHHys1gT3Spn4QReJZKIXbIZCHYGk8FGAjARf4I6aqwjcIMTArRbnfKjdz0IgeIYhJx/5vn0PNMaCfIIB2w27FZshqa7mzzqDf+Z9fpwBG0l7LchupxlkOJR4S52I5w0eHfuzjgjyl/nJfbT/L/iqt4lVXXy/BOjKkBhr0PAnwD4/KGXl2VWswQ1s5fY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4013fb-8d7b-45d7-c303-08dd412cde2e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 12:51:52.0835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ldHejpqkfdkyXF3f1Ndi8Jv0tpt+3LXAMkrAriyeJ2yPZHsPr3A1TMNPw1ArToy5Bvh9JStnFph8byA4C47ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4333
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501300099
X-Proofpoint-GUID: dzbRpUesWZUfeeD1CdTQZPualMBJpj-U
X-Proofpoint-ORIG-GUID: dzbRpUesWZUfeeD1CdTQZPualMBJpj-U
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

* Geert Uytterhoeven <geert@linux-m68k.org> [250130 03:21]:
> Hi Liam,
> 
> On Wed, 29 Jan 2025 at 23:26, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> > I've never used the kunit testing of xarray and have used the userspace
> > testing instead, so I can't speak to the obscure invocation as both
> > commands seem insanely long and obscure to me.
> 
> The long and obscure command line is a red herring: a simple
> "modprobe test_xarray" is all it takes...

That command worked before too...

> 
> > You should look at the userspace testing (that this broke) as it has
> > been really useful in certain scenarios.
> 
> BTW, how do I even build tools/testing/radix-tree?
> "make tools/help" doesn't show the radix-tree test.
> "make tools/all" doesn't seem to try to build it.
> Same for "make kselftest-all".

make

Or look at the make file and stop guessing.  Considering how difficult
it is to get m68k to build, you should probably know how to read a
makefile.

> When trying the above, and ignoring failures due to missing packages
> on my host:
>   - there are several weird build errors,
>   - this doesn't play well with O=,
>   - lots of scary warnings when building for 32-bit,
>   - ...
> 
> At least the kunit tests build (and run[1] ;-) most of the time...

Do they?  How about you break something in xarray and then try to boot
the kunit, or try to boot to load that module.


This exchange is a good argument against doing any kunit work on my
tests.

> 
> [1] test_xarray started failing on m68k recently
>     https://lore.kernel.org/all/CAMuHMdU_bfadUO=0OZ=AoQ9EAmQPA4wsLCBqohXR+QCeCKRn4A@mail.gmail.com/
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

