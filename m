Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0478B7513AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 00:39:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=a/CzMeF5;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=TUKuCrav;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1XjG6G2bz3cZk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 08:39:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=a/CzMeF5;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=TUKuCrav;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1NDB3Kzjz3c1Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 02:16:57 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEiBtN020349;
	Wed, 12 Jul 2023 16:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=6TvQZHdAS5xKcSb/e8jmjxcPhYuqtvf/21CtwvOY5rE=;
 b=a/CzMeF5peQ8YhQP0Y4ZbexRfIv0zhSQasCOiO4qoxALqNhFmOY2O8G+MiXOe2SFVY0R
 u/l9HWo9++JgVN1swVaxnWoccxMuLaK8Q7fdmLKyeoFNrg8wWrs7GpqPSf7QVBYesTLH
 uRQEk4RZVBiz+szYWwG25l+iMBbzbrmglAStmEbwGLF+HfZ22xQFZRhP0nu5MjTGE6DP
 4Bq8Ijx5c7oYVWsrTuP2IkENr3TY8mqx1J9afqWqEtiIEI+fx4F+JCGYmYkAxs8bPdG0
 C0AolYjD7EVvmAJJTYlaRHrQO7o6rMw3MBKF0LFqhpNhSdWppPAFxG8yPsbspVwttcVF Zw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rrea2wn6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:39 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEoomO004281;
	Wed, 12 Jul 2023 16:16:38 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rpx8d4m7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPiDkQzm1PdE6PLGCTmKJ0p8k8qoznPw2OSJQ0L7/fKFbk55immzk+4+cWIGr2Mf23hXxUPXZ+ZkcpRMLPqg5ahcTn/fyvEJ+yaS6pi0a8mrZol6+9C2GNPWYemLMDALfKZWMYfU6b9BePgOcYB9dv4T82vgV2t9pK4CNXSLRlSi6BI6CtDe0uNJIutaTfacDe0WDzvY4I4m7WsenDvSna1eW8nC+ceLsfnwRIRCULnIKBrQOcaG1VTCagZh6fQMlMEboEST2x2ywE5coUWnqsCsKevZnLySDNJp51FN0pSCtEux2UXf3ZGwJDnMbblEKKkkCpkZ/749yU4xrGR08Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TvQZHdAS5xKcSb/e8jmjxcPhYuqtvf/21CtwvOY5rE=;
 b=Yp6LaQuAnMBqkXSctUDhGloh3E1Fxa8DxNjYe4JxYnXw6rrGBGvhv4scbpBHDgpJOxS9fqduT1oQHOqDPSWO/pjvYUcnKbhzz6tmAiJkdQKwDC2kRFGFdLid6ibivqwvtnBt/yl4azgulGSzyKWrWZzIVNypSE3Z+8TWKNv+70nVHcnrckYmlh1fNZd9NI6WziMLhzwsfeDCRcpO8TvpNJE2XB773iXAKmaTkbArB6C0JkcGGNswNAwPyho8pEzwj2ZbvdyiCSSXx99McS5BbAo7+jmpVQis3J5F9RXz6MS7ml+rXyiM8fUgfMxCglhxAoKBwgJr8Js5jQC1aVMleA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TvQZHdAS5xKcSb/e8jmjxcPhYuqtvf/21CtwvOY5rE=;
 b=TUKuCravli9QWsrnFQkjnvk4tjvg+k85re83QJHF2I9L1it3CwF2PCAGLeadVFLw7Iy0bz/O+YkWf9Yv/R69+9PSmWlVYvEcdrj6gip5gz15geTEMU2wSqNAySODDGCOCR0i+UQjQSObmRCfcJMl2p/j6aqVA/osfDpzgkQNvVk=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by BN0PR10MB5304.namprd10.prod.outlook.com (2603:10b6:408:129::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 16:16:34 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 16:16:33 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v6 14/14] kexec: rename ARCH_HAS_KEXEC_PURGATORY
