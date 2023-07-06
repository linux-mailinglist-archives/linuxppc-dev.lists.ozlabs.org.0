Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5F974A773
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:11:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=T5DDSJG2;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=DmlAJUKw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxsjB549yz3dLJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:11:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=T5DDSJG2;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=DmlAJUKw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qxrbb2B6mz30Q3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 08:21:31 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366LriBa001317;
	Thu, 6 Jul 2023 22:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=HEjxbCekDzod+atU2kn1FYexmGAjLI57PU3T0wASxHE=;
 b=T5DDSJG2rpcA28+bibavbUE9JVOZ0SOja02t1aSZWqkQchQMTta12eJJ+aTzxOoH/sDQ
 QJWMVbLfQYFuQzuyQWnYq8pMcbynmxEtWsybxjYIt4Xltq7wsmqy7xILL/xI7htkMR5G
 3FCyZISxXioaP1JnQqYu3VIKvx/tUsCn9C/PXbobyM2eeHbv/mfi6VK0FrI3OYuT6Ot1
 ZOEz+moTDTZpe86FL3kkMuWYU7uWQbx4PcK80PLiO54VsTMYk0c77Sv+WcNiPWz1deFD
 JaSChHv9iOlUWM1U3/rc6sWPqTT1q5thzbng23FzARRCf2dhDdIqMHtzigTF3ooxQrXO iQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rp4md85s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:21:12 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 366KTuWJ013430;
	Thu, 6 Jul 2023 22:21:11 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak7phf1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:21:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvLI3YvdfGgcks6FBj5wA8YDlScs1KLE2iSwpZEK31y3exTgk1kZmryS2iVk+KB55Q5OF8k9snzGyL42lNcM4YpjhvNmIVMW7yOffAyOJqZ9z4NSxoMbuzGOMjYGSLsm+dwlTig/ojHColHML4UI1N3V9dtmFTliafyI3fYHsKVzvuBtrz4DRFTJnPHvXy9uaBjWMsqd6tephSUz4mqdN3pkbpKjAeDkHJdWoJQBOG2JrvL46FwV7calPNvLXzRYgs/+IA2zW8lcN4R6vLS5+UN/t6STwJ+tO2ymku07+gJ2uTvBoovk6IzQE6mw/9iSAmLmaG74aZTCjckNpSMNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEjxbCekDzod+atU2kn1FYexmGAjLI57PU3T0wASxHE=;
 b=AYpwPwACkE8tKCFXpjH7HIy4ws6qheycxaI6nX9OqUEgRgN9yinlCAiJ/ZZml5XP9TQzFpK8tFWtYpmKLbYZhDCGe5WGU19xmWdIMjPqAaFcCgU68MWIUb8AQEElae1mQeAMOLO9Qg7qeRWd7n9y0G+84ECrbH3xZEJNV+xcPxkxdc/ehVaRyfIUacWucpZJ2sscOs6atUQ+0gE9zVb/vWs2RUOJXrZu57tDVNL7py4DT67DndHYxiNx8iDkNL4Gxo7v0gAXGjdZ7ziYuBxuE38hfVij7XYpqB3oQXURldR4su5tmC2EXJuYy1zZWffB9adxorHKyXfiQLRGPxAKHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEjxbCekDzod+atU2kn1FYexmGAjLI57PU3T0wASxHE=;
 b=DmlAJUKwtYr3BsyuDx+DOMkjs/hCVGjZ7O5POKG4TwpR44b5q60BfOCM3/A8BN4eurZkrjBeFq4mtbuBuEi5e400H0gCvmEqKDhEquzvtWiozHauLDfaGnhK1j4Z+nEaPbAdOwzSbY4g8XRnCRC0sD4RTPqq92VcXqABS6Mm34c=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4755.namprd10.prod.outlook.com (2603:10b6:303:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 22:21:09 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 22:21:09 +0000
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
Subject: [PATCH v5 10/13] powerpc/kexec: refactor for kernel/Kconfig.kexec
Date: Thu,  6 Jul 2023 18:20:24 -0400
Message-Id: <20230706222027.189117-11-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230706222027.189117-1-eric.devolder@oracle.com>
References: <20230706222027.189117-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0030.namprd21.prod.outlook.com
 (2603:10b6:805:106::40) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO1PR10MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: 48143f0d-beb7-455f-e61d-08db7e6f4c57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Dh/bDCImV81UjtI/8RJFvyRM4CI0KP+8oCqLHQU30eA5dxPHD+13rGD0i2PvQPNrEqJvUVOjo/VlbCVsPEVluJe8YP88/00Dyyv2lbqP5W7Mw2TaMrHKV793D30WKy5xBZxeymJ/ETp8IteEzvUnL6SqRqPkTlI2eARaV/V+ldru4RoAF07fIctwaY/xpaTYtS4QFaBKGlPYwaxOnhC721gAQDLGObozOeekcJUmICXTXwV/8IfsUUIChbAILuhZyqQqUpmAAy7DvMZ627kxc18DZJngrnvGH08+itV3htSRljsFk5Yb1+Q1ge3+LhGidWAjyyIvOyr8razW7kwDsjyVOgiEYkZdkJ+YTWLBrgk1krv9NeoBM+V+TJRjFho1LlWS1/DwRzE9AesbfMFpbSAYMpiYDg2H4AUJybSYkuJcfgKkSFW7T3feiYmZ4x1ewsZUcu7XXje0sIKJ9CSrkJzJoqb8D9UsqcCj17rFW42hGkmjoLUM7MH0wYpClNw+UxznVJEcCmDAnupNJdfDM07c04Xc8B9DuBXdj0S3y0Bc4NQBGvw2ilPCXLopGh/JfF12Ngfdlfhx+nEwKbFQdI+QlKxfpem10GKzWO6d35Y=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(2906002)(2616005)(5660300002)(26005)(7416002)(6506007)(1076003)(7406005)(7366002)(186003)(107886003)(66556008)(41300700001)(921005)(66476007)(6486002)(4326008)(6666004)(316002)(66946007)(83380400001)(6512007)(478600001)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?uU8fk/i9ipqcOmUDMHXDpZ8hUHJTwo2CWaKhgZdX+sRxETnPydIoh/53LS7C?=
 =?us-ascii?Q?YgvH0mFbZfqAgFHND6ilrhtQ5SK7vK1MU0AeThWot62BTnOxOd8dc4+TQ3rP?=
 =?us-ascii?Q?zYmE7JgBDcNKqeHaDbt671/ywITjUImb4l+gN+G/u2zNv0oKw5SmESHQtzUN?=
 =?us-ascii?Q?yKxLEOOtb3m4DW8vAMVrp2nUDNq17Sf17mBCM8FyFOTER3DU2/XiMfvLy3mk?=
 =?us-ascii?Q?iNc4TgV5cvaX0Gvb7WFmbSbeWqa2Fjs7tzYeTk6X/vL5CXHjZ4bJfIGFofvQ?=
 =?us-ascii?Q?Aq95wfv2w+/tb8aXz9dTPnDe6U4Vald7s1tQ6eD6BO/M6cjoMvGL6bgPdcTd?=
 =?us-ascii?Q?1yu8zNtIdQMmyFrJJtbw0FZeNoutrmrdNyq3Z0f/Df5fvgEc3NYGDMJUjl0y?=
 =?us-ascii?Q?HkaTPqbJ0iMAREeYTHybpxbVVouv4HXIFdV5BvQjO04JBfGB3Zbb8zvAI7JL?=
 =?us-ascii?Q?v92D1aAn9En6etLjx5bX6XcR+zIz9tqy2MMkVjfqnfFWmOwISzOIglvGwzW2?=
 =?us-ascii?Q?pGL7R1J0YUDdqfqGYodAhwXVwgWgk+fqLbgdrztwrcRVWpW1QiLpwlYBfdqe?=
 =?us-ascii?Q?vJezUnP+joupnBVHnfzQfh1FwoGLpaH2VFDutEWFigpuLBLEDTlLgmmqkBkq?=
 =?us-ascii?Q?JI2vrhKKqGXRVNRJypfl7vteXLG+0F6y/tT6OjV0bgYBXMRqKFwaNttTwdZ3?=
 =?us-ascii?Q?NtckYLdGY0KWWYrHQm1yCwYwcuiJz6+Ms66jh0bkZqIcfy4gydFCddKjO2FT?=
 =?us-ascii?Q?yOnj2fFEFcWcXCebVg5dD95EzSFuilPUftwSvFYWprixQO9motf3M8eNcGbv?=
 =?us-ascii?Q?LSpxfM1vu/EfiCQBhAmBfJgF8RRjp6CmRL8mcFpfpZ4PZyV0x2JZLgiAEyAf?=
 =?us-ascii?Q?suC/VJJm3o1whqrFvt5SDM32Ufo5NQU/I9mKaVDHPfnZ834qIf3X39gY+1BI?=
 =?us-ascii?Q?8aiTkzjJxzuQmIiZHktr4YU9o8afzm9Io3ZDNOBl9R73ufDXU8nda5QMllY1?=
 =?us-ascii?Q?DcoghLTyWAuf00TGoy30q2vTCHUmHVsxHaissrVgio1FczjH6Y/9pyLqoyy1?=
 =?us-ascii?Q?XELLbrjDMBJSy0xR+moJ8vBI8F7LLlwa5jH7gO4pup5Eh5HDHASPHRQ0GPA1?=
 =?us-ascii?Q?BbVAj9aQauY+uarjNIIcdlaOinsp7JaonK/GzqSZO4C0PVn4yQf4L6IleYbJ?=
 =?us-ascii?Q?AvLsirfTQVpPdK6Cqf1RAFmtdMK74xLSEEnVpR04nNFANaYXvJUldGVSAgXV?=
 =?us-ascii?Q?GA5a2dKyTRP2FBpt8LmxlvNPbZAlDSNH7OKkRdvpq54fYWExDZ5KlVowCJ7k?=
 =?us-ascii?Q?N6fbLxtvJ3+tSKim3o3pInWQcWRCfLJAuLWur9RsyGGHeDg8QfLFkVzqaM2I?=
 =?us-ascii?Q?xLOkIozCxxruHn5tu87XXkxpWf+E9I9ZNY8EsCNXw5XB9EyjofNPY9ekKXU/?=
 =?us-ascii?Q?I+DZadDM3326xN36EFFD/U3atLZZw+C76NBlBGq6hOiNEWXvRvztBc+guwok?=
 =?us-ascii?Q?JoAZ4DPkgBBzR9suhmuN0HMHT5F+aTMWKR1XHWYR6GhwMUd5JT5uILDu03qi?=
 =?us-ascii?Q?9DQMWRdU2xIOYYk2LO1HWeQySsokUAi5N18JIJEXDdApVN3RGzrxJc2Tqcs4?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?MOB/2HQHZ5kWUGE21ANzlTQ2bEPwsWrRXX5um1fWcRZJTAqySeFJmvCq6ChZ?=
 =?us-ascii?Q?/SmxslEvJwfmIauVE3REbzQvgejNX2lg7LoTEiN+3ZA+qCD6PxuDYBI1CgBf?=
 =?us-ascii?Q?PXLs6a1RTUI+XMN/lnl1aZma6vDs86VpGuO7MuGk71QY+XKa95OHJkisey5w?=
 =?us-ascii?Q?JOs7A6fFE2AvTFRVpvBY9qodMeQgeFlH06Cb/hwG9I5+2NN82kXXuD59ti/U?=
 =?us-ascii?Q?7gv/dFMC32dZgp4zxZCa0in9S1oJKBcajc1zbHyBxC40suHNruF7bas8qVQ3?=
 =?us-ascii?Q?V/xgKJ6M4sIU/c008obQTUGGzNYap+uynh5t1LqzXRZNX1qO7GITWjZSTkU+?=
 =?us-ascii?Q?3hxugmarrSLkhzAdyuqgiV0SBiWlaavAP07jQtGGCqLk6uF8LcSiVumTeGma?=
 =?us-ascii?Q?xWgRrBu3Y/HwWh4i08nnagbXvy1IlcbgnHJ7roCX9trXUNB6eUCTwIaUC95L?=
 =?us-ascii?Q?rcoTJvpHx2mIhExONDhCqMUSwCTXHxTEaj+o4SVCxv9+hxYkbFs00U7yBf7K?=
 =?us-ascii?Q?2Ing2mQAnQfIGVsty8XC/WkvVhlt+E5YKBK/KlULyE5qo0s8jLfd9/tXHtFT?=
 =?us-ascii?Q?wKRRVJ440siNoCGztRFkLioIDX5wANiMIN2+2UbM1BQfwXvPfX2aKGrFniHx?=
 =?us-ascii?Q?J+5rUyuYYIY4dgAKG7e//JHMdkWdVtGEmcUa4S++y7Hy7nokXun5V0SS69c1?=
 =?us-ascii?Q?Pv8eGE0aGXDCbIj0KFn9Gy3p4xFvuYjvyroRfbKHLaOAY9mtPyDD5ymSZJck?=
 =?us-ascii?Q?46mY8UuO5FC6iCIw0Db/nJL8AtRWeRSzMG7YBKSHNDLop2ceQvq3ppdB+NEH?=
 =?us-ascii?Q?zTo8GZt59bNSCNx8g+CQ4tIahueApe3vI22o1KmMjedTaNsf7yJo7ATT5u/V?=
 =?us-ascii?Q?LI4ufZ6nQ1RWK878LbTVWPKHnE/2SMBt35q4Erprk7o/MKZ5PJel4u0eBFGJ?=
 =?us-ascii?Q?I3u0E2xwUzmZerDexuVtMorjVn0gGcKeRHzYXBsYw7OkbbdwDvY91zzAAeFh?=
 =?us-ascii?Q?FMWXk6jLuQ6UIM1mitsTtoYVsOJt978DfuEsX6HkLbu8+e7v8sJEbmxREMOJ?=
 =?us-ascii?Q?6jHol6xyqkcvSnhT18E0ZAHu7IBKSXjZ7M/6K4nGLXf02MiMbVouc9DwIrj9?=
 =?us-ascii?Q?qssSayToong1sitj9Mtri88oBxyK21IdxqeGuqYVz4oob3ToXT4C8p3VM58c?=
 =?us-ascii?Q?vbZ4Qy3unp/EqvO6HVRoqQxQERxTetl/+VQalR+HDVSX8cTA3jGU1ll0Qmu2?=
 =?us-ascii?Q?javtNRKw9jacKjqO90cC0hHNagGZHDzhXvEthkO5ceYKkBFkU+mGgRF61EEk?=
 =?us-ascii?Q?8RXFks891UwArwQJg65lRYm/xie5rK9mPfkH9ZvIyxH0trzPEbs1ddHCXaXT?=
 =?us-ascii?Q?HX5XlZJXRkdGLFL68gk+pqB66RUTslbf/9eaP+8oVlJICVjL+aXqKoWUyjF2?=
 =?us-ascii?Q?MSAxxJYhxe6Aa40XxvZRWJovZJfw0qeMN0l7b7hXig8BqDKaW1husI+MgfEf?=
 =?us-ascii?Q?KmPKs/P3t195Zj0xN2B0R8E5iE5KZU6JWrTLRBIaltyVvI+qDovYhrqPjvs1?=
 =?us-ascii?Q?YWUNQ3LoipD3sqji7xPy+Uw6ADAPbno/yxHt3YcwbpvzLK3CiiwZxRLjMSlj?=
 =?us-ascii?Q?ufZbiJt3xE3cmF+vc2hUn/5RjATKYFF7fdjoPReKS/xXrH6Z2TaM17XDsrCG?=
 =?us-ascii?Q?JOlKiC4JGHuHnHrqkDZCrTJiePhH7ZlHDwc81oVUhrw8VgsVR4DDxfxArqlS?=
 =?us-ascii?Q?/hgDBnXVZCNEpDMEy2tDuSXmiq1svLrCc2dyN8tqYH2TAqnfbqUMdCurrf1D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	3jL60ZC7ny/zzvtQU3LE8oRKVGNEiabJQWeJrvASKQYDzdIijs867zhiyMzfmXeiRyuJ+F1IQAlsSSeNt9I0N1r/Tm/a+FpyIOl8XwSqR3PbQ3TDyvXKPiqbIOpN5gQGQuy85Xn7QMVP6Sjrtj99b5bvnHuiDB8F2ngIHzK8+j8Am3HrDxyK4WtTxyCYaeWDoOV49GAuyoQUU/8EbkT0fLNOMlA0l3f6MZ85AnCV0+LxSqTp5+KRjW+90jRFdFx27d7LRStAk+vg08H8G6kDK081n6KqVbLkpmjSJjeEdYvFgtUQsGm4iJxKZ5z34/yqNGhECQsQpb1oOv5FUXBlcAqBNlVU6fjRx+6l1IO3O07n214jgngczgFFqjI+Px6avptqJRDoQkgsQXd+cYtD6uwEJ+yZSlXRxti2NlnQmEuYgbx6gImKKoucdkicEF7d1UrasdXlhMwXAg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48143f0d-beb7-455f-e61d-08db7e6f4c57
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 22:21:09.1908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNM9CjTT6aq+9hcWuZMQGUR5PJZASRyHVBiqwPZaCDsYqRxvR3XGQF5lJe1Wm6+CA3Aq96fN3KMBMKPvT4uprHxuJufm6d0CSYzcxxO7VTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307060195
X-Proofpoint-GUID: UxyCuUG5bHuI_1v0_zkl_52vBqJxcjKv
X-Proofpoint-ORIG-GUID: UxyCuUG5bHuI_1v0_zkl_52vBqJxcjKv
X-Mailman-Approved-At: Fri, 07 Jul 2023 08:57:20 +1000
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
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/Kconfig | 55 ++++++++++++++------------------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 0b1172cbeccb..1695a71777f0 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -589,41 +589,21 @@ config PPC64_SUPPORTS_MEMORY_FAILURE
 	default "y" if PPC_POWERNV
 	select ARCH_SUPPORTS_MEMORY_FAILURE
 
-config KEXEC
-	bool "kexec system call"
-	depends on PPC_BOOK3S || PPC_E500 || (44x && !SMP)
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
-	select KEXEC_ELF
-	depends on PPC64
-	depends on CRYPTO=y
-	depends on CRYPTO_SHA256=y
-	help
-	  This is a new version of the kexec system call. This call is
-	  file based and takes in file descriptors as system call arguments
-	  for kernel and initramfs as opposed to a list of segments as is the
-	  case for the older kexec call.
+config ARCH_SUPPORTS_KEXEC
+	def_bool PPC_BOOK3S || PPC_E500 || (44x && !SMP)
+
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool PPC64 && CRYPTO=y && CRYPTO_SHA256=y
 
 config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 
+config ARCH_SELECTS_KEXEC_FILE
+	def_bool y
+	depends on KEXEC_FILE
+	select KEXEC_ELF
+	select HAVE_IMA_KEXEC if IMA
+
 config PPC64_BIG_ENDIAN_ELF_ABI_V2
 	# Option is available to BFD, but LLD does not support ELFv1 so this is
 	# always true there.
@@ -683,14 +663,13 @@ config RELOCATABLE_TEST
 	  loaded at, which tends to be non-zero and therefore test the
 	  relocation code.
 
-config CRASH_DUMP
-	bool "Build a dump capture kernel"
-	depends on PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
+
+config ARCH_SELECTS_CRASH_DUMP
+	def_bool y
+	depends on CRASH_DUMP
 	select RELOCATABLE if PPC64 || 44x || PPC_85xx
-	help
-	  Build a kernel suitable for use as a dump capture kernel.
-	  The same kernel binary can be used as production kernel and dump
-	  capture kernel.
 
 config FA_DUMP
 	bool "Firmware-assisted dump"
-- 
2.31.1

