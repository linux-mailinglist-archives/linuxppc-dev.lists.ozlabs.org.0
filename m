Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C566A1102
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 21:08:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN3x55khrz3chb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 07:08:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=P4TYbR+g;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=QPmsrN6v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=P4TYbR+g;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=QPmsrN6v;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN3w82bgzz3cd8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 07:07:18 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NGxiMU023511;
	Thu, 23 Feb 2023 20:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=taCrV9pvpVnfKa5R13gEOKBINQ1y51nBgL9kLcNpNR4=;
 b=P4TYbR+gw6G0IvliV/1AkQFat71fMF5NIFthMzmFYFAUS3RZMt0TbWy4AtjbINIKksAF
 nN5KLBrV2txbg8Mc701iKokeYPu13ywnD+hbD/q6FuNipModiaiti8Je6nuHWpjROf9Z
 t9sznPKtKJAxJ+tzV2xIZau10b2SU9YkPB3Q3ekjVcj80+nBkCJ/dvXbZGL9RVBwfK1K
 czVmVz8ZE+fnVvGNlBeGO2Exe61aASUMINil6QBt6wuGHuuvesOb3MPDrJ/V9Oj1xxbE
 kIE//YWK93CJirnXhZLlwR1/DGWO4BbjHE3TbCkNgKCkSPAEEFqPWrKCCPn/kJpDCfnh pw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntpjabffp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Feb 2023 20:06:26 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31NJvESN025997;
	Thu, 23 Feb 2023 20:06:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ntn48hgek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Feb 2023 20:06:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5nG2lpW9Gm7bcGBXTz05kDnX098VPs7F1/DxAu6dCIeIHSDbG+rC5FAb49gJOmGMPbOYifw/RIo7yh1L4mSgZ2AX35JPWYwVEsSJ2WSQnH0MeuSlBAkEvnTetrH5E40DWjg8pShiV1Jnv3XB4m1Y1uly2fJtb+0jYGX8ZIIheAOf6o6nEaukZDATWazZXz6xw5zwHbW2/HxgLpH/MdifuEnG5zzQzI0uKuJvsTjNXydu7RfLh2CVj1woYyuzGp7NiMveIgSxa4pmrvup4yxLOWG8aG8/b2q1V7SziiYp8zccAZ4jR3OEiU0fiazlRVgE4PodtNgany5UqVq9DmnHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taCrV9pvpVnfKa5R13gEOKBINQ1y51nBgL9kLcNpNR4=;
 b=WiJhnZp6Ol1IWRYoEEWwetcowFxCjCzTl9PkbxAXwjZfzon+LoH83+0UsxE/WLJe3lsl+v2EZhVn/wZ17P/RwINAEHLaura8RoEyXRYGzvli3KeHdwetgRL+oWqMjPg5ys3R56MRSk7r/ZXwlfXRw00eY8AKKtQF2HFvMqsdJyeGYAwENH+Y4YVMeo4Sp+a9LDhMlsy78qUW92fjhB/fucZHbdu6JpKxgmg+tFvbUkfqEFMUrA7AWs6yiBGP4Px/Dq0B5Iv/tYTvODiU9OgznIHIWd53xM1eteipnqavvTKs/ZMMgQNzAyN087E1o0tlP5NOzeTB003c5oOB49VC7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taCrV9pvpVnfKa5R13gEOKBINQ1y51nBgL9kLcNpNR4=;
 b=QPmsrN6vOy6gWUMH+S8oIZem6k3vGIBZXaaquIo6EgQmIx/vEmaYX0cWFRh8JOJwJuK/K0DaPgljrcjvSUxY7ae+pYsBHEm7RXgnocqKgjBYLqrOG03MuMFAmADw45Zcb9rHsNJY59OrQ35FBJvYz/t2TaHL7ObgzgKJ3ckcbVw=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by DM4PR10MB5944.namprd10.prod.outlook.com (2603:10b6:8:aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 20:06:22 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319%7]) with mapi id 15.20.6134.017; Thu, 23 Feb 2023
 20:06:22 +0000
