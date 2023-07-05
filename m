Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 951297490CE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:07:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Fuv1Bu++;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=wuKGkao/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxDKl3Qyqz3c22
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:07:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Fuv1Bu++;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=wuKGkao/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx1zQ39DCz30fm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 00:20:48 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365EDwwB014181;
	Wed, 5 Jul 2023 14:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-03-30;
 bh=fzE3f0KuR6wmgF4l+h9oSB5M6uWEOIqXY4TMFU9+WaM=;
 b=Fuv1Bu++DCWp0r5pLrS4YSY/AtK7QeGFyp14Rh3e7mtCutos4paQVCS4wys8ZXwPkd6W
 Q9OgP4YyqsPi+LeE30QvkJGMiHa9EBvr3RLx2cFBZGASokI3/nusGdx7mAZxpL9O0Ues
 VEEbEXYpNXalecnRQBX5Hl2GBibkbdfzffx0N8X1kUt4S+9oG1eSqGpghKoSdaM//+/4
 /inFB+LNUvrwrPCNEr1CxR8jK5mOoxQeyELhOvPvSWcv9j5uC4RIAGcSsPGX9h9Sz47a
 5ikdff1qCIoDMzLrQjT27qFnNlDd5NEAsxJH9OcJPGhDIaXHKE6ipEsTWINZypZQQiAW kQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rjajdejrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:22 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365DN1LJ010157;
	Wed, 5 Jul 2023 14:20:21 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak5nmph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:20:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOVR2kE0xR4/TJTPw0bGwcpJaFK3bBipi5Ai9DItoL7iXwRQDIAG8RuAK2fLpotZJXvEBbm32as+pL5PAysL/V8dMkA6stiSBvLOFxwa1b7zv31UKhkQn6jQigXwVodIzV3NjVq77C8E8V3T0ILpBTFfEYdzhwbzKueC5yPp+W0erVPxgiuUsPDVxVDn6iLH7TPFU5xnnS1vAyhqxj5ajfm7wBX4I5+Z6vl8dbtUyVkkDtBZJj5w+M8iDuUVEpD/LoOZkEAGc3qAtJCR5pkB1A2TZVnbcc1nbzO6z5cTfL6pK7Km10dDFz3Tebz56q5l4RaxubsEssAhiCq1b+SXfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzE3f0KuR6wmgF4l+h9oSB5M6uWEOIqXY4TMFU9+WaM=;
 b=Tilz3YsBHKFl+e5uLyVZ7A5S3x5QEg4jcThh71t6FN0YKqRjYtKzeUbK0xMGXCynp7y7janiu3QmM18R0/eMaAMYL8Pploc+EX1Kj4SnMFMjfSwb8jss0LrZM/jl4/dPtqPi2jzBcPMfHSwYHyBS6vG7iXhf8uTP7uFIRjoETV9F2EWjgy6dmqKGa+ut8CSKEaEiP0E0C83Ag7344CC/7PCPxSepGT4dPuzn7UH3Eu+FejAZWt5vofd9ZlrWM1av1ZFqGA6CWChFSxmAmnM0E8vengj2k89sMEVASzAnrq6fcB0tKwMmWkqCYAGuacmzLxUEn5iTAkhJGuM0uXfaCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzE3f0KuR6wmgF4l+h9oSB5M6uWEOIqXY4TMFU9+WaM=;
 b=wuKGkao/O8HUwXEZYOB8Gel1Sha9dsBwmg5QfjsoYEvcHMajzB7CnShKnjlhmfFf4PGH2XY3Q7rWOgtb6IA6p8pVSS4azBfWNPXmCQUeIt7AvWUHb+fgd5GZr5uHvBSVbJobFLCeRacaRFmZpZAMM0URPWZ3e8X0W3wvERdaWWY=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA2PR10MB4732.namprd10.prod.outlook.com (2603:10b6:806:fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:20:16 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 14:20:16 +0000
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
Subject: [PATCH v4 00/13] refactor Kconfig to consolidate KEXEC and CRASH options
Date: Wed,  5 Jul 2023 10:19:51 -0400
Message-Id: <20230705142004.3605799-1-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0036.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::49) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA2PR10MB4732:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2deeaf-2b3e-4b0c-f52b-08db7d62f40d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7Bv6o1RxktwaJfv8CN7n2LHcnx6m7wPABlKW4MjOpc3bnTgaDqcvBXegC3T41oPz6Mno5YkEYPJ2Pavd4WxWSySDP108Q53nRMl9MPMdb3FYjn82MwuTFK9Wmf6pj4S2i1Gh8L5pYn6J4Zy4WzaX74dadKb+YuNuINkxS0SxYcwZZiJgoi/O/p26WJhT4myvjbdv++ytYlwIIx9ubQGEk3n003JfIe1DVNY6/a2QVPfLNmEDgldHwGUek6c9/48neWthgz/KIk4tIOaI0AEjDm5dIpui2TfamHZVyed8Lq3hoAqj4d/0jfFPiczL4o9BYkQOzTLv+Runk5vfd+E6HzMaHHHBxP6Rz+l/fJRqRde3f0fBl+3HeHJOu0g9g61Yr91OjuCAL/mWImqEli7IMu92LmojmD3te2/uOq9wuu9hzAcSqeafG4xB2WpV7mWCY3g2huWrhfXlVpnYSOS1meKYuZORuqQKys2RJHTGZ1tkSCfJApUgOXS0b8V62Ss2rD+rUTsqISZIMLLB9OxnHrVAZAGr/Q0fNUKIWdfJGLsbHnqH9QZSR0f4zdCzWfSNGgJisk2ysw0cRIpDLD0+6Xu5ccEGdmG2uZSzEbAZP0npMYZa5tBpawlCgJ9hl70I
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199021)(8936002)(8676002)(2906002)(2616005)(5660300002)(6506007)(7416002)(7406005)(26005)(1076003)(7366002)(186003)(66946007)(30864003)(41300700001)(107886003)(921005)(6666004)(6486002)(4326008)(66556008)(66476007)(36756003)(316002)(83380400001)(478600001)(6512007)(966005)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ZBUWl42wxNdfJxTGBLVa6kxKxDCBqXsYxjA18NaV9WWglZS6VQOT6DR6NvqI?=
 =?us-ascii?Q?vHiOwA2//Hbaum2j6ix6WmIWr8fDo3F2LJvIkCBo2gZfbWtUHc7Ignu1o0wt?=
 =?us-ascii?Q?ZlFnR9meNzqU/C9PjPMgK4KwzJuxwSLzVfXGSBgm3vLAqK1b2jxpwtAIp5l+?=
 =?us-ascii?Q?bMxwIYaq9NC6sbfdH2mQyHB6Q8OY7zTs5JNVtIkZEhQCHq1P+JfD9Kg0heoy?=
 =?us-ascii?Q?98KtzxBb6P8UJ9qSZS7nkLZanwFtQ05kWtyD+avmEadFB105fKOJ5Jlgif+m?=
 =?us-ascii?Q?EuOuyi3MwoNYjdIZaGbpf54AlsGaSniqT0QHeGY8QQhsWLy8DDrB5yVFynkQ?=
 =?us-ascii?Q?hCuC6TcFN8t845DE4b1BqBdW8tGQJzoZ0+G3+/d+TrxGY0crOHidiuIDJMER?=
 =?us-ascii?Q?LMJP1BU7KJDN8KXMeK9eHw3yafWDFWEqA8DRlmmDURpb4Lydwmbu+hrEJcvg?=
 =?us-ascii?Q?Pu5vsaBrtJOhLMKbve2mCWxMAIFC3ZozKHCpZrbMut4y/iHt7/bDju7Cpsjh?=
 =?us-ascii?Q?jAI/sZjsH+HUazE4q5RCT7MWe12AaORBWTueyDhOE2/tMBj4SEaGCKWIY9RD?=
 =?us-ascii?Q?178Y3bP+RGy/ric9xeCHNyXFieU1sLMWJpKNVQVs/mnbIQ4/ryDhfLwE6RpZ?=
 =?us-ascii?Q?cQmoenoOmSfuckWJrWdEsOgDyj9mn5R0imb4trET7rCQEWBAMDh1jv3LY1AK?=
 =?us-ascii?Q?m3gFxHHtdtS/lbgc7UIeRu+qQBt0SRXk0cdnt/8On3UUXu8em0PgKTEESndZ?=
 =?us-ascii?Q?2/h1CyoXAMMXMpNReffUOG+JG4sAgv353oyrYp71OKO20h9+2ocTGqaH4b3p?=
 =?us-ascii?Q?ZH8Crs4sRmO09xusrFE5DARvns0Qu0gk7vUtYepVW759OjJPJc5B6S6oTxXq?=
 =?us-ascii?Q?m9wz2HGYnCvKfPKDCkJAWJlppn3o7EiUfGFqeeY/UGkDiQEkKaPmSF99bs4T?=
 =?us-ascii?Q?5iGkvG55K724bCUxy4HatnKrguzn1Rnm+2mPPjfb+BkWubypzDrm/NH82nGr?=
 =?us-ascii?Q?gsBWle9rCwZTS/W01voR0x24Ogl36IMo2AUGi4Zc4mPL+R+u+jEP+40te1rO?=
 =?us-ascii?Q?fjzguuSxfZ6WLnOl7OcHJRD5v6n6xNPP6NkQvoKEFsUq+zvU1mtcIvhIutkm?=
 =?us-ascii?Q?qj0cuUdQmRcicrqcGaWjy0h2vd5LCgKeMUCRkRHbTDkj5Bbiuu6mLbRZzM6w?=
 =?us-ascii?Q?Pjmg89ZPMqnRvzAo61BH1SDXANW1jXC3t9IQsp4PX452igpQcxsaW7Oph7EV?=
 =?us-ascii?Q?ayCfX39iucCMRpB20bh6HnRYy+5kFHFJHcAGjsvYzSTRjHxNvVLaFUwdfSR9?=
 =?us-ascii?Q?iSGq85oQI4SMF3hgAmuAcJn/cw+3iTi2IlFDgx9VDcWOrmcUjUbE/8dEZZc5?=
 =?us-ascii?Q?m3QeyKsODKc1JRMTMnTt4uKc2jk59S9kROTbb/JwGi/ErujtFjy5R+3j+MB/?=
 =?us-ascii?Q?IgkkXt91ONe3REWE19ljDjCix4RP6VS1ZFTU4TNyKErdB7IVkQn6H7WfWJyo?=
 =?us-ascii?Q?o/k61H/jSyrgigyA3i4suwlqq4MXwwn+Z+6wI4jaZPanPxspSz2C/16xo1q5?=
 =?us-ascii?Q?T/c4T9rCBL1hy0KQn9YkLxdHlFUQ+CvdLSszWJn+BIUhWsl0BZu89El02jqq?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?upjTgeWq0E8HIEhXf0q2oTyFU8ThA/4cpFhNawmbvzbb/dzuNWIeg+sf2Pfr?=
 =?us-ascii?Q?O7KzLKSPzFMlBBCX2iWKTMlLdAKhzT/f0cXskUuYhqW1dA164NWmm+XlM9j2?=
 =?us-ascii?Q?NTyjo4rpsWlb23KZB2bYFWOo637ljwYfLREFp2fOBKEGS72etTQ359cshknL?=
 =?us-ascii?Q?8leVC3Fsv8EV8VpQ1kFA+3aSpnUv3rzBlXh84dz5yoFeHhnrzvqX2FexM3dg?=
 =?us-ascii?Q?sR3I14G4v4V1ws0NUpbg45i8y52n6PSMY+Lh+P0W1dD4zJfV+fhBZ2u+1HWW?=
 =?us-ascii?Q?u5dJDaY6bNoeKOycKzxHc3x6W5j/DLrTIi2TTvsvvxUMtrfEjKlXVwEZ8KXy?=
 =?us-ascii?Q?p3i4QtY+l1ptvgZMDJbSCCDJKY5XzR3V2T/XeFJYEdzRyv4p0Wzle9kxZX4b?=
 =?us-ascii?Q?/DIGyeOdR2zHx7VZ0G3SRigbBHgXUe/+eMVJJN6IL6SphlXtqaSAkIk1QOlN?=
 =?us-ascii?Q?W7p1+kz0lEIC8LtVTEpe9tdV+PAehOAI6OtIhKcuEojfvZAfsArgU/ClBgAE?=
 =?us-ascii?Q?tRdANP61Pu62BK0vqVHTaAj6XwvL1LI7KxT5M6ahA4XkR9gp+m7Hd5lL86In?=
 =?us-ascii?Q?6ijCNXo4wtT5Ftcr+eFuccYjiw8dYs/PpH/KV4dT0gWjMwe3Umg1ryMRCpir?=
 =?us-ascii?Q?UXuC+QuhBg7Oundcf+ZqaVKyxkf3lEcacCXWO3WV+1UUUh0AD3oC0BvIhT/e?=
 =?us-ascii?Q?/kl7MLTY5jp47YtvbKV1LMduZt8UAMHxet3aUkaO9ZeZMEhe92zgmiV22yBJ?=
 =?us-ascii?Q?MKJmm3Ignq3hNE/alZ3Bh2KTL8S/i8gw+6CBBKt2xPp8f9JEqQZS96BqRS22?=
 =?us-ascii?Q?NdblAortyO4An5Z2FStuXxyQliN/HkSNMcGJpS9nOUtN/7RwsrscvQPyQ6zG?=
 =?us-ascii?Q?hvBnPOzFOVHydKoPdro2rOuMjkBgJHwadfQHyT4F+WqCxdk7qo0iuLvVeEPY?=
 =?us-ascii?Q?YDRfebqfwuY8IfkD0Uz6bnrn/SSUwySKPArKiCN1GtOJ1gzuzfNFYL5FtSfS?=
 =?us-ascii?Q?Rum6gzDVHnDZ6J33qActvKuTGN+tVOckqBMkuSGBwO1ZgtmsK6FU0dz82tUv?=
 =?us-ascii?Q?5WOXmKEv6OVc4IsPUJfIO3xaZWA8hKmNs/jNoLxGa540ocxBlYREVqzjtNZR?=
 =?us-ascii?Q?VK/333wTK3DXcE8WdMMMyizwsex8cd7j0q2MGpD0nNVe7/GEKf5mbyWBPQb0?=
 =?us-ascii?Q?mSIxFPhtOdcCt3ebo3X4yV7mvtYA9PSnDAdwoMLMBlClmB0yjuD3l99AwBpe?=
 =?us-ascii?Q?oRQTRkPfUfDxOUbY6NQJ2CQP6xcIEaJrErfizsO1ZneTUywXTt/G2NKWr1xM?=
 =?us-ascii?Q?/pihDTGCf4MTrPm2e0wxAGIrXum2LowbkHWzo1X0/FHhmYAhPOniAfmasgLg?=
 =?us-ascii?Q?eH4TTdDeUjpBRdZq0p0gRuMxEKxmpWqcQ0mJKdpwzaUqqJ+5WWfx5a66PxIC?=
 =?us-ascii?Q?atm0IkO488XPXuJ0eZxQDdoU83y4aIMtAienrqpET/u/YPPKw4PtmRbDt3vH?=
 =?us-ascii?Q?YZQp4yX4XZLUUEliwRrWaQm9K9WaaC4iuiLJhcL1nZIEehLb096gsjxVpGBh?=
 =?us-ascii?Q?++bm5KH1K7OQ6UzD4nPaj93HeBOPQRt98BuKJ+EDsnTzKiO0ww3n0y4Xrw04?=
 =?us-ascii?Q?MChJJAyntwvxyYyIYx6qgg2csJqCOtMd4G0M4kepwgVJ14SUKdeufekOMmus?=
 =?us-ascii?Q?LE5JG+5griFnfrDpXNDOQUdSWpatfnBLFgOEOmZArm+UYZlV6rWA1b3GXxzJ?=
 =?us-ascii?Q?ADHzkVU4p19tLB0wE/+TK12gFC6e0DoIRikEVL8O7im89ksrtQwcvvvjKRQ6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	E0iM3m5C0QPUHLkippLRmmi+UKKAqM+DppTCzQggzXIrbIBz7QYgI1Evf0+dGTrwz6culTnncNKvC1wtMs8Hdz0REGpuhmUHZ/WqaHKTMx8BP52CzJ4Nv3My1WTYsGx9673y8JISp+rcK0Sptw4qRseYXRdlGKCprAWv7QiE3IbCaw87xkfVlqtmRTnTAnAgYxizGf52M3UyEeil9B+97ZzGOYPPzmtNBalWmJWWNzKgSiGFvMyB/ZklZdheSDeirLHkz8dtDm6HSvp49/aBTW2E+EQLKYTT0bj1Ln3djC8t1l4uRhlZeDsuzUjxUs4Fg3TnRBLCLAx71cUQGiB5M/X/OuegIemLVm4JBRY5JDZ57VvkLv7HBHReARh66zVEVFVWm9c2J6jbMRxqMNd0jfS68O2xXCUwDckEmoj2SRhSh+/swrhwQ9lJ73ksvhm45UHEdKezR0r7GQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2deeaf-2b3e-4b0c-f52b-08db7d62f40d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:20:15.9424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlINe3oNNd1a+NxozMMYC9mC4CR4UGLEeQ9gGOKZmsHtLnjwMamXJzsAC7YRyqZrdAt/CdX2gSvKP2AGq9TY5lyXX9Uj3foyXjUGgfb7uT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4732
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_06,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 spamscore=0 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307050129
X-Proofpoint-ORIG-GUID: EZwkfzlK4kTp9RkzSaHJtkt-dVGN_Lb-
X-Proofpoint-GUID: EZwkfzlK4kTp9RkzSaHJtkt-dVGN_Lb-
X-Mailman-Approved-At: Thu, 06 Jul 2023 08:04:02 +1000
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
  - The crash hotplug series appends CRASH_HOTPLUG to Kconfig.kexec
