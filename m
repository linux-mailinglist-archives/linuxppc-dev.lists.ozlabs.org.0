Return-Path: <linuxppc-dev+bounces-15840-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7DBD2481A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 13:32:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsMp00FcFz309H;
	Thu, 15 Jan 2026 23:32:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768480375;
	cv=pass; b=oqq8dOSDpM6ExrcXqIqgi1LF4vgRWYBp08EPc1we+SzvYX/bOCo/4aIZkslm14dbLNKGylJxCNi5OeLbCO2BjGD9wUoKyies69PcyU4uaHJIb/J2IwD1481hDhjqIosCBxpcIi5oz7IrH5y99EDKxIYowqd9zwinw5DRxocXZxq80Fy84kmKDu5sZoxf9KVNnG+JHMIaZt7ivjOi3uUc67Gwv1wriGPW0aJvdsezSM6ALQfcgEnVjGB/KpmIenuEbjOwlTqjmta2jZ88bX0KSwBkriukQ8bJ+7dVzh9B+sVptALVQTWrSJCnyKCyc18PgRdhY1598whedhQfi4BLxw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768480375; c=relaxed/relaxed;
	bh=ulY1xBKscRHXLXWg0cLwVHbhv18BWaM9gdEM3tHo4uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YpLKlP2CPPBYNIdUi7Zb94BzNzu6GTWsa3dbscf2toHHvY++Hn4/wNIvkB3ePAzNvJC+Imdb2/5LMXA4+/NWQ6/QvbNFqRz9je2AYZWZc9ayAq6q0YvamTdtUchc9Rg/kcgpHQVdOcrzszdEae9ToKha7wqLjarp1Ewx8xrNGooEHLzkCA6D2JBS6803aW3/QzutfmSpqFWdgetz6mthciDUpkeYsXmFfxMV4jIspDZ0mcpWPLIhKlOe8VmCrD3gmgX9hnOgWVATtexgSYvE7iF8O9wjy1K5c7PBWU0ZbJOKiOvAj8CIZulSexk2WrXX/EqqFOlzjVoet6CApXwy2A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=EvAha5WZ; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=hk4HkJQs; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=EvAha5WZ;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=hk4HkJQs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsMnz1LK5z2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 23:32:54 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FBqUtH2753003;
	Thu, 15 Jan 2026 12:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ulY1xBKscRHXLXWg0c
	LwVHbhv18BWaM9gdEM3tHo4uc=; b=EvAha5WZxfKff/bVeWiWim83sg9GQKRkIk
	0gA5XuMT2Q3Dadn9Qyn61INMQkxVY5ObH4bzwhL9Cco/MbiKZkd3HS7fTU68Bs+v
	ruPWvJuVrmuiWo8xy6ZS8/GTvkyHFNtq/jIcU1Nx2bhUCS7cM5NZKfeG5KDHtiVA
	3xmmpvXbWvXVqE9k6W5Lb5fm2n1ZTU3VcNUXMcAu4fgN9wl7P2dFu5DTJnYxVUfj
	WGthfWqdJXANRWOeCzq/usFjR25KKQrKA8chiNijpaDjQPQeQ3cr0CdrLmkea6g1
	v2Ezi7i/pUVZ2Hv6gsHKwPYLPCJPAcfZxUxOD7ZwcKZ1CVEpqN3w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkpwgqnb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 12:32:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FB6G7i004244;
	Thu, 15 Jan 2026 12:32:23 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7n2vpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 12:32:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J647XRZYArYyZ1sesuqehOY7wb5xrFgUfL97DZGc5yy/oze1tEuDjacyeCrSey+rY6Kg4SgVmj/dmOD4AY7UMg3AjyFN1JmPsz+gn4oo5UemOZxo3bwSAbd3qM5poaqQwS88iycMWbrlfvkqGWZSK+2Qs0LT7p4WRHuOfxXubZrrlVUMNmBGHRsMbFFjd4NyXzlM2szPevf3A2Mon7dMWskezuRjemYrBZXVrpyoK+he20e6kmTkXuf6+RP67sBlM3XYfNBgewLDjAQ7G3qHSZdKZhf3WpHgx8s3IizVTyTho7vvtG1e9LQMLUW/ZPn+GOnqeSVvIFLXiDYXs7KDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulY1xBKscRHXLXWg0cLwVHbhv18BWaM9gdEM3tHo4uc=;
 b=dc8TNnSto7zcEOeKShMycCnGlvP1KVg2Vo8m0RAIDAbPUlC+XrTMi7JQu3uOrXgeSiQ5Jgb6Y1k5+uonfKViBhneb8kFVxB5880w9Qfv7lL/1wAHqVC3dE8AMC6weoC/wGHG6Az4Fx4uWNSVEU8Htm+dz3YpIdi6AN84aIJhYmv2h/HWGPZc5yFOYkmMZv69vXiTpNWOvsnTw5sJ98iLiUhijdxFnu/Gjg+6SZEthwGKvySsuCnML3AiCgS0LdMwF1PdglXY+Sbpa1FjmX4oefU1kjBrLRPeXB3CL6bN5ene135WUKVRA3Q029aPNCChJV7ZefFbX/n3xP5kZtRszg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulY1xBKscRHXLXWg0cLwVHbhv18BWaM9gdEM3tHo4uc=;
 b=hk4HkJQsKkggZfZPM/DBDrKVnkXPPe74QM+x0AM3Jrc9uRxVFTCNRIExiV8Q5weFcQhtOdtUWdbHCi6uHagZvziEpGXL43/+7Li8tojfKcp6tY1YQUKof5AO7rM3WEYo5VSQN7IJMkBgWJwqsFm8/9saGIQlnp4U49s77aZiSWQ=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by SA3PR10MB7072.namprd10.prod.outlook.com (2603:10b6:806:31d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 12:32:19 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 12:32:19 +0000
Date: Thu, 15 Jan 2026 12:32:22 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v2 14/23] mm/balloon_compaction: move internal helpers to
 balloon_compaction.c
