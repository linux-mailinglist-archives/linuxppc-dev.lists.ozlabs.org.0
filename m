Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 485A07513A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 00:38:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=SYfCBkjH;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=FIHvwVBI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1XhG1Fm1z3cjr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 08:38:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=SYfCBkjH;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=FIHvwVBI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1ND95jp8z3c05
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 02:16:57 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEiBrF020334;
	Wed, 12 Jul 2023 16:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=0Rza4AfADdwLznF7d542A66FZWUW0qr1V+uEkT8Vgzk=;
 b=SYfCBkjHBgz2pi28X3LD2t2TNwjiHpBdJkByEI0buPCMSJqMldAcKMNkhBQkjDPbyJk7
 hRZMslfbB8snwvAQJnNgdQm+xPs4zpby27zeN7VNAB5U2BqmZQ3dvWIGwGSQv8O0Uxrt
 hm4oaPhI27JmmYfwxL2P/Bh0DHFNyiH5nwMYhCqpg8u0BushPKv8ByYvZ9fGiwVuyPJJ
 71PmLoZjXnaLWrUqK8RPh6PlNirzB7GGKYhJxOMi1hBe8b+HUNoo2u9YDsXMBUObwULX
 gZ20fc9868Ccm/BdqeLY0wR/OGugX1o3+iz24VcHAd7ISDJE14gKlQbRV+/zRWEav2XL rA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rrea2wn68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:36 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36CGDrno033393;
	Wed, 12 Jul 2023 16:16:35 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rpx87b36j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqmCu0+5quzrOkrbCyrWMIP+9l9Ws68rnqn4k4ttbhZ1OZinK146F+aUK3cpSIisHET/FMbMNRoLL/xhyw+K86FtWtph5+NgtHW1lVPcbjBFy9/xPM0DaFS9DvYH8sFVDfHVZnj+RdyLnUU5PokqcmhZ7N1Eaq7lkHT82LRUEUezXNOgTxYuSqgKtyRueiavZwrBY22CHJe2c0dEqJXAukYvmCqULYGsh/jpjPz8sxZBxannMzH69vagvT+xkBplRctUg5JqB30sDnYp+JhwBJ3vh79mCjYunQVOEHkiITL+lhCWBNFeG31HZxWw0yUaFjhBali0qelSnDU+2GG9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Rza4AfADdwLznF7d542A66FZWUW0qr1V+uEkT8Vgzk=;
 b=l/9N8MhXz+65A2n0fi4bcu+tP5lKUU9wswJKfapgektMvVDs4LkAvW0jGQ6wbCO4OM4xIljM4RNnC8lQu7beutllsyBFEuWTmFIfoRVhIQexykUM4Rg5lt/VuZwOILpe+LSMyvea1RaihmOlRTtgaRvwPggFUg/gIP9N0ipvJ6p/e3v+H+5guAEMebOpaoicBAHS7G67MfFzIk35uMKikrpnDuXnboyGE1j2MF9gmB7mLZtXfeZ/icol0jm60rorhBq7n/9EeBDE18EHkBF4ihpsn30uNXoI0uf7iePob/Y65FuZDI6BnHSl/fp8K8ndBTF8/cqF/2Pp4QYTtoEcvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Rza4AfADdwLznF7d542A66FZWUW0qr1V+uEkT8Vgzk=;
 b=FIHvwVBIIiajwShArX8kdmITjbkYGYUD3ChsJlAB/qJi/1pvgcEii+4w+x/naLym3ErLiUe0EL/3VzOnkMcLSpp+ksf4/Sm1E3D/HFxB0OiuQBkyvGO8i02Cu0f2R16lxEEqZ7AXW8JBzjKH/xXspJVCcLl7/AvpRj9Qots+NDk=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM6PR10MB4219.namprd10.prod.outlook.com (2603:10b6:5:216::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 16:16:32 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 16:16:30 +0000
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
Subject: [PATCH v6 13/14] sh/kexec: refactor for kernel/Kconfig.kexec
Date: Wed, 12 Jul 2023 12:15:44 -0400
Message-Id: <20230712161545.87870-14-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230712161545.87870-1-eric.devolder@oracle.com>
References: <20230712161545.87870-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN1PR12CA0048.namprd12.prod.outlook.com
 (2603:10b6:802:20::19) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DM6PR10MB4219:EE_
X-MS-Office365-Filtering-Correlation-Id: 416aa41c-6df3-4c48-660d-08db82f35a03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+5KWnDog47cCcVDMRAzZfEoNJeKJOTLoyUuGsZbRear8YIoOovMd47nQ7/505fA0DcLjQAUGZufMytynhQ/g2EjERz+7qo2cUFKryNS0AWtrVlcSUJYul/TNWFg/x8F1SysaLAIvf9LexzQ9ExMTZqbthn2MgNZMW1jgppeP9iSvcMe7bcbyxGc5Y1cTb3GBkKp/HWb8C+UL7x0jh8+W2sZcC8o9bgks5utQPXqs9tktSqgN7TYu2eROdfJqgqJ3XRn7f+B9THzk6ljsbog8XZfYLbNizCk0cheE1MPEObUlkOuIgGkFxfqgO2mReLVRWIMBYS389SBTTG68Vg43bSMSXhh6w8xzgcA0jtgxKtCsp7Wq4zzW9lC70GfnB/+8+hv7y7n3DVRKRuSc/XueE+VdUMK2a/gyYDvkqaCMqxFzL32xQ/F2D52c2TMpnJE61bK4YIMxYtHAalcvD8NMjn+sw8XRCn9YEobtCr2707xqd00Oqwiwz1JwbXdqcn/Cmt0RxeRVXNhT7VmcqjnbDnen8mbqbZC82UOHW3DV6wJ1YT5ICh2kRvh427+FQQzRnPahg194iHUqlHxMVsYGmXLbnHxNDqr+/J+AYs0An7c=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199021)(478600001)(6666004)(4326008)(6486002)(66946007)(66556008)(66476007)(316002)(41300700001)(921005)(186003)(2616005)(2906002)(7416002)(7406005)(7366002)(8676002)(38100700002)(8936002)(1076003)(26005)(36756003)(6512007)(5660300002)(6506007)(107886003)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?yhXiwO+DVaMsPAxeTgQ76pnXhWffJ7ZXxUiieBpqXW7BUdVxxs4nUPbmYiv6?=
 =?us-ascii?Q?m6jZsBScA8vng63dWuffUIb6RfbGllsy5mbjGOgDgzN+Fs/dJyYp7TR0JrjJ?=
 =?us-ascii?Q?0pM9NRKVEDVzuLuypzTVcFuCg/u0G+VVGsGmsiSoL45VQMIt6knsaNNvDJe7?=
 =?us-ascii?Q?KUEa5BvbdTcp0r4h/qpqrJ+jSkjwLWvAFNEts8lBiriiYgb8kp9g7dEpHbdp?=
 =?us-ascii?Q?j0S1kcbTT0GPap0NuuVJtFYwBnXKKEYX/LJfpVnswcUVc2OEn92WF9aS7R2d?=
 =?us-ascii?Q?3aW0qKY9czOup8dVTZxiY8LI0Qhl+lDm03W2ukb9thWMqE4rKJoEfLtknY4S?=
 =?us-ascii?Q?2C3eXxQua1AW1ra0yNGDQvsK5fgilP/Qt7x0PT8jxSyB3aBC29liy7TW6ppT?=
 =?us-ascii?Q?4pY5UqbIa4fBRuzsc78RwtddGQFDgY5CzCb8ixaCcj0dDYYo9jxrpn2NWN4y?=
 =?us-ascii?Q?QA6rnjns1RGt9o0B4pMnG1BLLP3D+S7q1LGC/SvZ+bWMX0j7EGCg2hdozMZ/?=
 =?us-ascii?Q?Hhu2z/w1SZ9fxmojFWO853Hi6nYAsNSgiNHWZdtW5Bk9d5CdIe8EBTydOI1K?=
 =?us-ascii?Q?VSw6gW3Cu7wYQAGfGvGyLS21ZkDKLCBhsN2QMH1oe+qi88k9HId3dP1RMYO/?=
 =?us-ascii?Q?c3CAAksQj+5CkWhW8+qjIZ2RE/CS/Bit20Tetnq10ZFTu7wiySAxRZ1XRuO/?=
 =?us-ascii?Q?pycbb/Wv3IQeVMjtXbxqLGLqhI3wz49sT955y1f3lA+f0rSKPhzNvDnnojal?=
 =?us-ascii?Q?k5884aMcfgrA8UihkC/fo8tR8KoJxWqcJIhktCCURKl3ZbgUnOmkdrdeJ3+i?=
 =?us-ascii?Q?aeQwDOhTQURo/KnWr/HX+2Mf3Z+SRpPVgY8GlLb212lfa1muGURT9D/WOq1/?=
 =?us-ascii?Q?x+DSDb0BFMjOvmk37bLUBFkRjxJ/XdunCmMf7wOUrddqMf5f0YYxcEM/Hct6?=
 =?us-ascii?Q?ynS9GcRirBhqjt97FPmoLK4NSHn7MxPk6gGKkHFJM+HfNvTri277OC/yv7HH?=
 =?us-ascii?Q?DzgNKHspeFIs6DkMJCK9vW60v5DCjPDYJuKfA2tHXMP7lqXZN1daJt7IRZSX?=
 =?us-ascii?Q?IHSJF35Dk5S3s8xRu6s5LjYrfw/TSNQDUd4iK3KTbRfy+cqzbf2N7HfQUqEb?=
 =?us-ascii?Q?aqR5JCYyTGX/3SsTGpCgdYljy6nFpWjmVsOjDKaiAz9hwF5WHtMVpDZjQbER?=
 =?us-ascii?Q?tgRQDrOc3bVI5T4o2GIofkCTzVwAqJx3I0+dCp2M40rytroJ8ErDt9BJU1vw?=
 =?us-ascii?Q?kk2BqrjlLd1EV5OvJlJql45zftUPFVtCdp9vt2V03Aow/e1HP44xDWrP69Nl?=
 =?us-ascii?Q?3zoaMuwFXJ1koJrleoFA9TLZHPfZs+hO/PJFKW0mtFw1aq3FB+sQ1VbqL1rl?=
 =?us-ascii?Q?i6ijDj2QRRm0ArYwzNWjy9s14wxPqlWB42V5px4btV8d3y0Ibqp6N7C3Byxq?=
 =?us-ascii?Q?6e7zAsgfX6OkQIcVlk1x2EyZ2iU+h+bO6wxm/iQUBFNP1QZZ1TpHb1e19xMd?=
 =?us-ascii?Q?YqDvNEsE+REZHpVanvqlr5bL2AxbBY7FG8hzAnJffHkST4IJwxVme3HxtLWj?=
 =?us-ascii?Q?XhePtmSbHpFlJJoRdN8DGLsLrsz223PK+5qDv/6KrONSRJUt3q4n2NL10ZsF?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?rxzo4B6QFoe6kEQmVJ45yK2Sh2QM/+BU3DYZ21sJVslAMfzUoQ3Rk5C3+Wtu?=
 =?us-ascii?Q?LtBYW9w4Y+YdBir9K2dEVFZ3nma8iDSFNy+sx1kikUNH+XdspG0A39pFjtCI?=
 =?us-ascii?Q?Mp4HeQry3LR36E0lfWDFAhbSpwtIkE6r3WV18K14LeHJC0tLE0WmImorU26l?=
 =?us-ascii?Q?U0Pb0+3WrdCC086B5JsNX/yIqzwv8chOT1sElptNQroD0ambOBb7gWb18ou+?=
 =?us-ascii?Q?zLcME3FzeBiAkNzabQ5vk6PtGMoDz34LW2xCECx5t+S3BnLYzUKzPeBDUZ/o?=
 =?us-ascii?Q?y/0EEXlH60AzNFvfMMfvdn3UoCAkWHGi8NB6SiPhs8KyiZngWGMTCrVLmyaK?=
 =?us-ascii?Q?hm/40VXIosmCVxm3L09PH+1TW3a7Q0FbPkYVl1WXqpxp7KRIvj7XF+llZO6E?=
 =?us-ascii?Q?F8YPY4+DdTqpNeStJPLHmPhEFGpXqEXP5Mcv2QXAOmNqo8H2P6IvP4xRN2GJ?=
 =?us-ascii?Q?Ci3lMQOpyDzcFvChE93znLj+JeFvhXQVuT6GzcivfuZJrqFZ7hEga8umUlOt?=
 =?us-ascii?Q?3TsijNAp9PKR5HuGdWp6MbpB/LiMGGS2PoP8oFahLbzslYWQKDGVg8t+WchA?=
 =?us-ascii?Q?AtBIFC50GCwSwtrwV7NwRCbgbDs9hVabkmxNkWa65Xd5UXZqJw/czeSOEunh?=
 =?us-ascii?Q?BWX/147hb6r6722LbCMBE+9xlGUkhjwE/gdteEDeB3fhsxx9VnfVi50/yj3R?=
 =?us-ascii?Q?ip8yCGjdS3Mc0ZECCv4hJ+w9CIe/sGdOWZzBEjmyIFQ0CUg9mywfEeIRh4UT?=
 =?us-ascii?Q?ykkZrK4pn5Rjp+HKlCImQt2c58NhQ91c9xNl8MFgIuV/kznnNSQA+8WZ6SZC?=
 =?us-ascii?Q?FuOilGiUMm1xTw83U9vAKeZnqIGkZtFrBDiwLKz8gs8xV0D1CHEgnH9r0jxN?=
 =?us-ascii?Q?EiQrf5ZmknXp8SEuRUZpUu6FXj8ZeCA8O9vLpetYtj26yMECYx12E+RbTLsa?=
 =?us-ascii?Q?4X0SYfOVZ+LdniXYC5ZIkeNte5YQ1dcMSYgsw0P0MnJBTP9Dpu/mPwNObWDO?=
 =?us-ascii?Q?sNspEY8GUFt06GvJbxRxJ3BkLSSZxlUEOUFm0QqYHYkVQhcqWmyT/JucsfNK?=
 =?us-ascii?Q?ixZqENjFmVZxtsRqTmD46fgUcrMmu6TLzdrPYyXOHn5B53hOlUggw/zmcO1U?=
 =?us-ascii?Q?qVTRws3Sxs3Kf/YHoVfn03mwPz5cV6fGfcK1aA+6dKUyPZwyLPgoCaa70G6V?=
 =?us-ascii?Q?mucqQstu6bvFjfqA5JGIOIRyhQKVdU+H4REEZDCDCtRJ6+LK0szHsoRsLB5x?=
 =?us-ascii?Q?3vS7FtflxYwD57wkG+2GOBAzGDkPTChnxa4wrxE0ga1NHRwB5VN5Ewpf6c29?=
 =?us-ascii?Q?+JBg0ZL8d3g7uGNoDBLP5kKwvS8EvYKb/6HG1LvwIASNWVhS+4AuGeurgNfJ?=
 =?us-ascii?Q?NTO/dEthbMnCf6YfzUjInPnU9EFutmnYkRL38MSrqyvRybDLm+WP1icie7S2?=
 =?us-ascii?Q?TVYIy68DJ8WbbNqCMZ8PpsNJeH8lU4pGLRwe1X15JtF0H0oufz8SB6zz6KuN?=
 =?us-ascii?Q?0T+zWZ7j112OopTr0fJpOQZXYwplJCy673Ad7jAnFC6uICD926tLB0ZQoUCg?=
 =?us-ascii?Q?3irsf84c7XDeUIlvVB+ar55zaMmsw/jxf3mRwd2+xe+bdcGqLqTY4A3Upwya?=
 =?us-ascii?Q?y/Y9ntFU+gqECVfQU6UtRneZ8rmIPHROd5BnDLKsMjDlpkJq/7VTbsl1+wiG?=
 =?us-ascii?Q?8QV/8yOc7RAl3IPy/ozLhJn14z9X9mL4QDZFWR+XY1M0kA8sTfyV/rbo5ulG?=
 =?us-ascii?Q?AuXwrMlSwxe6E6PawPmvdOVvntq3gELD9mUerZ7Lsdci3gAXaaONUCwtIyyL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	DiW3WT1iXbaai5/vv/C80y52/mcPkRHT0cVQwoUr/SRgrqZAntcssc8BAVfBMZppY+3EgnaTxf2sHiKo9Ve9kxn6UWr21bfKifbPC2GJ5d+ZxE3r2ngVlaAn1rpZmL5utqJFhgpDVglbTsbQfEikA8svUl1YLFxMLSSctn0asdR20jjVunWdK758xUSkpJBL1UdVkKCw7L8QOXKT03c9QotXNajPou9vVamxhvN5U41u/eL5EXiXwhSXGK6DkfO/jvf6Xx+RY6rsjll6H5aOq0UQ1Il9JeAxraa3yk/jSVuTrHTH/3jdUtdtVC4QruL0LfenOlQG1xLJTCCD+y2ml3uz9IteAkXxHwboyPH/HzLvCQ4So/T0xQR3QnIJQ59J0EMPh17gMJL/k5RBPhQdU4vwZX/vCXEXQOKNyBh6ipcOPw5QTd4DsgX8ekSggdChAblgKS0jL1GM5g==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 416aa41c-6df3-4c48-660d-08db82f35a03
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:16:30.4797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vPyi0UwdGfXLLXamEwQcbnfSNd7pCqYF9c/ewnxJtahBQOSaVFn+LO2oN7QbShHiNOw3NvFf5rUJAc89Sl8IWyx25Vzcs9QpConIl1HMyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4219
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_11,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307120146
X-Proofpoint-GUID: u_FPDyotI0KwXJuEkxP0xZrNwxszWdCW
X-Proofpoint-ORIG-GUID: u_FPDyotI0KwXJuEkxP0xZrNwxszWdCW
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

