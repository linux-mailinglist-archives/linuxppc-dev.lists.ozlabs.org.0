Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C1A72D034
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 22:09:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Xlrm7Wg4;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=gH1CxN4s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg2p16GRdz3cFt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:09:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Xlrm7Wg4;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=gH1CxN4s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg0w90gJyz30Kf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 04:44:24 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35CHNr8k031979;
	Mon, 12 Jun 2023 17:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=DKYiM8A7MT0SX1jbhufvRGn90sJY2H0gAZqSRc2snwA=;
 b=Xlrm7Wg4IoH9Ve8mY7j7BkdBY28wXqsxRj4bvAilYT3BVr3GBBwObAAFoc0YlUa2DPgx
 cAMPwWMntI8AKFupTopVWkN1rQ0mIHKFtY0/UXr3RCoqedcebXIeVBHQ28C7qCBSMNZU
 C/1v3nMAiRHnfDuJI9VJHCtCXt56E4ywWbdEOjkStw4MrrR84Lg/Z3sFa5Gz22oLHKfu
 L1J3NGDQbbI6LrSNaPCSUVEXbvhG2SQr/YeRJhj78oYmASqmC+Ho+d0TyloiUwJDUQ5c
 pIUSDG5TqJNyJ0/BdjF5fCuFSGHUkyVCvSQ0h36iN8L9QHs2bYJRw4l3vOerLwgcUV9q JA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4h7d3fdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:51 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35CGZIIF009021;
	Mon, 12 Jun 2023 17:28:51 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm3b5hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H29aerpi9LzOswAUwVhG8sdb04JQzdR/57TBI9SYg2iAYa5hcR5gdd6XbFytmpIK8QN220mMs+Fl4kFlYcNSnCUjGNv5u9dtvj+/frwe5JyqT8Kbi+FpSbW7h1ZCVW3LjDjHMKux2f8O1p0jZBKY4j0TZfZfdDqEfFEdLWl5Cfu8oDqHyW/CduvWuvctOgkASmkDQT8ZAW6tdVJVES3BBC0gYsNUbm64OpG6i3jqYtbMnkXE4HHcL7TTxtxjcVCZI3iPM2MJc1g/N7E4h8AJmo/9iwSVgr0IUkQTekGfT92p576yGo+SVbubxi1OAvWqgnnT7t6Tb2e62gnRfvfnMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKYiM8A7MT0SX1jbhufvRGn90sJY2H0gAZqSRc2snwA=;
 b=dRFj726qS3a4TrWzrU746eHobefO27dUr3QrzhYzXdb8hY6uo0KD0U8gstRQtnaL2Dfk+24kZeHb84nUqW/B3Q0/CsyRoql3OXaFDizrMyh5tvPx1LuiZ4ihAz48JyuJnGsB94R7ZkMBzCHfcQ9jtJHzprv3DSBELpbLPlsRoIJf387HJirBry1Ctc1F/gLPG5eycZMwVmU/sQmFxnp1FZj6LDd7gcscZUfyy/JJQG82p24X3jYcENPr/WmcdLmB9/3wmprIzjvxkXqJ20aCznBielg1dWtJ7WzeM7tdlWUibbm+WZcba1RJuIh7GH1l+WJeXrahwQesvdC0LmDPMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKYiM8A7MT0SX1jbhufvRGn90sJY2H0gAZqSRc2snwA=;
 b=gH1CxN4sg8G+lTBnA7+EREor3Pur3DuUdeBcmvJzUqEct4YJqTjGeiKv8KFm4bOUTtIKuUfegjhHRwNrIpe9qT1d6WwDFHhZoqKgekAiv3Eb/2seN2gtPFqmLPyi+kebxF3RRjj5ifZ7lDXHCUgA/4xffTSUQe+Oj9tU8oeashc=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MW4PR10MB6509.namprd10.prod.outlook.com (2603:10b6:303:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 17:28:47 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 17:28:47 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, 86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v1 12/21] s390/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 12 Jun 2023 13:28:04 -0400
