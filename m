Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE45974A764
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:05:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=aih2H3/t;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=hWRyOEzy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxsZD5F77z3cQj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 09:05:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=aih2H3/t;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=hWRyOEzy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxrbF2yDbz30XV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 08:21:13 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366LYHdY025112;
	Thu, 6 Jul 2023 22:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-03-30;
 bh=UZOqmE9AmzZefBOpburB0kfxvxP6nnJ0XGt/Y8kEKfk=;
 b=aih2H3/t1Ann8w2aVLaT6qVDus6pZUcum+Nbnj2BhchwAASMIdibBqnWUcyKPIApbwiS
 k8uKdSmL54FCClECriSccqw3ZkgT2XbJwwnz1TyAlVrtL3GiKAA128kggaizMf6GkZgj
 Z7UFwuIEyupVAq6c8GXoeeh5fvOX17/tdV+KNgS41DyWagzmI64rKiOnXKr8tXv5808e
 gAH3/0APHf2u34+gLXAcS7ZQyqz0psoaF2qWLG5mLOc1BRRuCx+74nXMSa6GkvsEqppS
 4uFCjZeC7eKjcnRqyqjLZgGJ0edOa0Y0EBvX6GN1NxQ5RQLp2YnYJ+6ZzhlQHGmSrTAD Dg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rp5n5g1tm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:20:47 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 366KYvI6013438;
	Thu, 6 Jul 2023 22:20:47 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak7ph6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 22:20:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJKtjbXBXoT3YtBQztOVq4WGfzmFmRHaCyIHZyL0odYUwC/gIBi0gUN9mTCfTaaYaomqD9n6jxdeDblZsG0CxGkuU+TrM6F9hyMmH0AlmH9dh0Ii22yjwlePpwcD5V4va1VcYc2VS0NxT859F0ryvUeSN3laDgPM1E7k3p9eD4OZys2fDtf964A9+7wBJWIUD+mna1wSGtgX6p8LrL4a2R2gcRbdQjqE5lGJDFU26Iv7cIKdsom89bQFt4+T8TLHmBTDZJZY/kq9eIbUdWsxJViCHUT+eOqArlT7n5P3PcCWVGhjahvMsn3e+bT2rFPTGXEQBeOaADHzXmOLA5i1fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZOqmE9AmzZefBOpburB0kfxvxP6nnJ0XGt/Y8kEKfk=;
 b=UmUCdiSHtDrJGXF/R35o6vGHTNZtZsIbFvmwzMfhf44XpqjpGyyudYgNU9N/7gnk/0brEdYsZPxd9TtR9UU2L8EkDArXiF241zR4lydyhp8wKx0wsF8CUOPCWo4HNIwO2RUWSZllEf86iQW1sDYE8wJi6xt/XfETKUawPFSNrXUSfedIJoBhA0Uw0iAC+uZaChDhREh3shH7sr9nGjGGtE3+LoTUSSnhs8PblJeeq0Bns/y9v2bMZapdehHZ5inPOFVvsYlV0LmjWOoTtIXS8IVnZ8U18nwA090BdeHy+iQ8hwoyqHhBq8YuYjskPiGR5PwX9OaTai9YQJQZMaz4EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZOqmE9AmzZefBOpburB0kfxvxP6nnJ0XGt/Y8kEKfk=;
 b=hWRyOEzyiDlKs8oSbAibSX6XEwY992kuO5BD/J3imgcmgHhjE6NXXtbPb60KsXLaClCcNqU5eK87VZmtGrio1fCfvtJg3TaQaoZ7qRvjIFT/iDEHZ2Hv2mjgBGSW+34hyOOsyjz/beNUdqULyi/xTV5z93uZuHYV2gLFiJ6Am4g=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4755.namprd10.prod.outlook.com (2603:10b6:303:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 22:20:42 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 22:20:42 +0000
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
Subject: [PATCH v5 00/13] refactor Kconfig to consolidate KEXEC and CRASH options
Date: Thu,  6 Jul 2023 18:20:14 -0400
Message-Id: <20230706222027.189117-1-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0401.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::10) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO1PR10MB4755:EE_
X-MS-Office365-Filtering-Correlation-Id: 808bb187-c4a2-481e-6d36-08db7e6f3c1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DfsnP0IrebSJsOBVW77VeqtiMHoIooVDCo04mpuK0G3ggX8Q9rn3f5dH3CJQ70vgzDFP7ZBVqcczFiEZugWZUjGo72KdJIKZ7ZUyQPboW0xavASTDAQuRHgDEvVsNrFm4kOawwWMLZdn1I9ekuIRT16Pn/eIJ0YUW9SConUWfmOFWCISF2JLhP9EHj/C10IQnW+wNM2FmvEI0ph1QlbQLHE0cQvBUwoyaiZzQO1vX4ZkvsXw5DB0MLJiiGUURUk+ihN5psHZkAt+JhtnRqxqejMlrHSZ8jlupJR2cN6ucKG/rOHC3rGfP1OKk8LwYz+CDNp3G3PfgCTb/zuJsqueZ0WwfiFdYyVo390M0cGYEKBmT67Rapo4LMtOT1JtbUBeZ/DecbjJUY5hQ85UfjUfELtS5AvnaufXZXQTrDiEVxR1p+mXTFAPbXiZSt877/joBIU42Obd7UD4S3MZCc1HvW3gRLKNiAyz8ba1ZY41ONmtp4fumNkR5PE6qoQta971tJceU/iWv1j7mG+P2qKTQaHh+N5P+Bpqp93KiP+BDQ6z01a4SZaqGRylfa2V8qA6qjX0bq2rwc5ezRTtjOIDqdUxk4OiNzntbk+EyYTrVlqouPp5m6ZVLz1j2kBDj1Uy
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(2906002)(2616005)(5660300002)(26005)(7416002)(6506007)(1076003)(7406005)(7366002)(186003)(107886003)(66556008)(30864003)(41300700001)(921005)(66476007)(6486002)(4326008)(6666004)(316002)(66946007)(83380400001)(966005)(6512007)(478600001)(36756003)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?jskjcDA4jkrGOoheBguWgN76d8s0JNwI/tcnkaKJ9No98h+0IAHWQhJ0CU16?=
 =?us-ascii?Q?aXNVxvNkSMX+yfXOZ4iJGoD6Dp6X7ZAzbUa1TttyqvCH+yFs3aAmxJAmATAJ?=
 =?us-ascii?Q?9GST4JJbHsbl3zX+OD+oJod8CJ7t3GtPpVeDzH7m+zXn8CeZKKUEnHLVTxXI?=
 =?us-ascii?Q?4iHK7NsWZREQB9ce3pcahciLe/+QUn/sgsG656l8SDHQtg81FshpX+KAji3K?=
 =?us-ascii?Q?dSrb5xUz4EayLqPtM2y908wGpQiGoAiaAF/BWGERp6UO6JFi62ew4dFFyluW?=
 =?us-ascii?Q?xG1CtfXDYMct1fYQMQkehF6FAOpVZWloPW/mqSjNr47Wv3vKccZYJYthYEio?=
 =?us-ascii?Q?W99b9gRkk7niZ6jjwv44dlsW2YAyhaSmjwbOJqNARwi693NmXXYjQcwqlAjq?=
 =?us-ascii?Q?1/f3txRsFK0RMiT9pf5oLu5bWqyHoXRAm04u0qrwdxC1SKW8ObOkh7U+S9wT?=
 =?us-ascii?Q?jeLwKfyMqnfWlGeD2ZhhB8lPlrN2Mf0QzwO3aG1gi+nbZXM5csQJYuDshidp?=
 =?us-ascii?Q?Lx72ZoPqhiymU7pXD/Gs5CTwJu8r31yJtDVs82ZEd/vkb5UgX6VrO6R19M1j?=
 =?us-ascii?Q?cpyyyCdUYHAvQEbod1dyewnzBMccu5AWb/0vcubEtpB/N/ytqAa/lvJShN5X?=
 =?us-ascii?Q?RljXoPoL/GeKeom7WcpdZvj3w3vbm6LJ0I6t78NAcomC+7gq12cwq1P3KnBW?=
 =?us-ascii?Q?B3HvWnhiawzi3LH8R0eudK8QiiHjZtN52LOJcJZTV6NVOtuHOiVDix3pfxlR?=
 =?us-ascii?Q?o1nhkmOcURlhTv4zT760zR86Lx/Ti7DCwyYH3SKZ/x9GYhvSpRUqD2qQNCwq?=
 =?us-ascii?Q?CkoMj8UPLyzTo+yeJkFPaShz5W6uRZSkncVN0kN1u6UzIJoZtO01qRKO8jN1?=
 =?us-ascii?Q?aVhLJnsXX8/1ih52a04hmAtrgFvfj7RnKKQL2HqpU5CGfANGgjtbf9P9+Hvp?=
 =?us-ascii?Q?6pu9aOQQwUp1UrKf2TnrVzRU1R0vcjFvNYOnhRTpFSmNLta57dVjGJDBuz2z?=
 =?us-ascii?Q?rAM75gm83EWmBA7M1FapT+ZfU91NkVzKaVqJ+qSmMQ6tyX/nv9YUcuSXITd7?=
 =?us-ascii?Q?cbB52s9kJcTR8216ZBkku3KZ7VBTWVEa0YW3VfbLQipDJJ4CA8aCuzk83N+k?=
 =?us-ascii?Q?1KNAU+IXcxpplUl05C2c4DXuRujcAjEOaGEsY0OXOloj88BOEeZh2jesq7or?=
 =?us-ascii?Q?ulRx7elgTsNhic5Fg6XgrRFt5P59O23aC4za+yrVn+dtc56nAmKxm5BT9Zft?=
 =?us-ascii?Q?w2hv0RPj/ba5c4vuG0XHpP2OvRis3bjP/4ur6XG18DZfIgSkLIitb6o/SfJT?=
 =?us-ascii?Q?BqM3SRfOi7+d+QZZydZ3rMsiTJwxyUaHxxvDnYY35Rz6hYJ6OaHVjlqj3Xp+?=
 =?us-ascii?Q?kcVoZ/VyfnFytH3lnz1O10zqNWB5+NMuFAVES8SoZEVgIwW1/sp+8J4Mr7oZ?=
 =?us-ascii?Q?nv8XnuE4c+gA1cdCpkZWAeW6uB5CoikULovzA+ShKSoFnqn4jKRalgLDdyuY?=
 =?us-ascii?Q?ZVkkrbXwr+XiiMKO3XxYJKz/TkDdnGlgUHRUvZ/TR8VTAai3qAvar+brxOLB?=
 =?us-ascii?Q?t+WMY9QIhnmeNE8lltBkix17ShClaK9yvqSqySalcFHuWy0z/FksoGZTwXmq?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?qe96OJmIgLp63uQg+aMLWEAeqrtNwt3te003ez3Lwrzf7ppOEKakiUb2/YLI?=
 =?us-ascii?Q?uWaevmW4aZbCugHytq41cZ5qG/7xSVVilEa4W94Con/BacnI7C5yxQCkfO39?=
 =?us-ascii?Q?3VZqpF2xpz6csUzD7bvLkwPIN+cY700qjfrGYRfgDiEcPmuUj3fcNfiJqPP+?=
 =?us-ascii?Q?tnPNXMRv1H0fcJIdq2pfL+AplpZ6anC5+siO8FNgXxIAOEa+CUj8ChASiEO7?=
 =?us-ascii?Q?MKUSACvyFGRq90R0unO61H+tvD/eQjwziEGWbGbd+on94kWDPx8iuflKhSCN?=
 =?us-ascii?Q?r6JexISaty2uT7v9wUL0RhezyQZA8Ds/hWjKuVCudPa7fjVU58Qt5ycoJ8+0?=
 =?us-ascii?Q?/CtH0nQ9zHcI4b2lUeigzyxcj98OBW8gn76E+/S8ISPAqRFdQ+hmDBwcQNnG?=
 =?us-ascii?Q?2apqvCidoInCyq/c1A43WWiWTIjqtDS8/sV1AFBnTxq0xGEO0l2pW6rg1NyC?=
 =?us-ascii?Q?q3CvC6XY40hZNbhC4r56p+tuaon6TjEe+CPxwz7tijsy7c+FQEvtaxDvWTPp?=
 =?us-ascii?Q?ZgcVxzlvPHeXvs7Lzk++W4vZqTaSSImlsSwa6PLf5IQ1uigwVWqGVesGF/Xz?=
 =?us-ascii?Q?axKOss/ZMlQaLq/mFW6q5j8Tvlcpn4S2QcbPzFCiIM3FhhYfzBlgXQ4hrXqB?=
 =?us-ascii?Q?hXsAQUEs1sGBmBvx2/9JS7Th+AofNNUlZ0SMVba3DoeMtKT/LxX50Enp+yTw?=
 =?us-ascii?Q?23BFyeZCKkOmuN5P0uO6h+7GBIeviVrBWczvi03ZuNydANFnxC5STiV/kCiC?=
 =?us-ascii?Q?3uhVE13JfgZ4YzHD/CBZCn+maSBsaDnC53Z7G4vxiGvSW3V/nlOuyU9PS17Y?=
 =?us-ascii?Q?eqaVxvOjgbn7kjt5n7kF5BmL6lt7dv2X/IgHZKv180KpkD04D3U5oXvkvNdP?=
 =?us-ascii?Q?2YvF2iYMUYrWiAkvxAplHubpJ3o+SxZAo0e0iwwRjwJ799CwEU4kR7B/jN6E?=
 =?us-ascii?Q?jFjM13HgUrO6UUE2akm2psFc6kASJ0FbMlydD8ehLAQAX0GKWvRiEbFuuEmm?=
 =?us-ascii?Q?KaVwgKZjvrRBlw65PBjzjVdC1aLE50vBUBwDjYr/Hc83yNhFRYaseIoX6Lnk?=
 =?us-ascii?Q?Jm3pH6e8pvo7OwS7tmlY/dwGUncXxosnZvPEdjJZYzeOsdwPkUeGThcllcwP?=
 =?us-ascii?Q?nlBlIxBQY1O4EjxAHCOeRpB2pfiMK6p88t/lQKXhSvOHJKQrH6h4FJnRMpMH?=
 =?us-ascii?Q?jhd7/TLdoRPWwljVjkqrOQP/zebjaCHtw77xZ9Bax5YUhL///MWtt8RV4A95?=
 =?us-ascii?Q?p4beZwZ2icYpc0fR5xtcfU6/s4cOUPwGxjg3GXFs6bLoPSMEZiBFfr5pLiZA?=
 =?us-ascii?Q?8JVDmlfclMTlf2KwReHR8KVJJDKmewPpOQ7Nsmcyc2FAk54PiJ5CpdHGuhxL?=
 =?us-ascii?Q?ZoYH8x0DZAbNsPCLvLaZ4QdGnlNYPfG4fa+XaBG2BYJJpmO6TP0Z06532uYO?=
 =?us-ascii?Q?oo6tBmtFaC6xHbGq5dXQcR3Dcxm8GBIc2KDVTNUsNixxgSgjfu9d5Upjg+tN?=
 =?us-ascii?Q?FBV6BdHAT0Scfsq964FUwwTkC0egfT3AjP/kV/Flva2zKiAg4WrWNkFBo+Sd?=
 =?us-ascii?Q?pBsWUewzX1+6PrThv0dcaEf4TukQf3izlAbNUwuQxfRzE2cBfvsaoVQODBle?=
 =?us-ascii?Q?qLw/2F7pMHp6uYkvUA1onRc9YlIn9YDbfFl4RRiOWLg9uNzr6mVkveSFDZ7w?=
 =?us-ascii?Q?Qt8ZqIiuc0teHislde+V0NLVe5lzKHyo5ryl7bJH0N7KNalN95T6nTWfVo7o?=
 =?us-ascii?Q?96JOWunfKrPonF34opDH0nEqGzua8rwem20SMVLFMnqeBXsVksWiM3wAjbqf?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	N1w+swWJbTuxPW25vbtD0TtCGxlu04o5RpbirOiKjirLTSf/XvmwxzBJ8vBgcg4YeGo/Mhk3xCuZEpgh9/f2vpWQ/TZ8OW5h2bq0lXkT7m63R+XIcBeC+nEwuUjmlzlDNX8ubS4z8mNnEx0LcrDeSeQAZVg/QX6OcoNluJLw2vRljLWDoDKtCQOJ03K6XKnm+BHrJp9PyH3fl1akdHMTFM2gAuP3JDH5dd2NuQyVcbzWGx+ubbLViBN+vraf60PE2nrv0phWZ5B99Wl1wF8zgZQnXURdNL2kwrkhIpLJTk/hRt8FZ6W3EcQigCCQ2d1g+mDK6XngIll1zgitPuqNatZmYyti7rdi+4IPKzlfM9T0JZTT0phOs9MsJtrcNzwKRZh9vIGv3nZHOnrMqBTXtH+7dvIeRdyJOpAT3CItbSX5+8CG3tvXlQRJDk69VUCkKxrf7XX7TZpQhw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808bb187-c4a2-481e-6d36-08db7e6f3c1f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 22:20:42.1080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9P3onXCYUi0IaUHjRJUZOFFlYID5Pzd/aqKrDQAY9stsUQnMNWNIWWbZhRIuw3J0LCOmPWrehJFjNbzxwJs/mrdKja5dOzsbv0R4ijQO8Tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4755
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307060195
X-Proofpoint-ORIG-GUID: j_XpOWUjXwFs69pMSrffVMOj0kTa3lQV
X-Proofpoint-GUID: j_XpOWUjXwFs69pMSrffVMOj0kTa3lQV
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

