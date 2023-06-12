Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F40772D015
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 22:04:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=2w7x+fHi;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=lJVxcoGb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg2ht1494z3cRq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 06:04:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=2w7x+fHi;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=lJVxcoGb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg0LW1ClWz30CT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 04:18:41 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35CHO1KQ024288;
	Mon, 12 Jun 2023 17:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=cgz0Pqo0z3mewMnxonvHmdXAINl2w+dcNRbuBdBCM44=;
 b=2w7x+fHi3fRFBAu33Xy3pysuJxpvdZN8bJuNeijbh84hUlETZ31L8U+buqJDQl33pb4B
 pkUz2IroasuQdIwPQLYTP5ZDFTUPkLpbZBVu1RXKIObSHsBEoD1XlXZvGJi8FNQKucg3
 RmTdYxsnk14XXdKIzakegFd65QwfPclM5JDlXciAl0B8QeNkkkUWtD//m5iIXgQLGV/7
 UNwhxCf2109Q6WcC1Y8j4eAxzSJlNZE3P3a+vzlaTOfmlU2pdTKavADnailoINldHFLK
 QJttNYXMjtMxn2yIeGlKtxit7+DdzoEjh0t2kF8XBKk0l2O+FCzyv8afqdfs1YxngQ/m SQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4fkdkf2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:45 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35CH4Ml8016344;
	Mon, 12 Jun 2023 17:28:44 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm32y0u-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 17:28:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aB8OnGbB1o5gTnyfJTOjc7bhZ9eH/gXq88escoy2A7J0FQG9GFdeNThlnLSGlmW6fpsl7q2YGJ7ZJDVHhT7iXXhnhBjWS7rQzotaRA9Nka8X0fd8AwRr0hC+TE7+m0Ta/SRLgL9ADcckE8YREMTMt5BOH2TMTDUqvhuYMAELX7h1VvGwSUafJl6J2Gt2M9ToC9aBrvJFv3ZsZdwGhcZvB/e3CF2LL4+ZYg86Lhv+oPAMejLFbvKt66JdOSoK8H3n624/Zn4gyE2dgW2z6emq5mNcP2B0IerPMuyt/ZPA1Up4dHayoyR/6SWDOOs0OX9GcLPj7dnV23RC0P3DeFp6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgz0Pqo0z3mewMnxonvHmdXAINl2w+dcNRbuBdBCM44=;
 b=Bys8Vu0i8pKrXS2afXGOIXL0pcTJEEhWEOaMoxi5laB9tFfbE9/pnL/kCiIWLuSB07vq25WOzP5CsiE+BXx/JYq8/4/gMYBEw0tva9GUqBZD/U7yYlPW+7y/E1JALN4XJVBUA4VfG9BjFku0GA8MxyyKwDfgtR6zjftvMgHlYGusCpSlKyXHI3HdzfidhWDP+mmq/FDZq1c3CwW7HfQMALLpZ3CQlN7kOkutPGFaBITgS4LV7v/1eRfz1iVUQXqyb5RRKr2hAaz1+r4Ux4zDqYLdXr4s9hHELaytT/r9UHck3vctp9PUEjmmFMx2CVk+Qbws0dSKswDr+LKSJTzoWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgz0Pqo0z3mewMnxonvHmdXAINl2w+dcNRbuBdBCM44=;
 b=lJVxcoGbLvrNYPuqFvj3k1N5oZcpo84M4FA+I+THC07n4+FAIGxFfhzOzQoSOx/q1HkTekU89Eks7RrjtATCTdAvZ0DATOcfxQhrLmbT+PR25Nwb7Sdq8HVr6Fb4fqZYI4jDIYV7usK8onTkORkNfdulZskOVxgwQUNeUh/FX2o=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MW4PR10MB6509.namprd10.prod.outlook.com (2603:10b6:303:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 17:28:39 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 17:28:39 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, 86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v1 09/21] parisc/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 12 Jun 2023 13:28:01 -0400
