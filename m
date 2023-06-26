Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDD473EF65
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 01:42:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=ynvedisc;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=cIyT5XA4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqks51G3Wz3bP2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 09:42:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=ynvedisc;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=cIyT5XA4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqXwZ1McDz30dt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 02:14:21 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QCV7w6005302;
	Mon, 26 Jun 2023 16:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=7AQ/nn61w00WgWIvQQ7wSxtVVSi7UGcNYqnTyTTVFr0=;
 b=ynvediscTJ3tzVFSl8gIyyug36oUdeonrhc7LohrNchbpGT4Z6P+ZgNcc/rOgVITVjt2
 GrYscZWDITVu0uViByL8Ar7U1l2dsYNyko76HUhN/ITNwBPoOEwNQdZcSFgE84lJ93oy
 yJyFe+7jio4+DigfoGonWNJacrvUx3U7sIm2d5bLh92UTYdwQz80LAfz8ztuE0yawKxe
 zxCVR+mNwyJLYHhYK5CNVimZK8j17yu1PnlnIxKCWb43k6BIg0QkYEsoEWxYJ2aJqovl
 v0bvVjczsWHyaR3kEk7xmU4Cgj8IRCw0auwgnn9YpfVigDdmMPWXK/+4QAzmxRIgUza4 mw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rds1u303j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:07 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35QF1Tos018827;
	Mon, 26 Jun 2023 16:14:06 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx3hqh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4gbX6lKWv7rsNO2L5NhgfBxxXOtoLw4YLdYiUJSX+tOtv3K3XOb7zzxLX5Qs5/tm69UWZScwe9XupvHZ69u3kEr7pMHy/KvZIZg2i5T2dfWUwK4+j45WXIWhkPwRFkGi/ucr6cSbFifh8GRoMDZgpVSDaBnXQ5ghHoUozZjB7Q6FNTCIbbOFUYQj6k78qvONqornA5gRuGb5uajj2HPdw0DKH49KH3rOb8mJynDU6EjmrGXDUAoEjWk0hd6q0Z6qJfbW6Gs2FuTvyKDiDXhIiP5Zi6hz3SIpaXMtCRv+N2R6LZTeZgsWgEWKSuOplDyN4v78krWV2i3aSIdkoxLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AQ/nn61w00WgWIvQQ7wSxtVVSi7UGcNYqnTyTTVFr0=;
 b=JDTAORU7jqUOs79t686+n2dFtqtwXTu07wOIgNWrRvljmuVvXRvsCK0YtKoi+na8zhAsQgB7JnDhjKw29wYrfJ6o70yAppkgTmXEvb/C3Ob3RRFzP8AxPXsZrm9iUVvwTYf7nsTE0nxh+gR/Wehw6p6Gr//n2kcLz9odzSa4v80wxLjVyHblXKOFa/HgI36dxZB/HrBZRAihfou053UrKeaBCv1uyRet2lRRVn0UirF07geEwD9cFPEZ2DEzj1oGNBFbFYbyBv3YjKHxq+PzS+/JanqfunOmjjY+0hVoXu8sOht8j60WGk2Z9j8gtuYt5SLd4yqQtuWd2Xckz3kdGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AQ/nn61w00WgWIvQQ7wSxtVVSi7UGcNYqnTyTTVFr0=;
 b=cIyT5XA4AQOqxOT9je+QEkZed0lmW3F9mX18Owk3SDRNfRz7Y/tsr59ln78G89SMsTCcxH2WBDLTPx7IQACjMI9N/fg4BYOSZYlFjTcJ9OW/JsrBbH5jNClfEuWI1srf93S7TREq5OM2ZktgmKoBs0IEiYrIjWXAdk8WOtwww9I=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH0PR10MB7440.namprd10.prod.outlook.com (2603:10b6:610:18c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 16:14:03 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 16:14:03 +0000
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
Subject: [PATCH v3 07/13] m68k/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 26 Jun 2023 12:13:26 -0400
Message-Id: <20230626161332.183214-8-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230626161332.183214-1-eric.devolder@oracle.com>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0069.namprd13.prod.outlook.com
 (2603:10b6:806:23::14) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CH0PR10MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: 9786f6aa-879d-4558-1160-08db76605ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2mUycuxDYAfUuq8wToSCqaZ83KHVq8bqKDXs6DdcXACi5URKHb3LmODlGKOZLXrwaJPtjny7i6e4IYv22gRbpnjlan6M3t/awqKI0L9yB1gnpj4cMbyPT87WXzFLrX+DqI9eewSaZMTm75I/jES5JH2TAzUTq5QJu/peVUWQQ6wxua/nUPKWJZV5FJkJQmJk0KmBdeyHqstTNLVMQyLUbrxpGGAHByeVf36G11/F8/ASj28YLn0nFmon6nvdLB1cOMos85++oCFCXJ54tx1245jl4MJb0fFhuMa2We0oP8IGBUogUUmwzg1nW+TOC4KpK0tRiuGTVh8x1tPG3DAamJjuPCeT2+WjZ5pKF0HMYIuqScZAbdoN7ZIZFpGRTztVbGGvJrKWr61Ku+Br7mRReFMQ0en918lfegAYZ1ZQt8KTSTic6X9UAzxMqInCBErdp2jLRPlXyDVubUAqxuZGRnIKqd1Y9jEVsp92F5yXQ53NG0HmlnUGjrsbuFYqRcf7eom6jghTsu9p7FwAZxt6ATkeN53f7Q5FMKHhDv4ygY6MuVKfLH8rN3EYyTTLzy4Z0HPqbU1DBx91r4IxZU6z0gb6a9K2vhNPDFCGd4IzpIE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199021)(6666004)(6486002)(478600001)(83380400001)(2616005)(86362001)(66476007)(107886003)(1076003)(6506007)(26005)(186003)(2906002)(6512007)(66556008)(921005)(36756003)(4326008)(7366002)(66946007)(7416002)(316002)(8936002)(7406005)(38100700002)(8676002)(41300700001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?4l7WIklDxRvQTrvi3SYSAjuSDRbJYxUWqvsfSAsI+b40hsLDuF7TCAjBJXWG?=
 =?us-ascii?Q?gIFRlXwyBiBGGjXpM8m2rNacz4dmswxmKsP/bfhFASKm1QdxUq3w8K1uYKrV?=
 =?us-ascii?Q?FMHW7F7JNxqbR/rKmmxznudS2dqiuZcJtfbGWBPGtONlGEpCkmfn7Q7p9jUN?=
 =?us-ascii?Q?gIWOujQNvQOM5B8mEYcbKLlWn2JAhVaJLDq0AaSubbi0aDadgH5jXnLa4O0N?=
 =?us-ascii?Q?RgLpHLPBDqkFaLn/hDBZQ/E1QkH4nqED9BD7FSpz9rBZe3RBJG/W2l+Cij5P?=
 =?us-ascii?Q?FAvYzOsedoy8rvO26/0CA3x6/Y1v6AJmtn753oerFeXLRDFulNBA1EHWa7yo?=
 =?us-ascii?Q?uq6v7PIMAaZg5csvSRTvn7oZqaUm22MuLeyAU7F85+KxFHN+KHxto+O3b6w0?=
 =?us-ascii?Q?YVb/kIDoIxGGwv1cAiOcP8GrjXYksKXsufJKwgoE8VjMexWTVjefJFG94u3b?=
 =?us-ascii?Q?dY2EOk6x1+WSIw4ZZ5RcjzO/Q2zwNoyYloeoBI/sd67IvyLMQR43OM2ycrgc?=
 =?us-ascii?Q?5MNtCwWwTjNTeReV/OdojVrukkVzmTGmxGj+MHiqrHGZrzAx7rnS5PO2N4EL?=
 =?us-ascii?Q?3c4OQplguSC6IdAi4ksMKGvYi8hMoGMZG5PXs9ikIaPgOQ6tnd+7nCZueU8S?=
 =?us-ascii?Q?Wql8dm8vrgJHNrzdeo803CSIJWLiTy0tqYiOTrDUQa1Bjy90iiB5eTG9vhca?=
 =?us-ascii?Q?j3M8/Xke+ckgnBYX/g1Hq79LpjqBDhgpINaf56PB1WqHn4/bQaGrpD0LkWLv?=
 =?us-ascii?Q?vJihWfMfqFu5a1FQz6PYPuRlPcS0nhk657ocaQZmB3VdagmfkqAhU5jg1U8e?=
 =?us-ascii?Q?693+W/twpz1LcXtjgGzy5X154bjaIZIb+MtmANyma8OoSh1VL6NqfplQXKy7?=
 =?us-ascii?Q?0LzfrYUsTfNpr/xyxnnrz+oeaIjHj5uxZkxrgkGQlt6oxpEOxnYDVAm3lo/9?=
 =?us-ascii?Q?WtDwgBgBpvO+E929bJNUv7tdJJmBsxrk2l9KJuRaIJbj4y2+BJiBRSxCNRKv?=
 =?us-ascii?Q?8PkkSS1P+WpFCb/yN3A3/lemWbRab2bx6pUvnP8Cu/xCrphuRbun21nq7O6S?=
 =?us-ascii?Q?+jVEOF2N3S/ICbbcCqII6geBMVzcJB4fmDcRM8BKFew/cDAluzLuf2DNoC+i?=
 =?us-ascii?Q?aYE63uhnHMtO7heB/JFlvDzkQK1KcwE+2XbUrBmnYeBD3ss+4pnMcSaVEEPh?=
 =?us-ascii?Q?dTWWVmg0Zsa2HA7b9iSio90pUnTBbwXD+FX+XSXhEMQ7WJYDcCvpld8inko5?=
 =?us-ascii?Q?NIfn1whYQn/XVAZ99b/IaEDyxA0D0s97hNtqmkKsITBxel5tHw3bHErdIWm9?=
 =?us-ascii?Q?ngQKClmUhcXe2Wadxe22eJ2weIJ09WDs/JZ1M9FlXc5i5fGhiqhS1wZtRWMV?=
 =?us-ascii?Q?8FWmwf3EVjuwcCEN0DPAzWnCpTounzYxWQiKyB3FzUaLR76x2fqFRK8HIwqO?=
 =?us-ascii?Q?vmArySZVihOvRPTqP8RawpkkxuVHY1mtAwkTtQSO7Y3ir4uWOwYVdmHFIg4R?=
 =?us-ascii?Q?Gqfq2eCgrjjkMY1bly/xUicnNb8t7ZP70IXbF6TBDd5s9ZDOTq2TQH7rNute?=
 =?us-ascii?Q?8xF8Ou4DV4WHxquFO4plpnmWcoJ2U0COY+xrNQx5uXOgWRUp1/dfaLg6z7Pt?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?gsQcBTuGGxLNCnR63+aMa0J37OPG6xuwsR+GpfgBRLNnfRPYvt4xYqgiDBzK?=
 =?us-ascii?Q?PBpmb3IQkKRDwY40ZZGBhh5K/iIuyvYocoMQNzG1sdfPiwJi0YN1vfHB5ckh?=
 =?us-ascii?Q?Oha7KsIzy88IzmRDWoNwfv/F0kx6uQgirL6mokeypxV4FBuD+R+Kc4IgcsQk?=
 =?us-ascii?Q?RJycyrFN56O546iwQfwkb6sjagSTrkYRMNsVLPcsPMGnyTowxRqO1JYfNemg?=
 =?us-ascii?Q?b1l2ZmZJ976dETLUNIjMAul1VNeGwhTvNiMVfktaA0rPiWnnKm/deXblzcuP?=
 =?us-ascii?Q?3qifOzW6NRXRy2ImcEUCyR369W7HsP/vd+A/s/LGJG6Aw4VWG2861xkWpc1u?=
 =?us-ascii?Q?843ektGXGexbA2KjqozUBrQujgqmUxWccr9EvDhLbqKkUQqjixYeL23K4b5i?=
 =?us-ascii?Q?sDd9/nKGqR30PHO1aOFMGpW5fk/U4Sbhky9lzDdSmJ8LyLTo2Nz/deduNjvG?=
 =?us-ascii?Q?5ryoDWhao20a5RLzosVGfS2koUyEkWMrtTIdnSRdiZO3eg4jzBBoTOhfAA8Z?=
 =?us-ascii?Q?Y1KeIJts5EmnxHKDz0Sbk+Uar964TDnRB8iK2lLHFt8437CX/m4QtplSB4rg?=
 =?us-ascii?Q?9xV9rOasxzHLKGa2kOBdClxUgQEqU7bWK3uS8aatjYuYLy8Ze+LGR/6UlRbG?=
 =?us-ascii?Q?tiqTQSnXvfybjfzMGDJeVH0cX518y3DUh1ew6oZvcgvR63AxlFUOqpuTiGN2?=
 =?us-ascii?Q?W0Gc3dJolowrZA+qc8PERKfbB9T7vcY/WT3QvgcObpCIJt4GurLddiIr6GRE?=
 =?us-ascii?Q?gLnDFK8LUspg6kiErPlgu6+QtVGTdhnfO3tZjM7bHBEjLtUmvndF7cnHqSSB?=
 =?us-ascii?Q?fMHTNs8XLnYuXh7Iw3bi0QK6AHy8p+mOgGpjhEnbJqup1uNjhFnL9NYhG6+C?=
 =?us-ascii?Q?6w2H53iZa7PdnZ4OKgxs0Sjj7txXhos7sktrfCwb9rJiAnD8Zt/681s+wkSw?=
 =?us-ascii?Q?xlGu1loaukztcvQ12bT2iBkilTcg6iYSFbzkgC9SiYNXRm40iMf7XlzYw75M?=
 =?us-ascii?Q?QcMswvzRIVWl0H/ykQt7DfYpbloPxz3DoFpHSDJ8ScGU46JtgX8uMPLVX3s+?=
 =?us-ascii?Q?WHn8hxbTbNQsN1yZtFhMHdoeO4fXFZFy1Hx48BteBAWPxzTThqUFDguA8PEH?=
 =?us-ascii?Q?UcHvAQCbMUXJoWnVI9RHjCXSVItAKQJ2LE6X+3mGQzfyvOO+o4uWOGNb+vzt?=
 =?us-ascii?Q?W+3ydGZwXLDtkHr8qIIJ7yqYcJXZRU8vB+1glFzqzNsC5ap1s0NTVqVCBb7r?=
 =?us-ascii?Q?FqyXmn+MEgCbom3ND4aofiwV/UgjabmflPYPd0dAQA+shvlW1hpiAKpEWppP?=
 =?us-ascii?Q?yb+GmAucM1upn2aZ+/TWrGbnHkl0xXPZqnu3PPDdDTfzlcyuSygkhEjzZbzE?=
 =?us-ascii?Q?/LVgNDwF0/qUwgZ4Xnzb8r8GOfRVn65LGjxYJlVBSw5q5sd8VOADbcKAZdZC?=
 =?us-ascii?Q?MRXifj+89zPIPKn0cE5h9olvXvaIjDkRW/Jl5AlTksj7wf0NSNHeCeH+6w8b?=
 =?us-ascii?Q?AjOtN30r2l/m3d0g5afWrIY3N8oNSKDlOyWbsqC/0aVpm38vvHjkTugBzO4o?=
 =?us-ascii?Q?ThC/ZHw9BlhRXdglqUIlVY0lWAvom8sB0dLZcdKuN7lv+vU7Bw/CRmemcBip?=
 =?us-ascii?Q?qa6iS/mL/g46442aGrwU5ioGBBTe3zg0Ca9MvnXY1pQCJKbS23z5ix2xDg52?=
 =?us-ascii?Q?1wzuW3jf1HwcMd4f+tSS3jCvHYrmvRBO5zXAqVWSjawoVfuXfgfhdzajm1uH?=
 =?us-ascii?Q?+V4WKgtIGYTgDnJ1aCRunwtbS6vlYGAIUZ2z95BrBrj1q1mn9kyczwdPJ+CR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	mL1eG3D6H3UfsXztEdHwZZK/ha05ShfBpRj1FgBLrMdEj/zPwP+QNnJ+8xDoAAOGNdGNv2BSQOk/qrtEvG9qKM7WurNmZ77LvGUWk+F71IOQdVVRktaJHBqSHLKATjmX41lJ7wr8oK5zKbbSUI66y2P07an0f9hWIiNUxWOB5Yn/53q16yEIAOZd8muQKcg9+0QS+jkTkb48Hk6SvS3qejaZgjOs4Y0/5m3j/pufkRBh7YaM6xSLcrKGIOGdOaeSBGQkjYZJxRCJ9mVnBdxBPQHSuoWPORTe5BQDMyRfhSaYFalbx7irmqD+ObYE6KCmJaNMcyXcDgyyOIqDI8VDueeXXb3xmY8V8LhZMQNicg+oyJlJ4pM4ZZvtKJSKP5YNiXo9wfmSq/Wg6ZJ9s9FRJl3PjZuOFYsxzBFIpsmfAZOyDTAaeQNeGI+9xRaEQ1ax4+CrBjdicruAyg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9786f6aa-879d-4558-1160-08db76605ba0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 16:14:03.0864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfLk5v0pU9L6nsIk/kYBHbV8JSGSryR59FZUnBXIEpeJYa06bzGLb9mQeRxz7pvt0cF2ADKwQwP8GhL4sVU3vHp0E54s+jIIBh7z7RAcWME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7440
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_14,2023-06-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306260148
X-Proofpoint-GUID: Xt0UqRx6tuUXUI4UmFYXTxyawNvtPmCg
X-Proofpoint-ORIG-GUID: Xt0UqRx6tuUXUI4UmFYXTxyawNvtPmCg
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
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/Kconfig | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 40198a1ebe27..7b71916d1519 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -88,23 +88,8 @@ config MMU_SUN3
 	bool
 	depends on MMU && !MMU_MOTOROLA && !MMU_COLDFIRE
 
-config KEXEC
-	bool "kexec system call"
-	depends on M68KCLASSIC && MMU
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
+config ARCH_SUPPORTS_KEXEC
+	def_bool M68KCLASSIC && MMU
 
 config BOOTINFO_PROC
 	bool "Export bootinfo in procfs"
-- 
2.31.1

