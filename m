Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07177751386
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 00:28:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=NrPUOduF;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=WIbn0RRX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1XSM6hRcz3cG0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 08:28:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=NrPUOduF;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=WIbn0RRX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1NCc5jpFz3brg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 02:16:28 +1000 (AEST)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEjHDv011216;
	Wed, 12 Jul 2023 16:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=qysBbjkRFpiv0g2nt974fH1e1g2Uj3S9X6d8rMzs4p0=;
 b=NrPUOduFrZcSVSODxcKnycP+HTG4hlBFX6CpzFBYJMEhPU9OCFS2V13xQ1UjcpM+sKo3
 rrr7JKrCnkLCy18XXZRd3qhy1jd+JhWvwxni99m0aMFLP54+Wy5BNdUtu1uO/7+1kD3y
 myC35Kx7x8Z1bRCfzZCoc5hSCO809L3Zxdgj2pch26V3kV8cRxPy37bS6fd3mYIuq7ku
 4AXgXUV4NG/1U7UrHrW1Y/f0q6cQ+rjhAA09Y+5Jh7jiTXVRDs2XrxCuRDi+iZ59Ezlu
 q5/ho+uAcrSRKTtTHBlZKsj7+B5HEj4oKY9q6esqIsoNWdUv/4u0fx7XdCn7dgdjONTq cQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rrgn7wfet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:05 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36CFBhYZ033274;
	Wed, 12 Jul 2023 16:16:04 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rpx87b2aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FntzZzw4xWLt6CGclUPSvCCgU8/wbOUSBYSAfNyaPb/um3u1St3JNz5IYuclNZIwKgDxwTisCzqY1Y4lpsbpDBMEFsALriqJajVEl8zF4nCFFmm+DHCNlIGvRUdTrd/jnB87ij1JHyELl3jcU7hJ5R1LRAi7QZbWjfkMaUzYM60Tinf5jxjygYKODECoGyZLOY50tlFZBYBFf5+hAI6hGC7/aLR+y7Pj/Pkb7z+gXYmaLIyq+XoKA+EUm52UYmQjhJ2qoydckjsN6uDuknr67g0HoopKmwQ6GhckqrhByVr9vzx5AH1SX9v/1jhrmk/grPIGm2t6rVUqFujqNuNFyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qysBbjkRFpiv0g2nt974fH1e1g2Uj3S9X6d8rMzs4p0=;
 b=kTFucYsslmien+07nysFCvaKVj41UaSYfP2XcfE4QEotD0YbCRlWA4ZCzop8XnZ6HYnrbXXKKfEJE5Tez12JMInMZBO+0at49ftXPw1XqMZmqanB8zyHQTa2cR0rhEz0VXi89kYxGwGa66HDl92qj1YDVjgG2jk7KwoQUfji1NMCDVaYKrmvapMy89VN9TYTyYX8X92AwUjmudzZZnGIoYQ3GsoFwZi6dVwQaHFsdVOn2nPHZiHchb7rVU+ZWAGAJneFc8SfGSCwrigPD1JOuHQkzLLyMEaV0F8oMoANWweeWOf3ioenHbdoYyI56Z+TjG3AAb+qbXtcJHxRp9Vciw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qysBbjkRFpiv0g2nt974fH1e1g2Uj3S9X6d8rMzs4p0=;
 b=WIbn0RRX9s7FFNanXIfuhpXFSJszQ/tv2NdE2R8eISsmMTLecHW2XYR81hhybnfxSkfKtcZNDH7VZioI/Eb4mjrbGMUEOQT2poPEF7xAk3q+u4NDH4z03iANvCd0kO1RZLD+lokyA/ParsDyIk3vLCxU96+p1Ya3gFv2Y2nRAOA=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH8PR10MB6501.namprd10.prod.outlook.com (2603:10b6:510:22b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 16:16:00 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 16:16:00 +0000
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
Subject: [PATCH v6 02/14] x86/kexec: refactor for kernel/Kconfig.kexec
Date: Wed, 12 Jul 2023 12:15:33 -0400
Message-Id: <20230712161545.87870-3-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230712161545.87870-1-eric.devolder@oracle.com>
References: <20230712161545.87870-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR11CA0028.namprd11.prod.outlook.com
 (2603:10b6:5:190::41) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|PH8PR10MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 136c9e81-09ea-4738-9823-08db82f347d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	E0cJNRoXuEE4PRWvc3q2bdaDNFD4xcKsDNKx7/v6N5MIM2LH1oGz7tAySJXGzAHxeKJ8NhgUMGEz3yNmcs/OYoZKb/IpXTqvwq3QMVfCA5L7H4+hAljsDnEOHWqsY2GRa7vJTLRe4rHv+TcQFmucEEePo+u0xkoTSgEUHTxNBIk1oRn0VVqsfVYdCXcIGxsfHD/diyPiNnQBaBemJeCVhWar30wJDpEnn3qZKjyCn7H1zc05dZ2weROSWlnUvxv4mu7WVDeKqqmwezyBnr2RNy5OAsOS9RxXulnKbNb/bIMBMcAT8teQvoCwUGbJo3rNa6oTHt/azC7SzPdWwSHK97N6JYgO96kZIM+njFnSLZMPQLjUz+rjp7iDKQlKwZTOKcgxtEcTiMrLePlAlddD2t48TcDh15khqwadodnUwKtReb1F3Z6+CONk5OTm+EiaRME0Pd6JqPQunG1VIFeHd34sYzF4+mUNWArtoF9x3ZUu+cNuwdxXeYxjBLNYuYyHsF6vs94ijWPVJCb7tzc845PBbjrKGwvpbPOCzETaun+6HsX8MHkGyUbphyy+5VkIHTlJLTGy5QPTHZnBkG9yqUQYuQBm/U8CsKwdeAtbwH0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(38100700002)(478600001)(921005)(4326008)(86362001)(6666004)(66476007)(66556008)(66946007)(6486002)(6512007)(316002)(41300700001)(186003)(83380400001)(2616005)(2906002)(36756003)(8936002)(107886003)(8676002)(7406005)(7366002)(7416002)(5660300002)(26005)(6506007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?51t0mtEjGWieVNwdepUejKr9SOLbIe/TDjn75/5mTKPjeCkMT3ACmqbabN0X?=
 =?us-ascii?Q?SBCilSfSXkrVuKCWxz96ststw56rDTIAxusG2Y0pd4dm5NtsmxIEFVBAt2Nf?=
 =?us-ascii?Q?2I2ajFKvl1tp8m99nzRWxQdOcp1AC2hvA5QKcr2xJfZZypDknB5KuHQ3Iill?=
 =?us-ascii?Q?7+MJQLotAqLw7gdI50XvxR5AWDagy6LpVxu732cS7TW3NUM3aREG9o3d7VAX?=
 =?us-ascii?Q?TVQqJY/OKpyFAqPks2klsEHciDlP2bUltP9Y4RtGdMkg5ZXGUQSfQ7C/Ap2N?=
 =?us-ascii?Q?E3zdoPOLJbKPIvuJwMZSr3Zz1egvotJP0VVradu/h4yXpGq6urEqc6QQRbvE?=
 =?us-ascii?Q?BNnmOOx2TWY3GT/1jA7UZbMztPh/t7yQjJoq1/q3B3uX4IdDPg929yXXpc/5?=
 =?us-ascii?Q?VJhfpvxEQEdQMgWLkWV+MrsmttoCbtl1GO7BRvugben78YuEel0oZtGaq3uC?=
 =?us-ascii?Q?kFSkGl9d1eAGAUxHUDjWVAf4uNllb93f0qq2TCALTrYMHG47fMu+yicfI5i4?=
 =?us-ascii?Q?Q1Ja1FdAQ0qcjA597VEJOYRcfN6pnY1LYf3XZvRkFilICIcqAdVGYKnjHOOp?=
 =?us-ascii?Q?3q4cYHB0fbyW20JrNNTQOUR2OkP/KU0fzIh4GbvJ4R5doIBOcHV4EH8ox75s?=
 =?us-ascii?Q?nPwqx/nNBeJYqyezIetfeNBci4kx4jaHHKRptqODNQUebPUddeRk0eUQqKhH?=
 =?us-ascii?Q?j+BIgpW4Gx1mP/s495KGW98CCiOfZLogIVIi6wQDw1HhUWVhyF5EQZL6w7Ot?=
 =?us-ascii?Q?NZ1b/bAq+OFuV3kljltUONGDX8ONq7asJ5CcXErcLW0TyPuvWU/pxM/uhcfR?=
 =?us-ascii?Q?SzMYeDRemPrDLZeGBlChjbOlrL6ijxnQXayGyjWoKrNd1eFJYhm53bHzfuMQ?=
 =?us-ascii?Q?IHHo/5As/0Cx+HlMN80jowf9Xywr/9HOXgyD3uNmVrcBBZ4B6wQwvrORZs/N?=
 =?us-ascii?Q?CP7oJggD4K/PRwYMPvVwJk4Y6REfVeLB5GQfeEYue5csRnbYtaZODzhBmx3W?=
 =?us-ascii?Q?dSqp1b7EKD3vhZDE1H4FNHnh2u8a4RhYgw9KT8Zg1+Ljc0TiFSfYJodDW+xo?=
 =?us-ascii?Q?ZTbZ/Ddllm75+D0izFz8l8PPEDihosc/7FlSRtI24Pd7Iirqi0fbm9JZ8teU?=
 =?us-ascii?Q?L391kUxtn5SXz3c5c2hvrM6rNM+VKM7YQcAOcwECKXKONZqCXBqb5nLM69WZ?=
 =?us-ascii?Q?tt3SwWzz70VlHySwu7rZO7BRIAwUB0jEFkpS42qVubdsg4jysEUsFzM8C4ys?=
 =?us-ascii?Q?p9j2F7A/OTiFuQ2IK1GlGC/n5QFaagKzyWbEySCFCj32kOyg+yqxY/uYyOVI?=
 =?us-ascii?Q?5uWzzl5AyD4VZgSnggaXY0i/1yafcYZmddvl6jedOiugBtwRYVtSUES+c039?=
 =?us-ascii?Q?5LEVdGb6u/L9v7XYAL7hPP6JTA+Hz1m19aldC8sK4cccHi5g/dlRhUWqT6RF?=
 =?us-ascii?Q?ipd70uFpZiPB2mJDufdLzw71faiwD/5Au9fdLXehYrVYjCFobzUbJLbiCNNr?=
 =?us-ascii?Q?w0X/6VupBDNzY+b8EtXUrKKkmk6TXwkODJmJKzo/fXzeeX4tYVJhYeFjieBE?=
 =?us-ascii?Q?DbAD0tQJ/1dQ2U2puyQwFpJsDE2OEu8aXfcFS42guOXffxFO/28jk2M/ty9S?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?CicfWHnOzV5deMq19jtBliYhL/W0Qj7IZaUY7tsLAhJ6WScPSYQ5alatshQW?=
 =?us-ascii?Q?FZPPtkXSrdVAZ7rQpZljYDtRGAjC2Z97/owL9jc0tZovXdN6HYg6ti8kbD2z?=
 =?us-ascii?Q?TW62mKK91eUv9500eKkMg/45lfEswrFSGwQ6K/q7olkCRuMxai5CuvuNUbLw?=
 =?us-ascii?Q?gWoiZAFTPNvXkjhpdeLNOHr6qi90H0m8cal4hA5glo1Q8KG1TNY8l4VIXKKq?=
 =?us-ascii?Q?x8XAImfaPmeSkhxLQLHOFkyk/Xo95Z4Bpxdr1Ij0D9a0GA8/Rr+b8h3rOC/e?=
 =?us-ascii?Q?KeOr+1xr3mfzg7db+BY5fJRZnzrqrV/hwCoR44Umh7eORsCOBBnlRLk9ThYQ?=
 =?us-ascii?Q?j+F4HAyiT+0aYEae1JRDc5F3kuew3oU5t5vTcBwMOHMTpJru68NQy/zBJtoz?=
 =?us-ascii?Q?LFbl0ufFrusVycOI3pYoWfFZ/A2MRf/2ded/qbIPPk9f/K3CVUt/72R20Nc2?=
 =?us-ascii?Q?84DjGM1SkEAgofT/ORjSvxm1I5lMCP+stbrF4xGtsUrQ6fwn8VKWUfVFBu49?=
 =?us-ascii?Q?/lf717k9BOCcf1R1sCUvwk9XZdeHK6Uq45ah6317f8uohD873rEQORt9S954?=
 =?us-ascii?Q?RoRjduJUUpwrd0DhPU/uz+3VhqHUdpezFjtWDiGyIW5dP6bjGY1A9TNrL748?=
 =?us-ascii?Q?TaxyZpUd5+XiSsz9pVLtxQfSdrMLYrDXMSWK9ukDBZUq6GEf1tcQemVxejIk?=
 =?us-ascii?Q?mrucVISH/XJkGgqdjXsUhGkHcyKHX/DwhcRZft/NJt5Be9ggVRKuktNBDfDB?=
 =?us-ascii?Q?sRSx07eYFh5kQmc+u9QPImnJEIa7oEPusCyeRoxsTN+uiOjiB17bauZzbaiF?=
 =?us-ascii?Q?dzvitIVsnIkW9wvQv6LZLrOdLBm+TNPVKdxKhmePgt3+czfcj9rDY6YAx7UR?=
 =?us-ascii?Q?6nHJCGLX8sP8MjlU9uMvdOjMknU3wE4AYNANVlvtwqYjUMb7LbdE564sU7cn?=
 =?us-ascii?Q?4rkrf4hCA30OI0d4Euyc5tPCOVktlRFS5ayYee55H0Ir8GLU/ZYUJXlWDNgo?=
 =?us-ascii?Q?VT7Hwwbt2ZqEw0n4cB5QxNk9ZWrtPxfv5gleMYlTCwAF8kizI47oSLIPYxZX?=
 =?us-ascii?Q?dDKG+z6mfqsinm9SkVl+Uhx2/Iy3LyulsxUqVnJQy5is7sSXni/JZTs1QZ4R?=
 =?us-ascii?Q?MJGF1T7bwPsb9bvN6k/pCl7/8rMSvYFGgOMiO+rk+1wW1K0y/DyHop4FI+9Q?=
 =?us-ascii?Q?KW20aK2tb2e98PsWkH4a9L8hhBwsMBbPe02r4Ao9eKAdiPK1iBuZYYku6Yz8?=
 =?us-ascii?Q?E7+Zzz2N8wmTiD2WdwwqmM5+9K7rR2YdUrBWaJW7fQDg8KZfCBDYJR3ynGdi?=
 =?us-ascii?Q?02JsqpOTEUgO4pnusfHidqzS8pImbtbwn6A2sWX6d2rJCG6gPrNGeQfKBE9q?=
 =?us-ascii?Q?x2VZB09Zv6tozFMv9XMqXIuG1M/soO+IAmlydS/nU84OYboIloV8ynE5fmqn?=
 =?us-ascii?Q?oRjGd8YM82cKGPszC8r0jNzKyl5uhuT8f4qC7fEHJSDo/LtO89hiHt+ZOdmN?=
 =?us-ascii?Q?4M65Xrai2Io2e5FGgtQQxzMIJmW4L+6nRnwuzGUiGoRo7v0Hkkf425T3uAiL?=
 =?us-ascii?Q?FT3illW0Z2i2t2FsD1V1M3ElOz2r+Da+AC4MmUn4je3loz3VKe824tRpBuIR?=
 =?us-ascii?Q?rS0eBCjehLwVwHKLqGT8KDgbNXlUXQUd+qtWJ0+J6pMHlcj8dfYUvpxHNixO?=
 =?us-ascii?Q?JKIwmcI9I08yV9fry+/z06dKv1SPdPPbB/bR5B1x1QVeYhwaQ/PgY3yaMa2N?=
 =?us-ascii?Q?F0J6AoheGR3QVG8cS8Z9WtLwIWHqcbDFWPhq6+dsSy8sk7ZXzGqgQt9wK0M4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	grNtiaoVluRe5EuqkZJqe6roE62KwKJ7Cl0CgsAtg54FI5V6G2/693VVMHRS8I6STulOLClwSA3D/pJbCxvyikORRxpzVJUFYLDC7ltIf4Qz4tphGCWdAS6DtgrwHH/zldDnmVAnwrTxj+yzvwHoD15FqvjpTP/+wZUSLpPyhx4DIzuN8oej+RMJrczZHmKQcEzYtVpxFn7lPk7DFqR9pucLj9jUGFwAPmdVprC8zNQ5pUUQ83I1iZrcBTRmNW2cHe5zndKcSbjXgl6OEB2ucknsoV9bXcB6y9AD+pYtyxsFCUlmnogbCA9lBWbDwqfAhIZiuEiXtW8yt/s8vquET05DdXctjWp+pcYgiRxxmsxDIaA/WAofaOk41v0ql3bPqYIpF/VPLGxIaRExrgFjMcAD04kz+2Etwu7I/jr4nZC2Wc8GLqLfh0vJTYM3chz3QlevHAg7KptVGQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 136c9e81-09ea-4738-9823-08db82f347d1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:15:59.8663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07CrNVgEatp3M8gIrhhfqy+Lr7Uf9dCvblN5RgRZMCUZ1fhoewufwASfEu3pdxXWuHhwbLpkZsMSnM8KCMXrA+GmrUGGbWk1mwzr9wyMyM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6501
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_11,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307120146
X-Proofpoint-ORIG-GUID: UCSgiEdiT7I66dv6UtlosM1nNdEX5p_U
X-Proofpoint-GUID: UCSgiEdiT7I66dv6UtlosM1nNdEX5p_U
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
 arch/x86/Kconfig | 92 ++++++++++--------------------------------------
 1 file changed, 19 insertions(+), 73 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 7422db409770..9767a343f7c2 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2040,88 +2040,34 @@ config EFI_RUNTIME_MAP
 
 source "kernel/Kconfig.hz"
 
-config KEXEC
-	bool "kexec system call"
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
-	depends on X86_64
-	depends on CRYPTO=y
-	depends on CRYPTO_SHA256=y
-	help
-	  This is new version of kexec system call. This system call is
-	  file based and takes file descriptors as system call argument
-	  for kernel and initramfs as opposed to list of segments as
-	  accepted by previous system call.
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
 
-config ARCH_HAS_KEXEC_PURGATORY
-	def_bool KEXEC_FILE
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool X86_64 && CRYPTO && CRYPTO_SHA256
 
-config KEXEC_SIG
-	bool "Verify kernel signature during kexec_file_load() syscall"
+config ARCH_SELECTS_KEXEC_FILE
+	def_bool y
 	depends on KEXEC_FILE
-	help
+	select HAVE_IMA_KEXEC if IMA
 
-	  This option makes the kexec_file_load() syscall check for a valid
-	  signature of the kernel image.  The image can still be loaded without
-	  a valid signature unless you also enable KEXEC_SIG_FORCE, though if
-	  there's a signature that we can check, then it must be valid.
+config ARCH_HAS_KEXEC_PURGATORY
+	def_bool KEXEC_FILE
 
-	  In addition to this option, you need to enable signature
-	  verification for the corresponding kernel image type being
-	  loaded in order for this to work.
+config ARCH_SUPPORTS_KEXEC_SIG
+	def_bool y
 
-config KEXEC_SIG_FORCE
-	bool "Require a valid signature in kexec_file_load() syscall"
-	depends on KEXEC_SIG
-	help
-	  This option makes kernel signature verification mandatory for
-	  the kexec_file_load() syscall.
+config ARCH_SUPPORTS_KEXEC_SIG_FORCE
+	def_bool y
 
-config KEXEC_BZIMAGE_VERIFY_SIG
-	bool "Enable bzImage signature verification support"
-	depends on KEXEC_SIG
-	depends on SIGNED_PE_FILE_VERIFICATION
-	select SYSTEM_TRUSTED_KEYRING
-	help
-	  Enable bzImage signature verification support.
+config ARCH_SUPPORTS_KEXEC_BZIMAGE_VERIFY_SIG
+	def_bool y
 
-config CRASH_DUMP
-	bool "kernel crash dumps"
-	depends on X86_64 || (X86_32 && HIGHMEM)
-	help
-	  Generate crash dump after being started by kexec.
-	  This should be normally only set in special crash dump kernels
-	  which are loaded in the main kernel with kexec-tools into
-	  a specially reserved region and then later executed after
-	  a crash by kdump/kexec. The crash dump kernel must be compiled
-	  to a memory address not used by the main kernel or BIOS using
-	  PHYSICAL_START, or it must be built as a relocatable image
-	  (CONFIG_RELOCATABLE=y).
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_SUPPORTS_KEXEC_JUMP
+	def_bool y
 
-config KEXEC_JUMP
-	bool "kexec jump"
-	depends on KEXEC && HIBERNATION
-	help
-	  Jump between original kernel and kexeced kernel and invoke
-	  code in physical address mode via KEXEC
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool X86_64 || (X86_32 && HIGHMEM)
 
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_DUMP)
-- 
2.31.1