Message-ID: <aaf62122-364f-4bbf-91a1-28cfb3805c69@lucifer.local>
References: <20260115092015.3928975-1-david@kernel.org>
 <20260115092015.3928975-15-david@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092015.3928975-15-david@kernel.org>
X-ClientProxiedBy: LNXP265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::16) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
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
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|SA3PR10MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: bec5245d-8904-4024-5900-08de54322008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1AGlEeHYBZEy/9NoidokYuZLas0J4IKDS3k5T6X+DiNlI7gaTokU9fY0UPmB?=
 =?us-ascii?Q?99KOedXQebtx09oPWYxXY/S012ly3AK6VrgRsveuMc4vBfII38PqQUD/FWjM?=
 =?us-ascii?Q?rXL/NAeAESx5e9r8sPYt2/zmErrWhnSmoSFSxhGCfkpktnuaE014l7g+c3u0?=
 =?us-ascii?Q?4RuzKZCKBNB1BX+mszXlJHbWY6aPrwSQGVgpMU7EoQ20/UMNDMx9waUfV2nL?=
 =?us-ascii?Q?klvyRyJ1pySDe47bKz6asljGhn/hesCwpBzxqxCM5qfCiGicI0W/NB+MUDGc?=
 =?us-ascii?Q?FVfDtfa9gC+2CamvOyb5rsTzbiHc3qvInRUZPA/ITFJQzbrOoywZac2Ezv2v?=
 =?us-ascii?Q?gDzGdafhIleSj0Sc2YM0c9s1t0F2rVeBNsrVy4aiG2Db+WpMYm43J2qZeWbJ?=
 =?us-ascii?Q?RtDYgJagmTZ5GdwYvW37WDE1SN4kZlSMlt6+z09avNGdurkgJYES88Vb0Zvk?=
 =?us-ascii?Q?1ywqN1+Npkr51xAELZZ0CvdEFvIhcAiEcQJGYh6BE+L/1Qw/Tf/pXcgbLDmI?=
 =?us-ascii?Q?RM1PNprLrfQ5ABv2BTDnzGeq7CIQO301CSQZ09YRC5Ph0LQONmyt2ju6YMbx?=
 =?us-ascii?Q?Ri6cHMijvgGDGgyUgiq6TdGnKvnj7EZ0suHCWVB9CBuXwmrAUc/9tMrfv6z4?=
 =?us-ascii?Q?FauAMi9Bq/JTspY6F/cG4RR6/oNm/R8myACusqsvUSRad1uAsnXTNIzbcoBl?=
 =?us-ascii?Q?wczyIiE7X1DZ9nczIVCGRsd/hyOzLFGlS+bGn3gxR6FIVM3cZILX+JpMp+eK?=
 =?us-ascii?Q?gbV1Qt0pbP9CB7ndI5uIF57yVNbOLvy41Kbi+9xAvDp0pE8uHHhHbP0j42Yu?=
 =?us-ascii?Q?XfjOUqHmRrN8+3mcgqq//VHkr9HKFSvdhbUbveOpRETaYogaTrpV1yGRpMwq?=
 =?us-ascii?Q?0gBGpb9km4W8wWG4ZgUtlGAC/sg/8bAiDBlOdHP482MtRodlY7wM4L/NtPL+?=
 =?us-ascii?Q?v5k+4JVOVDdlEF2NI6QD3UvvKh4g2MWDMCvid7jYGhuLWPYRc5qiKtr/Wx9B?=
 =?us-ascii?Q?T0HTVbI7eynjZefIRpP+bTNC1PWJGRcm25a/lLZ8LU+TDluUpc8bEwehPvfp?=
 =?us-ascii?Q?/b3qB4/zgwk8/JZJUoeFNA9Ce0p3CkN61HhADcjBg4BjMaAdeCbQwQhrWDvR?=
 =?us-ascii?Q?ZloBWyTQeOxPZ6JjCqizrXd1qANa5JxyFzWUrEVnL44khaDk9PDyuDHs/4jS?=
 =?us-ascii?Q?RZDiJx4/oei+o5622WmDuHdc1KLn2AUFJFli+r5wb98wuT5yH5z6DGdHYF6c?=
 =?us-ascii?Q?ViyY6MS3jo2LjuUIFpCaVO6PjBdbATGZdiVVUDNd4FlhELHzdEZEt4yj8f4q?=
 =?us-ascii?Q?rraEseV43ge+stgTY+YANCFsIts0ZlKKW5whLx1bEHsiyXwbyXiepLNdSHkE?=
 =?us-ascii?Q?qOp2oZWnoMwbi/SLxpE3r6SER47T1IcUVLo3HMSaIrb4EBSgWYl4o/8NpTAO?=
 =?us-ascii?Q?fvX66zWLuZLa+nnDvSekPfScR+ek9XxJoAX/ysKfIpclwjS6GxHfAtsQB1S0?=
 =?us-ascii?Q?e1O8wfD6yWH0cTMZgyWcB2GtNwb3FlOS4SvGGMlHnQvFLO2ehGV3+gotOAq+?=
 =?us-ascii?Q?8EhFWd+IdF7adaRpn6M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yQ9+rIpagLb8dAjFYlQU0O0U9576UTZRKVdIBuFPHS6dqukLR7cCVTlFQMhy?=
 =?us-ascii?Q?IvDQLx0LFKE3lLiqOpZjFsxO5APt7eGnrLo4yPToTsnlPVY7wsuJ/hXPwegK?=
 =?us-ascii?Q?8CIJZB+6uLAR2mlTOGFjHozyplxL5ysI0YNIT0nGCoXQZtOk436LupsYPy3V?=
 =?us-ascii?Q?BIw/H7wRnS+MB0LzqX/ixjDEc8GNvof1PCbaNXw2xQ0KwkaJWLapyVZ4Gmzs?=
 =?us-ascii?Q?1RujtD4bm/RI/ZfzKSOJusYeCClL3o5p09HRakMXUSRTJpt9qHnJyrYFM6L+?=
 =?us-ascii?Q?RXck41LbKHcXRZaP6GRtVn+8Pvc/Z8GnDulv+Is0c3PeWJTshnneW3D9LUJH?=
 =?us-ascii?Q?9OnMcz+MvMDy2f/PvKVk9yVpuneVrdOcOdpoIC9/MH09OHu+WUcxobE0+xSX?=
 =?us-ascii?Q?JSND6GM8pnimFPsQocl1gAILDR4nzmWjoQzwlI4Xnqsy+CsYCrDHUf+OzD6I?=
 =?us-ascii?Q?Jc4iyfveD9LBSkgLMxZQ/fy423Ahhv7i/yef2BtDhZ7fqfmznk682VyvDMyN?=
 =?us-ascii?Q?GQpSmAMtAYuALJIUvOVytSfDOvQR7jciHwc5eOnamQzGlD5eLIi1q5fagj1g?=
 =?us-ascii?Q?SqSFM8Qt0uE93rLfgrMjtzbqP3PB0bjiLdpz/zvlkmdwqJt16HYuKs7Q+hiM?=
 =?us-ascii?Q?QfjLRHjaFnGAzOXFvEpR93+4Gmt+JBNh4aFfFMe21jPki1jCnirAZHpaQhZr?=
 =?us-ascii?Q?8wwWKFiV/8avajA3eXv2PfGhp6qHSo9XWbk14eCoMc++KQLBQhBQBQYZgBnN?=
 =?us-ascii?Q?FtXxpzYKrb2G7eBSNHzWFJWvMFtcdLPMjO92wIik5nA+iyFAbSBHDkv2ZXS/?=
 =?us-ascii?Q?EH6YTuCxk3TkORaTjpZMUi7V6LDD1jAkf9zKREHowiDK5iH07HCyr/Y6gKZc?=
 =?us-ascii?Q?iSgS7hf091G09zoRQ7IlSCXIa+rNWVo0DOa5clvZwtcpundHWQMx3Hx0Lfdr?=
 =?us-ascii?Q?2bo1SehYLFxJoqdnzyaRh104n0Z6RIslZrSlDXPowSxTXrfxIZr+QhEkNBL0?=
 =?us-ascii?Q?MxFtG7GcdhfUmprevHzAJFLVxI5Xy4tjdLli0V3Wj/4l/B2J5PU43mKwGOqe?=
 =?us-ascii?Q?mwoZ9B1LiwoWlfSJCvFwDEAD+32tAK08ottkPfSJKlRYnSWCtZJCF8OTZe5e?=
 =?us-ascii?Q?JqitAz+I2Qem73HP5/C5FHAhgVcPLlPy+HSfBpoyGgrnpbIxM750OaHEO8YC?=
 =?us-ascii?Q?4+905yAD9LG81o0Mc+8jrvzS2fly/DJqWhJ0pvNHxBQ1DNvs1JUN0mZzWu6h?=
 =?us-ascii?Q?HLB6+ZkKe9v5Cejfm/aLiM3cjMD1JPJZjhbsVzUiIZypCrv8ceQtWjuZQ7Nc?=
 =?us-ascii?Q?k32zPaDru+vxS4Q23YsB5lapIPLvU1TksqE/I1+Zhjo3FL5MwuuQua1K56Si?=
 =?us-ascii?Q?NPcdRwmkGDsA44nwM56O9VwIVKEn9MoTAYdiCP0KtdKBVim0pn5g4vnY8qsO?=
 =?us-ascii?Q?l+KTGkYz9RAWjQGOmxAq0G6NYw33JBNGcq12RWYMTDfx38qFTLOJHwjZSXJS?=
 =?us-ascii?Q?I0XtG9HEauEMHOURmdhRvPPKrAqF8XfqQauNUcsWbTsQDdU+4N95iL6Aykxk?=
 =?us-ascii?Q?MJxYjt27jtEDf/tr7jLnMSuEdvfxWwBFEeW/d5f+BmJklXLnmlCHgIKfzx6Z?=
 =?us-ascii?Q?vgSjzi8ze9h25zVpBHZQ+nBXxIGD1jCMZMWe+juBi7KY3ZSoBUcLtl6JWFDF?=
 =?us-ascii?Q?3XealzBH0p858/cpsgozh35IGiaUZfoLm3/4yNdbg/UcCZ2sMvKrIQlsQSAI?=
 =?us-ascii?Q?sn0kPhWJWPR733Lq5fu7BXX0fGAyLFs=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	01G9+viUIISSq1S54Pfrj02EAOl1abSc9m2Kt1L6cMwtTwD8k3j0fpjX+0HJyAKZyjkkVU0OxBGTep3LrUMg6f2zYIxwGZzPFd5kd8pEraH0gcbVaEFz9VN2puKZ4SK4WG07tXbfBPrfBYG0QlsGTCWubWXUZvvQkUMIaC8sykBmvDHC3s1Uub8l0FDE2PkwXUCO8CUCSjT/qQsMEPMckp54PvHA9e6BxJatZ667Ax0bK5chRp196/cGRWrzo15VVrDR0BVZ57nicsR+0p37x0FBBDH4fKtJZkMU4iYNYE3RU2slXxJXQbQkuXnjwBMutnLEkCOOEtgIgQ3knlbYeMluXN5fNcAJc4jbSEZIX8LEqY9n3K2J5W5/Aj1mPHQ4z8A+sQE1K2xeMrV/jjt5QG32ZlSuH1XwG9VI7tAy+aNnDsPF5+cPm7k7BAxbnWX6Yu3eVYEmlHoEA0slCit1pcvZdtJDKPlPAzoWL66F/jr4viZRTJKGC9bvHyhvcJJRQiNNpOmpUmac67lnMHiH3VREoyKUliCmSSfUtyF5IUTz3iMQUk/AuHFCXZHUe7uoMJmrnVKImdnFFS9wZnteQSanPoLLLIGEHheT309dcgI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec5245d-8904-4024-5900-08de54322008
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 12:32:19.7336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tkjfiF9tUK0141W2oHjcq6cmm3YVAqlOngQoY6+/vBZg6B9BaxRQexVkFgfjkTbyfchEYXuUlH2VT6yfh2B9S7oek1w2V8hGkFFMyADkMDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7072
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601150092
X-Proofpoint-GUID: cwaeljeeAikWas73KCD8tMc66rh3wkJ-
X-Proofpoint-ORIG-GUID: cwaeljeeAikWas73KCD8tMc66rh3wkJ-
X-Authority-Analysis: v=2.4 cv=ZtLg6t7G c=1 sm=1 tr=0 ts=6968de59 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=uICwKfb82vh2Q8OXV-IA:9 a=CjuIK1q_8ugA:10
 cc=ntf awl=host:12110
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA5MyBTYWx0ZWRfXzLVQ4kFcvFre
 gNTG3FUR6/l3IAHBp/2hGqlhxPqGnkjVX67JyswpmFj2TdOZpGhuXU35X7FNLCZpPorsoweoXM2
 zDfhqoHI7kBJfE8WFq2+iF/0tQfGv0/3T+pDoXDSt+KiZw8mcmaUmGD98WVFdXyn2utrYtsgRgR
 zGqeP4vk5nAe8F2/1cOGH+kzhiKHTD6cxl932WlsaCktSXtmAc3XIxleeVIOoaqBadlKIvJX115
 DCgcJ1D/iq74eNYYh9p3BxDQJD2wLkBFBc/hlgsGofU5tb055ppVvmIvI6FO15LsKLpGpxMuH6Y
 rzk+ycdZU6pouHkMIaC3CeIQeZDKQZgAWRWpE+8cxFs9/urskUu0nAwDVcI03TmX1FiK5B9JKKp
 y/gUGxOJ6DcsbwOamG+YrOencBrNorfJl0cecds4pafu2CuJYQ0rkZz8rfor/ChKXpoVZoeIeVo
 ym+P5vdQwSxXbMZ9ld9o2hq/4rHlPcMuRwJxovts=
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 10:20:04AM +0100, David Hildenbrand (Red Hat) wrote:
> Let's move the helpers that are not required by drivers anymore.
>
> While at it, drop the doc of balloon_page_device() as it is trivial.
>
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>

