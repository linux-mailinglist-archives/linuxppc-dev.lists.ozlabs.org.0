Return-Path: <linuxppc-dev+bounces-16913-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 345ONGK/lGkBHgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16913-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 20:20:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B6014F93F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 20:20:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFqGQ3CFMz2xnj;
	Wed, 18 Feb 2026 06:19:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771355998;
	cv=pass; b=NaJTQjHbQkIGbIbqZZnbGDpo8En8LZzYSBQNQzj91780U8G+I5TgH8LTXQ99IW0f9j9wKgslsU5TH++C6JN5xmNuxrabAQC3srlI3MlXtcStf0XTFTrmYQxHwtMexD52feU4cwNVw1zsxDp0Zaqt8onRL1YeYhEscoKFrShRJ+l+9EMeKJsyCuvHxKXQrCBCe0Dmw7oMHocl8JtQzrizO49f3ycbXWhPa88whdOfX5qPC52jfSlBTD1lFA5h4zNFsWkY0M5ERjPq/RsMQqSiOw4HzvYfaUQv/pjMJzjaEi9mJoE6m1+0pd3wxs3+J7wn795vTSBl5Sv/I+rczHXwdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771355998; c=relaxed/relaxed;
	bh=4kgLGiocExqDUJ0Zzfia1plpRHt3TyLnFLREnU/Ox54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PztBySLdUYLLGWAfs7K6kMkyQqst1vzfxtmvAP1e2M1M2H62u70RxE0Jf/6lcf+v8QzmGz0tp2N9bjm+TOux9Blzcxt8bJ1QnQaarQjsBUzfODS9oCWD/C6qXHa6EMjwZwdNuRn4tHrFFmeSnUpJFvREXWI93NFFDlKmQ+ZrcuwxDUB2kILeyDVIGCdENsX6adfM7Z8BalqJYW/Dhcwd2ookq9iMAA6UpV0wZGdZ5c9VsoYCsZlfYgkPwu+kXIOY1h17Fg/TzgtCZm8ka0N6Gbnxa+ZC4AOCl1Pt8To9bXIljp4HOvS03NIKF9pNrGwRg5i9dJUglJ0bUvTN8BTbTw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=dvCdGyr0; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=h7eX300H; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=dvCdGyr0;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=h7eX300H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFqGN6rrzz2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Feb 2026 06:19:55 +1100 (AEDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HGNQMI389938;
	Tue, 17 Feb 2026 19:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=4kgLGiocExqDUJ0Zzf
	ia1plpRHt3TyLnFLREnU/Ox54=; b=dvCdGyr0oK3fJ7dLZbGT2ZAhTTap5b1eQ/
	tE4JbSvqkiXO6Mr3Qoj9HT2QUdhQa+PPJHbXYs7eMKlg1gRdEM98q6BZ1aYBVJch
	Mq/BWlaZsx4br2cDi+n447RcgA3r098eViYzZLrRL9BSICX+XvvywLsaPubv2jjj
	/SiDXE8HX3RAE9sga9MUbj2CoqxWf7d7ByUHI0laJ2Mq+TvMsNupEgE+D2I5GaPb
	E0SRpRI5qmrtnbER66KCAFbws+mIfE+6ocg/fB0WvStut6IhYGm9+tV3AuN5GMHM
	cN7bBfQDPunOvBIlcHk+6EUPeXunnDPGnPMdreAk/wzsRayhHDew==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj4av77e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Feb 2026 19:19:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61HI8inA015074;
	Tue, 17 Feb 2026 19:19:16 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012056.outbound.protection.outlook.com [52.101.48.56])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb22d2fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Feb 2026 19:19:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdKKUHZjA29b4tW8QXLvUCC+nhECzL+T72ujbyEyyWtIX0AAEAYBeV6NYtyxRB+0A8chPWc5psogRhIZXdS81bLqMcLsP5R4pP3hsrvGYW5/iKAwjvkXEw7T3WS29D6Av4w0h7R2XQ5cmfbbVPBG5slAB5iFoNx8ezhMCtvkuzAtiqWle5fBH7gqFYSconPDElxEuV6G7DLclDwnmiSnqsQWg/3DeSMyRzGHG5ALptxhmfrdLR4nXzX5O5tEgwaWtnTjJxp7GCyXQc9g8grToG04Tnkz1YcCcmXuYXw64zV6mJiyju8FWuCw1JqVNEZ1w7OyzWkDuBDYNhBvImbICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kgLGiocExqDUJ0Zzfia1plpRHt3TyLnFLREnU/Ox54=;
 b=yHiAgr5pXred6d9cM8idG9kq1l3REnq8NJgZPY6UgjVvNTfONpnoq1k/L+5c+GcEqhB8z8gBXpdxZoM+/X7E8JYugLHLr6BFrI6kCfnDkXz5wlxpI9caC4FgsadxYi/bIuLWcr6cPgXr1r7j0rJ3hau3D8/ijDmmi5xNwnitD0mG7f+Y1yCycVXV4aDbj5ma1Ts4ip2A9FdpwdM5I55g68jsipBvcUzMCe9MbTa3ufPwTH4T1IX2NRrbYCMcfW9/4aINKdaT9z3kzw6ORpTcm4h6ydJMS3c/dQ5G5VFk3u3izTg/XgiEtZIyX5OBKOD06hqvPDY3Y4q1NcVv/R+mgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kgLGiocExqDUJ0Zzfia1plpRHt3TyLnFLREnU/Ox54=;
 b=h7eX300HFqF3S7hNvExZz++Yx2d/5W6+k44PNaSC8/bbKBkdEDdqGhR0XVsmPdtXekCK64MBL5qX8feDck17YzLs6ksgKas0sYY814m/CUiTfD18/xBoIdkeFjlcWXEifmAEVfbw3hrxHIyY32lv4TVxh5GjtOWhYUctfbfaZkc=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SA1PR10MB997606.namprd10.prod.outlook.com (2603:10b6:806:4ba::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 19:19:10 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce%4]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 19:19:09 +0000