Date: Wed, 12 Jul 2023 12:15:45 -0400
Message-Id: <20230712161545.87870-15-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230712161545.87870-1-eric.devolder@oracle.com>
References: <20230712161545.87870-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0057.namprd04.prod.outlook.com
 (2603:10b6:806:120::32) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|BN0PR10MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: d61e4658-810c-4da4-daf7-08db82f35b93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	lj+u2Kg3MkfXSO9/cBMfsMKeYOl2C+36IZVu9dE3d2Wg2ji8rIYnIDT+eSySNcYz+1ki3D4XcDN9FAP5PtHAJrXX3SrEn4cFiz/w1beAwExB1XhzALPAg66VuMcxLwOtxZYacbMotrkuH9b5a7TirnfwsNNaLIOsyELhY4XWkBYHtsCXIAL4VdRIK3eHhI/GoYWeFWp6tZ/shDeKq1upmQP3sNdvg+/13s7PNqfNIkEoBo0UzwPO0g2q5SE5dVCOuVUkThDnOEVgVodRJIHE10roDqMxwO3g0C1isyiNePa/POJQMoab0xxEPX/2H6mv7lQ4TVBP8ZJWc1VrZGWqJcfn+yu1ZbpDfTaFb4bJ4rbBoNKf++DaNUtV/9PIGvSu+EIS/bgU1CuC1CnDnzy85/Qh6/lNlbwfpQMIyRFHzg7ZDA3xRecct2E3lqe6o04Nwoq1FTc2aKuInho04jy7217QTzl57Fwfh6nJqeWnOQm8hM/OSRrEiRcPqzSSjuWEf+GsNBr8tFGD27hBi0USsLW8kYsvRfjyUsZ7wE6Zjgu7z10lvOuYCwQp7KzdDQt2TUMLaLMY0L1lcrWoYC4bYCcsEJtffiWdeh9Fz/szYLw=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199021)(2906002)(921005)(6512007)(38100700002)(83380400001)(186003)(2616005)(26005)(1076003)(107886003)(86362001)(6506007)(5660300002)(8676002)(36756003)(7366002)(7406005)(7416002)(8936002)(6666004)(478600001)(66556008)(66946007)(41300700001)(66476007)(4326008)(316002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?WesIdf3HwIOzrLIrt/+hEFnaTGpffE1D12UGqfF5YJRIWwfiA0dLzLhsVSqZ?=
 =?us-ascii?Q?Kseqg8rTANheGbbCrPQSV5FTSaxEd7Ipw4vUP3Kby972Q0vWXGUVQgHT9lQU?=
 =?us-ascii?Q?7Che0mqSQb1Y3jJEjJv+N4EaygGF4zCOess7su/zXjn55rphDuTjP51tAPme?=
 =?us-ascii?Q?azB23uItJ8XOftiyu7DDlekUsq6BR18OdlRvT5f6KTXMP6byUbm76azhtsV3?=
 =?us-ascii?Q?GVflfKTvRgVfs+tMobTYN4qlPvV2MJbxK9wtvlzrOlmNASgZWfiCUibvNVj9?=
 =?us-ascii?Q?u32ISgzaef/DtVcAyJ3ny/ERWP793T8Z30JZCaaLrzmxD9LE0+b7ApjPNu/S?=
 =?us-ascii?Q?X38UMl7yNCmhaG4TDBkGpff+tPeO0g1iL/7QzSw3BhYtQvYAXVkKatFsMRCj?=
 =?us-ascii?Q?5RjkAUyY+2Iq9TJBhruMhM3gNa6U1+4tWAxlGfmgi6Af1GChKey2ivcEBwlj?=
 =?us-ascii?Q?ttOchdUuOWlYOHKyszGGdmfZT4K2J0iX09ta1NehkSlKgcCFRdcHTN70T+Sz?=
 =?us-ascii?Q?3vAKtJa4BugorO34VN41s/PSrwjAuia/bXU3vY8NAIZUfAbSgkiZ+5dLBx6Z?=
 =?us-ascii?Q?R44Pt7EotkPtwxo5Wk7zViLoxy6jAucsMCSxBeFnTcquDh3lAU5X75APcchI?=
 =?us-ascii?Q?64s/JhPIKmN5Cpgmt9QloF4WrhHrIdpy8xEPUs8smk8g5NuK0srS0gJH2XiH?=
 =?us-ascii?Q?PzdL0zbYmg/lgra33uWFRfjtk5FJRkeDTeGsrDPZgAU5slqFSjM/LPR4435q?=
 =?us-ascii?Q?Euo7MhNUxNXkPy8KAIqHoazR8rJx5dni3lAV1o+uc9ImBw8J2xBh23mE2wub?=
 =?us-ascii?Q?T5w2tElgk6yC+Nney4e3HpQ71kuoSq0B23C3HQsp4y6vjvCis+WJLcBsa1sv?=
 =?us-ascii?Q?7b/mp1PJHODusL/2Okokg5O5PV8PVWGFFzsyT3kwq6KVcG9BfR6mCaCs064r?=
 =?us-ascii?Q?YdTpnVE8Kw7g+IFa8ahHgkC6UsckSFjf+TRLeYbbDr5gyFFc+h4mM2JTB4Gc?=
 =?us-ascii?Q?1RYCsrtE80u8f7+OedFV464bZTwVsfL9BRf7wxkDGMWaMYUQ4yNmtd2mQ11t?=
 =?us-ascii?Q?Ba4XmqW8HlJs/OqDzYyCngkq8S8ux1f/iclQZ6qfWzsDO5skJszWO5SD7xY4?=
 =?us-ascii?Q?3JP6X+bYggAUm7povvwhrZiEF30ooiGd1Z6eSpZqnAyDTR018cVWL1NuwQOI?=
 =?us-ascii?Q?Ccmp06j8SE5xX0JBMt/tt8euMLr3LTLfJN3X0cAMFRgjIkfoUoLQheg4kW9e?=
 =?us-ascii?Q?1BOzex87jnyKJio9x9REmEbneyJDvWVKuQVWPyr47eGncTYkTwMpgzyCL68D?=
 =?us-ascii?Q?NUrOaqfTf2tvMlZLsz7OViN7kbt9IwwBKj0GUg33mWPJYNuOMf7tC8wMlx3s?=
 =?us-ascii?Q?Rk0HTeenfgk8t7z2uFV0rDEp8RnmBrZyqjqMbjeKVrpy7ukNF4rfJTg5Fh51?=
 =?us-ascii?Q?Bal4uJXxNVxrF6TUQiRca0H1cf3y+dFWNBRCiEdVrhF3HuyWWDxjBqmzVIj0?=
 =?us-ascii?Q?M5dQL/h22DGLYuCub35sUKhQaJxQ4A8NB8BlhkYv08VwgRWLfPgT0sPvTVHf?=
 =?us-ascii?Q?Id4VdgmM2Cpn+5CfeTeR6gS2gfxnbmD9OJQOROIg1xg80VNh7AWHWzUnzLBP?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?Uo8/XpB+F1F6H1ylrePPkdnTMb/cV+VySw5fdrBiRPW262ZQUX7Z3iZUxmZC?=
 =?us-ascii?Q?QVJ04LzbpCOkQfBO0GMh9Xe+AYIfu1tz+KnT9I3oAYks9aSTiq0gbtJJbOA0?=
 =?us-ascii?Q?6fOBstj5KPLmIrRpDMKnwBIi+mDiZxZM3sPtfSH+5/RBq7HILtZRokl9wk7g?=
 =?us-ascii?Q?T9PPvo854nV4bGOLw2bSID8DtHW0GmRWo319UxW0QixZxFG4h3Hd6zXpT+IU?=
 =?us-ascii?Q?9ToDKRKFEx+Ff/t4vpjmk1FI4AaMQdQ+YqeocAkc5WiyclNirRURmvrXEDpa?=
 =?us-ascii?Q?j+AeNRkt87Se+vabb8ttF+n50AXTwkt0s1IVGbxD3hr2UbgXGyH7zJMig+6e?=
 =?us-ascii?Q?1whJgQe1dgdJsW6DW13FBaElG3CinfyW5SERlHTE1hkDtS7EwIq0Fc7EANWq?=
 =?us-ascii?Q?8uaQRgr+BMP8oIuWUm7cKjecaiGs9npuJPu4eIk0nDLfie9ZQayJqqMrOPlb?=
 =?us-ascii?Q?KG6LEm3rjwf4iy2k6fETrWGG0JHihTQPQMFAB3quTJ1e//Bh7N20V//3tu1Z?=
 =?us-ascii?Q?HJbbCfNHpsRyXBk8RUQEr6C/iRCHrTxPM8iRvH8v5kg1NQnKakRDasCoxCWv?=
 =?us-ascii?Q?ZqGxVFQacv6UJZdKjwmx/fDJDN8ILNJZYGH37SSdiWuG/OIBwI4ijtDcENOb?=
 =?us-ascii?Q?Lb/p3xu0MTlg6THdfOpNmRe97k5G/1Aqebj7Bc9OUPB7NP6k7RZBGkkEzSAK?=
 =?us-ascii?Q?GeaHvuNb3fF3TVNToqic/1aZrziOLrSrGU0FvzRa9Um+Eljh5ZTMT8ji8Vok?=
 =?us-ascii?Q?IF8bqygQ4gMhWTQs6jB1Qw3qtkq1qAcv62J9l/j2jqltNgYqNAkY3UQ/tVG4?=
 =?us-ascii?Q?6hTCOWmVV088rQLFGhITL7+KXxMxGXTXdcaBrdiYVKfdGQS/qGqGR4r/qT8t?=
 =?us-ascii?Q?LZPsJlFTsyH0ON06/CptVXCraGm6pP1CDO4hJAqEoXtPuKO6X0SFFVDXF0+4?=
 =?us-ascii?Q?QraqwiVhtD94boExMk6FTCirDPqeBWHFgwD9Jh059mAbLMGmyahFWJDi4d/t?=
 =?us-ascii?Q?/qKVBu2sdZItnfxZz9FqS4ggPtkoDNBLx9rlpxS193FeFJXswecqQyXX2SlX?=
 =?us-ascii?Q?NFHvCzj++Anssz3EIAO7OHYXTqGNkZgK4k9W3MK5LxSKIAYV5pBYkTUOAlg/?=
 =?us-ascii?Q?lTAnja9OlW7tYEEWh95wpHkx5fSq6yoHbzTiuny/Vn1QIcVfscwG1txmpLjE?=
 =?us-ascii?Q?9OLto2Wuy+aoDkhZELZCCuzjIIMFw7xdLzCOzt34PkDgFWBYRpxeMgL1/Zu5?=
 =?us-ascii?Q?Miqv+/HWl/v29CJ0/QG60b/5TB0uj6Hx0FbDWd7h4gMByG5BiSD9edpqwTXH?=
 =?us-ascii?Q?/o6UxQmIJ9wJVeL+b6e45UCBFgxyzGwywJLIhmYQU3nw6AhdpBI5+ATL5B3G?=
 =?us-ascii?Q?qiBOqN1/dg/EnUFSXImKCma8oMkF+JDj8I9HycpjaMIncDQPiCcWGMQXoo8d?=
 =?us-ascii?Q?71widge42kk9pSM3bdc2OiwaI2CnU3fVuQXjfdCJJRu0TkChZiZhOcdqyYV+?=
 =?us-ascii?Q?4kc9+H4wModnhWQafH54D0XsHD3ECQ9kfjJFtIxxczppVEQ5hmZ5MInoMGKX?=
 =?us-ascii?Q?S2r0o6f6WGrJlhFiLq9DGwjJOreZnvFHYpp4+Ot6iBq46HFy8p+qNyHKBtyG?=
 =?us-ascii?Q?bFJvPX8twO1zL/xqGkYr5txMR1fnHyF5boQTzx2DXdJbCr5uZF1U8rEChH9m?=
 =?us-ascii?Q?CaunFw/vZcoSXyZiXHcNHygdGPDpUNaVBl/kP3hUYDkSlrorUD3dXU/YjGjy?=
 =?us-ascii?Q?Sr5LIHIh7wm/WoGkGqcffwzCUIkTkxueNiePPTRAgK/2ZczbBdTvLWnfESM0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	KykEl35OdakgI6ns5P/Cwhnv6Qk3a18Q4q8/yK0rRbN+lDFE8FnYUkKdi3nnDMSXg9HQ453tRUDgdvm5b5G59HPnwjG5RKlFR6k0pUec6Ye87TD/7ABFTuOswP/KNeXxZSGXZDX2W/YEjC+MYumiEGCNLigQnnJze2F7OIML08jD+KxCI6WjQCEVx2Zivl7Js+zdJWrlVrD8dg8yPpfjAq3RiSxTMQLofSOJPiTaQpWkgO2and1jRWIBI2DJo8pB4fZQLJqFxK2yqDPXDT2i7SVF9yBmz4UhKpGAiR4wqv2FkLdjSirVqkWCT+tOq4lnIaXYIz+SF7XxuEH2B1I7ZTNkIpDaZYo+Vti7Ct2bm1zG4T5XGkFzaXBo/k5eJzICmYmbwBvKZ5CYfAoCMb5RuWrf8wEeS5+gd0s/7RyLEOdQdv2d2dEyypx86dJSXKOwju3rQP6YkszM1Q==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d61e4658-810c-4da4-daf7-08db82f35b93
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:16:33.0535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8c8fuAhV+VSriiJME4BWXzw1uxcaweckjBle+PwodjIlqgEZxXVoN5UGGUD9xtrkmmEd1iKw/jklcV3nxy880f0krgqK/U4igPkH0hGo6XA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5304
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_11,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307120146
X-Proofpoint-GUID: yizQnSStLbFgEoH2tyXb9Bx0i_xBKPtq
X-Proofpoint-ORIG-GUID: yizQnSStLbFgEoH2tyXb9Bx0i_xBKPtq
X-Mailman-Approved-At: Thu, 13 Jul 2023 08:26:22 +1000
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
Cc: peterz@infradead.org, linus.walleij@linaro.org, thunder.leizhen@huawei.com, hpa@zytor.com, kernel@xen0n.name, eric.devolder@oracle.com, ardb@kernel.org, tsi@tuyoix.net, agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com, masahiroy@kernel.org, konrad.wilk@oracle.com, sebastian.reichel@collabora.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com, hbathini@linux.ibm.com, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The Kconfig refactor to consolidate KEXEC and CRASH options utilized
option names of the form ARCH_SUPPORTS_<option>. Thus rename the
ARCH_HAS_KEXEC_PURGATORY to ARCH_SUPPORTS_KEXEC_PURGATORY to follow
the same.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/powerpc/Kconfig          | 2 +-
 arch/riscv/Kbuild             | 2 +-
 arch/riscv/Kconfig            | 2 +-
 arch/riscv/kernel/elf_kexec.c | 4 ++--
 arch/s390/Kbuild              | 2 +-
 arch/s390/Kconfig             | 2 +-
 arch/x86/Kconfig              | 2 +-
 kernel/kexec_file.c           | 6 +++---
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1695a71777f0..7709b62e6843 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -595,7 +595,7 @@ config ARCH_SUPPORTS_KEXEC
 config ARCH_SUPPORTS_KEXEC_FILE
 	def_bool PPC64 && CRYPTO=y && CRYPTO_SHA256=y
 
-config ARCH_HAS_KEXEC_PURGATORY
+config ARCH_SUPPORTS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 
 config ARCH_SELECTS_KEXEC_FILE
diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
index afa83e307a2e..d25ad1c19f88 100644
--- a/arch/riscv/Kbuild
+++ b/arch/riscv/Kbuild
@@ -5,7 +5,7 @@ obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
 obj-y += errata/
 obj-$(CONFIG_KVM) += kvm/
 
-obj-$(CONFIG_ARCH_HAS_KEXEC_PURGATORY) += purgatory/
+obj-$(CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY) += purgatory/
 
 # for cleaning
 subdir- += boot
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 23d0fbbe1367..a39c5d03f59c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -667,7 +667,7 @@ config ARCH_SELECTS_KEXEC_FILE
 	select HAVE_IMA_KEXEC if IMA
 	select KEXEC_ELF
 
-config ARCH_HAS_KEXEC_PURGATORY
+config ARCH_SUPPORTS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 	depends on CRYPTO=y
 	depends on CRYPTO_SHA256=y
diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
index 5372b708fae2..cc556beb293a 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -260,7 +260,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 		cmdline = modified_cmdline;
 	}
 
