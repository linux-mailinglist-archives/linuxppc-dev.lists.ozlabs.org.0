Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A2E73EF78
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 01:50:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=qOqVTFc9;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=dtxHhPiJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qql2H6tM2z3c1t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 09:49:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=qOqVTFc9;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=dtxHhPiJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqXwt5pyGz30fn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 02:14:38 +1000 (AEST)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QFU4lE026449;
	Mon, 26 Jun 2023 16:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=3tRlpLglCGcmIxNWTk+7pR4ttMqUy9uGaLa8fcW+Zbg=;
 b=qOqVTFc9xlGLNVyh7F3tTbCQ7YmgNKFe6eT0eaN4KjR4gXvflRDAByUiXztf05ikLm8u
 QtZLbrbp+hySksC/d/r0TwAxDK6hixhIUGbbAJ2T70cWfWTTCWRGwU4hQfeEG41L1aPA
 tpzdFX1U/+sAUjoP08/zw9jAUXDd+IGkWwO/xq0I7Z87anQOtLJNfYo7i1NxzdbreCUd
 tYsSfFbb666c/2CTwR1xk6DnNifc04vgx3iQgM9tyDGIpIvc3hV9OMw3dJbjyXGzrhe4
 3VvoBVw6Cwm915nu9xu0vX/vkjR+jJ3dR/ZoHnk9m/5dOok1L46cFkg/YgzAPI6PSdI1 6Q== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdrhck42j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:21 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35QEm9qt011087;
	Mon, 26 Jun 2023 16:14:19 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx39w7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsFFf0n//GLNPbbPVAj/LdpeGa9R1flqrFzXlk+OngAQ94DtsmdbEUFx/MxPBEfNhMgerMQRmT2mMwfYsD7n4g4bQ2EMmzjMPa7blaQ26Ibp9kzr56+Uz1iM7M4bPDNd4Ap8JdeoQS2AZrxxqsMaEFflK1yDBChxLy2RZJu0dUXPIDoK4XBOuHECzaiuNrsn9odTfqNehDukG8w7x1l/sG9k98ItJfNx7qUi8ys46KcB/pilVu6Jd/sT3fcU6v9G/qZo8+d4TEq2FPw+kXUUsZpCBaFcZvgHUqgi/PM7KhqLkAnPJh9Jwi5Q5YyxFsdCvJo8Opfmg6UloUko4XN6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tRlpLglCGcmIxNWTk+7pR4ttMqUy9uGaLa8fcW+Zbg=;
 b=Q2s7n6OP5APJIPOrpHTd0490xGgTFr7jgLJ95hRcKAcIaYA5udv7pAOlfkAGtw5Gk5gGstF1nHRUSOHW/KIyHAC/JvYAzsz3/Zu6slwbZkkyHj1tgkld8pyCFEwRfxsPxO4EA6zBGX+TZvpvjUnomnn6molk9yh0JUy55bnrzxMqcRdwyXcVdvY2VvSA+KPoZYhLctoe+km0dekh7NKmBhCn4sA0fbBnH9IWjaD/XobcUAx5w647Ydmp6vYm4tSvrezbocpLjYHleE9gSyOXmWipa77gwevYCwj4lO8pc5tuT3X7XFvxxiPxFu9b0/bNe0b/GxM8C1OqmbrQQPy6Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tRlpLglCGcmIxNWTk+7pR4ttMqUy9uGaLa8fcW+Zbg=;
 b=dtxHhPiJBvgt5inL3C5cWTdplcj3Qqqpdo9Bsk26Xxo943y3CsTuYU5nNuTobhNMYIkFJovNSLK9JCceLhZo9aC/lX9PXbktOvDJUEUZR23yMwVatQQt0mVdu559wEiw5twfv1Wnf8A1HaAQwYQHUrXZ10Pk9+kCc7xeNqtA4mA=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5585.namprd10.prod.outlook.com (2603:10b6:303:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 16:14:16 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 16:14:16 +0000
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
Subject: [PATCH v3 12/13] s390/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 26 Jun 2023 12:13:31 -0400
Message-Id: <20230626161332.183214-13-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230626161332.183214-1-eric.devolder@oracle.com>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::6) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO6PR10MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c512f3-af98-4189-418a-08db7660636b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VPbkcEb6+P9V1PB5U4rQQLGgjz6ym3IYo3tS9d292kUxrtGKSqDR2kI0QacD4F10o142TW6njlu/4zwWii55tVLcGaVUUTIvzm1+3AIDYPBffPJFKM+fHW/wn4nKRdGXbPhBc/hRgGAyONJ6drIczjllRZTQ/lsBLxTxpTBkECbrD76ksUHl37wyL2RlvwWTObYunhEUS1Uvgg/DSKjDudAeP7ivpR0c12hbj+oOLvSJRIw/k0Vpdv7y5Nhj28fJPgK+z4j4uja6yo4DCwosW3PSXGB0OVyNN0JBm8hxfXfTc6X8qekAZJ+azCHvSG12UAAbyRbZe9uFDnvTgZrrfzRmwX78RwvwjCQAR3wUcMyU8ue0cv6kYlh1RrAfgTOVhKztg6f1R3/9wh1rDUOfLgXd4Xx9icfYlAjZqs3MM/Fdy6jdysJ2fDXd3t3t8hXdEtmru3L/U9VBjgxX8EUDUDfla0QFyKiw9cdNQ2uY2ZqswhCLAhLdDd8Epq/zs5gmqPmgckUE2HEGd5+LFsRpHCOLtBoH9E/SU+X7MAJYxt+KELQzEzpoYRXaBIVK+e05ScNsySDFaiLih5qIfawlimqT+e61fEHbtzqPsKaWxTI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(2906002)(6486002)(107886003)(38100700002)(6666004)(921005)(2616005)(83380400001)(6512007)(6506007)(1076003)(26005)(186003)(41300700001)(86362001)(478600001)(316002)(36756003)(66946007)(4326008)(66476007)(66556008)(7406005)(7366002)(7416002)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?fty7EqsA2A5ytM77wvu7UgT1JZVKFMcpxngGTwWkfQgU1lIEdd2jm1Iq6mFA?=
 =?us-ascii?Q?sD5VYcYmdH0d3jeb1LZjZvfEJxkBOMZJj/xjMidl95uiuANeD1A1c5FniNzx?=
 =?us-ascii?Q?TG4mnKbIiULCrJTpif9SSZlIoVUqH/oI0QSbyeiPQwJcecMSwXVNDkfoYv7Y?=
 =?us-ascii?Q?nylKDHE5FO0f79VaQf7yABd5E05auPqgTwkXymDUFBmWW3CSggfPA9bNtlVJ?=
 =?us-ascii?Q?3wftXcq8hz5Q36K1eZGSllhArwuEj0bxrllOwvEw45sI3WOjfgYvAC8oWr8D?=
 =?us-ascii?Q?tX56g3UyzfH6Un5ZYWPlwj6smqCh6BxTIuv+VtBlAziS+FdIt4wGtWLmLWCa?=
 =?us-ascii?Q?cB4f8d4lpYHxg8CM+/fvZDD9i8ni6DXHpJsQNk1Yq7kgirmh4XWZlPPfp11s?=
 =?us-ascii?Q?q3BdsHcAbgtUnxBYR5kYv8iR5oQvm5B5WYi0WEY6jxOkKW4g0PLQnow15t+m?=
 =?us-ascii?Q?WSst/eRTylNlnetDj8L6UAGlcZ93M3UEwFvtUwOQ/d+bG7UHNBB7qwaZ1fOL?=
 =?us-ascii?Q?8G/gAVFSREXKyeL0e7Efkd+1z0RvVdVBd7/slOIpB+gQe4h66w88+CcMqPA+?=
 =?us-ascii?Q?da3ta/5qIG4aXwbM0U/ZQUCwGzky0VXrl/wEQO6gnEoBTJoRUdyncs7p4skV?=
 =?us-ascii?Q?wHGZThZWj1B778a4/4GIeeEigSeA+Ff3cd0cf/qqfk8rSB/hWpl2WoOCH9Zp?=
 =?us-ascii?Q?JZpjsfUFMde9vtYWmT6Fc7tdDlHRptWlbrAa9S4rV521m22PWO8+Q7XGCgI/?=
 =?us-ascii?Q?vHZa90A+/6KXxj/p+Ia0MGBkFcKVCR16KIBxg3phmnOTDGUdkImlfvOMtxbn?=
 =?us-ascii?Q?mfRG36qPPE7KY9hxEgQM6uDQ00Ot5EY5x8SJJRarpHCHhtJlUfDsQqI+Ir8K?=
 =?us-ascii?Q?0G4tLD/mhMvtwp5pdKrXoCQPBmamX3tSrLwu22hxNZYyd+QG4MbiOtSEj6DJ?=
 =?us-ascii?Q?Lee0kBasIjLHRcCw0zU0B9bydZ8tytFbsRxnKBziBecDre1s7DZRcewdnyHs?=
 =?us-ascii?Q?AW9cdDhiY8oL0fg6SGeYbnR6Zcl6seV8pO6B2sFDyxMApW0dlGz31RWEw2a5?=
 =?us-ascii?Q?wNwYIoKTl9i/Tzt+74uy5iOSWjOtyKH6fPtnFv78zRowOXCr0C78jLG2ySMl?=
 =?us-ascii?Q?FElqeRya394yxbViEfIz6CZKvk3ONahSujXhODe7GTp8CbRnt1m7m6TL5YU6?=
 =?us-ascii?Q?ydc6BugHyV2xMBvQHREqYrI/oq2i1lJqMK9MJ+XltapC7JhV+Z2+21LRr6n1?=
 =?us-ascii?Q?aysJA/F/LSfjlfgWaHjs2VNVBAQ5U1sGZBwL9Ma2UFpq6TRzmwsBrRkkYONs?=
 =?us-ascii?Q?pq4HRjdVDmLgK++C3QSkUaXiETxyD6a6n4BsuWLVwW2qK9pjVrJ3nMasgUTR?=
 =?us-ascii?Q?xP2xQHrmiwzUZ6YAtZ+LSGptNSL3Up1zRwVW6URFCblGs04BsQwZrQsmY+Mp?=
 =?us-ascii?Q?Bye+g6Cp+nG0jMyHib3QUzhkHdx1NHuoVUS3fNM2c03tc6FlKS0sW+hYOrt5?=
 =?us-ascii?Q?UyPZas5paACMozZ84pW8THKUeYh/wyc1YscAqlVO7ma+zSQe4jlmuEqYfMRI?=
 =?us-ascii?Q?hfgNPf9xITzRxHZGPhoSWg/OWu/uyypNTGj54qviSKHPRcWYR7pXsN8TKsET?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?cUCSLqW73cHLcvq+lGKutft4+Y1iPH3srZOmDefEkNwoSe8MCbzUP6Fl4wbu?=
 =?us-ascii?Q?QbqOkb30z8ZALQFxraQQqy3GoUCM3AI9yzBLFLY3ijzuYvUgXGSuzzy8BmhW?=
 =?us-ascii?Q?wYaPp+Ei94SwRTgn8SpUTeIf3jdIJ2AGqh3Yq4Q/WWsM7jgeF9zn/zKmmL1Z?=
 =?us-ascii?Q?v/OPZR9b47ZwJYykdu9xYo0CC7NjMcLKtqezqnaHXUptIGy34/yFQv56a0VR?=
 =?us-ascii?Q?lU551sYfqSyAzv6xJOQv6pPc1Y3sqUspKthnqpyLbR5kaoofA/5TL2U3D2iS?=
 =?us-ascii?Q?JdTmcO30rm+Z9q2zshqpZAgsjA4eqHZDWLFDvLik7BpYov9YMaGbVusI5TR8?=
 =?us-ascii?Q?T2J5w8nbyLqh8RtqnbhTLvQDiPVUnmHGOyXlEs8v4k6r0uPUtGKebyzboAOV?=
 =?us-ascii?Q?yPJxEqpf8WvHiMUppxrX0FNHDSZzY2GV5xe1M09kjXYF+NRQJupGAgP/pHNV?=
 =?us-ascii?Q?vC7OQ34W8R2CW79rnG2mmXWPKzdUBSVO9X4Fb78565Kaqsr3w9qvaoXD1ryi?=
 =?us-ascii?Q?xSCKAeFrU8GuXSWk04zE7OZrDRIfTUbj2Yfh6mWJFKqr0aRjL0nk2Ri3WTuO?=
 =?us-ascii?Q?oGBTUeHtRN6uW7Y907rxD7Lgh0LwvZwaAU3L/BRD6L5OSndNGqrzaj49X2ml?=
 =?us-ascii?Q?ToeqO6n5ChFpy0pTL3NEkPNi+kMFjh2Ot3fFbgvv1ugCveLfb6VLAah319rt?=
 =?us-ascii?Q?5ijk5agwkemtvMB8RHUN4Xo7o0ix7uY02kD4BZKCkd/Wxj+SRxiR3v0eQv6/?=
 =?us-ascii?Q?ne2z9s3gMUQ5mjvMCSqj+Kk4vyMJ3nynzVoZTRQ5U010NjVO8q2ro4nQ2x8o?=
 =?us-ascii?Q?3QhP1qMEgY3OIYx8010UeOkJO596LO2Rb7cVZQxk8VgCM4tlXKQ8q/13dJGl?=
 =?us-ascii?Q?D/ihUo5LCvOBhX2sb/YToPLGZLV3GsiVB43sfbXQyM8Tb7xgH4A8bmfbYWWp?=
 =?us-ascii?Q?HrHKU6P/m8ro9O1okvyLDxlqFNQUvKX+WMnnWSC86mc0uD5QXGFLmvnHPi0W?=
 =?us-ascii?Q?7OVUWk3le/XQDbNFDd5YxS+DYqisoxQG/yvIwRLUeDyDGi4b6/Aev6Amyge6?=
 =?us-ascii?Q?b59xRiOxeKZxBOvNVB/uQwMBkZDOxWwEVWuYY+mMkV2Eet2L/4Pk0JKfmssg?=
 =?us-ascii?Q?F+MHCAFPzab3eKCc+CPG+Ixf5uLJ3636EK30bUHqoCl6LpF6aU/3ofHFlI5+?=
 =?us-ascii?Q?eOP3YGY7H5xugfGLHCFhzVaHN4qcVwUQjokffNSH15ryEBU26c39qqRxFuVC?=
 =?us-ascii?Q?SkGY2IF88N30GhBFUz63swdIz5DwZRc/XykrPdOmWzhCR6+3PPxqp+cC8P3g?=
 =?us-ascii?Q?6cwXxEopTe/vqu8ksmynKhWj8YcD1DifRRjfi+pnegXyRK5Gw6JlpqlpDe9E?=
 =?us-ascii?Q?IWpPaIqRBY3oG9L3qVVs45OmPWwBoG/AVFgASoX5Wa3huxs9sFKtFlRUR+5+?=
 =?us-ascii?Q?SXdaIwlqvEYB+cxGMChD6MSazfGxs+OVB+vdJ13U9K/LAhufHtg9k9L31hCm?=
 =?us-ascii?Q?r7WTwX1tojJLSdUGrjV96bAbAWvUh78XTQS6mnLtxyl3GW7qI957hGRi1ptv?=
 =?us-ascii?Q?YSvkOUqZ77YQQLTmJ/mOnvoS/z7FOJkCriRGmt5Z8gr61i/AxZqkExsilCJ5?=
 =?us-ascii?Q?5eBD2p5CS8STFB46Q3624fgoEEvSBm2uEMHZXzpijKKM7WxObWWzUngNSkkY?=
 =?us-ascii?Q?xyfsEJZOQ57avL7qGJsqtEizgSeIWnkewp8MXcso4Tx4GZbyarUOmCE43aPt?=
 =?us-ascii?Q?jnpnYK0HBngwISNU78QZX77Grqy3zcXkgofZzS6ctN1pnae+T2GXqNqjD8Oq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	JYTYh1A6GO4cRSpiUoWvITIwN9r1JS2AJ/JbnKug9aaGxJ6iEhzcgOsZHWoCbqWEi/l9sMVRbpCQR+GkbiKp0QoQSJpADVVU85xrVGdzsQSTcU+l+NupbNezbdtu0Da67kl25D6pEIeDuRTIdWKL+u6rgaeRKYxFkC47wxr3rkiIttgdqGajv1i5p1MbsDZZvaepYJTFkzcdH7Mey1gYc2WOV/1MI3hvhQZdYjj90UDTcmlWB9dk9orPY3SnrCGuOvp+LQIoUjCd0ytHc0VtZjsnx90viTIZrUxhV8wLXAj7cOZaF63m99MxxVy2WBIDs6D+zsQID0hmq+CXS2P4tgFJt7Y8uHCQ1nDzXI4Rc3fDZ8+yKMyV7fu66vyV21nX4o7XpPeIQopusEAiCelLG8wzpDFIo+p5kuHs+3Oy/mdYpdu5jEM3WJ3gdr6yjhPqkGWCtxjFADAQFw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c512f3-af98-4189-418a-08db7660636b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 16:14:16.2415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKffSFNv/Uulv5AlJBciR0wZ29ZozHSJUNqGNamD5NhTcReBrfy5ij9P12Et7fcmfGJ7v/ct0dBmFR84jPP+kA7B/sK4JoB/PlhMt9WGe9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5585
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_14,2023-06-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306260148
X-Proofpoint-GUID: ZtIcRi0MRoT548DpMcfkw0ido04yVcHs
X-Proofpoint-ORIG-GUID: ZtIcRi0MRoT548DpMcfkw0ido04yVcHs
X-Mailman-Approved-At: Tue, 27 Jun 2023 09:38:37 +1000
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