Date: Tue, 17 Feb 2026 14:19:04 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@kernel.org,
        ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
        rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net,
        ying.huang@linux.alibaba.com, apopple@nvidia.com,
        lorenzo.stoakes@oracle.com, baolin.wang@linux.alibaba.com,
        npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
        baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz,
        jannh@google.com, rppt@kernel.org, mhocko@suse.com, pfalcato@suse.de,
        kees@kernel.org, maddy@linux.ibm.com, npiggin@gmail.com,
        mpe@ellerman.id.au, chleroy@kernel.org, borntraeger@linux.ibm.com,
        frankja@linux.ibm.com, imbrenda@linux.ibm.com, hca@linux.ibm.com,
        gor@linux.ibm.com, agordeev@linux.ibm.com, svens@linux.ibm.com,
        gerald.schaefer@linux.ibm.com, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Re: [PATCH v2 2/3] mm: replace vma_start_write() with
 vma_start_write_killable()
Message-ID: <dtdfrko7uqif6flc4mefnlar7wnmrbyswfu7bvb2ar24gkeejo@ypzhmyklbeh7>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, willy@infradead.org, david@kernel.org, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, lorenzo.stoakes@oracle.com, 
	baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, jannh@google.com, 
	rppt@kernel.org, mhocko@suse.com, pfalcato@suse.de, kees@kernel.org, 
	maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, svens@linux.ibm.com, 
	gerald.schaefer@linux.ibm.com, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
References: <20260217163250.2326001-1-surenb@google.com>
 <20260217163250.2326001-3-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217163250.2326001-3-surenb@google.com>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT1PR01CA0093.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::32) To PH0PR10MB5777.namprd10.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SA1PR10MB997606:EE_