The Kconfig is refactored to consolidate KEXEC and CRASH options from
various arch/<arch>/Kconfig files into new file kernel/Kconfig.kexec.

The Kconfig.kexec is now a submenu titled "Kexec and crash features"
located under "General Setup".

The following options are impacted:

 - KEXEC
 - KEXEC_FILE
 - KEXEC_SIG
 - KEXEC_SIG_FORCE
 - KEXEC_IMAGE_VERIFY_SIG
 - KEXEC_BZIMAGE_VERIFY_SIG
 - KEXEC_JUMP
 - CRASH_DUMP

Over time, these options have been copied between Kconfig files and
are very similar to one another, but with slight differences.

The following architectures are impacted by the refactor (because of
use of one or more KEXEC/CRASH options):

 - arm
 - arm64
 - ia64
 - loongarch
 - m68k
 - mips
 - parisc
 - powerpc
 - riscv
 - s390
 - sh
 - x86 

More information:

In the patch series "crash: Kernel handling of CPU and memory hot
un/plug"

 https://lore.kernel.org/lkml/20230503224145.7405-1-eric.devolder@oracle.com/

the new kernel feature introduces the config option CRASH_HOTPLUG.

In reviewing, Thomas Gleixner requested that the new config option
not be placed in x86 Kconfig. Rather the option needs a generic/common
home. To Thomas' point, the KEXEC and CRASH options have largely been
duplicated in the various arch/<arch>/Kconfig files, with minor
differences. This kind of proliferation is to be avoid/stopped.

 https://lore.kernel.org/lkml/875y91yv63.ffs@tglx/