- The Kconfig.kexec is now a submenu titled "Kexec and crash features"
  and is now listed in "General Setup" submenu from init/Kconfig.
- To control the main common options, new options ARCH_SUPPORTS_KEXEC,
  ARCH_SUPPORTS_KEXEC_FILE and ARCH_SUPPORTS_CRASH_DUMP are introduced.
  NOTE: The existing ARCH_HAS_KEXEC_PURGATORY remains unchanged.
- To account for the slight differences, new options ARCH_SELECTS_KEXEC,
  ARCH_SELECTS_KEXEC_FILE and ARCH_SELECTS_CRASH_DUMP are used to
  elicit the same side effects as the original arch/<arch>/Kconfig
  files for KEXEC and CRASH options.

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

The three main options are KEXEC, KEXEC_FILE and CRASH_DUMP. In the
process of consolidating these options, I encountered slight differences
in the coding of these options in several of the architectures. As a
result, I settled on the following solution:

- Each of three main options has a 'depends on ARCH_SUPPORTS_<option>'
  statement: ARCH_SUPPORTS_KEXEC, ARCH_SUPPORTS_KEXEC_FILE,
  ARCH_SUPPORTS_CRASH_DUMP.

  For example, the KEXEC_FILE option has a 'depends on
  ARCH_SUPPORTS_KEXEC_FILE' statement.

