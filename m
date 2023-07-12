Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B71751387
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 00:28:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=vGzzkt9D;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Y8MOQnWN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1XTN2GLBz3c3R
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 08:28:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=vGzzkt9D;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Y8MOQnWN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1NCd02ZCz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 02:16:28 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEjHHG010033;
	Wed, 12 Jul 2023 16:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=6WVXu5nJIeV4BVRG02xJHoWyyZ0OCnAKt81uvDMieJw=;
 b=vGzzkt9Dls6H4p9eeP5txu8nKOa3SDxjQMwKCbcTibhJsS1mktjSPJSYtJ1hscq4wrT/
 nZfaufNyn7CUb8Gmug9ETnZ17whCQe0jzLJlKpbkdsYH2sqZjcr0utjotLeUjCpi695o
 FILmdtQpqrsfGPI7Vq7EO9mpCfoCI5ndamLP36nFblqSWf1SDqJP52au5fZiv4zOhhG1
 TUy6647M0ObA9di6orUql8F4sxDtqRewMVzgItFI188GpuYXC8EfgtjbxP28oDFQb9mt
 ioIG90yEKEcuXlACGigNJhWFRBGPDvAk8pyBAV4iyrC5Cg2Pw/fV3JyFrpmfismZ76cc DQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rrjmhd7a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:06 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36CFBhYb033274;
	Wed, 12 Jul 2023 16:16:05 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rpx87b2aj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HP5UqmuPXMn11UPKQeCMY9wBb177jxxoPJbXAeTswhW+5dBnyAnbxNu+Ar7tywOWIFPwVX89wJbdgYBvnUY5pPVgmvQSYcB8+bwlsZWUZOOrfdqgZiq5Z9TbxuUjM6/tD1ljDHoZYzI8AxyDF5Ijs3Tr+Qx0nzjSheq3Ox9v/nz9JJjcxe90g/mFCTRIzKVdcy/dgFaoXB2EVbbPr51+0xItjAzUn+Lx8pzQRzOOORPJYiXINE3ENRrd2mUAkW5kWO/Faoywm4Wu5R/8JhRFIbdfAbBOvJLqZgcnaerDanFRCjLJ7QWdtMWMY1eE+NUU386Zb0sqV5QJ72vBLIALLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WVXu5nJIeV4BVRG02xJHoWyyZ0OCnAKt81uvDMieJw=;
 b=bEVZ4O+wLmI128y6xOdMDe9+5HEs5qF+Fs1JxllopeDnwKrT2iI0YAOnPeddak22LbKTkEFA3qWXodnCs2VUxbT+7vDr2CGlCALRuc3AW8OGkvLnzRxdOUHIRoSSbZq9zPaIE8HsLhYsz+jzLH9AtduImlYoG2wbaHFhUu2Ax9WIdfmvx82atykUUmtgZccJNClmYvyiiY6fz7VMl3+woomSG1a2UhMviXKMIpb86TmUM1aFHAi9htVBOJxA8uzKngbHX0KR33g6j5H0qYbpXNOVMhGoy1IncTHQOXcrpMKJQk53H5Tltpp99A1TCPQZrWtJJpz7ipJG7SNTxn99dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WVXu5nJIeV4BVRG02xJHoWyyZ0OCnAKt81uvDMieJw=;
 b=Y8MOQnWNW2N1YiyZhEx2lIo9gW0k3FIW6DiJXvfUp5zImj4vyGnQG9Q8xuQg/bi1y3HkCzPb5vrWvIWm4jR2W1IDs4jH0LastKGAJwbTLsbauSkIR1JC466DnThXMDPwY7Mx2AefEqSmZNar8YPobIa1EopObehg/7GHtn/mKHk=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH8PR10MB6501.namprd10.prod.outlook.com (2603:10b6:510:22b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 16:16:02 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 16:16:02 +0000
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
Subject: [PATCH v6 03/14] arm/kexec: refactor for kernel/Kconfig.kexec
Date: Wed, 12 Jul 2023 12:15:34 -0400
Message-Id: <20230712161545.87870-4-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230712161545.87870-1-eric.devolder@oracle.com>
References: <20230712161545.87870-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:5:3b4::26) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|PH8PR10MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: fca28251-29ca-4f37-6e90-08db82f34983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dUOfPNhZDbL4+DPcQZ47w679KIIIJXapRME823CbUTDD9ayP5ZN0sj/we16M8XvrcaLp8Ugl/n0hNUPIfn1ncRRUXhd4EL4qQbLo8uTZWeay7lkQIWt4QYvXuBRMV17T+FEc9rkqauz0hDZfDUzA+psVhwpP6kKSEtJQd/3fHwzfhSmy1pa6A/TmvVOiPIUCbQXbJykcRBLQNJBCylp+Y8byVCO+kVr1ikEAtc4lKhBK751VVbaqVTeo/tZH0w9mlBmtwjv6FNyhr6Ya5SUZIyCSBQ9ul3RHpSzkIOAXUQzigCu3T2xXniDX5VYQruGE5tLR0DYG6YVFPv/5N/FZUVsHHn4kY6pCjgBbPeWzyB+rOTFqTQiQmJeNS5BXylgxsAgbLUoGhXuyNTJd5Lb6/EZpN5mkMqMrRdFfhuar+32RJWZKNLV820URaU5J+svvw5+O+rnBfBoN8/bziwjMlwAyIv9VNS96UwNV9xQzggLJs+Va+/1fP4QRkJ0OuotxmNkkCTtXoQEeebA/G3m7+oRcutZafWWlnKHsB/a9E9pHnDqOfA/Jo2czT8ta9240lKOTDnjoB6t1XvWGBG78mSRxTw7mtI6jiVGl6K+EUWk=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(38100700002)(478600001)(921005)(4326008)(86362001)(6666004)(66476007)(66556008)(66946007)(6486002)(6512007)(316002)(41300700001)(186003)(83380400001)(2616005)(2906002)(36756003)(8936002)(107886003)(8676002)(7406005)(7366002)(7416002)(5660300002)(26005)(6506007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?7QRg3TOar5oXKB0qBxbkG8Bam5fIQ/IuEMP2dLMPLcMwgua0sUGl9uaZxCoy?=
 =?us-ascii?Q?SqLgLLqMiRt5vDwWB3s6MWNJm7pSzbxIgHuE2TATX4D0wWlaQX866axNAZT4?=
 =?us-ascii?Q?luhfN2YIdMiNpxmvqx/avvvRzacslTEItZLAewt9L3i06dPrZpGI4iIfKh2t?=
 =?us-ascii?Q?bgwk2ztaFPMrgHrhd9s+0Msy2u8LkMMrR56ruhTfjVCtsgCw2Rp6Xy2/lng8?=
 =?us-ascii?Q?mOzHSWQk7UPj7ZRonMk06pRKMPiF3MUC59aGW1HwmkseRYIZSSGp6uc4r3Wt?=
 =?us-ascii?Q?q6VAPbhXU+X+JYfyQLWnKjNN9mREG4Kzr4yrtT98SsWtkq7nfrDe10WRehCi?=
 =?us-ascii?Q?t6pY3vxLStDrFi7YMR3aQ8gMqrKvhYuVOcENR3ZuhljgwBySkepJ1gtbB/pV?=
 =?us-ascii?Q?MEAMCUGvQlkJTlcWELULCc9+E9DvjZWsqmbNLPhjrLCdIVMRGO9tqCsyGz9v?=
 =?us-ascii?Q?i5GrEsy16mu3D55QMgHMMOgyiKN/gXRDKP3RTXg18zXi11+B+X/o17y5ma6j?=
 =?us-ascii?Q?yX1SYIakRG0riGn/C+IBtzpqhnK8MFtcTsz4iUn+NeN/Gzx+ung78ifypclG?=
 =?us-ascii?Q?WFU/5sNIvXRStcBYnvevOqV/9G3gfCQZ3VLHialVwKvWQiLoMf1XOwbNtLSO?=
 =?us-ascii?Q?SsY/nX0+PYejbkV6ag/ZDX3Q6ltywTaAwFmJGY0ZUisEq2QHe47Wfatc5LTk?=
 =?us-ascii?Q?ey8Q5UG8XBsQqAr/Wrw0Fh3p9jyRXAyS7nbnzdJEsYXQUozn8iZJ0+BaGWg1?=
 =?us-ascii?Q?cx1WsWPZQXT7hWAdekTE5nzeSdgIlAmZyIAePVm0QbJLd+IU5Upe9mICP354?=
 =?us-ascii?Q?0LogQ/BRpQmten1lEY/XPLNSYvl0mxnnwHAbXYVvgn/3uubOjg8G2YbfE95R?=
 =?us-ascii?Q?i61DUM3w77LXPtQz5piYj0wGQXEgTeqRdMw/DCmTE9ZohXZDyMQiHRUYKx0i?=
 =?us-ascii?Q?gkz6D+Mm/flIDPuKAKPDFbTQkkZOk8Nn1LmV7XgVMvlFFNmpf5cPQflBlqG3?=
 =?us-ascii?Q?qzUvUAdP3DobH5FfHBnwPw82LtuLZIxk05TnN91IauUo7YCLvK0AaJ3XPCK0?=
 =?us-ascii?Q?0fsEVRnVcvV1RH5Nk9hG4UN4jdxLtm9f64DhOhG5fI0R/xH5W19786BAhN2x?=
 =?us-ascii?Q?YSCFxQP86B09vdTBLhMXAH1PpZIVsJfqmYeehUrlg1wg+HT8rkc+oORwM007?=
 =?us-ascii?Q?zeoc1wEnrag3n4rzT9qwvOc9v4dxjiu75xTIhhr4Gn7cwkRLvoSilbsOxE6j?=
 =?us-ascii?Q?xWXLOgdeIIDGANbbPl5RufdUn1SfJm9Dp6zKc+weBqVWtPWSkbCcYwBjebwx?=
 =?us-ascii?Q?i/3mIFF/6Mpo2hpcu7Io/BdKLfIngk2h/hND9sSbfS6QS48CXssZQnOeeN+X?=
 =?us-ascii?Q?D4QZBhhdQNQcfIrLN5X5Lj9eoAMnq9r7+MNDz7Pbz714xhmtmFUchtJvqXsV?=
 =?us-ascii?Q?pPZABHNR6GDQzePGXTFUFkMbsLCT2DB5W2Zg6Pb0X1Pz0C+wwLAfq07N2uRW?=
 =?us-ascii?Q?ALiAPcjT1BGT+hr1L1BmEaLyaMgxVvL/r8ZltHaBHV5uGwil8SqGCfp6KP4J?=
 =?us-ascii?Q?3VwH2R73YZ4XE/DFtQnOf087Jwxxb3z4MiycHn8cS7wd9OC49b60wYf4MUut?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?mAzMxX5nmDZQNt1z5nufWQT67nZywfveuHZUUE6v7Sp5APhdT9yM9sjXJYAu?=
 =?us-ascii?Q?EMeLZYxr0FKJE7KNSqki/WKao3Cgi6G5DzJgmRNNQVWCc6DRZ8q3cvU7cGuk?=
 =?us-ascii?Q?SqdFxgU/ZF3GFiipGGxheSFSjQnlIa0X6Lmhef7mxM+sTRufK3b1aev9i+OL?=
 =?us-ascii?Q?BBx+wu+0fo2vzgJe7IPoods/io5p2c3HofT9GsVUQCdkY91FO/xfl3hggwUm?=
 =?us-ascii?Q?d0JbbfGsZMghRGAj111uSCC+sWFnBjHYhZAB5KXzhrYokvmeHSUVVJE24dDb?=
 =?us-ascii?Q?fKo8PCxxpQavY8fi2B4LxOIuB7/WYeC/ShhWkL7W6jJQsD7C8RPP+Fx9uvgw?=
 =?us-ascii?Q?g5EThvjrcu+L0zaWIFGVlplvYpuv2IQ4fslR3ay87sQVdc06MO6AE55Buf80?=
 =?us-ascii?Q?GFYrHE8SIZLmVPctRAFm1JvP7yl7hTECJYbjjMYNwCr3je/kFwXWnC5t6qfg?=
 =?us-ascii?Q?lj+K6Fc6qpJu8VoLr/6JEIuyhBSE6vg4OJW1zbL+HCnsiY46cZdB1+RgB2YE?=
 =?us-ascii?Q?LbF4bVqckHQyQW4QvFd+VW6TwADDov8HJ77yNDQhxgHcmPB5mMVo1uxyGdwB?=
 =?us-ascii?Q?AIKxKx3Lxqu3iM/yjZA6EGjoGOWIvNpqx5+9f/KQrn0JSap1QgUQTazD5JoH?=
 =?us-ascii?Q?TiWOAT+nO9d5kwJdFTnVPp8aNXvCGAdF0AQiMo+dDbFObL9EYaJPWI8fhUXX?=
 =?us-ascii?Q?Z2sHG0HJAxRufBiTrPpV2ssZU5dD70ft1dMTWITTqpvIWkAnfIYjrmc5SQQ1?=
 =?us-ascii?Q?xFjq8Di72YP2IA+qhQdUCzw0pAl+RriUZh0qTmNUKhXgVfgUWWm7dI3gO1MG?=
 =?us-ascii?Q?ZBJ0oBjgnQ4+LZxf0IEunVjTPneQCuNZos8MgHb2FetlqFkjgolP34y5qPLl?=
 =?us-ascii?Q?b5DiLvSpKJLnC4ZiYhkDr8CMiQ4qFF6wMrDNQVmBIL/UUoU2yOoipxD6nqej?=
 =?us-ascii?Q?ucmmXXRYwKuOLdQ5m6k5lFCqv2R/XAWfGVtzv/Pw43KozidU0FBXQrc1fpaK?=
 =?us-ascii?Q?t29A8iXvvUM1xiLENsE31/vzstvhu+wSEUm3UkXRpPQ3fZLDc88juDICMCL3?=
 =?us-ascii?Q?CN+8/3nS/ny1ktPLtNcTyFL+lr/v09waOTYaZaMyTG2QrrlxCTiZzQ0708io?=
 =?us-ascii?Q?oWc958r40Gtix4j86PhvDtO2oL5IHjy6MKyvtkKvVHpepLH4IJSlYK9DudKp?=
 =?us-ascii?Q?0pBweJpEoGfAtpPDxADeucuFRxxr/cZnpTgCGXXzqtU9Ebw3JCv7dhApWhI1?=
 =?us-ascii?Q?4SSeS6XF2EcMzhTEM5PSvPkxxQD7hgBM0grm6ZeM0RyWpeKy8USHAmuBlbFF?=
 =?us-ascii?Q?wtEKyEObPphF5sndPBhoyx0RmqMZVr3EbCuocWLOdSVmB5pzYeI79Ei77gsQ?=
 =?us-ascii?Q?QbI2s2KzrCMzT2RlhRD5hoU0OdJ27mT2EIHS5ojihz7k9SVPSx+ayLzNuALE?=
 =?us-ascii?Q?cbMmtuUvDPc0mEl178PrBgWNAhl5DDHEABAehgSki48VkFVx/yTgwZijXXsK?=
 =?us-ascii?Q?TiTYZU9z5h8nojszDDrhOmFy8kRFQPMgMBZmAk1wFqpc5dDxr8QwAlL2GXn6?=
 =?us-ascii?Q?2O1qmhT3KiJA3EYUnRX2zLmBa/y55E1auoC8p8EGjmieIj5e6CRsCxFftoCW?=
 =?us-ascii?Q?61B4eAz/vFlxW0UsdGdDKAVG5s7KPabIZLFecOeherZZyOffE3j+WvlXjBbs?=
 =?us-ascii?Q?+TQ/cDJDDntcZPcQjH9siRS8JJVuR5oouq3qVdgBXVNFcnOD4muLBjKv89Nk?=
 =?us-ascii?Q?K8EY1mw7wRIc/K0KZq5i6MY5p9zH8P/jRorMrP3ET2kqt2bh+1aQwUYk0JIn?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	WPi9acEjXZe230ajJ929PtdP908k9awDs9MtMAVytUX3Hh5rVrBjf8LZ0wCh5yADmaT3NRuKv3OwfBpeeiw5ZwdkC/5lTdI7NH+OjkLp+yCrmdvZ9ztpOeJ/seYi/7pbQjL7gmg/TWMS7Us1yX53KuaasC9l29hAlhFEpzCEGf8XrDEeS7eTUiqotmHhe1HikXPowtV7aN4pto4UvQwKpkRjG28cnGEy+fu4Mnp0BnABRkG4p3SalMcgPr1jPDxcecxPqgrs0RLSKW9UPlpHcVTNhvAFz/XGS/P9enB6fhOiFrLtQ0VqakLxLd68dmMrgTlpRdnOSuLR+evqYG43/gH1EMeRzSTz/pmNpWmxF0mLnVmBRGo278yibgNqTDkRDRHAUEg9SDjbDV+DBDBvLx/T04ogU8SWXzDNlm1uetLyJ54uIQHMhMiiOPzEWf+FxlzMrY+3zcSw5w==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca28251-29ca-4f37-6e90-08db82f34983
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:16:02.7118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SXqoNpTpH073u35fIKvmTWW7Yh8iR9etLWcr1MBMnfaSm7nF+JIxS34AvGiFoN6Rod5x313o+srDAhNFq0EYCytvUnvNCrITW0GVD79LRUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6501
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_11,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307120146
X-Proofpoint-ORIG-GUID: k4ai1ctm5cQP072C2yTCsIYrbBN5olXH
X-Proofpoint-GUID: k4ai1ctm5cQP072C2yTCsIYrbBN5olXH
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
 arch/arm/Kconfig | 29 ++++-------------------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 7a27550ff3c1..1a6a6eb48a15 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1645,20 +1645,8 @@ config XIP_DEFLATED_DATA
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
+config ARCH_SUPPORTS_KEXEC
+	def_bool (!SMP || PM_SLEEP_SMP) && MMU
 
 config ATAGS_PROC
 	bool "Export atags in procfs"
@@ -1668,17 +1656,8 @@ config ATAGS_PROC
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
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
 config AUTO_ZRELADDR
 	bool "Auto calculation of the decompressed kernel image address" if !ARCH_MULTIPLATFORM
-- 
2.31.1