To that end, I have refactored the arch Kconfigs so as to consolidate
the various KEXEC and CRASH options. Generally speaking, this work has
the following themes:

- KEXEC and CRASH options are moved into new file kernel/Kconfig.kexec
  - These items from arch/Kconfig:
      CRASH_CORE KEXEC_CORE KEXEC_ELF HAVE_IMA_KEXEC
  - These items from arch/x86/Kconfig form the common options:
      KEXEC KEXEC_FILE KEXEC_SIG KEXEC_SIG_FORCE
      KEXEC_BZIMAGE_VERIFY_SIG KEXEC_JUMP CRASH_DUMP
  - These items from arch/arm64/Kconfig form the common options:
      KEXEC_IMAGE_VERIFY_SIG
  - The crash hotplug series appends CRASH_HOTPLUG to Kconfig.kexec
- The Kconfig.kexec is now a submenu titled "Kexec and crash features"
  and is now listed in "General Setup" submenu from init/Kconfig.
- To control the common options, each has a new ARCH_SUPPORTS_<option>
  option. These gateway options determine whether the common options
  options are valid for the architecture.
- To account for the slight differences in the original architecture
  coding of the common options, each now has a corresponding
  ARCH_SELECTS_<option> which are used to elicit the same side effects
  as the original arch/<arch>/Kconfig files for KEXEC and CRASH options.