- The boolean ARCH_SUPPORTS_<option> in effect allows the arch to
  determine when the feature is allowed.  Archs which don't have the
  feature simply do not provide the corresponding ARCH_SUPPORTS_<option>.
  For each arch, where there previously were KEXEC and/or CRASH
  options, these have been replaced with the corresponding boolean
  ARCH_SUPPORTS_<option>, and an appropriate def_bool statement.

  For example, if the arch supports KEXEC_FILE, then the
  ARCH_SUPPORTS_KEXEC_FILE simply has a 'def_bool y'. This permits the
  KEXEC_FILE option to be available.

  If the arch has a 'depends on' statement in its original coding
  of the option, then that expression becomes part of the def_bool
  expression. For example, arm64 had:

  config KEXEC
    depends on PM_SLEEP_SMP

  and in this solution, this converts to:

  config ARCH_SUPPORTS_KEXEC
    def_bool PM_SLEEP_SMP


- In order to account for the differences in the config coding for
  the three common options, the ARCH_SELECTS_<option> is used.
  This options has a 'depends on <option>' statement to couple it
  to the main option, and from there can insert the differences
  from the common option and the arch original coding of that option.

  For example, a few archs enable CRYPTO and CRYTPO_SHA256 for
  KEXEC_FILE. These require a ARCH_SELECTS_KEXEC_FILE and
  'select CRYPTO' and 'select CRYPTO_SHA256' statements.