Message-Id: <20230612172805.681179-13-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230612172805.681179-1-eric.devolder@oracle.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0017.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::30) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|MW4PR10MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: a75e36c7-5cf4-4130-239b-08db6b6a7acf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qLfWvkqad7H5hwVAyiEMcyj6Xxs0XvONqCJDvDW8OdnfEMyEwGBFKqXinLzmrv3qcHb6SMicGzDcVL9uNmnekRMY9+iQYBAjFXhJweaE+OUfm9sDcW1ofFA+jXN/+iydJFtbaaJn0BoMgcMx0Ea60q0dOTfrzl0XBSVFa03Z19F94LaiePTi9lRrtO/9cNBXfvDGwNrwPg0O4onNJ4N18RHLYmxDKwtk9QbcOv9Hg4PAvgb7BohZ2xMVCkS4QJdY2tcb+vQvq2nh309xUXrABADubpTqBd9BfeFRqoPojB8eJkQ0iH7W1AIKaEx6hStl928xRIWYJbvRZPJiWFI4Ayc8BAzg0B5ERENGUxKD6ScdER7tPek7xFzl0vZA3td/0MIojIO4L/Yk3Y11G6Ji71bRTwoPh1F1sATy8jEbqiYEhVShX6zCfmqDiqYOCrgAmP5UYJ03Jqy3OrMExhcABl/+FrZKOlk5y6MCbPNGFLKsKAZ1kLkfvKHFkqYR6/k+gCYbY1Gu3Qq4S1xSaJbe0rK76pCagR9JJYUJ40x4OORx8YXCrwuobNA3GutGHryT35KXWSGpb1iosgtiu/yOAtEH3axXoPXJlgbVULaLSZQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(66556008)(66476007)(66946007)(6666004)(107886003)(316002)(4326008)(478600001)(86362001)(36756003)(6512007)(6506007)(1076003)(26005)(83380400001)(186003)(5660300002)(8936002)(7366002)(7416002)(8676002)(2906002)(6486002)(7406005)(921005)(41300700001)(2616005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?qBDhOxF8G78VvCXNbcZhAIgT3YUyBk52mG1+f3XT5FilsQPVUCCYBOYrMRo4?=
 =?us-ascii?Q?amx7Ad6wBtULqD5eY/VGlbcMJ+8Qji3Nqr26nF6mS6mVf71hp2IdcBsO9ARG?=
 =?us-ascii?Q?VA6uqSbEL96XvwaNKpC3r8IijpuvCYXOZB/r3/buQiXuLHtYU946F7/KTVrW?=
 =?us-ascii?Q?0DahwUO4FUg+TLdncvKaVK0q4nW/ZWmvnlY9IH8Mmd041Y1cayn/FptFda0z?=
 =?us-ascii?Q?YkiAFOkdnALq1dkitBawD2oYsCV+UIRNk65SqF8xEIixFx8Xy3NdxbuHJRBB?=
 =?us-ascii?Q?yy1FUXDLE7+AO7GnF+58acRT/deX8iZgSfRZrtsO4yqHO9x06te3S0uODyhy?=
 =?us-ascii?Q?00Dib7qDtv4otPyigA0E/RlnVLcZkyYEyiHd6CimwAkOXfXr8xNPQ3SwC+u0?=
 =?us-ascii?Q?2MbdYX5VQvV0oUE50iA1EOZvO1UDP+8Myc/8DHbIIkLLY6cH7cWCLB78vuIL?=
 =?us-ascii?Q?hWkFNi5sK7RECaBc/5a944+MLjBZjnUCcUDFR1JgH2IeTvZ2M8uSNfqHlbkm?=
 =?us-ascii?Q?wOteWkWbVCaqn0fhpD0VLcvsw4mLMi8MJ/XsvMypJtc9XfuRzXClr9xj1Nic?=
 =?us-ascii?Q?I9vcMHjm74skKmzGw0NAhJCEb5Sm0OtWuibfwis5elsKQTLadu5cgMcR1tkU?=
 =?us-ascii?Q?y2lFlacTTV+0oLqVa+Hh6hraK2uFqQIno+NnMHptaS29M661WZthXdQKGJ59?=
 =?us-ascii?Q?Q9gc2YKHV+Pk0xyh3hIgDW4h7bHJYxgw54v7vbopqP2UmCBt2bmrb73E5/00?=
 =?us-ascii?Q?iZgaOmVcBmq/NuTu1vql+pmp17LJa14hzSTrI5WAbZYdRPrkOd7ARAdxqzg3?=
 =?us-ascii?Q?9noZ4axKuosdH/rK6JLiHjzkABlDRcmTvjbVGD/a63zT+ENarfgkd3cbyuYm?=
 =?us-ascii?Q?FUTszXbAKmK6HHo7bjROo1l0MXa80cKQ28FPRxEoxrxszubpwlp1apAyot+r?=
 =?us-ascii?Q?2vJNNLpxa3HUsIzjs74+/HBEFme+MyIRbLRtTCbKFFqgQdobNjApDSKU9Wdd?=
 =?us-ascii?Q?xT7bCAB4BLShjTFf5hPiVypAQGjMz4pIWMNtIFoNEwYUyfyPJJsWbmqAVoKq?=
 =?us-ascii?Q?0JNdAgSo2IXFgLgoHcNLzFPDf/XUMdLOJodcJRn6HmlLeCzmALXmmX1vlfXX?=
 =?us-ascii?Q?6RoN4gowhnaUYSe9nDe9dVhkPLilw1+/NdsSKh6MknDadqdLybOWFDPI785A?=
 =?us-ascii?Q?elbL+Q6wN3MzX/upmBK1ZnbCGPERHxZaQwEwC84EGvwqtBFQ81cpPXIGKQj8?=
 =?us-ascii?Q?5nnxLhZMI46GtGC/qQgM2MhOvU8iLxb4+iOKmP8hWJyJVvKdICnrbbJbDuo4?=
 =?us-ascii?Q?Xo2WCQYdxMB6gDINXiHUr+QFBJ3ynOqtfKp37XrFgAOYdYdBlNXm9gIZS4AY?=
 =?us-ascii?Q?doc97SQ7j0SVbBvNhdyAQcPcDz8wbMGdsMHbeUrrvTn5efLeHXxnGJf3rYoz?=
 =?us-ascii?Q?1j200eRou6Th15Now0I7Thwh1fx6irwmc0e9gw/EHHP1e1JxO3k3SDZ7J1c7?=
 =?us-ascii?Q?meVaYS+PiBBHQJvuFiJrfFLFQRBvQk5XPi2aOkbmQDWKSM1t/UZnrvsPaBS1?=
 =?us-ascii?Q?dXbeO5Ujk3tmRpqPuC5l5A1EPVSIrYu9QtM26NhM5S9dkHwLVeCNa8Bibpdl?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?xrP7f9iYVg3n4HFTDtMEvOS92uYjHb004nV0hjHj9uMEPwxOFd2xarI1g3mM?=
 =?us-ascii?Q?z5JUWMR7ioWq3ygtbeWGOi2sj4A+2DvMpG2a1F+U9I6GDwgmHNAaW3Kjayik?=
 =?us-ascii?Q?arwnh1ml281yO+DZ03vhm4fKmcqdDBG94bqj9QuEBPahLQqqVW9B2q+o/8OR?=
 =?us-ascii?Q?qTUIT9CBUnwsSwv44UmEoBdAfgcTwXu7YKrcnZ8maR8MrExm36RQsDNcFwuE?=
 =?us-ascii?Q?xFPsc15rrR9SNUe69M1nLBD+sYyKGnWNdF5yCfmEj7siVKXfH6KQKtqVZ0c/?=
 =?us-ascii?Q?JjT6OXIpvBC2HWwqGnjdNx9qdeKvrRV7uTQerrx+CrGw04SZUO3QVc+b19+K?=
 =?us-ascii?Q?XG2zrazhzQrZxF6q8YDu1LqiBXGh5W8N4aaz6caq/OFDn/CnWRV4HRTkAarb?=
 =?us-ascii?Q?FBeu8R0OC3Ok8CFrnCZTmeNnD5sEN3uSmIULWxn0hoPSF9NihHrawG4s6jfX?=
 =?us-ascii?Q?X/c/y1UzbP6nbGGP7BbhbYJSnNkC/lB0jHfFsEWhpYsQ6Zu3qCmUZPnCYvMN?=
 =?us-ascii?Q?apJtLD907yBXgtRKFBqKMRDMAgvwGEhUCjw1A9RYD+DvO1sMFHjLZDWKmWrF?=
 =?us-ascii?Q?Ka3PodJw7zGbLZd2I9RLD7LVerv+2LOnSL69Am/o/uRXAIBZoQKKV7258hZR?=
 =?us-ascii?Q?xqKfhuNUB7zcCMsnEhAYnnOxM+Q4RK07uBbnkOwOfe65qk8dZ5oyBMd2S7WJ?=
 =?us-ascii?Q?joJbcL0URtkoF/iLKy8EZ7oIu5qNOrbNoCgy1VD5Qx6pVNM51PdHOmD39UYX?=
 =?us-ascii?Q?Paj6x5PuY21pp27BeLhPGgWQxSHP8r04h8d3grckuIsYn33AU1X5/5o27X2h?=
 =?us-ascii?Q?N+tOniWomRbxSRh+hUJ508+LFbvpBvsxajV91zRkD1p922wMmu7PFJEM9+FM?=
 =?us-ascii?Q?hm9MJft7OfeW2wvQJ/Fgn5Q2cCEf+J/EYFpLF/PpTIYTg0b19d/Vyw8yvfm1?=
 =?us-ascii?Q?8z07FAFcjFajcPw5Islwk2DOc0+Lk0FeQQB7OKv0PUc8aKGsxPbfGobxqOWX?=
 =?us-ascii?Q?HI15XI1CMJfup08d4jVqyuFnoaqZ9UOAdFEKk+mg3nauapCdNuWiLSaULzti?=
 =?us-ascii?Q?IY6ChHd7BszZxbFHs6T3iNjI1v3uAgyyXU/ICaK4W9OXRrOSlJYMgVLpLr+X?=
 =?us-ascii?Q?xd8PODPd7nQa5kTx2ZKssP6FngVk6ehP8yRSlG8N1KhNVRQUcNF1+RSBf8Gs?=
 =?us-ascii?Q?1gg+3X9iAkjG9wSQjC8by9shtvVSIdvkh0lrhDtb/PPXHjPvBAwqU1hdBnJM?=
 =?us-ascii?Q?kgcIPtxtsGhLxwLPQuYB8EaEJkRty3HONrAW0JilyswYRlW84K8Rq5uViXWV?=
 =?us-ascii?Q?vghHtVhM8nvvL7OwxJ1wiY+RUBG9LoDVfvws4hUBKuia4RcweFVyvgWvBYai?=
 =?us-ascii?Q?+BgTuPJ2c3msTsh2wg3wUGOVou5g0V8pu5Y/WrqlgZ/UerU7G6OnercgC0m7?=
 =?us-ascii?Q?I9a7DnaeKqETMahYmf1pvpUOd5vjvs3JAjMlBxQ/UIO1juWmTYlpLYGCmtN6?=
 =?us-ascii?Q?u7DMVxdVRZ2PP/hPAxX7sxoodBZl4MdZ6bDVmezqA1BdiBBOAn5Ix8rqu/4W?=
 =?us-ascii?Q?x/YIx9iG7yPgn7rCjujGDnhi43HrXuakpqe4g0dfVKI+y3rn8yO7g3avf06I?=
 =?us-ascii?Q?hLF7LSnelKxzWKwJB7VQWMT+xpT71TvKIGB04im4FWVVtTQ4o/h7xhIusAUI?=
 =?us-ascii?Q?QdcRUwA0jQuXmcvGqduPqYQjDX2EmR+2Hlo3SpNLiav2aaKm05vMSb4sqZBm?=
 =?us-ascii?Q?9BnvabWKwGHkRd/E6JSWQABhqcv43lWYCtSL101tDAyhhRbGZhInLTO9mILw?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	cEmvbeF8CbHXzdoQmA6fe2WlS3X7TcAyH58SRlP3XUkHeGE7XY98DkBNLhj6XmqFiqsqHN7CxbizH+5K+sSZl7f+V9vfiaTzt9nPli+1zctgP3fZw/m3/biNPE/6QkJPQU+F0anot4+7tRvs7cPQWG6+9NuD622TLThyP64/ZKjLd2xsdTHoQBBkWCTovsCQwl4yL6eKEnpkjYRgRDnGeOCVW0gzVKMUYpadPmG4fkcrJDo6L6FkhC9DEtJUXFY3P2Zh5abzSJL0P0SKpb7WdxRfpWjNfEuBeObaV0zp3S15i+JW8cGC4QosccGDzpNeVY7nwTm8W0KuG3nejBTdh0N37Aol1UDG3jCum4c6F2YnmBRFSej7hA4PuvuJFnB+OWJDJFe4T2Z+JaUqFPF0nDZHjddZA1di9QUb8ttOuas4V6D+8z+F0gP/tAtRo2YtnSPaIoVkOPMY2w==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a75e36c7-5cf4-4130-239b-08db6b6a7acf
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 17:28:47.5742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbnGC9kJ8rK/G+c2/DTuipW/m9L9AO4hYzEr/bdCVhsNbSOlwMpxy/JlmeDmquuk9qpErGfsHDi5KI/9zRGx7wdx/qa0DCQEB7GLKTAqY8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6509
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_12,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 phishscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306120152
X-Proofpoint-ORIG-GUID: AxTUYOW0JGyK98f5R6MN4FAn3p23Eo_z
X-Proofpoint-GUID: AxTUYOW0JGyK98f5R6MN4FAn3p23Eo_z
X-Mailman-Approved-At: Tue, 13 Jun 2023 05:57:01 +1000
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
the ARCH_HAS_ and ARCH_SUPPORTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/s390/Kconfig | 65 ++++++++++++++---------------------------------
 1 file changed, 19 insertions(+), 46 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 6dab9c1be508..2eda5a0e240f 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -243,6 +243,25 @@ config PGTABLE_LEVELS
 
 source "kernel/livepatch/Kconfig"
 
+config ARCH_DEFAULT_KEXEC
+	def_bool y
+
+config ARCH_HAS_KEXEC
+	def_bool y
+
+config ARCH_HAS_KEXEC_FILE
+	def_bool CRYPTO && CRYPTO_SHA256 && CRYPTO_SHA256_S390
+
+config ARCH_HAS_KEXEC_PURGATORY
+	def_bool KEXEC_FILE
+
+config ARCH_HAS_CRASH_DUMP
+	def_bool y
+	help
+	  Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
+	  This option also enables s390 zfcpdump.
+	  See also <file:Documentation/s390/zfcpdump.rst>
+
 menu "Processor type and features"
 
 config HAVE_MARCH_Z10_FEATURES
@@ -481,36 +500,6 @@ config SCHED_TOPOLOGY
 
 source "kernel/Kconfig.hz"
 
-config KEXEC
-	def_bool y
-	select KEXEC_CORE
-
-config KEXEC_FILE
-	bool "kexec file based system call"
-	select KEXEC_CORE
-	depends on CRYPTO
-	depends on CRYPTO_SHA256
-	depends on CRYPTO_SHA256_S390
-	help
-	  Enable the kexec file based system call. In contrast to the normal
-	  kexec system call this system call takes file descriptors for the
-	  kernel and initramfs as arguments.
-
-config ARCH_HAS_KEXEC_PURGATORY
-	def_bool y
-	depends on KEXEC_FILE
-
-config KEXEC_SIG
-	bool "Verify kernel signature during kexec_file_load() syscall"
-	depends on KEXEC_FILE && MODULE_SIG_FORMAT
-	help
-	  This option makes kernel signature verification mandatory for
-	  the kexec_file_load() syscall.
-
-	  In addition to that option, you need to enable signature
-	  verification for the corresponding kernel image type being
-	  loaded in order for this to work.
-
 config KERNEL_NOBP
 	def_bool n
 	prompt "Enable modified branch prediction for the kernel by default"
@@ -732,22 +721,6 @@ config VFIO_AP
 
 endmenu
 
-menu "Dump support"
-
-config CRASH_DUMP
-	bool "kernel crash dumps"
-	select KEXEC
-	help
-	  Generate crash dump after being started by kexec.
-	  Crash dump kernels are loaded in the main kernel with kexec-tools
-	  into a specially reserved region and then later executed after
-	  a crash by kdump/kexec.
-	  Refer to <file:Documentation/s390/zfcpdump.rst> for more details on this.
-	  This option also enables s390 zfcpdump.
-	  See also <file:Documentation/s390/zfcpdump.rst>
-
-endmenu
-
 config CCW
 	def_bool y
 
-- 
2.31.1