- NOTE: The existing ARCH_HAS_KEXEC_PURGATORY remains unchanged.

An example, 'make menuconfig' illustrating the submenu:

  > General setup > Kexec and crash features
  [*] Enable kexec system call
  [*] Enable kexec file based system call
  [*]   Verify kernel signature during kexec_file_load() syscall
  [ ]     Require a valid signature in kexec_file_load() syscall
  [ ]     Enable bzImage signature verification support
  [*] kexec jump
  [*] kernel crash dumps
  [*]   Update the crash elfcorehdr on system configuration changes

In the process of consolidating the common options, I encountered
slight differences in the coding of these options in several of the
architectures. As a result, I settled on the following solution:

- Each of the common options has a 'depends on ARCH_SUPPORTS_<option>'
  statement. For example, the KEXEC_FILE option has a 'depends on
  ARCH_SUPPORTS_KEXEC_FILE' statement.

  This approach is needed on all common options so as to prevent
  options from appearing for architectures which previously did
  not allow/enable them. For example, arm supports KEXEC but not
  KEXEC_FILE. The arch/arm/Kconfig does not provide
  ARCH_SUPPORTS_KEXEC_FILE and so KEXEC_FILE and related options
  are not available to arm.

- The boolean ARCH_SUPPORTS_<option> in effect allows the arch to
  determine when the feature is allowed.  Archs which don't have the
  feature simply do not provide the corresponding ARCH_SUPPORTS_<option>.
  For each arch, where there previously were KEXEC and/or CRASH
  options, these have been replaced with the corresponding boolean
  ARCH_SUPPORTS_<option>, and an appropriate def_bool statement.

  For example, if the arch supports KEXEC_FILE, then the
  ARCH_SUPPORTS_KEXEC_FILE simply has a 'def_bool y'. This permits
  the KEXEC_FILE option to be available.

  If the arch has a 'depends on' statement in its original coding
  of the option, then that expression becomes part of the def_bool
  expression. For example, arm64 had:

  config KEXEC
    depends on PM_SLEEP_SMP

  and in this solution, this converts to:

  config ARCH_SUPPORTS_KEXEC
    def_bool PM_SLEEP_SMP


