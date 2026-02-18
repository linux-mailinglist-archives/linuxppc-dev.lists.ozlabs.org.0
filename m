Return-Path: <linuxppc-dev+bounces-16938-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKJ3Hw7tlWkXWgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16938-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 17:47:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EEE157DAB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 17:47:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGMqZ138tz307K;
	Thu, 19 Feb 2026 03:47:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771433226;
	cv=pass; b=Vbadm3XqDqexcwZ67k8LwC23KAkKpJg+wPtsZ4Zrs49qlfunkmbS+bPmJiPL/5SmF3/3hlN9SZ1Vn5R8eSMc0ZQXdyk2MWz8uL0tOndR1jcSn2CqBFoj0ZKoP84R+4RlcLo4FqhBp5Bf/TU3xH6kVqc+lhKocnsdMINTSPwOIEAqEpO2ePeFTRJ6Nz/eFXOR1GuHr80dEI/cJwEAdPaVOfIYT0W2UzOilMqN9fjSJWUs13TcEp6i4qIYoXOpf2HndFICdXPCZqCNe5tHSJT4BmbsXiwJqztlsLbIBLRG3QygVjZUkS3rQqBHJP+NCAtc56lONW7ITJrSYOiguuYt7A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771433226; c=relaxed/relaxed;
	bh=h48U4xrX1TRMBORqmQbUOzYJZMs7GrGOhM3+WIcqP+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a6pwB58In2euH++Rfyx47tz6CjhtX3R8ZypjCHYT+RkFhu4TcpV0Y9eitw2yeFKQnJdSV9uZqR7FsTyeKI+/3yhdkhjb9Iejwrv2wommpxZijDsJqi6Ypf3CCSajAwvdfxTPtyr9hnEmBcYX5utksf/upPDne5xG2st/1Q7qoa6gzoIeF9PpeDiV9hXfm4hVQcNBev6TTNFbzvlnTaGrnYlEd3yQkSIYat0TXSZBPziL+YwsNyXKUdzIF2ChNJyhNHX4Rvje9LO3JXZcg06N7pv73wAZcgh6tjl733Qc613fNMLwgG60B1Rp4vWtOctRH15tN4Nl7/yifkIB7dTqPQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=QqLeL2kk; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=IqZ2JLcm; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=QqLeL2kk;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=IqZ2JLcm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGMqX2vLMz2xLv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Feb 2026 03:47:02 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I5lNwQ066196;
	Wed, 18 Feb 2026 16:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=h48U4xrX1TRMBORqmQbUOzYJZMs7GrGOhM3+WIcqP+k=; b=
	QqLeL2kkQBIIaSWEoaFAv03uQk3cpZuAtyaM/s5FW5e262jzPGYC1IMPsIwVMJvV
	LyjlQQNaB/m0Lx3xDjhqct/exMb7UtS1B94mu7R8rpu53GXOVMs24KAIxdz9YEF0
	pb0luUJX3zgd7Aoz4hLw+g6W7xHoDzYqPyBeRL8oaIKsaOD2gXdPnaHgLUdiIcRX
	FEmy8rnw8tvhaBBoDRossfy76S0O3rcYNVw5EAidB3D1smTTO1qoiSN60atWgifZ
	Pao31G8AqOyAvy7Ol0KNcrhjyRJCVECL15PNsClsuZXnlUfJggSqeqaF5BFSmafX
	wLOggWvzsrdkwmqSO4Pu8Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj045ut0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Feb 2026 16:46:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61IFVLlL037241;
	Wed, 18 Feb 2026 16:46:17 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb28tym5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Feb 2026 16:46:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewR6FGpWKbJn3tpPz21YhHaqooTeNZi2rgLcvZ7sz15Hz8PfZSrD1//G9KeShVLva7Fyvr19XsTyaBhU6SyD+JaIw/FbwebF0En5lTsIlJZCinX+SCnDMxtX2ZLjniqYap+yrSJ4L9RxtqoQTyYnsqbQuz/kl6v/oMjvC21/UopINc9tDZchEiq2/tX8yMtDu3r8RY+QXjUawLGmJX33j5+F9YQ4Z6zSkQT8fkP/dtQdcMgzlDM/A8ssU+06aN7Lg86DM7pqFL60z/Qbq2RBXD9M1aqj0nqn7EDZij1AAURKomwwn2yce9naSz6/BxiBX0DjYBfot9tkppygmDQa8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h48U4xrX1TRMBORqmQbUOzYJZMs7GrGOhM3+WIcqP+k=;
 b=WX7UOcEKLeDHPeTbPVepMNcSs6DOCvX9ef2ml59JJcOezlQ9bqRtvLqrwbS5OP4DrZtqsnXebPMD+Oo5GmwMYrXZT9OjmnJF1mLeeor2RO0KtQvv5FPKix4cq4OU3BpjWVMR1+WlSzIzGuH+0KdR/VmRy6cuRTcmZaKVhW2F0TOr+ZVYRciGKGeyl22HlhBEjbKOb/Gwzsc0Tk4Vv4TKSN/nHQi5Hd4Js7MLzN14Uf24gzpM3qSezOgpqvihjtVJr5cW6VlHMmRe/Z0vEm1H4d8ZQhGy0YqBPc4WkwHldGe3loIheP3q3A/d0bPSLtWGjX5ixV1vW22fgDHqLzdJYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h48U4xrX1TRMBORqmQbUOzYJZMs7GrGOhM3+WIcqP+k=;
 b=IqZ2JLcm8pbHiRVuFyXcuuiTBK285UnbDYm/39i9fYS3WRdK5F9Oci6x+3i5qE6mQ3depnnFk4yhc66+fYA4AltmKv07kD2id19EB4lgt7KnXGaiEVo4R6IBszhpUia8AmN2E4zRG9zWkmzEgbbsS6qkPuyC7ymQeSP47IO7lDc=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by PH8PR10MB6504.namprd10.prod.outlook.com (2603:10b6:510:228::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 16:46:11 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce%4]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 16:46:11 +0000
