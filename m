Return-Path: <linuxppc-dev+bounces-9870-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8423DAED69D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 10:05:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bVzH45yvLz30PF;
	Mon, 30 Jun 2025 18:05:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751266308;
	cv=pass; b=aXydAPExpp1EAacOCB9do60JpWA/Yw/izA/xWrTL3FP5Srqt5HFsg3KRQvtFuGZozX5xMGCDWc1ixEt+DrX/sigeFkBR6h8tzsrOA0NJXNNb7kI63bBjdy7H/I0tVlKi4bwq3NstmBVpb87Kh7bRyC/ExGggiY8ypZg5MLGPsCXjQ2by/sEmV/oBMjddWQfajH1MFbV7NjgZdjpVIabdx7sbbkSAO9tfOibNRniWPpXC5fS9TWc4LHnvwcRMbO52bBpWTich+lbIh498KFHYugKmjLs3AWVrbmBhBdjB9hzBB1cNnHayjcU+nNrn6K5RgNFRpllAyemX9juTxF/q4A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751266308; c=relaxed/relaxed;
	bh=wxOcwe/yAlikp7aDiTaWnnB4V/Eg98UeawsrzRgpzoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DxyHJNKuw0z7vAxwt1bx5UWq6YrCWhSxtaTrc65QsIb1BB5vGUDavtKmmEwwLb5iLAX267zyzx/MSCjaMKVPb/qKH539JwWT8HQn2+kwqUr5Dy4fYX6mLtD9kA+6w8CZz3czfOpxUaKDxQB0eYf3kg2oQuHnAUneGfF7EorpzYtmX2f11VXPK1XF0IXnKj/IVRO+moGNot2hfxVyDB675dDUk9oAVtslqz48K6CFRpGAfQfuyB0k9XszR77ZrpQGYPxdjiEPURtkhehI/zJ+FcFawjFJmfCkc7kpELwOT9Izgu65WV4CNCZAsixjirq9ioyOP4EMwOzONKL0PKdoqw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=Vs002lbV; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Dg0j0Acg; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=harry.yoo@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=Vs002lbV;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Dg0j0Acg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=harry.yoo@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bVxfC1S7Nz2ydj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 16:51:45 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TM1vsl015126;
	Mon, 30 Jun 2025 06:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=wxOcwe/yAlikp7aDiT
	aWnnB4V/Eg98UeawsrzRgpzoM=; b=Vs002lbVkFSaAGLP2B3qsGqsf9mFDuyFf8
	ll3ChRAD9fKc0k+uhbJRB5S36B8hN/GxxrZSUglLKcfw61rKnaCxz/gp1OJvIHQ+
	odh/8HXwJPxfP5e219KR/jqmveKVfUX0ZWYCnRKQMbyxOKC9COvwmi02bRvH+ZC4
	e6/we+WnJYWd5wb6h9gVh9hTsu/OOzTioCtiM3niT9UuRwe52bEZDKfxsQ6WBd0r
	IMXlQezdj1DwiHOgSyGzHFFLhoHlCs+j7rNQBU/jXq8SSjIFuYqmuFGb1wypsUBZ
	r7RY6GGKyhUMvy1rGSIXoawXXRD3J0OKBv3ZIKvjh+wr++zTJpAw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tf9ukc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 06:50:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55U5Eov0018170;
	Mon, 30 Jun 2025 06:50:21 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6uf6wym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 06:50:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZhFoJdUkQc7/k3BpK528m/t86Sw0tn9owNbzPlBD4Rn5WqFQzu+cNI4mvuIFUOz7srNf51EhqX/eCsu0u8GwEZaeAoulc6RhWu6d2GVPWt6quendMNNoD+uUiCskNuGI2dZjBfRvP8mLmooD4BMik/gIrGY9HxyLpanoJbUyUgUuT4RdEnVtrUGmrXeQ6+Xpk8DmjFy/LfXGTZ/wd3fzg99X+rQDmUlDaBdejFGuwUc9fwRHgf6a7V/48nfrzgNAJVO6RKJ0ztewvbj0ki7dk1j3RXYvOiW5XBIDL3Sx4e6cvYMbSuE886g4zLBgD/oCFbnjQ2r3XJZg5P+CZlldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxOcwe/yAlikp7aDiTaWnnB4V/Eg98UeawsrzRgpzoM=;
 b=w7upCnNaeyp0CFPbBhiVHzdpdLkjZiIwPl20U1OMHUwWrO/NQgx1Cmp6X3xxnfXeVOF4cVYus+KYhYyrhiR2vZFMgAx9sQLVn9rsdXXCSb6lkRHx/6yafOXuzWTls217drIymCJiIJyeyTGKOZ+XYgLTTy+RHi09TzNP7RtQX0Jt6TyebKQd9r5HDM0bBIDjn2nDFsoy52zXm4+D7q6AnKIfLOwlmRYyzloD5uMfpk4NeBtPKRr4OdfbRya4Tls4HtSuDBKqxhxoXgytjkWsMTzp45R3ev6D0q9Q73nkLEHaz9qonuN88sQVczdTq5Kb1CbmuaaaB1EDfX5pIajwig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxOcwe/yAlikp7aDiTaWnnB4V/Eg98UeawsrzRgpzoM=;
 b=Dg0j0AcgTHmJKr6Oe+xWWBPA3wJGeSqNSbDIdvtNAV90dGneHZ6KCMj8F1OiSg9dPRQBn69YinyGFHDmEBZir9gDLQg8+gwnJfV4JO9G0WL+Ds730X6XPW6d/TpCHiHRCPjgLZ1f1WAXoQ4AY3GWoAM9L9KVPoharXAn+CTBzMs=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by CH2PR10MB4342.namprd10.prod.outlook.com (2603:10b6:610:a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Mon, 30 Jun
 2025 06:50:18 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%6]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 06:50:17 +0000
