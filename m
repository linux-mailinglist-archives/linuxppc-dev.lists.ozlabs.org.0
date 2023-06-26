Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD2B73EF74
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 01:48:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=eFvm6S5T;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VOTDwPFV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qql064H4Vz3cT8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 09:48:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=eFvm6S5T;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VOTDwPFV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqXwq5R5Dz30fS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 02:14:35 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QCL53m023791;
	Mon, 26 Jun 2023 16:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=uy/o3FgerajaMAGm7n2jMETUlBCCFeGfSqsYnbAzb0U=;
 b=eFvm6S5TGz4vYGQtbvsqld+DwXU4aUU6e9WlzwyFOh4qMF7H6esj3y44oEZ/RtcOsClh
 iySsab9KKMrz+B+gsSPk0sqBFA/dtiJmWjCeSR1JJ6KoQpGRwJvEDUgihQGhOmtVhWDS
 d48c5eQ0EOmnpJcjAfp2sEZMll39IwtJYYulNuiVF4lLXKqsnKb1cZ5MQvB2PSzGEUr1
 0ShxH6aFfzP2ifUAY3XWXvbeXqOn4dI/3FZlIo3Oxb0T+AyUbG61Ij8SEoIrYS2ZQSJM
 +cAf9zeTrBTf66GlafX+MYkLuOIav4YESLMzyggtBBh+znqu+jLHtM5RMGE+58aDjiA+ 9Q== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rds1u304f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:17 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35QFDNrs011156;
	Mon, 26 Jun 2023 16:14:16 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx39w4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYQJvZHADP2rzTEiCZ+WE+Pkw/Ni++b0u0kjCOD6DUdn+/pwVxJa5mLw2jQM3aTiUFJdOP2gjQ6N+QPrDBfQraSx7ieJXzOIqNI6IBWrHGLN8bIFX5hBRRF+khxkb1JdQN7zTREL0pJ0JmVRUAVoYKsG98a4yjceP7RTwAvRoIXRXnCJGM6W5vOT/KcjM673/VH8nj3/MxflMi6mwr+STYy+bogk4aLN7GqhbkZ7OplpmGkE0oeulQb/2YttXcsvGOM6JPGVmQYyEgthlP86YUfNdJEyJIfNVY8oM/yTli3Eq0T6QHcbGRex2kHNyCXniug7+QpcoLuP3abCax/X/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uy/o3FgerajaMAGm7n2jMETUlBCCFeGfSqsYnbAzb0U=;
 b=QML3UjOzAzMSev0YyRmKqQDXL8nVXNNmCblQNQYsdPWzyhOZraxhla2r6YaJCneHxYTXQBL57pYkmG6GEJkvFkvxPzMGvESkJjO5mKFqX76jc+aC0dRI0s+eb4L8Met03YyVGAl5dZdK4NQiQfr+mKrANEH+c9CDFadHF+BN4mGiUKvY9T1I1CeUoRmym3odLPt590JLFfsG8LSiEH6mrPDVNX2h2lPZ3EDzKW+kjj6pF1d/g1sCH3qPOu83EYKbWg2S6Q0HMhc2K5FAs5RY49KQZ9K3b+3hLnRXade/PLCe+S5G63UfuRdDPWt1z3SPQUgkVXk2ZrVibmgEsFZMEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uy/o3FgerajaMAGm7n2jMETUlBCCFeGfSqsYnbAzb0U=;
 b=VOTDwPFVAuJbaribNeY3zsJQhmQhw34s+5yjfhkpb6vQmkwd2iPvzY3uc1qeB3zlzo4GHoa/V2akwe7v5IUI0O9ANrmmebuedsUQPlRFApXcTq5JiVf6nRIKlB5ba3LgLjrX4DQ4k3eRssQV2guklSNWm/6vd8yROfNK9yGq2xs=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5585.namprd10.prod.outlook.com (2603:10b6:303:144::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 16:14:11 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 16:14:10 +0000
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
Subject: [PATCH v3 10/13] powerpc/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 26 Jun 2023 12:13:29 -0400
Message-Id: <20230626161332.183214-11-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230626161332.183214-1-eric.devolder@oracle.com>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0210.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::35) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CO6PR10MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: b3e07eec-c239-4ba7-c925-08db76606040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4UwcOlB+gbyTiqQO76PWBg1Ouh+vaY+vQDFCwGy2zXwR3fn15y5QLJDg9IK6Cy6J4olE+4RDrnj1m0d4mkDH9SWX6D6kizTnU/4wMShk4jjV9MVJjZ61RTY1fcbXi8J7KTt45ZoWSSEf01wX/L3424OE0jPBqrAkLwNGpkGip0GcPDd5nUz+cXd02qRwad9EoXhBK7jFfp07ZQp1nJTwXZ/k37t2VBOjgB+muebQSOVny65fY8IxZUlHrnJj4B6ndUpRB04Fx4txOBJOka98IYH7DUCkDt+uw/OxrgeKvRZtjKersqdpqyYSlbte7LMG7Mbt5spsb948Fe/l0wa/Ybu2tC6wuxKvnmJEN4yBxZyS5ey89XNQD6ntl86IcVyVStBb53C8XwGP2W9vHrnZJNPVxthXTEjqA2MpUPLRQbMkhUX9QtF5cKh0d8uiU2OJutLfiHjycQ62MbP3Y0OJiIBh8AJDKOmYi2Ck/3JrrMjnP3fraqxznoOPdAo2+AkjD7zZritF9N/J7muZOtWeVr61ivUIBu56x/QaTqeGOq9xDajHliNB+JhVwgwfpaMRjDiqMoTj2D0u72W/e1R2ZU+SxOWpiJCG3KV+RN8GXiU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(2906002)(6486002)(107886003)(38100700002)(6666004)(921005)(2616005)(83380400001)(6512007)(6506007)(1076003)(26005)(186003)(41300700001)(86362001)(478600001)(316002)(36756003)(66946007)(4326008)(66476007)(66556008)(7406005)(7366002)(7416002)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ZkLHjvzwk+gtzWaiXdfJklNCxHp2vF3pczf1Zm8iaC+/Z3W/uUDgu1yanmHc?=
 =?us-ascii?Q?7qRSEpqeAtnEg5ERqBPiqgP+NpvdRNj0HX8KlCH3Yf0rQHJSMGSxi42fU2Eh?=
 =?us-ascii?Q?RZI3CK/2+t+yiEf1YXq5XUTlFwk7TpTdrZXwqL925S65lCD6pAHRhT6mtMTp?=
 =?us-ascii?Q?cFo87Vy+2AOwCogt2iPnKu0GGBrjznQM7GZu83tkh6Pt6dxam1VAgkdG5lzK?=
 =?us-ascii?Q?udWQzIdEVl84h/hOXLdP4j7zWEQZQROGscsczWs8dNvrR2j5SSzgkT2zSlbo?=
 =?us-ascii?Q?bd/SDxn7e1/uY7gk1Nd5qeMEwFC8HRwiAI3pCU0+ZR9jSZ42Dhc7yZIDRTc9?=
 =?us-ascii?Q?9kuTg/DrfWXDDK/CcMmSUcLVrjb47CG0Jxl1+Oei+jqBGXcjmd5TXNQNAnS/?=
 =?us-ascii?Q?lN6DsXohAj8yiCfFhsIrB/HrDF8nI1dKAHcY0Z8UaeET4yzsr7E4llcTxEWp?=
 =?us-ascii?Q?CeOc76piNuk/1WD2jALHZq+8YdLjfs3FKmdnfHlSwNkopD5et38jiYmrxzDq?=
 =?us-ascii?Q?EHYxVFjOFautSX1E0HmK/xcRm5qg5XuOQsP6suRc/7XuEPHKgAlr2mFa66Rf?=
 =?us-ascii?Q?lSbEQy0t1KEkn5xgbJlVAU39q2+i8w4iLBqLlsGHOuI7qZJ4YuPcXa203/YN?=
 =?us-ascii?Q?W6eS4TKi088wzWaojyucAW4H07xmViD4K0fBzLWFwC3NuDCwYK1ptpsFmumK?=
 =?us-ascii?Q?iYYtoU09Wirb/KrvyGC/P5SnsDCT4SaulFk19cXz+KriWcw0W8oDIkTL7JOR?=
 =?us-ascii?Q?PiQzOkbudAV35WFw+AXuNgdav0X+ap2UEtub46p6OYY7E8Ka8CxZeEbaRyE9?=
 =?us-ascii?Q?rGt4xuL3kCwC7Cq2BnddsWHTrwMGHKYk1Myn3136abCQkbeZnLWxX44iBE9+?=
 =?us-ascii?Q?dE9YJmNWZeeGBvMvu8KkfxYj/CRcMCJSIuj/QhkJpeVxytgA9pXzt9S7z5SJ?=
 =?us-ascii?Q?VTtU3oiW61QswfiyQ8KWEGrBt3uPg2uoFfB8VEjuO/Pb7AnNi2J/BQhhcpWG?=
 =?us-ascii?Q?rjer8WN3GhpbSulLqs3DES/CvdITvSg0UIPYHUSgk62VzMkBthuXjUfOUYpu?=
 =?us-ascii?Q?eqFOgar5cppgj6vQo5J2gnsNlYBayUHDZISA+WdEmPMuAYlUnGNKinLsjeLR?=
 =?us-ascii?Q?HRlfaI53IjboZNGInVXOAF+t2LSQ9Zlp2+PBLBtS+A5JvTk22DwZGBWZL4Vl?=
 =?us-ascii?Q?q30wjjdwBCOSImbXGKZBwPnfS5uArw3/2FZxoOmH2l5R5EBrz/SGMvpqOR27?=
 =?us-ascii?Q?7Gsxh26fDzub7qN9ihlDYgE21aP8VCUY1UMJ++15y6ZIaBDcZcwAIJ3LVQQl?=
 =?us-ascii?Q?5bHMJz28xdwTzJBGH9Yg3YB8mLhQxY3dmCz1MsDs6bZuMyyO6dELvFshOC9X?=
 =?us-ascii?Q?kzvqKh9kltY4FpXyw23UbOC7efHdp8M6nosVbK/mU/B6ApGhG/Rny5hacZ4U?=
 =?us-ascii?Q?3l2T2KaUk4fD8I+MkCKDU2Ham9GAHnoLoCz9WElB5pKiooX/QqPNxvHfMhGA?=
 =?us-ascii?Q?slxWPLrCKBQmUhk/F2VxhxQbYVSMnZn2uQ0/D9wFDXHB8Fejql9qfsbteY0n?=
 =?us-ascii?Q?8iLP/ZuoWg7wJVYGPfWH904LtAln0IcGzyj1BL1e5Oq/nsmboqniq7VJ+eNT?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?wkLLOfVjGWXJ7YmaFysg8MjI+8iNAXyEXgiKyciiwDOFh808Z23HaEcF6qld?=
 =?us-ascii?Q?B3lH8AgJzI1dNgmPsgzOmOj5FbRB2CJBK1x0cwtINXpaHIoxX5nLLfkkvyP4?=
 =?us-ascii?Q?FDWIlOtuov1wB39qjeNrgHmlcMS/n6FH7mG4y2qmKiUtNXIQ/zcZibEz6ze6?=
 =?us-ascii?Q?dbXKs7tTrVpSfBWqMtjaVx65BEF3nINMcrVnwS/G91nxFqzkQzkn2DnxrYFj?=
 =?us-ascii?Q?a9HJvD9tQcxR1FoyvS9PCRdGwp2vyhYuPc3iCuKCklg2QsutWicyK+Zgxe/R?=
 =?us-ascii?Q?zIePxWWj3pybkhK0zcbJuGhMV4XnMO3wYihOUQ1N6K+tpgp9PrpcJsQJb142?=
 =?us-ascii?Q?9/9k2PykO+Xd/pL135TYI87PZ7z6xZaSSVbRN5AtJSBsz67QzEfc+1mJMSmy?=
 =?us-ascii?Q?oWQBBtYUI+v9fwJ78hm8og61EwY8Ta+b9QmrA+IrTb5PL3jnxEPFXbB4N2hF?=
 =?us-ascii?Q?xdrbyKClUnCYGCw/dKAysCsjFq26Un04SER6rSklhSvQqq4YtMJ1B7N2pCQt?=
 =?us-ascii?Q?BTBAU/Zx/IsgfEi2Nt0sYv+wfBGRlHyBIQfcwEYUoPZwHARqcy59Ul+Dybhf?=
 =?us-ascii?Q?zmNPZFM2fy4DZYKFjNFI1ciXjGsSmz0Bcm63pkqYEtAdyA36616TV0Hs0aVV?=
 =?us-ascii?Q?7NOnLRpcoLxhEEdkvuP1JhZs1ZqpQIs3sNjNsuOwhPLcd5Z0dM3811m/Ayh2?=
 =?us-ascii?Q?u3EmfEbhDhFLafm0cnFnleBph4JOcp8zI1wJOmKNsGFyIxNpiEhcVv/YdgPJ?=
 =?us-ascii?Q?jzhF0Dg9EiDfGe6oJEOz0/AZRGiQ7uJQ/qE1J3HLj7ghRrYjKeB39XQOv5rH?=
 =?us-ascii?Q?0krsgwfwcaDUieDqD+nfhZhahoEFOpC0vbbxdzNbBr/fWhsBapasbZ/DKpTv?=
 =?us-ascii?Q?hkonhLR5Bk8fGgcXMmErUr3ZtrZnPJBtPCVUrCFfFuVRz7OabDsLexHz/B6Q?=
 =?us-ascii?Q?kbJdp/68nAZeIslIGuNox6Aek0aKSRNg655p/jKm2RIXvoVU2DJI6SYyuLO5?=
 =?us-ascii?Q?V5xBL3SO/D4iGEeM73uiaXH+xC46fCeyJXZaO/BrziVMXN4/+GXR55MGMQP2?=
 =?us-ascii?Q?ukAkuvZFXAtd7SpMHcHAkSiiwBuNOuCpFrWf41C4imqAN5aO/gAMbsbtSG+8?=
 =?us-ascii?Q?xxPY6V0g2At0ZXBf14vsSjE19PZXRLCu4y9gAwH4whwEN3O2H6MRsZQj0QuJ?=
 =?us-ascii?Q?RsLaGyCG2Ru3mTBzP1kJrWRB00HAjhTsiZ395jRxEq5QaBieYvWQ5oAwvHxA?=
 =?us-ascii?Q?RQ3RW+QmDcHZMm0XuhE5tUjh68DDUeDxvOMJatJ2Y8FE3oQwON5MIuS46vuD?=
 =?us-ascii?Q?CAxjUoxTqIgvkshbJ8RzNXssW6DE9PdgzI2MLyLMe/TVB5jTgv6LLju6RJKA?=
 =?us-ascii?Q?xrukpRPpHAn4/87V4EDD6z1vcxM/7XZYm2KHCNlfB0ke36PlKx2OSbtnX56o?=
 =?us-ascii?Q?QsNWGb2yvw005KJwq7wlMy/63wTmXLnUHZO6RtahnjQhYPtq/wCIslUfPQy+?=
 =?us-ascii?Q?p0FRlqSiszjWl7wrcXodv8p5THVEQjIfFxFh7WkGjxDa+AWR9FiWroyXO9hA?=
 =?us-ascii?Q?DxCPR7MMC9yf7qt04kTB4an9qv2HWUGLXliaDdX0Qnf1v7CACuc9M++5YdB+?=
 =?us-ascii?Q?Abg0rnQYiYcOZCoePRnBhB5t3GipzR5T/zMd7JopgcQQIlwJmaJKbtesZf1q?=
 =?us-ascii?Q?yx7ZZAu/4RBLgJsMgNNQsu41ADfN0BNztX3as4JxWpefAQP9dSKCPyslFTGZ?=
 =?us-ascii?Q?PzPlIjfNN97Qy/TVKGsLyV4eyIvxTPZqZZ/9eoRvril7P4cDp8doJSLbzNR8?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	tG83gre9Ee2vfUx3e88XsyiD7gLmXemnpyfGnIGR9Cxb5il/uQu6ZnaSOReZwIV+oaVoBOHV+86wPar1D9EXjsvKDb1BpRb2oPc13I/HOSdoTXxk4XoPsAS6vCUZH2w39+PKWe56GDrhXHhnJLiFf1FWg2KSzWkwMuOhhfTQxie4KK6yf3Nl0ovXyaVFp0AgNZK0867wOA8sedg6zh/ug/K/LlSMJ/osHfAjjl6Ih+YP5Gu0paURMkvcuK56dls3wGFv+G917+nGmRe3S+SvQFkKYKpSpjf6KwYBHqe4f9fEqL+KY2DH3QfJrjOvY3zRtpF0abiw5vBMgAHRuM+ivrays6hpf5a0D2mYLeWPKzQAVUWMyrltIJJFrY9wyVsc7rNaWZuuMnBKqsOfBqE5nlR2vYIRZM0YeTZIHbo3Rfx7/lb3tvBMFNCZZXRC8A9wiDDa5m7W1xPF+Q==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e07eec-c239-4ba7-c925-08db76606040
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 16:14:10.8632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dXToiwUqjDzYpMyOygRerIHZqcFpPaLnWfL2BnjCF7gsh1KWpbXQEjcJ6JI+H1fBHDVC02TvizAGYucqynBtZJ9ooTc3qD6UUD9/OU8o1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5585
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_14,2023-06-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306260148
X-Proofpoint-GUID: yvG2S0WXRZht1b-HHq78euSLQ-8l-AA1
X-Proofpoint-ORIG-GUID: yvG2S0WXRZht1b-HHq78euSLQ-8l-AA1
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

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/Kconfig | 55 ++++++++++++++------------------------------
 1 file changed, 17 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index bff5820b7cda..70edbda08ae3 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -588,41 +588,21 @@ config PPC64_SUPPORTS_MEMORY_FAILURE
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
 	bool "Build big-endian kernel using ELF ABI V2 (EXPERIMENTAL)"
 	depends on PPC64 && CPU_BIG_ENDIAN
@@ -682,14 +662,13 @@ config RELOCATABLE_TEST
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

