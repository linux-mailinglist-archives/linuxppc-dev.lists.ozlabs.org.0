Return-Path: <linuxppc-dev+bounces-6655-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9745A4D1DB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 04:02:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6L7b584Lz2yVv;
	Tue,  4 Mar 2025 14:02:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741057323;
	cv=pass; b=Z6Vo6AQpIGPLRwysyfEqLnlmggrEOMAwbqZLu4GljlzotjPR2iDkTIIwXf3H43ppRnuQskxKaEo5t8VihYqE0Pm87nc9Mo6HvQU7bM4vSZA/+aF0Qk6AyirO0NnUKKB5PpRiVsghC86nLuAch0rLXgj1AEyHHhZ/ww4q17NwODh8qY+mvX3JSQyDcvDji5PUR1VAwPw/siLAxoNGtKljAuGeND3v0CtW5pZ8jRKdzClYqq+IQJpXtPziEy/Z/YMMwOsvnFaeghMfS6IO2YG2JB/lz8Uylvvq+Elwb2oP7YiZQcfc59XkL5sGpuY1r6PMB/OoknhlF2HAd+MBiOJayQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741057323; c=relaxed/relaxed;
	bh=mM6aMgoYSpCqvLIcaLWIsy2FVAt+h5LvWg28kLNv/Fw=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=dX2iNU3aSk/MaKk53uuqgXL6j+6oq4/Y6yc10qiiUQPgv6GYk9Q9gNxFG1zj8gEfRdRFGWqO3WbvJACfmE4O7TJNIT23a/0XjK6Gxoi042K8tYVmr2flgEOt+P1bPoUZ8y3WiN4VF3eQiypVt3c3muE2RgFp37LxB+H3O4dE8Le8vYv7mradjnQRDGuVRn+X3x+JemOEXioobHctaP9F93jZKcTUg+ONnHxTC+dV5rOlX5vA+sCZVMkH8KBXGX/WdQ7Q5Hf9+LVscEDO6RZXXzR/yDZgQ8bAs4z80KRuNASdyWGrbm7SvKiKZU5r9ETAQReCtyhNb4Kgl8qYugkLEg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=Kt2ug4Iz; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ivlYjIR0; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=Kt2ug4Iz;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ivlYjIR0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6L7Y6FFyz2xsW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 14:02:00 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5241McQh008866;
	Tue, 4 Mar 2025 03:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=mM6aMgoYSpCqvLIcaL
	WIsy2FVAt+h5LvWg28kLNv/Fw=; b=Kt2ug4IzjF/Xwu1WXb7By7CAIdlduN8jvN
	/bvLjZRZykwlP0941zu4gmg+oeWiqICjGj+scVD9T3iCCGgvpjJ8rn/3ueS29mme
	lpsjUtLKDS1KPsTerC191VBR4+76cUSXHTn7kQaCt69OvQ6eF2eMLA/NzR/oZL48
	j9zQ79aVZCTI1Fm6TwMH4XY+7wiua/qQzK+i36j/H879I15o9ZtQVkPv7FF6p18U
	P7WMKsPtIniArhl3RuZnNxQOYxf00m725WGIlSteYOC5ysPKBYpJ90SXVXU8SWu6
	Xb7ljowZa4zxVbrMMxgbS3qrtcRlk63y/PwmlDqn3iw+FSHUiKxQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453u8hc3da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Mar 2025 03:01:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5240Qhsd001161;
	Tue, 4 Mar 2025 03:01:56 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 453rp92cgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Mar 2025 03:01:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VphG+/TR4kXhFuP1Uoybq22VdT6y7CayXu/v0VpLPXme6Fl0tNHHkjxCJ+MrZQLtOG/y7Cy4Zf4GhW9sRTueFsgmdj5OYEnVEZuDYgC6NEUYQDGPSYhenDbe2i81x4usVObzZP8sQcBsZwH7AL1aBPypUlca0WxQ3N4IGG/CEAV6QuKBLOZy4s+USTYgCXwgAciE7vQKwX7gdmYtimpG3oDUa3ZRGV5GBzy1VBPhHoFxYM76FuexOiDUZh46OHqDiyVGmO2Nb2GJEtHcOIMxiKruGb7DrNMx3yr2HKVgzptnnnLGS2gSZqL0w6H4mNgAckhMad1S+yxsO/FnQ7JsbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mM6aMgoYSpCqvLIcaLWIsy2FVAt+h5LvWg28kLNv/Fw=;
 b=bUU/7xCrzimrkIGzE+c1hIE78ghEaco1UfK0Rga+L16oBAeKA7unmw4sRfcUa2Y7YI6vUs1HHFUZ311OVNa7nYJegaDuQQspOwb1E1IP2pig+Ih0hiHBnl7C4aLTtX9ZuOLQLsi35VTF7HTtx7aKbGfchFhEWdT8bK9exaQN980SCgNZzcCthD+wOXWwMzSae/483SgQIZcNJ0KRzQUPL0bAF3cOzaQwmKKLrwl8uEOsO2JeXknylz9D/tzkeG1BiiW+PYGmLPxahIq3GY4UQUdAyYSMDv3Xh2QxjeP7XCe6Tj5rvUK7aZaVzgONLKdMloYodGSQ783nRRsdWHerKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mM6aMgoYSpCqvLIcaLWIsy2FVAt+h5LvWg28kLNv/Fw=;
 b=ivlYjIR0Q09SYTf4D9mtdgqMHaBVdVJxsgwavU06kUAJnyzBOau32o3/r9ZN7G4RaKg5UUI4fl6LVW9UyOJIYyHv/9ufT2LYKoPHVHm7UCMM9QoI1Igpf9c9nJ90UNeWbni5Rrjx0xeHVPAXGiTQaTIORHzoxAsdNYCBnQSUeGA=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by DS0PR10MB6845.namprd10.prod.outlook.com (2603:10b6:8:13e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 03:01:54 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%4]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 03:01:53 +0000
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
        linux-kernel@vger.kernel.org, fbarrat@linux.ibm.com,
        ukrishn@linux.ibm.com, clombard@linux.ibm.com, vaibhav@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] cxl: Remove driver
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <9190bfed-8ecd-4941-9297-a8b29c9c47f4@linux.ibm.com> (Madhavan
	Srinivasan's message of "Mon, 3 Mar 2025 10:37:32 +0530")
Organization: Oracle Corporation
Message-ID: <yq1frjttt41.fsf@ca-mkp.ca.oracle.com>
References: <20250219070007.177725-1-ajd@linux.ibm.com>
	<20250219070007.177725-2-ajd@linux.ibm.com>
	<9190bfed-8ecd-4941-9297-a8b29c9c47f4@linux.ibm.com>
Date: Mon, 03 Mar 2025 22:01:50 -0500
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:180::47) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
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
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|DS0PR10MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: 5032936d-9d85-46fa-56c7-08dd5ac8eadb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0MPpnDLoWK5iGZ/DTM4CuVpmEIDXCa9VBTrSaTlAQD/cIYCpLJRsWBhLRVBl?=
 =?us-ascii?Q?sYqFE9lqHBJR7kv80//i7yOYJZ0DNWE+vsbqFJpls60R/QLwFsrzFYYEHfZs?=
 =?us-ascii?Q?DCyZIm5F+tEmVl3amtCUhOYxQgFEUc7GGNHNrPvFNs5MNKWy4D1S+/lhrcqx?=
 =?us-ascii?Q?DgOCQxsZmvf7Lq3xiitjzloq2wkfZWGhqY1JKpGXjIq7QFDeY6bHci4D9ycB?=
 =?us-ascii?Q?tCDetHzhO9TPtVzNbImw7ou5b/AFxL3ll04G69edeSzJLehsXmk2Hp3nKfyx?=
 =?us-ascii?Q?XZ9BHKd1c1L1oWOJYmGp+RebSahbDIpQI/TuOdmmSNFbWrZDLDaT72+abAl1?=
 =?us-ascii?Q?jfOzzwqXOc+6V5j9cdtp26UaR+ngVgFJgRUBtOBnea+YDL4Kh7d8WlGI03lA?=
 =?us-ascii?Q?YAJMwzay+S6AJf94+mtcq4oALPOhMbl0u8l/NZCTq95r6sqkuvryjBX6LtEn?=
 =?us-ascii?Q?D9NwzPrnZU4IIWbrw3Qql009iWcxpMNXK5tQs6TFNE5wx+agKXNcoeChwVmf?=
 =?us-ascii?Q?vD+Rm7StLRjh/si07+dn4q+g8TMW1O6dFFfnnv1fQBW9tMMlbraexV/MygWP?=
 =?us-ascii?Q?L4wed6K1NR9DinPsBmYXvbACdHdRUaSMa8945eFVJ19l6nr++sKTcejAa/Bd?=
 =?us-ascii?Q?ujwf+I/G/5vwC3HF4uo+r5wKByyxq71joUteQkn+uPoQFqqHfTYW720uOnd0?=
 =?us-ascii?Q?PCnz2o17Iqt0+WCbT33pth+yl8o3mh1dJ3+GCMembL4MfS16oCN6t4ajWkwi?=
 =?us-ascii?Q?GWIpCHQFSC6x1Co5j/HRk9NCw3zwrjJr/nvQMsX/2jSlsUvoIvl0bfQnaU7u?=
 =?us-ascii?Q?AgMbK2JsJ04fdaAUvXstbfJCUhb5JKLw6ZBABF8hwLW6jrbBJPQodZWtaRu7?=
 =?us-ascii?Q?pRNVY62EhGUoKovPV4A2ND3zykrO2y+DHMagx6jKOlAtg4mThVaF3RxshwuW?=
 =?us-ascii?Q?mBkwPSLjDo9K6zMSlmkYG6Wz0Gb4p11OH020wqZRIdVQ2cmco3btpEhvRjME?=
 =?us-ascii?Q?zlen+BBJfhBjvxGe3B3ZOAwkZ61T4H6VE5yvq58pfsFp9JB9JXV114F4P0VW?=
 =?us-ascii?Q?zLVe4AaFXzC1mhZ+vnMZNGehd+vGDZadRdzYMrgZLp19BBIs9LgH3yYy85SC?=
 =?us-ascii?Q?aETCi65JYh309dsIn2aevGnC5MjObfaMFQ/o4OJVxnNsDwsNYbconhGnaz4D?=
 =?us-ascii?Q?aUBZaz8X9yQwgienmZzkR6YSZZySlpoAEofJgk8TpZbkR851LGcdJccHzWk0?=
 =?us-ascii?Q?BQEXRl2dCJJybe8aLsdmpAigCIJ73YhFGJyXrSgsGHl+dwqvN9NW9lG/66Sf?=
 =?us-ascii?Q?4Zyc9RN/RqafphVkAqwnnb5mKS1yj5j/jU4YkA2VR4S8aA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BPOp8foBw94DqGh2bZUd/oYIzksoqRD1WtS4cRtQUhkxdADR9MRR83nEWIXc?=
 =?us-ascii?Q?TtnJ/DjXgIDAPvGUDoGwQoaLo9Hx8Cd0KOyHgi55jvGg7YkvBwzdOui50Yo4?=
 =?us-ascii?Q?BTPmX/+KazHrl8QpGCx7RW+Ygkb+QqXObR8Sk1ver+qcx33SKKL5GKnuJBE3?=
 =?us-ascii?Q?BnsfE4EsPTZrYPG5Ghjx7so4vmKOlwQPN2Lc65XBPnqWmgfYo0r5OFOhyjcu?=
 =?us-ascii?Q?ieU32W80aUml6gdRj3sDYdOfgCwFcXNGmfx15L5seLvMBt4H637DB2YfJmpG?=
 =?us-ascii?Q?764Ob22+5aDP4GWM6tOWs5k6m0AdWaWowKCcf0cj+trbUg/sA5Ckq+XQnc+F?=
 =?us-ascii?Q?khtwgRiENX9OFFFO/rG8wYCEoagRa49lGxdj73wR1MBLawaU1yOu6WtzyyxW?=
 =?us-ascii?Q?Xwma7D1rtW4E5h4YS4sXARXX4ItRRD4lVMJWA8IEiZRPvC5iNxBb0ibysI2m?=
 =?us-ascii?Q?H80+xfRHZix4gkPnu4IypDz0ZtsvsIdlWE/dJ6DMLjBdrTyaJjYoTw0vrPsb?=
 =?us-ascii?Q?+vJK7nZANoguFi1Vg0heVBSaJxjos8duow0Z6Djutypzvwe/MRtu8eJUhuEP?=
 =?us-ascii?Q?3lFDr4NGl1aP8VpCen25xSe+NNZPK48OPID69AJ1fCpD28O58cW0Ha63o7sS?=
 =?us-ascii?Q?UggmN+1vT89WCHV0UsdQaDHue0ynBcm4UHuyzZ6dFgmwUgOm9XOn+DXW9odp?=
 =?us-ascii?Q?1N16/OyjbQhidOBnk3RLCTcYy8B68kUb+zEzcAK4sPRD1N0pHmRJyxG5E/6q?=
 =?us-ascii?Q?G2ERShrUe+Ag0pm074qqQlf7biRJ0y7GRt34Rhzm2y2qi3hziRNJJL7UFqZU?=
 =?us-ascii?Q?21cxqtqN/rZzKiJV2ah+5yDmdvO/WyHWTTJVokyBr9f+wyy9b2CRnjPHBZE8?=
 =?us-ascii?Q?bHdObknEkOpJUUAguhZBxB2lXP31b1nDF8WEaN5GKqRCDZhth1MiUePQidJq?=
 =?us-ascii?Q?vXjXPH4cYVZ9Q+ZHGvAi3EppCzdATGLRx4UpHCzkVhh5kG0RuhhtgHHTjfXI?=
 =?us-ascii?Q?p+GTYZjh6x2YGxoJGIYWdcEUO6dHllrcJC0ngBq8kuiIdlQCrl4Nvd+oOw+h?=
 =?us-ascii?Q?oebvYFWCpnT5IqexPXWiXx/BBxJ45uPClzns6E/cfrrsAHYE4+5+45+AQAt3?=
 =?us-ascii?Q?XXqivvdmdiDn8D4eN7tRGtkR0+vTbImAOu55zzdFg9nJ1sDFMSdXCVdi6k93?=
 =?us-ascii?Q?z67WfNmghIpqpDV5VpB3BraSlktCuEQBJ18Qv+z+ZB5IiR17rjvauTGZS3Fw?=
 =?us-ascii?Q?C5qeUUgLrknkfaw7neCkR2KoRrc1M9HA9VY5fqAyTmcSLCceMv3EWY8sF6QU?=
 =?us-ascii?Q?KyGtHM+1iXm0cPp6x9QdWM+8PO0MrwbtrU/WUyo8RpnhTwit/VfArMau3JID?=
 =?us-ascii?Q?rpl24ZvTp7oDFp75/wOnyKfM7E4iMd9NOllLyjsEePz68O8nN4taQW5H5S99?=
 =?us-ascii?Q?4pWkMYls3J7fOZutXm+XAmiMN9qjWYRJvCyzy7uz0+1Cx0cMX7fKWKI9EcTd?=
 =?us-ascii?Q?wdYRU7fcTdLtxV0aWTb14kxfxanBCWx20r0ZsJIjQGrQ+/lZsQl3IavaAD00?=
 =?us-ascii?Q?RlVL79lp4TKZqlzPjniqn2orJjFiPJl5APq7lQu7DevsTK6elhEuiSa5LiFT?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jHZl+CdO+j6Btuz4nvNT+9qMbDxaRGuFHOqr3S2M8vWsOCxg2ibDZnJWWHDLIKH/t5j9imWoQJxUiQxj64bKIbXsvCwIQRPp9gj7WCF4EV6GXPSe5RQifBiLdNzGyjjuNAo/5XO1jbY2VpRUWtqx8u7nwVtLP4abQvYYCk1aAcxu+VORYvoGbgAU8GkfBS5iJnmbmkpPRHtIUisYMCrYDoRYPt7rvXieSZbFREYrFq6R7NtRGFGuK5Gg3D2bGocE4m1uPduQDNHW1ViHNEmuLBuKzumr6pkLKNp9Tjwx/AzQlgBqEMX1kPT9nlbbdTmADeKiA++XxjrKsQiQFTkKrQthpKrPHqlsfyGnUo0MXqknV2r90fCaOvNfwQ4L3AKFvNnRBWxRKHElfXTQdlWJpvLwWACL/9OSvq7x7muGquRICJAff1ysr85yfqhx9twsJIYp/4fQiG7ogN48SjNN/1N4fh9VrElD9v4jJzPATQSb3wBWVJuKYvbtjqgpXH68prQ5f7rOBcrrROX3I41ef3MZiEyJm8K7Rq3FRwLPXWX4WvFk6on63Nto3qwGUxwbofH7qjtBU2dgPZK7/LtxfOUZmKxAKq2+/efV3qKGGdY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5032936d-9d85-46fa-56c7-08dd5ac8eadb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 03:01:53.7824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGkeMXj7GOedvq0wBgCQxboNWoffhd214v0N+3ITZf/BNWAvRrVc0LlpinhBzswRif9CkNEF7LKGetVdUPoqObcgVzcvCuyrQT1SEzvuBNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6845
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_02,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=767 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503040024
X-Proofpoint-GUID: bVgtXcA42mHB86SlX6YQyhAeqwvEc6L4
X-Proofpoint-ORIG-GUID: bVgtXcA42mHB86SlX6YQyhAeqwvEc6L4
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


Hi Madhavan!

> This patch has depenednecy with the first patch 
>
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2025-February/280990.html
>
> Which is already part of your staging tree. Can you please
> take this patch along with the previous patch. 

If I merge the main cxl patch we'll have another conflict due to the
docs patch below:

>> [0] https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20250219064807.175107-1-ajd@linux.ibm.com/

I don't mind taking both patches but it seems more appropriate for a
major feature removal like this to go through the relevant architecture
tree.

Maybe the path of least resistance is for you to put the cxl removal in
a separate branch and defer sending the pull request until after Linus
has merged the initial SCSI bits for 6.15?

-- 
Martin K. Petersen	Oracle Linux Engineering