Date: Wed, 18 Feb 2026 11:46:05 -0500
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
Message-ID: <lfnqadtmpkxjhsne3nto6bpourjv3nxw26y2a5kovump3beld7@c2pdvgxxj3ar>
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
 <dtdfrko7uqif6flc4mefnlar7wnmrbyswfu7bvb2ar24gkeejo@ypzhmyklbeh7>
 <CAJuCfpGViU4dDaLtPR8U0C+=FXO=1TuU-hT3fypNQO3LGOjbcA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJuCfpGViU4dDaLtPR8U0C+=FXO=1TuU-hT3fypNQO3LGOjbcA@mail.gmail.com>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT4PR01CA0195.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::17) To PH0PR10MB5777.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|PH8PR10MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: fa8d050e-f600-4797-2763-08de6f0d38ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MktiM0hWQWt1TXRlZjltZFpHbDlUTk9zWnVQcnNSMW9hN2RwWVdmZ1lUYUVk?=
 =?utf-8?B?TnV6UTN2djI1M3VaM0pFZDVGZDRiMkJKektPTVQ2dXBwdE1kMGN4MUVKS2Na?=
 =?utf-8?B?YXYrTkNYKzQybEJncGcvLzJaZldXY1dqSG1XdFppbE5pSlh5VXdLb1duNTZ0?=
 =?utf-8?B?eGYwS2JqZFZndE9ZOHdUME1JRU8zVzhpdDJBVjhRVkpCS1RuSlhHSzg1SnVE?=
 =?utf-8?B?ZUtrN0Vxd2FKVHZJYXZiRC8wdkRTYUdyM2EyUStvRENDMFd1VVl2VzNLUEtY?=
 =?utf-8?B?YmI4UWVNK2FmRG9PQ2FpMWhsRnlVQ2pBcUxHdXkyMTZQRUxSRERHa2kvaVUz?=
 =?utf-8?B?Ujl4V2ZoM3RSSHo0UXBYNzZvK0tScnE1WXF5ekltajVXWFc0T0FOSDBicy9m?=
 =?utf-8?B?Y1pUMHUwb2VxYmxGUEU4eFUveW1uTzFhMzhPelFzWUVUbWdaSFRYZkl3a0lv?=
 =?utf-8?B?V0cvSDVHaUZHa05pb3dRTHkzWlZDOEZkdXVkOFlvSzFCVWF0L1Y1ek1kMThl?=
 =?utf-8?B?aGo0dytFTCsySGdUbU9HRE1JK1RMZnRoK2VWc0l0NHdrOWZGYitHcFFJUmdi?=
 =?utf-8?B?eVpSWXhWWVBGOHVub3AzSGVQVmFhT3dEdE1vOWhDc1QrQjVDcDRwV0RYVVR0?=
 =?utf-8?B?cVJheUd4WUlOeEUzWkVPV2k1Nm9qWVdNejRKeFVwV296dk5DMjFnTktwQUY3?=
 =?utf-8?B?RTE4VElMMUpTUkNNL0RFLzZFUkQycFRWb0NvYThiMEhVQitNSmtRc1QyQWcw?=
 =?utf-8?B?SUFBZEswelRDeXV1VWMzRFluOUl6bjdHYklmOHZKL1dYK1VLa1MrQ2h0c0t5?=
 =?utf-8?B?Vzg1MGU2QTJKaHNCUmIxRVQvaENMemgxVFdSci9oOVdVU2prQUJTTk42Ylcx?=
 =?utf-8?B?UGFNdFBDaHlyTVY4LzZTVmtxTENuSG1WUkxzRXVaQnNNRUpFRXM2Q2E2M1Nr?=
 =?utf-8?B?cFFoMlcvTlFZRGdLQWpvcGd3UkFNOE9OMnMwOFkrWG9FTTdjdGhrNzMwM0VI?=
 =?utf-8?B?TkQ3VFQzSFpSQTg4ZXoreXF0M1RMRkpzTitQZVN1UkVENGIrL01XS1E2NnRB?=
 =?utf-8?B?OHBEUVZIQTNVTmc0SUw2TTYwQ0dzdk52OXJhcHlEeEFNcXVOVk1GS2ExQjUy?=
 =?utf-8?B?dlE0VXFvU3NxdWF6VWtLZWV5WHZTSThKMFBoVTIzVDM1WndWTnJtQThkODM4?=
 =?utf-8?B?V3RpMXVheUNQcTRxaXIzT09CdTI0SWN0U1BYZUlCWXJmNUlIUmVSb0trbVBm?=
 =?utf-8?B?R0tvSlE5TnBWM3dHVTREcnNLV0VkV0Vtb0lIaE5tMzE5OGlqa1VvTGt0THBI?=
 =?utf-8?B?bnRaL1ZJdVYvYnJTbHZPNGdlQ1Yyd3c0QTZRRzZxVXJoRHNienF4SzRCTUNJ?=
 =?utf-8?B?aEE1anlsdmpRakdqTm9iYjJTcDRKUkRHOU9TZHhZVytmak1acDYwYlpvNkM1?=
 =?utf-8?B?QWtRUnVnQkgvNm8zV25LUGwrdmFlT09Kbk9RQlZXQXBJU0JQc0c1bnRibndY?=
 =?utf-8?B?SjlFMlpqWGFmNlF3WXU3MGJBN2ZhZlA2L3NmODhBSTd1eDh4cGlxUWFqbVJJ?=
 =?utf-8?B?anlMSE5MUDRJNGZkVzVKSDA1NEc3WE1USGgxOHpDbDFGMko5d2xiZHJDRUJo?=
 =?utf-8?B?aCt5NlZtK1lFdi94djNBV2pIb2ptVkFVSURReWY1YVlRNit5d1lxVXFLdnVE?=
 =?utf-8?B?SnJBTG41dExqUVFvYUUzU2xybTYxZ1VGRnhGZUZKdzcwRmpDZGxRN3h1RmZW?=
 =?utf-8?B?ZzBsZlZ0OElKTUlmOWR1Y3cvMVQrcGRlVTlpU1lqUzlYazhYNFZ3K2RrWVhO?=
 =?utf-8?B?bmp3cWMxcmFzelRzMS8zZXlRUytJL1l3SGFLK3l2emg5TGR5dytDMU5yQWZL?=
 =?utf-8?B?ZXljNWpzN0F2dnNpNTd1Q2Z0UHhCWUhUbW9PRnovRXVSYjZzYUdaeWlGNHhF?=
 =?utf-8?B?YVpOb1VWOWF1SXgxRGk3eUh4NXdLM0lZY3hwKzRqdEY0citQZmZpRHBCak8y?=
 =?utf-8?B?bWpsN3RPVjBodm9WcVpuL0pBSi9UbUxnWmMzMTVNUlkvam5ZanJXMGZxUVlQ?=
 =?utf-8?B?TnBNVm1TaUtGODMwNEhyK1JZamhGeXNBMTBOM0lHNEV0TVMzeVFhUlJUSTZu?=
 =?utf-8?Q?S3wU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEF0Qkd5MVl4ZnJvSml3R1F4OVc3dlNPM1RSdXQxcW9rcEcvdy9Ga1VOSkNr?=
 =?utf-8?B?bFFrWS96aU5FZXp1cUNIR0VqVkNuaHpHQ2M0RkxVczFINkxWbytnNys0V0lx?=
 =?utf-8?B?YzBub2JoTk1LK3RnOG9iU205TisrRmVBV21ibHhBTDZvOWtLcWh4b0QvckRz?=
 =?utf-8?B?RHJDaS9veWNvVUVYaWM5aVRPL3lWRnJJRkl4c0FlNCs4Yk1jb3ErOGdhQ01B?=
 =?utf-8?B?eFJaaDVFcEk4dENySVdjUk5Db3dtQ3E4MG1rcFFSem5odnlMZm5TUjRkbXAv?=
 =?utf-8?B?UzllQ0QvS3RVa1VxMWduWDk5R2xKSUVETytlSTVYdFhPYXZ0VVZEb0hQdEQr?=
 =?utf-8?B?REUxeTY3b3ZxWHo0WUpadVBRdlRUaTV0SVpza0hjc25uVmZWZ2R4OTdoUUFJ?=
 =?utf-8?B?OTRIeEQwVktQQnNicmpDT2k4aEZvZnpZZjdlcHBqcGFONlpDc0NFNGxQS21L?=
 =?utf-8?B?ODR6cWZyeDBLdFBSTEZoOWZhdzVRUnRPNEV0dTFFeHBFUjIrVGN6RzlTMVlo?=
 =?utf-8?B?TFFXUmxSQU13a3JqcCtmSGJkaFJlcWh3aHNIRTNMakk4ZXFCZHhNQkhiQ0w0?=
 =?utf-8?B?SUVOOUJNTGRmMG5KM3ZBUGlHbUNobzE1V0t5TGV1cTQ3c3BqWXBGeXNoLzBZ?=
 =?utf-8?B?eUxJR01hdlpjS3ZIdTQyVjlYbUF4VytPczU5bldBSEZ5RnNuUWFjemNVd1M2?=
 =?utf-8?B?bmJxK3hlRTdHVWVmdGU4aUp1allMMUpYbkFlL000WE9GQitKbTNnQlZ2bllB?=
 =?utf-8?B?MCtQZ3FOaGo0dnVieGVPc05RYWtTZC9OdXYyUDY0T1VpNFg0UWlpWURhSXZj?=
 =?utf-8?B?cEJjVWdyc3Z5VmFWdWVaTmhORUs1T3NCaHcwWXpUQmoxbUtSOFI3L3M5UUhZ?=
 =?utf-8?B?RHl2NmpwcEJjRW11Wlp6d1hueDZ5bzVYN3NFYy8zcTQwSmJtNm1IK3ZNRjJo?=
 =?utf-8?B?R0tCekVFVDRjSHgyUk5iTFFveUpYamNuenBybzN3S09Ua1A0RkxYSFB5NXlz?=
 =?utf-8?B?NWY3UlBtb3hSa29RZ1pRSG5DcUNQWWxPcng1VlVzaFJ1ZVVNTkswSEJYU3NV?=
 =?utf-8?B?NnZMZnNQemswYkw0ZjA2a3E0YVBJQmRJeHp2SEYvYkZvSUdvWm9CMXo3b3NS?=
 =?utf-8?B?Um84dGNCcmxQblJxQm5rSXljeEc4a3lGR0o0QmdKUTBDMHBmcVh5eHRvb1h1?=
 =?utf-8?B?R0ZVOGhGdjFUTjArUHpKUTE2c3JhQXI3MjgyV2FNbEttMGNEdVdLc1pndnNZ?=
 =?utf-8?B?aWtqYjFwVWg3WHlHZk5PbWc3Y3BDbFlHS3JTY29FWExlTFo2UEI3SWl0V1Bh?=
 =?utf-8?B?WkhsTS8yaTl5bDBBMTZJTUE0a2ViR1NIVW1JR2FnZjBzanQ3UitYeCtkOW9a?=
 =?utf-8?B?Tk9VNVUyRmJhcG9KN2l4WW1YTitWVG8rMEtoc0p6dTgrRWQ3SXJSdWRiL1pl?=
 =?utf-8?B?SDV0MXlCQmV5NXllS1VjbDR6Mm5YTkgxQ25xTlBpbUNPZi9BVHo2bUJhMGxB?=
 =?utf-8?B?bTBhOFhGaG90SFpTTVBzbEl5aTBVYWpOc2VVMVlnbERZY016MGxDLzVDSlNw?=
 =?utf-8?B?VThxcFdxK3lVbGJNdnVmL1N5VlhZbHZCOVJTcHUxNXgrOHZUb3cyRFdsMnpQ?=
 =?utf-8?B?R1M5ZldXOE45eGxsQ3ZMdzNTREdLTmx6VlE4TnZuaTR0bzQrR2l1MGZKZUJT?=
 =?utf-8?B?ZTRTQ01VU3Y3T2toYkxEMk5CR1dxM0ZFdUpHK09hUTFmWllSUDJSVDdOZ3Iv?=
 =?utf-8?B?N3dBSWhmL1hSTmIwbXUyUlJ2RzV3cERLTmxXN3NPN0hEdkFhTmY3MmVYYlc0?=
 =?utf-8?B?T2pUbDA0K3ZYdEIxNzBvNnkxTW5rQlplM09SVVo3UUYycTc1Tk5xNEliWWR6?=
 =?utf-8?B?SFlaNXlkc0R1YmFwUHh5QXNvY2MxMHROc3NtSzJiMVNRdVZhZXJMZGIwTnRC?=
 =?utf-8?B?RklINjFyamUvZVZOc05rNzZmcHkrbUsyZnRnL1RFc291RkxUK3lIMFBvaU5D?=
 =?utf-8?B?ZFNyUFFDOFoxU2VjWjIzSXFjWk1NWHZ4YkVCTHNSSFNVT2tzUDNzMWZSTkZ4?=
 =?utf-8?B?ZVc3Vk9VQ2dNYmVwQU9DT3dTUmZReGhNWGkzT0xtTW5CR2xOcUR6emZjS1A0?=
 =?utf-8?B?OFhsZjAyazR4S09ERHVLWThCWjdpYU9vL1phYmRPYWhkd3ZjS3RiRkRsd0FB?=
 =?utf-8?B?b0VxZDFRb2ROQ0pLNWo0RGRmb0g2NzAwVWc3dFlrVGZGQVJ5WldFRi9CMWxn?=
 =?utf-8?B?RjNUK0RmZERyOXZoRFU3cUdyVGMzZm9qNkRzcmNOdHlxTDFyNTBIeHhFUWJL?=
 =?utf-8?B?dmpSU0hQcTd3bEp0UGtKd0Flb1Z1RUpDT2hhSWFUR0t3cWpPZVI4Zz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0rOTn8S7vxIugMnuJ+BDaQtIIOa7H44XXzyhpkdhhc50gnv6JWOVTDf2NpedIOznsJjRvTm8Ay/ZFY5ZfmNHYvcnM2nu9/m+zrmw1OiQpKblWzQRrQXKLa/eiEJGWzaWP4ZE06AWiIGOz7fRdOoheqvAhxdFtGyCA2Xvm6E/5cZ2tVLrOdAFFQKbbtD0Ee/V337dOwbtnQKzXkwdfMA59o+0CbQRypSOTk+wv/MoyhvJOjx4L4afAPLa3/NfUj/h2VmTxCCfX3dg214QM4nol1eEaK7W+bLFyJv3hiuXYYkget9hR2rfWjo0DcZUGCXAaEroU0RHJK1SrnGTlX7A4v8jySNeY0bAZThITrbzFnBkDMX3yC0VSTG26GMUyO99MTwIEpIEglHK5o16MqsWaXEj4ef4d2sUwvVdVum+nkFa7tiPgGCPSVHcXhedQRpRwZACATh3TXsfy4hPCJe+MjYvtVOeXGooS7KOQurpBAv8MBob2KMoAg2k3pId8AJcZkarWAgASzT9bhpcRoE0s0+M+FuT2JZ8pUqayaxK+vOjXV+JtQLYzETOuvtD5ZdS58DzuK1NwfY3nw1js95kQikgKhdW8/Q5sRvkSHVqgaI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8d050e-f600-4797-2763-08de6f0d38ef
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 16:46:11.5073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjOf2xZ4hzB5AmfwY0ymEja1twlalF7UnXJDCH0H0uzR1451eK+bu0NQoYxEf/fW77L5MGfIhZajtCDLbDgXAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6504
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602180142
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE0MiBTYWx0ZWRfXyqIQuk8TCLcv
 cJi8kUlsCzCB28Juf7cSJomrXSk1dO7vtsSWb8O/U3sfaoSaMWtkMy1IDQj5SBfq9lcyV5PetCD
 ui5qoMvB764cMnAWaHyq5S0Im7vieU3fxeheeiGFOr9uCi23yWDl7KBD9vxNsWjaL0o0XGT0am+
 B6Da0zYccPBU0ymXNDkntEetlLnqE+TYBz2L9BQlwfBGQjO1svwST8siqIStM3TibZb+SfyEN83
 wGFt/mDc6lBUvePpr9OpOC3nEy/w2ZmyMhL5PUTOd1IET4G8ENRab9RcMCIgkPUOiRb+kUVgd52
 ezwzG/8LCFYw2xDiZ8i2e0AC3zQangK1Dyb+vsQ2tYdhsxJvSXxbgQnob4xZC0Ra3w4Vjnqwruq
 BqpReSehWVXpEZVvIoAW33cOVWTTE5h4daKiQ57LhRdRKHC81sccL8Ri4o64kNQuryjUi/33Rlc
 vls6pTBf4pbqylFSvqghojtRVr6ZEyqdoKVRk4aQ=
