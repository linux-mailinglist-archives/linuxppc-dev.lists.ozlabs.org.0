Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1889D8B8E35
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 18:31:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=GznjsAFR;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Xuf/hNig;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VV2dX4pLfz3cdB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2024 02:31:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=GznjsAFR;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=Xuf/hNig;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=stephen.s.brennan@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VV2cl39BTz3cQ7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2024 02:31:01 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 441ASQCh000841;
	Wed, 1 May 2024 16:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-11-20;
 bh=D6Q0HjUFQndlmfDDOu29602YdmMwTwaW0ee4gdbrLvE=;
 b=GznjsAFRA9efiy0DMDjtuml6b17+xU/gR3/X0ZIHEBJ0AmgKlYFaVLQ8EVxq+oKIitfK
 6goQt3MxkKGZ4Jmp7AxBm5xlWUAeqbpk20nKrS11heVlmr3wkro+PdlEgPTur3qxRiyn
 gRynODercvq8Bf0gmiKfRccGpmqn56iVxPlnCo22rFN17OS0s7BnCKhWmhz9WPuAudEc
 OUJLoPRa3TcPmVV3kYzNHB60JfLf/4TFC0jjUaTJlwK4DOcNbuUJ4z6FUN5zVeH9JTO5
 CpPn3GMI5eY9x6fke4QfY0vitYJtRQLA1v1t8wKoh2rsnyfahPtXdCql+3/80ZKshIQG lA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrqseyftt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 01 May 2024 16:30:03 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 441G4BBP016672;
	Wed, 1 May 2024 16:30:02 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xrqtfgxcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 01 May 2024 16:30:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XB6g7+2uwwDgcRTdu4+fb/7XpTAfFLSFSaOZFaeBEHF059d3VcSip1yhSIEF/oYheVGdGmX03HYsCJJwwIE1U2R1njFNffFlKx4N1is5+qs6+lIoSgMrbth5eoVccMLBQI5NN2jUb0Mu3YAAJ+Q/Zb+bmcqtmCDwtVuuC6iBTQWQ8MgXoPshsrzByP6yUhAEMRcUnmne6yWZFUKcGGMX+L8ynY/lyDSFQkhrXUf9vlynBf/Irm3pR2urr8Kbg9Dt4ctLCPnqs6tIqAHMDQ8UgyhROmvmb3AOiRruK2DpaEDpIxsQLUltSU2pAvbN9m1DcGLwJLQ0Mk82l4qAUHbQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6Q0HjUFQndlmfDDOu29602YdmMwTwaW0ee4gdbrLvE=;
 b=FyrngWj4mMJpuJRH2g7fJY5Of+EXEUYR5yKQRNZCU7nGvTq/7yZDYCnOX9ep0FMMAozUMaXx1wk06ChS0C/mKxROiyOAL61zSD3jhGa4D0kue50hjv5C7sjUYsyKm9c59kyQHv3TQQKL5kHvkwtRdFaTN+RYnc+nEM4OuQuhloh+84t9B/jJxpGvGyq5Ur/jXMG7J+a/e6Z5mp89gxwFBekbf8wa5qIKWpf9/WXw0/JShBqY9YxvSr34Oi9kiiSzTfXd7sUPC7wqhB73YEpvrWcgxG8MDhN0zbvxmmLCb0v8g1MmeWSdb788Wzmu3prpoR+QQll4vr1DFhOypm7WVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6Q0HjUFQndlmfDDOu29602YdmMwTwaW0ee4gdbrLvE=;
 b=Xuf/hNigxZ4jndcg6Ra9W6BBmOanMKJLq34Fp7bF11oWEDNwvjfiO/e2CfoZOTemVNQRnf8FbhJAFC4Z+RAEOez7e5GgpDNvt/TNVz2wLxK+b2xwA9YkqTpmEpllkMYA2NiE/GgDstpOqbKG+mc2c+JzzbSli3/c0qtVdWPxUK4=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by PH7PR10MB7840.namprd10.prod.outlook.com (2603:10b6:510:2fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.37; Wed, 1 May
 2024 16:29:59 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%3]) with mapi id 15.20.7519.031; Wed, 1 May 2024
 16:29:59 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3] kprobe/ftrace: bail out if ftrace was killed