-#ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY
+#ifdef CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY
 	/* Add purgatory to the image */
 	kbuf.top_down = true;
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
@@ -274,7 +274,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 					     sizeof(kernel_start), 0);
 	if (ret)
 		pr_err("Error update purgatory ret=%d\n", ret);
-#endif /* CONFIG_ARCH_HAS_KEXEC_PURGATORY */
+#endif /* CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY */
 
 	/* Add the initrd to the image */
 	if (initrd != NULL) {
diff --git a/arch/s390/Kbuild b/arch/s390/Kbuild
index 76e362277179..48a3588d703c 100644
--- a/arch/s390/Kbuild
+++ b/arch/s390/Kbuild
@@ -7,7 +7,7 @@ obj-$(CONFIG_S390_HYPFS_FS)	+= hypfs/
 obj-$(CONFIG_APPLDATA_BASE)	+= appldata/
 obj-y				+= net/
 obj-$(CONFIG_PCI)		+= pci/
-obj-$(CONFIG_ARCH_HAS_KEXEC_PURGATORY) += purgatory/
+obj-$(CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY) += purgatory/
 
 # for cleaning
 subdir- += boot tools
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 40beaf1f3d73..ab723218c0fb 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -257,7 +257,7 @@ config ARCH_SUPPORTS_KEXEC_FILE
 config ARCH_SUPPORTS_KEXEC_SIG
 	def_bool MODULE_SIG_FORMAT
 
-config ARCH_HAS_KEXEC_PURGATORY
+config ARCH_SUPPORTS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 
 config ARCH_SUPPORTS_CRASH_DUMP
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 9767a343f7c2..fedc6dddd743 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2051,7 +2051,7 @@ config ARCH_SELECTS_KEXEC_FILE
 	depends on KEXEC_FILE
 	select HAVE_IMA_KEXEC if IMA
 
-config ARCH_HAS_KEXEC_PURGATORY
+config ARCH_SUPPORTS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 
 config ARCH_SUPPORTS_KEXEC_SIG
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 881ba0d1714c..dd115571f8fc 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -685,7 +685,7 @@ static int kexec_calculate_store_digests(struct kimage *image)
 	struct kexec_sha_region *sha_regions;
 	struct purgatory_info *pi = &image->purgatory_info;
 
-	if (!IS_ENABLED(CONFIG_ARCH_HAS_KEXEC_PURGATORY))
+	if (!IS_ENABLED(CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY))
 		return 0;
 
 	zero_buf = __va(page_to_pfn(ZERO_PAGE(0)) << PAGE_SHIFT);
@@ -790,7 +790,7 @@ static int kexec_calculate_store_digests(struct kimage *image)
 	return ret;
 }
 
-#ifdef CONFIG_ARCH_HAS_KEXEC_PURGATORY
+#ifdef CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY
 /*
  * kexec_purgatory_setup_kbuf - prepare buffer to load purgatory.
  * @pi:		Purgatory to be loaded.
@@ -1150,7 +1150,7 @@ int kexec_purgatory_get_set_symbol(struct kimage *image, const char *name,
 
 	return 0;
 }
-#endif /* CONFIG_ARCH_HAS_KEXEC_PURGATORY */
+#endif /* CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY */
 
 int crash_exclude_mem_range(struct crash_mem *mem,
 			    unsigned long long mstart, unsigned long long mend)
-- 
2.31.1

