Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42463736006
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 01:13:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Ie/kr42Z;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ZMRGYmq4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlQXy18FTz30fy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:13:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Ie/kr42Z;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=ZMRGYmq4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlCZh2JqLz30Ps
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:58:50 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J9nTMX029345;
	Mon, 19 Jun 2023 14:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=INO9jwnm7sy85thqLZ7evmCj4T//oZgOVoVhGsr8Lhw=;
 b=Ie/kr42Zfj3pe47GKxAjri/uC59bCzESuI5u41NVPQ5t7V7VeRprmLipErk0DJlk292z
 ExuXLWEVV+SRSdlDn+xczREPQRAMutYd48/zedEykZhw/wRGPNbhPiuuHThaZhTjL9j2
 nSFBJg9unTU/Uj/MQnohBt3grldq6Q1O5EYV1whjecpSVwDGOml02kVxToNKpRxt/JwL
 LzrlyoiXBfnP4GW1eH4KgOCBs3ikpjYwyyO6eMxaV1sN1d2HnZbRQzKgu4NNHagLdfED
 5tZw16mKtZiPcktTGUodtfBfttW/hynZnFJV15mgHeBZl4uOjC4M93uFJNjIOygeSh/E kQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r95cttv20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:32 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35JD9mdB005929;
	Mon, 19 Jun 2023 14:58:31 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r93939jdk-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNC/G9SLi9IkzdrUq9w93elJjMY1L1CI6A7NIFpEdmm/VTqwspnQaa4nuWH3S5AHvimAxY/UEfQZUC6nVv8KouDI1aLY3eMW2pXF5Lu/GlRB78srOOZ2PqqfCQRIjeF+HnC1L2XEaXR/j0yMvxasM7mNkhYfv77SUOMldD2QqauRGXDJYDFWAg9vGAF1M8b97NL4vD2Dw0VxG3BV/BfkZ2v9ssuj/pXK53RhI5POJeEGr0EvpGoqKWT2SQFGQ5Sktq0DGayYeU0wP/lt6pXoQ08Nc95+BtcEASyQ6FZWd39B7iN9rRCGfTD1EGrpBG6T9p+2UlPr65IIWDwThP63/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INO9jwnm7sy85thqLZ7evmCj4T//oZgOVoVhGsr8Lhw=;
 b=TVs0Tfoj3X0r9MUiuIA9FbNmp4VznA/CetBHeWa4L229WJwLIhH3UXfFO6+w+wrw21Ga7DGl7VrFQjpZNbmZn34zXNZ0CF383fulHfFYiPY5ttKjPnV8Xlu/LXnFXk7eBlNj90NlW+ws3P59JFcDjiXc3XRev5fY/Q95ilFtPgQLexwegpEfuJAXl4TRAJLZo7NlTIUik2lAPNhceAhj71Sk6De8KkyI4VqaQ4rJf0x1/3o3TdogAAbqWZzW1vY3+/+X79gUS58lvxPRt3IhWEO0hbDsH1vAnwJbUHoQpSgRPzuFlIOVb6KohJHOTaSFp4VmyqsTW7hLLWJXRfjDww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INO9jwnm7sy85thqLZ7evmCj4T//oZgOVoVhGsr8Lhw=;
 b=ZMRGYmq4pvCmkj4cLtbYf6TYYYQKzZ9h4Az515G7cpFpI1icouv9GSYUZdfiXuC9MEnrPoDxOFos4Eo6xhkdy2JA7jghFAqktFHXVF5iZCyr5+wng1nYkSd82tK6Kwu+KGJ9lOVr6BOvQj2kG0s/2o4DPJ0bxja4EbEWL2PBxTc=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA1PR10MB6543.namprd10.prod.outlook.com (2603:10b6:806:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 14:58:19 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 14:58:16 +0000
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
Subject: [PATCH v2 02/13] x86/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 19 Jun 2023 10:57:50 -0400
Message-Id: <20230619145801.1064716-3-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230619145801.1064716-1-eric.devolder@oracle.com>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR06CA0084.namprd06.prod.outlook.com
 (2603:10b6:5:336::17) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA1PR10MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: 090ce134-e2a8-45b7-cd0e-08db70d59cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	oA579seoPB9JcvZbDuDRsyRjXJS8amE3HBqaAmWpvaLZN+BaFEAFfFfwoknd9U/gzBDC6m4fz/i7pVOSutMgsHl3MvFPjvGAVwnqFGHVdTfgc03lYqcnD8LOCJjopK2nvYrDyy1dXkMgD7IfBMIgOYUtNJeICxuEhYIXo2gbSw5Jg3xgK+xySyfqVkHSuAw7b8leNegAhQsNNDkntF3YOwF48OozRUXYeXMftAz+F6xsLuO1oIcncPP6RnrnMhpn2hda4IwHPty8UhhNjMkEbn9ayKJVSZOqEy74cL4T32gzS0sJMDvedoCtLRWJ4PHCpE58cmt/Tlnt0TsCTuOtspvYK8Q8kO08ca6o4lpKCXokBPLLKXUCRRg1e+hH7lrbWrz7CfmBW+twMEDSn5J6vIJkEWACT3MO3jmrqLIwp8vxdFnnGv5X8OayE2zESyDvbJvOiP9hnEgVcxB0w3RyXpnI8CwY8rXhH0fsQUYOfCZ5B2ekclJUDVygQXfW/YEfd58dQ3Whl7yc3xqo3zTVTSTsvpJiIMNwj1fyxlsw3+8VQYFcdM6s/NnpWLEoA34CArsPVwKgvXl85xAq9IxoIy3llFK7H5zBdiiwBDwfEfE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(7416002)(7366002)(66946007)(7406005)(8936002)(8676002)(66556008)(66476007)(107886003)(1076003)(26005)(186003)(6506007)(6512007)(36756003)(83380400001)(41300700001)(38100700002)(5660300002)(4326008)(316002)(2616005)(921005)(6666004)(6486002)(478600001)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?gM1SLSKV6dW3pciArtNsSfdhzn/xK0IwDyJ64rvtfm+E5Wwqngsr43GGiVsw?=
 =?us-ascii?Q?eetwEzpIujLLZHlesU4dJdlbH/U5LfTgPAQEAshKrCTAKAXOfDDZHxNknXDL?=
 =?us-ascii?Q?XitPOnks1leAvRS5C5cE8QTksjyx3HWg7Acb24k2tCB+4Sf9ZZO12RjlK1zA?=
 =?us-ascii?Q?OMX6iox5488O7qkO7hRvZ+SJmN4C8jNX1YjvxFX5axejJniW7HmBkhFOqBXB?=
 =?us-ascii?Q?IMEhAd/LOorwfRtCMXBY8I+G8XrMeKcncwagMHzkjhZP1GUmmspG0Y+yRzE+?=
 =?us-ascii?Q?uL9LAzpl2jlI+gxyamY8IXstBGcQ4TL2Dsr7hjk1dUtqIaQsw1abeMqhv5t8?=
 =?us-ascii?Q?SViDo1YrlW1vgtRfAYCnej35yoM8ZY3j4Q2+w5pR3ZvWyFmghD88tybsfNGs?=
 =?us-ascii?Q?vp/ZrDjYT+OLavr1C1XQuC1NHX2cml4uXYLooT4gQHMf75/vayX0PfKWJ+Cl?=
 =?us-ascii?Q?siJbd4+3SV6fnPMlDsicmRAW8NVp2wsNqOt00jg8n3Ivl92es5f/g6LvyRxo?=
 =?us-ascii?Q?zxlup2jySH5Y+YteQrDz9yj++7bK+7XDJmy/I9pBZcXNhKuxHz28ZWrFnLUE?=
 =?us-ascii?Q?+kRMTll88bBVcpLZo7OymUKEyJ0Fjzi61eamdAzyWkDApV3MHVL2Kw9qCbUB?=
 =?us-ascii?Q?FFn/TCvjUTZqr6CWiCxKE1aSRxiPR5vUbJsL0wQNlYU4YotKJdk6Gw+vIjm3?=
 =?us-ascii?Q?QWudt2OmihsVPrCHdfktTEcGSjsMFsx9cej+4dtozV+CN2YSxFzn0qbUAI8V?=
 =?us-ascii?Q?iIi9kCZ72HAK1pRhipY0AkH6LE6R06EFYBVjXL9hRrcRRhVd0ilUYc0BDIH8?=
 =?us-ascii?Q?gxRvUiOs+8nezI9VSHUN57pOvqAyHhgULgoRgfajFIDmokZUC0mCDODQCsTW?=
 =?us-ascii?Q?Sn8l8TnIhXpe7czIALlOURtkXyOTQXgU4iMZGPQV2tk9P76NgWF5GZeny5NC?=
 =?us-ascii?Q?DUUUoB8p+P8Ale5UPTvbWimwWWZvRVpnprNMud9Dmxw9O36mJrf+SKu0ifdL?=
 =?us-ascii?Q?0R94AmUzyKSir14LB4p06Yxe8CrT+umzR3+2EMEbjuBGmVatT27n0mfoFk6O?=
 =?us-ascii?Q?eI/t8c2vHD2XZcNnu/I6sJ6VgGoEsjiuKXk3f9x+lWrGxXHFgCKJysrwGuba?=
 =?us-ascii?Q?V4Jt1Lj918dgAyfcqfAK11sNeWZCUqEjwIWSg91AQAxbiiwZuwyEX9gA8y1I?=
 =?us-ascii?Q?ULzacQYj9Zb3bsdB1Wa+EIrq+RyY2tDdNEBO/bjxBBq9oP94J0wIKAcGruwd?=
 =?us-ascii?Q?ACYjD0/uhrfGVtFbOxIDb4JOEmWj9Bjq5aHyAcDUOoJ3XxcY+yKRD8nsQmG0?=
 =?us-ascii?Q?RFsDNACXJlkwl9WIqRfsms0yfSfdL703PMuLn3h+R5yDMqB2aIUFIVTvhqqh?=
 =?us-ascii?Q?P+2uLNJByplSUf9cICRoeB7Wlupjm0VvRxpm1QGwtAXpHcQuuWmbVKXR4uiJ?=
 =?us-ascii?Q?m4AaLvFy2EDj906SMD09qARkY1GssahpFdNJH/8CiRBChn7R4ZRWcGpE72Un?=
 =?us-ascii?Q?dOFwS0ewZD7O9yH1fabSIx8+ifMHNI1Bz5XoNiXxMfrDb+v1mXfzrsoeZF2o?=
 =?us-ascii?Q?lEeIldBRquPx/z+GZv1wlypR6b+k0J49glNR1YZMaYmrHa4B2qHFhyWTzXq9?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?nhtI56KAU0oEb1bfiTXM3DfL8jws5q530SXR2OPP6LY6qu5W5BFAYEKg2efh?=
 =?us-ascii?Q?+sq/usRYS+e1Rxd5mc2ZNcXumeeokJsTYEtUcFonbuUTsqZv7Mu/Z4xjj8Cw?=
 =?us-ascii?Q?pIx1qdEH5/LIUTWMw8hvQw//kMQS0W5NWNqclmSN5N8Uxc5H9O6ZghGrVh/o?=
 =?us-ascii?Q?80zFMm42xqthn6vKShVfFXyzyfFRp/cZilG7I3R0H0Qfl7FQ1G0+5EOrJdSv?=
 =?us-ascii?Q?HcHFSoLlsNqixBB/TMFfVfN6yj/jqtNvQGMWkjU8qo3y96C5Dumqo5Y1Mw2E?=
 =?us-ascii?Q?rjwsflcVaGQU6ZMZ2s1PKlDZun6roCknDIQ4POfAy/0ifpWd73sWHTK99oBR?=
 =?us-ascii?Q?wax06gDfPppofGpK0EmUpBdB7L1C9HsRJY9ddnEJ8U4fqK4GHfNuiu2V03R2?=
 =?us-ascii?Q?C0M/rIaacuDC8iJ4Y/cRlEQtB4z57ACNZ6GbSV6i9ASqY00rgjFO9Wkwuplh?=
 =?us-ascii?Q?NPdBDjKTGdN57yCfB0nQOFE59sX2iIYQw8Kw1TuROQNBDq7ekzgEk0sed/FP?=
 =?us-ascii?Q?lPu32tSsLr7K1DpA5ngA6QQ4pd4067VZAB9m7Y8jYmaXDDBiSxxsXrEYWchg?=
 =?us-ascii?Q?hQiEOLa4MIxwmpr5udvdCcVt71Eutu4t5YM62008JIbbdHFXaf0yHYMPDCm4?=
 =?us-ascii?Q?Tw7AWwWg1vpryy0MQZfZyxhcgwormTpJ9de6mz73TXNDolUW8xc+V1F/nMQ6?=
 =?us-ascii?Q?KQc/Gein2SXhoig9JMiE2EXmVmtiqTpW05bHePH8BAVm3TWMsxed+OQ6RwEU?=
 =?us-ascii?Q?S16cVgHir+0aK145LAtRgtWqSj+J9iot9Ipk4pFiu6/iDCuF+AjnoyoUK8R4?=
 =?us-ascii?Q?MerfarwFSx8QG9/w5jL/RJoBlGfkAP61pcrVrc5g1MbW6DEqIlYISHkQP+iL?=
 =?us-ascii?Q?ckp9rbrW8i5tFLAPPdJxINKgS7Tg+t2Xa0GnvIo4psomtfZXE928nZxx1L2N?=
 =?us-ascii?Q?MIgqdJdLNuLOcB0EtdnyM9Od4BEzAttk0K7RlEaK0QQyFWWvjb+KHWDNa8wC?=
 =?us-ascii?Q?RgMl9F/09SgExGZztlaaJPVqQh1Fgob3g6TW/uGiOihVUxO/1+T4yqXGwTpQ?=
 =?us-ascii?Q?S0xqofAg+m9wUDPo4FQsAfkpnHrhZbasOXyir7+lbtfhNP6P2B+Yx5uk8Hf3?=
 =?us-ascii?Q?qrCua2MECQy0Q3NgTmb2/ngVQKP9mCL3qWo4guPyO4k7DApodHiqnM0nj0du?=
 =?us-ascii?Q?ETKmjy5rfKqNf4jdyZG8LxGXF7d2UpmVJqvaIEYzUTWTZjPtz7hzYzmSVb1U?=
 =?us-ascii?Q?8NCR7IPV861rIxpPFGAbauCssmvVrykDQtZ8BFo8msANY4wHqLZZLtyUM1bq?=
 =?us-ascii?Q?17RzYxG5uarKXT2UPKPg5Wln3RCymXR1T8MaftRvoiI0DKzQf2qGFSjTxHTj?=
 =?us-ascii?Q?95PgRHzlzoQ34dbj/yoaloRVyqmC+1p7gL2ZsA0dPTMwMe+5PHuXjXkHPYoM?=
 =?us-ascii?Q?OXQFG/ieh6M+cFWr1ibH8LFk2XqNTF7mDNddHxIzHkGcAdgYSzoKjhwRyu7L?=
 =?us-ascii?Q?iRH/ZXf6UzjBTCmJcMbNd44+ESWNRoS5+ZeKYSpi/ARle2F5iJaKW788XBag?=
 =?us-ascii?Q?pOCGanjQxkKY0zrWDFv/kxeGN/V0/hT7eGsWsF+xRCXohqhEr1teVNzxoMd0?=
 =?us-ascii?Q?tV/LedoqNX8b42TpKtiQEGC/PdQ3oOr6pRY9kHw6fMgyI50fZCkLk+NGb+sF?=
 =?us-ascii?Q?QIP1A2JgA5hplNwxGNw5mNqoGGKxahzwMol6vcoVr0HYsydF8dq+WCroGuwd?=
 =?us-ascii?Q?qPsbHEjbiIrJ9EXONhHIWXcOVcj2HTx5/mMDynUF20HFICW4wJRr26ZIequA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	I2fGMIYx6pP8T7+NrGTbKfj50fN3p6n3Nwf1firFGZ32BxKsynH+dAUO57LJoOQI8eXbX+GWzMyy+sDXq47wdSJ2ItvWgh7i4jHD2LRfn7SYivJkoQNq0WQEG44r7b2UtJ8pO0OSDWQ38uAwSGksgPB4085xPo6VRFbut7OWoxGDeVkAIMSecVbqqCfq5fnBw9CpMxQUV6kb+dPE/vqpBqTeahDX05Fg6+BZIqpqe312hIkFsUuCzNsMLD2vpESBF8x9c1CC9Tqsu6/mrYr0aoNB5REPJi4TcClPc/z9ipYSSIVgM7QS8j61uiUlwav5gf1T6FzYaE4Sn78rdc9DG61Ec3eMX/3wH/Op55OzWoOitR+Jc5Mf2tPsyYM/w2qVa/DXlz0HySSYojQ4fTHzYsNOXYGsYtx3DyJxmSbBMBlY+SkFPgF/Po6UkZ7bOunQwzjDtPs02IGgcA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 090ce134-e2a8-45b7-cd0e-08db70d59cbe
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 14:58:16.4560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dCsgTyOqbnj4Xj8vUn+3KPM4Aw6UwlOH/ic7KZICF7Afr9DV0JAmxsfPdS/s9xhHyuGf6rZGy4k7L50V40TAohZrbiSOwEH9PbTfyABYNWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6543
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_11,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190137
X-Proofpoint-GUID: 8lEqwjPk3mns1e8sRyRZrpd1s-nTwbQ1
X-Proofpoint-ORIG-GUID: 8lEqwjPk3mns1e8sRyRZrpd1s-nTwbQ1
X-Mailman-Approved-At: Tue, 20 Jun 2023 09:11:26 +1000
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
 arch/x86/Kconfig | 89 +++++++-----------------------------------------
 1 file changed, 13 insertions(+), 76 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 53bab123a8ee..1afc6ca2986b 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2043,88 +2043,25 @@ config EFI_RUNTIME_MAP
 
 source "kernel/Kconfig.hz"
 
-config KEXEC
-	bool "kexec system call"
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-	  The name comes from the similarity to the exec system call.
-
-	  It is an ongoing process to be certain the hardware in a machine
-	  is properly shutdown, so do not be surprised if this code does not
-	  initially work for you.  As of this writing the exact hardware
-	  interface is strongly in flux, so no good recommendation can be
-	  made.
-
-config KEXEC_FILE
-	bool "kexec file based system call"
-	select KEXEC_CORE
-	select HAVE_IMA_KEXEC if IMA
-	depends on X86_64
-	depends on CRYPTO=y
-	depends on CRYPTO_SHA256=y
-	help
-	  This is new version of kexec system call. This system call is
-	  file based and takes file descriptors as system call argument
-	  for kernel and initramfs as opposed to list of segments as
-	  accepted by previous system call.
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
 
-config ARCH_HAS_KEXEC_PURGATORY
-	def_bool KEXEC_FILE
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool X86_64 && CRYPTO && CRYPTO_SHA256
 
-config KEXEC_SIG
-	bool "Verify kernel signature during kexec_file_load() syscall"
+config ARCH_SELECTS_KEXEC_FILE
+	def_bool y
 	depends on KEXEC_FILE
-	help
-
-	  This option makes the kexec_file_load() syscall check for a valid
-	  signature of the kernel image.  The image can still be loaded without
-	  a valid signature unless you also enable KEXEC_SIG_FORCE, though if
-	  there's a signature that we can check, then it must be valid.
-
-	  In addition to this option, you need to enable signature
-	  verification for the corresponding kernel image type being
-	  loaded in order for this to work.
-
-config KEXEC_SIG_FORCE
-	bool "Require a valid signature in kexec_file_load() syscall"
-	depends on KEXEC_SIG
-	help
-	  This option makes kernel signature verification mandatory for
-	  the kexec_file_load() syscall.
+	select HAVE_IMA_KEXEC if IMA
 
-config KEXEC_BZIMAGE_VERIFY_SIG
-	bool "Enable bzImage signature verification support"
-	depends on KEXEC_SIG
-	depends on SIGNED_PE_FILE_VERIFICATION
-	select SYSTEM_TRUSTED_KEYRING
-	help
-	  Enable bzImage signature verification support.
+config ARCH_HAS_KEXEC_PURGATORY
+	def_bool KEXEC_FILE
 
-config CRASH_DUMP
-	bool "kernel crash dumps"
-	depends on X86_64 || (X86_32 && HIGHMEM)
-	help
-	  Generate crash dump after being started by kexec.
-	  This should be normally only set in special crash dump kernels
-	  which are loaded in the main kernel with kexec-tools into
-	  a specially reserved region and then later executed after
-	  a crash by kdump/kexec. The crash dump kernel must be compiled
-	  to a memory address not used by the main kernel or BIOS using
-	  PHYSICAL_START, or it must be built as a relocatable image
-	  (CONFIG_RELOCATABLE=y).
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_SUPPORTS_KEXEC_JUMP
+	def_bool y
 
-config KEXEC_JUMP
-	bool "kexec jump"
-	depends on KEXEC && HIBERNATION
-	help
-	  Jump between original kernel and kexeced kernel and invoke
-	  code in physical address mode via KEXEC
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool X86_64 || (X86_32 && HIGHMEM)
 
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_DUMP)
-- 
2.31.1

