Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 635416A1142
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 21:31:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN4RQ26wsz3ch9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 07:30:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=VU58WEqo;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=kwZ9/mtM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=VU58WEqo;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=kwZ9/mtM;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN4Pn2PPfz3chZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 07:29:32 +1100 (AEDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NGxVNg031233;
	Thu, 23 Feb 2023 20:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=cdsyP+H1dtpnwkGm3jXkW95V27HTRu7nEQ+jwDhzIfk=;
 b=VU58WEqoEYKDpdFEjiUaI+V+qR+b3/1qjgiFZFVR9Sy3aX0UhMauWBotryrBOSMLHcwQ
 U9EKBbTQ0SI1jpnmEadS9zIqcTbxx3VHgdSPbCBogHObEetavPEDaBgogjNPLzmPW/oY
 o5yO8bjvJaL/IIVq1uQuivS0E4pM1h5/T1X9CzxFWidSHHaXxj7+JJOnyFQDQf5KnrKj
 tGVQW7Rwo7jfXwfS6M+0+ddm4pHGT5zARWCKLEEfJoaUIfkf/OIghu6+ahLmCHZ0ogWS
 Uigm1JA3CVWMonRCwr28bqeBz/ToncdCdpp93SpOqsy9t0gd8+s4QyuCGkGpOYN7PcKr IQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntn90uks4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Feb 2023 20:28:54 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31NK0HYF034067;
	Thu, 23 Feb 2023 20:28:52 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ntn4fwrve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Feb 2023 20:28:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMsvBgDVno5ACaP+qoVUuKkHQWg2ekoyeopkeI3yYlV6cS8BabIAu+vmZS7um3+/Glb5oT2yNabGqivvjWQx+rG50SJU76YzEUnyq0yIXq0FJEldRazLRYnH1kofLl49EccARt+34lO2L9GME1X4Obk+etkuemhI9mUJw5QU/s7eTu/782ZBnZaLYrIimjUMisUTFugfSj46qeOmS+ktAJ53WyrPnzGaWgOjS+gxJVb0xYKTSx57hie7PeIHAKWzHgAkZ695tR5ZFi9HEj0HvcFn6wiEk3X9C/Pq6kVTT1d3BUE9Vcr4Y2e4uatwa9Lhevs8p0RFtPHm9d2GKKqCdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdsyP+H1dtpnwkGm3jXkW95V27HTRu7nEQ+jwDhzIfk=;
 b=QFUqAauTq6bbSTlLOquGgGkyiPDLd1kT2CQI2YEbekq5oYqL+ny8EKlbp5Ri5S3oTXsZiBRU1yYm5vZ9rhTCa6hlzkH9FWD8ixLS03uvNNbH4AibXJxURgNd816Ky2xApFtGj2PSuDErYDKkHQxrimiFapD0UgmD0feG7BpJsNz8Ic7L8/Iy8SD8ebzzWfY5fB0pwSB5RS8IuFmZsFUZE3nbaIRSGioQ9XyZTCMULYsjPW+ePc7LZ/dyD33+MbZc6HhKbumVQ2r9YschndXfi6KOvLgJsuBYlXzrsUZhN/zKNEvvRs7iJGqIicAbfOOoaghb+SecZuVNYwyoPIbe9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdsyP+H1dtpnwkGm3jXkW95V27HTRu7nEQ+jwDhzIfk=;
 b=kwZ9/mtMOOiF8luYELbBv6aR0QlFMnIcaQtZPas9KnllFRmJZE7g3MMzVC/lLjA2IhWZCigQaca9XcIUb7WoEYn+28p0gCPekCq0o5R0lzySfcAlHB2WYAPwxx78G5i4OBSckKyz+DKwGolZSGNh0qyuz4ErvZ60JhJwepoX62w=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by BN0PR10MB5302.namprd10.prod.outlook.com (2603:10b6:408:117::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.10; Thu, 23 Feb
 2023 20:28:49 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319%7]) with mapi id 15.20.6134.017; Thu, 23 Feb 2023
 20:28:49 +0000
