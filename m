Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD91292EDF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 19:40:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=nFhDw+we;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=PJx4ivRK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKhnZ47mfz3cWP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 03:40:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=nFhDw+we;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=PJx4ivRK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 5964 seconds by postgrey-1.37 at boromir; Fri, 12 Jul 2024 03:39:25 AEST
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKhms5BwLz3cBx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 03:39:24 +1000 (AEST)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46BFBZlF008221;
	Thu, 11 Jul 2024 15:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=ShDvrSd+viRNeBNU+FfjoOh2yPOx+MwVBfECN1HdLFc=; b=
	nFhDw+wesxA97vWBSI6F4yOMsMqSIzMl17kJDLl8PoTPampHdM+5URTfqAUqmJya
	KRhP/OApoJn6E9UzTAd5y6AItqsgSiOYUsAooJ+nJn/ISZBg87JxUNHkSyUnAf6H
	UbXKI4bTdI8vR3o2hKoAmLi2kawIuST3ZyUwuqvEnwpOphgmCctoShkzshuK9+b7
	aTXiCUbb01eiq7Irfa6wf+ICzGUJJxJCHMwqe44Ci/VkLQoudaT+fnZ09K7i4scd
	e6RJH8c9j8tBJV5xWUH4PbL3lacC14W2E6j9wgeGFhWfdIwe8Ej+nxRfGZ6Kp0Ea
	8mYIIoMoxFVQEqdXJNlDMw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 406wkya2wb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jul 2024 15:59:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46BEcqXe030101;
	Thu, 11 Jul 2024 15:59:32 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 409vvbf8sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jul 2024 15:59:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzUL2fdxJAp2XWENB5yh/mwxBn7aWpZH5dWSqMiiAoD93JiyaMlwUfuyk7k4ouGH9pCAJVbVkKGqxLoVUszm9KLvhaHjMe8j0+WodxUBzOksyqH+dnH7hlZj4zsOkHBt4KSYjDJLnJtc73q+dDpV+Wa31/VQRGt2uP+Qg4jm4O6oAjYfV1vTIHtu91pnLa4CM4a6BKUfQwH8XSQKl4wGQBQ4LPQ2IhNWYleSFhtHWRBDf+2hCFdbO0MLjRoxdbRsmt4u2j5InT/kXdALYVkvHjPrBYB9pKuLljWoC0XLnRkW7W8CcWBFNmfiQXay5deHlZamzLLEf/zP7522DFZX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShDvrSd+viRNeBNU+FfjoOh2yPOx+MwVBfECN1HdLFc=;
 b=BN8Ew9Am/hkZU+siKIqejE8cFQnCG7zL011frD1EpbPkw3xJEit0jsru6njNwhW+sW2VDOf+uF+R5PJ2qMfFk/WkKI8iN+4U37ziw4t4GKNSItBBpWH+w3IB/iqI7we0S1ZTjNiqhTTzqWbeqVz2gcjfDQXJek0w7FwcOS5GnM9XfqJV993VuwOMrK9F5Wo8OUsl/O2F9GDUgdnXTZxhM3BBXb7b9cwNVCt2I/evUjp/AUvdsK36kCYlCArAwJGxNDJuc85jAJwhEcNsBrrGoGanpueXHfedGEqsHdwaHBty7Fw+/9xhHihZfYtuAQOlSy+SqcmghhfepGAxxNbZeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShDvrSd+viRNeBNU+FfjoOh2yPOx+MwVBfECN1HdLFc=;
 b=PJx4ivRKdhNs2vPe3DmCOd4EjxwE8nbApppejKkyXUioznqJRHffDtXPhVk6nhJ//jm9iBS2ZuMHXQOhyF9IHwU7XM/CKmQJV9Dwe5SCssfomL0+Zij77FprwYeDdLE1GcCH0bZJdNn7B3DagvS0tEcqBG/+W0yjRKia263hHZs=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by BN0PR10MB4967.namprd10.prod.outlook.com (2603:10b6:408:123::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 15:59:29 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%3]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 15:59:29 +0000
