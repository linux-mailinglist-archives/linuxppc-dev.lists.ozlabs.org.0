Return-Path: <linuxppc-dev+bounces-8300-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA36AA9A43
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 19:19:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrpD65CNnz2yRG;
	Tue,  6 May 2025 03:19:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746465558;
	cv=pass; b=KBX/AsgR02Vj0X/7TkJcVrY0TaH1+rsAGdkH+GTf3k7s1ODIynAem/gMIdOMeotZRcPN6KpPV2RYn0EUyofshQLnhfkBEWcG46iEaaI1srBXxcmReP1MT001u7Et8naFbFb2fEczxF1wxlHDrb+VGFQVPf0U70jORc5+cYvTr5Tj4aRQFcgPVzrlMpoAW8h08vQMFRMJcyXq6X2TLQ3AZQmIUIGZibDQiZ8Q0hicQymWSzgMrQUwiDR5HQGhWicFrHkN/UVcCRETIB15M1cdfHq1m5OtVW7ZxETogQTT0wtKT31KfDc9QkJb31EmxFV+dZaZvvEUP9Sg08i+ifVonw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746465558; c=relaxed/relaxed;
	bh=5X2TFmWYSDcAbgZ4R5rUWY+ad/sSRUFg4vA5YA5FlyU=;
	h=References:From:To:Cc:Subject:In-reply-to:Date:Message-ID:
	 Content-Type:MIME-Version; b=HOe4Oh1mmCoc4orh+WIcAOHyZt60DZuxbzHNMjXwyOkBRLYC740z1++UbWw6JQWZcbV3Z/Q2OABIIi1Hjjr20MlbhFKs2+wBX39x+RG0qsCbsJZCFl1qig+6tHuXiB6R329bpREkAdPjLSkPsKYC2sJ3fD3G1IugkW8PdMqKMR0wvk9rA8zyadX9F3rd9wHW2/jbUTxpVAxjHlHv3p5lyGnjVhMoE178ycGqsRc+m8uiKarID2JuoFQytbtFnm2ziLHlSAaeXZ66iHLtccJSAY6tQ2VcroeluKQyOku6bJk27//QVdAw9fHz1LSi72mcICtDV7XBAZlJQGG8DUgq8g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=onnrPh5q; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=I7zwKcH/; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=ankur.a.arora@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=onnrPh5q;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=I7zwKcH/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=ankur.a.arora@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 582 seconds by postgrey-1.37 at boromir; Tue, 06 May 2025 03:19:16 AEST
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrpD45B1rz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 03:19:15 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545HDRsI001180;
	Mon, 5 May 2025 17:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=5X2TFmWYSDcAbgZ4R5
	rUWY+ad/sSRUFg4vA5YA5FlyU=; b=onnrPh5q5m+wX95LCFvJdVAr/0DUG7esdI
	9IWxAaXhmmFmRgyw9WTjPE/haWDeqyhg6gvOFYQMd1qo2aveALEAi6/e0YzIuUBZ
	7J6/QKAULCSDNYLpZBy9AwNb8ON0Xa+W8FZlg71mv7Nlkead9G9Mxr+KP61Bc6a7
	bpT0XOUL1SguY+0JDI06nOjv7awtcCMt8W6GtBCiwlO+TJp0acKMYtBai5+3S5hn
	1dsDbKyxok3REBWGeaYgUJTY1plKRqyEqEU//tKiIVeSzouxldzdIF9dYeRyXjM0
	cv5t9EP1EHGfKdvj/YTNuk2DbEcMz0LV5VOoK9gYFdnXaAbI52yw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46f1cfg1fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 May 2025 17:18:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 545H0BHM036063;
	Mon, 5 May 2025 17:18:53 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazlp17013079.outbound.protection.outlook.com [40.93.1.79])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k8q6na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 05 May 2025 17:18:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MCHXAGPo6LeeqEdHI+B9sUsOa5LHYGl4Rl8QNZXoqRNtpemV8hU2L39OEX9JpDFcDuGd1ag3ZRaIHHvxKy8VD3ZBkI3n18YLuvpweh1D8zHvCA/dx1NrMyAsH3TihqjWotLNulb/mKzCjVkVXWddouNTE04xB15NuC+FPhrNs6cqTwqB/6xNzm8tYwqoUx9HUkq1KIjh+mZ2xx9ojpJi7+ncJKjN9pMt1kqRq6ePDNDDspOMuzCBYV9f/hLfXnk/zodyBEUSRIYhhKYI5365iTto5BtPt7CvzWr1rEL5mNjr4GHMtr6f6KKl9UN9dBHGwQEMFO0dsZE+ysuqoZFm9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5X2TFmWYSDcAbgZ4R5rUWY+ad/sSRUFg4vA5YA5FlyU=;
 b=XANdnyQZcNHgqHRY3vycqZSgle15vwFGC/DxAeKC3a2+jrto17vxKHPggCCbvaaf2oc2R1xoQXR/X4dG6OMjy1YrGs3k9Z/YlrZrkSdWWzOqkZaaDsA0neaEFlzAyOjemTzxwDsFm26y8MmKMZ2exNql7LOtfl5HZMNqBX1ofBHjNdKBEoGsJABfbXnraOaFymbnBzNOTWjdWIH19FRvUMAw5D5I21ibzQco1Xu3Moy/Gorxbz2z13bhFnBzCaN1n+TxECDiUvpCYdiMkkZUWAActj6vmnta9fi0ewHRzxEZbn98MjbLt9hByrotaePELnCd0xnhqhcJlzsSqZ62TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5X2TFmWYSDcAbgZ4R5rUWY+ad/sSRUFg4vA5YA5FlyU=;
 b=I7zwKcH/ceK+0t6jPSXwz7D+mSBxIEabXnqvgoRd+4GvCicWVu+6Mc+m1YFf/nl1HrtEOuvDOgPkoVii7ToHCE8w/ltM33A6iV1jmrKXrwNVpmwUp69eqFK7cIQ/C6zwdkrDtT63g9nTBmcpvdlATZ1JPmU32KsJpfOa+K0WtHk=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by DS7PR10MB4990.namprd10.prod.outlook.com (2603:10b6:5:3a5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Mon, 5 May
 2025 17:18:27 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8678.028; Mon, 5 May 2025
 17:18:24 +0000
References: <20250428152225.66044-2-mchauras@linux.ibm.com>
 <87ldrbnfx1.fsf@oracle.com>
User-agent: mu4e 1.4.10; emacs 27.2
From: Ankur Arora <ankur.a.arora@oracle.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>,
        linux-kernel@vger.kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
        neeraj.upadhyay@kernel.org, vschneid@redhat.com, tglx@linutronix.de,
        frederic@kernel.org, sshegde@linux.ibm.com, bigeasy@linutronix.de,
        kees@kernel.org, oleg@redhat.com, peterz@infradead.org,
        tzimmermann@suse.de, namcao@linutronix.de, kan.liang@linux.intel.com,
        mcgrof@kernel.org, rppt@kernel.org, atrajeev@linux.vnet.ibm.com,
        anjalik@linux.ibm.com, coltonlewis@google.com,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC V1 0/6] Generic Entry/Exit support for ppc64
