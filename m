Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB21F73EF61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 01:40:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=kJ8n/nuU;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=X6tru7ll;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqkq44D3kz3bv4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 09:40:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=kJ8n/nuU;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=X6tru7ll;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqXwZ3n5Sz30fD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 02:14:21 +1000 (AEST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35QCoQIj022656;
	Mon, 26 Jun 2023 16:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=YNDNDDgTUsyPXRQgSEG+d1UNHHXH2zOv0zQdKf3/Jyk=;
 b=kJ8n/nuUJDDK3i+8etpqhbrj1a1ChBWOEEfJODqGa4U9rVgfuR7o59MhTgCswqifFdkX
 waW0mMtSjkIFA1G/uwimARyC7WOdzKJJgAwWfO/LSkYN0V3DPRrT68t/AvVr5Txb6iy9
 fhlDGJqZFH+Vx/w0xTgBp1tnQe/nN0WJ8Pq3K76r7LtDHCD4MWXg1oiXK1t0b0cWi3JD
 ylJR4DaEQUFvglhOxWqPGdzyA6GDtEYzJyPy+sKxr5KtSjNxMKT+SfZSfnZACHQdbRfz
 7WWOhwbEi6YHOk15xZ5xcZJCLXc9JkLgEbRnfh3I9cZwBlzUW5zgVeJddsicHYF5wllb HA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdq9331xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:03 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35QF5391011157;
	Mon, 26 Jun 2023 16:14:02 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx39vtb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jun 2023 16:14:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+5oiDESQMW3cI4bR5twXyjtP5hJXjs+s6f9jVGuKcBN5+XPMMoO8VqrpsABLvJi8lmJP9q5qyLOyMWn3myF355SkpTbNHt3wQ/tksQD6TPC3/axsVPr/u0t+g09nyu66R1ebgC4aJUKksaFWQ68l5+mplwYBmFW/aIGo0zJyLf/W6og+Q/aRNabj9tDAMbs/JFwDnDzhnMO7H+4/0mYAUj/yG+pxn8KHGT0MbEKlw4nMAJ3rtLRfRRoDk9+VbqwmOogxyd1RRCQiLNF5NN830cIm/cpS+vXz+OEwpMcFU/sd+beEstAHBo2kDVa1kaYsMx19FftoiBmU5DoR3GMxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNDNDDgTUsyPXRQgSEG+d1UNHHXH2zOv0zQdKf3/Jyk=;
 b=O27+wzfpmsEzjH7juIkeCsfdG4PdlqslXHw3YAk+/f6TDzdsBO2bbxaF+JJWayu+5Hj83bKurbAIOrQlLRfvZEVnoLaajfizxcHQGdEdtVdL5DIwN/N5uHIEkAKoqPbnILpiImLhTtcRt4hRGH7DJdqekqoq/7+mOaKfAqjRZ8NUMHTg2CzzYBFSOPHiH/Z4AnpBvhpm2l6Voefv47W05jwq6jifRXkrfmLHwL5vBgg+t9bWPuVE5OEnTx6WcLMkIM5oIsE0UPvE10SwfYPBS6A+bScoI+6ah7d2a5mZ2yy+lWAiORAPyTiTBos7nPhy7X5zrT+8VWAdUhVzEs2aFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNDNDDgTUsyPXRQgSEG+d1UNHHXH2zOv0zQdKf3/Jyk=;
 b=X6tru7lldUEez2tryAPt15e8PclrVg64E1DSfwQZU+zxJdVxZrXrJWp7zsnRQxTH6Ubqhz8z5HH/qLoRj3hqUDZD0yAOK2uG2uAAPVUg5Zlw05MkEEGIgnVno+S5kLIKlYBcgjUopUkKiVTebsbLPZJmk6vqEhEioOioOnhgvsQ=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH0PR10MB7440.namprd10.prod.outlook.com (2603:10b6:610:18c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 16:13:59 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 16:13:59 +0000
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
Subject: [PATCH v3 06/13] loongarch/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 26 Jun 2023 12:13:25 -0400
Message-Id: <20230626161332.183214-7-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230626161332.183214-1-eric.devolder@oracle.com>
References: <20230626161332.183214-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0093.namprd04.prod.outlook.com
 (2603:10b6:806:122::8) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CH0PR10MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: c7f6db8b-8381-4c07-f868-08db76605963
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	gqBP1lAs5xheD3eCUi+6tEnQ3tzGUSTjoZZ1KaZ1EYFCDTt5DK3R1hbbF7F3syyEMso/cqtLKokP08xGNe5ZPnXkSokP7aWyCkelepiEkUq61xxYS6PizMSaT9nllPFgImX8+hOGWl7v9hsNrDxBeO/rhYruhPrmDn5F0F6AlCjKk4s0LsWhKcKYoJpudR51nLwQ2aajf7C8VcY1DJ14iAkeVTaH8Wf+QlAkoO4yfRkSMKQPeSSASKQmHZEBgUjV5nNZcaL0aKUQsWNX0HY7dJ1GFVi/FE1cvuciJnFuLw0ltOneFqNhWddn9BseJHV2rC39T+Ib61bXiO7aCSt6MzBdQb/Y25EvIRHGe83p6SPz8ezzIdIP4c2rUcYzh2fB30qJSuJwMuOTPhjYVGgl3J0v3Vqq0BXALpRcqKWoXeBv/JjLV/E57BWcUtQMYxQN4v7j2BV539JWGqQh6e8TlgxlmX/I2jE6AiB3DxzUKg5Ux1iqVqE1QEi2i+XvXHzlmMORsPfmQHPni/kwUz0fSy4XXi3tftyfFtsqEAEV0k69r9a+oHelhgVhsa9XVqL8a1i86j+j5BaDUOEfuu1ZeeqMrBawCEBAcZPpkiyy5Gk=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199021)(6666004)(6486002)(478600001)(83380400001)(2616005)(86362001)(66476007)(107886003)(1076003)(6506007)(26005)(186003)(2906002)(6512007)(66556008)(921005)(36756003)(4326008)(7366002)(66946007)(7416002)(316002)(8936002)(7406005)(38100700002)(8676002)(41300700001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?GjzfC9M2IOCkxw3SW3T0lxeuzx9MyJlY/mRh0/ITSBMO6mZLk84Wvz+xUiTR?=
 =?us-ascii?Q?ETQIh9Uk2hdhobMhPvH1AH5W1V0mb0rxMHGUQdfCR55qeRIPsIAOqebNP9Av?=
 =?us-ascii?Q?MtLgdo4ZRkMdqXuxNlNAbKfIUsYOKGrj5YauVc7jwyQEGXA4KuVgB+vcsBRb?=
 =?us-ascii?Q?3R/F55epgFcC+zJql+zYC668uHv4yQLjRb8/hNiFD7i+7c6wE5M9qHtYJjg1?=
 =?us-ascii?Q?TDHbkvVNZITS15k17+/0TmFdfFKIw1xBm3ror7m01nyeOI4yCAsNPRNqaFuy?=
 =?us-ascii?Q?ZsTVi64HBEssBKGdU/QnCx2VjkDGqq5UapGQqT9oklVHKhUNnF5oO7Prnh2z?=
 =?us-ascii?Q?VPsst8GnvTYliDVUzMnCUh8jmG+W+W21JLP4WviPxzmxXYwa0buOm3r6U24o?=
 =?us-ascii?Q?3tMoDdVmIisq5M9JdbMKJe1/8ChfEVJXeRET7YMDQiVcGj4qRJZk4pyTsm8f?=
 =?us-ascii?Q?lWe5jSOUCL8/TbP2zoX/DC7S/MLRTT0GPEsAmZvPoNrrx53+KMnE+xUMLSn+?=
 =?us-ascii?Q?vMqdH6xiduTCK5e6JZwBBpFk2+mR83+B3klcHYRCr5cv/eronM6j8hLJbc54?=
 =?us-ascii?Q?/hwca4xwMlLuH0sZjYMICMr7OIs9HpzEDs2KIBjF/0do1AkoerlLmnGrAapA?=
 =?us-ascii?Q?/iqeUq5m5plluswkfRMqqbsJvkfL7C32GYX/5cldDGkmq8ZRLAyI3mcN+o2a?=
 =?us-ascii?Q?Ca3c2V2W/HnZN0xfFwI7bv3TtYlolD1Yig+MxVUtX1dBPD9WzLWBxHXyA/hT?=
 =?us-ascii?Q?Xwe1wAHJ3dKZ6KJDd3Rg+9D933ql+z7NsnalNz+thFUUMJ0EOGgFnqZyk/oT?=
 =?us-ascii?Q?4ylmSxhpkVt5cZoNhwX1CTAWTOc+lHO4niN3jaDNZaTS2fue0im1wjES701R?=
 =?us-ascii?Q?hEwVQA4W9j8BRsjSOVHdla7GnsU+SSb5qK6WmfNUGaq2xZ49iXXJXu0OjV/N?=
 =?us-ascii?Q?texatIiAdbEK/PDTX1MWBHESomR6UdvCvRxHCUQACfpS4vLT4QJurGPsneBr?=
 =?us-ascii?Q?wjrMy8plJjYWGFPj76WDPRngBd7EC+Y2cQAFupp2oqWOLbk4j3S+qUkeujwQ?=
 =?us-ascii?Q?Weh2l1cdIYwTY5oVIqXSs86t/dBGjaT0jOcP1p41UZ+szl44uWqhIOdKAddF?=
 =?us-ascii?Q?jlYHSKMadfs8UTKYP2CSEfAIENfGt9BH1IuSL53e2UYHYQEngQ+s6axArlal?=
 =?us-ascii?Q?2sSyhzU1lHhxGzv86x/IwRd4DkAj27UgaJHg3+fFnRphtQL1B9t/5NsAOfjS?=
 =?us-ascii?Q?gzBJjUnhTqWMaz7/hJ7osxpweUsgaqE3snPdOjae554XjuG7aBU7Li0votCH?=
 =?us-ascii?Q?FzC9/7UtGnPvsXPXoWbexMPJn7O4AqEnH6R5VU8cGoeLvprRnewVd5CP8pB2?=
 =?us-ascii?Q?AQKHf84Djzl8ZrYAwGibSnZzDKeyOLKTCq6C/Iq3bVGLknU92SJLNnysVtoU?=
 =?us-ascii?Q?ewbU1vRka0RxnWz1pUyLM7vfRNZLwsRRZvbOeNIRwIkm8wRZpCy2qVzNZK18?=
 =?us-ascii?Q?JJwGskZBHmZP+r2VTU0QeQEk/kcq/tslRUPbYrY/VWUJlKyrUw/koOXimZsp?=
 =?us-ascii?Q?jojgoiJGC37cxev5ZojrnUFS6c8cOSKcpt/eN9IJwaeWpSwRZ0FY707AkhWh?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?YiC3AhhM53l53TkZ/5cGNFX+YDVtfe6s4yr/T3XUUQKnoomPAhR4UqremKA4?=
 =?us-ascii?Q?vZGQoEYw1h0AoA0uU3HVC3f8YxPsn+aXW60+TavwJJZ+1zPUZhYr4u9p19qP?=
 =?us-ascii?Q?UaGimj+y6kgSGjsxdZR0wLJFxogA7oxSbjOTJpq/5PfHPH8z9senS/9E4OsM?=
 =?us-ascii?Q?1MjfSimnzAjjwyH8CPIMysWP/xqebrO8WcxAnESf/S2sdBO47bVpoiVsMc25?=
 =?us-ascii?Q?DSPa+T2jIORIxVhXh79Lr/9q3Jr2J96UpQ+sK3UZuUkOTH3q1S8Bv7rvEceY?=
 =?us-ascii?Q?TA5V4PRt1Z6bcQMY5uARCcNyBjMY70IvVRbh2cvWR4CnEcF/ZLngRPOT8U0/?=
 =?us-ascii?Q?JDjlse4767AU43pkug+151qXEvdf+iS98DNfrX5LntTocMtaboBlvGX2aWe0?=
 =?us-ascii?Q?syYlPm5rL1N7j3VXfUkn3e7NxPiuhxxEzug0EkYH1JRG/UxtQ1bi2F8lcR2s?=
 =?us-ascii?Q?UIGR/Jbe4OYxfnNfo4m0OiW3p4z2LzP13cNkBdCHOaTwK+sHkA6tQx9rwce/?=
 =?us-ascii?Q?V4bGLFoMPFHd9dx8QTfcJAZE4+FBlIa/k8lTmEsHitB7stgS69g9sRmWg73e?=
 =?us-ascii?Q?w6PQ5WXnEtJ1GnXf82IjWunaR2gUq1hF5/jCaF+hnsAy5agPZXVL7HuhMhEj?=
 =?us-ascii?Q?4buh9xPBn3RNWaLfuZFDlU8tRAawScJ+HtLIvqyjpAid6asGtdD8btEl88sf?=
 =?us-ascii?Q?ixd3AHc0PLYVrEyOiW3MaJoDcJmzGjvkp51rMm+HHnYxHl7sxRaeIMwXBVZ1?=
 =?us-ascii?Q?WgT+StXGed51xfkILGnw7COoQaQvb8Ws5Qsa3mD25ScDKCtGBmzAMofHeKjC?=
 =?us-ascii?Q?Ta+skhMGz60aaEU18SpzqLaI31T/ofVr9xq914E9REot2j7Kri56fbDENyCQ?=
 =?us-ascii?Q?/2oXC+Dxqa4X0T0CLR6FIxVWx3F7hCUxLGgRT1QqeiozJoHAUojZsjIn82iY?=
 =?us-ascii?Q?GuVkP9J+t7nUTz5kfpSuBZ3RMoEocrKapQDLl76vZmHi5OxNmi8BQhfBGUEU?=
 =?us-ascii?Q?Nj4Qi0s2FA7SpqlNg3/lOUoGmj48in7KSNx/wgw8+EsYw5chtRHY5UlvpDMC?=
 =?us-ascii?Q?EGTYy+RYXELf06dj14aKJEkPHhSzHpTv0TRTh/Ys9OF20Obhk3N9XYrGpjzd?=
 =?us-ascii?Q?wAwXmaR/4O5tk0NqSUKXcX8GaXQL38d9BAMHKAiVLxvt7UJzAGgMLKoNsEgg?=
 =?us-ascii?Q?kGqlLi7d9YWrak+xpN9U3UqKvnfL4HQCdF8P8NQRalGTnr82O9Bq23flxMtC?=
 =?us-ascii?Q?5HAfJX5PsyPqbYus+imAqf8buGXr5F3ueQfz2lCp+PJKwzb5eP/PnXhGnBp5?=
 =?us-ascii?Q?w20GR3EtDEzeB84t05LuRj7mCL8Vk3kJ5OwlAIob/EzBtm7yRrByMw0sS0eD?=
 =?us-ascii?Q?GeAK37gb6+yx293zQtQp3qO/e4iB6qhVUeg8tw6CMg3Rksijmwcl++26FNot?=
 =?us-ascii?Q?y5KWKuE7SBs7FmOpNMQeqxjOuR1ZgNpH+owhHDyBUvjxtQbrmXj0D3xgc2cz?=
 =?us-ascii?Q?UHMD85oPnQHnvj0N9tYlWf1zVU/fsqS1+3CFIRw/Tc5mhyibIGEjlVjHcHwU?=
 =?us-ascii?Q?mX59WysOC0R+5khINBjiPJrE7IOn3fhllK5x0I0rTju1Jvq8QYOcLQJYmU+e?=
 =?us-ascii?Q?poZCB1buc4OL77/SPa2PcDNfWCCH0bmojjk3Mkdi2EmyQAFLSwsp3K/XaWzT?=
 =?us-ascii?Q?Paa2qbaopoIcCj1nJU7fz6h4D4l1nsmBxAVZ6izdRI+g01Ge/ySPytAC94TY?=
 =?us-ascii?Q?O0gUionzNBqroZaGfRaIgnqlMfkgliwd9MCrxYkXl/l3dVvrpFzr4LtH41YM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	C2fgUlUmZyd2xef/qXmharH+ShsdHL/EJAW6bPQ3cbd33e9RZ9VXQbjetMliv+PqG2xym8oM+0X1WlfMn3/L23CS+hRejK/SM8n0+3hE2eXdZ3+xxHeWWcJPEVIVJ3Yhwu8JDoL7KeRmfSfTieuRA8SQU1B/LejOK3466DLf/e6ZcY1gak5S7Dysgis8y0XRsTHQNIb+SXtwY1DSoLtHzPzFVvq1yJYCceLfssIdtT+xGgbJakCo7TkgS5D7rDObyy59wkjg8NI0aMJI1bzGCGf/wcOgCJ58tGuiZBANofTtNoqaWkPQEBmuAtxHnOyl44evMizdnfXxVxdNkasddop3pGB8Jiy+RQrSkRnW4Q+RZwSfOF0tCzUw/XFXSItaff6Yp7mjxysMCvQZkEdH1JvdUqc4rUQC1YCLAkXcRTd1J14vgjnhnEAvdCeCEhlr+69aBkSRG8MPHg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f6db8b-8381-4c07-f868-08db76605963
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 16:13:59.2664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfM8WtsCsCSB+qu7wsbFaezIbb6qzZeR7yYJmeCezCL7IBxbJT/pitP+e8ByJHcOHXS3TeAsE0I8vNiHJ58wmcac1OSndvu/eRxAQvy6QqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7440
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_14,2023-06-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306260148
X-Proofpoint-ORIG-GUID: Vi0d-7_eVBEOZGzcRFGVp9mnoxH-lON8
X-Proofpoint-GUID: Vi0d-7_eVBEOZGzcRFGVp9mnoxH-lON8
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
---
 arch/loongarch/Kconfig | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index d38b066fc931..3542bf669c78 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -481,28 +481,16 @@ config ARCH_STRICT_ALIGN
 	  to run kernel only on systems with h/w unaligned access support in
 	  order to optimise for performance.
 
-config KEXEC
-	bool "Kexec system call"
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
+config ARCH_SUPPORTS_KEXEC
+	def_bool y
 
-	  The name comes from the similarity to the exec system call.
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel"
+config ARCH_SELECTS_CRASH_DUMP
+	def_bool y
+	depends on CRASH_DUMP
 	select RELOCATABLE
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec.
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
 config RELOCATABLE
 	bool "Relocatable kernel"
-- 
2.31.1