Date: Wed,  1 May 2024 09:29:56 -0700
Message-Id: <20240501162956.229427-1-stephen.s.brennan@oracle.com>
X-Mailer: git-send-email 2.39.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:208:32d::25) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|PH7PR10MB7840:EE_
X-MS-Office365-Filtering-Correlation-Id: d72807aa-f8a2-4316-35fe-08dc69fbf1b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|7416005|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?L9LO8DTteml+3KZfyHgQD+oFpQc8F6lpOY1EgvhC64Tjc9xRHAoLOQSW/rMd?=
 =?us-ascii?Q?vlmSnpeiVl644KpsbheP8y3XRxtQKIA8lyxvL6r6s3H6h02TkpeoNBuIkQhO?=
 =?us-ascii?Q?8bJFEsltaKTIj8kLCBph8QgrQWPfwHgsO5wVSQCB981Y6fDq4iYD4T0rHDaH?=
 =?us-ascii?Q?OyXhQ+3MZWAoj0xbPyWoNJSMZs8t0eiYnB+PC0CWU54a+9V770NR8kRIs3Z8?=
 =?us-ascii?Q?CFJ6Bb0S9uSJua9eacUIFmT8nxScqw7sinFcMlL3yJa34dlSsKWcRmaTJrHO?=
 =?us-ascii?Q?CXZSTFlcx2qEuKQu4yhTKdi87s0qZLASi+R/UND2SGX6ZxljW2huzujgq9d9?=
 =?us-ascii?Q?Ie89wFy9ChpBRXrTD6JECQlTFe7SBQerz2wSK4//ORobmz9FeItvTNYLw4Zj?=
 =?us-ascii?Q?rya0CG8xXzmFj9mW2tbOqiFTQktG5T+m+ixwazK11Sn1mMHcfCwJ3aI6ejgK?=
 =?us-ascii?Q?Lj/KZNgFCtmZ/KA/J1JT+NMT6LAxQsLb7EOR6B6Su5jnU7Y3HFpsYXNAOJi5?=
 =?us-ascii?Q?RnpORYEP9f7n0me0CbZuyKkCXeARNRf5J+3vwpg75XnPWcwhTlwhO1LdtWT5?=
 =?us-ascii?Q?E2IW0khSbX8Ja2BR5uZ1IUSkpnjfJQImSzHcF0TbR2E6/lqVP9t8XVPQFITN?=
 =?us-ascii?Q?u29qcHk+djTQqo6/vQQha6rbH440nqT3q/HOjPhS3eiB9rMbWszwReGBPz9H?=
 =?us-ascii?Q?hoYrREFjmpn+Jf+f0sldK4Jd+m1e/VitwZtrXNdRr/GF5rCH44FXQEqyP0kf?=
 =?us-ascii?Q?IkLP0bNUtPp2q+4t8zNyC3+QirqfU+8KaPvlzvywhFsgr9E7GWgUHEW8TsjK?=
 =?us-ascii?Q?pdolT4UTMDd37OM/bP/67YrqDeCrvdKEB+6zzQTeQWiULvk+YroZ55WDjWm7?=
 =?us-ascii?Q?+IgavoJBRU1glWE60+5fE9AOXBT6277BRSPsvMdcq/B3Io4BuS59VTKqUXrM?=
 =?us-ascii?Q?Tdl5NbC7tvI+20vfY+oBYEjl7x7b68voomXrjVg9ee4Dx+pONWzpIV1O2AmG?=
 =?us-ascii?Q?irc413A2uHGYwdcVJXiK2UZKhZ8uR+eTzJa98+ohFRqXqZFKPICcpijlD26y?=
 =?us-ascii?Q?rQBq2/lSVE1bHTFZmK1kzX7plch1CkzaHJ79ZCRQoGG3U30MLoYx5+VhVyhy?=
 =?us-ascii?Q?JAYc44GqWHrBJqWWEzM4DDWMDzj3Sj8+JmjGbBHn4Qo3HBFgfNltRuGop168?=
 =?us-ascii?Q?bjR4iZ7GsaQUZ4s4K/36rfb4tfWQ1vOK2oHxGPpsV1OFSAFiRJ00XGtOc5c?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/bWbJrhPiwZfcZiGFn0Sidf7VfP0BtX95W72LtHGyGkYfV08QGpPw/YQlfn9?=
 =?us-ascii?Q?YtN75Nm9hFvJEdKpVOcuxbPaTLSEwMc8zxnNzLggsgt9TbDLQ5g1XriMD5R2?=
 =?us-ascii?Q?Jug4KxTPhPZ55+Al9tglHuwqYNEmFt7WUDqgbt87goPjUfekJ5OYT1jgGjCf?=
 =?us-ascii?Q?3/rcZ+4H7rONhvyUsEAH8Tgo1dUBoEeH6of/IExqQg/NdKA9RNUlaRp6MEQg?=
 =?us-ascii?Q?USB4BCxrjtGIR83op59GHogl90h7g0mrmykbKLhpmz04MXoXL0zCKM9/Ynb3?=
 =?us-ascii?Q?AEQYO8TLq3Sk0rEjnudCFGk53M4l7+0NNPpmPHom6pDsaQWAhb2RUW/LhR6c?=
 =?us-ascii?Q?Ipu+fUfCuFeeTRpfGOnIgzS3o7oILH9YeJr6XGhiA3osUul8VeAJ4ommyOnt?=
 =?us-ascii?Q?VuIi33GSg4hrYne03prVm6Yz+9YAXq829uyE4afFOCdMmjOyBgmGS1RKf+jY?=
 =?us-ascii?Q?8YGL+tkq2zEDpNsSwXJC5hyYHNikj18P5EWeDVlEX+TuFiTChp+DR9r07HlM?=
 =?us-ascii?Q?oVrW7DV+IH5kIKAeL7H7//NIr9Nmt5aC9Bn6Q+ZQNr7pnSqXoMxCds/2U7Wj?=
 =?us-ascii?Q?4jMPJqUBf8D3RZ79szMimr6dNjHDh2VH2d1OeXG4RhGN/8tc9m2XUFJTwHHg?=
 =?us-ascii?Q?O54SZokW+8qIYKhiRl8uAIpQhfKzG7l0Gj90DNzWOnidv4NQPP+vN9HT2Uwl?=
 =?us-ascii?Q?6DWv9bIvgpgIX5FtbSvxKoxAxwHn9LXd1ZN7+VFLAiDXlfYLxx7EIOOgIknK?=
 =?us-ascii?Q?jZzNdxOP8tfhdA7zAzFcmrYzs9c+u99TJkZDva7Zo1eF1EiLeANS75EllyJ9?=
 =?us-ascii?Q?oKWnCbV9dHgOHbU24m9tlHAHMFjjBTQvnLDV+8hUmCkQBbX5y7EvArhkFvwZ?=
 =?us-ascii?Q?++0FG9ArZ85IWOBICwzEAv8NCzuawEHyvt9W2Kz/0DUeNhEZxqP9jqTXprnw?=
 =?us-ascii?Q?QtjeVtpQ5GitZPi37l+l216qSLy+eDDjB92J7s/jg0g42YdT0wYhKbRnpF6d?=
 =?us-ascii?Q?I3+Vq1tNvzqS1Xk0LevBT0W9Z5pcOJVbGedsKejcTGyA75oYIRNjM/qPDXt6?=
 =?us-ascii?Q?IQlvaOF15ksWsc6JnM4gcF1vFu7fkZ5639yY7+LPdO191fC8Z66rAKwHVnzl?=
 =?us-ascii?Q?y2Mg1bZCgRLHcbHGh6cC/hjv7kn1kGTl3JjXZlmirKeAJxvuMByUGC8QbLqL?=
 =?us-ascii?Q?Ul4JDEraEmv2XbZzcAM7MVWk7QAnUbQxTqYDjSb47TbX8dAQO4pUHFhXS1LE?=
 =?us-ascii?Q?2/9QNIqqB2p7UzysBMIUab27bf45IC/koqpF+w4w16cxH0vOlSw66C7W1NuP?=
 =?us-ascii?Q?T1VKEclsdkY08f+GwLxfL+1JEbCnbBSjkLVffLrCMHD8/uZiDoEvM3MyQjP5?=
 =?us-ascii?Q?dk6KY/VGy1SmUsnBkDgP66V8DsZvmlZdeQO/IQsuZ42rs1tgvAGPlYiNEj01?=
 =?us-ascii?Q?/5sBGwk75z1l/PXCuzUOiopRLyBLprDw4asN6PmGfJ50PvGC738BbNGgTGcP?=
 =?us-ascii?Q?hv4/Gjlp47Gv3b/6OOhWk5ZiYaX0EUTt4/eFV8ypuqJbKwBZ1U2PYeRHJuXW?=
 =?us-ascii?Q?0xS9hebWEwTGMnCCSDRkNfFxugHOV3cwynNyCfHq8TrzrPyHgZfdoOhIosvQ?=
 =?us-ascii?Q?QXmO3D3W4RXQU6VUtjjqu1VfE19dORM4nztFP/j5WinU?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	y6en0yKetvTWgNvSB5JFVxUVVCrmLP0EpnNUPHNiuacbYgdYGfHk96SSnocaXsd9Do5MNIfuwrVofh0T2I4/8kkJ6V1aRa1ToUKT7d3t5fL5JkpbmEdKI4leIZX5jpe4kONx1oMRZ4FRUe5ZxoFqNPn9u7/NIlwlsHgFH9JJKa4GIgjaBisZcs5lByCsfTIr8ekVZyt71i7sSB7Kv+RKPrbgXcGyiiF5S2rcS4S6K/6RPaCEtJrT9AsJf77xomSCLmrXgRby7c4lxas7jtR7z8qFKCnvClHQ4Co/Fm6u00NiL7SRASdlr5V+3k0yr5oFqqQoUcqr0rpTgXHKPIFNkxQIf9lY9V8yNs51WSVJa7Bg1Pa+l4perpf/6XSCZIf5Bql5r4eQBNPvp64WNhiJeTKn7SApT4whsBUyoOPpBGanG2MQ+9xEXhFfspOhtx+K4A47aeG/VRbdOMkvx8cwXHarzRXCLCziUgsOkKl5xopLmWqcw1Revg9p4zt4WzDRUHGmw3/lvhH/5ViS+uTWS3bYFOLJM/rQSmw/EPiGDHYdrCmCTLhVnG67hfcO0XsPSoiN+R1pS8HUDN6HIV3SfOfuuVhnsuURADw40yUeElQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d72807aa-f8a2-4316-35fe-08dc69fbf1b9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 16:29:59.5016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vdZLDWPguGAKCD8OMXSgHR2XDHP/dNrKnfMlDzG9x3ssOwuEwuMzF9viOdolbxvhzuuJxKmgvXfdtLhmnhvvkETPJVBbjhWFPMSp5h4LX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7840
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_16,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405010116
X-Proofpoint-ORIG-GUID: IXmcrLujswrITd78LZ4dHtCKDsyzi5aM
X-Proofpoint-GUID: IXmcrLujswrITd78LZ4dHtCKDsyzi5aM
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
Cc: x86@kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-r
 iscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If an error happens in ftrace, ftrace_kill() will prevent disarming
