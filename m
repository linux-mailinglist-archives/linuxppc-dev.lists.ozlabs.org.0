Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCBC8B4577
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2024 12:07:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=bRykfyl4;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=bBpFFiw5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VRQHf2dGTz3cDT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2024 20:07:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=bRykfyl4;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=bBpFFiw5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=stephen.s.brennan@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 6723 seconds by postgrey-1.37 at boromir; Sat, 27 Apr 2024 10:51:35 AEST
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VR9yb5ZhLz3cXb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2024 10:51:34 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43QKAHh9023996;
	Fri, 26 Apr 2024 22:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-11-20;
 bh=VRm1zKzOv7prIgOmpi/44BLL96UZGLtnoHbf2/vxK/8=;
 b=bRykfyl46xqS9XdpGt3NdM/GQAzMUbUyZau9uLJJtMEzaD+GXVwiGfw0rqnGX93WPKHV
 aAfyjNYWZB3fXox+2xwdjPzePRpjPjC7HR+aYoHbNnwpd/gFET0lC/Qm8cUzXb66KsIs
 7PtlTfWvWURSCAgioVfw/ZOss7Xa8caGNqTIg7TAr31giKJxKODGnLSOct250e8aK1/E
 qt/Re9FoctMI4L9fMVFW1SRw9F6IVFd1KhkHoLjTsD3yVS/JbPmQ/omEgugQ1I9hOg9S
 cAvS/GG5n4qngvwkEnR9OmWTL3dYyvL65jM0cqw5uUhNMQUe/TzETlmPKSMZZguo4Wzt sQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm5auxc5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 22:58:40 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43QKmkBZ019952;
	Fri, 26 Apr 2024 22:58:39 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xpbf87t74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 22:58:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPyQ1R5QKmSgzbz8kWZ2PQqiNANvZi7+fmwT06qkqyQS0jtptNvD58pDAasINCvi7YjpHc/xIJtj/wubpwe/sWVc9VO0FspobGR8t+wUDs7FM1/qIrr6t0yCj9tCetC0de22Nwq1ELOGjiaF0J/qrbv6QqPnXIyVDtRHEbyjJ4kl/cIW/iLOKEHxZAi53y//eJpcu4C5+OiWF8Qj9OLDxgMx6vr/yjlFVFVJ3pI9FJm3Lorhep73FfjmEFKjTSaD7ZB0v7tqL71tAHDkkr4RDppr6kAp6N16e0Wyux1+pLI0qoYbg0o/SSMQ/Dv8639hAZIWFGXP6yh17KPHZuTh0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRm1zKzOv7prIgOmpi/44BLL96UZGLtnoHbf2/vxK/8=;
 b=Qpya64SY42EYpMuzE8sbNtUBmD5XG1O6yr5d8QDDgiUU58SIErsCKbhoLvEb4Cd06JhaK1419bh7qavTiYecdpLk56XOqi0xNHTkLcckF45A65FM8KLQ6yisFa1apbsBV/nXSWnF48iKnmFsQgJgua+Qf0yDWGNcoRQAw+jY1Pfn9Ni/B7VUcvniwQIaa2qzIuZqHVvUThVOZEU8/ztPButiflRHJW+xy5y1Ob3Y88RPdu0UmSpSL0iT+kvsOvgVTMWoAQuYClxWaUEXhzaL0PyPnMPWLuVyxywaQU9wJwe2MJZK4/owHuzbN5rsHmNYzGGvx0yx8soAsUH7krDyUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRm1zKzOv7prIgOmpi/44BLL96UZGLtnoHbf2/vxK/8=;
 b=bBpFFiw5xqV8LGmYM3hYMxtG/AOKxyTz9X8VTjMC4a2TjyW8WGSgRTOkcyzQkpPTOe4I59nX7unFyAFJzmIQ56yDBiYOHFOLpO+3pubYjVqkevBNiHcqjCOTYustCU9n2RLARa1adw0cdS77Le0uSI7C2pCfdzohPcNmtu+ccUM=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by PH0PR10MB4694.namprd10.prod.outlook.com (2603:10b6:510:3e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.49; Fri, 26 Apr
 2024 22:58:36 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%3]) with mapi id 15.20.7519.030; Fri, 26 Apr 2024
 22:58:36 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] kprobe/ftrace: bail out if ftrace was killed
