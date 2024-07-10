Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E9492DCA2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 01:28:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=HYNA0dPw;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=uw0T//70;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKDYj1mwHz3cbQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 09:28:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=HYNA0dPw;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=uw0T//70;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKDXw2mRPz3cFw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 09:27:24 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46AG1a2K012151;
	Wed, 10 Jul 2024 23:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=RELwn/p0TyT2kXn0OQvgcZT6B5I0XyukYQ0uKYW7NiQ=; b=
	HYNA0dPw/Bit8W3zIfuyC41Mp+EcIyYPZsnrMCRwSd3ASxjtC7/z7qPi5puSqtqD
	VtKAPD5ge4WDX5CsoSAZBLeC6Lopir4ys6DrIgf2ZZPSSlEkG4+aP4MC1yUWHo/2
	QjP8YusMJxqwIRM11S5FRMRyr4xc+V9qEPxH23z33ThK5ce8RXiH8E6egn+gR+/9
	SL2/o4I2uAWsXeu+TNX9ZHMrBjehOdMXEmLwO2UdqjR8k0lJkkUdtNAgKxZRZjUt
	eIQAfQuujQnC2y0fwONZUpciGcRnnxGMNF4L22PzjSkLZne27QcB2jBXjrvUSxW8
	fPF2LRtIB7URb+A4YH+GJQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 407emsysfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jul 2024 23:26:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46AMUVa3022638;
	Wed, 10 Jul 2024 23:26:55 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 409vv1rpam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jul 2024 23:26:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWSl7qXzF1SMfFNuYeYhw4MNmXrVhmnPS3RfY13Q3j+3E7a5mtjE7Hi2jjbnFbzb0Pc3roPDwIwGi2ALooR3GJ37tT8CNJBw8PJrvuQpIeFXClcQBZEYoDUSDtBnB/pBqISKkji6wMyhUxPy6gjv1jZWP2yAJgyEGnX4VllLa2bMlcD1+qxfTJtIIhc9jb32UB5aqUT4Iqll3CXX/Eibh6WKfOIt1up6+tEFrcCWk+Ilo0z2D8+T2ppIRX5N/yhfQIe8O2JtQnG+aAl4/NQouP5H34+xabau46/L408USCubom1atcayVcFXS01i7iSajxzDD0NkEksA8nC/uISd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RELwn/p0TyT2kXn0OQvgcZT6B5I0XyukYQ0uKYW7NiQ=;
 b=DbPvA8tfH8FS4Taej8hEQVWzyJ0mQ0u+Fs1ZU7i1P6CkqzI69StH3i6boqw7qBe3IpqsEArxvm6xxBEkPnDhgXyjphJ6z7Lzo/nTXea4sJdna6GElBQExItoYha2i/ILG+ssfXx8Q71YZvacI5kILl/vPjlPO2lPabtoSnA2qB2V6iuSV35FI3124IqkFKokSKrLPcapLXbiuWteunHlu/jkAKKWFL3auGhXiCXnmPn72+RkwBzQ70qdt8cIT6zKPn07wb+s4FY6r/RfOppDk8XhmejpsVpwi2JaprLhTxE1LtA44+NQTgL6mAmtqMUi/bCNcjsiWJkXpAxFPDSJSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RELwn/p0TyT2kXn0OQvgcZT6B5I0XyukYQ0uKYW7NiQ=;
 b=uw0T//70qWuTLm1Rjb+KvnOiSwLaP+Q8QVkF8rm42cKH4oYePVp7AgIwpdwpm67zm+xLGN6yU7ecck5HDfXT50TBekA3RNF4AntcFmSoKAucuCUx2BT/6DyFsArQ919/ExksiCW8R/PSwL5nftz2yJbGqFXXKMhgL5i/bS5Qhvs=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by SA1PR10MB6318.namprd10.prod.outlook.com (2603:10b6:806:251::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Wed, 10 Jul
 2024 23:26:48 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%3]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 23:26:48 +0000
