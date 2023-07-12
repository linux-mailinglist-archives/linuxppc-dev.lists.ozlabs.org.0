Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8E2751396
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 00:33:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=utbRg5+w;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=sET9/FIp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1XZH6Z4Tz3c9d
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 08:33:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=utbRg5+w;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=sET9/FIp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1NCk0f6Cz3c0n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 02:16:33 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEiFDm013657;
	Wed, 12 Jul 2023 16:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=/bG9LRz5xZPxVT+ts8yoyGN4FP/5afbOMvV2iqrx55s=;
 b=utbRg5+w7KN6683dzLvPala/54/8Nj9aQmvdmLrS7/xqyMTPBZGXeMbgHcMVtqnqNatw
 Li4Y/CvBjSerRydobowPf5nh2nFD6sRKPqRviN8ZAGpkICAHLvLYf9nGsS0Ifj6/ud+c
 k+o2r+QqhfVh+uplhI3EcV4sDGsf8EL1imalNFWY5fN/5VVDArimew9YI9c9ZqObAfi/
 pdo0AqSEXcAxXF0VyPdMDI3h7AO0gMdj8XLUIPuSWvQ9vtFhAPiTwgdw66r2jSSeHHed
 pOa+1sFoGqXmmcPxSI0oZNuN0sDDorqdp8dlJWYhyUF8k8Mks3Q8XKZE2p8ReGPt9wn9 BQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rpydtym9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:16 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEuuQo026909;
	Wed, 12 Jul 2023 16:16:15 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rpx86ubjp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQhJS1hJ1el1GXaPh6SNp+Ovsdoo4+NvzIWK9EwRANVirpG2UCFD9tJMKs89zL1u3pdu2+G+FpiZfGZ1NdGre90up8Kb9YL3kx2NNAzXamMxrOIn++4z4TCp0RezznPv+BGPCeyEyGFrnQkBz3xsTvAxCVG3m9vOxXv85uMoPKiR0MdRgGcGBNwqs5d0Xh0JIILHU3fNbHQlqVTuDI2cJpKk3bG2v3P+PMStjGoD98N0qYcH5aSAVWpi2jFg7RUPfPhH5L7BwfJtihlvrWU+NbpKoBRTn7LiT7R30IdMlsjuVFDec8/6RY2lRj/wgzga0jk0IWZgXKOgaKRz2ltboA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bG9LRz5xZPxVT+ts8yoyGN4FP/5afbOMvV2iqrx55s=;
 b=KhMqsg8SqCjlk89ZnhhC0y+R3jwVf1RW7DodXbsBA9nKTH6/0P1TYITrcu0cyg8iVdGb+/ENqUXDYYnnfzlyilytyscpUz2NgN3t0o/haYp0n11sMSfDB1b1lEVLDdjq8425EHA5MeWSKSM0FwbqGKH8hUIYUcOoQRnd7+qHpqeaF18R+J0AGTQ/UAI3MkmtcKBIsMG1MgEhAW2OmMVDVqNU0LgLz6EC0QTwIQfJAjB2qbG/EYBBT6lzMt34MEsQTsocGwn0NXm9RI0w5xxFdMeI7bJdq9RWe1q4CovYvv/Ff92yuMXgp2fovRCxzoUJS85vrjVXSBhvSfi0q8QWwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bG9LRz5xZPxVT+ts8yoyGN4FP/5afbOMvV2iqrx55s=;
 b=sET9/FIpI3AddNWRBTk5kFUuwRqYvXYeV4GPgLNLY1CwTKc5Z+Sp7lNllQ64W8MH89N+z4C4KMZK9T1vH5R26eNf14T8G9wpW7kKhqwChoOJM4td8Z7S2MG/ji5npHMn9otWKkFG6rh6UMKa0xBLBhRhdSGrOL0MrTksnv6IPag=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH8PR10MB6501.namprd10.prod.outlook.com (2603:10b6:510:22b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 16:16:11 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 16:16:11 +0000
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
Subject: [PATCH v6 06/14] loongarch/kexec: refactor for kernel/Kconfig.kexec
Date: Wed, 12 Jul 2023 12:15:37 -0400
Message-Id: <20230712161545.87870-7-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230712161545.87870-1-eric.devolder@oracle.com>
References: <20230712161545.87870-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR11CA0027.namprd11.prod.outlook.com
 (2603:10b6:5:190::40) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|PH8PR10MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da38af3-5854-4edf-dd42-08db82f34ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ippvU049XKQw7xyFMuW8RfSZEQ1uIh4GHykRG7G2Fwcim47QYKGncJVRKznL0eaE15ftUgIsq+BdVVYAsdvN2RgNLMGsqd1OJIOqASrluJMYbM/EUixCH47XGqBgKMCN8/4lkHpN6mRfXWfZdSSWbrnZthBI1OYGjfSnlqmloSZeVA4r5ZAEVQhl0nD5NDM0udB4/wxSPAIrP/DO7sc/0FVTi+smFKAx7sw0vBvXEnkTHzRdZLqEINA/Y6S/niC+MrxbSKKCBWfs2cMWHy5YuMhrN9YL4R3/fcatV0HJ2qiJyCvl3lzVlrW+TOl30iSgFRAYXZmUzqn79bm4LvdQBiTQWilwBoHBDLBcpHPnq7xgajfyEFctCyZjQMqgIbxgPLI8J9sfnVz9gJfir2jj3pEoqroCGpEQG2ZNIxjfdwyTeXK/7GPE0Sqg56S98SIxCruIZW+luBkNmD1RHiAfps9p9yEncJ8YmOXzbMO4zQGnQd2zQJdyGMwMHp9hYPe3wAtQVLQZVjwT+1wYz9E4O3gfEGjHmsk9XO8EiNeeb/0iQ+XWd1xf/sVpo3NBSOYB2S8/uAO6qfkrI/EHs8+8vLaEj6yct2TmlRBkMCVeOic=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(38100700002)(478600001)(921005)(4326008)(86362001)(6666004)(66476007)(66556008)(66946007)(6486002)(6512007)(316002)(41300700001)(186003)(83380400001)(2616005)(2906002)(36756003)(8936002)(107886003)(8676002)(7406005)(7366002)(7416002)(5660300002)(26005)(6506007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?w74Vmcug1+OcRrBQy0ubQ0coL2UDFPF+bdo+Eif4xfPY0gAUaGrxVRV9VCs+?=
 =?us-ascii?Q?nVtS9BEE5k5lvWa91ujTUSre7aLuQsr0+CuwldxmRUvIePd2j5tUnMdbLB0x?=
 =?us-ascii?Q?u5Klh9lLjvBlTMVfbvpQnE6MwPJk936NmcemTd4YPeoLGTD9CaU499puNZpx?=
 =?us-ascii?Q?30wyJQHQ1Ih12Ihr27NbSZKMgAZvaEPti8UJjAs2ZHK/EEsEQ5OkrjTBFnth?=
 =?us-ascii?Q?ZLUoukt89FOOSILVXtbM/n6ZCHMXYQn1LF+4T2+iN993lN5ofqcOtlFImpn4?=
 =?us-ascii?Q?a6lW1278Vlc0S/wCQOp9DDYQ3oZxqRjTAA6syeXug84Vt4NUDBhHgtI/ql+5?=
 =?us-ascii?Q?Ixmh1tGDEE9UypT6FJ5DXwzZ1lfc571Zet/zcHGy70FgDdtHEuGkSBy1Gmqm?=
 =?us-ascii?Q?iqkqdBC/mlRB6cVSXqXiTaifWq+xyyjUfptU1DWgtpwFJXWeJx6Ir082wmn1?=
 =?us-ascii?Q?vA6/9t6wE1QddKMuR6+VTIleHDCfLI6k8Ad6zdjomlMz3PrRwh8nCczGY/sQ?=
 =?us-ascii?Q?hpbug9nilRqCh0/VYIhf7y7rICzUR8S75a0dFdrVriqm057vpEJurz6vdLB3?=
 =?us-ascii?Q?YNTc32EaPJFu+p+tcLIRdIHu5RV1IdzUopfoCSxWVl0BOrQq0uWPdhXGJJ5g?=
 =?us-ascii?Q?ceKQzzLRWhmVJKPt9ELvx7YmK525FDkL90SVhQOEopkDDdl4xI343v/qqbEB?=
 =?us-ascii?Q?TDws6m/oFqcAOBf/U6khXmCNqQX4RrZooIjQWnDhsZtwv6JouDRqVi2AsEC6?=
 =?us-ascii?Q?LKm69uey5wPZA+28B2L/8N3wOefiHk+ZI8y6QSDupuRh7bRis7LbsOJJC8XS?=
 =?us-ascii?Q?rqpJoIh1Uf1ov6wotvJIMhV/2an/MqAJeGDvtt+/pw57xBOxX09fnuxqbP9B?=
 =?us-ascii?Q?cDFpwtNxS7KwhRPWPfrs2/HCR6/Wg/WzkSgrtrfLiRnq1g6ZI7mU1Uy8WU3U?=
 =?us-ascii?Q?4RgVRuKAOI9ckQAjjNKZhBunmt5HwOTUiW0C41fIOMsljOMYnN0U605Deu7g?=
 =?us-ascii?Q?uILOuPiluPrRxxN/hdsmh1TfW+qaBcB/iCBPj7LiP7hr6clG6v2qf2OgrfOf?=
 =?us-ascii?Q?Tet4HNOMSTnwALcsMJHq0kkI7OAeiJRvCLDhGhr7VxV6o76yNg/K9/s2sp4x?=
 =?us-ascii?Q?HmXVTbjtHqd7H3MYK01pAYZIM9o3KhvlwRwv5iCX9KEAZtFOG1yzlGbS+Wu8?=
 =?us-ascii?Q?/Noe2eF6NGOCyhSpGGsXsSLzPLmb3iLIsn8mXFAMt8zzFzBeJhYw9tOhUVP6?=
 =?us-ascii?Q?cmgI/CC3ej2niQFqtS0m2J+1VurQ2B5Zbcxc6qp12m6+3bAk2Fg/OZFqqjBf?=
 =?us-ascii?Q?4jLWoFzxgU6ikLU+Vwc+4UN8C+e4yp3zXzkYVcwj+FQQYcnZAjyUHMC2lz6V?=
 =?us-ascii?Q?Meliul6JAQk8VnoJiVAoHVag5siQ/ye/bGg/nn+sc9rcthPUUZ23aXtx5N7e?=
 =?us-ascii?Q?GKUoAqx5NQWniCmKVz4klKZhY26DDkLic87R6pmA+8/4rbyg2q0gU4TEuT4O?=
 =?us-ascii?Q?Rz/8+5KqqXj+H2ckCaj07jEuJMiHfIrNImOYzj6TfF37HQ9nuqJdzm0uIY76?=
 =?us-ascii?Q?v9tbOPeDq86L4zgXOD7iYDgjpmLbKdlrZMbi98nHBfSdNs3GNCboyb7jszpb?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?wUuedGsEYpRLp9Ho/8xbxFEe1eLbblgio/mXscZLhteZROovSnpDNKAMtZUO?=
 =?us-ascii?Q?UhYmFD67YZc9HtMl/aen4RVPKepVYHK01X6XwnRMcAavtQDRkn5yJ9RkXTrl?=
 =?us-ascii?Q?8MqtK7ABVKBYXpTj0aF4CpcjzU6+cQxwFatpJYpsYRsojYWLLqkCoNe1ruHr?=
 =?us-ascii?Q?/4OskeXuYK44XbSL7Gewko1A5Q72xn8BupHWgtPZZl7dizxr1BAtFLjejAog?=
 =?us-ascii?Q?sjTwNrbTKiKKYYdqHsqDcgMYeMLS6AhxGmoPggDhPrKPpBzaFW/Zt3osb8Xq?=
 =?us-ascii?Q?qtjZJ69x8m+SmhpsXuNLm2ghf0vY/M84m2nYzymnmXJb/gOo84Ve2tlY7yWY?=
 =?us-ascii?Q?+hZALeMARPG5G6KOqpwNNABjfHjGoXiFMVxa+1KdkJLwRKYNwJJ6O/NorqRY?=
 =?us-ascii?Q?AUR7aKeuArGnGfL/UUuRY5m3Mlb4wXr24g0gxxc2ktGX5HN6jmhNrRaPjOkO?=
 =?us-ascii?Q?vEA7xe1wdt7QSiUBGqvKix24zyTCOZ1eT7/C7TaXiWvo68QvmToulm8SE8UB?=
 =?us-ascii?Q?gqcEnvilIepo3T6tyfG8HfeOgl6HlzNvUt7aqnCDUrzQnpZFOv5GmbhSzACT?=
 =?us-ascii?Q?IMDrc97lkHXrSZFWmbHIINNo0Qp7J+jhef6IYaY3kOv4/wy+VWlPom2aNpOw?=
 =?us-ascii?Q?ApiT0ak0gjVM8P3bXTro1xmQ43oa5SKyeH+zG2aGrap5hz1AHzYzQqNtu8pc?=
 =?us-ascii?Q?cHXi0gdJeLMXuddq69tDddYmZ6qeJrUaz7QIoL+qYD5ImbgQKjZ8M/V+nBXB?=
 =?us-ascii?Q?iAAIvF0VyKXma9uxPGTHc5Rd2oQvFCOncxOT9VReK/fb/xgwb+OOn1+0a84Z?=
 =?us-ascii?Q?44ADLM7s1VkVXj0Qt8+8+yEuBVT/wOHW2HrUTsmOmOa0UkjBf9dBpjKIXq/Z?=
 =?us-ascii?Q?jCdybRO8d9YMVaNxCTlpV+OrKHNK/1bI9+o6xNUHXlWB45ClYyIy8ljkjG6z?=
 =?us-ascii?Q?BUulmqbu+e9cFS0Ry84PbHOKkqJQF9WwjGNbL2lv9nuglpn02ZzVrhU2/0x5?=
 =?us-ascii?Q?XQdVCDcOdcKh8gCGXLmm9SVz1QuhKXEZT/OnwxAqyzUKYk8Exs5wkCo+S+Qd?=
 =?us-ascii?Q?XnE9WEdY+Rt6GpP2h0cP3f3ORdSYhJauCpKrv5kwxakC6gvJNvQsWd/F+D1N?=
 =?us-ascii?Q?+SyeA3sO+svyklLSLEZivimcuqal4Y26GOHa6ySHQrJ1IdfJV/smp22jqS0l?=
 =?us-ascii?Q?8WqgMACYlp+F9hUSbx27BOu6Q7cjJ6EpazWeqrsk1+myh03FsxD9XFyIQHz6?=
 =?us-ascii?Q?gLLOd8xDsZX4NePLNISKJF7ETnNo26Gc2KMtaP8JHwpSeGuU2eKel9ebvtnv?=
 =?us-ascii?Q?V8NaHzVeBGLcvgLV3fDUEqLaOXEVJ1LaMXJePQF5M4gBA6UntfwJr5M55MEn?=
 =?us-ascii?Q?D4Bo8hYrNC5GI6sYkX4VSnn0HLzx23iDvjdzM7ATctMvDR2lxQxp3TVqquU9?=
 =?us-ascii?Q?5qOJHUZJ15vRx8MQSdi2IQKR8N4iabwKzKlKoKyodFMkjcE2j1fg4tdcuU1N?=
 =?us-ascii?Q?mnRiUOO7vX0DViA34aAxVx4c4m07otD5I/1w4SBU3ZxA47HwYJ17JmmHlCCx?=
 =?us-ascii?Q?q8UVmR2qp9V/Emcm7ayLbHJZ5hhY9AeBd8P/eXaj3DqTGXc1cFXIajxmJXii?=
 =?us-ascii?Q?1i9D7Wr0GWcnHZwxgwHfOly1MkmN5n465F2nlnQ5yIzR7SiCujTgLBf3FfG+?=
 =?us-ascii?Q?lNin+iieDugT/4FBybHwT9DFd76Vm+kNcLMMN+qc7iIMoS7peRZ5wRXaJbVn?=
 =?us-ascii?Q?lwv0AaQr76F+3cObStArUWmXhdCOXwa7TbAMazSN4TPzE074EHJytpI6ccrW?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	LxExf8sIAOTx+/Qc502i9lqOYPWoe5L4whMfc516GgUH3A6Gz1u3FIU1rJQlxkxDuqPWBPHWm/O6HcJEr4z4NKfn9m5xI2sOqO4cOI6xBnCfS7z0LUyKQwzOz77NG8TfS2QBjvvUHZDEWao2939DP1d943xB20kHCtP5o4VwwGv9WcPFam4Mkj31sFvl4/NYaNSRUVoqEFt1kmuDxOzOrASF+VKQswFNZZ2bpwMDFuJLQpo3c7hgQSMmuUPIfEggY9APOXVMz8QUIUvbLRwkBI/h0RqnZTJONhltaRBqrvBNKjciqzCdBh7tkSSCsOn5+KseR2lDWJxxMe/2+CEUAcfV2vS8qu7v7YgG9oi4AS8ZVnQlO+vVILjrDXVqq+mo32DRtVz5cqeSBlQaLjN6/ioVtA0omecIvBGQLnA/J3gDbW/RwM/DPONen6GashHtWJii9hIMhTCzEA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da38af3-5854-4edf-dd42-08db82f34ec3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:16:11.4481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPk1EQ3Edh2K5BiArrxc2Z6MQOXmUxSTychAXvA5/GtW7G+nQC8wyJxSkAuthqzs0lVmIf8hxEshbsVVExqhomRq5jEMy2rKBhWFqo6TP/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6501
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_11,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307120146
X-Proofpoint-GUID: sEwnJ3ow-AHL7s022FOia7qaBuaSLQkV
X-Proofpoint-ORIG-GUID: sEwnJ3ow-AHL7s022FOia7qaBuaSLQkV
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

The kexec and crash kernel options are provided in the common
kernel/Kconfig.kexec. Utilize the common options and provide
the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/loongarch/Kconfig | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index e55511af4c77..397203e18800 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -537,28 +537,16 @@ config CPU_HAS_PREFETCH
 	bool
 	default y
 
-config KEXEC
-	bool "Kexec system call"
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
 
-	  The name comes from the similarity to the exec system call.
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel"
+config ARCH_SELECTS_CRASH_DUMP
+	def_bool y
+	depends on CRASH_DUMP
 	select RELOCATABLE
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec.
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
 config RELOCATABLE
 	bool "Relocatable kernel"
-- 
2.31.1