NOTE: The original Kconfig has a KEXEC_SIG which depends on
MODULE_SIG_FORMAT. However, attempts to keep the MODULE_SIG_FORMAT
dependency (using the strategy outlined in this series, and other
techniques) results in 'error: recursive dependency detected'
on CRYPTO.

Per Alexander Gordeev <agordeev@linux.ibm.com>: "the MODULE_SIG_FORMAT
dependency was introduced with [git commit below] and in fact was not
necessary, since s390 did/does not use mod_check_sig() anyway.

 commit c8424e776b09 ("MODSIGN: Export module signature definitions")

MODULE_SIG_FORMAT is needed to select SYSTEM_DATA_VERIFICATION. But
SYSTEM_DATA_VERIFICATION is also selected by FS_VERITY*, so dropping
MODULE_SIG_FORMAT does not hurt."

Therefore, the solution is to drop the MODULE_SIG_FORMAT dependency
from KEXEC_SIG. Still results in equivalent .config files for s390.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/s390/Kconfig | 65 ++++++++++++++---------------------------------
 1 file changed, 19 insertions(+), 46 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 6dab9c1be508..58dc124433ca 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -243,6 +243,25 @@ config PGTABLE_LEVELS
 
 source "kernel/livepatch/Kconfig"
 
+config ARCH_DEFAULT_KEXEC
+	def_bool y
+
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
+
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool CRYPTO && CRYPTO_SHA256 && CRYPTO_SHA256_S390
+
+config ARCH_HAS_KEXEC_PURGATORY
+	def_bool KEXEC_FILE
+
+config ARCH_SUPPORTS_CRASH_DUMP
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