Date: Wed, 10 Jul 2024 19:26:45 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Subject: Re: [PATCH v4 17/21] mm/mmap: Drop arch_unmap() call from all archs
Message-ID: <kuzulyzpa35xs7wevnklswchebc5xgnvtxpqly3wisfb7d34mp@npelpwy3h5wv>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	LEROY Christophe <christophe.leroy2@cs-soprasteria.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, "sidhartha.kumar@oracle.com" <sidhartha.kumar@oracle.com>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Bert Karwatzki <spasswolf@web.de>, 
	Jiri Olsa <olsajiri@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Kees Cook <kees@kernel.org>, Dave Hansen <dave.hansen@intel.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Dmitry Safonov <dima@arista.com>, 
	Michael Ellerman <mpe@ellerman.id.au>
References: <20240710192250.4114783-1-Liam.Howlett@oracle.com>
 <20240710192250.4114783-18-Liam.Howlett@oracle.com>
 <3843b797-8e31-498c-adff-153f9568505e@cs-soprasteria.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3843b797-8e31-498c-adff-153f9568505e@cs-soprasteria.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0474.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::28) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|SA1PR10MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 05bc352b-dbf5-4065-ec35-08dca137c52b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: 	=?iso-8859-1?Q?X2MmhvmSXddDWU3cn1u9x8T22Fc4CdfOHaoiB2w6LTyB0CQ9XIXmrdSN9r?=
 =?iso-8859-1?Q?pSArJASMhzUSMGKgdUHA97136ErIiEyFjD/90orUGtF0GDar0Mg4FL6hI1?=
 =?iso-8859-1?Q?cRjUGLJiEKm19+s/+EVO3P+m90SWTMDH67nkQOOQNNo9fvtk+3Ra9HlxYB?=
 =?iso-8859-1?Q?Rx1warCrOt3lffpBuGqH90otXQTxjfar40lcaeuq5d5LDrT/ewV5ynSQUT?=
 =?iso-8859-1?Q?UQqULyWzUV6EeZagTS7LO3lgjMjhRvTcQzPNuUuaeAHPSOcDErlZsogkv6?=
 =?iso-8859-1?Q?muYBMQsoqQdqSacPSjtEGA4KJExtqvvWWP0zTl2FA9tYvcWxHEZll8ChpJ?=
 =?iso-8859-1?Q?43P/jJS9AGxeHQV+qmKIC3yESC63NAXz+lERLMZT56njNwes8LQqt83ztU?=
 =?iso-8859-1?Q?V6JWcqDbIQ60d2uJNcEGKHCM8uxPvoCRfZf/nV/RD12AI7xCTr3eySBCP0?=
 =?iso-8859-1?Q?dVEvcSbyoH0/sZxV50YgSD8jEu0FqW/XGIaFLN+5JATq5ogfKSDOqdJPTq?=
 =?iso-8859-1?Q?MlZzorWNd2W/iAStK13TjozglDaWPukumFQS/Of4sszIU5IVEWTMBYvlnl?=
 =?iso-8859-1?Q?7BwJX2+YqwrisFEEVtw5kPnWSDX6OPad7tSRHT3sthbIk1i5b74xngrLeV?=
 =?iso-8859-1?Q?KKr2IlpGXE1hsVo0iU9QcS1ceEZfPTM6CsUwBF4HwG0B37Fx0Kq/dT9r7a?=
 =?iso-8859-1?Q?1/93lr8K60ggIxDcsW7CBTRZ7gBG5zzDnvW6ZHSTIMsPpPHf0xXkyT6q3o?=
 =?iso-8859-1?Q?gkvbzviLPT1q8V1Qa7yXb9UwfriJnQPNdwQ0PrLupnwnIzPCt9tWWJWKTv?=
 =?iso-8859-1?Q?7wmQd93DnsWWxKVn3AqDMG1AIp1iA2ho7gsdBrvxsSjJaWCJEC5nKjvomo?=
 =?iso-8859-1?Q?nDJbRBrPD6IocijqOS08swV3OZDkjrL1IcSIHhqIIXDP//ud87cG9zUbLc?=
 =?iso-8859-1?Q?R+b/IrDZHelE2XvaJWPXGA5T8FPqSamJADAjFnsUQbuFIm2kSiXJm3lvWK?=
 =?iso-8859-1?Q?JWQgHbN/DOFk/vJUmHpSMKBzDZlnH/GTDsx6415a3dwPL3Snr/wPnFChDT?=
 =?iso-8859-1?Q?5YbI32zjk5rqt9/LfALFHGXz909mDX33qh9BVD1ODMNmHvfgQGihXmvlnm?=
 =?iso-8859-1?Q?fxFuHWgUmvu5TgltMetGHBEFkjIvtNi+ac3m1xNqAAXUtyJ4RTAh8js810?=
 =?iso-8859-1?Q?x9iSq9JkeH1ik4tEpNm9AuQkTy68BVhg3XBQwtlg1dnzf0BvFKPuTN0n1L?=
 =?iso-8859-1?Q?yotEj8rjnWV010yJerEknvW0qaCA2echUI9Fwp/JmN+T31WHA46GjnlvBl?=
 =?iso-8859-1?Q?w6J6+Pdr4mjnKXQ4H9DPTsiGErTxarkSTBqTMyPMCCJDiWbNFaFoE+sf9C?=
 =?iso-8859-1?Q?MHOdqhcxHH?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?iso-8859-1?Q?t/Y8JI/m+rsCTIl2x01QJIzlTYjqFPZp5f9gsCx8r+cb3aoHHddPonSPns?=
 =?iso-8859-1?Q?0anbpMWvvxkQBFbB6/Ix8pOA5I4P/mPWNNqTI/OiABrLS7xqrA34EELHhe?=
 =?iso-8859-1?Q?kgUBroY/f/yZmAKXdyKq8uAoVR+1/xZeQcnDiB0/0Kb9pQMmT+cpvxMFqJ?=
 =?iso-8859-1?Q?iQS5dZAkxJrpyZ2Dpt8O790YBVx5y+VhaqEkbb6MKbzspEeUv+zQ5SLOk8?=
 =?iso-8859-1?Q?oCIZbuDDTXtqwWtegNSF4teNNm6Q4VcJoDvlCMqw2ZCHvwEMy+jw5NuSIv?=
 =?iso-8859-1?Q?SVJyr7d++VgK3AIGw9GxCjZm6xSVchRf63iUncrJZmhgJCno1FLgI8PklW?=
 =?iso-8859-1?Q?FQvSBuFj+DDWi0FsjGyDn+WJVui2tdFxwAJPIeZIxp3SSCSOiDtCzDsKON?=
 =?iso-8859-1?Q?qKXHYP+YBC6O0SbRhGJb+x23ALBg7esC+mONd+LOnbUWoYfaZ8KuHqCoY8?=
 =?iso-8859-1?Q?qwvOaXEBUHi71YdlVCv+uWnebNs0pfLDhqiwFvm7gI5X+MXVc/pb5zZiuk?=
 =?iso-8859-1?Q?1l+owDB3Ntyhz68lRJF+7rFIs63fFKcSTmiUpk7WVLsCvDo/6LIjh6UnIc?=
 =?iso-8859-1?Q?VCkbiZiMk1i+Me0bBOEnJo77yqX5AHLxH8E3/2KBKEH47N6qeVaJXkNPd2?=
 =?iso-8859-1?Q?ZJ6MKwL7KUE8CfwGv3Ay1zI5YFaZEBF/8GFgJ6XvENeN1z26qm+MhCI3Or?=
 =?iso-8859-1?Q?8JGqFTcaPu0yT/YL/Na3NbEzh8acGYT+u+fMDC0HlqovvVzqVxsYGZ9DLL?=
 =?iso-8859-1?Q?Uaqu09woDsDIhlBIQ8Hkgk2hBotTN6CHXgiUwSoP0JXYVrN9Ern8mZW8Lh?=
 =?iso-8859-1?Q?8mlP1v1tw4wg8QXEqTrSUpSpaIMNLYKZYMyqJRldtIFHExO1FNvm3Jvlrc?=
 =?iso-8859-1?Q?f51FRZOwb99zJfc2mF70byD2E6XbPx7HGENmLsstiS6X5MwrpJhZS+iN4z?=
 =?iso-8859-1?Q?KK9EQ/kxgnkMVUeF7IaloCKnFsGK3Ync45E88hfoPbjMWh/kULy6+qjL8t?=
 =?iso-8859-1?Q?D7oNV7wTGS6EbgFeZs31J5F4bZFfR8lkwsY+MypSliZHRdqU29EnBQ4/r/?=
 =?iso-8859-1?Q?ObiWZ3bJFfaO3eIwsyii0KjUs2ibrfX8A2JCyvaI383ZHkCqzPYNvzQ/Mj?=
 =?iso-8859-1?Q?7ufsbTkx7g3oSoG7gyt+V2CfMNhMKD6Xfzri4DI/JUf1TW/aDJizuYQYF7?=
 =?iso-8859-1?Q?9nCU0F9i/Mj/bd4lo2euNJdvHCxK7I10OhI+/7AHvtIdRxzSAx9TAn4mIv?=
 =?iso-8859-1?Q?MV2YqV79d2iIz3LuauT36o7mLGYBHZ0+Kf1za6iZvhfdg5jAx0OrLl2m9S?=
 =?iso-8859-1?Q?Ekqmacr6Gk1/DjxBlWhcJ1/VQIG4aAyxTRgMEtEa/Vde4Rlh9z+WE+g5vG?=
 =?iso-8859-1?Q?Q6zTyVQkmLB2ViSnDiZrUWq2KpmvKbKGYuF1UnW8QJC44TrFvgqjtBpzQ9?=
 =?iso-8859-1?Q?obaUKZSaCEPcPmAle5icvKkamx5xIOvnWtBGlHNQPCgp1UBYSm92t5sPQY?=
 =?iso-8859-1?Q?0d5yvFu93PGzRpFdJ953Owqf5QjN8telTEcEMPu9XOvQIZKqjCirlxruWr?=
 =?iso-8859-1?Q?uSRPAEDZujZ4mekUoy0sbaxzI4knBWC47Omo9TSOxKKnPZ71nr51hgUzq7?=
 =?iso-8859-1?Q?189kKZutJAdunvPGtGnfEP7l+gdRjnh6BKsKEj31NU3e8WmI++/QMMkQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	9BX8s4oNWmpcRTk8o0aqmbuYO3CBA8C4bS/SVIobw5WfGQOGD3UEG7DzNEEends5jZgfH53bYVY/F+z82o0GkJVZ7CmBZhrZVgO6pnxI05WH30QqMeRZgEMUlblB3JUle4bgbKSiJJ1XjNVHv56bseJmmC8YrmDVYW/Nq4nB+T8siRmrtjhdWexsFHFCG2EqNLOInLftmCOl0awemh4261jgP96o8dgrKv2sMb+WrsRlzG04lr7QikEHRfvxpgwuMbjFhAAMNA+TboGjAt/zxDThvfVnlBH7KeClFa+ri5tr6WPQUEQRz/GrHDpcO+slGu4J9DDNTkkMvLvOKyokhv9PiZ6ON+v7aspGW7XYF+HGnaruNMMdtj6cPgXFG7B6IhTkg9KH6GXbQZ7DfA7BUt5VaJsdkna5AdV6pTITG4bK13n/+gXZ7eFwP0uL9ION8rhS6C50f+U+GQWS1GbrTT+3mzf5iJy8swb8n42sOVwVxVUPU146tpQm4QkeGzz8yxyPAQfblzpiVjn7ykf5DgXcfaE9CMkzzN4brDHnBGb7dYG4ogYbuNqsjDSNVqwJUHXpGQxjKBUWxKRcI58pCaMkQj3PVC6guNnp+ZwHk0I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05bc352b-dbf5-4065-ec35-08dca137c52b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 23:26:48.4577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4e2nEYFpVbkWFW/O+O51jV+hE0K+09qUyxRC/YfdK/bZf7wyNWb56BbVfaHasyYx1lsgalqSJawjlvoitdCWdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6318
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_18,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407100167
X-Proofpoint-GUID: vilg3Sliw319QzQw0UQuIc4hRMe5iacr
X-Proofpoint-ORIG-GUID: vilg3Sliw319QzQw0UQuIc4hRMe5iacr
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
Cc: Dmitry Safonov <dima@arista.com>, Lorenzo Stoakes <lstoakes@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, Dave Hansen <dave.hansen@intel.com>, Kees Cook <kees@kernel.org>, Jiri Olsa <olsajiri@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Bert Karwatzki <spasswolf@web.de>, Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, "sidhartha.kumar@oracle.com" <sidhartha.kumar@oracle.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* LEROY Christophe <christophe.leroy2@cs-soprasteria.com> [240710 17:02]:
>=20
>=20
> Le 10/07/2024 =E0 21:22, Liam R. Howlett a =E9crit=A0:
> > From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
> >=20
> > The arch_unmap call was previously moved above the rbtree modifications
> > in commit 5a28fc94c914 ("x86/mpx, mm/core: Fix recursive munmap()
> > corruption").  The move was motivated by an issue with calling
> > arch_unmap() after the rbtree was modified.
> >=20
> > Since the above commit, mpx was dropped from the kernel in 45fc24e89b7c
> > ("x86/mpx: remove MPX from arch/x86"), so the motivation for calling
> > arch_unmap() prior to modifying the vma tree no longer exists
> > (regardless of rbtree or maple tree implementations).
> >=20
> > Furthermore, the powerpc implementation is also no longer needed as per
> > [1] and [2].  So the arch_unmap() function can be completely removed.
>=20
> I'm not sure to understand. Is it replaced by something else ?
> We wanted to get rid of arch_unmap() but it was supposed to be replaced=20
> by some core function because the functionnality itself is still=20
> required and indeed all the discussion around [2] demonstrated that not=20
> only powerpc but at least arm and probably others needed to properly=20
> clean-up reference to VDSO mappings on unmapping.
>=20
> So as mentioned by Michael you can't just drop that without replacing it=
=20
> by something else. We need the VDSO signal handling to properly fallback=
=20
> on stack-based trampoline when the VDSO trampoline gets mapped out.

I'll address this after the part I missed..

>=20
> Or did I miss something ?
>=20

I think I missed something in regards to what you need in ppc.

From what I understand, other platforms still map and use the vdso
(context.vdso is set), but unmap_arch() does nothing.  It is only the
powerpc version that clears the vdso pointer if it is unmapped.

git grep -w arch_unmap shows:
arch/powerpc/include/asm/mmu_context.h
arch/x86/include/asm/mmu_context.h
include/asm-generic/mm_hooks.h
mm/mmap.c

The generic and x86 versions are empty.

From the patch set you referenced, we see changes related to the files
modified, but I don't think any of them did anything with unmap_arch().

arm: a0d2fcd62ac2 ("vdso/ARM: Make union vdso_data_store available for all =
architectures")
arm64: d0fba04847ae ("arm64: vdso: Use generic union vdso_data_store")
mips: d697a9997a0d ("MIPS: vdso: Use generic union vdso_data_store")
s390: cb3444cfdb48 ("s390/vdso: Use generic union vdso_data_store")
riscv: eba755314fa7 ("riscv: vdso: Use generic union vdso_data_store")

ia64 is dead
nds32 is dead
hexagon has a bunch of vdso work in the logs as well.

There is also a6c19dfe3994 ("arm64,ia64,ppc,s390,sh,tile,um,x86,mm: remove =
default gate area")

I do not see sparc changing away from what the patches were doing, but
again, the arch_unmap() seems to do nothing there as well.

So, what I was looking to do is to avoid a call to arch specific
functions that does nothing but set the vdso pointer to NULL for
powerpc.

The thread referenced in the git bug [1] seems to indicate this is for
CRIU unmapping/restoring a task, but CRIU now just moves the vdso
mapping (or just works on ppc at this point?).  Since [2] hasn't landed,
isn't this still broken for CRIU on powerpc as it is?

So, are we keeping the unmap_arch() function around, which has errors
that were never fixed, for a single application that utilizes a newer
method of moving the vdso anyways?

On the note of CRIU, it seems it cannot handle tasks which don't have
the vdso mapped anymore [3], so setting it to NULL is probably a bad
plan even for that one application?


So, I think this just leaves the fallback when the VDSO is unmapped..
Well, it seems what people have been doing is unmap the vdso to stop
these functions from working [4]. At least this is what some users are
doing.  The ability to replace this vma with a guard vma leads me to
believe that other archs don't fall back at all - please correct me if
I'm wrong!

I also cannot find any reference to other archs clearing the
context.vdso (aside from failures in __setup_additional_pages).

But maybe I don't fully understand how this works?

Thanks,
Liam


[1] https://lore.kernel.org/lkml/87d0lht1c0.fsf@concordia.ellerman.id.au/
[2] https://lore.kernel.org/lkml/9c2b2826-4083-fc9c-5a4d-c101858dd560@linux=
.vnet.ibm.com/
[3] https://github.com/checkpoint-restore/criu/issues/488
[4] https://github.com/insanitybit/void-ship

Thanks,
Liam