Illustrating the option relationships:

For KEXEC:
 ARCH_SUPPORTS_KEXEC <- KEXEC <- ARCH_SELECTS_KEXEC

 KEXEC                      # in Kconfig.kexec
 ARCH_SUPPORTS_KEXEC        # in arch/<arch>/Kconfig, as needed
 ARCH_SELECTS_KEXEC         # in arch/<arch>/Kconfig, as needed


For KEXEC_FILE:
 ARCH_SUPPORTS_KEXEC_FILE <- KEXEC_FILE <- ARCH_SELECTS_KEXEC_FILE

 KEXEC_FILE                 # in Kconfig.kexec
 ARCH_SUPPORTS_KEXEC_FILE   # in arch/<arch>/Kconfig, as needed
 ARCH_SELECTS_KEXEC_FILE    # in arch/<arch>/Kconfig, as needed


For CRASH:
 ARCH_SUPPORTS_CRASH_DUMP <- CRASH_DUMP <- ARCH_SELECTS_CRASH_DUMP

 CRASH_DUMP                 # in Kconfig.kexec
 ARCH_SUPPORTS_CRASH_DUMP   # in arch/<arch>/Kconfig, as needed
 ARCH_SELECTS_CRASH_DUMP    # in arch/<arch>/Kconfig, as needed

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
presented in this series passes all configs as checked by the script.

Regards,
eric

---
v4: 5jul2023
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
 arch/arm64/Kconfig     |  62 +++++------------------
 arch/ia64/Kconfig      |  28 ++---------
 arch/loongarch/Kconfig |  26 +++-------
 arch/m68k/Kconfig      |  19 +------
 arch/mips/Kconfig      |  32 ++----------
 arch/parisc/Kconfig    |  34 +++++--------
 arch/powerpc/Kconfig   |  55 +++++++--------------
 arch/riscv/Kconfig     |  44 +++++------------
 arch/s390/Kconfig      |  65 +++++++-----------------
 arch/sh/Kconfig        |  46 +++--------------
 arch/x86/Kconfig       |  89 +++++----------------------------
 init/Kconfig           |   2 +
 kernel/Kconfig.kexec   | 110 +++++++++++++++++++++++++++++++++++++++++
 15 files changed, 228 insertions(+), 426 deletions(-)
 create mode 100644 kernel/Kconfig.kexec

-- 
2.31.1