Date: Fri, 26 Apr 2024 15:58:34 -0700
Message-Id: <20240426225834.993353-1-stephen.s.brennan@oracle.com>
X-Mailer: git-send-email 2.39.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0163.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::18) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|PH0PR10MB4694:EE_
X-MS-Office365-Filtering-Correlation-Id: 82f4d407-918a-4d3b-37b7-08dc66446771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?kiCMIAoLbjCryuphqnVzdcFEGgO9BR6e7/V0caAn0YoJe86Np/gyco791tIH?=
 =?us-ascii?Q?283aSUsIC+CuZQme3ucFRZ7+EYYl5DFqcvc9loDxB4UeEU6tgH3NnkvmD7LY?=
 =?us-ascii?Q?WyqUzqeYRAJEN9VGc17ykW9gfQLIyBuH88ScR2kwR5HYm/vDmDRaHb2JZVpO?=
 =?us-ascii?Q?40TZlkSPnU22mlgbKjLDHJL/+27vun8QTKc39lsC2aKNtPYw5sLjex2cV8qh?=
 =?us-ascii?Q?OPyFEGdKYi3Eru5b5NyOqRazDmVEkIRUv8KGzjHIvWPYeMxMpndAs72s3v03?=
 =?us-ascii?Q?ZuO9R1ANfI7FnJoYHn4YpYICjTdJx+pVFmB1sgI6hVELKb7wmxnaOpI54Gr/?=
 =?us-ascii?Q?Aw7HACYu0CwEotMCJDoTOFZqJawhYZ1rlEKq2+QyYUdOE4D5w5TKNnmyrDpU?=
 =?us-ascii?Q?EOj4fZQJCjkwOgI8RDIaVxeUtLeaH9wOIHfiSiU6L7o5BQHAw1tIeL+5d4u1?=
 =?us-ascii?Q?W3vdEX3Q559F7r75U4gyQhxDRIljE3u13XbHKlpuPDN7oUS5rfe7vPxnfhni?=
 =?us-ascii?Q?g8gksMY3Lqcon2TKx6vOEzdLB+PKYeecKu30kYjNxNc8w0FR8MLmcH2byXRf?=
 =?us-ascii?Q?yosTdJJeqZd+cU1q5bv11Q8YWCUoMKEZY/UHFfcE7UJqpENNL7wcM2JDD4Eg?=
 =?us-ascii?Q?NvdJjB2y1NP/CxHOB5Mok7zt038SI24TtAyKJarc8lNShaWqa1GwPxFGXQux?=
 =?us-ascii?Q?oZGoV5xPJ2T8CxkN+WIb14LTJj2Gut49vfyofUh2JcFh3gsPNQb0D5L/ZTDx?=
 =?us-ascii?Q?8j7AzzZTU5Jf79xx08R7xH+BHen5Sf2SzDVncC9MFpz9IylF/XuI5ljB+Lmh?=
 =?us-ascii?Q?37VjdQE1HOT/7k2sxLLUY7XIwuiG9eSAaJiuwxLZHTg3sc5rtIanyANmUptD?=
 =?us-ascii?Q?mESXLBGsYoA+vnyZpTYKIc+x6UT6kRSTZSljqxxCMEKZcZUO7W1FoZbZPjyf?=
 =?us-ascii?Q?DTCEzWuw+fanOlgAJ3SbRwVe1RMUpLXx/kWMIGE9rXsVDibu2Y4UR5djUZ3T?=
 =?us-ascii?Q?UDyOLx/BWu46juh18UB06UbJO1DgcDZwFPOCEr/D7rW49FrP99pLyTfO6vkA?=
 =?us-ascii?Q?Z4kd+rSBkfmK+WJMq0PZeYvqqR8gnXWGN+BFnbAIspVhfpYXxdZwfI9rs+vw?=
 =?us-ascii?Q?KyN3jokTlIxib25+ZklT66/As4sqQS2U2nEhNCe6W7is8u9hxqMBwH3HgPGp?=
 =?us-ascii?Q?fMhipWBMvcg5uHxKDbSLBku6aC810eGlUALf8zWrqJ9hYfeummcC1pBVli5r?=
 =?us-ascii?Q?zQ5j4lnrHPPkY5j/x4+NTfvim8MFYt9NGMfV2Ke9tg=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(7416005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?OtntTy/q3TAp3XJSuHDAJ5hvhjPYkHHomdTX/ZfGUwTXPaSKeQsgBhyPRZLI?=
 =?us-ascii?Q?Tee/JiULTV0ewYVbANOSWh2Pw9mn39SiGZAOHQdj9OLUrsWvcnSLsp7XUubg?=
 =?us-ascii?Q?5EB9LXfNprWEMGHmjM/lLcL28OtjYSg/aDCk7QXa0RAJkABcPo0ISq4CXSsb?=
 =?us-ascii?Q?2WakxV58GL0/mh7o58nvrYhAxB0mR0tS/zZgln3xe8vC0X7MUhZSwRQ77GaS?=
 =?us-ascii?Q?FbPgouYq0acuHl7WFXvS1e8lHVAHiMeOypOgodqYPKwH43x6wGLEDhJsmobO?=
 =?us-ascii?Q?9Uuwkza1oXD1XRZUj8QNZYz0AbkGPlnFHOM9xQ7pUFoF/vGTx3LsbSWklgCQ?=
 =?us-ascii?Q?/09I3e96/XmW4tfK7GEsec+h7HHIZ5mqCmJPCC1fjtSsuxt3mraFwVMCaeVH?=
 =?us-ascii?Q?cT0P6CWv6HbhXC/slJ8DRfymkAwHI2/tpQH4VWtG5lPGKHwrmKVmbf8gDlbe?=
 =?us-ascii?Q?2Hu9An80pPmFz5LLCk/EMO1Xe8sOrKOqV/LDQKlta1oIqMYscV4pS2LMrLpW?=
 =?us-ascii?Q?p/3on5EMmlC9oodnUsvrcqtrJLRhCjphIUHJ4N719gPIOpu7/YTHkCn4zb8s?=
 =?us-ascii?Q?7P6clsHLNVNi2UupGR7VYzWCJ/xdq2VP31mmkr35be2Q0QnyYke+3DiXTOhK?=
 =?us-ascii?Q?I4gA24JEnRMNbZ+vlrJhQCQApsNUyKNxek4XfzHW0DeWDcvhhj2urPkqCObo?=
 =?us-ascii?Q?kWynHJ0hdWpE2y+hGFqKeIqQJ1aEmqomh/g90cnA+7pMB36IjvFOfNi7LCjI?=
 =?us-ascii?Q?h/TgdADav1EFUyqzrPMa+8tJ6htlW3XoYCz9F0KL+FaC8cpKORjTDXKDAEAu?=
 =?us-ascii?Q?fJhbQZC9ItfzFhwUdO8fRaPoVSJFL8oSnsP/9vIjeNS8BF4wDe8YeqiO5Ez9?=
 =?us-ascii?Q?uuLSCiBhR8OyJqdfRgoMrFnz0b6i4qcFOp0HdpRtaUJgY+OPDhXaDnjf5S09?=
 =?us-ascii?Q?gOQgFgD5whyeRf/ZU/DyZNELY5Ei4iH4aBn5+VLjAYe5PNVqiPWCGY/nxxTC?=
 =?us-ascii?Q?gPfdlQUP8tpekpCGhCveSa8dqgksldGDjznmWvdC7oQfenAHCigmWs6GoAmo?=
 =?us-ascii?Q?aSbixke44yOQFmjud8WqdN5jUMGAtNKk2YiwSFt+/+fM98Qj1nlEjRsgO8Em?=
 =?us-ascii?Q?RnevgbdXVBKjuidyKMckvblRuIZRC2D4oxzPSuDmZwF4mKAKLdN05q9XV4dU?=
 =?us-ascii?Q?4uQmvbEZRIPO5C9xoefkfjx3dP1htlq9481yqQ2PrsQpGpFYQvQUk4Ru1pgH?=
 =?us-ascii?Q?YVci25vQ0skXUhKNtfPwVR0tDi9Nixxl9ikekzaSFyAnzHEx0iXdXlvBK/cQ?=
 =?us-ascii?Q?k0G1LrAsDjpduM6/oCt/hHdcAMOBiwNkJ8MT6H6X7912KTBnMzU4dag3L+9O?=
 =?us-ascii?Q?2KpQ1vvUTCnxCMC+NFe8MM3a7P0jveocHTt/yQkbWAOEqiIjX5DYqeFWqc8c?=
 =?us-ascii?Q?WdlJG4kCUtXe7FjoKBugtYSK9jx68FXhKt/n3RzNQIFt6987xQeXMMH3wpBi?=
 =?us-ascii?Q?1EvLnHUlbY0JVmH0+YMm8tB/iYY+wf026yqiCyrfzWJtE8Y12hdgsGT45BJv?=
 =?us-ascii?Q?PV+5/YIorLROz3KrYw/jfRj/rjaRUgUFZ6i73yJzbNOVC56c9WpLOv6+CInA?=
 =?us-ascii?Q?+IzPBULC3xYnRgSuTrwgKPfLNxbaX5G9w+7IGCpXDQOK?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	SOHR4gdaNtawl4FvMiQL1rc2NaWWn41z9l41EXIecoz6lVe26nDWoF4fNbCctyjOZhXF0P6si92UHSX8D96lItbx4+WP36OckSnPuxhPK4Yz77D2q2nGD9vF8DpyYpNt9Q9ZW30HC6IB6tbvlm5RuZSE6yrsQDYG7qr8s1Ws8z5nOXTUezEoNI3oZ9/boY0DCU20AaOWKArc7vfErHycTeFE9cswRTtSl5laCPcrEKFng2h3BUuo8WvJWRX5d20wkQ5yTNKGvQWXwUcuuUA8q2ZyuXpBWDcPOYCpFHx2VZ2btFPR8TcrioKI1yPtPlwJ2DN08ZDnykAGcE2VSHcaIuWlNlCt8RIzi0LBT1BBPXebaCe7wL9EgOfFL+/Hw93ly2x62dPzfMb+SV/ST0vBo3AyIftAl8u016ot0sZZQBsETHdOdGJYGw50iBYdyHWLTOEpeDI0X6Erh2apt4c9SkxCVWDjgFmpKDLzkDc/iGaotxd0LRjMU80RB8Y+fVMpZqu1eWHtib1CqtL+4ofotFjtM53+I+eNAKHG3BHaGpb04SLcSV3eXNEwm99cGqFvkKlbv0xHFqmRFPBgz9T1IOZsw+SV2ij+GSkPQosz1kM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f4d407-918a-4d3b-37b7-08dc66446771
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 22:58:36.0451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSufLIgt81kX+GNGVySU6FcWSrX5X00hqI4bjZu3MN2kkCHpS93gqxmKySbQDLW6tQSvJEOaWSlaltwNCLp2Fv69Rh5VQ8ZIGgB5xm2bFPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4694
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_19,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404260162
X-Proofpoint-ORIG-GUID: i7bkeQEuAMyjOs69euwXYi6ZPc0bR2NI
X-Proofpoint-GUID: i7bkeQEuAMyjOs69euwXYi6ZPc0bR2NI
X-Mailman-Approved-At: Sat, 27 Apr 2024 20:06:33 +1000
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
Cc: x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-r
 iscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If an error happens in ftrace, ftrace_kill() will prevent disarming
kprobes. Eventually, the ftrace_ops associated with the kprobes will be
freed, yet the kprobes will still be active, and when triggered, they
will use the freed memory, likely resulting in a page fault and panic.

This behavior can be reproduced quite easily, by creating a kprobe and
then triggering a ftrace_kill(). For simplicity, we can simulate an
ftrace error with a kernel module like [1]:

[1]: https://github.com/brenns10/kernel_stuff/tree/master/ftrace_killer

  sudo perf probe --add commit_creds
  sudo perf trace -e probe:commit_creds
  # In another terminal
  make
  sudo insmod ftrace_killer.ko  # calls ftrace_kill(), simulating bug
  # Back to perf terminal
  # ctrl-c
  sudo perf probe --del commit_creds

After a short period, a page fault and panic would occur as the kprobe
continues to execute and uses the freed ftrace_ops. While ftrace_kill()
is supposed to be used only in extreme circumstances, it is invoked in
FTRACE_WARN_ON() and so there are many places where an unexpected bug
could be triggered, yet the system may continue operating, possibly
without the administrator noticing. If ftrace_kill() does not panic the
system, then we should do everything we can to continue operating,
rather than leave a ticking time bomb.

Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---

Apologies for the wide net cast here. I recognize that a change like this
may need to be split up and go through arch-specific trees. I hoped to get
feedback on the patch itself. If it's satisfactory and the architecture
maintainers prefer it split out, I'm glad to do it. Thanks!

 arch/csky/kernel/probes/ftrace.c     | 3 +++
 arch/loongarch/kernel/ftrace_dyn.c   | 3 +++
 arch/parisc/kernel/ftrace.c          | 3 +++
 arch/powerpc/kernel/kprobes-ftrace.c | 3 +++
 arch/riscv/kernel/probes/ftrace.c    | 3 +++
 arch/s390/kernel/ftrace.c            | 3 +++
 arch/x86/kernel/kprobes/ftrace.c     | 3 +++
 include/linux/ftrace.h               | 2 ++
 8 files changed, 23 insertions(+)

diff --git a/arch/csky/kernel/probes/ftrace.c b/arch/csky/kernel/probes/ftrace.c
index 834cffcfbce3..3931bf9f707b 100644
--- a/arch/csky/kernel/probes/ftrace.c
+++ b/arch/csky/kernel/probes/ftrace.c
@@ -12,6 +12,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe_ctlblk *kcb;
 	struct pt_regs *regs;
 
+	if (unlikely(ftrace_is_dead()))
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch/kernel/ftrace_dyn.c
index 73858c9029cc..82c952cb5be0 100644
--- a/arch/loongarch/kernel/ftrace_dyn.c
+++ b/arch/loongarch/kernel/ftrace_dyn.c
@@ -287,6 +287,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe *p;
 	struct kprobe_ctlblk *kcb;
 
+	if (unlikely(ftrace_is_dead()))
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 621a4b386ae4..3660834f54c3 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -206,6 +206,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe *p;
 	int bit;
 
+	if (unlikely(ftrace_is_dead()))
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/kprobes-ftrace.c
index 072ebe7f290b..85eb55aa1457 100644
--- a/arch/powerpc/kernel/kprobes-ftrace.c
+++ b/arch/powerpc/kernel/kprobes-ftrace.c
@@ -21,6 +21,9 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
 	struct pt_regs *regs;
 	int bit;
 
+	if (unlikely(ftrace_is_dead()))
+		return;
+
 	bit = ftrace_test_recursion_trylock(nip, parent_nip);
 	if (bit < 0)
 		return;
diff --git a/arch/riscv/kernel/probes/ftrace.c b/arch/riscv/kernel/probes/ftrace.c
index 7142ec42e889..8814fbe4c888 100644
--- a/arch/riscv/kernel/probes/ftrace.c
+++ b/arch/riscv/kernel/probes/ftrace.c
@@ -11,6 +11,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe_ctlblk *kcb;
 	int bit;
 
+	if (unlikely(ftrace_is_dead()))
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
index c46381ea04ec..ccbe8ccf945b 100644
--- a/arch/s390/kernel/ftrace.c
+++ b/arch/s390/kernel/ftrace.c
@@ -296,6 +296,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe *p;
 	int bit;
 
+	if (unlikely(ftrace_is_dead()))
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
diff --git a/arch/x86/kernel/kprobes/ftrace.c b/arch/x86/kernel/kprobes/ftrace.c
index dd2ec14adb77..c73f9ab7ff50 100644
--- a/arch/x86/kernel/kprobes/ftrace.c
+++ b/arch/x86/kernel/kprobes/ftrace.c
@@ -21,6 +21,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe_ctlblk *kcb;
 	int bit;
 
+	if (unlikely(ftrace_is_dead()))
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 54d53f345d14..ba83e99c1fbe 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -399,6 +399,7 @@ int ftrace_lookup_symbols(const char **sorted_syms, size_t cnt, unsigned long *a
 #define register_ftrace_function(ops) ({ 0; })
 #define unregister_ftrace_function(ops) ({ 0; })
 static inline void ftrace_kill(void) { }
+static inline int ftrace_is_dead(void) { return 0; }
 static inline void ftrace_free_init_mem(void) { }
 static inline void ftrace_free_mem(struct module *mod, void *start, void *end) { }
 static inline int ftrace_lookup_symbols(const char **sorted_syms, size_t cnt, unsigned long *addrs)
@@ -914,6 +915,7 @@ static inline bool is_ftrace_trampoline(unsigned long addr)
 
 /* totally disable ftrace - can not re-enable after this */
 void ftrace_kill(void);
+int ftrace_is_dead(void);
 
 static inline void tracer_disable(void)
 {
-- 
2.39.3