kprobes. Eventually, the ftrace_ops associated with the kprobes will be
freed, yet the kprobes will still be active, and when triggered, they
will use the freed memory, likely resulting in a page fault and panic.

This behavior can be reproduced quite easily, by creating a kprobe and
then triggering a ftrace_kill(). For simplicity, we can simulate an
ftrace error with a kernel module like [1]:

[1]: https://github.com/brenns10/kernel_stuff/tree/master/ftrace_killer

  sudo perf probe --add commit_creds
  sudo perf trace -e probe:commit_creds
  # In another terminal
  make
  sudo insmod ftrace_killer.ko  # calls ftrace_kill(), simulating bug
  # Back to perf terminal
  # ctrl-c
  sudo perf probe --del commit_creds

After a short period, a page fault and panic would occur as the kprobe
continues to execute and uses the freed ftrace_ops. While ftrace_kill()
is supposed to be used only in extreme circumstances, it is invoked in
FTRACE_WARN_ON() and so there are many places where an unexpected bug
could be triggered, yet the system may continue operating, possibly
without the administrator noticing. If ftrace_kill() does not panic the
system, then we should do everything we can to continue operating,
rather than leave a ticking time bomb.

Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---
Changes in v3:
  Don't expose ftrace_is_dead(). Create a "kprobe_ftrace_disabled"
  variable and check it directly in the kprobe handlers.