Date: Thu, 23 Feb 2023 15:06:16 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v3 23/35] mm/mmap: prevent pagefault handler from racing
 with mmu_notifier registration
Message-ID: <20230223200616.kfnwwpuzuwq5hr7j@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	michel@lespinasse.org, jglisse@google.com, mhocko@suse.com,
	vbabka@suse.cz, hannes@cmpxchg.org, mgorman@techsingularity.net,
	dave@stgolabs.net, willy@infradead.org, peterz@infradead.org,
	ldufour@linux.ibm.com, paulmck@kernel.org, mingo@redhat.com,
	will@kernel.org, luto@kernel.org, songliubraving@fb.com,
	peterx@redhat.com, david@redhat.com, dhowells@redhat.com,
	hughd@google.com, bigeasy@linutronix.de, kent.overstreet@linux.dev,
	punit.agrawal@bytedance.com, lstoakes@gmail.com,
	peterjung1337@gmail.com, rientjes@google.com, chriscli@google.com,
	axelrasmussen@google.com, joelaf@google.com, minchan@google.com,
	rppt@kernel.org, jannh@google.com, shakeelb@google.com,
	tatashin@google.com, edumazet@google.com, gthelen@google.com,
	gurua@google.com, arjunroy@google.com, soheil@google.com,
	leewalsh@google.com, posk@google.com, michalechner92@googlemail.com,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20230216051750.3125598-1-surenb@google.com>
 <20230216051750.3125598-24-surenb@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216051750.3125598-24-surenb@google.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::13) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|DM4PR10MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a424fc6-aca8-4c5e-964d-08db15d96f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	zTo+W1mYiWYHmVbsvPnJB2zT2r53GKJPcuqlbqfoyGSlmfC/hLlJ7V8BQbkCiDujrWm/oAovFitdpizZ5N6jupn7TpGU5ySiGMBGmMOzoiCGXDoer/QhpBX9OCQjIpmTfGXiiSjcJulqB+cKac400tHXhITRLyNCsTDWLZQW/k5UoIycOudbbdT5YKAmQGrKDTbc1WLZnwuqUVwDuUueYaXOzzZ6APYaxwaYG/bY07R69pNN5b/YsW78rfGAjGoblGeiTMFUUVhUF2MjuHrqSkuuiDU8raTnGNiE9STiKRPHmhRugiN9uRA8c+nhzfeQQ0dmoQPqc4yIlM/pM2HGWwGcHfbeXquFb/76QZKm+ECVLLaqHSZX3sA31YBoHf140Iq4NUu8+9b22+FuKDn3Xc7BdYDt8RB9AfbxGuHlSfovVlaMRAG7xIY06xraNVsuj3QE4Z5fsnS1i67Tug0INc4KPJR+AvRdAiTX8SMVJ7U/4Qa0OT54anTLmd4O3KTxjqqvYeQ7KiYYnBW+G3x3UAbii4OqqfaDqAM33MZG9yyrU2FQ6adDkprJtlAQE0X60d+3t9wgujle6/G3/zYRlTFi2PqHrFkh54jK1Mn5SclHiCeri2F3CWp6vUl/dDJPXOBZ906VHD69455mR9X+2Q==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199018)(6486002)(83380400001)(478600001)(2906002)(9686003)(7416002)(5660300002)(7406005)(86362001)(6512007)(6666004)(41300700001)(1076003)(38100700002)(26005)(186003)(6506007)(316002)(8676002)(66476007)(6916009)(66556008)(8936002)(4326008)(66946007)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?gk+++TYcm+HbxSIQ4u6ohd7TUbAR9Gjl49k9ETOImIjrLwpxE1+GJMUUmTQu?=
 =?us-ascii?Q?Rkg602PodCmbrhVjvi9aFbNUSHhxHUnEUTyQBW0sjRvcArI+N4neiSvGfJbG?=
 =?us-ascii?Q?6B47vBAEZL2LCi4cQ9znhLR4ZDlODsVrOfyGjyPEJUAraJWhEkF+CwjWncpg?=
 =?us-ascii?Q?USaPInf2gedyIlw3ekShQzm+kOTz8lR5SjPvqOerCTWjQo2uruqHBF4f0Fjk?=
 =?us-ascii?Q?0KtDmc2z/jmP/10dRqvT1EzmGOAMf9JKKK1LWBP/lnSGAeo5czpJySk0DG0L?=
 =?us-ascii?Q?4nzV20sIeWkg806kCIew1iwcsGyyzDPTEFy1CbdbgUBgxcTjK6AYztMVyYJ/?=
 =?us-ascii?Q?CcxwyTdP9syavnh5sY59ZAKswQPYwPoGMLHFmoFkGXGAc5kHZYOkF0RYtNKa?=
 =?us-ascii?Q?WEfKIw8l/KBdXqCdortWW83UkNVNkqmCGLDEz93yL9vPgaEodqBoeNVbJzuQ?=
 =?us-ascii?Q?eW0LNQFMMOj2eVesf6COF/AkRzywGiAw8kJ/4YQM4Y8Rcafp+j9kv7U3Fx6f?=
 =?us-ascii?Q?c8q9a1CAc4xpf3RMYqIdvrJ5cGCMPJLPoHsJf8j3abtJc+WVnf4sjNryXc81?=
 =?us-ascii?Q?Oa8bVk/cB0OdUs05e5vpqG3WgoyKl75+OCR63h/N2nc7McXMX91Sg9vsT14U?=
 =?us-ascii?Q?YnTfS+GOaibGnHr7kMQUwIc7FZlSIFkBFlmlFCk6/UqOG3t/6PS0cyfUr5mE?=
 =?us-ascii?Q?NpYP6sOsDU5XBTq0bfm0ErgtLquA/JNbrlJGD2t+j1aia4jl6CWnwMMCeXKr?=
 =?us-ascii?Q?qamfTQt0r8DKod/Ao5EOftXOgGBSDco0FjAloEdnq9voEiD3zKC4xM+dXbVQ?=
 =?us-ascii?Q?IWBKQPNvdfBKiP8fI8XG6KZHsOcOuhKtx4vADEgYEa/az3va/JARshXVV1JZ?=
 =?us-ascii?Q?pKTPtGF5s2QdO1qsznU2wEaF6PFZrinqt9W2GIq6tEx5io46kLthmq0SD7yX?=
 =?us-ascii?Q?aiv0odqOtFI3hyz4ydwbcOs8QcAj3/WzgOMOpmyfG6/fKiws5CFlQ+hdQnFQ?=
 =?us-ascii?Q?3D+opbquCiBLD/auEN9SrRFoG4wicWue1GZ5z568qdWZuJIORmVVtnQqA4Mw?=
 =?us-ascii?Q?3FNEE1RQSbMb3dBtaKBYij4iSY4hN9/VNtr39mmRZWNL0Rjc/MVVjRVpJGQ5?=
 =?us-ascii?Q?Y8ORG/QdFCYQ5rQ8DQUFrSPu47oqjdSp+m78NvkC/Rfiu1wSew/3JDmN/JQ2?=
 =?us-ascii?Q?XDQR473hjlUp6UxyNRArfTX/2vDHP4hShQ6ANSPIwDAc0Xy6JqdOTCP6IrQV?=
 =?us-ascii?Q?+CI43RhkiufK8jqCB5/jNhgYyhHV9FwLHtKnIH2SmIAF7GbZZsI+/H20q5Ah?=
 =?us-ascii?Q?yBMeYS840apGuOaP3/nKWOA12ejuH0JZUkCC5NDdrETXuOMP7odsmKiXLXSd?=
 =?us-ascii?Q?o97iHMMAD3vk/D8q35q24EeGgDy4hjw+mwFrEKpfSJo6KXVC2y5Ts5hAMuBm?=
 =?us-ascii?Q?XJNHO6VPlMbJbB9kQz/6IVB6JVssfOXZFGsTtbFSSyX9wNlHCMmFmyxLB7JC?=
 =?us-ascii?Q?Ux5Jv66XBvvwome3HI8uy2r3Dkrg3+DIQHRKQAfpZKnKP5CyLIeCmO49iDle?=
 =?us-ascii?Q?CM2rNW0+3IObaYzw+4UMyLAyXylHh9w9kH/W9lLoxjxyO0J+slfewHDIbwYb?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?2kSZ+E1kVlGgM+piuzh+WPYyQNnhS3KvRVty3q0eoh+V1/IUYfOVQakK6gHn?=
 =?us-ascii?Q?6t3J0I9UWIUZGdu50smyAJ9xGqSrg+8uem3S4vD8acQqd9Zqd/PNFQanehMn?=
 =?us-ascii?Q?91+bkYLjpM3NJK6wdaKOGbclMsLFov+d8W88XzrcASUiwdh3VKX8z2L3Y/ib?=
 =?us-ascii?Q?IWoI7HMkqSvFrbiDDOwgzCATH/Qsr200tteHWMcJHq4Epe+blmnPa6N/5mhH?=
 =?us-ascii?Q?YdAB5B/GZ6HS65OHFtN7bWdMuvHILkRoSQR2fQL2UDzH15m4K/7SwaahvbAF?=
 =?us-ascii?Q?Oon0GayscNXPRTrivGvsHz9VD0DefPgyW8TKeGHIOYKLaUMV635P/XNge8XU?=
 =?us-ascii?Q?1OTnkKAUw4l89VBkSXxiIMQc5JhvuvXkDG10HcTOi7uFfA4dfo7HLCWoxF8e?=
 =?us-ascii?Q?2xwkAZaYwNvUhqWNCfdiXYU5D70haV84SM1Wo4x35HOmgIFBICiYGsQCjG+3?=
 =?us-ascii?Q?hqearqWDpMOTC3GzauRmIapSViyJMEqoZEWKFTNeXZplTeW0VokI5J+mdgud?=
 =?us-ascii?Q?ON423hgGhV+tHiHJx0nqUKhSS6T7KC/BNbaV/BqL8O6L5NwGwDNYJBIvNLwf?=
 =?us-ascii?Q?mizAXf8iks19uXlHm214EXILrjz4Q45zaXJNbu2e12FI2nYo8upzNk4BiLJC?=
 =?us-ascii?Q?RXo/WwxOaQmav59M4KIn3V7gxgNEHDh44b3L+khPHTAW82zD7rNUtV2UoAlo?=
 =?us-ascii?Q?s9S1c2l5RS2ImFZ1Fyy+UIkLUnGUSBJlVgclwqeEgYXaHDDzTHpih+DMv41Q?=
 =?us-ascii?Q?VJ7u+EV/ikHCJinIzUJqoKPdASNdX9I5BCLAKNlD8WASEd0P0ME891vtEr/e?=
 =?us-ascii?Q?9rNFt6YSOA8vz6OxwlKiXbj6dbH627PGSj2cw/Hg1uW8MBdumMcb1m+uBjae?=
 =?us-ascii?Q?tarCodf0TcunVsRqwi1qpJU77jCI0+d/TrNcMAKA+s1rpWd+myA7tfhc+p91?=
 =?us-ascii?Q?NGH9bshAk2grzVizt3BnWzsec4yZv8EFCJwSPJ41tAtBAZe7eZr5+Ltv9fCt?=
 =?us-ascii?Q?9BTlWu6Ccx2l+UZ/i5kv2v+De7lrhvUNMLbWD/F+hg1UguyrMpiC9l3iSug1?=
 =?us-ascii?Q?K3ra9ffm3qodxcNif5rjewP4YJBJy6OPbw0q7WxEyT/JAxPZTontbEzTYg8z?=
 =?us-ascii?Q?ZkMZgccghHo+958yRMsHbJ7U1o0AvVPM+i9NP7FkNAY21M9hogVMlRtC6bwn?=
 =?us-ascii?Q?A85fW1Vr1bOI4RaTxWjBWfh76sGjDFkpJcNZiIln+XDj085XQWXb4IthrO1t?=
 =?us-ascii?Q?3GLPa3HHF6YG6DxJmlC1R3BhA3+b21tHsi2nVUI2asKxMH/YyPUZhpXqgPe6?=
 =?us-ascii?Q?tu0SiD44SX75qC7cdbP2lEzy71R6PPgH9pdPmSvNBbjP6Rwomhmd6XE2ul7Z?=
 =?us-ascii?Q?ktdzqRM8088G/CjtRXfYC6k+Q6UUpc5ywJhrUswjwQEu1Jon/y5d2j9K+vDG?=
 =?us-ascii?Q?nm+4nTA0KGoOkf5ChyBehcUCH8RdqZ//l+azG3HerZpp4ZadgyKoX1O4fl1q?=
 =?us-ascii?Q?L/kt7j6qgDhETje/2/CiNFBKwfEUT6pQpLIMqrkaeClIb9P+hJAIHMy32Q?=
 =?us-ascii?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a424fc6-aca8-4c5e-964d-08db15d96f42
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 20:06:22.4122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GdKKY8NUdRx5cuuJ9XJ55R0v1mIA8eCa5ta53jQIsJT2F2v51WDXwuLR72J8mhNvQOef+x95k0LCjNDbva18A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5944
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_13,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230166
X-Proofpoint-ORIG-GUID: Vw92gMyeFlBBgUGtEZ-FmvFOOBDwZ4NW
X-Proofpoint-GUID: Vw92gMyeFlBBgUGtEZ-FmvFOOBDwZ4NW
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.c
 om, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Suren Baghdasaryan <surenb@google.com> [230216 00:18]:
> Page fault handlers might need to fire MMU notifications while a new
> notifier is being registered. Modify mm_take_all_locks to write-lock all
> VMAs and prevent this race with page fault handlers that would hold VMA
> locks. VMAs are locked before i_mmap_rwsem and anon_vma to keep the same
> locking order as in page fault handlers.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  mm/mmap.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 00f8c5798936..801608726be8 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -3501,6 +3501,7 @@ static void vm_lock_mapping(struct mm_struct *mm, struct address_space *mapping)
>   * of mm/rmap.c:
>   *   - all hugetlbfs_i_mmap_rwsem_key locks (aka mapping->i_mmap_rwsem for
>   *     hugetlb mapping);
> + *   - all vmas marked locked
>   *   - all i_mmap_rwsem locks;
>   *   - all anon_vma->rwseml
>   *
> @@ -3523,6 +3524,13 @@ int mm_take_all_locks(struct mm_struct *mm)
>  
>  	mutex_lock(&mm_all_locks_mutex);
>  
> +	mas_for_each(&mas, vma, ULONG_MAX) {
> +		if (signal_pending(current))
> +			goto out_unlock;
> +		vma_start_write(vma);
> +	}
> +
> +	mas_set(&mas, 0);
>  	mas_for_each(&mas, vma, ULONG_MAX) {
>  		if (signal_pending(current))
>  			goto out_unlock;

Do we need a vma_end_write_all(mm) in the out_unlock unrolling?

Also, does this need to honour the strict locking order that we have to
add an entire new loop?  This function is...suboptimal today, but if we
could get away with not looping through every VMA for a 4th time, that
would be nice.

> @@ -3612,6 +3620,7 @@ void mm_drop_all_locks(struct mm_struct *mm)
>  		if (vma->vm_file && vma->vm_file->f_mapping)
>  			vm_unlock_mapping(vma->vm_file->f_mapping);
>  	}
> +	vma_end_write_all(mm);
>  
>  	mutex_unlock(&mm_all_locks_mutex);
>  }
> -- 
> 2.39.1
> 