- In order to account for the architecture differences in the
  coding for the common options, the ARCH_SELECTS_<option> in the
  arch/<arch>/Kconfig is used. This option has a 'depends on
  <option>' statement to couple it to the main option, and from
  there can insert the differences from the common option and the
  arch original coding of that option.

  For example, a few archs enable CRYPTO and CRYTPO_SHA256 for
  KEXEC_FILE. These require a ARCH_SELECTS_KEXEC_FILE and
  'select CRYPTO' and 'select CRYPTO_SHA256' statements.

Illustrating the option relationships:

For each of the common KEXEC and CRASH options:
 ARCH_SUPPORTS_<option> <- <option> <- ARCH_SELECTS_<option>

 <option>                   # in Kconfig.kexec
 ARCH_SUPPORTS_<option>     # in arch/<arch>/Kconfig, as needed
 ARCH_SELECTS_<option>      # in arch/<arch>/Kconfig, as needed


For example, KEXEC:
 ARCH_SUPPORTS_KEXEC <- KEXEC <- ARCH_SELECTS_KEXEC

 KEXEC                      # in Kconfig.kexec
 ARCH_SUPPORTS_KEXEC        # in arch/<arch>/Kconfig, as needed
 ARCH_SELECTS_KEXEC         # in arch/<arch>/Kconfig, as needed