In-reply-to: <87ldrbnfx1.fsf@oracle.com>
Date: Mon, 05 May 2025 10:18:23 -0700
Message-ID: <87a57rnfhc.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0178.namprd04.prod.outlook.com
 (2603:10b6:303:85::33) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
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
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|DS7PR10MB4990:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee0eff5-9fe5-46c4-f163-08dd8bf8d7dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iN4xJjc286FX50jIkn1t3d5Qq7pyzGPMoyeWXhLyuTK4rJkiTxMOrfNwZG4u?=
 =?us-ascii?Q?vu530y4qPQEH6a5ufRpAOi7ZBO5lLmuYxB2wH1G0v6lA57Z79gu+cTNLw/fA?=
 =?us-ascii?Q?U9S9YqZAmnR+yU9lTQYDiO/cbD2wP8q7XpKulS8hFph9NKFVRoVEMnagGhls?=
 =?us-ascii?Q?6QlXMCbo9oWwtYS+IqJZcYppo4ZRVfqf0YQ8VUo+vojjsqwNWV2qxSRysQlC?=
 =?us-ascii?Q?asaqapxaEzTAdP2PnpjPpEIDD2EQHmfQqAIyPgYtLh10HPupj3uLENxHyDBe?=
 =?us-ascii?Q?Yp7NRFmJqgd2l57OGwQaqg5t8J1ao1+cH6t6vfCyKzSa3L/p0bEdaXbAnDie?=
 =?us-ascii?Q?XAFfCYLanXPkz9XEntCgeXBPyEZPbIMKH02ut2E/9Oatn8pl3NdUh4+bqL1V?=
 =?us-ascii?Q?4/1njHdq8gPim076cfZwO4mtJx41VgyFKUh/KWDWJunV3q+bJlefzpNMaa1I?=
 =?us-ascii?Q?DnIS3Yy0G81KZ3vgaevpf4Urs6gDW4RhKi4a9C9ZkpnxBv7nfj93j5I35tC0?=
 =?us-ascii?Q?6v2zea5Uej7NqeBTEsl1GsLh0gFgy19xhXhYDwPITA061OCws4mwgo/7iNpO?=
 =?us-ascii?Q?C5ojZGe7MIXCf4Eg1lRNKegaMG/EZVDfvrzbp8o2nyoGaXO72aH/BNePlY65?=
 =?us-ascii?Q?JkGV3Hsjkb4WvO+9yvarwRU8NyMi35l26H4DWhA1a9OjyQpvA9ZwEZ3S6QHK?=
 =?us-ascii?Q?jbJWg2k6rII/MkAdZH3NL+tZ1yI0W3G+6hFB+QHrtz0XPVp27uUW6DYmdD8S?=
 =?us-ascii?Q?mYPEV2Gq5/9ef/b8AdyybvSkuQ4k2DunaL0BlzCCJif93BlCEfnDFWasEIHm?=
 =?us-ascii?Q?6j62GhDkB8AnCB40uSfxfavYe4eL9DRfjxRq5bIzQqFG8yKiOCFr07ctwt4o?=
 =?us-ascii?Q?CmlHFddmZ78rNW3tJupICl4irH7bMYHSx30gbkOakXrEWoVOmSaSraySAZQL?=
 =?us-ascii?Q?UMyXsCNBFxDyxoSYs2GYX565DgEio89e8LiQeC0KGgDIHlCTgw7Yb3bt5Y2A?=
 =?us-ascii?Q?mjHp8zFzH/yUbgskp+WfOwo21MqFPmIlzyFBWMwosqYEvXActGCMQ3JKkCic?=
 =?us-ascii?Q?vcSJDWplm5lfIBAHeTiTGmQS4D61Dw/O9na/YYMW13aqxd+6Xgi2lDt7RdFJ?=
 =?us-ascii?Q?ll27jpfogm1FSSNOPYDa6uKRRUP+GEaoWujEyNPcRT+LuLv8q+87Z/jt6/YE?=
 =?us-ascii?Q?9VZYRmljOnqAvkGyeIQbA1Vydzl4hLviJ4qPGpwGRURap7RG4+XNZyOh/ogX?=
 =?us-ascii?Q?XsK9vxqaVM9IWVC49DWf2XDweA6tYGR88Vvt6eBRCD7uU9/VVSolrVbdRUOk?=
 =?us-ascii?Q?qZ659X/tK2I4/DcTXzQVaisIMmhAZbqn8JWYsZ+8eahluvqY7oyENSlEtqIn?=
 =?us-ascii?Q?nZLHWa9o1YdaVUcuWzScIvH4OTjBMispylGpBTWak2oZDxuh96xa7XKlou1+?=
 =?us-ascii?Q?RW48yZP9EIo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nm4KD7Lc+h3NE8tgCTdzPa1AzVoYCcwaoVtjmiza9TzvSf6NKu0JUsh79uJ3?=
 =?us-ascii?Q?SmGAz+7UELaIL1ALwIUyXD/z1ot3BYS2WUfcKrq8a90lDAtWQ+28Gjct4KIY?=
 =?us-ascii?Q?/A/Kv8sYjUeu2RJQGhRSK/9C5A6Fd4y5//sJyYFuye8DVR+02rKWsu//hTkf?=
 =?us-ascii?Q?zAfEqEFBHH80iY3t8tEB4mFNFJ8F7H7YbHiHrLpcKN2ALwiXLTk/t+MmBd7D?=
 =?us-ascii?Q?eKkV6Hlr3bgQ4wWGz+194We4lyYfHJ/Z6WIUAH8cnUEdxSsB9eVeDo8T8pfi?=
 =?us-ascii?Q?l+KihRH8elb6lGXakO9lKClPG1/iURamM1BB8dAs4OSoo21hjkdNNDNJ6quX?=
 =?us-ascii?Q?KH86UImZd2sno5J0uC3HSNjPUMzQCtk53FXvIemDkOAC9K/AhGOx3/c8x/Mn?=
 =?us-ascii?Q?cobWdpn3YyGU8L2vtf2k0UPSY6ZmuJz5amUs2NFtC9aKG5RL9nvHPJPvKBNw?=
 =?us-ascii?Q?0KEhmQ50Jj6qTL7h0dv3T1g+v6yLrDdVzjT+rWoul/YPVtFWRie2+CCS928A?=
 =?us-ascii?Q?K3Okw858YGHfyPMSoGJ25YG8DNsFRf979fln6Tk1GYUDBjJ5dfm7qzvUymuw?=
 =?us-ascii?Q?Mqs6NonzD8ixh/Ap3OZwTtCknnTwKruVhIeU6Dt9b7FpJAE9pIVJQ2JYiVVX?=
 =?us-ascii?Q?QUnAkA5Y/lQ3GWOIqeblR1UAN1mXQ8Gfg6bWXzR9X9kHZCc1EkUzERaCWo8S?=
 =?us-ascii?Q?/98SIiXNqXukj6R6ZeKstz7o2nXX29BJxYPA8aKGYVJZ+nU3Sz4rrC4JgdbM?=
 =?us-ascii?Q?lWv7o3ew4bXKPsmSofNygBXdGkJOtzQknNyoM1lRWrfMAUJ0hoslymCvrHy7?=
 =?us-ascii?Q?XhgnWufyarF7cSCsl62sPBYf/1hjc5Na8FODyasRvXDiQHRVxUcQFemou+FA?=
 =?us-ascii?Q?Gnhnc0i/F6dv6YirV1/GXeOcim6/TLNjW2zOaCK8CQe0/1+psTZzkO3GAuIK?=
 =?us-ascii?Q?ULsoImfdsWpi60TcaK40AAjQGDeFdQXLmGtsZlnJTlwwB+fYbvGMndu4FI87?=
 =?us-ascii?Q?pnIXsnwIHH4vciE9Slz6clBmaQ/b0ouVUzqpV2apmsOqcsMy8JoCy/TRsSJB?=
 =?us-ascii?Q?sJUk92uPu7iAxTfHCkpvyQR59mUzr2iiVQ/aQA7unMdxzOzzgFRhFbG9A4ZY?=
 =?us-ascii?Q?uw1GHVaswncrqUDV1hWBH9zcb+3sR0ssIawZIMDdt4OBlgVCPXYRHy8fc9YL?=
 =?us-ascii?Q?tJcKXJgJQsILCqSfWhj6jlLvS/njrPfbJj2rsp1ybIrx0P6poykUIeutC+yc?=
 =?us-ascii?Q?H6TA5Jp0hsyULtdGqjGw0whtVXnQweDeCRfhTbbvkprbUZehLX5OKmvilF8l?=
 =?us-ascii?Q?HEmf/9RX8ljvfn3oUXLZG3F7vaIz7drtUyOEDzrku35Rbt8ikhaKBXUvDYvW?=
 =?us-ascii?Q?F8tdzwxozMROTP235xFJV5RsHol6a2KqwgWAihadIJ3FEc8IUriPQOJRqRfq?=
 =?us-ascii?Q?pM6jdMQCtLf1/HHTE3pUjyLOWWxShtrSyK4JE4UcUcgffYdfWQDywbSPf0Tu?=
 =?us-ascii?Q?/zwuMC52lH4zpNI6IIupjd9TsE0YdCCf4D8kTnNHJ4zbg+RFyNS/XVKvamFN?=
 =?us-ascii?Q?xosViOT01L8kUONFpr/Jpg+IJyrRW7wnn2/lcX5iBl2kY4YMPhFfYODKhV7k?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BI9FGQKMenCutTM6RvIZyGK4KXQfOgjASFNfcHdlUtmIQ62pRJQPIHz9CWiHfAgUzTZP5LkbWHjT8GVnGB9iMW4lUXFR1QBMJWqNzzNxPqPj3XFePAt9WavZ7H+Tk7+QS7SZfGDjl1gsFC6C9PveEkrNHblTkhpvcVqSYEZ3ttVHgsPd9EFPHKAIiKwoQCItC8Vxr0wB1ztBuuKpJfRe6FLzrsqmbRlNLLoAolpsMEZNdlFVf2deqgxR7hOZXedXpYCNt7EBkBQVdGJEcTVC0zAZZEhJeAhMNjHjTvo9yBkDK7UeTw6YTGB7HCVOM+WpGfCN9WI1+7ce8Amddi2zVIYIIoXwJPecdRzC6yM3CP9NOBlI7Pmpn2JJoFHZfeZWe3dE/5L5H5wWniSPEwwEKX2a0SnLVEsJrtCTOSCDg+q6YSMFdofGn6K3NSGCKHPH+Ce+DpByKXma4K53WjbSIQZ4AXUC67aTq9UJDvsrrH3AeAUBKKB0rNYDH8r4SPy4mhyulehTM0ogS6Y5PmztyPKCNsyVDfjogTjgv+K75Q3YLDJqtfr7hICZ0kf9Fi7StCDbTYSOygbj5Xjmd1Vh4ckfx5zScHC8TGOZ7sybxfI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee0eff5-9fe5-46c4-f163-08dd8bf8d7dd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 17:18:24.8382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VEz9wj8Xm1p7Sf+5IdUSmAkdBT6PpsX3Y+x/K/VhaNzGhmtYcGJuKTmKZZSM2NTzoAHxy2kgs9OU5irtQ0UVPhMjaylqaCg6qp7llB70v5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4990
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_07,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505050163
X-Proofpoint-ORIG-GUID: 1HCWDv7RUJDwriB9A-lU3WEHf5Q6LDTU
X-Authority-Analysis: v=2.4 cv=RsDFLDmK c=1 sm=1 tr=0 ts=6818f2fe cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=VnNF1IyMAAAA:8 a=wPilW9M7FIFeKtgCDloA:9
X-Proofpoint-GUID: 1HCWDv7RUJDwriB9A-lU3WEHf5Q6LDTU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDE2MyBTYWx0ZWRfXyuhWj4QkjhHI aOlnE4l2ZlxK6k2hikp0xL9f/pG8ZRuBbY/NTeUJl9oEOpKez3aOALm55NF+L60A7RlGpd5BWrS XwSaXtxHBTKsap0LtcKpwp1xEISsie1TC4ElkcIzfVKJyk8LNOuAYeHEKP7//s9GDvEMvUHe+MU
 X+e6ICi3fY6jJWRb/M2ULXZB0yN3brluQ0OF7UnWoulPMAsPfyU1ZMD6E7Z5rB5pn9cLMUtsppF cPQZptUjWN5rM1ZiRtNxn0iWf8w1Nx0I1E5SJ5mHnxGbY+WQkr+bQqIg2nWRrZKhNqf9jXyS6uR l6NKOtxR6N2lYoI1a/IVg0HDcewu0XFZy2/jYwEzdsXWh4Xvxd2jW89Ki2WImwKOYhGQAGS9DKA
 CwxmMyDPQGzKPe187xFssz0ir5mH+pKVwZnVt0FsH9QCWNmmpeQNN6jlhFUw7FSzsyEgtbEj
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