X-MS-Office365-Filtering-Correlation-Id: ecd3efcb-8220-4b0e-0268-08de6e596d37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AfVXzoQsXJEX1sUZfM51ekaVdv+Hh2yv2njViq6n4dkPU3Nj27aqs+BidEbH?=
 =?us-ascii?Q?xzllGmv18Pu2c/HkQ625BPtQo3gsAY/aEDLUU45fKfqchmlF/+rtWc4GAOJh?=
 =?us-ascii?Q?BRbFjtgT9a7s0Dk2mLRgR2Gxhq2wksCUyUZSjyFtXy3ycBQsTfjulEosZ2LG?=
 =?us-ascii?Q?dg2TS2uZNSkk4nyiYtq7D7zVu3OpVFML7NEFEQtEIMMuYpVCB+MyK55rG8nV?=
 =?us-ascii?Q?sk3cQt9pwhpJNuQzhpFXZo2//dG+QNqBiXUCy/VnUPGSvAlEc1v0KxtBeA+h?=
 =?us-ascii?Q?FHSCUIOEbXUI4Sm6LZGOdJfb9qv0kBBVJ97LaZDGOaVtZJkDFd0vBWyjPqJM?=
 =?us-ascii?Q?Ka2lyBLBFNRq/ObMiLH9a3I0sZzBDXBxBpz/eTeiWiLwjpSZtX/aAiu6yK4O?=
 =?us-ascii?Q?kt+Yqep93EYLFb++wRMIE0u6ZcM9VAdviAsNxBsSBttvl1hYaOpW9asIESrI?=
 =?us-ascii?Q?4jH4WsUtHhbaJe0f1+cvhu9WrsRafsEkqv3lOjS6udpTQRX1pHKdSMioccHO?=
 =?us-ascii?Q?VuXzR5+HmxyG5oHJZEY31gVtFIGZ190+UGwSCl7JgHEN1gcjExewqRshfGnr?=
 =?us-ascii?Q?DOvBCjMiAxllWrQaxq+rJ/Rjz+kiIdNNmG6E0wKjkiI0Ykzp2kpVYi246/rS?=
 =?us-ascii?Q?wz4xKBw5vgUW8AOVx8A3Z4rM7U33spkvvE7kjYoeLZgEQPbkSdADAQ/VY6+V?=
 =?us-ascii?Q?HXwcA8KQjHoYXbj5/2zdgJvisHE++wv24QIPukPCaPGQ85NS62N8FPVIRF5e?=
 =?us-ascii?Q?yNc78HTC5mjcAzbH/1IpZ4kmWguZoXYejIHlikH8g1GW6wNfLanNtMk43Dc3?=
 =?us-ascii?Q?864TJuvHE2dEz/dgjEKA0tsU3QuaLoMuigqwrWucg+VOImj1AQngVFEVO79k?=
 =?us-ascii?Q?NQE8MMe2QDU+iCQcqpnoBDw1gUDehNXHZJx6ytG/Y6/XvVgSVDWB3dCd1JgW?=
 =?us-ascii?Q?S4Ish7/8K4e5L6qZSnGcBsR+S5aAAbA66viF/asfoh28s1FDAbTS7PzGeCm2?=
 =?us-ascii?Q?dp215oQ+M93wX7qTCqi3hEneKLfYPQuUMa1k3G/FpTZniQUPgDOu4AmWWB+E?=
 =?us-ascii?Q?3AFsrQf4GywhTL2aD8Oq+CQQgRIr83YslP3/8z8lY+0oK+7zMhf37IveDkzg?=
 =?us-ascii?Q?U6KP+MetGlZdtEShecn3TD0deRAh9IppJ9v8dn5UT4dsTU89UDcw6hiH/cDB?=
 =?us-ascii?Q?4lhMGHDcxglwNEqkjamJSziIT0ubEzjlK/97WEqmizpTcswgIOBCQDCQHW0w?=
 =?us-ascii?Q?xwMtoD6xiMQ1pLd8pIR2TTYwjZgyJ51Kf1JDi24pzztSWdRc5RGSVUwVmuW2?=
 =?us-ascii?Q?ylohy4kH0jTSlKnj4nSfvwWVHZdB9CPhLgnn92bTL6MRp7AcmZcimcgsnB2D?=
 =?us-ascii?Q?mROBrqnAJv3kh04RFJFJ/RAYVrAhZUlHYmsdZ+Cije/i10Jd4ewmPAhn3r2W?=
 =?us-ascii?Q?zI1aVrs/k6Ljqh4yJvW4/TPh7yGTa24nxHRdQhfahxVxb/odwWAsEV7tbh3y?=
 =?us-ascii?Q?EkkwwjYZWO/DUVOojQ/hsJx/okL54xz1E4CQURxZ6/MYMTzjrPmC1i/KK9bh?=
 =?us-ascii?Q?CJj4MOx5SngX5BNkgSM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mz+OAOi7EBi88bJv0Qy/ZQJL8hXj1H05Zr1y3qbELqAjkK9qyGgiUFDG+ylW?=
 =?us-ascii?Q?C4jqi8vClt6uH4KhMm+s5SWg63CQyn5t/5OokTbWP4LSf+jXAkqeCTPMyIC/?=
 =?us-ascii?Q?tlkTLhWXcB5Em0H6T+KOoBkF6wyND9MjHwUNda5deBusiXnSfdzvEZNkT3VD?=
 =?us-ascii?Q?VMEdJpgjCD5W1vDZG1hJHZnS3LonS9YN7j4MH/Mf9RA+OPlEhNIGeDvqUGxJ?=
 =?us-ascii?Q?1e4Tb6z/hLXZmzy/94JyRTJ3yFAou6WAIPaSvepHQ6UTuMd5V1t98Aw+XDmk?=
 =?us-ascii?Q?3BqRDK7adrYCFibg58qrZH4BO18xX7Df/2+BQnOk8nU/w3EtJacl70gLgquc?=
 =?us-ascii?Q?KAWiR6sVsFHuy8rrp3mkfHRdeu3wOHa9B44nUS6Xxfq1npuFSdSx0Sf3LFxl?=
 =?us-ascii?Q?rucx5s1VgMoY/fJBQwkAnRbn6EWaFn2oT6v0/xgvWx3gyXdy5s59yXoTSOKg?=
 =?us-ascii?Q?p89oNnUrA41ZkeDZW0X5uq69U3TGRgGcE4m4FHx1XMn7lse3jigU31kjiI6B?=
 =?us-ascii?Q?4rzgQDzPUTR9DKU001V/CNqnLmgD+hWVQ/83s2QNsIRWhdc5Jpujh5yAz5wr?=
 =?us-ascii?Q?yNfJmGq1X/UR3RFhSy+KUzVY5IbjCNSyY5bQbe80b4q1trbbrbiQTpCJOIzn?=
 =?us-ascii?Q?JKHppAElNZhFnvPVKjdEQ+dMSpyf+rjN7vs6zBn72pLYsH+JyNYO3O9iTfFB?=
 =?us-ascii?Q?r4V3W8W4PiM9ZeIiWiBrXOh6qCAoDuZpcROD6fffqGTvThekqvTq/Agml+JG?=
 =?us-ascii?Q?//TSGn+919rsOzK5dkXqK9E25QFGxomAcF9L2iQkYLLmdfK3H/TCgTqN2ONa?=
 =?us-ascii?Q?duF/aWBH7pNKTUXMtiI9Pacb6TGvf1xkhwbvcHJ74Pn22TyJhi89+cEgoKW2?=
 =?us-ascii?Q?2FB1RjJXjAsy5hz7aytHJlFSKTXmhbFKqSovt6MgUdRTLybPwffuoJlzB5In?=
 =?us-ascii?Q?idd8e29vsxbRBDAWaUb7QZUVhu6tgdKC37B8WIcLaq0Wk2V5HkWKPGBBpv1p?=
 =?us-ascii?Q?ODkHU/OtOwZTHvemYBZffxDm2XlXyPnNXleAlFbfMWufWijQ63fj2zjq34iB?=
 =?us-ascii?Q?bcQkdRylO+gP8hugMn7WDGwhbGbO7bhhipD/pn7tUwXC1T1ZltQxD8yCiDcb?=
 =?us-ascii?Q?ArhyJYjE5dZ9wAGIYTrQuLqw7PWlrzZk6vsgGRPNVpVfc5tk2rXyQjXYNSe6?=
 =?us-ascii?Q?u6KrQQYoa+I6AxWYdfTGwisnjwk+df1yRv9jGK+FQ+Xw5p65RULFPkfo4JYe?=
 =?us-ascii?Q?Z6By6yK487fJO2UNU9j7lbN4THJBYSMfdZ6gWicBeLM88WK0f7/wv8mBJvZC?=
 =?us-ascii?Q?SOiuTVoi3Nkx2jaU2BwYJHKaryCO4mMKlp37W/b+NgcfHThIQzncI1CU7jJt?=
 =?us-ascii?Q?DHCAxVX+M7xTja3dSGSjUqwNKHezpEUl5oYKPpADxtMxPu9pBlHlsNh7t+Vo?=
 =?us-ascii?Q?p6fmIv/0h+7u1ScxzXHYP3Dom+KG3ERa3mGmXCobakKrWdEnaWmxsEti4fnU?=
 =?us-ascii?Q?/pxXq+oi4AKn7VzbN25PmQ8oU+9a122yRDJrzn1eeC9FW0eqM8F0wAv1idI/?=
 =?us-ascii?Q?x9tDSzTVCU90yeQZprD2CE+oanWUcPAIQH60Nj2N2Ho7jdcPMhD9kKJVKynd?=
 =?us-ascii?Q?AUyYMrxfIrs9OEY0pm9gU9OD1IVTzXrJuy2XJTYp6xYbnAcVn+TRWTl/EpYb?=
 =?us-ascii?Q?JiK91gKR2DhbkbWfF4snpbssnNpSc3QYa4BeORgqsDV34+LWlvGVI+GyARuV?=
 =?us-ascii?Q?CIGeqBfTaw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yRCXOPcX1ZLihHdAxyL192zWPao3c5MglJXJ76susGJySmBJOlWOfUQSczFGg6J6Tw8VQyY02HUW8yHmW/dfzP4Dd/txEhVtn2aeW7DjdCecOSQPkI0+oF6O904aIYnOOPb7lKwi3FU+5yWtKrx7bvTgTZj0ufeqoYj+P7kHrYdqqXzW5+O84ShDvPBOWZO1vPSP60KliQ7g6vbrL1dOFU5jqsSflinRXKE0rWjfeHrqbayy3m9LR3c/PLB55b4EyDPyUzQWs1GeSTVj63vfKFR/P8Nn9mhvuf6OZ+ijV3Sw6iJTIOw2l9c9D3zNhoKu5SG1WT7jmyzVHkRxL1ZixbPt2Q2+Q+q2if5gwo01lZW9PcnFl/4SND86GwRylAq1WKyVSgLyaROsOmHirSLDHromADwPQca4y+svx7VBGIQ6pRBbSrEWXRSn5gYVUY3TgLaV9CT+TTTms+EtZ7XBdXZonEmIiXdQeWBokUOQYZKS/A7/VI4rX4WVmxgG0XLtjb99c2fdfu4EoiUgmjqdMaINBcj01KNyk7+Vbm1fKo8nh3jV6Y3NK+U7Oy7/B7ZIJLnK1VQBji5y0x76goAYgisM0DytpdvyeEKSwQPiDoY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd3efcb-8220-4b0e-0268-08de6e596d37
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 19:19:09.7928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5tq4kBuHPz9AawWYrc4VsiZPMjYx0engFsd49HdhD4fEQbn9BI6TF9XpUro93p8UzQOkatd+rfBPP+KL4g7uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997606
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2602130000 definitions=main-2602170158
X-Proofpoint-ORIG-GUID: P-9w7OifQP3fWFYiTH1tzJ8WwatkGMfr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1OCBTYWx0ZWRfX8zkNWM4szU34
 kLmXeL5dvuz6lnFYXNt6B0aZsTgAKxPGDqkvZEhSEHQd59GAbAp/uIjEHUq2C5lbipOuyYsz5w5
 r8Pu/Y7RVMJ46v4uGnjpGx5KN3fGjCACd2wEveafRoUof19+TC6yV8qESS6+LCXUWDVixV9t5my
 taC6PTr070NqUPXTpTan8x33mdu8pXPduKVqdIXqw3FveNtB3TtyNOD/98/+aA+27P1NeYyCT0Y
 eNq59v2ParH2xfyISX0JShaVMpChLHEJA7djuGVPtS1/cKTxg19jmhTG0GhePnDazR0cIApri+M
 xJFWKrbU3KBUyS9YtZ5a5pD8mIi8YUmPU0ocSFLYrz4HzmbLud6HB2gpLa2idAGcL/AFUxI6KnT
 xlg0yimYiQBlgW6XFElmEdR7PSAfFrMqtrJnYZjzxNkwOyJhH3CduDf+qxKQYXIfoCGVVv5bcDY
 8IDdecLIsBzHRpuOVwQ==