LGTM, with some nits below so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  include/linux/balloon_compaction.h | 44 ------------------------------
>  mm/balloon_compaction.c            | 38 ++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+), 44 deletions(-)
>
> diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
> index d1d4739398978..eec8994056a44 100644
> --- a/include/linux/balloon_compaction.h
> +++ b/include/linux/balloon_compaction.h
> @@ -75,48 +75,4 @@ static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
>  	balloon->migratepage = NULL;
>  	balloon->adjust_managed_page_count = false;
>  }
> -
> -#ifdef CONFIG_BALLOON_COMPACTION
> -/*
> - * balloon_page_device - get the b_dev_info descriptor for the balloon device
> - *			 that enqueues the given page.
> - */
> -static inline struct balloon_dev_info *balloon_page_device(struct page *page)
> -{
> -	return (struct balloon_dev_info *)page_private(page);
> -}
> -#endif /* CONFIG_BALLOON_COMPACTION */
> -
> -/*
> - * balloon_page_insert - insert a page into the balloon's page list and make
> - *			 the page->private assignment accordingly.
> - * @balloon : pointer to balloon device
> - * @page    : page to be assigned as a 'balloon page'
> - *
> - * Caller must ensure the balloon_pages_lock is held.
> - */
> -static inline void balloon_page_insert(struct balloon_dev_info *balloon,
> -				       struct page *page)
> -{
> -	__SetPageOffline(page);
> -	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
> -		SetPageMovableOps(page);
> -		set_page_private(page, (unsigned long)balloon);
> -	}
> -	list_add(&page->lru, &balloon->pages);
> -}
> -
> -/*
> - * balloon_page_finalize - prepare a balloon page that was removed from the
> - *			   balloon list for release to the page allocator
> - * @page: page to be released to the page allocator
> - *
> - * Caller must ensure the balloon_pages_lock is held.
> - */
> -static inline void balloon_page_finalize(struct page *page)
> -{
> -	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
> -		set_page_private(page, 0);
> -	/* PageOffline is sticky until the page is freed to the buddy. */
> -}
>  #endif /* _LINUX_BALLOON_COMPACTION_H */
> diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
> index 709c57c00b481..717bc43732d09 100644
> --- a/mm/balloon_compaction.c
> +++ b/mm/balloon_compaction.c
> @@ -17,6 +17,44 @@
>   */
>  static DEFINE_SPINLOCK(balloon_pages_lock);
>
> +static inline struct balloon_dev_info *balloon_page_device(struct page *page)