To summarize, the ARCH_SUPPORTS_<option> permits the <option> to be
enabled, and the ARCH_SELECTS_<option> handles side effects (ie.
select statements).

Examples:
A few examples to show the new strategy in action:

===== x86 (minus the help section) =====
Original:
 config KEXEC
    bool "kexec system call"
    select KEXEC_CORE

 config KEXEC_FILE
    bool "kexec file based system call"
    select KEXEC_CORE
    select HAVE_IMA_KEXEC if IMA
    depends on X86_64
    depends on CRYPTO=y
    depends on CRYPTO_SHA256=y

 config ARCH_HAS_KEXEC_PURGATORY
    def_bool KEXEC_FILE

 config KEXEC_SIG
    bool "Verify kernel signature during kexec_file_load() syscall"
    depends on KEXEC_FILE

 config KEXEC_SIG_FORCE
    bool "Require a valid signature in kexec_file_load() syscall"
    depends on KEXEC_SIG

 config KEXEC_BZIMAGE_VERIFY_SIG
    bool "Enable bzImage signature verification support"
    depends on KEXEC_SIG
    depends on SIGNED_PE_FILE_VERIFICATION
    select SYSTEM_TRUSTED_KEYRING

 config CRASH_DUMP
    bool "kernel crash dumps"
    depends on X86_64 || (X86_32 && HIGHMEM)

 config KEXEC_JUMP
    bool "kexec jump"
    depends on KEXEC && HIBERNATION
    help

becomes...
New:
config ARCH_SUPPORTS_KEXEC
    def_bool y

config ARCH_SUPPORTS_KEXEC_FILE
    def_bool X86_64 && CRYPTO && CRYPTO_SHA256

config ARCH_SELECTS_KEXEC_FILE
    def_bool y
    depends on KEXEC_FILE
    select HAVE_IMA_KEXEC if IMA

config ARCH_HAS_KEXEC_PURGATORY
    def_bool KEXEC_FILE

config ARCH_SUPPORTS_KEXEC_SIG
    def_bool y

config ARCH_SUPPORTS_KEXEC_SIG_FORCE
    def_bool y

config ARCH_SUPPORTS_KEXEC_BZIMAGE_VERIFY_SIG
    def_bool y

config ARCH_SUPPORTS_KEXEC_JUMP
    def_bool y

config ARCH_SUPPORTS_CRASH_DUMP
    def_bool X86_64 || (X86_32 && HIGHMEM)


===== powerpc (minus the help section) =====
Original:
 config KEXEC
    bool "kexec system call"
    depends on PPC_BOOK3S || PPC_E500 || (44x && !SMP)
    select KEXEC_CORE

 config KEXEC_FILE
    bool "kexec file based system call"
    select KEXEC_CORE
    select HAVE_IMA_KEXEC if IMA
    select KEXEC_ELF
    depends on PPC64
    depends on CRYPTO=y
    depends on CRYPTO_SHA256=y

 config ARCH_HAS_KEXEC_PURGATORY
    def_bool KEXEC_FILE

 config CRASH_DUMP
    bool "Build a dump capture kernel"
    depends on PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
    select RELOCATABLE if PPC64 || 44x || PPC_85xx