Link to v1/v2 discussion:
  https://lore.kernel.org/all/20240426225834.993353-1-stephen.s.brennan@oracle.com/

 arch/csky/kernel/probes/ftrace.c     | 3 +++
 arch/loongarch/kernel/ftrace_dyn.c   | 3 +++
 arch/parisc/kernel/ftrace.c          | 3 +++
 arch/powerpc/kernel/kprobes-ftrace.c | 3 +++
 arch/riscv/kernel/probes/ftrace.c    | 3 +++
 arch/s390/kernel/ftrace.c            | 3 +++
 arch/x86/kernel/kprobes/ftrace.c     | 3 +++
 include/linux/kprobes.h              | 7 +++++++
 kernel/kprobes.c                     | 6 ++++++
 kernel/trace/ftrace.c                | 1 +
 10 files changed, 35 insertions(+)

diff --git a/arch/csky/kernel/probes/ftrace.c b/arch/csky/kernel/probes/ftrace.c
index 834cffcfbce3..7ba4b98076de 100644
--- a/arch/csky/kernel/probes/ftrace.c
+++ b/arch/csky/kernel/probes/ftrace.c
@@ -12,6 +12,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe_ctlblk *kcb;
 	struct pt_regs *regs;
 
+	if (unlikely(kprobe_ftrace_disabled))
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch/kernel/ftrace_dyn.c
index 73858c9029cc..bff058317062 100644
--- a/arch/loongarch/kernel/ftrace_dyn.c
+++ b/arch/loongarch/kernel/ftrace_dyn.c
@@ -287,6 +287,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe *p;
 	struct kprobe_ctlblk *kcb;
 