Ankur Arora <ankur.a.arora@oracle.com> writes:

> Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com> writes:
>
>> This is a syscall only implementation of generic entry/exit framework
>> for framework for ppc. IRQ handling is not done in this RFC.
>>
>> This will break the ppc32 build as of now which will be fixed along with
>> IRQ handling.
>>
>> Below are the performance benchmarks from perf bench basic syscall.
>> This is for 1,00,00,000 getppid() calls
>>
>> | Metric     | Without Generic Framework | With Generic Framework |
>> | ---------- | ------------------------- | ---------------------- |
>> | Total time | 0.904 [sec]               | 0.856 [sec]            |
>> | usecs/op   | 0.090403                  | 0.085638               |
>> | ops/sec    | 1,10,61,579               | 1,16,77,086            |
>>
>> That's ~5% degradation as of now.
>
> Is the table header inverted? That reads like a ~5% improvement with the
> generic version.

Please ignore. Just noticed your update down thread.

>> Mukesh Kumar Chaurasiya (6):
>>   powerpc: rename arch_irq_disabled_regs
>>   powerpc: Prepare to build with genreic entry/exit framework
>>   powerpc: introduce arch_enter_from_user_mode
>>   powerpc: Add flag in paca for register restore state
>>   powerpc: Introduce syscall exit arch functions
>>   powerpc: Enable Generic Entry/Exit for syscalls.
>>
>>  arch/powerpc/Kconfig                    |   1 +
>>  arch/powerpc/include/asm/entry-common.h | 158 ++++++++++++++++++++++++
>>  arch/powerpc/include/asm/hw_irq.h       |   4 +-
>>  arch/powerpc/include/asm/interrupt.h    | 117 +++++++++++++++++-
>>  arch/powerpc/include/asm/paca.h         |   1 +
>>  arch/powerpc/include/asm/stacktrace.h   |   8 ++
>>  arch/powerpc/include/asm/syscall.h      |   5 +
>>  arch/powerpc/include/asm/thread_info.h  |   1 +
>>  arch/powerpc/kernel/interrupt.c         | 153 ++++++-----------------
>>  arch/powerpc/kernel/ptrace/ptrace.c     | 103 ---------------
>>  arch/powerpc/kernel/signal.c            |   8 ++
>>  arch/powerpc/kernel/syscall.c           | 117 +-----------------
>>  arch/powerpc/kernel/traps.c             |   2 +-
>>  arch/powerpc/kernel/watchdog.c          |   2 +-
>>  arch/powerpc/perf/core-book3s.c         |   2 +-
>>  15 files changed, 336 insertions(+), 346 deletions(-)
>>  create mode 100644 arch/powerpc/include/asm/entry-common.h


--
ankur