becomes...
New:
config ARCH_SUPPORTS_KEXEC
    def_bool PPC_BOOK3S || PPC_E500 || (44x && !SMP)

config ARCH_SUPPORTS_KEXEC_FILE
    def_bool PPC64 && CRYPTO=y && CRYPTO_SHA256=y

config ARCH_HAS_KEXEC_PURGATORY
    def_bool KEXEC_FILE

config ARCH_SELECTS_KEXEC_FILE
    def_bool y
    depends on KEXEC_FILE
    select KEXEC_ELF
    select HAVE_IMA_KEXEC if IMA

config ARCH_SUPPORTS_CRASH_DUMP
    def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)

config ARCH_SELECTS_CRASH_DUMP
    def_bool y
    depends on CRASH_DUMP
    select RELOCATABLE if PPC64 || 44x || PPC_85xx


Testing Approach and Results

There are 388 config files in the arch/<arch>/configs directories.
For each of these config files, a .config is generated both before and
after this Kconfig series, and checked for equivalence. This approach
allows for a rather rapid check of all architectures and a wide
variety of configs wrt/ KEXEC and CRASH, and avoids requiring
compiling for all architectures and running kernels and run-time
testing.

For each config file, the olddefconfig, allnoconfig and allyesconfig
targets are utilized. In testing the randconfig has revealed problems
as well, but is not used in the before and after equivalence check
since one can not generate the "same" .config for before and after,
even if using the same KCONFIG_SEED since the option list is
different.

As such, the following script steps compare the before and after
of 'make olddefconfig'. The new symbols introduced by this series
are filtered out, but otherwise the config files are PASS only if
they were equivalent, and FAIL otherwise.

The script performs the test by doing the following:

 # Obtain the "golden" .config output for given config file
 # Reset test sandbox
 git checkout master
 git branch -D test_Kconfig
 git checkout -B test_Kconfig master
 make distclean
 # Write out updated config
 cp -f <config file> .config
 make ARCH=<arch> olddefconfig
 # Track each item in .config, LHSB is "golden"
 scoreboard .config 

 # Obtain the "changed" .config output for given config file
 # Reset test sandbox
 make distclean
 # Apply this Kconfig series
 git am <this Kconfig series>
 # Write out updated config
 cp -f <config file> .config
 make ARCH=<arch> olddefconfig
 # Track each item in .config, RHSB is "changed"
 scoreboard .config 

 # Determine test result
 # Filter-out new symbols introduced by this series
 # Filter-out symbol=n which not in either scoreboard
 # Compare LHSB "golden" and RHSB "changed" scoreboards and issue PASS/FAIL

The script was instrumental during the refactoring of Kconfig as it
continually revealed problems. The end result being that the solution
presented in this series passes all configs as checked by the script,
with the following exceptions:

- arch/ia64/configs/zx1_config with olddefconfig
  This config file has:
  # CONFIG_KEXEC is not set
  CONFIG_CRASH_DUMP=y
  and this refactor now couples KEXEC to CRASH_DUMP, so it is not
  possible to enable CRASH_DUMP without KEXEC.