X-Authority-Analysis: v=2.4 cv=SI9PlevH c=1 sm=1 tr=0 ts=6994bf35 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=1XWaLZrsAAAA:8
 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=SlzsHwD9-oOyvTpvhN4A:9 a=CjuIK1q_8ugA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: P-9w7OifQP3fWFYiTH1tzJ8WwatkGMfr
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Liam.Howlett@oracle.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16913-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORGED_RECIPIENTS(0.00)[m:surenb@google.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:ritesh.list@g
 mail.com,m:joshuahahnjy@gmail.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.onmicrosoft.com:dkim,infradead.org:email,oracle.com:dkim];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Liam.Howlett@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 26B6014F93F
X-Rspamd-Action: no action

* Suren Baghdasaryan <surenb@google.com> [260217 11:33]:
> Now that we have vma_start_write_killable() we can replace most of the
> vma_start_write() calls with it, improving reaction time to the kill
> signal.
> 
> There are several places which are left untouched by this patch:
> 
> 1. free_pgtables() because function should free page tables even if a
> fatal signal is pending.
> 
> 2. process_vma_walk_lock(), which requires changes in its callers and
> will be handled in the next patch.
> 
> 3. userfaultd code, where some paths calling vma_start_write() can
> handle EINTR and some can't without a deeper code refactoring.
> 
> 4. vm_flags_{set|mod|clear} require refactoring that involves moving
> vma_start_write() out of these functions and replacing it with
> vma_assert_write_locked(), then callers of these functions should
> lock the vma themselves using vma_start_write_killable() whenever
> possible.
> 
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> # powerpc
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c |  5 +-
>  include/linux/mempolicy.h          |  5 +-
>  mm/khugepaged.c                    |  5 +-
>  mm/madvise.c                       |  4 +-
>  mm/memory.c                        |  2 +
>  mm/mempolicy.c                     | 23 ++++++--
>  mm/mlock.c                         | 20 +++++--
>  mm/mprotect.c                      |  4 +-
>  mm/mremap.c                        |  4 +-
>  mm/vma.c                           | 93 +++++++++++++++++++++---------
>  mm/vma_exec.c                      |  6 +-
>  11 files changed, 123 insertions(+), 48 deletions(-)
> 

