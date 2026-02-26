Return-Path: <linuxppc-dev+bounces-17309-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFCBMGOGoGknkgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17309-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 18:44:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 767261ACBA1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 18:44:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMJjW5bt4z2ySS;
	Fri, 27 Feb 2026 04:43:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772127839;
	cv=pass; b=dxQm54wJiK4KhrOnFUqhLAtOHOYwblOmj7IXmrQ44X2rx0edZvBSpDl0NRC4/rch6AKHCv0/J7t338I/o6xeasBooUdblQ01L3+LFRm5j4sTh+qndt/zTsUhKusUtZPs2giWp48t38ETYf2O5OkgP7AAB2VOLfEynx/68rNkVyL11Jl9KBNBh8/A4Re+2iTrN08duj5kWeRCjP5wMuLcZ/dyD8nBa0sPG1i0VJAgjwcAxqvBKlZiYpKlWxSvgBFOd16NtgaUqniyrwX75pZpF/KJfeR665XFxUnaRFR/2a3XoDBP1guOge3TJ2UB/Ry7UGrbPruvavwfGoeclWx06Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772127839; c=relaxed/relaxed;
	bh=YXw+X2iueWbDM79q3fuJmseNco19H5edzrosVmZf+3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fFc/QdifUUXPfMwV4xAfxz9uggKQusPM+pVGfQjf8zdY0wgZnocL1rmEKFKjQsZHrQWimhjDsl4ptjpsU9Fl0szPeYdIi/povRDuHFE+7woUg0l3eHw/+hAqqeuwOjG5CJMRQMNG4YMF9cV2rTgACyH0nWeSp/NZR3Vcq9KptJMxFeizLxvMeZ7IgJ/mf3mnAHs/nNdLCNR0JygkqByNS8nC/e9HgEw7M8hrluz3rFkDkpqto4JxUpmNGTDB9G0TjGSg827zA/eJu3L1af3nNOkMTJGiHyvGvqqgvGziPoyR+Op7uGLhpQUz8ojmH5fDfQiPg7GEvAp91nhmSQ174g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=rgsCuSqI; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VX4KlOjs; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=rgsCuSqI;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VX4KlOjs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMJjV2NX0z2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 04:43:56 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QDNLe41973013;
	Thu, 26 Feb 2026 17:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=YXw+X2iueWbDM79q3f
	uJmseNco19H5edzrosVmZf+3A=; b=rgsCuSqIG0y4sU/Yy9kblLf9sH22NS5DS0
	KraJyVnBU5qFGsior+PEfs6Q6FZLqkIhG9z1x1oQySKRp5kG3QMEqX6BRgVWzkVA
	H6cUdocmpPj1plCX3295F7PY2+Y+uHwnglExJQd/ibc7Td18rUY0A5mmhXIZo6wB
	ZBQEroiWOxN+ONgk/XMlcX86aR8uGHj1Oy/nq955XCR1XXyKhhOVFffmM7G21WGL
	hXF8V3tuaKtevyCcJ74w7nCW55TFTLYc0KvPoAeXARDaehXQX12SAPsHVGg8m1tx
	kkkPWA4NGk48pTikLLewa+NZnxtIHnoyN1KK410WXzU2ZVQ2u31A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cjgs0133u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Feb 2026 17:43:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61QGSvPf038497;
	Thu, 26 Feb 2026 17:43:22 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013033.outbound.protection.outlook.com [40.107.201.33])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4cf35q1ecj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Feb 2026 17:43:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w59A7Ucj/+/BCjVvPBDinb9/Rjbqp3aOz9/yUTGq+tthLeYbOiLy8neryFqSsm3g+E7VpPsz8LhJuWchl76dm4r97iVjL3zsEaN2eA9oCyZiCFDIu1XRrgvEPLk5pkoFHJpjW4JYgeFosD6ltCbcjlZsETiXjLp+ffzn/nJO9wInyQtHeNjglF4rBs11Q3qJXNXa5ATtEyCiXW3E+8txkb5koE+zjD/FVsYvwfDd/87FSkSd+B+acSJmPPsf4ikHYIKOgBxQ3uUblacYdMl5t0LlUlCFbYjLuEcwCB+/1hEk985KiY9bDiZbVh2jrqd9oZXI1iwekeuEC8Nr7MBuCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXw+X2iueWbDM79q3fuJmseNco19H5edzrosVmZf+3A=;
 b=BjIJwmozg5dIOm6WAs1rB7P8yL4zbUKsoQAlnf00qcYWoawu/C3ZMqFs7+T5RlBLESlkfN0p+K3B9RxVPb5CIgYyWjvfTPNz3ivjg+BEO1MkX4ichsta1KSvwBnaGpu38sk5+twEbf1V7YDRyZmUsty0Z1aMNIGZpI9E2JesXknbC2hXOQQNpEApLte5W08nH93HxIuW9p8saD0LgLVR2I82P/5Y2PYdhrwRyo74/sp37tCxcFd6eiWCOpkcwNWRS8/XpoE2qG0O0M1xu8fH6yTBXwLMsgY01Ze8cTwNrOzPHqG+EuJrMZqWiHRemBGYDP9bSHNgAJyNYcUmRriG6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXw+X2iueWbDM79q3fuJmseNco19H5edzrosVmZf+3A=;
 b=VX4KlOjsMFnlHwJ34upg+c6NZwB8i269CItJqHui1W9z1LEWtqoevnCllHHLSb4PMBbY1hYb+c1bNCCVPxpKiHk0KraWkBZLZpZAP4S35J1UKjxdJQw5Jp3bj7xia3dtEDKs8nHTvLjWSV6rji760MQJWEXmfKYs88AVjOfy2yU=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DS0PR10MB7936.namprd10.prod.outlook.com (2603:10b6:8:1b6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 17:43:15 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 17:43:14 +0000
Date: Thu, 26 Feb 2026 12:43:08 -0500
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
Subject: Re: [PATCH v3 2/3] mm: replace vma_start_write() with
 vma_start_write_killable()
Message-ID: <vb6lgskvpmk6qcdo7tthmc3hpo7jppbx4ke75vepx2nqos65je@wxv7muptiiq5>
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
References: <20260226070609.3072570-1-surenb@google.com>
 <20260226070609.3072570-3-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226070609.3072570-3-surenb@google.com>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT4PR01CA0285.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::23) To PH0PR10MB5777.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DS0PR10MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: 5feda253-dec4-4280-43f8-08de755e8440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	CR5pbkATy7SpACb+prRbph/a4bLziUukxLdtd+T0NsCUR5thUUvPtmAhhK7kZzEANI4G9TaW9NbKGjmIRM7JpoRetJz3jtYJ4p8ukcRKA38R3W3n+zlvSlRhTpNrash20htJ9bPlIXbraxwCWq2TdY3ke2R9PGfXsfh14QC7cy4EheC200XQyl/9ld9HOZ9JVjf/q4HNK6EJy2gpeEddjeXaRzQhQYfE2r0NForu5Kv1ZJtu9ZANdI0LYIOf8kdIkKKXvXyoYfsfqEyf+nfZ6g0Dy0EFdaIpDQ1TOKbFGrP95dTfb7Mr3g+91/C+S2kCZglK8mNTY4qbPvhfOEV2ULQ4EXeED7HEKqfWOXUYSwPK/jKwW3dSaG7LDg8oVRRQAkLMP2lUike4DFuMLeC5b198/0ru0+p0F0x5H5tUr1J5xEx6ozKS4YyPm6zzJK32GOyxtOTXD5fYJyAYRcgeCi1DR/+rV7cmPsgr2WeYPbyU5MmWRHCyOKjxzrMgjzJJtZBztddEXv/VA3a6cowogkDATFNp8HGHh7t2cEcNgcj9NvJXear3uTlexoeaQybLY2oqXILvzAaSLl+uNehTpej/vRuilb7cGbeXKOedhg6+2DV8yplGAe26FbCZFAOLOX2KVX7F3KMmg3BNFD0QppV0+a83QdegXutHWDWJDohlC+i/uDTRkrwUdWPcuhO/4xIgTGsYxWkTkmCiafmgagwwPucc0QH4D8s8Li5A4+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bIIhh6Y5Xjn+n8lG1od371knysP7232voONkThq9BDK0866pJY1aU5Q0oET+?=
 =?us-ascii?Q?gXuwX8tyCrTKhhsd/uMeGIRwDiQIyLhfKqreHDwTuBIJaJmfYudeARGoaHoG?=
 =?us-ascii?Q?70iAsHrw2Vmw3eb3p/hSTdhKpdqldh/EjpUEAZpcXkFVgSwYeX4UnGrPjtOI?=
 =?us-ascii?Q?OSEaL7cmjw/XKIDuY1V+7P42mi06X9cc6jHbdzXi92A6Ly5sDyNlqOO+f35e?=
 =?us-ascii?Q?Ff6cDaQ22VElxhPs7tHEuC/Rx/esLUC11VnUoRoTxyMVz/HIDm/vZ2yOP1A7?=
 =?us-ascii?Q?7n1XnT9FvnQAcLN7TQoomY421sweNV/+XsLsj14goTosMR5nFeEXb9Da52QN?=
 =?us-ascii?Q?yuIlLCmTnckgSq2ZPzVlHhl0xz+hwlgYlamPYebaUAIbYN0dILaKq8Fe9Ad7?=
 =?us-ascii?Q?XJgFF7rrdkClrpTLJOrHD8U8lJMSJynvuWJ405+fk7RzipjAzIkVAyhQvs+d?=
 =?us-ascii?Q?tLf+bEddwSa0mZKE2O/64xF6nFC5JdUJCIfEsBr5sYYiK4+pyG0a5JtYUXvX?=
 =?us-ascii?Q?GV1fMpzxlLroX6uIbK+E6fekuTK+RrfU4YlOBm06XKjzsRxeImn8yeNASMzT?=
 =?us-ascii?Q?bXW6y7f3NNlDO6hVczkro5O1iiqJ2KU30WAV6Dh0ndVTe74/1QAIb87W3FI3?=
 =?us-ascii?Q?SeOJhod2BczCLN+Dq6Y+qccRVNED38JYckG53Z0UhzxqQc8UywUoobmLbAeq?=
 =?us-ascii?Q?zMZusLepAjw8CuZ3qAKyvIJ2W/xGXcYuko9KoslTNOXBGgO2cNj0jB2p7npM?=
 =?us-ascii?Q?NRHrrQoPCfTJaXZvp41fY+XIdEiZJCuSMtMgy3/nFpzzM+z+HPW8oUxiN96L?=
 =?us-ascii?Q?GvJsYyZQfW8m3arUIxOUpytp68TALWjtMQLkAo8WBHx4nc5vYDHlXFsmg8eh?=
 =?us-ascii?Q?dQabL9RfVZB4QnTrNfG8EBUoifh4LM/4CDmEC3unSOp2PzK8q6pqr2ALKSCh?=
 =?us-ascii?Q?ZnmbZ/SmFgmYDMG5tOu0m75Ur0cIaxTXoBtMwwpuB7pfDKVRXxaqx8pxhbik?=
 =?us-ascii?Q?BXl1lPgGXZU5e7M18PKBABvLX+tOag9v8ZIbvImU4DoUlcvNO8cxnlNMXBwb?=
 =?us-ascii?Q?JmtbNsQ5f/af+SsbUKI+ZEZJ551s+LS6ux6oThJI6YbdgtraaMVVOUoVMwBA?=
 =?us-ascii?Q?87mA1eeTKVFHqctCfe1pavbOv9z+i9TESegtERsXRbrg4irJi7+k3eSqldtF?=
 =?us-ascii?Q?EMX3Xaunbz2kEBXHH6KDEoC64iN30pLFhIiBPYGUemTVRbxUbUIW2g/llAv/?=
 =?us-ascii?Q?GnvKQ4p0sjAFNDqie8Ng4ZoSD1rIPEyPsMwaIk7CthRvA1opbBfmhX3Bre+r?=
 =?us-ascii?Q?eD3aBhNtaf64EGrwzFfXFPC4PsOu1VJYQScghwabzj5gYAsdG61x1Z1ZGuHZ?=
 =?us-ascii?Q?mFzpquXhFal4JnfUjNNacs6LxRFoWYA7pkayVSgYC/B3HBGJ+nD2g+ToS1jb?=
 =?us-ascii?Q?+onJ1bVgz0R1iPY2nu0jn6T7s9km76eIwjExKvHFPZcjKqqwit+t95vRygyF?=
 =?us-ascii?Q?5Aetgu8NGwX8BJnO8u3uAT1WFoq6xxnVl7JgEJ9yUlUkPdquvQZtpEI5Tlrh?=
 =?us-ascii?Q?XHBu37TaZI8nPwKVExjN9lhxtUEzddRdzAXz5t6mhe2K48rRybNZMBKEOhLP?=
 =?us-ascii?Q?FND12GeuquEiuNSVp6MkGtQkMuv4kIBH2ql673TnZKIygtnBYYqgbZI2v0Qw?=
 =?us-ascii?Q?dZcnWkT2C4ytBQ3khHTZzKkAu5GQOO6GvHMbiTLrDn1jHpwXnuaJ3vnbuUje?=
 =?us-ascii?Q?g3nP2FUKew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JvxbmQhePx0aD1Zcr6H7VapiQFKC8aS7u4JdA36KeHUikcQCw5gf8HLYY/pypFzGyqaOtBJsL1+zS4CEQwjyduumv+d+I9IXNEVAUq5tsmwEw+DDMDTowog++BKuWJ0USV9sJFByW0E2mTciE0HaqyHlIt5pUg4LG/yBAuA38UHxfMbdG4Hnm/oXmskw/y6eOcKH5IUn2VzWYUcASNkZ4hHVvckPGzObNEt7MxtKZeXR9oZeumwLAuAyoYznqYrFFTIEeejL0uKOIL8qiPjPsNSHUG9BOJL9FGTBCclgYgT7P6I2n2a0HSRQF6Y1wwfoddeh+wPaNZmjkkSjKpS+goxl+p3artFPAVlRHkQNeSQ82GwQgG7pWGnaN3BdkXRoWicmUtkm40QUNNJUPMqMS1Am9AZ89okb10yxVml2bulYGBDbRRREAMCfK5JMTlSJzKfMt8iYPAiPZzkUSA87rwDDqmhpFhio85pmFSPjN8WPj3ok31bcnFegfpBtdYAnAUd61/TGMrc5t/RmC5rm5EoxDt9h7I/o6SPku3E0IZdRQvp8Pbij8KHCZEOTCSpRZV8pxN2nwD8WcDnTVonIiD7J6HUG1IvdVNPYVjQ+RpM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5feda253-dec4-4280-43f8-08de755e8440
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 17:43:14.3289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/Z2td3OUCDW2wFEwSbN2sOqT2XoAy0k9k4d8dPCJw1AKnVSgpRlGf/F/+H2lHsk0dCkwdXCG1tYnYW7kcP56w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7936
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602260161
X-Authority-Analysis: v=2.4 cv=BKK+bVQG c=1 sm=1 tr=0 ts=69a0863b b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=1XWaLZrsAAAA:8
 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=p-90_2tMuphpnIqHMSUA:9
 a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:12261
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE2MSBTYWx0ZWRfXz1RoPGnnfDLr
 i/OMjf5eZ3Bt/46yyHMNhCNTSAYevsTgad2HxD9Gd8IQJO1+WLJ3KYAhgQdx36dsv/yC4IvlLyP
 OLxZqwTNjxIS2RF/P9dQa8iYOtGBPUqvSYvn5Sv56WooPloC3QdHjEEEci5qCfHciJXsrshEpMy
 RvaFNjJ2hlZAEjTV0KkWyfyrt/RQCdYhk3LA4SyAZstQBKvGGkFTOF47qb2GXpcwwyz/21k/yue
 HjWfg2qhNuvyUP72ZvtQbYsPEfXC8HTSdkIU5m6Z+gX+VElDrcjF8/fCwSYS6oglFl8gNF29eM3
 AGTjRcLQPoDvy6aoxLho8oLz5187ARPwrJZJmceGlXVQXb3nKL8uH/zjdtt9+c/OYtlRI0O9tC3
 enlZXL3x/NajPRFBWjxktVugVmYQxM6L083fZ3s4DIHl7vMvCMeG7ajopzwUe8jeTxUy25oZCIV
 TDOjuzl8tIr2YOtexlEyIIEIWyCw96lAVgNModkw=