Message-Id: <20230612172805.681179-10-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230612172805.681179-1-eric.devolder@oracle.com>
References: <20230612172805.681179-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::15) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|MW4PR10MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c688f1-6d65-4130-5ff3-08db6b6a75dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	BarAO8VK9+U5pdfVurPpkQUmgMluDDAbs5KAwqPMmArhD9r+E9bEN/ViN3JwUgARM+UHQQ6Qqfaxue1ksJma79LY9o4CFyYeEQepXR1RIm+t+wmEMb2Ud2CJSFkNVjpRaRYp9SgSeOqIXxSQ8S5zbi9H4aumwQt7PbXHovhFpv74RPqA7LrargMIDtA30eBKJwkCKqr1cxPXqS9nJeC/7m5ajyof4JmheO4YElTmGfH/iRLKo3S2qV/lqTXEsepZydODVw5LtkgwIjZQQog+v+4gIdBHuvT2jLDWkDl1WulabfLEnYKutNfdZ5Fy+omyZuJlrHDBcEtjSJxtAyd07kvYlQaP/n7z6ALSIcUKyzc0dtln2Bn5YNEKGiBFL425Hye6tj1+3rWdO3cv0Y8jwoWiLt7PsDLXAXctPJnacqmOcwwRV8VCaIZ4Pmyd3BKUFR2MCECj8jsk71GMV06Qscnbsm6Rv7gLReQtUgSNOhX+Wdheo/L9aiM5tqzkOZOSii0m6veRkcNYwFID9aBakSJhkoiieNsGKqklAfdLCBkDK6geAstwDQcNWSsJ6fFm1i1dB5hNObPK3iyPeVxWVTwCVSOvLHUwU3vzS2d49KM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(66556008)(66476007)(66946007)(6666004)(107886003)(316002)(4326008)(478600001)(86362001)(36756003)(6512007)(6506007)(1076003)(26005)(83380400001)(186003)(5660300002)(8936002)(7366002)(7416002)(8676002)(2906002)(6486002)(7406005)(921005)(41300700001)(2616005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?FLmm6+mdKlQEWsaQmagSKJP9YvvbII/Pfzh5hsDohYCneNZObzN4wTQ0d8ca?=
 =?us-ascii?Q?RiLcOWINjkVaWa58CVB9Od37KTWVmzrEWNkib+a0KsSW9Y3voNhnfaf8eT34?=
 =?us-ascii?Q?6lleGoGwjEY1u5aJnyKZLjqPOsQEjDaUmkHeBwJc+yGayHqszc7iMJ1aEwMm?=
 =?us-ascii?Q?/fDry57s5tNWFZRDQrsj/t4cTe7u9uKgsGgH5+u2GKtxddTjbfK4Qmigx+qS?=
 =?us-ascii?Q?2vqM09pJdSQ3sw0KOcSsSgTdHOIVvI7FS7H2MZedM/isKyGkyoY/1TcJN5py?=
 =?us-ascii?Q?/CHb/nW8AnrvVYOMpo/RgqDMB1qdlN/mj0jvX8vjcYpaUTRlc68ZzvjkMLz2?=
 =?us-ascii?Q?XOF278HRaHle+84KHe0vzSQ5XQxdxs92pzVdDZF5qK4V41PLHLOiDECsiAJN?=
 =?us-ascii?Q?saX+p/jlesvghrs5A5Bx4VJBLZ2tyZ6lb8CbWYIMeeL5Ho829yh/Q7s85P1g?=
 =?us-ascii?Q?O/tCD808NPy9olaTtziTantwf0aUJQZM+z5JNK/QhDkqIRFeroP4z6zCVult?=
 =?us-ascii?Q?MWedTQcCLVSdP3tPtz0WOamB1yg24eGZdR7V8aricHAygZAELeI/DKYsXF34?=
 =?us-ascii?Q?fJL26WzJrjcEt+7N/9YTknufl+7y7k+1y6dzsAcwbFcGbTL00qw4uFiNLT3L?=
 =?us-ascii?Q?PsZCFhW6xFAcHzqfAq7pZ34G5Zr9gSMUpa6Vdz1lhSnAo50+QPVYDNX2jdTq?=
 =?us-ascii?Q?OE/3hjMLLx3g6VMAegFX6lGF3Z/a1H7R7/7X1UPgHBD8xYc+Mdb4B8mw/cP4?=
 =?us-ascii?Q?I+CD8JPYuaWjT5heE9U5FY6RnSY0FVrTSyzWX6KvHWxFvHQuAzoztsOydQzb?=
 =?us-ascii?Q?KByG3Ou/WUrY5y4jZgmmojKnWha4V0zuKJkkWGwvVlumVMMbin0lASpvjKl6?=
 =?us-ascii?Q?NC7UCW2iPVm38eMdHSoRbmKFAPEYfqys9JUZCFuKUdP7c+Vh4IKfaif1D91K?=
 =?us-ascii?Q?Qw+egZCf8ADGw8to1gNcU3CpRbaesakUT8jWXJnXryZ8ZcuJclRzQG+PmTKV?=
 =?us-ascii?Q?e8ZUTNEK22A09r8484CKLTRWiXV1fD2BbjIkM5YfF/KmN6aB8BdK0TGUcX3G?=
 =?us-ascii?Q?qYFAh8YFD8aD+RR61T5CIQe5io9oM9w9Vs74OqhqL+YsKQTAv749Ur6Aoa8i?=
 =?us-ascii?Q?k1zkkZe4p42m3l2yRUtGthb/aXoawJ3RRJLJf8vbNuH6Xv9LwmXEwuHcVTxa?=
 =?us-ascii?Q?fjdPsDH2vrWJPtjSpoqzAiWL764ZpvelxQpsZq8IPu+XdI5QNO6TrBFSaQ3k?=
 =?us-ascii?Q?1ffEX/NsS8khbCYJulavphHtVOHa3A+Io1PkPri1w/Ds/b+GVai+cStoQEG8?=
 =?us-ascii?Q?Of12cU6YpKvsoht/0szWk9slPPsSN6DhjqEGn1BR2yZGd99JsH5B3aZEA/33?=
 =?us-ascii?Q?sSD6XQtUC7MlevKxkFwDWsftYj/GHa30+n5F9M/o3OwdcVDfypaJK01ALRe3?=
 =?us-ascii?Q?M2t/pv/A00fk3/2/rRibCF7itRv21viPWM8pzJeGTRFayDvYza4bBhx+zB4S?=
 =?us-ascii?Q?sKQwy7QWgTL5sHnUPOKM4DvUQsk3aQzXo4lvp+sxpAeKFR/VFx08eWZONv5U?=
 =?us-ascii?Q?aZVysreR9ud89f3tlpNGMKwgIwyH9kqlovDDonlWBNkSqFa9faiP0Qy2B82L?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?m2XQCmPdt1cMKIZ5d1IdQghcuT5aPNkXBe3K69WO/ZBuo5iTVZr87X2bHSwY?=
 =?us-ascii?Q?6zAuaa6kN0NpNLABKesEGDNf9RR/Y11bnYLlxKnIlVkzXGOs+6MpXkafNvdT?=
 =?us-ascii?Q?dqLycavPKi6LYH54YxgKgidu352noMowvOi7AIZlXBGkOjH3yPEc1Wv1PJiV?=
 =?us-ascii?Q?ZgrtMVEOM0S0E0Q021bat/gDsyePLLpuJfihI3i4EVSOdKznQJosj+JYa/94?=
 =?us-ascii?Q?geGLX8mZCF6dR3RJDDhUNKjUDkzRYAxXXNnaUhFLHBW3DA2ComQ/kLakYoWA?=
 =?us-ascii?Q?cH7pHD2P87zsketEog0K26Ix3bEXMSrabEHPs8IV59VB+Na0PSi9lu1v9Yq9?=
 =?us-ascii?Q?r64xxS5JpAzOuVTPaEwNpbUT26XOqUYLZj5TlfvJvLFg/q+DZH0h8ArK0mqC?=
 =?us-ascii?Q?hEvWVrA6NLnZJH1toIfQmlFx99KRLL94193QlUenUJmw4MMWnOUUtDsPDBae?=
 =?us-ascii?Q?Nu+OAHyBt4980fm6vVD3HvTEzNFOGLH0/TLsLEjP2YBwEN74uytIE7FmgLks?=
 =?us-ascii?Q?omFq9Y6AhNe5muRBhcQ9wjgwLqqtqX+4IRI3WsrLYf9XpmfCKrMnz1Pa4YYa?=
 =?us-ascii?Q?lspBf93ish/eVD4Z9j3TrBxuLfYSbMs3yG7RLN2KRRyuXjv80FZnRRCX+E/G?=
 =?us-ascii?Q?zI7U2PciKIh4E/8fEjs1s/3YA/07eBlaehwf60HkesQwpkpyMj50UXVwFbYB?=
 =?us-ascii?Q?Pb/CyNXvy6RgCEN4bK0ytcJLbi18UOEqQh/1odWnFFRu6o6YPU3CnhoJ2Wlf?=
 =?us-ascii?Q?oQqEimePQ1idzG0aXI25cN0GFLd0c9nJIk3NXO3e9DS1W9TpfFyiyG8d+YhA?=
 =?us-ascii?Q?ZSeHnvAoiC5HKWPevOw2k5jbkTSmPQ0tP5A4NrinlIFgqhJjajRfTAHZDqzh?=
 =?us-ascii?Q?Y5NxlhDRpozTyjYRUa2mHAAk6Qr0wIXzXl5wBGY6Sr8mXGAddcGzpaQviNSF?=
 =?us-ascii?Q?ZzqE4Q6xj7OYsygtBJ5JFsgFbtr0Y1CEZQVrOB8MWn+2yu0xcL2UeG8GEdQw?=
 =?us-ascii?Q?CWcKAEojQUiSwTzzIwlY+j91tLT8v7InrcuvGN29l3V/HSMhkkBF277OGBp5?=
 =?us-ascii?Q?DAGPpizdEA3er7gJck7BBmbrEbuTMP1lZPX/5NhuFzPNUzYkbQzxJsYFSiR6?=
 =?us-ascii?Q?a/JdzoSC6Bp9lLj+RCUeoj1YUPg8I1uL1lpyhNvz3ijSB+JgYzwev+001ySH?=
 =?us-ascii?Q?SFbupwPvzQQlp+V5T3tOn2Mn1z622z3MWqGM838G63HJMG24Wdi/L1j3vu6w?=
 =?us-ascii?Q?gXqFt7bOcQcZogy6aGvZzLH7csiSykv4p9kBCui7F6PQvHeshUXoqQHa5bBy?=
 =?us-ascii?Q?17eUiG12fgIorh42tbjpIGRRVWrlEfJXD5Gnzg9UZ7HokJQAmumlAamaUd6f?=
 =?us-ascii?Q?NXSohdhE288JyjC/P64Ga7AHUB0CBvK1h72IXTfrzmBhddwg/O6WEvxAHyUq?=
 =?us-ascii?Q?cxbn4XV46h8iiqXWjB9Lu/gSiJ0OkA0CUqNJ7mJ4O+ZARjhDAHex/DSxzHT7?=
 =?us-ascii?Q?yiBKhZgHEPbUz6u/0mRCqw3T1OtriVHN8GNOVxTmmgxSOn/IPYxzJdmQenZf?=
 =?us-ascii?Q?nyMLRIVVAQoPHnK2mC51gAHZZKbsKffVQr4XZkTJijVWoiPJdhZZPOI5WQhS?=
 =?us-ascii?Q?6sXESn/Hua2nkkvzB8RuR0QAFySe6qXdt1Fjcb7pVVIFMgL4lfGZmgiba+9n?=
 =?us-ascii?Q?gdEujjn4U/ayPH1n0PMdBlrKqhrjw5GMkG/D1GpzF4XL520l7qVyJHcudiuJ?=
 =?us-ascii?Q?V6Dr3Zi1e7whAyhGxyyC9R82z/I1Z4IMyMZbco7vbzt81e9PVE31mWF/X0VQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	5E8b/HQIu0yVglqq74D4Fa60ku8PsYpQroNGesCLtcC6YpLTAHCeaMU8dUaJx+J23MwjGoER6nYjJC7e2hqnVQohh9zpA6zpsHwbZUXLuu2SDP2EFiOHH8WFLcGqG7mfB/wWVvmOx4+lcNIwk5w5nkZ2IBhszLIV6x6jIppdtbHzjVElKMy428q4RiPTKl2bjPFI7YooYZRJattGQoE5jvBT9mAtjqVnP+OSIaN6P4JOL/gQS8meFxKU6vbjeiIYeouJbyqu4h11BMhl+xBPkduMMQ5o8E6V+ucBEOUeJ8/Dvr2qcVBn9zA1sp2KYl+zUZEJCXv2SjF6oqEnRnB3BUOQkO9U2/zIZL5iblC1BrJkx87JPpKz/HNJJDVxGSlzAo6vHeNrQn4g8ahlHgl/yZRNWFUbZm3hJkZJK2HzWTVsVvxuiIMU4DrkfFs363etgpwQ14hujUEf2g==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c688f1-6d65-4130-5ff3-08db6b6a75dd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 17:28:39.2838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HngDuhE7NL5Flr5XzUeKM2Z637JFND2xtUyYIbwWsvkPaJ1LPdmYZ6h5xUJD+946hNo1wXYZKPH8sHDdX3MAnjYodcK8xKP1p3Qdi0qCSQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6509
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_12,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306120152
X-Proofpoint-ORIG-GUID: le2-ubCLW9-JgL-MQrNykcVTf4TH0pZw
X-Proofpoint-GUID: le2-ubCLW9-JgL-MQrNykcVTf4TH0pZw
X-Mailman-Approved-At: Tue, 13 Jun 2023 05:57:01 +1000
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
the ARCH_HAS_ and ARCH_SUPPORTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/parisc/Kconfig | 34 +++++++++++-----------------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 967bde65dd0e..36c139ce9f5a 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -348,29 +348,17 @@ config NR_CPUS
 	default "4" if 64BIT
 	default "16"
 
-config KEXEC
-	bool "Kexec system call"
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-	  It is an ongoing process to be certain the hardware in a machine
-	  shutdown, so do not be surprised if this code does not
-	  initially work for you.
-
-config KEXEC_FILE
-	bool "kexec file based system call"
-	select KEXEC_CORE
-	select KEXEC_ELF
-	help
-	  This enables the kexec_file_load() System call. This is
-	  file based and takes file descriptors as system call argument
-	  for kernel and initramfs as opposed to list of segments as
-	  accepted by previous system call.
-
 endmenu
 
+config ARCH_HAS_KEXEC
+	def_bool y
+
+config ARCH_HAS_KEXEC_FILE
+	def_bool y
+
+config ARCH_SUPPORTS_KEXEC_FILE
+	def_bool y
+	depends on KEXEC_FILE
+	select KEXEC_ELF
+
 source "drivers/parisc/Kconfig"
-- 
2.31.1