Date: Mon, 30 Jun 2025 15:49:58 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Minchan Kim <minchan@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
        Xu Xin <xu.xin16@zte.com.cn>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Naoya Horiguchi <nao.horiguchi@gmail.com>,
        Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH RFC 03/29] mm/zsmalloc: drop PageIsolated() related
 VM_BUG_ONs
Message-ID: <aGIzlsDCW1sq_I8z@hyeyoo>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-4-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618174014.1168640-4-david@redhat.com>
X-ClientProxiedBy: SEWP216CA0020.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::12) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
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
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|CH2PR10MB4342:EE_
X-MS-Office365-Filtering-Correlation-Id: c488ca56-0ce3-4804-a2b5-08ddb7a25f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dJ7IPy366qEs6qfyqBT73WCbETshlNFr4gUjoxGiAae9uwpMJOzcxA2SZNip?=
 =?us-ascii?Q?0AoPz+gVLdOvybtUuZCT7gfJvJLoRHS+RWY6moFjb3gvkGIdl1RwRyePiF2Q?=
 =?us-ascii?Q?x/gcdrp8aMnSpAOVIRmTK/KuhbcWDJ4xX4nFQx1LrNcwSEZvOmMSCm2xwQNG?=
 =?us-ascii?Q?qIutVwjwiW3KGTPntZUkLR/cWTf/mIBTNAx9fJy1vnprE2eWUKuHQv40foxw?=
 =?us-ascii?Q?ZH5ctnibjWD+BwhT2LySgjlnFzMMz6IExYZ98w7VZ+fXEJrx73I1c02r9Phh?=
 =?us-ascii?Q?ecrxfHSF97m8effU86o/zyCOgR4gxY6Lie5O3U5ByyBqrvoYb24X8nf3KsH8?=
 =?us-ascii?Q?h38V0FNXBWuoqEJlutBlMYTn1Tcp1Fylsu3YiWj2IaXETqqztdvECm0DT6GE?=
 =?us-ascii?Q?RgrCbsR7+z5izF75jX8lj0+hoqz3QwU4FzeYAZqQIDUyT7ea/tjwpFv3E56g?=
 =?us-ascii?Q?VBk7+QeYro4JWp/0KWYj7sz5ZZpapDtLtFi1PO5+yLb3qKK6SoVPs3vsgMWF?=
 =?us-ascii?Q?H734K6t6LkuwDa6TnZCr9+u+u0z2+F1cInWx5oaSGDLL9hmQEsm1T1wRl3zh?=
 =?us-ascii?Q?x7kEe4w0aTHK1eDVLPRjcTMUIv4DL2tsev8xbAUMMMF/xeWnrOA9lVK+jA9b?=
 =?us-ascii?Q?YOH0MqbvtF3Oimmu2CQt89Bl7R9/jZJ+X2QrqPzLeGzltWTw0kKBGAdTr1MS?=
 =?us-ascii?Q?QBCKPzGXaaGyrXS1pkvuFxpd/EI0ohLk+ZWY5Jee3LLc3wBAHiuMBaPum9k5?=
 =?us-ascii?Q?rHs4drgSdvI8kCQFxPVCTD/oK1E62CUohbiB05a1HJyDRyRNLki//Q4UOgBO?=
 =?us-ascii?Q?GtXUlO9iQVLQZOKg5rxc+1YUcLhMS0ryYTl5rrwgYzgEppEHb42RYKBc+DXm?=
 =?us-ascii?Q?iOpEU9j9ptRRw7VI+E5UOdQVAB7Np/1m6KMFudeK8nmjAkJE0ALKXsSUOWq8?=
 =?us-ascii?Q?c1av+UuaMX/MoJSAnWEU/CZIMXMB02dEWqopcY2AktKEVJJTGmVVYBdtcjwU?=
 =?us-ascii?Q?PdQawms3iIdP/0q4AiXJM3SAhM/dtaXZHceCBJQF7ktKP+8ylPMA9aflTWKi?=
 =?us-ascii?Q?DD1sSZZ3MZt5Yzx8WqY2bdF1x74BQKjkk+XxYh3muZf6n4piDcJACrWLjQEl?=
 =?us-ascii?Q?BnOZ15XwATZ0rOl8KYf5uaSlg1HrsmFVs4CkywSchcK0C0xAqr0DMvCG2jyH?=
 =?us-ascii?Q?JNcjafY2qGp3BlnPj7HL49zlxPpz3AQqR4wIoT9jRBZjxVA5B5LyoqDn4VvC?=
 =?us-ascii?Q?DJjiIIlciZRQzBxcTa6NPO/SVjwCf87GeMV4/jOmJ+l5hzMFC+9HxsuxbeaL?=
 =?us-ascii?Q?/gvm5/KgSZfvdI6lHWXy7MRaXk5B2aVYOuQSDInhBBiiZlGLLZ8cCW1hCnT1?=
 =?us-ascii?Q?/WZ8FvzPLqhKiPvABgX6S/g4pe3u8F3EczLcky4Tt86/7+8e//MM8OaC3bwh?=
 =?us-ascii?Q?Thuj2Ht1iBo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HG7vXCKmNvB2gUPfV7vE1pAVw+Rp+PJBSis8vYMeIU5TLTOcMHTEVOKlBWqC?=
 =?us-ascii?Q?36nqBXNwtuLZelY8UpQyVBGm787W7ADuzQURU1+mYm8LpLqHKIX5RZb7Vw2q?=
 =?us-ascii?Q?gsz816uQ1lvNQyxAddDvquiT5QrBz9HvzHDFW762ehmkVRe3a4NZU3+zLexW?=
 =?us-ascii?Q?DR7STId8muj9zl28AYr9okl3MhVOzUNl9l/j+WZjboFyUWeYiFwPk4R6NDgE?=
 =?us-ascii?Q?6vC7cw96Rn8lQ4Xlc4+naF1axafwoRd0Z2MzsyB20gdJyc85ZJVcnipOdhl3?=
 =?us-ascii?Q?PITgT4etQUrNE7cZomW9gK6eqn5depey9EsAdIIu/WUv1Sogl4/IyXZ2YmiS?=
 =?us-ascii?Q?omkjkbNSWFDL5D7Wi9tknKrkaizi1Ih59RpVtBX5HrP0eYqfOa66j7151RmY?=
 =?us-ascii?Q?XOQ7X9wRVhzq4mDiWL7MRbjz5ryWThkmG4ZEkw/CMFyzngdDQ6v8J+3BPp4i?=
 =?us-ascii?Q?K9otUMwygbV8wEj611NThdUnIwF1A9gj8PpQxDwkvmZZHTKM4/tGisC6eIc9?=
 =?us-ascii?Q?4DUC4M00RjRvdRtWuFZ28TWHodGwZcoAiOf9wa1LuekbMmDixI0cpMBxgZtl?=
 =?us-ascii?Q?keO+sHj6IKEU1rkW6/M4aWngngCovgEDD5w31TMGNguTV1YM6TwsExrSg7Xg?=
 =?us-ascii?Q?uDsYAJ6XYOeuyjTZglSOAPyCEF9JUk/RDq1jP6UsMQ5mrk/vVhNUFvn0itOi?=
 =?us-ascii?Q?1S+XBEL6JIF0St1wZmn9C5oGNmXjrQaLzWy33VXlQeUMtn/0eEGbknoTiC42?=
 =?us-ascii?Q?K6iwJx6SAFBDbnXdkG+RC1+SILPO1bXPbkZPfCroB9JlkBlhP3Str3+3SGXc?=
 =?us-ascii?Q?mjUmtKHdWjhgezlONtOGAbk/PnYQtNn8fBRynLmLj0Q3J54CafI+bvdLEFQi?=
 =?us-ascii?Q?LYKDvZuOpuEKGI4NnMHaONHQPc3mxI6LWRJcelAlvAtqSN2Vx03TpZxuyEEs?=
 =?us-ascii?Q?fdX/xfx0s4a3m+yOm4nqVNgotHDbAeXg+8+rIYcrMpTpmRVZG+8EtjsbpF/5?=
 =?us-ascii?Q?BYas6ql0sqStLdv5TRQshoRO7062ZihDieXvi05jg9Sp5DM4+qxwSdPL4ugK?=
 =?us-ascii?Q?k+g3yXim1jtlRHtofghzLxFLHROLNbLSLT13kGoBKBa+gToB1z0Orz1htZSC?=
 =?us-ascii?Q?Z1yfZ1wde1w+Vq0FyRIWAUQDj0cAx1QNqh0Dq4PPb9fVJAxIXYLCiaD3E55H?=
 =?us-ascii?Q?Eomw1IPloTlQB1Pa57ZUOTLQTv6ior4SkHpQ3OCgd0SXD52tWyli+cm+m2eP?=
 =?us-ascii?Q?zvmf/Pf+1lOyEVl/nhZDFpCOzzh8P7+06oH4KzDbIWYyVVMLhbs6rcIYEsRC?=
 =?us-ascii?Q?PAVja9iTRJL9VyztkOtfRekgL3plUh876MtX78kyAaHcuqWlSnmKUxQU7bfq?=
 =?us-ascii?Q?0VwTflQPaiWd0OcZsjuJczqUG7FVCWHbuH74rphuYU+E7ITRrvwaXc1HkLKs?=
 =?us-ascii?Q?21cFGZh7LNnfHTAaxlbrntABRSIK/HErbB/SoBmHBQcxPAoKUauw52Z+e1A8?=
 =?us-ascii?Q?hQB44U3BhnHQG8p9W6PsmKG8kRlyFpgKJAJ6d3lb0F2f59Mq8dFQFJTTYj47?=
 =?us-ascii?Q?x/R4W9LZDGx4xDR3ZCM+UUp2RlUjMoM2vCJsKZIZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OnpgFp8xCnusu4CqEynMbPvsz5Tx+9nYuMdsSJDWM+srS5b8IE97oSEoAw5ERp+Go3rWwQrcCqZes9WlO5P63wrpOVzGb9pJ45JBNjhAB4YEin2RDVYHNOXUR4OzUw4D2C1mhOLoPVQXyNBLd7KAP/Gcyy+qlx8i8XrTfroS9vefgeeJhh7BlOGqgWb/gmc0j159RoCJJ33MYJeLS/whHIRJvYBHRb/iQtQE5XJly0If2xYgHKcVpFOym3Galnp+QSTT95pEa/712ya6OGkIEY6dVuzMk99Ztt/FNsTQEg7Gkkp6Dw1nTa8V3njl4wtNQp0IlZTrZ90pZs6Q+dC5eVxgTwebIZM3Zu13Xkyw9Cb1o2DNAqnXLAGrad0xzH9Ea95WjfQbakHl3BprXuMVHHP4y88Bgr9bHWXxlce/DY9M2eLcy4bBam6A6FuSTM3lEOdP3DUXiYP2tcM0ac/8mQE7tVlWzQc8lcaYb/TNx14O5eiDAc+sDQc4xQGiMa91UhKxAlMAbVbPxhTT16LNsltEo1pQx1y8NnPHvYhVNqgWVIWpFx16Ddddo4SMGEIP35meTRJ/wtec3M+4ZlUnFeEmbiqKlhgnIrO6ia1/5zA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c488ca56-0ce3-4804-a2b5-08ddb7a25f90
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 06:50:17.5976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8L+4GL4wVpya3HOGlM0I7eOQNf0cr+wdXnWMp2AZGas4jSOxJG7htlm99eS3eabc/Gsaq1TcO581DES8Lw8Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4342
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506300055
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=686233ad b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=CqIeAK6twTmvHGUycf0A:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10 cc=ntf awl=host:13215
X-Proofpoint-GUID: 2aKeEm3gpTib6jlSj3Omiri9UMbSsHt8
X-Proofpoint-ORIG-GUID: 2aKeEm3gpTib6jlSj3Omiri9UMbSsHt8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA1NSBTYWx0ZWRfX5JNicUawjsBP KT27oKbJ29EJk3DvKziHseltkhfm3gCh8lE/9kc87N3uDQFs6IvSQOBwtE5yoxmSiYHT0M3qmYl Cg1c8iVi6G8+vBtPD+id0rY/Ryl5dM8vXdE7qBAgek8r7UMiIIQq03sjG80WhJzDfdGdrmJyo2f
 XIYtPA6KNVbLxBELL33pKtuMC6vd/DTCl0UncwlkCo7R+vfyGwRTzhhc5t09e6rvioj7GHiheOi A8A3avqLzUnp9sM5KDrrjIg38nEu2ZCBBUYDwlt85tqcG5TzFzoqR/Ne1bnG8lchcY5cpUJZ3Is 0puA6Q2tIrClDgf1Sv89KxkV7V4wLACUTiZq1jFBUTX5aRmI5D8XiTbm92JFzGHl31kJe33+Iwd
 Gz0C/UK7DhQ7u8OiiFA1Our3dZM5T3uAdFL7LG6hTiCNFNtpxjfsHEQVBhx1WLRZlc1B5PiT
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 18, 2025 at 07:39:46PM +0200, David Hildenbrand wrote:
> Let's drop these checks; these are conditions the core migration code
> must make sure will hold either way, no need to double check.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---

Acked-by: Harry Yoo <harry.yoo@oracle.com>

-- 
Cheers,
Harry / Hyeonggon