- arch/sh/configs/* with allyesconfig
  The arch/sh/Kconfig codes CRASH_DUMP as dependent upon BROKEN_ON_MMU
  (which clearly is not meant to be set). This symbol is not provided
  but with the allyesconfig it is set to yes which enables CRASH_DUMP.
  But KEXEC is coded as dependent upon MMU, and is set to no in
  arch/sh/mm/Kconfig, so KEXEC is not enabled.
  This refactor now couples KEXEC to CRASH_DUMP, so it is not
  possible to enable CRASH_DUMP without KEXEC.

While the above exceptions are not equivalent to their original,
the config file produced is valid (and in fact better wrt/ CRASH_DUMP
handling).

Regards,
eric

---
v5: 6jul2023
 - Filled out all common options with a 'depends on ARCH_SUPPORTS_
   <option>' and provided it in the needed archs. Result of testing
   with allnoconfig and allyesconfig.
 - Added 'depends on ARCH_SUPPORTS_KEXEC' to CRASH_DUMP, per Arnd
   Bergmann.
 - Investigated fails revealed by Andrew Morton's machinery, and
   spot tested with this solution.

v4: 5jul2023
 https://lore.kernel.org/lkml/20230705142004.3605799-1-eric.devolder@oracle.com/
 - Corrected conversion issue with riscv, per Conor Dooley.
 - Andrew Mortons's akpm test machinery found a problem with config
   files generated by randconfig. The problem existed prior to this
   series and manifests because most arch/<arch>/Kconfig CRASH_DUMP
   does not have any dependencies on KEXEC. As a result, randconfig
   produces a config file enabling CRASH_DUMP but not KEXEC, which
   leads to compile/link-time problems. Andrew requested closing
   this hole. To that end 'select KEXEC' has been added to CRASH_DUMP.
   This behavior pre-existed for arm arm64 ia64 loongarch mips powerpc
   riscv sh and x86.
 - Applied Acked-by's from:
   s390: Alexander Gordeev <agordeev@linux.ibm.com>

v3: 26jun2023
 https://lore.kernel.org/lkml/20230626161332.183214-1-eric.devolder@oracle.com/
 - Rebased onto 6.4.0
 - Reworded s390 commit message to clarify MODULE_SIG_FORMAT,
   per Alexander Gordeev
 - Applied Acked-by's from:
   m68k: Geert Uytterhoeven <geert@linux-m68k.org>
   mips: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
   sh: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

v2: 19jun2023
 https://lore.kernel.org/lkml/20230619145801.1064716-1-eric.devolder@oracle.com/
 - The ARCH_HAS_ and ARCH_SUPPORTS_ combination was found to be
   too similar/confusing. Renamed these two new options as such:
   ARCH_HAS_<option> ---> ARCH_SUPPORTS_<option>
   ARCH_SUPPORTS_<option> ---> ARCH_SELECTS_<option>
   Per Kees Cook, Michael Ellerman
   NOTE: ARCH_HAS_KEXEC_PURGATORY was left as-is, as that is what
   it is prior to this series.
   Updated this cover letter to reflect the same.
 - Some minor cleaning up of the help sections, per Zhen Lei and
   Alexander Gordeev.
 - Removed the MODULE_SIG_FORMAT dependency from KEXEC_SIG in
   kernel/Kconfig.kexec. Only s390 had it prior to this series.
   See also commit message in
   "s390/kexec: refactor for kernel/Kconfig.kexec"
 - Added to Kconfig.kexec the KEXEC_IMAGE_VERIFY_SIG from arm64,
   per Zhen Lei.
 - Fixed the powerpc ARCH_SUPPORTS_KEXEC_FILE conversion, per
   Michael Ellerman.
   
v1: 12jun2023
 https://lore.kernel.org/lkml/20230612172805.681179-1-eric.devolder@oracle.com/
 - Initial
 - Based on 6.4.0-rc6

---

Eric DeVolder (13):
  kexec: consolidate kexec and crash options into kernel/Kconfig.kexec
  x86/kexec: refactor for kernel/Kconfig.kexec
  arm/kexec: refactor for kernel/Kconfig.kexec
  ia64/kexec: refactor for kernel/Kconfig.kexec
  arm64/kexec: refactor for kernel/Kconfig.kexec
  loongarch/kexec: refactor for kernel/Kconfig.kexec
  m68k/kexec: refactor for kernel/Kconfig.kexec
  mips/kexec: refactor for kernel/Kconfig.kexec
  parisc/kexec: refactor for kernel/Kconfig.kexec
  powerpc/kexec: refactor for kernel/Kconfig.kexec
  riscv/kexec: refactor for kernel/Kconfig.kexec
  s390/kexec: refactor for kernel/Kconfig.kexec
  sh/kexec: refactor for kernel/Kconfig.kexec

 arch/Kconfig           |  13 -----
 arch/arm/Kconfig       |  29 ++---------
 arch/arm64/Kconfig     |  64 ++++++-----------------
 arch/ia64/Kconfig      |  28 ++--------
 arch/loongarch/Kconfig |  26 +++------
 arch/m68k/Kconfig      |  19 +------
 arch/mips/Kconfig      |  32 ++----------
 arch/parisc/Kconfig    |  34 ++++--------
 arch/powerpc/Kconfig   |  55 ++++++-------------
 arch/riscv/Kconfig     |  44 +++++-----------
 arch/s390/Kconfig      |  69 ++++++++----------------
 arch/sh/Kconfig        |  46 +++-------------
 arch/x86/Kconfig       |  92 +++++++-------------------------
 init/Kconfig           |   2 +
 kernel/Kconfig.kexec   | 116 +++++++++++++++++++++++++++++++++++++++++
 15 files changed, 248 insertions(+), 421 deletions(-)
 create mode 100644 kernel/Kconfig.kexec

-- 
2.31.1