X-Proofpoint-ORIG-GUID: MPMCU-7bT0OaDXbrHLS3pAVEb32mp5S9
X-Proofpoint-GUID: MPMCU-7bT0OaDXbrHLS3pAVEb32mp5S9
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17309-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Liam.Howlett@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORGED_RECIPIENTS(0.00)[m:surenb@google.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:ritesh.list@g
 mail.com,m:joshuahahnjy@gmail.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,oracle.onmicrosoft.com:dkim,oracle.com:email,oracle.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,vmg.target:url];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[Liam.Howlett@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.908];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 767261ACBA1
X-Rspamd-Action: no action

* Suren Baghdasaryan <surenb@google.com> [260226 02:06]:
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
> 4. mpol_rebind_mm() which is used by cpusset controller for migrations
> and operates on a remote mm. Incomplete operations here would result
> in an inconsistent cgroup state.
> 
> 5. vm_flags_{set|mod|clear} require refactoring that involves moving
> vma_start_write() out of these functions and replacing it with
> vma_assert_write_locked(), then callers of these functions should
> lock the vma themselves using vma_start_write_killable() whenever
> possible.
> 
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> # powerpc

Some nits below, but lgtm.

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c |  5 +-
>  mm/khugepaged.c                    |  5 +-
>  mm/madvise.c                       |  4 +-
>  mm/memory.c                        |  2 +
>  mm/mempolicy.c                     |  8 ++-
>  mm/mlock.c                         | 21 +++++--
>  mm/mprotect.c                      |  4 +-
>  mm/mremap.c                        |  4 +-
>  mm/vma.c                           | 93 +++++++++++++++++++++---------
>  mm/vma_exec.c                      |  6 +-
>  10 files changed, 109 insertions(+), 43 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 5fbb95d90e99..0a28b48a46b8 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -410,7 +410,10 @@ static int kvmppc_memslot_page_merge(struct kvm *kvm,
>  			ret = H_STATE;
>  			break;
>  		}
> -		vma_start_write(vma);
> +		if (vma_start_write_killable(vma)) {
> +			ret = H_STATE;
> +			break;
> +		}
>  		/* Copy vm_flags to avoid partial modifications in ksm_madvise */
>  		vm_flags = vma->vm_flags;
>  		ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 1dd3cfca610d..6c92e31ee5fb 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1141,7 +1141,10 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long a
>  	if (result != SCAN_SUCCEED)
>  		goto out_up_write;
>  	/* check if the pmd is still valid */
> -	vma_start_write(vma);
> +	if (vma_start_write_killable(vma)) {
> +		result = SCAN_FAIL;
> +		goto out_up_write;
> +	}
>  	result = check_pmd_still_valid(mm, address, pmd);
>  	if (result != SCAN_SUCCEED)
>  		goto out_up_write;
> diff --git a/mm/madvise.c b/mm/madvise.c
> index c0370d9b4e23..ccdaea6b3b15 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -173,7 +173,9 @@ static int madvise_update_vma(vm_flags_t new_flags,
>  	madv_behavior->vma = vma;
>  
>  	/* vm_flags is protected by the mmap_lock held in write mode. */
> -	vma_start_write(vma);
> +	if (vma_start_write_killable(vma))
> +		return -EINTR;
> +
>  	vm_flags_reset(vma, new_flags);
>  	if (set_new_anon_name)
>  		return replace_anon_vma_name(vma, anon_name);
> diff --git a/mm/memory.c b/mm/memory.c
> index 07778814b4a8..691062154cf5 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -379,6 +379,8 @@ void free_pgd_range(struct mmu_gather *tlb,
>   * page tables that should be removed.  This can differ from the vma mappings on
>   * some archs that may have mappings that need to be removed outside the vmas.
>   * Note that the prev->vm_end and next->vm_start are often used.
> + * We don't use vma_start_write_killable() because page tables should be freed
> + * even if the task is being killed.
>   *
>   * The vma_end differs from the pg_end when a dup_mmap() failed and the tree has
>   * unrelated data to the mm_struct being torn down.
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 0e5175f1c767..90939f5bde02 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -1784,7 +1784,8 @@ SYSCALL_DEFINE4(set_mempolicy_home_node, unsigned long, start, unsigned long, le
>  		return -EINVAL;
>  	if (end == start)
>  		return 0;
> -	mmap_write_lock(mm);
> +	if (mmap_write_lock_killable(mm))
> +		return -EINTR;
>  	prev = vma_prev(&vmi);
>  	for_each_vma_range(vmi, vma, end) {
>  		/*
> @@ -1801,13 +1802,16 @@ SYSCALL_DEFINE4(set_mempolicy_home_node, unsigned long, start, unsigned long, le
>  			err = -EOPNOTSUPP;
>  			break;
>  		}
> +		if (vma_start_write_killable(vma)) {
> +			err = -EINTR;
> +			break;
> +		}
>  		new = mpol_dup(old);
>  		if (IS_ERR(new)) {
>  			err = PTR_ERR(new);
>  			break;
>  		}
>  
> -		vma_start_write(vma);
>  		new->home_node = home_node;
>  		err = mbind_range(&vmi, vma, &prev, start, end, new);
>  		mpol_put(new);
> diff --git a/mm/mlock.c b/mm/mlock.c
> index 2f699c3497a5..c562c77c3ee0 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -420,7 +420,7 @@ static int mlock_pte_range(pmd_t *pmd, unsigned long addr,
>   * Called for mlock(), mlock2() and mlockall(), to set @vma VM_LOCKED;
>   * called for munlock() and munlockall(), to clear VM_LOCKED from @vma.
>   */
> -static void mlock_vma_pages_range(struct vm_area_struct *vma,
> +static int mlock_vma_pages_range(struct vm_area_struct *vma,
>  	unsigned long start, unsigned long end, vm_flags_t newflags)
>  {
>  	static const struct mm_walk_ops mlock_walk_ops = {
> @@ -441,7 +441,9 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
>  	 */
>  	if (newflags & VM_LOCKED)
>  		newflags |= VM_IO;
> -	vma_start_write(vma);
> +	if (vma_start_write_killable(vma))
> +		return -EINTR;
> +
>  	vm_flags_reset_once(vma, newflags);
>  
>  	lru_add_drain();
> @@ -452,6 +454,7 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
>  		newflags &= ~VM_IO;
>  		vm_flags_reset_once(vma, newflags);
>  	}
> +	return 0;
>  }
>  
>  /*
> @@ -501,10 +504,12 @@ static int mlock_fixup(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	 */
>  	if ((newflags & VM_LOCKED) && (oldflags & VM_LOCKED)) {
>  		/* No work to do, and mlocking twice would be wrong */
> -		vma_start_write(vma);
> +		ret = vma_start_write_killable(vma);
> +		if (ret)
> +			goto out;
>  		vm_flags_reset(vma, newflags);
>  	} else {
> -		mlock_vma_pages_range(vma, start, end, newflags);
> +		ret = mlock_vma_pages_range(vma, start, end, newflags);
>  	}
>  out:
>  	*prev = vma;
> @@ -733,9 +738,13 @@ static int apply_mlockall_flags(int flags)
>  
>  		error = mlock_fixup(&vmi, vma, &prev, vma->vm_start, vma->vm_end,
>  				    newflags);
> -		/* Ignore errors, but prev needs fixing up. */
> -		if (error)
> +		/* Ignore errors except EINTR, but prev needs fixing up. */
> +		if (error) {
> +			if (error == -EINTR)
> +				return error;
> +
>  			prev = vma;
> +		}
>  		cond_resched();
>  	}
>  out:
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index c0571445bef7..49dbb7156936 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -765,7 +765,9 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
>  	 * vm_flags and vm_page_prot are protected by the mmap_lock
>  	 * held in write mode.
>  	 */
> -	vma_start_write(vma);
> +	error = vma_start_write_killable(vma);
> +	if (error < 0)
> +		goto fail;
>  	vm_flags_reset_once(vma, newflags);
>  	if (vma_wants_manual_pte_write_upgrade(vma))
>  		mm_cp_flags |= MM_CP_TRY_CHANGE_WRITABLE;
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 2be876a70cc0..aef1e5f373c7 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -1286,7 +1286,9 @@ static unsigned long move_vma(struct vma_remap_struct *vrm)
>  		return -ENOMEM;
>  
>  	/* We don't want racing faults. */
> -	vma_start_write(vrm->vma);
> +	err = vma_start_write_killable(vrm->vma);
> +	if (err)
> +		return err;
>  
>  	/* Perform copy step. */
>  	err = copy_vma_and_data(vrm, &new_vma);
> diff --git a/mm/vma.c b/mm/vma.c
> index bb4d0326fecb..9f2664f1d078 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -530,6 +530,13 @@ __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	if (err)
>  		goto out_free_vmi;
>  
> +	err = vma_start_write_killable(vma);
> +	if (err)
> +		goto out_free_mpol;
> +	err = vma_start_write_killable(new);
> +	if (err)
> +		goto out_free_mpol;
> +
>  	err = anon_vma_clone(new, vma, VMA_OP_SPLIT);
>  	if (err)
>  		goto out_free_mpol;
> @@ -540,9 +547,6 @@ __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	if (new->vm_ops && new->vm_ops->open)
>  		new->vm_ops->open(new);
>  
> -	vma_start_write(vma);
> -	vma_start_write(new);
> -
>  	init_vma_prep(&vp, vma);
>  	vp.insert = new;
>  	vma_prepare(&vp);
> @@ -895,16 +899,22 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
>  	}
>  
>  	/* No matter what happens, we will be adjusting middle. */
> -	vma_start_write(middle);
> +	err = vma_start_write_killable(middle);
> +	if (err)
> +		goto abort;
>  
>  	if (merge_right) {
> -		vma_start_write(next);
> +		err = vma_start_write_killable(next);
> +		if (err)
> +			goto abort;
>  		vmg->target = next;
>  		sticky_flags |= (next->vm_flags & VM_STICKY);
>  	}
>  
>  	if (merge_left) {
> -		vma_start_write(prev);
> +		err = vma_start_write_killable(prev);
> +		if (err)
> +			goto abort;
>  		vmg->target = prev;
>  		sticky_flags |= (prev->vm_flags & VM_STICKY);
>  	}
> @@ -1155,10 +1165,12 @@ int vma_expand(struct vma_merge_struct *vmg)
>  	struct vm_area_struct *next = vmg->next;
>  	bool remove_next = false;
>  	vm_flags_t sticky_flags;
> -	int ret = 0;
> +	int ret;
>  
>  	mmap_assert_write_locked(vmg->mm);
> -	vma_start_write(target);
> +	ret = vma_start_write_killable(target);
> +	if (ret)
> +		return ret;
>  
>  	if (next && target != next && vmg->end == next->vm_end)
>  		remove_next = true;
> @@ -1187,6 +1199,9 @@ int vma_expand(struct vma_merge_struct *vmg)
>  	 * we don't need to account for vmg->give_up_on_mm here.
>  	 */
>  	if (remove_next) {
> +		ret = vma_start_write_killable(next);
> +		if (ret)
> +			return ret;
>  		ret = dup_anon_vma(target, next, &anon_dup);
>  		if (ret)
>  			return ret;
> @@ -1197,10 +1212,8 @@ int vma_expand(struct vma_merge_struct *vmg)
>  			return ret;
>  	}
>  
> -	if (remove_next) {
> -		vma_start_write(next);
> +	if (remove_next)
>  		vmg->__remove_next = true;
> -	}
>  	if (commit_merge(vmg))
>  		goto nomem;
>  
> @@ -1233,6 +1246,7 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	       unsigned long start, unsigned long end, pgoff_t pgoff)
>  {
>  	struct vma_prepare vp;
> +	int err;
>  
>  	WARN_ON((vma->vm_start != start) && (vma->vm_end != end));
>  
> @@ -1244,7 +1258,11 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	if (vma_iter_prealloc(vmi, NULL))
>  		return -ENOMEM;
>  
> -	vma_start_write(vma);
> +	err = vma_start_write_killable(vma);
> +	if (err) {
> +		vma_iter_free(vmi);
> +		return err;
> +	}

Could avoid allocating here by reordering the lock, but this is fine.

>  
>  	init_vma_prep(&vp, vma);
>  	vma_prepare(&vp);
> @@ -1434,7 +1452,9 @@ static int vms_gather_munmap_vmas(struct vma_munmap_struct *vms,
>  			if (error)
>  				goto end_split_failed;
>  		}
> -		vma_start_write(next);
> +		error = vma_start_write_killable(next);
> +		if (error)
> +			goto munmap_gather_failed;
>  		mas_set(mas_detach, vms->vma_count++);
>  		error = mas_store_gfp(mas_detach, next, GFP_KERNEL);
>  		if (error)
> @@ -1828,12 +1848,17 @@ static void vma_link_file(struct vm_area_struct *vma, bool hold_rmap_lock)
>  static int vma_link(struct mm_struct *mm, struct vm_area_struct *vma)
>  {
>  	VMA_ITERATOR(vmi, mm, 0);
> +	int err;
>  
>  	vma_iter_config(&vmi, vma->vm_start, vma->vm_end);
>  	if (vma_iter_prealloc(&vmi, vma))
>  		return -ENOMEM;
>  
> -	vma_start_write(vma);
> +	err = vma_start_write_killable(vma);
> +	if (err) {
> +		vma_iter_free(&vmi);
> +		return err;
> +	}

Ditto here, ordering would mean no freeing.

>  	vma_iter_store_new(&vmi, vma);
>  	vma_link_file(vma, /* hold_rmap_lock= */false);
>  	mm->map_count++;
> @@ -2215,9 +2240,8 @@ int mm_take_all_locks(struct mm_struct *mm)
>  	 * is reached.
>  	 */
>  	for_each_vma(vmi, vma) {
> -		if (signal_pending(current))
> +		if (signal_pending(current) || vma_start_write_killable(vma))
>  			goto out_unlock;
> -		vma_start_write(vma);
>  	}
>  
>  	vma_iter_init(&vmi, mm, 0);
> @@ -2522,6 +2546,11 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
>  	if (!vma)
>  		return -ENOMEM;
>  
> +	/* Lock the VMA since it is modified after insertion into VMA tree */
> +	error = vma_start_write_killable(vma);
> +	if (error)
> +		goto free_vma;
> +

There's no way this is going to fail, right?

>  	vma_iter_config(vmi, map->addr, map->end);
>  	vma_set_range(vma, map->addr, map->end, map->pgoff);
>  	vm_flags_init(vma, map->vm_flags);
> @@ -2552,8 +2581,6 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
>  	WARN_ON_ONCE(!arch_validate_flags(map->vm_flags));
>  #endif
>  
> -	/* Lock the VMA since it is modified after insertion into VMA tree */
> -	vma_start_write(vma);
>  	vma_iter_store_new(vmi, vma);
>  	map->mm->map_count++;
>  	vma_link_file(vma, map->hold_file_rmap_lock);
> @@ -2864,6 +2891,7 @@ int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  		 unsigned long addr, unsigned long len, vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
> +	int err = -ENOMEM;
>  
>  	/*
>  	 * Check against address space limits by the changed size
> @@ -2908,7 +2936,10 @@ int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	vma_set_range(vma, addr, addr + len, addr >> PAGE_SHIFT);
>  	vm_flags_init(vma, vm_flags);
>  	vma->vm_page_prot = vm_get_page_prot(vm_flags);
> -	vma_start_write(vma);
> +	if (vma_start_write_killable(vma)) {
> +		err = -EINTR;
> +		goto mas_store_fail;
> +	}

I'd rather have another label saying write lock failed.  Really, this
will never fail though (besides syzbot..)

>  	if (vma_iter_store_gfp(vmi, vma, GFP_KERNEL))
>  		goto mas_store_fail;
>  
> @@ -2928,7 +2959,7 @@ int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	vm_area_free(vma);
>  unacct_fail:
>  	vm_unacct_memory(len >> PAGE_SHIFT);
> -	return -ENOMEM;
> +	return err;
>  }
>  
>  /**
> @@ -3089,7 +3120,7 @@ int expand_upwards(struct vm_area_struct *vma, unsigned long address)
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
> @@ -3174,7 +3208,7 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
>  {
>  	struct mm_struct *mm = vma->vm_mm;
>  	struct vm_area_struct *prev;
> -	int error = 0;
> +	int error;
>  	VMA_ITERATOR(vmi, mm, vma->vm_start);
>  
>  	if (!(vma->vm_flags & VM_GROWSDOWN))
> @@ -3205,12 +3239,14 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
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
> @@ -3240,6 +3276,7 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
>  		}
>  	}
>  	anon_vma_unlock_write(vma->anon_vma);
> +free:
>  	vma_iter_free(&vmi);
>  	validate_mm(mm);
>  	return error;
> diff --git a/mm/vma_exec.c b/mm/vma_exec.c
> index 8134e1afca68..a4addc2a8480 100644
> --- a/mm/vma_exec.c
> +++ b/mm/vma_exec.c
> @@ -40,6 +40,7 @@ int relocate_vma_down(struct vm_area_struct *vma, unsigned long shift)
>  	struct vm_area_struct *next;
>  	struct mmu_gather tlb;
>  	PAGETABLE_MOVE(pmc, vma, vma, old_start, new_start, length);
> +	int err;
>  
>  	BUG_ON(new_start > new_end);
>  
> @@ -55,8 +56,9 @@ int relocate_vma_down(struct vm_area_struct *vma, unsigned long shift)
>  	 * cover the whole range: [new_start, old_end)
>  	 */
>  	vmg.target = vma;
> -	if (vma_expand(&vmg))
> -		return -ENOMEM;
> +	err = vma_expand(&vmg);
> +	if (err)
> +		return err;
>  
>  	/*
>  	 * move the page tables downwards, on failure we rely on
> -- 
> 2.53.0.414.gf7e9f6c205-goog
> 
> 

