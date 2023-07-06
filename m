Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE36474A776
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:14:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=LyBv9vsG;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=rz2VZi8K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qxsm86Cy2z3dkN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:14:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=LyBv9vsG;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=rz2VZi8K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qxrbj44Zyz3bf6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 08:21:37 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366KoG8o031711;
	Thu, 6 Jul 2023 22:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=0Rza4AfADdwLznF7d542A66FZWUW0qr1V+uEkT8Vgzk=;
 b=LyBv9vsGcpZmm1fW+D8KXCODYoqulUJdUxZRrZQGZaG3n7crbYipKWoT1RENgFYYy+Uz
 y6yuB57tqhwwcKlm1051WSvYVuE1iPIvxxbsp37JA7tKpPVpe8wBGq95sEJG2HLTaACS
 oWW9Q6boeTyr6HE5C3d80PGAgv36M9Di2i2DlduFWT/X8JnEgVGCw3MeY02gTjFKV5Uu
 0WIuKemqLCPViQSMoeyK1ojKG5OzUEhHp1ppo2Y5zOd5tL/pjIjGsdf2jpavzHMO3UrV
 qC6rYcnkKzR58bSulH13d+sXAlhP4xgJoeAQXeKbGjpE6/ibAtqGK35JlXSpUoJv73F7 Fw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rp507r3pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:21:21 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 366KMmDo013504;
	Thu, 6 Jul 2023 22:21:20 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2045.outbound.protection.outlook.com [104.47.57.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak7phmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:21:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUBSVCgza+t6uLseOSWcpox8PmJ9pG4Phqe5J7/LhQo2zeYnC9ZuUV++1+xo2DWy8eeBWgNchKMHfuAmztvjMQ/nlEXOIMp4zXQx+V/oM4q4Sb+bMZOgbZfY3RSR0o8fvPMaeu0paC+Xnf586xIeN05SH8OFdfLUxENbgpvtEQRl4llU1221ofwv7xz11KNbi+svSkrU5efM5Kj4GJP/tFEamfyuzuHmF/8qzD9gG0/8lg68zPrzg3aPuETOf7f/up1+vUEbTwb99/h6+605uN5/eTH+/wkCWfJy5GKzRAiUVVHDJg1jzulQpPxeJcR8LoCOGe15HHcnnxEr7y9RcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Rza4AfADdwLznF7d542A66FZWUW0qr1V+uEkT8Vgzk=;
 b=j4o3rYXD36vxLssNayKECoOQC1bMSa15J0SSjXWkuZpuGEn0R9HuoGahJ0LUQdWcdqDbhHItCDg+vh7/ZkfQOlnpDJMWCxkyoFxG5pQa0gUwZEz8naaGZ5IrypDBUYe4WxY/aEkVDflwqSpalZbS9iCOjgyp0HYFFEC+MkGm+0gQS1mscxRvmRq/i3LukRRSudq3btHA7mFFwkKSazyPCoqCgFrnDXyjRw534twVuIOIpAJKPODfMZn/lT8XVWE2+NaG0ZF8tDC+d8PP3vEY+q4WhaMhxGQEhc+jiQsvZUeDt2AWeAzlLVGSQEnhbSjFkupuOOPjbz89IcRO2xd3nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Rza4AfADdwLznF7d542A66FZWUW0qr1V+uEkT8Vgzk=;
 b=rz2VZi8Kebk0eBiLuhXno0i7ZZ7lPlvLo+rS44Yu00jZ+DcoFohwTyEruGdqcIsICu++/dTIrY+A+ut3my8SdDVU5dhd1+xfOptpNjHIOr9jqvC6f/wl9FiGjS06hsMOo3g+R4VREzEVUeqtyIql779VgGyNAhm170IN9SYc9P0=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4755.namprd10.prod.outlook.com (2603:10b6:303:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 22:21:17 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 22:21:17 +0000
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
Subject: [PATCH v5 13/13] sh/kexec: refactor for kernel/Kconfig.kexec
Date: Thu,  6 Jul 2023 18:20:27 -0400
Message-Id: <20230706222027.189117-14-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230706222027.189117-1-eric.devolder@oracle.com>
References: <20230706222027.189117-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR12CA0007.namprd12.prod.outlook.com
 (2603:10b6:806:6f::12) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO1PR10MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: e65bf768-9ff0-4e66-891b-08db7e6f5104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2mzx8y6W5PT40NShYR84crcrWqv8DHQrn/w3nx8CxrtKURh4dV02TjnlCy22CJQEbpyG8K4yESLwmIuvYcGmyCGtSp9uZZb0mFmvUZ5NcEXyGWzH0Q7ERgWO/YL3z1XX1On+RrAY44y3HeyKRlYKJ0k2nzO3j3e+ZhxQUlDxye1uHU4PdGWBGpZKDit5YMaRf+rMFZkws2s28XAKBhK3md4dh7PRYVtj2YD1GOdbklMIdWBZG03Gw7xnKlwh3Mkbhzaq1i6r8PSNEnCrHCc2ogCyMa9ppOoK/7WggB5/mecfDNokvpRb4+GNgf2OBNDkxUIM2ubwtGkTSDk071KdUMwklJQlZuVFQLGZ8oZuZ6Nyy0VRGhirm+UOb/W81Sw5s1ECbaTS65ze++KmgVPSQUMD7VjL4cPt1AqTSn/tVSzYt7/wSTBGTTV7/WD7rTmKTlmtF1i8pct1ljDgGnTxMma7zz4LUJ5rrgFHeD6rIEGq74HNemYGrS0IdU22ODz8EZ1O1UIVlo95lnZQJpWBDmyImG9ccNSVy27JlUN+GGPbI842+0g4MkhKPO9w7Hn4gnfaQL+fvjfUKRhqVbjN/eCb0xsaQ7o9Hlq4ncbsf0g=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(2906002)(2616005)(5660300002)(26005)(7416002)(6506007)(1076003)(7406005)(7366002)(186003)(107886003)(66556008)(41300700001)(921005)(66476007)(6486002)(4326008)(6666004)(316002)(66946007)(83380400001)(6512007)(478600001)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?hdnScLWHe4ClVVziDVafMgJFdSxnYe4xCyTqORs98F+kK0ViFbtOtgsevY5d?=
 =?us-ascii?Q?ronzGqph8UnIR4l2q0B//opSw2CmVgOkd5FUIam90D1eptzLYCiBNqZx0vMQ?=
 =?us-ascii?Q?9aGRkVKiD5RnQ/DwDViZefftaw9K4bVfbYtmrWuahi90Zl7rMSoCzIK+v4Lx?=
 =?us-ascii?Q?tl2cnCNW819biad1tzXU+DvIVxzCW8X2zc1KogACbI+4m1g301vrvjVhBkJB?=
 =?us-ascii?Q?Ab4dLEO2nq+Fj7Pjl8KRZybTuzuWuhnEfKoTGiVqERjFPxf1IZzcywbxjuXR?=
 =?us-ascii?Q?iFM/UFwyLeSK6C57RLI+FppGvhXpAaco8pWB5oWkJXLxwzIb7WDJuo1dg04s?=
 =?us-ascii?Q?nwXjpp3CoeRBy6BZJ6vsy59Nd9uKSnLO9jvFha1RYnO9sTZN8W1AebXhKdqE?=
 =?us-ascii?Q?HBQx3CnCNfyhsi2yNOq6Ijyl4BVY+UxHuzytgUeSdqysq38DzzLtYmXFwpZi?=
 =?us-ascii?Q?PK3T805IZxkpz+UJbGSXOb9NFWXxCIPs5B4xmpf9JgwEQI78eXcbjvA3x9Zm?=
 =?us-ascii?Q?+3e+T71WUr5fyrgvsgIgviWtIAeiRbfcpi6MW7D4oxjrhTfvjUnt57POF5g5?=
 =?us-ascii?Q?zxJE6j2Jmw9Alk6tZrpmEZwjI9D2fhbKg7OWTVUuwPcWw38bGpiZoEs8MJKN?=
 =?us-ascii?Q?3dSc4HvkihodSR2V2/gJx3blCqEVv+Iqx0lGQvS1TxGVY+70NKgFsVSAMwYC?=
 =?us-ascii?Q?rtT2U1HimwmJAI+QnM1zdFYw7qUJ3IQlh3AaxXBZpT1gKB8TEHkAPIrEM/HU?=
 =?us-ascii?Q?dthduyfvXEdmobVjDa6vbzZ1PVpU0vhhjo56+1IKMr0fqQOzoQCiwCU3nS3C?=
 =?us-ascii?Q?cal0LkHHshYusrL7g1L/3ke3mu8Tfz/OwG7ldXXbQZYcvfHyJthZg4+OyYRo?=
 =?us-ascii?Q?mLfyOPJiujCSMQo6vpa40lG35Y8f4ZcjqvLhSunplGmk9E9jJqpNkDvLLR/z?=
 =?us-ascii?Q?zPxrq5bkTX4cWQLGdEWVXMjg6a5ilUbLiB556EDygai4DNjH6idXyapyJF11?=
 =?us-ascii?Q?n6Fpr/1wvVZGIDkMS77024iT8rFQiRczFfHxza1jU/B9unUB0MRkm17Xu8ar?=
 =?us-ascii?Q?y6Kz2iGx94Hn2EwzjWk6BRzPNsO2j1iefRrmNLCWGmO7hFLF1m1/enk9kgIA?=
 =?us-ascii?Q?x73d1cxWVL/WMS6KJc26eLRwaHalnJb7qmGsN1KvePmEGDxanmOG1/nG3pqE?=
 =?us-ascii?Q?UDOGq+38UCwwr3C6VrJD4gCO44kNa+6sQvLxejX6Tc6hRp7yvkbOJ3JQIbsP?=
 =?us-ascii?Q?4nnI0/ZCKSG6rNgMFbvpnOSMzSbClWcmcFcHAxYPs7R/LzJ4sHYPowMGmJJo?=
 =?us-ascii?Q?f1vXpfrgJTlckFRZnvxeiRVJpNhm9frnDLQmWG85cYHQeQ62kcULTxK/oM7/?=
 =?us-ascii?Q?0QlKiSiTosG8ZD9mIKd17sgVIAVoHH2InuAj5r+XCEL0Zx8I4aS6s8xOdhIS?=
 =?us-ascii?Q?nnyZKsJcqf5v+xbajkcwRxEGwNrS2DVNcu4R/x4l5c444e4jjWbzyojm8ITn?=
 =?us-ascii?Q?S1Ay5EQ77mNeJqh2g5y72lDxKkYDkwsbQjffCPUzqCHzPy11ID7LoFgooRsc?=
 =?us-ascii?Q?mAjrlP1WpUonw/+R6dUMP5zcIVoiaxpFzxB2d5at/SkAwAoCJ+1q7s9oJ5H2?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?qGLVTAmsAbFILyeaua0T64dplkqjB6+Yfnn5qt2OcB72nuMVEzw7QF8iEQIK?=
 =?us-ascii?Q?7eJDos8fhZubCDYU2dYOaA2rEg6cSitlYylKq7GZLFNx0xPQyhP6COu8UMQv?=
 =?us-ascii?Q?UC9JX1c12vKRIoJw0bqUtV9sNS1aPkKXmZRXeTg65BHyzkN4mwf0MdBhuMR5?=
 =?us-ascii?Q?6XAtSFSaFKPYPLXh35+LgNb5+QrcjchfjzvqALxRVUgHBHbTRdoM/kaz8UW8?=
 =?us-ascii?Q?trBLbGcC+PX2B9fCm/hahcJ/hqz5Z7OGH5yrnSJaNeUmQdcac32lLalP7v5H?=
 =?us-ascii?Q?+GjuWbh4VTPDJ9CAsCde4WACsuex/RgaQqSNYLWtN7JKLocT9WabRUAq6AUi?=
 =?us-ascii?Q?ci6SyzJZEMLyTM5Nq6V3iIo7Jconj14gSlie+QQ5uJLjD5WmudwKTqcwWB0X?=
 =?us-ascii?Q?cxTYvrftBgPMdyCGBujAbKYG+v/4sSLX+RteJ1dufimYp++LVPk9Pfyp4x42?=
 =?us-ascii?Q?wMqYk9WxX/BGEJ/vNNU3hp7T7SbscAy8ARwnnJFdtEVofN+V0sL82ZzmCB7s?=
 =?us-ascii?Q?6Jz6mCzh7QXn4fgSdVZNBSWNvIzTK5DgQP4vzqdwBCm1USYwL5/9eADKgONG?=
 =?us-ascii?Q?gI2EZAGs0DKjeXzqkuArJipqxo7/5VsfzvOlibETtjUt0dC+9GVgVur55KFj?=
 =?us-ascii?Q?ax467nJqJMRibNiLbTFkV3HYsb3eRqsO1JbATuGvuA/m/jJOR+nTQGRXmJEB?=
 =?us-ascii?Q?mNn2KhRKyXKdM6k9880Ce06VAgH1LwSuPrJ+u8nMvXo0SBm0JLCs9xacG7SB?=
 =?us-ascii?Q?Fhjk+NPs8t0PKJctuHhITw2d5wyzhsix8RfwATEMWNJ6T/asQ9mLeqGUrgWd?=
 =?us-ascii?Q?PpWGAgllJ82er4gXGL1+PpJBK41LNG8HUGKFrrwehN55HbRY98aEUUN1AQES?=
 =?us-ascii?Q?2ysAKSbfMmJH6ncdLUEiU+4TI4D7hqct1KZzUZG8YrJWY/9SoEyNn2XFEC+7?=
 =?us-ascii?Q?gzj47SltLxYQNfNjNkhB0Ly/YFy+i6S7pbSI6UOgZIU7o6is7AV2L7mNRFLD?=
 =?us-ascii?Q?FYQ3JkGSZ8RVWXwBt+ATxtWhny9T9lM5Wz0ZIDdkQX8c/S9FP90lgbHUU/3N?=
 =?us-ascii?Q?QAyx+EkxsvS2gDCR/f/hKHu+I9yOje2T78BMlg/CocltjH3Hjd8Wz0Ntg/s0?=
 =?us-ascii?Q?mNJQybFNvFuiSUQass6y8WaRs2QTtSvFMVmkLq+NGrPgxL0XfVfd5hdh+sA5?=
 =?us-ascii?Q?hA/3wMQCWYFQM4yMoDZYUFhLP6EOItfT06qCz8XtBEXmz+7a5Lom5DkbDAC4?=
 =?us-ascii?Q?nx36ssB1bux4pvKfp6VZacVO6FWrPagDlVe1nXEfunOpj2ZgKTQfgCg4lBIY?=
 =?us-ascii?Q?8if92jjD28Wl+hm4dgbEPqukSve9wtoACSSMcc/WU2/2RC+aRhBXHae6sCfs?=
 =?us-ascii?Q?ZxMP/Lj7Fh7DFF6FNyBxlkPosuiD3y4S1v8O8ttS11D1OIv6iokO2uIfpXDv?=
 =?us-ascii?Q?gplJCbP8yFb2FBzcvystny/19rzakxyS9RZNJQx+itbLGrqvtn2d5F7z9VRS?=
 =?us-ascii?Q?NtEy4RMEVwbLqTD4Jei4MPB1Cs7inZm4/kpUlz76Rb3qWNB8ou6wO9fEmN72?=
 =?us-ascii?Q?qYYom+asMuvrw6TOeJVRyYn6xbvOn6xpggMuyR9VzhWMUzFWwfm9xkgaX0h6?=
 =?us-ascii?Q?7EwaMk+vm8ZWHzgEwY4T73EGNMX1YWKQpbUVXu9HSPq6IPhCJgFvUYGerTQP?=
 =?us-ascii?Q?LZZqEx5nl0vZ36RMQqdlLHRInIRvyw2PrelTFP57QJej3wK1vCzRz8uWlYOe?=
 =?us-ascii?Q?FAqT7BshSaQwbtIN/x9Hj9dqmUFIk8xbxi0ljhJy+99dwFKEUXmi6a5jnrq/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	IK/EJgxvG/5nABttKczK4oNe4/bAp+u5o2hc6BV8D4XkkSyS6nqfUnjOegI826SyRGdB3S2FzquHyPD8+sk5xtG/+4v++CXVD87TJDfj0wKtRwUuGxgOBlwRfw5udbiV3t/NXMthury4pFpGBYU/5Ha15dScpLRy2mjOKRx/1zfLNN0YoDXDrdskJE1xCBq9odEwkZaYx90W/dmBBZhOw01PAcuEWW5KmPKaiarJlNsvCNVB8OWwn7oiEDzERVYme+KrymjXaf74IrTwx1g5C8Vw+2hjkGdsincRSuWloycSC6EeSu+cEhc8HRDgMDtsLhMl4l8WavUra9VXvV5rDBBbhmkjn0XS5fPRPmNqqYReu4941tJzR47JLKO++xppAMi2qIS2vTyyZ0uS8MAsvBh1n+EuqaFryRA8jiAutUD6peVYgmXdlvxEeYGOdp/OCDjhFLWUKz4rVQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e65bf768-9ff0-4e66-891b-08db7e6f5104
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 22:21:17.0194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JH/3JfElxkfZflALe2Rv1wEz9QoTv+kT2d+ZcPmetHhwJX1ilZhTnUjQ/pan6e+LPOw5YOGKTJYsKHtdUg4IQe93ODQKN8wMCblGXWPE8jI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307060195
X-Proofpoint-ORIG-GUID: FaMV-HWht-Eoe2ihOYinoEQRveCt724I
X-Proofpoint-GUID: FaMV-HWht-Eoe2ihOYinoEQRveCt724I
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
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
---
 arch/sh/Kconfig | 46 ++++++++--------------------------------------
 1 file changed, 8 insertions(+), 38 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 2b3ce4fd3956..1cf6603781c7 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -548,44 +548,14 @@ menu "Kernel features"
 
 source "kernel/Kconfig.hz"
 
-config KEXEC
-	bool "kexec system call (EXPERIMENTAL)"
-	depends on MMU
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.  And like a reboot
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
-config CRASH_DUMP
-	bool "kernel crash dumps (EXPERIMENTAL)"
-	depends on BROKEN_ON_SMP
-	help
-	  Generate crash dump after being started by kexec.
-	  This should be normally only set in special crash dump kernels
-	  which are loaded in the main kernel with kexec-tools into
-	  a specially reserved region and then later executed after
-	  a crash by kdump/kexec. The crash dump kernel must be compiled
-	  to a memory address not used by the main kernel using
-	  PHYSICAL_START.
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
-
-config KEXEC_JUMP
-	bool "kexec jump (EXPERIMENTAL)"
-	depends on KEXEC && HIBERNATION
-	help
-	  Jump between original kernel and kexeced kernel and invoke
-	  code via KEXEC
+config ARCH_SUPPORTS_KEXEC
+	def_bool MMU
+
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool BROKEN_ON_SMP
+
+config ARCH_SUPPORTS_KEXEC_JUMP
+	def_bool y
 
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_DUMP)
-- 
2.31.1