+	if (unlikely(kprobe_ftrace_disabled))
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 621a4b386ae4..c91f9c2e61ed 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -206,6 +206,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe *p;
 	int bit;
 
+	if (unlikely(kprobe_ftrace_disabled))
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/kprobes-ftrace.c
index 072ebe7f290b..f8208c027148 100644
--- a/arch/powerpc/kernel/kprobes-ftrace.c
+++ b/arch/powerpc/kernel/kprobes-ftrace.c
@@ -21,6 +21,9 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
 	struct pt_regs *regs;
 	int bit;
 
+	if (unlikely(kprobe_ftrace_disabled))
+		return;
+
 	bit = ftrace_test_recursion_trylock(nip, parent_nip);
 	if (bit < 0)
 		return;
diff --git a/arch/riscv/kernel/probes/ftrace.c b/arch/riscv/kernel/probes/ftrace.c
index 7142ec42e889..a69dfa610aa8 100644
--- a/arch/riscv/kernel/probes/ftrace.c
+++ b/arch/riscv/kernel/probes/ftrace.c
@@ -11,6 +11,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe_ctlblk *kcb;
 	int bit;
 
+	if (unlikely(kprobe_ftrace_disabled))
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
index c46381ea04ec..7f6f8c438c26 100644
--- a/arch/s390/kernel/ftrace.c
+++ b/arch/s390/kernel/ftrace.c
@@ -296,6 +296,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe *p;
 	int bit;
 
