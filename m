Return-Path: <linuxppc-dev+bounces-7656-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B709A8888D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Apr 2025 18:27:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zbt3l11K3z2yT0;
	Tue, 15 Apr 2025 02:27:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744648035;
	cv=pass; b=T5AAzAqR9BSYPtBjx6+SE9Ef3/6OdBfmYjy/cDiW73vt6SCl3+0dm3kAfiUamMp1kaESiFOh1234ldcreMMACqn3CzAXElwsI8f6YGyn1KDRi1BpI7WJNRFP1+qU2jsgXjMW8J5eEOg8vbO4R9aMGiItPsIUpMqdvMJcnlyBmrtlXZb8gmLLgmyN5wgbfRJk0qVwOsgLdXB35FIX2Yd4vEwodjoBoqae9ml/k+iJw+0k8zGZ7wB0Mg1P1ZSEaUlZuwl2EdZey/095SkG6mxcJC4C4rzp0PK487GuT1k/WB5ZROUpb2WoY6F9bmWVHXKvPGsdtqXX0ASbirA+cB2DnA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744648035; c=relaxed/relaxed;
	bh=SRpmcJa6uk+G5RIHXOTn4nfXMonGVNCo3bVOQS4FhsU=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=XfdAVDq8f7B8nuxgP42imut7b/ssEcq/o1KQLnPhsbmsIo/3KYlxlEmIw/lLGyIqf2S5qke2a1sg48iu0BnPFUi7Jw905HanZ4BhHXj788KTx+STZVCEZU3jNFa2mjpKLRH+S/nu3qyODtAz20gQSwhZ6b7KAz2lXoyL3bV4cTG0V6p/TWyeUqjKcfB+Q7e3yY4BVDo1CzZOc3u502YaqsvKyojV5QEidhP/oZ99o69xLd0dBK00LwYuO5yfbtA2fvEaH8exAOp62QVzD9wY9atkCWFxV2G99EqoAtIUe+v7nANHlmYCEuRQpo2gxBMoy4E9XtEc1cHaxFPtKWrqWQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=IILEe/gv; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=WFD5vfOM; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=IILEe/gv;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=WFD5vfOM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 8574 seconds by postgrey-1.37 at boromir; Tue, 15 Apr 2025 02:27:12 AEST
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zbt3h2PwRz2y2B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Apr 2025 02:27:11 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ECq3sh021393;
	Mon, 14 Apr 2025 14:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=SRpmcJa6uk+G5RIHXO
	Tn4nfXMonGVNCo3bVOQS4FhsU=; b=IILEe/gvGlGQE5YZEnpck4sUrmLgroTkjr
	Dx1LJIheevNl5O8hQ9/ppYUkT/Vg3ZXxs/VOW4b+NBHnhbb4cMvVGFDHvYrGrDUw
	LmH/1jwJMG8WgfxILlQcABpNuIeG7kTDLu40yv596tpGHy08ELTxtBrchFuuyc0f
	mj1LI9qBRzlR0N9xYptgsLlO8y5DnTm954m+9EwFmPRz68sS/5TxVbudAG95gQLf
	Lc+2JcFGzfZRX5dFYCCtTDhicT1JGxKXH0If11Y75Qe/3sEzDYNocLnP/DwabKEu
	4UNhg3J4IcrGNMfxWpw8L0gqI5HC5UxKN/m48Zs/I5RRdtfxOg0A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4612r7869a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 14:03:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53ECG8ia009194;
	Mon, 14 Apr 2025 14:03:59 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazlp17010005.outbound.protection.outlook.com [40.93.11.5])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d3gjagc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 14:03:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGSZlc6oPezQfLlkrVRm3Eao3WozkYsvZbqszIjqEG2xzFDzN3kv9nTcKuwpl1hDL33NOrwF/+f4pbXZJU+8TZ3P4skl8jiHuwEEzCQVe8ZYI5+eKmV6+IH3TiTlDcjTjAPi04KLxIhcVIPNU//Pn9KFZgWdYnWd2KW7W9eRU2L4hp69BlWoYn2rWKgB1yxC7Fn52wX7ZAcsdyLrcN3L5dbxSzY9X32ffxYOpk9aq2BvARgx0XoX+ofbXXeqqGGRUeyvQ2t/mGweSXgvR5dwfmt12j9ntfhAqWg/QNkVikiYITjc9QPiizuTU6XjVbMzM3ijfhUJLvSqcctkdvSlQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRpmcJa6uk+G5RIHXOTn4nfXMonGVNCo3bVOQS4FhsU=;
 b=IwnBJDDoRnHi/r85VZIB4WB5qN3QYxZiKW3QuoxoC5Ozppe85jFviZoBkzsDsCEAvTYCMDcJsoHVFJP7drLgfsJZLzkAVNWgcfgxdLhA80IV4cjHTaHNc5F6hCGwoFY3SK2pUIw2lHXIxF8kftp7VsqtiToMP5H4z5fRXrVwNDZxFpHSKRhgXW9amTsK5MwprOsewUr/565QkDCBYd792xEQDXa7rnqI2jC8bJozrsbWwTkrGSu1A/OhZi7AOinjj9xbgICnbMq8wP5EQX7Esu26QX2/qQkRyzR7CKQKYsgiQwf1n4ZYqe9DsCqtf0haArpSX67drTAeo1HQyrKJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRpmcJa6uk+G5RIHXOTn4nfXMonGVNCo3bVOQS4FhsU=;
 b=WFD5vfOMDRLh98Xh4pZ0b3iREVoOCuu1neXkODOWv8nFB51Vn9OXe268pwhaGjmUuTEhlZdh/MD2oYYICXD/Ayr+CJHg9vrCF9iFkj5otrBsX7AJMjP3ZrO4Yy95WiNJ3+J8wd/ro2UnxACijRXKrklkhBlXvLYle1DXBZQxbDw=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by DS0PR10MB7400.namprd10.prod.outlook.com (2603:10b6:8:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 14:03:56 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 14:03:56 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        Ard
 Biesheuvel <ardb@kernel.org>,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] lib/crc: make the CPU feature static keys __ro_after_init
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250413154350.10819-1-ebiggers@kernel.org> (Eric Biggers's
	message of "Sun, 13 Apr 2025 08:43:50 -0700")
