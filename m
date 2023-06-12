Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3226972D009
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 22:01:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Ly1gWAOC;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=FWvc1Fsu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg2ct05ckz3brC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:01:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Ly1gWAOC;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=FWvc1Fsu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg01k1t17z2xpv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 04:04:10 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35CHO0id024243;
	Mon, 12 Jun 2023 17:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=mFSrpiC1fGvDJIqps8r2Trwmdnea2eBFT19p5xnX1x0=;
 b=Ly1gWAOCaDmPFGCd+bR5tt0H17nwpcPSRzUcogq+LYuYQdAtF9ZTlG1cNSIhyrdTS2FY
 C8kAOgWFogY6Y+2dB6PAh0P5Bs5uN37uz9rRTgOXsxfLmn15BJspWsnaNxFUYKWD4XIp
 iTYX2vu1JOlLgMWPUGLBzygjpteJqKoRPvtzlG0aNU+ysBWOWsNVb6tu3dlLifAPGP1W
 JD+4Gm3F19/W7v99OGBQCuXL8kPMboY2iDUgjwT838PLIX7lBZvBSSP7RPjoUzmeHCtu
 Co39hBrIUebB9DXihCsoxxPM7xyyKdt5gP5WfDJn9ABaLf1FbWIT3LyBCYXjyF4N08sy nw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4fkdkf2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:44 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35CGJxdi016254;
	Mon, 12 Jun 2023 17:28:43 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm32y8j-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQvf/En0FBXTP9lXgIPAnetohlroj2TeuDfcIDly7I4fgQ7coNNPLNy1NvK3IaVRTGM3+sUdMsGH28oKs4VevR7J+5S0ETOm9BK018Hc+9HphDfk3I2/eKfjAI6pfxema9gQSjSbhQEvZZfkJtdVo75cTbU5HYIuWXBjBCYLeSyp9B+9BIgIbLVuXYo1lXxw4WMuvvg7O4IoudLQGsmGl5/ASKKS0PbQ4QJ8VmSnwBcCISrhLbck81vhagKZKRGDOhRgMD+y63CGnx2E8YfZ6ac0pVdNAX2Qxck5163gHclD7qXQwrDbsbkLijHh135n2bA2GYnqytGtO1JOoELr5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFSrpiC1fGvDJIqps8r2Trwmdnea2eBFT19p5xnX1x0=;
 b=VvA6VqKvoZp41LH6RINAYgLaA23JDRem5/cD2QpyhgvBZS7nDTrRsJYCqS+1kkwj2Si8ak/cEilkHbV9aztW38xCBh5QgChgCJPCRJxkZkD9er3jLUg2Je3wUgognbqsIhzGG50DCmBppn5I7TrBbhY1DyVHvtlG33iDtFeDTRhuw7BYc7N9kze0I0NhEurn7jpi6aEPuZkPGtRB41DMe0ARl3RHjudkWvLb4OTNZYVLLb79GIdfrw1FDluInrwR+LPfuNb8mMV6zAPOlV/3N1g3cLtZBMzgeqwYZfUVbnkfNQHWK3nTLV+Nzfpmd51jj+rQzGZc04y7piMpbBjQLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFSrpiC1fGvDJIqps8r2Trwmdnea2eBFT19p5xnX1x0=;
 b=FWvc1Fsuvxlk0uiky5248aYFjcUYKHhOiAI/MbRdW7JqA5TiV+mi1n1xyCGBk/gxjzfccf9ERRj7XOwebiHh8zO0GWfuockcHASlJBcpc1Ay/xlaRgW4x4Z+KS/Sqw3oBWouPCgBughjpV/VfRNW6fWHmAxeV6rJupoyPKZ+YLA=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DS0PR10MB6975.namprd10.prod.outlook.com (2603:10b6:8:146::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 17:28:28 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 17:28:28 +0000
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
Subject: [PATCH v1 05/21] arm64/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 12 Jun 2023 13:27:57 -0400
Message-Id: <20230612172805.681179-6-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230612172805.681179-1-eric.devolder@oracle.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0195.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::20) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DS0PR10MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: d70ff862-de87-433c-80e1-08db6b6a6f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dhNIekJpYI1XTa7qoaSXB36hIeUrnLI7Efm/C0WnNhiPH6an4a4P0i1o4ZDMu+pjy5NzIaPbHUfR2asgQqQAs85u5MQxVUyM5+vfbOF4j3X0+sHDjK7SBnu5dv8cuYqCFODVD885MQzMlGPfxsJk7+3dINKMek9im3RnJ1vUA50/YXjgYLRkGTCa1shxf489H0ORBcsT38phTR724BALA/arwiy5UOaX0JNDsk9nY+7DHYAcMZrH6xlMXNQLm3ZP7vjJmiS+g91JnisJw8UgbxfSW0+dWdxwhgHA+yW3IFN0gCddsTevHDTatnLizHOr4KzL8Z2BKkMt2wbPnqPVMHDIL02YSSv4H/1M2qPpb2VOFWraubfVtzYhhP4jVuIsiYetcLq1nO0qsCVOyo0hQtdhQzpX3VbsZsTaNXODz9KzjX3VU4torWRbB93Gf2ovnSjzpidSUIywT07wpxZO7L67zqKmSVYGqf93V47ZZQSwYOumfKDHMyXGtYIHReYFTYgFz9TCfTdf4S5P/nluOv24bdPujq8yv0Ss4RfnU4Os3V+OCkdb5nFmie23FsYZi2AenDdhLEMaeJH6npKZG6xFnTTlnIFRPJL0u1PoZ9c=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199021)(6486002)(316002)(41300700001)(2616005)(83380400001)(86362001)(186003)(6512007)(6506007)(1076003)(7366002)(7406005)(7416002)(26005)(2906002)(107886003)(921005)(38100700002)(36756003)(5660300002)(8936002)(8676002)(66476007)(66556008)(66946007)(478600001)(4326008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?cRAEEuORygGFjLAc054MYDxauZXCE24eDQ+dMHdTs4j10KSz4bfN43p8+KT8?=
 =?us-ascii?Q?n6kRV2whBmBq2a+Mo+wVtvSWlRmJ4ileUSR3gEbK174PgelX2VSpWbZqoymP?=
 =?us-ascii?Q?nU6cwOG0bP8W7oe/L2tVrII1LQDTVWnn+/7wnY33vjWaX22KjrBtXJDBwdum?=
 =?us-ascii?Q?ES5WJIx8kUtT3TgfqCMIChgR9O1LeChI84zaIFIXZrZDECNu86r9XhYAIEKi?=
 =?us-ascii?Q?qAnDxthCvTbFFVjMLSynp1rYTBPD6CgZhgeBbjOdp/oK1mahzsxuxPu2O2NT?=
 =?us-ascii?Q?8Olk2FzP6MxjtITfaMHCneUbEAzeXGy2vdrfbncHxbiIFBkyMH6O5GjyrBtB?=
 =?us-ascii?Q?OmyD0cJ914h1P4UNoeR9bSxMjHVD9Xv3EKfi9LYWkkVNhcVXgut5vknknw9y?=
 =?us-ascii?Q?81C2u8a3+C0i5Hv5ogwy/XoxKb4mP7i9w6Mx2bpVbNb2gA8mYgiWTGj5acl5?=
 =?us-ascii?Q?G0OYRXUvB67GqyLWxS1NnK0Hulm8jDvNN82W9nRw7bfOYJLMTAx9OfAUZFPX?=
 =?us-ascii?Q?nA/qs3rJKrEF9UJI9knRMG+Lp8NqGkHIPwqhAKsrfMFm7N9xP+u9NksKlqRd?=
 =?us-ascii?Q?dnEGMAeY0GoZpdi0uQZUPohoEDKNWy3tSmgLNm09Vn6cZWUb5S6dlNwz/6Vn?=
 =?us-ascii?Q?QWrcv49RpKGC/FXubb0qyBuzIz/r9SmzdRofbS/he75A2vEOUNRN3BLl58du?=
 =?us-ascii?Q?YW+2gmoo8OqkR1Dcb5/SAX5K1LPj208RmhdUbYUzF777q/kshuavnpIPhIgX?=
 =?us-ascii?Q?mIhVCPUFfNFuRYH2i6DXoEj49uCcK/KHLV31QjMjtthPwKI2h1dNPGP9mx56?=
 =?us-ascii?Q?oB0Qi9c9z1cFmnI44vX0FGiyYtoOsYc28mZsjr3cgc8RY9hWDdhafF3ZKa/y?=
 =?us-ascii?Q?Sq4Y75m6XyIYCuv8kFLitQgilFvcDlWbMuqDYmDTvlxDqjVGDhet1rcjU4K9?=
 =?us-ascii?Q?rOu9STaRofUzFqfIgAHkE7cE9qH7RG6296CsIli89AshNvmwxnoT/DdfjN8k?=
 =?us-ascii?Q?ZIe8mBTmx+TXfxYmOqrVcARsMs7Di1LIbp544I/F2OH7z/FobO2x545RIN3D?=
 =?us-ascii?Q?n6nI7l4fAFa3oOogYbTNTLSTRsP1rOnl8Yq+ksNoCc98Pu1ureutTHDonq8y?=
 =?us-ascii?Q?caw3k4atJCoOfjoctTZEvPTHRXuGo6oP9JO/B8Z+QuFmFl/RS3f9C6eRc6Av?=
 =?us-ascii?Q?k+lMx0muiQFYXa4E9/Zp2olvOfB4vSi1G7YpcT/5T1hfKCCY4th9rrWW3inR?=
 =?us-ascii?Q?q5xzjWToZAiW7TAbEmSsbYFXLmxanzbNpYzvAf54wQT9QBgzq7E2dYxwRiWz?=
 =?us-ascii?Q?FnT+REFZVjYqPFjCt26nX9ByPNPPemMuWfvaVqpRGyG8aXqsjt72NLOWH3+l?=
 =?us-ascii?Q?e86+M29vJi7XApNdeqO+nKOaowXaFarD75+mlit5GbIwJA19jfKqivojdTGH?=
 =?us-ascii?Q?CJAe7QucNlUlZ17hjzxL2USDRlKdn/50TGZU1xFYpKkIGwKUEOyUhCRD3Kgr?=
 =?us-ascii?Q?9LHXce3/DKkcWIHM30zllpo/F1TCD/2+m6UeSsE2ynrFWyId6PuCjWmXR7kW?=
 =?us-ascii?Q?7CWXgXUuJOOBRtl1jfmFltSPW8IS9g9yIbpHQFj6ddtQreSeWwCnP0pSkuX0?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?BmAnEoCfnpS3YSeFh/hex0UY8YtZE+r08zlPGYnIrREgLRU96a9DKi40A0eZ?=
 =?us-ascii?Q?Fq9gjx1cr7Uldrf1f/dZdA8Xc6PNZnEu1PEMZU6ziwhdXppFVJkzp4om11cp?=
 =?us-ascii?Q?CyNxndHdgBDihlLl4HYt8BdP5qomJeMhqGWwSh/KHAktkRL15jCsHqzW43Jj?=
 =?us-ascii?Q?TJaPOhpC9bcTZW7OqYXhyK8ebUZWV+mu8xvtWT4DJ/ZJYqZK7/4aBx23+JZT?=
 =?us-ascii?Q?W1U3j5SYezDV3uaAJ6uvT7MUVPSXpSJsvOMXGMfAIcTu5+4oTaexw0s98apd?=
 =?us-ascii?Q?9rKFG5bsQbQqCz/8p1MhlXiW41FNhqEPum7bM9tYWIwj8nkyPcjANBLzjvd7?=
 =?us-ascii?Q?YIJv+e2maa4F8/cy0pgmgDrPHfxdz/LTGVtRA0Vy+HwlR4usqTLxBU5Lm/4o?=
 =?us-ascii?Q?vMn5zhlWshe2vEixb0MYFJUVHlLXU1zKzZ+83xBEdcMgM1I68EB0ik3Jh9fl?=
 =?us-ascii?Q?VskyY2fYUM87mwVrQCyA4jyd1dvIbVfkszPtWfGWGY/XvZAxxoiTIVJ43GOg?=
 =?us-ascii?Q?JKbtDcNrFrvXGpCuaA7+NpalFFGfAYCQ8/PuQAiuLPWHXBcOn7p9gQAkszIG?=
 =?us-ascii?Q?qhCff8eJDVaPye7WZa01YqSGhl4nTFebn8qQUCC9Ut8hT3FDm9oSjiFxIKpK?=
 =?us-ascii?Q?V4v9tCXNROlBmdVfwFIPers/mrxzOd/mcfOLwaGu7oOFMe0lwCFilVhRBjmJ?=
 =?us-ascii?Q?FiuBQ1K7A2LEj875eAW+6A5huSmNpMBY/P00k4JwJ7AEepCm7U5AHFB76Ght?=
 =?us-ascii?Q?7+rzpP1Ek7faZEtv4yi1a2vu0kdh5Xw8m9soz9ObMt+8RqK6yMoHTG3W1Pxy?=
 =?us-ascii?Q?I9+JuIMJfJGlJwi2H5nzAMogx0lNUtp0knxn1iYoyUk23qjC41IN1cg6np3v?=
 =?us-ascii?Q?GfK9wpderdeWZL/kprUyu1crq6u6LuP719yauTy4skBklO7ny2/BivjOrq9N?=
 =?us-ascii?Q?FH+xbDIIEN/fGYG01Fl8LswUbRWKfw9dfZqGDEU+fpVPQ8sye7PWD5qQJmtc?=
 =?us-ascii?Q?PMTe2RIYoIMw3xSdT0HJX+lNlvsaJmyIlHosXXqBaLl8e+7Ay0ttEfVyPV+V?=
 =?us-ascii?Q?QLQK7pNw5BBniEUR3raSrV5p8tD3SBJLU0ye7VfArbq1qUFQLtXSNT5oSTMG?=
 =?us-ascii?Q?ionI0FN8nqsL9L0wCxiw1GjZUaYAhP9kfDvdmygFOas8+t3c3ICLOtbYn5lg?=
 =?us-ascii?Q?+is8tbMS41CmXxPozqVOKT1cazB+MVli2f/TOhP2IsUTKhG/vCO9c3LMQWOw?=
 =?us-ascii?Q?E1/auDCZxmQLFsn7Nhw4SEqMrlRODILBD+Do/IcX6BmTbVUUg0fpwuvvxt/o?=
 =?us-ascii?Q?AhvWwkBIgaRt3BJofMFJkg/cGhsx6u9TmE8xXi06OWn0CNcJ7wSqWpQRzkF5?=
 =?us-ascii?Q?acahbXkbpPl1ANzqUvShCqsMLKH0nNPRp/23A1R+UYqslfuEnA8G+4G6WF1e?=
 =?us-ascii?Q?dJWhcgfwDxivFU8N23a0q2X4SSJ0wXyEjnE5hr/3hzz1npD3CF/SbDLKdynC?=
 =?us-ascii?Q?gw/mh+qzvA5ynrrVNLlnOo9d2XzUextSd75Dfhed0L9ho7EDb7L9qGTOIp+f?=
 =?us-ascii?Q?VJSCmByIXU3/V3xsXF7uChkio0hgJqQ6/YdPslhArJijlZlxRJhgl11MxePO?=
 =?us-ascii?Q?U4omGO13/8S4jv9TYVB0/xrPWXuduSCcDO1+qtqnlkfEBHD3vAU6umq3hgjt?=
 =?us-ascii?Q?T6FtoWPwSlDxKqkR2a5AJz3oVEG3hw8s74WJuGkjaSYormyjtOqZNbOvpfVX?=
 =?us-ascii?Q?QCrVnER3VpkSatg9Ynw+xmJdLIbgLS9BMpGjttPeuSbeprZR2eFiJde3ZsBQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	eIY1wcDhWNglkeFr7OQHmRxT4vkaMjk2rctNkt6PsRWVtk0G9SgMjgpVdzforip2+IlpSr/87WmNXzEyO87T+bs/0M3dyezcHvUgi4Z7NWAO7hsmQ16XUj/3xZyUL0MwyMiTxp53yEgbqko5YFNkNIKOSkfGusOQme+Em1nwOZb4h0iimEF0A8/zy3DdPNoeaQ4C6IyFzPSywgviUbMqe4no7qF6+rSI3noUeykmWfDjRo3E4GQCquyOhVlC5yDlOAm1DA4B0bnwSncIFT5yKWVAMmjdkCer6MR/VFv1yE9E8HaZ8eg6LJ2v0qzyiVPHv5YJdYLwzq3XLsrAEQiPRokzGYGrl+KLkZ+ReQScEun0LM85kwbDMe9yEUo8bOpkaPiY2WfnefGzvqoKTw6sT8hmWc1PVWdvbIu3y4buDw0gy9ZCMElM1Gd2miZ44SElvjhTzPVWdY7FCQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70ff862-de87-433c-80e1-08db6b6a6f9b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 17:28:28.8041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRWqC8NOvLMc+neNIDnektObjBwk4blBaBRdSpKJNoZ2A/Tg4+Ck8XZzNWSgqjooqLCIz/4DkGIIlU4JmtfF0TWDSSdpMYaIMjOQZpVwQQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6975
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_12,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306120152
X-Proofpoint-ORIG-GUID: 1pXocdL0AlywNYOOcYuB93NRhJtE2SPa
X-Proofpoint-GUID: 1pXocdL0AlywNYOOcYuB93NRhJtE2SPa
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
 arch/arm64/Kconfig | 61 ++++++++--------------------------------------
 1 file changed, 10 insertions(+), 51 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 343e1e1cae10..33552476a877 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1433,60 +1433,19 @@ config PARAVIRT_TIME_ACCOUNTING
 
 	  If in doubt, say N here.
 
-config KEXEC
-	depends on PM_SLEEP_SMP
-	select KEXEC_CORE
-	bool "kexec system call"
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-config KEXEC_FILE
-	bool "kexec file based system call"
-	select KEXEC_CORE
-	select HAVE_IMA_KEXEC if IMA
-	help
-	  This is new version of kexec system call. This system call is
-	  file based and takes file descriptors as system call argument
-	  for kernel and initramfs as opposed to list of segments as
-	  accepted by previous system call.
-
-config KEXEC_SIG
-	bool "Verify kernel signature during kexec_file_load() syscall"
-	depends on KEXEC_FILE
-	help
-	  Select this option to verify a signature with loaded kernel
-	  image. If configured, any attempt of loading a image without
-	  valid signature will fail.
-
-	  In addition to that option, you need to enable signature
-	  verification for the corresponding kernel image type being
-	  loaded in order for this to work.
+config ARCH_HAS_KEXEC
+	def_bool PM_SLEEP_SMP
 
-config KEXEC_IMAGE_VERIFY_SIG
-	bool "Enable Image signature verification support"
-	default y
-	depends on KEXEC_SIG
-	depends on EFI && SIGNED_PE_FILE_VERIFICATION
-	help
-	  Enable Image signature verification support.
-
-comment "Support for PE file signature verification disabled"
-	depends on KEXEC_SIG
-	depends on !EFI || !SIGNED_PE_FILE_VERIFICATION
+config ARCH_HAS_KEXEC_FILE
+	def_bool y
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel"
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec.
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool y
+	depends on KEXEC_FILE
+	select HAVE_IMA_KEXEC if IMA
 
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_HAS_CRASH_DUMP
+	def_bool y
 
 config TRANS_TABLE
 	def_bool y
-- 
2.31.1