...

> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c

...

>  
>  static const struct mempolicy_operations mpol_ops[MPOL_MAX] = {
> @@ -1785,9 +1793,15 @@ SYSCALL_DEFINE4(set_mempolicy_home_node, unsigned long, start, unsigned long, le
>  		return -EINVAL;
>  	if (end == start)
>  		return 0;
> -	mmap_write_lock(mm);
> +	if (mmap_write_lock_killable(mm))
> +		return -EINTR;
>  	prev = vma_prev(&vmi);
>  	for_each_vma_range(vmi, vma, end) {
> +		if (vma_start_write_killable(vma)) {
> +			err = -EINTR;
> +			break;
> +		}
> +
>  		/*
>  		 * If any vma in the range got policy other than MPOL_BIND
>  		 * or MPOL_PREFERRED_MANY we return error. We don't reset
> @@ -1808,7 +1822,6 @@ SYSCALL_DEFINE4(set_mempolicy_home_node, unsigned long, start, unsigned long, le
>  			break;
>  		}
>  
> -		vma_start_write(vma);

Moving this vma_start_write() up means we will lock all vmas in the
range regardless of if they are going to change.  Was that your
intention?

It might be better to move the locking to later in the loop, prior to
the mpol_dup(), but after skipping other vmas?

>  		new->home_node = home_node;
>  		err = mbind_range(&vmi, vma, &prev, start, end, new);

...

> diff --git a/mm/vma.c b/mm/vma.c
> index bb4d0326fecb..1d21351282cf 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c

...

> @@ -2532,6 +2556,11 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
>  		goto free_vma;
>  	}
>  
> +	/* Lock the VMA since it is modified after insertion into VMA tree */
> +	error = vma_start_write_killable(vma);
> +	if (error)
> +		goto free_iter_vma;
> +
>  	if (map->file)
>  		error = __mmap_new_file_vma(map, vma);
>  	else if (map->vm_flags & VM_SHARED)
> @@ -2552,8 +2581,6 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
>  	WARN_ON_ONCE(!arch_validate_flags(map->vm_flags));
>  #endif
>  
> -	/* Lock the VMA since it is modified after insertion into VMA tree */
> -	vma_start_write(vma);
>  	vma_iter_store_new(vmi, vma);
>  	map->mm->map_count++;
>  	vma_link_file(vma, map->hold_file_rmap_lock);

This is a bit of a nit on the placement..

Prior to this change, the write lock on the vma was taken next to where
it was inserted in the tree.  Now the lock is taken between vma iterator
preallocations and part of the vma setup.

Would it make sense to put it closer to the vma allocation itself?  I
think all that's needed to be set is the mm struct for the locking to
work?


...

> @@ -3089,7 +3120,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)

Good luck testing this one.

>  	struct mm_struct *mm = vma->vm_mm;
>  	struct vm_area_struct *next;
>  	unsigned long gap_addr;
> -	int error = 0;
> +	int error;
>  	VMA_ITERATOR(vmi, mm, vma->vm_start);
>  
>  	if (!(vma->vm_flags & VM_GROWSUP))
> @@ -3126,12 +3157,14 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
>  
>  	/* We must make sure the anon_vma is allocated. */
>  	if (unlikely(anon_vma_prepare(vma))) {
> -		vma_iter_free(&vmi);
> -		return -ENOMEM;
> +		error = -ENOMEM;
> +		goto free;
>  	}
>  
>  	/* Lock the VMA before expanding to prevent concurrent page faults */
> -	vma_start_write(vma);
> +	error = vma_start_write_killable(vma);
> +	if (error)
> +		goto free;
>  	/* We update the anon VMA tree. */
>  	anon_vma_lock_write(vma->anon_vma);
>  
> @@ -3160,6 +3193,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
>  		}
>  	}
>  	anon_vma_unlock_write(vma->anon_vma);
> +free:
>  	vma_iter_free(&vmi);
>  	validate_mm(mm);
>  	return error;

Looks okay.

...