X-Authority-Analysis: v=2.4 cv=O+w0fR9W c=1 sm=1 tr=0 ts=6995ecdb b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=xNf9USuDAAAA:8
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=yPCof4ZbAAAA:8 a=JfrnYn6hAAAA:8
 a=pGLkceISAAAA:8 a=4Bu5jzkULwNEUaHAssgA:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:12253
X-Proofpoint-GUID: A_4W2DkBXmUWseRglRrJOL4kHRWDAFZE
X-Proofpoint-ORIG-GUID: A_4W2DkBXmUWseRglRrJOL4kHRWDAFZE
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Liam.Howlett@oracle.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16938-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORGED_RECIPIENTS(0.00)[m:surenb@google.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:ritesh.list@g
 mail.com,m:joshuahahnjy@gmail.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,oracle.com:email,oracle.com:dkim,oracle.onmicrosoft.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
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
X-Rspamd-Queue-Id: A7EEE157DAB
X-Rspamd-Action: no action

* Suren Baghdasaryan <surenb@google.com> [260217 16:03]:
> On Tue, Feb 17, 2026 at 11:19=E2=80=AFAM Liam R. Howlett
> <Liam.Howlett@oracle.com> wrote:
> >
> > * Suren Baghdasaryan <surenb@google.com> [260217 11:33]:
> > > Now that we have vma_start_write_killable() we can replace most of th=
e
> > > vma_start_write() calls with it, improving reaction time to the kill
> > > signal.
> > >
> > > There are several places which are left untouched by this patch:
> > >
> > > 1. free_pgtables() because function should free page tables even if a
> > > fatal signal is pending.
> > >
> > > 2. process_vma_walk_lock(), which requires changes in its callers and
> > > will be handled in the next patch.
> > >
> > > 3. userfaultd code, where some paths calling vma_start_write() can
> > > handle EINTR and some can't without a deeper code refactoring.
> > >
> > > 4. vm_flags_{set|mod|clear} require refactoring that involves moving
> > > vma_start_write() out of these functions and replacing it with
> > > vma_assert_write_locked(), then callers of these functions should
> > > lock the vma themselves using vma_start_write_killable() whenever
> > > possible.
> > >
> > > Suggested-by: Matthew Wilcox <willy@infradead.org>
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> # powerpc
> > > ---
> > >  arch/powerpc/kvm/book3s_hv_uvmem.c |  5 +-
> > >  include/linux/mempolicy.h          |  5 +-
> > >  mm/khugepaged.c                    |  5 +-
> > >  mm/madvise.c                       |  4 +-
> > >  mm/memory.c                        |  2 +
> > >  mm/mempolicy.c                     | 23 ++++++--
> > >  mm/mlock.c                         | 20 +++++--
> > >  mm/mprotect.c                      |  4 +-
> > >  mm/mremap.c                        |  4 +-
> > >  mm/vma.c                           | 93 +++++++++++++++++++++-------=
--
> > >  mm/vma_exec.c                      |  6 +-
> > >  11 files changed, 123 insertions(+), 48 deletions(-)
> > >

...

> >
> >
> > ...
> >
> > > @@ -3089,7 +3120,7 @@ int expand_upwards(struct vm_area_struct *vma, =
unsigned long address)
> >
> > Good luck testing this one.
>=20
> Yeah... Any suggestions for tests I should use?

I think you have to either isolate it or boot parisc.

To boot parisc, you can use the debian hppa image [1].  The file is a
zip file which can be decompressed to a qcow2, initrd, and kernel.  You
can boot with qemu-system-hppa (debian has this in qemu-system-misc
package), there is a readme that has a boot line as well.

Building can be done using the cross-compiler tools for hppa [2] and the
make command with CROSS_COMPILE=3D<path>/bin/hppa64-linux-

Cheers,
Liam

[1]. https://people.debian.org/~gio/dqib/
[2]. https://cdn.kernel.org/pub/tools/crosstool/files/bin/x86_64/15.2.0/