+	if (unlikely(kprobe_ftrace_disabled))
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
diff --git a/arch/x86/kernel/kprobes/ftrace.c b/arch/x86/kernel/kprobes/ftrace.c
index dd2ec14adb77..15af7e98e161 100644
--- a/arch/x86/kernel/kprobes/ftrace.c
+++ b/arch/x86/kernel/kprobes/ftrace.c
@@ -21,6 +21,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 	struct kprobe_ctlblk *kcb;
 	int bit;
 
+	if (unlikely(kprobe_ftrace_disabled))
+		return;
+
 	bit = ftrace_test_recursion_trylock(ip, parent_ip);
 	if (bit < 0)
 		return;
diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
index 0ff44d6633e3..5fcbc254d186 100644
--- a/include/linux/kprobes.h
+++ b/include/linux/kprobes.h
@@ -378,11 +378,15 @@ static inline void wait_for_kprobe_optimizer(void) { }
 extern void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
 				  struct ftrace_ops *ops, struct ftrace_regs *fregs);
 extern int arch_prepare_kprobe_ftrace(struct kprobe *p);
+/* Set when ftrace has been killed: kprobes on ftrace must be disabled for safety */
+extern bool kprobe_ftrace_disabled __read_mostly;
+extern void kprobe_ftrace_kill(void);
 #else
 static inline int arch_prepare_kprobe_ftrace(struct kprobe *p)
 {
 	return -EINVAL;
 }
+static inline void kprobe_ftrace_kill(void) {}
 #endif /* CONFIG_KPROBES_ON_FTRACE */
 
 /* Get the kprobe at this addr (if any) - called with preemption disabled */
@@ -495,6 +499,9 @@ static inline void kprobe_flush_task(struct task_struct *tk)
 static inline void kprobe_free_init_mem(void)
 {
 }
+static inline void kprobe_ftrace_kill(void)
+{
+}
 static inline int disable_kprobe(struct kprobe *kp)
 {
 	return -EOPNOTSUPP;
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 65adc815fc6e..166ebf81dc45 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -1068,6 +1068,7 @@ static struct ftrace_ops kprobe_ipmodify_ops __read_mostly = {
 
 static int kprobe_ipmodify_enabled;
 static int kprobe_ftrace_enabled;
+bool kprobe_ftrace_disabled;
 
 static int __arm_kprobe_ftrace(struct kprobe *p, struct ftrace_ops *ops,
 			       int *cnt)
@@ -1136,6 +1137,11 @@ static int disarm_kprobe_ftrace(struct kprobe *p)
 		ipmodify ? &kprobe_ipmodify_ops : &kprobe_ftrace_ops,
 		ipmodify ? &kprobe_ipmodify_enabled : &kprobe_ftrace_enabled);
 }
+
+void kprobe_ftrace_kill()
+{
+	kprobe_ftrace_disabled = true;
+}
 #else	/* !CONFIG_KPROBES_ON_FTRACE */
 static inline int arm_kprobe_ftrace(struct kprobe *p)
 {
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index da1710499698..96db99c347b3 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -7895,6 +7895,7 @@ void ftrace_kill(void)
 	ftrace_disabled = 1;
 	ftrace_enabled = 0;
 	ftrace_trace_function = ftrace_stub;
+	kprobe_ftrace_kill();
 }
 
 /**
-- 
2.39.3