Date: Thu, 11 Jul 2024 11:59:25 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Subject: Re: [PATCH v4 17/21] mm/mmap: Drop arch_unmap() call from all archs
Message-ID: <6vhuf2uuaibrmtb47tqf6qm6ckpsvmxgrh776wyrpd4ezccrnr@vdbv7msydynk>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	LEROY Christophe <christophe.leroy2@cs-soprasteria.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, "sidhartha.kumar@oracle.com" <sidhartha.kumar@oracle.com>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Bert Karwatzki <spasswolf@web.de>, 
	Jiri Olsa <olsajiri@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Kees Cook <kees@kernel.org>, Dave Hansen <dave.hansen@intel.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Dmitry Safonov <dima@arista.com>, 
	Michael Ellerman <mpe@ellerman.id.au>
References: <20240710192250.4114783-1-Liam.Howlett@oracle.com>
 <20240710192250.4114783-18-Liam.Howlett@oracle.com>
 <3843b797-8e31-498c-adff-153f9568505e@cs-soprasteria.com>
 <kuzulyzpa35xs7wevnklswchebc5xgnvtxpqly3wisfb7d34mp@npelpwy3h5wv>
 <26f9353e-fe0e-4a2e-ae12-8021f0c7bf40@cs-soprasteria.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <26f9353e-fe0e-4a2e-ae12-8021f0c7bf40@cs-soprasteria.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT1P288CA0006.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::19)
 To DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|BN0PR10MB4967:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2167fe-1502-42a8-ade9-08dca1c2721b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: 	=?iso-8859-1?Q?uG7RwWDC+2nYteS47tN19O8KWH/xKi7vqmO+nsGehBOj/qM5waUK1fZnyl?=
 =?iso-8859-1?Q?iqpuCBlbXqAnK1Aom8LEb1Z5+Xg4aWuwwO4zUHQpSJD/tihaSIbX09g/72?=
 =?iso-8859-1?Q?L0tOsHawac3Y0PJ++7GXUv/x9bgRjGfrvOWwF9CvXAuWf7aRCKKfadXhLd?=
 =?iso-8859-1?Q?eJZq9pAJm1m1FVyXkLf7LZ+sRuvDVUyWxrFezDSTgKJwLrmpTr3qlUw8wB?=
 =?iso-8859-1?Q?Ix4C5Q+RuckbWZZs6EbpTFcUGvdWybdaHY1KtlF0zW5S8LFSdK8uPVr1fe?=
 =?iso-8859-1?Q?epMYkqb1Pzw+R+o7N8YlNBLMZCYuZ9y7Z3Y+r8aFj6kVjDRnAY+BTKgaVl?=
 =?iso-8859-1?Q?GFmBWL7uPAgoN2jc1dPecRBIuORQgdzbKJcr7j3b4HYhxvy3o48Cg3+Kyb?=
 =?iso-8859-1?Q?s2Jhz6vrwjDE+jixWj7rI1esuumvO+SgUd50TjPnzPs35IslJSteC+HXYG?=
 =?iso-8859-1?Q?1TMIfugVSN4Gs9CSky4yNhdpqmp8/VF+hELSe7emT11mJkYferftU3kPFK?=
 =?iso-8859-1?Q?dDu/edMZBLyvWvFKtsHMoLgZu71mqF8PD8dFAhfpdbNU8vhoP7auhmvWts?=
 =?iso-8859-1?Q?lF1uTJOWD9f9KDpAgYtt5voIP02ew35daG16HNQlExz8bhsLUNRXjqxH1r?=
 =?iso-8859-1?Q?Wnf4x5jhs1qvtIjXWfLviW1S7gFPygjwpMHucLIMpuMw/E+E1sPnnes3d3?=
 =?iso-8859-1?Q?Z1sggAE/0nGxIXU+mUqbb+YH6BeZXQDS6WRQXu++OiA2LL9brYb/l2SZ53?=
 =?iso-8859-1?Q?RHLoapbT3NxvKsCWYmyacWEHIKyH1a3isvN1WtmdG1AY8SQxKNWnSHtYVg?=
 =?iso-8859-1?Q?gaLdJZBo2UddKv6EKKUXLTSVEPgqUBLCEEcO2CeryVPHtWM7XaxYPvP4zo?=
 =?iso-8859-1?Q?aBEl5tEiKATcdTa2UrQjKaMU/hrtJZeyhO5+JK0sRqEwLTgD1yPQxhRwVu?=
 =?iso-8859-1?Q?SjZj1wDqc566HubrW2g94KAOnJXp/i08I8KMZn23ITiKEKbELnUmNgBBIY?=
 =?iso-8859-1?Q?lIzJNLc+wf+rZH+Sj0bz4yjHcmfPpm2PO6vlgMpOzrklNY+dE3Mgv9tnDV?=
 =?iso-8859-1?Q?xn+tFiy1tvhfcy5Lu8vwRql51s6MEW/D7nrNzjwHFTvGSmSFns18OVE/+f?=
 =?iso-8859-1?Q?DpuJm8+NEAwwkFY82ZRx1Vt+pU0ciVrP12lVhHRVET5EchUO1V89eyix8S?=
 =?iso-8859-1?Q?7dAxNYjw1K5ye2SbFsDRFgM3PYQl4mP+oEv8mnbj0TGmioAg7fP97mI9VC?=
 =?iso-8859-1?Q?4pzO6+bz5P7XFjz+Ne5gdqfoqdSWXhBYS2w4rDyuBTEzNo6xDeLwv9n5Lu?=
 =?iso-8859-1?Q?RTFCiF8F4ckGSOxsApbmeRy5vi7Cz1AjMFm8uoyDCKbsFUI=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?iso-8859-1?Q?0p0ZPwDLeIzQaR5SqIxF37HbnzbQAkIy4wpvfDQSjtgWsHJf9yppfJ2trQ?=
 =?iso-8859-1?Q?rWvHHr3UiCmKjtoPZ0IsqvvVY1vK43j+nVQDVOJYSYa79zGswpINHpq3+y?=
 =?iso-8859-1?Q?+FKqC5IveUoVOxlwDZWK5UOc6Mu9IW4nGhUAtFNlp0u0fFn/WnbxyRqVBI?=
 =?iso-8859-1?Q?53SfPcoPgiGm5RNFWtYpMnU3i6V2T4PDHRFVWkJnfpOXKs6ypyZ6BGLBy0?=
 =?iso-8859-1?Q?y0mvF67mA8ITmPtf9mctwU0ybCSQkDvLuie+SSp0mnJwMo6ehqMWB+1Jxj?=
 =?iso-8859-1?Q?MdGngPEehz8d1Dz5P0kCegpf+ckHcvo0qC9LHFAp13kYWMMGHThcR6Mg6e?=
 =?iso-8859-1?Q?D1McX9bsva5eAkZr7RpQq0qEBsxaEYZ2UI0/dwWkeHxkyumdFj6gQ/tGBd?=
 =?iso-8859-1?Q?dIBVlBa0Q89tYwktuLF+g0w2lNnpti6r8bYD1/px66SCzJ6NrfaIHKUDDZ?=
 =?iso-8859-1?Q?JR9TXqTZWjvUIfvbR6A8W+EdHQ+chxbazOILJ0V31noOj/PJCMw3poB1m9?=
 =?iso-8859-1?Q?Q/W1rR0CBBcrXrYSx9QKZBkWuz2H4peTrkiIvury/tHaQuA9g0klURVDgN?=
 =?iso-8859-1?Q?KRCp9IkdiCgu42+wnc3kvLxz7IiorCuZSqG/+nZ/649zZvfPBLFcseP5ww?=
 =?iso-8859-1?Q?Kh+P+dDUhAEoa7weRxNXo0MZ0APUzm6chu3PKgyJyI+x3DboYeLksOhukI?=
 =?iso-8859-1?Q?f+AuJPK9d1QXQlNgCCo4f0KmGGYkvtVMZu6bc7FtkmjZaz1bIrBaPPceyW?=
 =?iso-8859-1?Q?rZ8ynZ6INyttxtMSS7yi6kVmlrzwbvpRSJWxmKh8/9S/jPOVlmMxOZZFc/?=
 =?iso-8859-1?Q?9xd8P2owpeaeCmUO5VHX0kYpP7lHtcj4SDL5twzMq4COHpNFl+XMK/L6v7?=
 =?iso-8859-1?Q?XYJx/6K9LsidB3YQV+wMAqS4cIiP3PHrexN70Lhh6UGYhQYn9JAq3hN7x/?=
 =?iso-8859-1?Q?442xxvmFXNzUX6tLri2gjmuQx5FRdexkkzS4eZ2i9dLE0Lca33TryAz0P8?=
 =?iso-8859-1?Q?Kk84n0l2e39J2LxcKZCISsTFhXWP+C0IYKTNx+VrCTn7oyN4MJdCWNo/XI?=
 =?iso-8859-1?Q?e2oCNkSiAkrz8FY/flw0lGm+Tg3BJ+uQ2Z4rNKTvq/ePEGv4WdthsiN2ka?=
 =?iso-8859-1?Q?Rs9o2dekWm3zD7C5QW2VHdbYOpmIfXHd3oRNoLcZsrUcP7RrR9z2xWhBCd?=
 =?iso-8859-1?Q?QdMUoG/H8xsTAjbag9bex5Wvvqbvx+2NqeUxGCH9wZq8I2kCxT0Ky5FQ5K?=
 =?iso-8859-1?Q?bKSdlNJM6vBG4YXhxXqDPWrWMVa2I6IFPAbfwKP0kXOh4srIjxR12VIsAL?=
 =?iso-8859-1?Q?SbTKZS6rwtfOcmKDpwhp0rDeAyzDNciTWRUoytOV+MvNed0hrH0xgcIPhI?=
 =?iso-8859-1?Q?LkAkJknOWZoGp6tpXvtWGvfksbLgGZlnfFlX2FsB103swO90lhtWI54tDZ?=
 =?iso-8859-1?Q?53Yvs3mpIoUlaMmbIp2jGD0yfSgm8qmhlP+XgmjViTiz1T0KWZ5LuGBO9H?=
 =?iso-8859-1?Q?H62SgLG4x80j9ZeI4yKu+HjLo5jk72WvymFfNBwtfGgmWaAIJKrfGenFJi?=
 =?iso-8859-1?Q?uYLTSLCHLwqCOy4CiRmhmmGhxQBEXQMU6qttlPxS3EnLFJ5DwtmoGMkNmS?=
 =?iso-8859-1?Q?AXgARPbxX+dvvdhM026rH2lLeqwiNCmj9uupGdYAolLmcaU0FoWSuN/Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	GkF3YaMZcpJ5JDzDK+QTcLU80Ff1lpQYoxksWLxcxH6VWnsQTWtJz2/VmgyU9tGKe77EFerorvvZzpDMh0H7AVS753U8Q4zaR6dt+Ku+0y99lUi9gRwk9QpO1qVmnOOQ/R3oyA5gWnd2bx7FbS1toeldTjk/Gip8+0ATH3yqYhQhuk9RHKviNIfDhELf8lkKS+FUYzkrRwsKuWKvvn56vAglLf3e5Q6dVKJ5H0sSnZFs4d3AjWXAK83SsuPoBKFEk3vncQLezgXUi+r43Cow6VRmiYsRFPm7/N+vPJ0NisCI1UMdGCvHBBT392U+6XvIwIqY6kDRBuGH1OI4DqAZcvzUSHMGephm/FBI8MyJ/8YxXgcV66FKu/LVhAMo+jw8xBL+L1xCntRmi/G+EHd2mL6rxOxngaeZFcvKby+oyV0ZvOAVDDLCRbHHyw7+QANDY8GckOFcHfRPIJPjiwWEMAtnfmyW7N2wO9xFNSVGDjc/OVJCyk8DgaRplQVjnjOqnPm5U6aMluETFJjL8x26WiIcoYgTC6MrKHTpZRvtKaw4C1S35Rcr0vL0myS87EJWC+e6PTnz8F7OSMahC/OvZE1+a9AEN4nMQmJsDyFM4RE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2167fe-1502-42a8-ade9-08dca1c2721b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 15:59:29.1538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ePdDkduIIz4StVh+VaUUscdB3fZ7tI23iph1wTZTvgJV9bMq5eDKkzAcr8LDSvcT3LflZ01bOh76BrnFqh7vlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4967
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_11,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407110111
X-Proofpoint-ORIG-GUID: mQTLj6X0JrXz-bWitmVbYFgHAd1JQckY
X-Proofpoint-GUID: mQTLj6X0JrXz-bWitmVbYFgHAd1JQckY
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
Cc: Dmitry Safonov <dima@arista.com>, Lorenzo Stoakes <lstoakes@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, Dave Hansen <dave.hansen@intel.com>, Kees Cook <kees@kernel.org>, Jiri Olsa <olsajiri@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Bert Karwatzki <spasswolf@web.de>, Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, "sidhartha.kumar@oracle.com" <sidhartha.kumar@oracle.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* LEROY Christophe <christophe.leroy2@cs-soprasteria.com> [240711 04:28]:
>=20
>=20
> Le 11/07/2024 =E0 01:26, Liam R. Howlett a =E9crit :
> > * LEROY Christophe <christophe.leroy2@cs-soprasteria.com> [240710 17:02=
]:
> >>
> >>
> >> Le 10/07/2024 =E0 21:22, Liam R. Howlett a =E9crit :
> >>> From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
> >>>
> >>> The arch_unmap call was previously moved above the rbtree modificatio=
ns
> >>> in commit 5a28fc94c914 ("x86/mpx, mm/core: Fix recursive munmap()
> >>> corruption").  The move was motivated by an issue with calling
> >>> arch_unmap() after the rbtree was modified.
> >>>
> >>> Since the above commit, mpx was dropped from the kernel in 45fc24e89b=
7c
> >>> ("x86/mpx: remove MPX from arch/x86"), so the motivation for calling
> >>> arch_unmap() prior to modifying the vma tree no longer exists
> >>> (regardless of rbtree or maple tree implementations).
> >>>
> >>> Furthermore, the powerpc implementation is also no longer needed as p=
er
> >>> [1] and [2].  So the arch_unmap() function can be completely removed.
> >>
> >> I'm not sure to understand. Is it replaced by something else ?
> >> We wanted to get rid of arch_unmap() but it was supposed to be replace=
d
> >> by some core function because the functionnality itself is still
> >> required and indeed all the discussion around [2] demonstrated that no=
t
> >> only powerpc but at least arm and probably others needed to properly
> >> clean-up reference to VDSO mappings on unmapping.
> >>
> >> So as mentioned by Michael you can't just drop that without replacing =
it
> >> by something else. We need the VDSO signal handling to properly fallba=
ck
> >> on stack-based trampoline when the VDSO trampoline gets mapped out.
> >
> > I'll address this after the part I missed..
>=20
> After ? What do you mean ? It needs to be addressed _before_ removing
> arch_unmap()

After the later comments in this email, sorry that wasn't clear.

>=20
> >
> >>
> >> Or did I miss something ?
> >>
> >
> > I think I missed something in regards to what you need in ppc.
>=20
> It is not only powerpc. Powerpc is the only one doing it at the moment
> but investigation has demonstrated that other architectures are affected.
>=20
> >
> >  From what I understand, other platforms still map and use the vdso
> > (context.vdso is set), but unmap_arch() does nothing.  It is only the
> > powerpc version that clears the vdso pointer if it is unmapped.
>=20
> Yes on powerpc it works. On other platforms like arm it segfaults so it
> should be fixed
> (https://lore.kernel.org/lkml/87imd5h5kb.fsf@mpe.ellerman.id.au/)
>=20
> Could be fixed by properly implementing arch_unmap() on every arch, or
> carry-on with Dmitry's series.

Okay, I understand what you are saying now.  I'm not going to tackle
that change within this series, so I'll just relocate the arch_munmap()
back to where it was, after the removal of the vmas in v5.

> I think you fully understand that it doesn't work as it is except on
> powerpc. Again the goal should be to make it work on all architectures.

Got it, thanks for clarifying.

Regards,
Liam