Date: Thu, 23 Feb 2023 15:28:44 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
        michel@lespinasse.org, jglisse@google.com, mhocko@suse.com,
        vbabka@suse.cz, hannes@cmpxchg.org, mgorman@techsingularity.net,
        dave@stgolabs.net, willy@infradead.org, peterz@infradead.org,
        ldufour@linux.ibm.com, paulmck@kernel.org, mingo@redhat.com,
        will@kernel.org, luto@kernel.org, songliubraving@fb.com,
        peterx@redhat.com, david@redhat.com, dhowells@redhat.com,
        hughd@google.com, bigeasy@linutronix.de, kent.overstreet@linux.dev,
        punit.agrawal@bytedance.com, lstoakes@gmail.com,
        peterjung1337@gmail.com, rientjes@google.com, chriscli@google.com,
        axelrasmussen@google.com, joelaf@google.com, minchan@google.com,
        rppt@kernel.org, jannh@google.com, shakeelb@google.com,
        tatashin@google.com, edumazet@google.com, gthelen@google.com,
        gurua@google.com, arjunroy@google.com, soheil@google.com,
        leewalsh@google.com, posk@google.com, michalechner92@googlemail.com,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v3 17/35] mm/mmap: write-lock VMA before shrinking or
 expanding it
Message-ID: <20230223202844.noant5suylne3dnh@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	michel@lespinasse.org, jglisse@google.com, mhocko@suse.com,
	vbabka@suse.cz, hannes@cmpxchg.org, mgorman@techsingularity.net,
	dave@stgolabs.net, willy@infradead.org, peterz@infradead.org,
	ldufour@linux.ibm.com, paulmck@kernel.org, mingo@redhat.com,
	will@kernel.org, luto@kernel.org, songliubraving@fb.com,
	peterx@redhat.com, david@redhat.com, dhowells@redhat.com,
	hughd@google.com, bigeasy@linutronix.de, kent.overstreet@linux.dev,
	punit.agrawal@bytedance.com, lstoakes@gmail.com,
	peterjung1337@gmail.com, rientjes@google.com, chriscli@google.com,
	axelrasmussen@google.com, joelaf@google.com, minchan@google.com,
	rppt@kernel.org, jannh@google.com, shakeelb@google.com,
	tatashin@google.com, edumazet@google.com, gthelen@google.com,
	gurua@google.com, arjunroy@google.com, soheil@google.com,
	leewalsh@google.com, posk@google.com, michalechner92@googlemail.com,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20230216051750.3125598-1-surenb@google.com>
 <20230216051750.3125598-18-surenb@google.com>
 <20230223202011.dahh6cidqxhzoxne@revolver>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223202011.dahh6cidqxhzoxne@revolver>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4PR01CA0279.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::17) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|BN0PR10MB5302:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d3178ab-a586-4348-4ef0-08db15dc9244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	mS8XJcvQ2sN3e1efEGmqBwKBr0X7JlaZIHsK5ox764hNr4CSNhjWbkdkS29Bk98lMFQMf2qVeHg1/ubiQRbmXIEvVyqL7rwCUgMUGr8DMlrRs5xOztJhohbEJETybvh7fUJmCPx7zfnt3L2E+8cVbdOF619lF4EJVbfk9jE8468pZUL1pdOYoXcUHVFnm/XuAjRy6mNli8r7MlDBCt/dYHoykklZ4Ak3PiEQ+gFuGqSk4uUA5sQ/RSlbDnwx+5iiHj2qDTDwccQC/W/m4GODKZBnJjPTtZeQGmcS5LNbO+5d+bAWophFcXH584MjkJA+7FVqIOwlOUgVZSYP1z87cIlZ+NovqXJ7016uWz/hrSp1a1rQmZRw8Kvd/ChO96cAjI3ZfUg4E0Z2IwRBgYhDEq4TGQWP7FmCViBG/O6f/8Wd95vJPlQrrUBwnQwt/XzkWDPFUvRaMLCZRCCQYvGSQ3xH4NIxBiK7NHGC1JEMuYD1L5gfLJKZv9KmC7rbi8n8XGBThqQchaQjOI5q1j94OsG/MGW4ggIydj6etDnNg9iXJHym0vHA/U47n+teX1Pip7N+huf7kWwTtPgZIVHq9xmVEbBTe2pOAdo1cW82MXcc4KHzGUGEoiXd6M+Ym0xDJh1Y7jaFcPmXvuSoXvO/9VsqVSoXQal7cBOFD26fNyE81quzFkRHCvGruzYKLXcQ
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199018)(921005)(33716001)(38100700002)(83380400001)(6486002)(2906002)(316002)(6506007)(6666004)(186003)(9686003)(6512007)(1076003)(26005)(478600001)(5660300002)(86362001)(7406005)(41300700001)(66946007)(7416002)(8936002)(8676002)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?HYrIxmanF2eKgqFkcbk51K04otuvCayq6MR783JPFGn2bhRIkQmL65DPEJB9?=
 =?us-ascii?Q?osjc13TZwQpVgpc2Q5WKW4W2kViSiKY7IZLU+xI1qzbrs60Bf5f4HiV0lGEl?=
 =?us-ascii?Q?AmqRZQQUBGdiO8/SPg5h7qf7zPlqjJaH4tSdV5SCoyRYonyGAujkxjMvEikR?=
 =?us-ascii?Q?ipsi9sMZVhl3XoE5WrVjGNq+hCsgNGS+iWxB9Y0iMhnXzR/llqc6QtURcOAk?=
 =?us-ascii?Q?xB7hidBAwDYX91f/5evRF6k6ccDkGevg1BLA7iDK8VGFqTRROnrkgCnTzlHA?=
 =?us-ascii?Q?M6aOvrfMdMxQasUlVoFHoYKSuctmWgnSs64mxvWUnDEiYrWJAWfKSjgGQ20T?=
 =?us-ascii?Q?tb7IJeolH2gfG7aHDkE8LQZo35HZvHGrFBcnQhovR+RqfKy4caD9NG1nKWWw?=
 =?us-ascii?Q?E3BfabfXtPOR6BG8MRDHG7J1IbvQJv43IJGT0VOLYpdgpxAkYgeiZcNKxzup?=
 =?us-ascii?Q?nN5ze/I8Q7JI6RujPRLtpi3m/naHZLTj1kELUjKDOn48AeujTaxXAn6Ee/Qb?=
 =?us-ascii?Q?jC+eTTo4FH9PtvAIFUd+tnCV3blo/L52Lj1Ph5F7y0HNGKEj+SIQs+K8jaJK?=
 =?us-ascii?Q?vDY2dFbcMegU7j9r4/xq1orgjqX0ubKrZq/2lbP7z35e5Iv5Qm8UWpd2VwFy?=
 =?us-ascii?Q?KEuBIkvXr6ZTVDZ0/75P6nuXdyZ5KZXATDRQRy2d3Yu32RgvMwsjzh64HVL2?=
 =?us-ascii?Q?PrYDp1kDoHhm8v2QvRUHK75ouKv/CmyTr34/e5kKcvOjleBNXokDQ6QV7p/g?=
 =?us-ascii?Q?dW2ckp/X0JAETvKAZo+/7H+F+Zy/PTW6QB+uCsYDC7RUKOU2CLKYU5f8I9GY?=
 =?us-ascii?Q?FfZfSoqJNGCJQnfwrxvQGpkDGCG5xeoIx4Bbx4UXy6FiU84T0X80WG0GjLox?=
 =?us-ascii?Q?XYKz7kCAaxuxnqlyBFAsC8RCmxc5SKfiwHoIr9d+UqFPxjsoelmRL8r9b6yi?=
 =?us-ascii?Q?bwWB4fkMtHHe+kUmHQiUWThe4HRi4GFr/++pDrM6zLWEXRTEB5XmH9G9qRIs?=
 =?us-ascii?Q?3v/kZYMGDVaSXDPABAY9uZ7WHYyqTBr0Q1VhmI2UGyqTu1EYUThgWPODE0to?=
 =?us-ascii?Q?clGjmkrWI3VzjqihqL1TFv+rCV33rLAsNdgTI3OlZYwNdQwMf0Vw0bYG0Bgd?=
 =?us-ascii?Q?rEoYRUKrVL1nOOdJKqrMklRWCjVZP6iJRwdur6mzqh5FsdxGfcJidI8od3Tg?=
 =?us-ascii?Q?LkHLtKNXruDe+MaVKuquQFeicn1p2wEfvKuaLfiV9oUNtathW70zUsxjYqSR?=
 =?us-ascii?Q?N6bWLdKcgSKxZhB98wiPBRpWpWw8/kCSevCXIFuFZ8xBhGnJj5Az4NXTQTSu?=
 =?us-ascii?Q?/dMjEV6ZhYmRW5sZY1CL6mpZLPW/5s7EwbRh0vUkVxFGVS6A3k6Xt0zUyRtm?=
 =?us-ascii?Q?aN0kGYn5ckzbf0ganJSBFDPy5y8vsIMr4pKjoltmww34nqr38s2GGdmOBZvs?=
 =?us-ascii?Q?IDyq9TKMWD02s/2RnMTY7ZKUM16vHYYZ8tk0YU+HS2RBIJ9cnIDEW7upgNum?=
 =?us-ascii?Q?pCrh9Dxsia92QnxfjCYG8xqxmSTPcf9RKNX3TYf5Q67WGaShY28XSQBI7zfQ?=
 =?us-ascii?Q?3lK55S6ixEr9bUL3GjM3pleiv0ryu0qFmHZONXkaUc7eY9UVnt/jucKEJXyK?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?N8Dit2RzvEeLiyGtCCQ8wzFozWtMmG7p7qe/M6hec+ZiHx4uvnN8kFI1Y9sE?=
 =?us-ascii?Q?e0+Z885Pl84zbF3Bu2gGCI1amDsl2+1V4DZ9ZsSSiM1Oo9IHgC8Q21awmXie?=
 =?us-ascii?Q?zkBjyl8Hyu33CGwajv8+zJBCcjjKKpYmUHk6bBuJjnoorP+br0hVckEqbvci?=
 =?us-ascii?Q?KcSJCmkbzY/jf4vzIDSgI/TvqKSUWKCVGMz1Se+jZtjR3eT1G+CNR8f3DNGC?=
 =?us-ascii?Q?1gNHc5e14J1QLQZ6c95dzNXBiOiH1TbsygJGZqLRnsBxUoNQ3eaSo0Re1fFW?=
 =?us-ascii?Q?VwW8eTzgcWEIu/ZPG5oaFEdO/E/m0fAcgcPlCdRnMnkuc90oCJOTYs8Gt2z0?=
 =?us-ascii?Q?fmEJTE8N40CF/kvG/fFkbx0fjfWAR5pPeh0rPlaDZv1+iUET3ti6vCcR7cnH?=
 =?us-ascii?Q?zp7Hk80VJEdRkNESfJvLss5IKq9GeB3lmhTOxVh63AFY5LPpBrL+m9SNiyr4?=
 =?us-ascii?Q?r5nSF0NMlaP5Aw1OMvdF1jv8qZyCtLUS1cdBPYBk/ZSLmbsfSGfRCUI98ACt?=
 =?us-ascii?Q?EC08q3q8hVt4SbBCZfURKrXwsRi3RlplCp5Kz2wYwtTvFEt7/2Qi5YqK3wxd?=
 =?us-ascii?Q?l67k4GWbT+WFhbeZo2Puzv+LDkD8ketgV8hkBqmh0vdNO2MOs8poPw3/NxId?=
 =?us-ascii?Q?mHeuLUS2gE6lxeAJhbuYkJfyIlg/9tqlOwxe9K/qQqWgJeW5/zI4lMRp0YQG?=
 =?us-ascii?Q?vYmpnmqD3+d+ZfBAUIt18rfCaw0GP/oxswESeIP17s3GbvRf5kSyz1eYrrZn?=
 =?us-ascii?Q?2KA8Nb0mdsr25KLNkwdxZdx7lS8Oz7HTJMULwI+Y+MCQca2Q1igkozRE5zaE?=
 =?us-ascii?Q?WDf+1WzZEqWQJyJ3v0O5FTYnh3nii/aG8boi+AZ80w3AR2CFss5e/iDFH2gx?=
 =?us-ascii?Q?waLQgLWzmwEDTYAu9Xj/nyjYJSFNYrMm3QwWcvEs1orU3ZzVOLvKE6rXXK95?=
 =?us-ascii?Q?pEW6TpBNUy2rVKO2MNUv3L79c/tSBa+iOZOILGmmmB512qfxqlE2nmkJ7d7b?=
 =?us-ascii?Q?PkzuMS9hKl8ygelqKz1p90qWi3dvGEvKWW/qhFen2SLCCzedd2z7+ecXLUTu?=
 =?us-ascii?Q?8Oshpl6hZpKr/w4YN+ZBwye+yVTb3qiYPGovWwGH68pEQLIL2Uj6BLbHBVsS?=
 =?us-ascii?Q?ELVPEBXa5Llymcu1pG1O69T62KAken8uBvHmjXajnQlGGB3UQ4iigHxpK/P2?=
 =?us-ascii?Q?mcqqRIi9eXc9Hy5KvOLgtMDpmWe6EOGFKJqvvLJCNsm2kmztErxgqTAZE+be?=
 =?us-ascii?Q?rDy0l+/N/fS9jY8FEs9jRVFKzpZkCrp9OuwJ54iHpUr1G4VucJriOF2qoj7b?=
 =?us-ascii?Q?Rj2eldKTC1iJLBCwox/X6augpgGKEfLGCJSlqpuK78lJ6WCOsuz0ZrQZDdAt?=
 =?us-ascii?Q?lMdRrdF26JVvmbvrGoDoYqZjRDaPiSEcaVtEGT4DRXL3V1a6ARD0W19TercG?=
 =?us-ascii?Q?Qnr6bX4gkc+Vi6enGVCNsY7t0FC+dt/Zn6+5ZIwpatJAvVlPLFIrfZrJ88g9?=
 =?us-ascii?Q?CEa4G4bM3tyrK15AYSZkpEdEykIkMYwe48ulA714HfK2rbkbFe67lmSweA?=
 =?us-ascii?Q?=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3178ab-a586-4348-4ef0-08db15dc9244
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 20:28:49.6339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Xq8PBmoCvkbq9SMlJCUrVYyMIaWGo1YetcBogv7UiFSi8sUVR2Y0p/lFuSao62mTCHUUopYLn/056092MW6vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5302
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_13,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302230169
X-Proofpoint-ORIG-GUID: cSysBaucM309CSmDlbw3xOY0UtYcT-8i
X-Proofpoint-GUID: cSysBaucM309CSmDlbw3xOY0UtYcT-8i
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Wait, I figured a better place to do this.