Organization: Oracle Corporation
Message-ID: <yq1tt6qhmc2.fsf@ca-mkp.ca.oracle.com>
References: <20250413154350.10819-1-ebiggers@kernel.org>
Date: Mon, 14 Apr 2025 10:03:54 -0400
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0211.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::6) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|DS0PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc269e9-5adc-400d-97d9-08dd7b5d325e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?heXeLHzB8if400Ajk3J40aSo9X1hoqeCcyrPninXZQ3JPYWZ285JMmPMqx2A?=
 =?us-ascii?Q?MBB508UeSo7448uekwwwZgs9jczVHCkRKRKY7Mx7wYzo2J35jtzq9xQGO5FG?=
 =?us-ascii?Q?pkdKmVgN5KkdFRX8OtDzJbAGucpJo6B3m0b+SimWk6kaNzpWmOBVODYayxaq?=
 =?us-ascii?Q?qzyo/fucKT8NruKzA9HSg7MhopQiOtNMQeQ0aWStyI7rTTvaclkE10Jw6ESg?=
 =?us-ascii?Q?2T0JtpSHmgbsE1aWRA2VETtYRfO/qfcJWVtgIyWe3tCxCTdmjQ036nm1qgma?=
 =?us-ascii?Q?4hAROAU6KLojzKSlSLOmTJXxl+08witEYv92/cLca7RPPczkICfnGq35jzT+?=
 =?us-ascii?Q?QPlpIlmSqPjezCbGJXnLgKbztiEOh+5ONXoybckeRY83Biym2wO8NXMqsZKT?=
 =?us-ascii?Q?2gU0BldjRXwi5jmYqTN1JxHp7eJifkDBn4kFskE02Z0gCr+bv0mbWhsKnEMB?=
 =?us-ascii?Q?fi59TXx1BoasPg5JtSe7aCL+u6kOZmTdxuk39TvlJQRt/8XkDN1oMTcjPu+B?=
 =?us-ascii?Q?nCsDQrEYcB2aFD3X8E5ODCrmft8ybx2N6oXTbcxuWYHMG6BTf6Nel86fmyaz?=
 =?us-ascii?Q?HDEyzdVS5oVb8kfnVzOPRGEsFknG4a9fvwuLFK8iNTRB11hBXHNrvEUEJXHG?=
 =?us-ascii?Q?VIn3T7cG2IplfxAcMmLwYoVggdwvkGwn3zteGXU7TL0uaqxAf2ZSeFMsbX9N?=
 =?us-ascii?Q?yMxUbz9fPSTDks3HEh/CYQUHvRGMlrDqIJjtzWkfOiah1VuW1nnu6ec5l4kq?=
 =?us-ascii?Q?omucNXuilhVCQ2YHosiI0RBWKl7YhcGkK34SLNKbZwx0XdOCst8NX42IF6fG?=
 =?us-ascii?Q?UdiXETXIvizenucaUcXHAj0SS9wQdbsEfbT39I0upGnc0DXQxIKhbEcN0DY+?=
 =?us-ascii?Q?mhTHlE3RqtMhk4xg/x/xBeIEXASQE1KFO5zo7W+U+7hs/NgMLw1MK/HECG6w?=
 =?us-ascii?Q?P2zsVMFQ91gACvKjlKbNVgh3CR1Y4tG8vF6Io2syerqhB2Qda9IatWz/ph+4?=
 =?us-ascii?Q?LmSKFxKavPyoQ/UJkKesMye6iVJjcshzXxYGwAqWkfhjyfX6U/99/eoNucux?=
 =?us-ascii?Q?LjxUXKYrhvyM0mz5XM6epXOeGaaSqnr/1mBu2ZmCwgOgGEExU+w7svbPM1MP?=
 =?us-ascii?Q?dLXn7lwoyKDJT3dvaRYH36P2y3xQ+9H01kSvd9xxhNzQrxue9sg/BfaT1Rrv?=
 =?us-ascii?Q?b0esuZ4aYN4OnQeFKHOiqF4TAwiuRZyq8eM+W8vW6tTGdm4dOKm74FdT+ucP?=
 =?us-ascii?Q?UqBYXQhl9JDRG4v2Fk0Q5H6HfITmVpEvx6gUTQ7w2rTT5LdlM4X2/Warv0+G?=
 =?us-ascii?Q?+RlsdlJjiDyCZCFZ2dCC78NDRhzS3YM1pRwR+bYdlgHCZvalYpbiuX8mMvQT?=
 =?us-ascii?Q?FxG1KoZvdxf6eFOcmyiOASWCMks1MBjhLmiKN930hI/2cKQZyc3moTIyE+wV?=
 =?us-ascii?Q?BABvBvMOumI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RQv/m980/T2oPcUOhR+4NxD/UUzmm49Mfh2DZgWeCWwtzOc4PsiszNGmM9Z8?=
 =?us-ascii?Q?s439wQE4x1kNIYt+kxY6ZvGO4XH+y94TDkunPHuxwzE0ZXf0s1dXTPi79Azm?=
 =?us-ascii?Q?2qchTIQ26xRPuRqO1h8ZeIir1xDGdndTG/69Jg3wMKPJl+erJ3r/p+FjfjWh?=
 =?us-ascii?Q?7kWQW3aOq/1iC8Bqwc29gCQ3qcjNwTsc8xtSzchvQze7G0wKs0NMmWRNiHdS?=
 =?us-ascii?Q?mw31m525/iB292am+1d6W+rwa4GBRy7zikhwTZjNXJ+l6k7tcof+6JpTfaHj?=
 =?us-ascii?Q?2H2XRCth65Z7ka/QRyMv2s8/j1M5Pja9MHlLnOT1BrZPe5KVDcWpPgt524ko?=
 =?us-ascii?Q?JpOCSM/IZaecInoarMDv2AbGkumi+JmQUPlBf/Vxzyy0/7t9H7BIQsu7kicx?=
 =?us-ascii?Q?0zhGYT8g+VCo8ly0WtyJWOksxQliqYaV5Bqzk1nxfmZSQ0ENRGPgFeKkWwC9?=
 =?us-ascii?Q?AL7dbZtHe/TmZRmOGmFzAhuCdirgujoIA+8JHBexYvta/x6AG7I4KdkH0J/5?=
 =?us-ascii?Q?pMVQqYEPkcd3gk7D7MzpOnhmikkVboBiFUvn+FI84zLPnqCMwGmPef3M3Qpe?=
 =?us-ascii?Q?4k8k4uRoEb/Ee7hTjrm6P8SOh3LrGWKV6p+s0iZqj3fIEpm2/mkYYKWapK8C?=
 =?us-ascii?Q?UJoesIWdLx0isJy9Y/n+IT/rrDDnfWuQalwkuZ3/MVN++7yWTpBLR4g6icMQ?=
 =?us-ascii?Q?rhsf/d3cXEflowhpnLfhtjKGaLNig1HK4jtZUoqwVPBbbDTXyY61hlu6KB0O?=
 =?us-ascii?Q?5ncvIbfsm3cd0etupY2j7ap/CHMJxSnU00GpUvp22KQ4J75wBtk2p3HnNpOv?=
 =?us-ascii?Q?GYuUD8Af9slIDNpoCi/IJ5VaXK2HJ0RcCwasVHg5y/yI3S+xQHEtHfWMp5rm?=
 =?us-ascii?Q?wGP+SsFLU+x6203j0MXzcW8ergKSCVCgkG6Mxu7ZdmDh3Lw3nia7F/NBi7Pp?=
 =?us-ascii?Q?Cb5CQntLrawNYB6L2HIwa7aOzzRcZf03ijqd+7ca4kkyD9h2LAdlRmkcUgvC?=
 =?us-ascii?Q?fG4DIfKfRUKPEBjAPkjUx3nhnjEPnc1x21Ww83rLdUN5Ry7JOcFEjFcw84Lr?=
 =?us-ascii?Q?/I+727nKaEr+q+V6pb1e0YHel3xZEMDFgCDui645NsTyIQ38z51reVDMm37T?=
 =?us-ascii?Q?f4q/hfXPCy8ie021/tKmkE5JHtPgHFyYQtFClelkspmXAeFd3hh5/zO/HBUs?=
 =?us-ascii?Q?OlzTF6GowE9w/2uKJE10eT50Tnel9+GD/0cO6cfhmmXjKctD/8aod1KiUyUb?=
 =?us-ascii?Q?fJGb2sXBTYTBOGYPoAavJBD7w3i4GoPrL7BI8w60gQ4rnCQFdzGsOHQMCnM7?=
 =?us-ascii?Q?GpANaNJud+OY9GAC4hkhOvRd4/Lq2fv6WasuYn2v6cwRCGHUbSefxK2NQ/q7?=
 =?us-ascii?Q?835J+e9yGDjBIR81AABGZ7o0V2Zze+imjXSDU6oNn1b/DLP0ggss/EUEE7ct?=
 =?us-ascii?Q?QimTglFgeyMqJ8YgNctXIdYWv0hONFSKgqTCWgJ5DcrSpjMxl8ITtmhtjW/0?=
 =?us-ascii?Q?tBGHGOcoPn8h6SUCfZTKzwQR8tl0CcU80KP6onv4UdqY19+YrR6XfybuuhnU?=
 =?us-ascii?Q?cfoUykk3PRcTVpZ9BLJ+TDZi5CWaBIvyE6v/vGjlSCOvntx6R41vUM9D29mM?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ze6LJ+sKipMYGBi0mWP+nXUYCyApofbmgUhApWvL0gfovcX0fOrp761PAZFkyYonKY4ZQQZW0pflFugGor8blNqoMcJySOIooBaqC+ANFiv/iHceTuWN+5wh0sAKOJUeohLLgYqjGkMmhAGbyu+wbLf4iX8mIYhLJD7n5psd4WScbwhvTUFpwoN6GrGw5H6bVGtGeMl3ooqYbMHxxzdjHcJwQTkHdzOMUOLAAQRyMaLFU/Azkjk4EsAeB0yyzfHsl9VOOj54EUbFt2pMiNm3YPAl+zRLh96d4BK5XFGDCNvPgoeGKcgNSnilq78H9EnuD7gKTb4e/8NaGPY8vxnfZKe8+dnJfLe4sd/T+ntnlnZjOgBxnubJZCjU4YLTTkTT2SRA3ofPTszKH+JdieaTtlAlHyvpK0kuboecYE8NkJuxlUgho6N7kJEkz8bz6m2akUDpsINWgzZ6Yrr5JNZwPYM3NVoMjjY7+TVimTbb1OCQ0E0SK9lUIZC3ESmhxc6Yf9vV9l7PYZMr1RL6ejSS30huQBDjhRmBeL2TO6Cy9rzZHrBLFi8HJA6UTWcvqyZsJ1e4BDfs3Vat2dIrrRaj9SlOWr/BZ74kAwMDvIPHzEg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc269e9-5adc-400d-97d9-08dd7b5d325e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 14:03:56.5041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ip6BensbNUgBvAoYNeXmya5s6HlsIeGe/dIYHIR6J9fCB8kti3jF2yNt9SoDWiZmtVtXiqOwfekM4J9ckoJE6qig5pKZKv7++EI1hoWXw+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504140102
X-Proofpoint-GUID: BdyBqGi6kxUfUY6Qs1S880bGMkmBiiOF
X-Proofpoint-ORIG-GUID: BdyBqGi6kxUfUY6Qs1S880bGMkmBiiOF
X-Spam-Status: No, score=-2.0 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


Eric,

> All of the CRC library's CPU feature static_keys are initialized by
> initcalls and never change afterwards, so there's no need for them to
> be in the regular .data section. Put them in .data..ro_after_init
> instead.

LGTM.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen

