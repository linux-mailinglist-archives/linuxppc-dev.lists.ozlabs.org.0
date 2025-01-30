Return-Path: <linuxppc-dev+bounces-5712-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B8CA22EB5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 15:09:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkLWK4bF4z2yys;
	Fri, 31 Jan 2025 01:09:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738246189;
	cv=pass; b=NwzneCJoB5ZhLNkBUy1o3rMGJA3fpfC74XzHLmME8zybuyh/SGlMRckG0nt1j5s1iVHa2BvZn53MUpRmp1C43//L+XfxHDzZq0zQtBZ4ls0IeuJZdZ0zOzutw32aq9yXqZlKzVtDuyot2KCM24RwQhCAq6+I+uoAmAiuWRsMm2IruTnBJtAOI8AjToTi/XY1Wgky7AYypuqNMZQNFYYSX8Hv3WN9SNkOavmzz2TJqJVlH+wMoIQyUCrZnwALch4N4hJ5Huw26I2Q9eC/SmjCB3k145uCqfRe3qnTGnywOU6gUaOtV/7/CvbLAm4amVjLMarl8fJH6jw8F8ddjnWBRA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738246189; c=relaxed/relaxed;
	bh=KC1rrQ/5Y3m0Qw2o344K+BOO2prMCP07CU/9hXop+Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YRCkab2q6PWQPQ65AfWe6Ff3Hc/C5xtBjKWwgTvc3kwatzem6zw+mhBDsJ3A/SsJk0wLTqHocEJIp6iJsZhP+2uVazF2ctSWy1W2+N5+OXXthRa2n5NuomQQjTwXyr6A+r/ixHfj39qa/BxKzpf143uJ83eOpdNmq8a9sjmo84xEs2Xn8jjnwiqrC9I0P/QxPvusTeBOg6rbmIvZu9mrsaQYTA1JVvLZ/rIIC+tCoI9cxdCRDtr50R/rs8W8Ne6NDY8c7PK4LoQIbWxEmo0yJ0NKi2QBceUoSOSExI8b8weN7A3wt35eKQcKZBk3IP1Il+OqPUrMW2SWyh8x7gO9tQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=LnLWwoqn; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=rR02D8WX; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=LnLWwoqn;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=rR02D8WX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkLWH6mXZz2ykT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 01:09:47 +1100 (AEDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UE7HmE002709;
	Thu, 30 Jan 2025 14:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=KC1rrQ/5Y3m0Qw2o34
	4K+BOO2prMCP07CU/9hXop+Kw=; b=LnLWwoqnQMLsfURJLabiXFdt3eBIrLOTx5
	krwspoLzQscGhZGdRAkuhTO2toy0oza1CvmR/9zZXcVoJY03L6XIcfPuSbVOYqzv
	4LwRvrVOO1B1f3bk/c27Q/z8sW7inOZBW2Tv3+khv5LzCLBx9tpXVNN+Ws0gbfN8
	0SZOd7rI3G+3tZUMwzCKmTrarcLo7Z365T+OaDab36G/km5xbZtBAo6dXOhmmGHb
	bFQCgrPxv7vjUzKDUlPipcwoJcQINPlUwrzMiCRCqnXCG4B3wZPBg3NSeXmlrUeu
	CWFEGXoyD8vuJGx6477+qzGzmPnZeabN0k32M2vbHCTkvKVpCRwg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gawag04y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 14:09:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50UDeHZc036174;
	Thu, 30 Jan 2025 14:09:16 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44cpdb45xa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 14:09:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSzIgEjPREoNlnKCKZKKR8EC4e9OOPBKtT5QUbBp0ySpkd8+fYBs8QpK4PueWuxWTCmSUVzxwgv+mPx+Yp/N0NGPap+zz/KCB3Qj65Xush9cm40xV5do/uo6hOq/RrdJc2TSL3oNzxJCF+KoTLCDgin8gV754JSqNSLHixJEBD1ajjN4FeAYRtHKHo5SDdLVzYBz5UM1X3k7oamfL1N2XnYSIvvhRGF4h8be6r95jTOZRC8gBcQIJwlsMh/64APt7NwhwvqyLW4mdd+wTbgKl00zLu+lhcrHNxMX2BfivwQstHjUfue9POAKK+wpvtrbvYhmYecS9/4sMgLpe0M9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KC1rrQ/5Y3m0Qw2o344K+BOO2prMCP07CU/9hXop+Kw=;
 b=MoqTlJVskJBp9DZ7NaAxTU6RwdJ87DKMYGjtXgPf490TAt+A9sstA35WbrDUlZbaPF9Vz2PP9sL/xIoCZqJtBdv3tHvwiD1V5BgPxad9lAXqFfqDZo0Bjq3PRIu3kA1Y3+wlEX11yiMCbyTtFcqBhLklAT7gieLx3enHmIT8LkW02iY7QnPMl/ATJqgaMhKf/r5spUusKON2PxyT/lZrP1Ti0P7lvARUEZD9dWn/WwGnqXXZyXwS1q0dD+VMtV07RG46TZF/rnLQqePOou0X65bgtctRdhTEeiJip/IqbLtKvxefs5yATqzrexezubPdDIlUHgwdTSRZbNqF9uXC1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KC1rrQ/5Y3m0Qw2o344K+BOO2prMCP07CU/9hXop+Kw=;
 b=rR02D8WXAs26aRR7k+RW/4ThL39NRTw3Scof0Xxxg3X8g4H2k3uf2tPkJMTLFXT9/og7tqLJzbrFmz+dv/8hIAEfM3XZ1uKFch6HyOw0NdtSHNr8avbsRikoTaHqRUPDda1B+hyV+1XyU/USrkBw0lpvamaCPm/2KshYLB+Xql4=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CY8PR10MB7366.namprd10.prod.outlook.com (2603:10b6:930:7e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 14:09:10 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 14:09:09 +0000
Date: Thu, 30 Jan 2025 14:09:04 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        akpm@linux-foundation.org, christophe.leroy@csgroup.eu,
        justinstitt@google.com, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
        llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com,
        mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org,
        ndesaulniers@google.com, npiggin@gmail.com,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Subject: Re: [PATCH] xarray: port tests to kunit
Message-ID: <9636ed9d-3bfb-4dda-98dc-f945c9d53698@lucifer.local>
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com>
 <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
 <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
 <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0131.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::12) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
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
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CY8PR10MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: cde41679-ada0-46a9-1565-08dd4137a945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yA3obLXi94M9MFNoGMHYAU4ry7zvXM2ZDUPHy0CUlRVygdeyxfSOewIE0iCr?=
 =?us-ascii?Q?LjPm7j9zySQoMHEB//DIzHddpY4zbt1og7bb69xK7e3VI6rpYNDWJlR4bOcE?=
 =?us-ascii?Q?+pAQlDPoDHSclKRyGMxDhUoo56mRyyL1CMbkxcNaTp58YmoG1voAWsDknavh?=
 =?us-ascii?Q?5DAIkowsOODUst3PuAcFxi1MCnjPLEbKLdcSH6hKtKT9tXJ8ZZDiOlYfkhHG?=
 =?us-ascii?Q?BgBXUyy2uCzNTa7xTCUhQOECIssuxCr8i6W9RASHzjVdACh3G8wqSt6hebC/?=
 =?us-ascii?Q?wzZ7KiJe/UjtLxAu04imLEf+KeZ74jbz5Q87IVpDNgUyI13ZaQHEL8k1WELi?=
 =?us-ascii?Q?JaPqFCS+aWKfmooQKS9TdVSqgse9+Dx4rYi8b13Gkj7UzJ9wfOyFeHvxbDEt?=
 =?us-ascii?Q?IlH6Er/T7RfD+YakYzfLRKz5s/bTLS3KH+84/uF+gfJLc4ysm7NPls4us1lb?=
 =?us-ascii?Q?eCnwynRwd6qwyYRxudf8ZlJrx9rC/AT37JEsZgjuBXu+fy9bP/ykpEo9RQ4s?=
 =?us-ascii?Q?5i5ZoZ4VpYFdb6Ou/xOIDIjp767cA0jnomWt4OMXoNMyvydIosdb8mEmpZXU?=
 =?us-ascii?Q?ttYi6sOILwY1kIfMJODoxp9VqyXFhNND6c19vB0Y4F+MFxb0XipOV8HIcHZh?=
 =?us-ascii?Q?LqlKTcmCQz2+Va3eabEmWyGCXGaBenPIqx7JLqlvyhjpITYumN2U+a1c1j23?=
 =?us-ascii?Q?Jek3Q3iSY4/WXbc+ZO25JFZ38y47ihHLGoHQsoiljbUxtmrUda9OjQfgCfeu?=
 =?us-ascii?Q?XFjugxaEA4nigFHSGsXe8pSlWfBfmpOEOO4/32BnvyAmCoJzkZykPj1UHS6A?=
 =?us-ascii?Q?N35OQN83o7MYL4yFMUspeX5u94zC20LqjBEJhh1lwVRIch2/WpRIzE7cXuP+?=
 =?us-ascii?Q?2i289Y3UicRP7+fAvv1KQQGXuXbFGD818JAlpWOEFBr6Sbqu2jU5zs6VYb/A?=
 =?us-ascii?Q?i+qwrAWptLFylf/2kUthVeJzOnEydNgzTKeyQpALoJJtEEFHbKT86WDHVzuM?=
 =?us-ascii?Q?+ZStbIu6uFfLVTnsdpIb4IzLusqsi3sdbpYtxI+ml0KUaXfDr05n/SbIjNWV?=
 =?us-ascii?Q?rCTt12B6LoVGE8V/ddoAbkOR17Xx4BLPdXgKzG75YDlj1f0SKM5cHMlKd35u?=
 =?us-ascii?Q?OjM1lBEDavpPuUhwUIFaSr9wVVJiZllYRqfLgsZCLM6wfW2RH+UiXVDBG82W?=
 =?us-ascii?Q?0jmp79+1AUkdhnJSRzQhDzxlXbbDUwcl+Hf/0ZKN5QeeEZOCf6vD9RWe1yA3?=
 =?us-ascii?Q?c0kYxuUy4lparbcxc9kTMbs3R78eyQxHIH7JYOmopFzhDNsvl2/y8YrRi+Vs?=
 =?us-ascii?Q?pq/k9mYFvbQB1eOHBffBCKzdhSIv2Sm4luCu0CSqVbU40g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7ZN7P3yc8zSqSXt4rpcBl0hXEX6xrUkNXB/n13xHF9fbH8vwPWzMV5LSMJ3e?=
 =?us-ascii?Q?ehRFTFCwbz5SB64wMRczs4871KtJM+t9h1wH29cP9Sw7OIyGi3jeBjwheNHc?=
 =?us-ascii?Q?dzYoeT49a5xpMBUZSLYv9s7dPHUuHG2djhijWj5t6sDY5xnc8w2+tmaCfkr5?=
 =?us-ascii?Q?kzrkhxbeApClsJU+VbRQIBqK3JBa55GY5o1DboK75SzMB0AeWGPZspsDTRCT?=
 =?us-ascii?Q?OXKMqFrRJFP0vY+P8kGLHK5Jhr7tv1Q/uwxtatDG5siTM2hYetYiCoi75z9f?=
 =?us-ascii?Q?9mHUV/x87wYIQGQXk3rQxa1+SDwzFLOrwrvbxO3zVB9DzgeisuGmeN/tuTkj?=
 =?us-ascii?Q?lLcn8ArdB/PE+0O+XoQYJftOoz1bC+DzdtL6He8KbZeXbuYCinn/8eXtFaWf?=
 =?us-ascii?Q?wrGxSMhNp6A1FebVty8mKEiRQ04p5hB6eE6uadqkgHU0kGr5JE6F2deo/jI7?=
 =?us-ascii?Q?3YeokvBeCmB6/e7oVLftqlNWtglwWpVOIJVfad4fi5yIVgtNlap2jaTvQjHu?=
 =?us-ascii?Q?r+0/omDJGqDM8aEaYt/P4LrdpQ4tFauxcYAJZo0W6A0CYc0iEzo8m8FxYWXS?=
 =?us-ascii?Q?0PoEq/7jUFc1dMCVFo1bZpKNh62Jd80kMHdOhGF43r+AIWDSAbgGiJlvTjsr?=
 =?us-ascii?Q?B1N2HFVX7MRUYIejfVOOg9VXpT6kdw7IWwrPQGR8XlvO7upnjU7oPRPCxDT+?=
 =?us-ascii?Q?Bl755MJHj/Yhwga1y+SNU/rlc7+YF4mwSZaN6oDZm21loBoho+squplzmRUi?=
 =?us-ascii?Q?waX7oG8Z+RpXR1+yTdiWFEViC7LVhHwHwlMsExqG4ZN4q99oU1hRZBrpWUWA?=
 =?us-ascii?Q?9Cn3ZNbDqh5CB4VPShm+X/U2RQHu1V94Bm2k/gyzSte2FUwGIBBsPi2fsSue?=
 =?us-ascii?Q?VV2/d9P17Pkyg/+XY5UO98RAE/V/+TXmF1HsPG9mKaEvw6d/HosvnyZ90Ji4?=
 =?us-ascii?Q?g1hrcaIaRRLFZimeq7EcJkq+c8KbMoIYJYrOkNm1AIuVxS6am49itb3bG+RX?=
 =?us-ascii?Q?jKQRPsWCF2mS8+R7buMfWBg69TizG4LSt99cIRnPlImX4UhFXRYkkVDk7JNh?=
 =?us-ascii?Q?m2k1PwnE2DDteo74ObNWhiS08rAzE4CGAUOTca3J/H6wiEWukSxNgjhsuwhm?=
 =?us-ascii?Q?zaPf5Q/M5boiCVjrKcndKvAcP7008S37nn9U7ylJp0UNxfMsEMXrrWLwh+YE?=
 =?us-ascii?Q?Xtf3ETFOk0BiU8HkBDIXmzlOoS5/BPLB+/wiOeJV4oM9AIVhBFqn7DF7X64V?=
 =?us-ascii?Q?WgGlc0WK7C+0GnyHazms84NaehORs49yLZz2faEnISCydLfcqJPhsXt5Fs2d?=
 =?us-ascii?Q?a0bCH9U2atHGIOl3xNnt9AFiM8EjqVi2GLj2EVZ5K26wy3rAuKUlEvr9/1Zo?=
 =?us-ascii?Q?W2e2Yu7ldlOfZFiUSh+djPOJjs/ECJs1wxS+3RULUOCS91t61vOnxw9sHfvC?=
 =?us-ascii?Q?efIr0Jo3HCaT+C6Y3aPQTU9OWu0IkG9SSsB+br/yu2mMBHLmND1WPN/0x6UA?=
 =?us-ascii?Q?lFWr7K6njaP+U8/C1ilpaM7HWCq67nyxoKs1EmmcpbahVS3zCrXl2IE0JVzj?=
 =?us-ascii?Q?Oh0wEb/XTWdKnpb4YQxWxFLY4FXVTwE7vwi6r9Y7naVBAwk81sAD6vQu0CHG?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XJ8Knbe/v503T5k1FnfX13Y/CIHekjKR8LOETovP9tjeeC5/8Ztii/KfQQPOcD7gRDIctJP2fG2M8WRnn1yvWFEWkW5pMSsYgDyymfCxHyb64n5Tj2S8Mummrtc20qtpayRsNEbPXKn5zaVkJPn6DwoTBH36e7Mb9aqP0hFQICdYj96btx2ZXZjoR+J6SWKNrTf0axphQvbwRqzCgtDmfDh6/mV4iyltjk7SIOBSZ56TdJjKVZ5WIYlS+CP9BJ6eIs6K8D2gOrRsbTG09bK9ldg0GNFx4a1JTLKJL8lq6uH240AqucTF78BcPKlKKGIRlSYPJu5Oie5dx49ZcD1Dt1ttFaWpjt35mBt+KuLfNzy72I7eZlyAf0zrTFV1l77i1Q2w0UsmpyIuL2T18VKxibGPIsnvGPmRNxjgx8WJuV5r1Ie7Sb6NxiHD133YOBX5PlxE9C/ruhMxEzK4NRP/GC74Z4bTAInVgj8jWIhT71yfjqwciNLc7koDw7IJPApD+on1vgFQ5Xn42B6rO8Ing2aNnJbjDQvnAsteMadodkRcGJkZYHUWetc7XRUce8Z1ieqMhLlcvBn8o+9gZlQ0g22Zj31Yh8VMQmgQ9vkUQf0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde41679-ada0-46a9-1565-08dd4137a945
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 14:09:09.4761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HurQvezPNd2NzqAldDJpmC+gCnjS4CRPQfDKdDBWpkVHuNkiO81H1OEzG9L+QE+jWLPO4xfMQun+U79eO5EEe8HZWdyqMExbMDEBwERQDCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7366
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501300109
X-Proofpoint-ORIG-GUID: l_RU5oI9e-pnXo0vB4PYCPQ-doN3_tXt
X-Proofpoint-GUID: l_RU5oI9e-pnXo0vB4PYCPQ-doN3_tXt
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Geert,

Having written a ton of test code, I've unfortunately encountered a lot of
this sort of push-back and it's HUGELY off-putting. Writing test code
should be ENCOURAGED not litigated against.

The truth is far too little kernel code is tested to any degree, and this
is part of why.

On kunit collaboration, I attended an in-person talk at LPC on kunit
userland testing where it was broadly agreed that at this point in time,
the xarray/radix tree tests weren't really suited to the framework.

Therefore I think the healthy means of pushing forward with integration is
in sensible discussion and if patches, RFC patches in collaboration with
authors.

The unhealthy approach is to needle one of the biggest contributors to core
test code in the kernel on a thread because you don't seem to want to cd to
a directory and run make.

Why is this relevant to me? I am the author of the VMA test suite, on which
I spent countless hours + relied heavily on Liam's work to do so, and
equally there you have to cd to a directory and run make.

But at the same time in both cases, testability of key internal components
is ENORMOUSLY improved and allows for REALLY exciting possibilities in test
coverage, really isolating functions for unit testing, enormously fast
iteration speed, etc. etc.

I ask you to weigh up the desire to enumerate your misgivings about the
testing approach used here vs. all of the above.

I would respectfully suggest that here is neither the time nor the place
for splitting hairs.

Thanks, Lorenzo

On Thu, Jan 30, 2025 at 02:25:57PM +0100, Geert Uytterhoeven wrote:
> Hi Liam,
>
> On Thu, 30 Jan 2025 at 13:52, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> > * Geert Uytterhoeven <geert@linux-m68k.org> [250130 03:21]:
> > > On Wed, 29 Jan 2025 at 23:26, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> > > > I've never used the kunit testing of xarray and have used the userspace
> > > > testing instead, so I can't speak to the obscure invocation as both
> > > > commands seem insanely long and obscure to me.
> > >
> > > The long and obscure command line is a red herring: a simple
> > > "modprobe test_xarray" is all it takes...
> >
> > That command worked before too...
>
> Exactly, great!
>
> > > > You should look at the userspace testing (that this broke) as it has
> > > > been really useful in certain scenarios.
> > >
> > > BTW, how do I even build tools/testing/radix-tree?
> > > "make tools/help" doesn't show the radix-tree test.
> > > "make tools/all" doesn't seem to try to build it.
> > > Same for "make kselftest-all".
> >
> > make
>
> Where?
>
> > Or look at the make file and stop guessing.  Considering how difficult
>
> There is no Makefile referencing tools/testing/radix-tree or the
> radix-tree subdir. That's why I asked...
>
> Oh, I am supposed to run make in tools/testing/radix-tree/?
> What a surprise!
>
> Which is a pain when building in a separate output directory, as you
> cannot just do "make -C tools/testing/radix-tree" there, but have to
> type the full "make -C tools/testing/radix-tree O=..." (and optionally
> ARCH=... and CROSS_COMPILE=...; oh wait, these are ignored :-( in the
> source directory instead...
>
> If these tests are not integrated into the normal build system (see
> also [1]), I am not so surprised the auto-builders don't build them,
> and breakages are introduced...
>
> > it is to get m68k to build, you should probably know how to read a
> > makefile.
>
> Like all other kernel cross-compilation? Usually you don't even have
> to know where your cross-compiler is living:
>
>     make ARCH=m68k
>
> > > When trying the above, and ignoring failures due to missing packages
> > > on my host:
> > >   - there are several weird build errors,
> > >   - this doesn't play well with O=,
> > >   - lots of scary warnings when building for 32-bit,
> > >   - ...
> > >
> > > At least the kunit tests build (and run[1] ;-) most of the time...
> >
> > Do they?  How about you break something in xarray and then try to boot
> > the kunit, or try to boot to load that module.
>
> If you break the kernel beyond the point of booting, you can indeed
> not run any test modules...
>
> Which does _not_ mean the userspace tests are not useful, and that I
> approve breaking the userspace tests...
>
> [1] https://lore.kernel.org/all/CAK7LNASdA+5_pdTjr1dY-cKGSDq804Huc_CX_8-Gg+ypFCmajQ@mail.gmail.com/
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

