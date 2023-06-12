Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA9A72D011
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 22:03:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=JFBW/TwC;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=whjDUTND;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg2fs6280z3br3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:03:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=JFBW/TwC;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=whjDUTND;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg09q55ydz304b
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 04:11:10 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35CHO1w1024283;
	Mon, 12 Jun 2023 17:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=Oej10EnyYmtjbv8CuBdyTvRdVrqOEUx2wsTTuHdDK6k=;
 b=JFBW/TwCf3ODRaYLbPpBVFyVF1nkksWKZ07NQToewtcLG2OxEv3y6knf1ejfMWW+esO3
 8kGmUlvFm/fl/eNklc846qjsYdCNUqcocVlpc1oXIRO349c7u4CI1L5Uzow+iONuBVrh
 ikevi4RaDlvcg7j0k3ICnNb3FKpkMx4ogDeQ2pKTyH3Q1SN4G9KHnErcEaTQx2V3OUml
 7VxLDTN+JfXebOgJ3IiWIuw/ekw8H5+VW0DPkgqDz0afC4+MN/6kHWI/BVm7sKZnDgG3
 vfSmZdap71fiUj5IZqbKd0C//C+I/A4LBR/tF1YgQGiSdPm1LCm0Pxvn3+Hppgi3bDf4 jg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4fkdkf2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:40 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35CGJxdd016254;
	Mon, 12 Jun 2023 17:28:39 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm32y8j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmeXM3eYgJ9tAe2yBW5jhdw0/NUHIrbtAlz+T2VtEfOuSLuyB6I8LPKFzhRH4YtUGbOLP5WOOqCqIHen8cTjhCR1xOQGfz8do46pTKw0Ya+dml+4MFD3MrhVBiPUIFac08oGw+R0r2/pYhMB0DV9Ftli+MCP8OtevbgU/+awTu+3gNI9wgIRow+3z7gpyyHhM98ASy4a2ltXrSBh9Ax1ywHHuHBvYJ/CWP+8DaBjyy0sXSVGRdTXqCPNP4NyeZfIINsw0SErM1AjS32/1JyLcJOrhF7xvlyopBt7zDEBw4+XOTkpQ9xudJH93mSNZ2A38uMmQeyVJckFMIQQlwEwPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oej10EnyYmtjbv8CuBdyTvRdVrqOEUx2wsTTuHdDK6k=;
 b=DbOvICn+yKF3LhAOkuO8msSJAsS0n7pHf7/6oXYOno9XrsYALKtntfcPDg8J8/Q55vzvoKb7bBm+s1VqKZRBILKk/ufM7mrfOED1lRQVfd3brB8KbOYRgJflHnSxrJY+/YTrpOvLUvKKE/QJ771vp4HA/eJ6BtAgkV2Rshi1vj08w/JxnW8TQ/HfaJg4w+IRz5gHyi4bTr+XxxPZv5isTP0dFnAoAOiEdApknq9SR9YcVDePDpd53qFmyHsQFvjfgvcGoeVvphnlscUI36NQpv6sJauT94IpEd7bOZYVIw9Grv+8W4dsh0Tbax10hgSNu88/q/nM+Jy4026jgsJFuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oej10EnyYmtjbv8CuBdyTvRdVrqOEUx2wsTTuHdDK6k=;
 b=whjDUTNDiI9mfT6OGvWwYp+cs6pylu45F8B9qq5r7+cTs88oarKwhOcFXPugoJEqbshxrA3zgxVoBPa+/8+03iD+xUjzjqigGIe41qfIYAPDTMkdfIYUNryjkxARM4/JVGQFAKWRPWC/jvpLeUa4q181Svg0UqzAqpkRd9RrMug=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DS0PR10MB6975.namprd10.prod.outlook.com (2603:10b6:8:146::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 17:28:23 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 17:28:23 +0000
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
Subject: [PATCH v1 03/21] arm/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 12 Jun 2023 13:27:55 -0400
Message-Id: <20230612172805.681179-4-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230612172805.681179-1-eric.devolder@oracle.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::17) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DS0PR10MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a722096-61b0-43d1-b80c-08db6b6a6c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	K2j5yFqcaSMtgxFgt1gN3b/rmmx6ANYIzifRCcxd6RvYUphxvxMsOg3XWwzUsQx4Dc3sN/sPAeqobJGDMVctmi2mD3uxBuPe5LdbLYVGs6jZ0rqxPGV92XVuYKGVQjMQK9X5uJQIRLK1bATRUtPBawTnnLrutTjqyB6XqzTBwvT//JV3MfkgWviJTw5nOiopEt33wtakbyufh++nvyO/aw31cxT3JN8ofDgJ6hKAnwyPozUc4ty98xuuvTrdfHfpKf0B7YqvqkjBkVJQ49UBQf4x9fJFgTis2oPLgJrR34JQrjsODboS0Jprnwcw3UgG2XUhaZSHfgyJo1kQCJvSvGyZFgi+s64j2BrY0LHM1ptAP2uJrAO+8BL1Snu6zP6Hiie/9asWVPJZ7L7tJxrUhINwWsYcqAiCK1CIL4O1MA6quRcCfNNtuIrpav9s9wqeJhIU7FAfaeCasPwfzQWhtJ7Yy1s3tHE9mxN3VxC6LfvumhkuTpZbb1uuJFObdeTWOQGPJJIGZlTDIol3gD6y6UZlCQVG/9DaCCuKrJMUWTvIwuP+dQyI/HsBK3/FCKvGbla8wGhsiawEBtktiTnLySWx/oqKhYjnwac0motiaEg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199021)(6486002)(316002)(41300700001)(2616005)(83380400001)(86362001)(186003)(6512007)(6506007)(1076003)(7366002)(7406005)(7416002)(26005)(2906002)(107886003)(921005)(38100700002)(36756003)(5660300002)(8936002)(8676002)(66476007)(66556008)(66946007)(478600001)(4326008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/El05NEpsQrqEqXJIfl9bmdrouJEN/TJPHiX/LvyNl9Ca9v8M8gBXJLDFbzA?=
 =?us-ascii?Q?FAJZ9fIMkB5gYA5jia7adnLIn/MVXv4mMbeFt6ZKQjSvzEM0m7jzdrZ+TK8A?=
 =?us-ascii?Q?rEDXyaOhdNwGBts1EcI7rMM74lA6oRZf0gZ+rMQWKYVbtbIaBYBo4XiV+lJD?=
 =?us-ascii?Q?941tCivWN3yz60eu9ERq5Skmw2sGoeQPeOKyvFIa1YhyRnjvvB+frppepVNq?=
 =?us-ascii?Q?nJjQgcXueOmvGSPH9AAOwJm47F89S+Av/p+RWR+OBaNEGDq+yCvkfvEIJqP6?=
 =?us-ascii?Q?SlwvKdl7u+Niz52ovBMd6iciPI1Gdr7GhAOYA++URWqKgj6pDqG9pRVX9JTl?=
 =?us-ascii?Q?GENUWFA22FafmaMHWwxQGXsWHq7eZ+H7X5Wor1KwaCZccfzaxW4xwmxMG2pG?=
 =?us-ascii?Q?lrO8kDr48ljtjYFLLInac/jUDWH5gQcaT0b7V7E0IPT9qW6W1meremR8gOXm?=
 =?us-ascii?Q?zhSsBUEAxohW3o74iL60vQWHhAh9eVgLn+6JyaCPWbqywOdklAXoEs3TCMHQ?=
 =?us-ascii?Q?p/+v0AAkFfN1O/G01DshEGUecSTirkwvPugHN/qq3nXAlOHqO/lSd90tzUQ5?=
 =?us-ascii?Q?ZqZc+LbdmMA1fCHLCeUZZPt6H4gHrgF4GBHsWHsfYCWX9a0eSImFAFr1yHMA?=
 =?us-ascii?Q?AgbXlif7sqxe+xs3VpIegJZz/mCePSe7vD6VublkwXFXsXImIg9bS1kczjYO?=
 =?us-ascii?Q?i3Xl8MQZ5pgSV+6N7obNWCw4yyAUWqwT3Th2ufeENPG6Y+6C1XX4WVRe4YMg?=
 =?us-ascii?Q?nvtxSkoT8XKGNimEvg3Ypgo4YhCQed/UcVt0gw9ePWBWH22g4CY2v0JEkf5p?=
 =?us-ascii?Q?kP1ziY7NsdfGzftTbEwLbOwgM4BsGN8FjM8c2fFOZUlAhoH58DTsPTELKTDK?=
 =?us-ascii?Q?FHoZ4M1kpFz648ePZ44lnyhCwIlZ8MCD2+Zf3HeNEwfxGFHHFSCa7tI/SC4K?=
 =?us-ascii?Q?YmEnMqiZ3fGgcb9pe4zr4waX6EwjqfqFbMq/FCF6BGyphLtTHe7UaTy2ie3R?=
 =?us-ascii?Q?Ea3nre4rzoLJoFNryTg2t6b81aMYCYpNzKZclUe8c3rgkAj1YJZLXn/7GWbK?=
 =?us-ascii?Q?uw+i06BdQWkSg+29JTn5asETfbuQmmOCT2ZRbl9vcFvBrY/zFFxJVsTDxFwG?=
 =?us-ascii?Q?OtbIM6ZD6GZmQ1xISOKfj3G4H/cDKiPlrCkZdqJoQ3hRWjwYbIFpXNv2UO1V?=
 =?us-ascii?Q?AApLzdgSP/sD1gBgtdgmmW3XHz9xlS5YnIU/nVdQ6qsaH+bpsX/taeFadmjE?=
 =?us-ascii?Q?tZjBLdCb6j3fJdHvPSbNjX323/PuG13BfhW4pqv86CNvHdj9ILDyRXaxp7oZ?=
 =?us-ascii?Q?TxaVuF/2+KIkU6x/FjJOsioNV8oJPCGPtfSbcKyzTR2eVK/zGnvNYh82i3z2?=
 =?us-ascii?Q?IH9Md/j88MIJoo36E5wELDDW3+1VBs3Mh8HuEZn5A2EiNfsxO6ijF+MHaPKd?=
 =?us-ascii?Q?u9UgdBeocXSbGWGgicgL/zpXwlnanDAhghthX3VWKQutXJto5hqUtTU8Leud?=
 =?us-ascii?Q?to+lV6si+qHm3GkzzU45u4NCgmxMZau0mZ8K9I5ewt6ipkPQ88Hpi/5G5UTK?=
 =?us-ascii?Q?WX10sGVZg8eha9uIyLymvEVSU5sC4C5KCX4p8AnqK+YZg9l7pmyiS4TgbZlf?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?uC9vhwB7yxR3dh69Swlgp59o4RqVdvLXkaDr++S7LhkHONnHW22SxqbHh362?=
 =?us-ascii?Q?sGHNR3ffAM5SYGY59ipuBs0uVDBrW7DykKwcQT4x8+i6tPkJkDgh9TXF+9Bs?=
 =?us-ascii?Q?mKDmBCk8krSG+G+6RrLTvP3RSyE2cc+OSa2N/Nr7/fbnUBtgIjGs3bNdtI4l?=
 =?us-ascii?Q?wm1NYvzfsscBN1o48tYGJRUsgFM16PUk8vyWo05AgcUMOmhpS8rwIpF3W+hs?=
 =?us-ascii?Q?yb4q42gGr9zA8aH4IUifma8OpYOY/GuErADrIFL+PEufZRnU1ZqevkPmvK6I?=
 =?us-ascii?Q?GPOJgykXIo2o5++sTZvRkmKQgZWzVlL+5q9RJJAG7G5uNtcN87GFO/p5D74q?=
 =?us-ascii?Q?+39BztWTl17njiFUylwWW5NzYGTlmW8za/BJU5eAlHoGj168gnpXs7wyEayV?=
 =?us-ascii?Q?uCZrWKF5WQ6lGvxzcdwt5edQVaOnTnu04bQyRtEG/Qn0xNOqQQbphjQok5dD?=
 =?us-ascii?Q?lmViWsoQg8VVKmJWp4oxeukqI++PZVUIuUCJYBBPdK2dNq4poX2Ma/ImVaXi?=
 =?us-ascii?Q?LmrJDwT1sMmnjn34xGpfLJrKE3S98opu4gy36dZUrORCTwBgs6RjzGh8vK9d?=
 =?us-ascii?Q?b60HlJ/7dfsBz46U9UijsFTLcILM7MheLTu19iQgMiy7V0pKFbnZQxgqNGpX?=
 =?us-ascii?Q?947cI89ZD0dct2sgYnzKIHdXSgmvp93aGQG3TyMOi/P0V77p9sgMrbBUpFuP?=
 =?us-ascii?Q?ofMqm6VQ4DvAP53ny8BWwcS8C3lgW5ijk4+G4+7YqjvaxBcxjaTQ7Z1wfpUU?=
 =?us-ascii?Q?/2CbpPizMgYAOQZoIVzpAuJGN2aF6kLWh1VzVAtNMSfpG0WDp/YnQJnSmAfj?=
 =?us-ascii?Q?x6nqOn3/4HaKvckb5hFREz0vkd5B6j2FCsDm4f4hN0AZVKxz5xGgleGXDTYP?=
 =?us-ascii?Q?oMZuG1nzHueEdLEF4oFNTYfT0SshbByOP4z5a2waqpIJQJCRfzHL0ywLQKkA?=
 =?us-ascii?Q?y1Bbp0Lgt22hlaC+8QgSKDUsGDxUqaQajXmM9g5C0O1mI/+JMvhEj0JOT3BV?=
 =?us-ascii?Q?QAhGM4eFJucTujG6MSxfCoBGiTevM1BE8q/H+/tCZ6ogJepzFwh42ejjgWJR?=
 =?us-ascii?Q?B1mhr34oVKSPDg5uc0jk6o+nj7C4V4vGCYvPg839o3OBz9ZCwboS1+GohKa0?=
 =?us-ascii?Q?XtGIIuTWuadSt2tbv0jOu8a9wny6eQHRSNo3VF4yW/rEjjEfmuHK0fwJwBs3?=
 =?us-ascii?Q?7rTAtNV54o8blvoJAf3Mf+MZ+07NbjcojvXgEDDXRsCqIwGVsgwtDX3J4+7z?=
 =?us-ascii?Q?pu/wvo/1Ar29pY/2KGhA5HS4Dx8p+hazs7AnX+O1o1zKxCmjqPKR2+FBbjT0?=
 =?us-ascii?Q?jDgkMwSuGyt2BLH1GIxt5dVjpJAXtx7i79q2tP4T5YBmnJmfPKL0DSoTMSdr?=
 =?us-ascii?Q?wDtn2f1rt/DZYshDnah/GOyESIGExo4fNCCZyXUtOYjed36kg5YRxZ6fKLF9?=
 =?us-ascii?Q?DKigy3DZXYrHoLGUmetRcmoMI75fa+EKKpnu3aqHGnh1LorocjKP9eOhpMAg?=
 =?us-ascii?Q?ZDVtRrjiSX6N7ayYcWJHAIhe/HXgrwsYbcJd6Kywl4iJnrucA5LULAXiHF5j?=
 =?us-ascii?Q?VCgxuPODUh0rICMZX5iZIY4Eke5eRBJNJfjgI5o7avjZGReVpeWfQLzQ9db1?=
 =?us-ascii?Q?fsxp0B6O4ewW0ujHJaDMKlyWLLcRd23sX8HE8XgN0r3FjP0IpXySFdae2t/u?=
 =?us-ascii?Q?+WqJhR1nDvUPxHbUqXH0qu199iWfeElZMiv5aa6M++0nJtjrRiCRCfSdroGb?=
 =?us-ascii?Q?mcoUd9b4nIbMzFDlZZyWdFjniqVeLavGLVRiVmoFEsWD/N7Xsp4EsnDQl2tl?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	zUHGVt8wYRaUsIDpWrZHnfSpAMRq5J2hHy2YTVGMVLiITkXq+s14EdlFLzxte0aHJjNLpqYtuvcTRkBLnuZ52DBurivfrBLiymjNu11D0Th9BGAIZoS79HdENpqB0ymjKdidcniul/qPk/eNJ32EjEw3QEA0QdXkkTRlhNO7Qlbxm1DHwlGyQAxQgq1Bkib/AfOpqYFcL/wahT6xuy6TLDoyZSaxzcOp9P6ZLrpLgdFp6pV586Eb82mnEZncnJruXc/tplynhVSiHZpIjrqKDub/azKJxI8Zu0/3/fd6KPePoBtsKZ7dqD9C9nvaxR/2xbLwrVhRpoY/FL9S+//bW4MsbgZX5rXl5r+6HmThcOIEoCkON+ADXI/1zTF6TETsc4AyjvNY0cX7M4eg7Z3+7/+H3XgwG0t4OQZ42Zru13rT3RaBnJHBcNuojc4xdaXfnd75bQsqjpRaLw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a722096-61b0-43d1-b80c-08db6b6a6c81
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 17:28:23.5659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljgG/kgAFL0mZ02vUruemfXQZowuACaoxCGpkK6CQR0wIZHPNl1A5OcY8ysl1K0eaSzm2uiCsvNB8k/0w+G5ZU+FeIURXmZ6HTXGD87TOUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6975
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_12,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306120152
X-Proofpoint-ORIG-GUID: ftj50a_Ou8lkRxGiBSDWdNRAb88XXACH
X-Proofpoint-GUID: ftj50a_Ou8lkRxGiBSDWdNRAb88XXACH
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
 arch/arm/Kconfig | 29 ++++-------------------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0fb4b218f665..1eda2523134f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1639,20 +1639,8 @@ config XIP_DEFLATED_DATA
 	  copied, saving some precious ROM space. A possible drawback is a
 	  slightly longer boot delay.
 
-config KEXEC
-	bool "Kexec system call (EXPERIMENTAL)"
-	depends on (!SMP || PM_SLEEP_SMP)
-	depends on MMU
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-	  It is an ongoing process to be certain the hardware in a machine
-	  is properly shutdown, so do not be surprised if this code does not
-	  initially work for you.
+config ARCH_HAS_KEXEC
+	def_bool (!SMP || PM_SLEEP_SMP) && MMU
 
 config ATAGS_PROC
 	bool "Export atags in procfs"
@@ -1662,17 +1650,8 @@ config ATAGS_PROC
 	  Should the atags used to boot the kernel be exported in an "atags"
 	  file in procfs. Useful with kexec.
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel (EXPERIMENTAL)"
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec. The crash dump kernel must be compiled to a
-	  memory address not used by the main kernel
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_HAS_CRASH_DUMP
+	def_bool y
 
 config AUTO_ZRELADDR
 	bool "Auto calculation of the decompressed kernel image address" if !ARCH_MULTIPLATFORM
-- 
2.31.1