NIT: inline here isn't needed.

> +{
> +	return (struct balloon_dev_info *)page_private(page);
> +}
> +
> +/*
> + * balloon_page_insert - insert a page into the balloon's page list and make
> + *			 the page->private assignment accordingly.
> + * @balloon : pointer to balloon device
> + * @page    : page to be assigned as a 'balloon page'
> + *
> + * Caller must ensure the balloon_pages_lock is held.
> + */
> +static inline void balloon_page_insert(struct balloon_dev_info *balloon,
> +				       struct page *page)

NIT: same as above.

> +{
> +	__SetPageOffline(page);
> +	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
> +		SetPageMovableOps(page);
> +		set_page_private(page, (unsigned long)balloon);
> +	}
> +	list_add(&page->lru, &balloon->pages);
> +}
> +
> +/*
> + * balloon_page_finalize - prepare a balloon page that was removed from the
> + *			   balloon list for release to the page allocator
> + * @page: page to be released to the page allocator
> + *
> + * Caller must ensure the balloon_pages_lock is held.
> + */
> +static inline void balloon_page_finalize(struct page *page)

NIT: same as above.

> +{
> +	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
> +		set_page_private(page, 0);
> +	/* PageOffline is sticky until the page is freed to the buddy. */
> +}
> +
>  static void balloon_page_enqueue_one(struct balloon_dev_info *b_dev_info,
>  				     struct page *page)
>  {
> --
> 2.52.0
>