init_multi_vma_prep() should vma_start_write() on any VMA that is passed
in.. that we we catch any modifications here & in vma_merge(), which I
think is missed in this patch set?


* Liam R. Howlett <Liam.Howlett@Oracle.com> [230223 15:20]:
> Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
> 
> * Suren Baghdasaryan <surenb@google.com> [230216 00:18]:
> > vma_expand and vma_shrink change VMA boundaries. Expansion might also
> > result in freeing of an adjacent VMA. Write-lock affected VMAs to prevent
> > concurrent page faults.
> > 
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  mm/mmap.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index ec2f8d0af280..f079e5bbcd57 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -674,6 +674,9 @@ int vma_expand(struct vma_iterator *vmi, struct vm_area_struct *vma,
> >  		ret = dup_anon_vma(vma, next);
> >  		if (ret)
> >  			return ret;
> > +
> > +		/* Lock the VMA  before removing it */
> > +		vma_start_write(next);
> >  	}
> >  
> >  	init_multi_vma_prep(&vp, vma, NULL, remove_next ? next : NULL, NULL);
> > @@ -686,6 +689,7 @@ int vma_expand(struct vma_iterator *vmi, struct vm_area_struct *vma,
> >  	if (vma_iter_prealloc(vmi))
> >  		goto nomem;
> >  
> > +	vma_start_write(vma);
> >  	vma_adjust_trans_huge(vma, start, end, 0);
> >  	/* VMA iterator points to previous, so set to start if necessary */
> >  	if (vma_iter_addr(vmi) != start)
> > @@ -725,6 +729,7 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
> >  	if (vma_iter_prealloc(vmi))
> >  		return -ENOMEM;
> >  
> > +	vma_start_write(vma);
> >  	init_vma_prep(&vp, vma);
> >  	vma_adjust_trans_huge(vma, start, end, 0);
> >  	vma_prepare(&vp);
> > -- 
> > 2.39.1
> > 
