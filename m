Return-Path: <linuxppc-dev+bounces-5720-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6E1A2313A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 16:55:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkNry6xYvz2ykT;
	Fri, 31 Jan 2025 02:55:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738252514;
	cv=pass; b=ZVoxMMvjDmsWtfhaPDGoSwPYspDdWgGeVQ8O1lDZAxy2ENUxqEGoL30v7h33j7e5BA1fGb+QYtDxO6gi0ojYxJBnlLUlEYPFEyTl2OnMduerUdwCzg5bP27l7nj7pG6LtIqAKDCokbZ5powsRvt/SARUOsSh31SmsOMU7JKkzGP8GTPRYzaztq/61oqT+Mb46v1Gp+CCckQHNgfxctBruv7v92YkiAjaaw7kP6oSvvWipk6GRxT8ZxjXrgwgZ/z4tvhVvHz6RiDV401bYQO0Inudwrk2r86v2LWzls1rkvzeHSGhPDk3+wdm6zU1i+92fJ7XIKm8Bkr/FcS7+u1RQA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738252514; c=relaxed/relaxed;
	bh=XLs5sApTBRvFrkiK6nx+paLrosC7WuIk07vzSh7Sxmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Oabkc8XHMbC64J7w/Q2c8k0FjVDpMzDhoeVhycaqZhZ0eiVwTfTQ+mQuxRZMP2j5TxtkYZ2OCdoRLg5sPy4mIaYQpONQ/9a39zN7sDavp5MyM1IDL3JzjB5jiQkuN1mp7m7yNeJ5BBhgZTDNJh1ZchHu1m5SpfiPYCDlYTlRon/ifxwhY0zmLi5aZqHusqDOVkhrhbdNA7tIs9tI4bUmP2dKO37G/khf0PGXpcK2FdEUiaxFHuiDmI9nYFENHcKhC96vJCKA7i2KTYKbMmwmRQiMHFwhHIaA7KVuHRV399aTgKuuJ+v156SKoBLm479QEkJxi84WG8QcfUUXa0Xgzw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=V76mXmTk; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=DlL/QG60; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=V76mXmTk;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=DlL/QG60;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 6544 seconds by postgrey-1.37 at boromir; Fri, 31 Jan 2025 02:55:12 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkNrw6wGcz2yXs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 02:55:11 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UD1mlg004642;
	Thu, 30 Jan 2025 14:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=XLs5sApTBRvFrkiK6nx+paLrosC7WuIk07vzSh7Sxmw=; b=
	V76mXmTktgumb+xaLij82wnX0HQWQprV4elLjfQci+d8x84Jr2QA1uebijDEmZV6
	r/EZ3ipcSzq2rs/AWnJfEtu//zzey/shF2tq4Smb8oRRj6kpzPg88UIVR90k9rFX
	SohKHBeirNKMZvFeTOWulARjt/Ge8MsugM5Pbh6i1PY5AItnzdOKzdwjNR0tMWsX
	JNyqlPDjC3z3dG4/HLRi++1t7yzfRQzXcFb5HwPXaQzLn3S07CfTTCBis+7G9B2c
	qU1kOUkxSFiwp3xiC5PX0IPPnKZny+gwgSWOsDEYFtKLMbexgdKHcMvc4wcujw+v
	SiXdeAvmqeZLLRn1RiHEeA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44g9xtg4b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 14:05:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50UBooMJ015772;
	Thu, 30 Jan 2025 14:05:36 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44cpdav2dg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 14:05:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGKrEeXxxc24CNbQ7orQQMf6A1N6oIDVVazSzw4kQvPgq/P8gx6J4RPz4qvraPJi2o7uajqAmnQcHjd2WSyprRKcGBlp5XLls54GnHxgxdMOPFhYFRYuGNULFg1BzP8td4NJPiBVsGllShaK1utOtIQ5TkDDgsiv8L6AS+a3L3A7zuf6YtNKBKkBG2TCZDsLcv9GTu0LpOmjDax5C03ShnHmvPpyspPbGlZ/IaWl9ARW6ATCQEpookdOZs+ziQzWTlDQtUhM7/06ghklcbHpVKE+EzAW6xeq4CeYC4Cjgog6/Sk2AT3FKSRWL9KknAvwfcSsdxsp5c+nrApRNV+M4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLs5sApTBRvFrkiK6nx+paLrosC7WuIk07vzSh7Sxmw=;
 b=O909N5yprlWUCaWe8QzbUqipaZHtPcc3pWZwYatIDJSZ4fnKKjb0vYLKWzBksqXsJTFbzP7rUjtQ2rszmY1Oq54bKeyzSBApN3DqbVGMnfERP84IMHYcp01OPi+Vt2zFh951lz/zVLA132TOt7oBwBp2K1DZXI8ZVVigu+d947mivjlC7tfrG5OkQ1xz4mx6aFa99ynFl0bbJmfApGToQuAc49Iwy/zMnAq20RrNOMRI+D7H5awj2/FBZoZr9NQ4K0vVuaihVGYSsDgRZAJkH50F7+VdPQ3FSMLPlxKUtKOX9Nm8+2UZLeOKN+SXHMOql7j3dDA3s4CZWu0p11owyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLs5sApTBRvFrkiK6nx+paLrosC7WuIk07vzSh7Sxmw=;
 b=DlL/QG60qADMNr4h6HMYyxiNY26ONrU1QGB8f07YIocMXosIy7Y73l2v4RXymFvdP6vCoNxQe2ZKCFdXRGlpGVb+lBR8Ir63af5HZFThDSZLHGxTpOUQYCdrOWq9cw7dx6VpFzPS6iKNM5l38yYN/5oyCZonV/tbpg77qxerxKg=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by BN0PR10MB5205.namprd10.prod.outlook.com (2603:10b6:408:116::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 14:05:34 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 14:05:33 +0000
Date: Thu, 30 Jan 2025 09:05:29 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org,
        christophe.leroy@csgroup.eu, justinstitt@google.com,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
        maddy@linux.ibm.com, morbo@google.com, mpe@ellerman.id.au,
        nathan@kernel.org, naveen@kernel.org, ndesaulniers@google.com,
        npiggin@gmail.com, Matthew Wilcox <willy@infradead.org>,
        linux-mm@kvack.org
Subject: Re: [PATCH] xarray: port tests to kunit
Message-ID: <zlcagbwyskb4nkl4usbq4foc4vjcau3exp42zpfsl5b4tabr7u@o42mpfcsfygr>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, mpe@ellerman.id.au, 
	nathan@kernel.org, naveen@kernel.org, ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com>
 <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
 <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
 <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0279.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::17) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
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
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|BN0PR10MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: e870b587-86da-464b-8dcc-08dd41372954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2g3ck91MHVpSEszY0xkUzcxV1hLdXR0cXpPSGFNcGgzZXhBUkJMWG1oS3pC?=
 =?utf-8?B?ZVNIT205MmhDRGpQUS9TOFZ4TXVnQm5tMjN5V2NlSW5TdjNqcEpHakdaaCs0?=
 =?utf-8?B?dUhyangyamRTTjdqSE85YitBK3N1ZUlpK3BDZm1TeWhCMEVBNGtCempYMlMr?=
 =?utf-8?B?MEViazhBZUF2TXltblhNMjVya2MxRVFWalpYVlRPR2NCQ01OMzBrdmZYN2la?=
 =?utf-8?B?b3RZSmliMGF5RHJuVlpHaG54cTlPdENHZlJKazBQL0lnanNydHprZ2U5VGE1?=
 =?utf-8?B?cmtDNHlWMldEUm00T2ZIVGRVTjFXSWtycHZHTUg0TnlUM0lGS1RTOEdtZVNk?=
 =?utf-8?B?aUdLNVQ4RDdjTjIwOW5YL0R5bkpjK2ZEcStuak5EWmlGc2xZMTM5cGV2bER6?=
 =?utf-8?B?OUNDSEFJeHRuR2JBTWI2dk44U1hDMHpkRUhET1VjSFhLZEVKMW4wM00xSkZh?=
 =?utf-8?B?elUrd0FNam1DRWZIakNFaFZIelVOU0NxdTErenlraVFNZy9nUDF3U01uV3hw?=
 =?utf-8?B?M3J1VUR3b3AyODlLK2pORkZXdnVIMDI4WnQ5c1FZUmlXTDVtRlFveHdmSnVa?=
 =?utf-8?B?Vy9nSk9VbEhHc1RSLzRDM2VubS9zZ2Y1LzJlUEg1dEp2TEdaSWp4ZTVhMWZM?=
 =?utf-8?B?eWJwOGd6N1ZlSlJTK3NyVXVDcUhxL09SUkZHNWxPVTdyYkc2bi9nWlZtSnpq?=
 =?utf-8?B?eEY0MmhrUlprdld4V1poanBlN3lTUExiUVlDVXdkZXBUZkxyaWh4UEFzditi?=
 =?utf-8?B?SlBvM3NzWXRJVXdubWpKakJSNDdMOTZLQk95aElaVTFWZTlXL1VqQ2p5allq?=
 =?utf-8?B?Tkc2VVVja2lvYk9RY1EySlV3N1lKZDBPSUhvYzFOWkQ3U3piMUZzcHlWTEl5?=
 =?utf-8?B?RU9xb2RxYTg2R2RMVXBTdXVIRjJrN0FwZG84NXI1UjFuZll4TlJ5T3Nlb3Q2?=
 =?utf-8?B?QThjSEZiNitxWXJqNzFBSGJjeHdZbzVLL2M5bXFNTXZ6T2ZnRThKS3NDR0NF?=
 =?utf-8?B?WXYycEsxNEZuVTlwOUFBZnlXZlQvTWFOVlM5ZlNIZUlhbTZjbGxncjdvb2Rv?=
 =?utf-8?B?SHh5VUIrMUhPTElpdFNZMUtuSldVV0ZES2FhUVJGZy9iUVhqOXFWL3duWlE4?=
 =?utf-8?B?blNWc01RcG1na21KQis2L3JKOFFpckc4MzU2bkNOSXVRa3Y2R2o2N24rMnFi?=
 =?utf-8?B?cWxjZ1JCUzRvanpsd0lrQUpvaWFmZjZidXV1Mmw2dXR3WEkvTHV3ZXpFdUpC?=
 =?utf-8?B?QzBTZUE0bjRnWjBSOVJhN0NZNzAvTVdHNy9VTGlXS1FwU2N2Y0k3bkxSNmxJ?=
 =?utf-8?B?T0VwZVZmcWVVOXRsTTAzR2FSZlZPdTVyd3lhTC94aHBrNDNHZ0dScFBldzNZ?=
 =?utf-8?B?ZWg3aVdxK0ZOaWlSVU1zNi9Qem9Ic1FMVGxqcUJ2OXBSUGxyaStJOFJ2YXpG?=
 =?utf-8?B?Wm9aUWhoazRFM0IvN1p0SzRLU1Q3T1UwNUt6VFF1UURDV0xTK1Q5eTFqNWNC?=
 =?utf-8?B?dmJjTEFKUTBYdmFXMVJGcjRLV2QzbC9vbThJMHNJVjV5MXFUM2ZCbDJyZmUz?=
 =?utf-8?B?dmI0YWk1ek94Z2YzUWl1MmFuSXpsOC9zNmljS2EySi9XdTEwUUN0eHN6NWRB?=
 =?utf-8?B?dXFPSTUwZG5tdTNSbEtESzhMU29jaG9zNEhrRnlDL3RPM1FCQU1WU2JxNTN2?=
 =?utf-8?B?S2dUVzRkVkNFdEdDdXJEMzlrYllwSEtIUXR5VFkva3kzaENHRVdCVjVTeDhV?=
 =?utf-8?B?WWdkc0lDK2JtYnlidHMvOUtPb2NqV2Z2QjhocTl3aU9QeWlmQlFWUlVzbWhs?=
 =?utf-8?B?b1lCNXgyQ3dkK2tjNFFiK01HcWVIMWY1S0svMTg4WDBEU3lDK01XdmFrVS9q?=
 =?utf-8?Q?yjNkmBbaaYC7K?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjlOaHd2YU16cEg0T1Awd0tqWVNzUG51UVZKd1UydC9GY21oTTgwOXpxN3Mv?=
 =?utf-8?B?Rmp0bXc0VmUySVhUSzFvelVtakpxTGRsTDJhbHd4dXZONEFyb0Rwdmt4ZmhC?=
 =?utf-8?B?SlVyb3cydVM3U3B0TnUwWTVqejVjcmFnOXVlVFNObFdXN014RGUwa3FIMWd0?=
 =?utf-8?B?U3lSUUVGa0RobDZOZ1lLT0hnWUxNenlHZ2FQTDNIbytqbC91alczTjV6TUpv?=
 =?utf-8?B?UnB4elFya0FJbVFCZURVcVpQbTFyaXV3M2RITXorUHJpWDJ2S08rTFV5UWZu?=
 =?utf-8?B?aldodHNGaHBENllPcFVpTUJGZkZ4RVZZN3l0R3JXSTdWZkwrWm5lRHM1L0s5?=
 =?utf-8?B?U3VUSHBEcDhIVzJtSm9BKzRYSG00REViTUlNTTl5K2tjbEwrdld6ZDFiVmZV?=
 =?utf-8?B?aG1jRlEzQVBKQnNxeDUvc3BjWjFEalZUMUJXSkRpZFFZL2x1MTdtNDFzNjF6?=
 =?utf-8?B?a0Z0RTEra3phV0pMZVFiN3dZL2RVYVBPKzNSU3FMSUswaUVDVWczU2Jla09O?=
 =?utf-8?B?L0hhUVNSTXBtaFlCZjJkckZuR0VoblUrNVMrVHVLdnh4UlF4aEZPNGEwYThi?=
 =?utf-8?B?MGd0V3ZnYkVmY3RkMzVDZGsrVFJsTXUyaU92MzdUOFoyelhGWU9YZDFOcEx2?=
 =?utf-8?B?VjZVeW5RclBOS1BiZVNaUGszelJGWnVudG81Y25XaUswWkxmdkFrUnJ2Qlpw?=
 =?utf-8?B?NjZYWmpEWkZEaGR3dmYrUG9rVGtQbW5GMXJGYWN3NXpJZmd0NHlMUEU0cldW?=
 =?utf-8?B?b0RxSzB0YkFadDE2OUdBcjdGYzJ1T2kvUmRqeWo0bGtUaWtTc25Kb2xqWnQz?=
 =?utf-8?B?THRieG9KSG5XSTdRU1dLaDVoaGxjTEx4MW85Z1NReWhTSzBBQWUva1dSR1hN?=
 =?utf-8?B?SCsrMVpRQ2o5WVpxYnp6NXF6RnEvaldxK1JkMXpXTnBwQ0NMRDFNenhETTNM?=
 =?utf-8?B?UkZZVWFzRmlvdWYxbVZESWNoaWxmeVVMTE1weVJBVDhKM0ZUMXR6Y0RWak1U?=
 =?utf-8?B?TjNzcE1VbGlSWFEzUnhkSzBycXp0TEgxQ1dkYjFZOFNITUFZT0Z0ekI0ejBj?=
 =?utf-8?B?UjZvY0lUUndXcnRBRzVncytUZGVaS1hGZ1RhTWVRMU0zUHFCUTVjSE5oem96?=
 =?utf-8?B?c2RtcHBsa1VVaVVzMEY2K1lmeDNqbDlkbFY3Q2ZHRWVEeGNXa2dza2VxdjBm?=
 =?utf-8?B?OTgrU01ibHZWTCtoR285bnVIZjRUb3ZQTU5GK3ZFVnJzVFpUa3I2d21XbHQw?=
 =?utf-8?B?cjU0QnZhOTdVRXF1TjZxb0Y1UWVEUTRSM2Z6OW1hN1owRUtMWmYwdTF2T0lB?=
 =?utf-8?B?MXpKK0dqTkFjSXRXYnFPczZPcDdLUENlaG9ENm80QTI0a1ZGMEwxb3FmcXpp?=
 =?utf-8?B?V1h5eTFURjU4eTVnS08vSE1SRHhMUDB0N1YzMUlvank5ZTYvWUYyUXo3ak53?=
 =?utf-8?B?emRGTVlvSzl1djB5ZEo4U2pHSjluQlNwWUdaMldUWmgxb083bHgzY2k0bHJJ?=
 =?utf-8?B?bE9CZmNaTGZwMStRYm50MFhjN0c4NmI2dTcwYWgzL1NHbk03RmtYMHFxSjY3?=
 =?utf-8?B?cUpOdlVreStZUkx5UUM5dUVTcUxvM2IwaUFUYXkvekVWMzZVNmMvb0JCcnhV?=
 =?utf-8?B?WDJoYkNTUjJzZDkwM0FHZk9zRzIwTzlCWWR2dmFvZ3ZaSEhaYm5YNFprK0tZ?=
 =?utf-8?B?eTBxQmZiZnJFemkxVzdtU1k3L2JxWlNDYzhVM2hTOVdnejRMTlZSd1gzOFd6?=
 =?utf-8?B?NGkwVVBnOGpXa2w4UzY0S0dHdm9ZSC83MmFWZ0ZGeW16Q1BEZzlNUTNYTi9i?=
 =?utf-8?B?YkhxM1YxclA5OWZ1TmhPRE12TFFiN3l4ajZrVGFDRk9JeXpaSmhIcWJ0ZWFh?=
 =?utf-8?B?d3RsVi9oNW1Ydmg5Tlg3c1hkRlRkN3ZmdzFBSGptMytndGZOQ0ZJNnVVSGJX?=
 =?utf-8?B?c0V1MGx4YTlGY0VnNWIvWFdxSENXNk94bGJDK1M4dXZmRXQ1WU13ckthTUhz?=
 =?utf-8?B?Y1FENkFISGxsbUhNbnZLYXhibU9XZHlzaGdGazB0Qm9ZUElqalFZc3c0T1d2?=
 =?utf-8?B?a0tXaDRWRXJoUGI3RE4xRkMxSEhaQWUvTEFTOGtrVFlWNmRGMU45bWttaGtY?=
 =?utf-8?Q?I09a2UtW3fkoMOxJAgEckvS5Q?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PEQpejNS2169WuxLqh7IeJu5gaPzH9gMvfu1E7oR0S5oW7SSlI3WjoiNmYvg7BIS32L5KC1Cxg8r/lzfLOhKQWoWZ1pr38KB6ZficTpwa7Mwy2hoE+Px6/D3GyAP7Wwd6KdPoWTGOgcdFPsIGELBI/VJwFyLx1T4gUWT7QZS4YlsO4PBVLv7ZFQXSUICtLfNaqRpBJm10fbAOy/hK0ty4+Yml83XVXgmOw+X6g6Ugut060l/VSfV5nfXEaVWNwQHWLDurDamN2gjp5kOdrSCKamJPmErrJs+d/d1DklX9ZPabUUl8lOzbs5iMLmm6NPDFZdLoJZ3EswrOvlz32TtTd206zK5b2fgOxI0hjH7tg8KpIknJ2MwFMX+ee98yP2gihbItCDL4KjLppMCJ2TwdvlD9cjVGHNBD72OGw2x+6m1e9ilXiLAHoexe9P7XN/AQn+W/V+R3URP5nFBJlUurRWOTFZZd9g4WTWvW1Cj3HNFbdu/ZJn5c5qc/syXWm0P29uDIYj6+RrRD/a9jmY+qLwIDweKj5/VqDYPY8wh/yMmqrJdoSACrFKl6bfUtrP7gHSy8XUORpWvDZV3LWfLYhyvOvTSJIjgP0Ick0Tzrys=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e870b587-86da-464b-8dcc-08dd41372954
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 14:05:33.6147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHb0RatLC3hElPrLusK4cVLoeMQNq/zzOr2u9bYW+aMdyU7o53Fu6VKK70BeF95VpSmaYvPIVwh2lMAs7XW4bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5205
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501300108
X-Proofpoint-GUID: h1mJ2bWJSzTk_fGo7RQphARmorYdrQiT
X-Proofpoint-ORIG-GUID: h1mJ2bWJSzTk_fGo7RQphARmorYdrQiT
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

* Geert Uytterhoeven <geert@linux-m68k.org> [250130 08:26]:
> Hi Liam,
>=20
> On Thu, 30 Jan 2025 at 13:52, Liam R. Howlett <Liam.Howlett@oracle.com> w=
rote:
> > * Geert Uytterhoeven <geert@linux-m68k.org> [250130 03:21]:
> > > On Wed, 29 Jan 2025 at 23:26, Liam R. Howlett <Liam.Howlett@oracle.co=
m> wrote:
> > > > I've never used the kunit testing of xarray and have used the users=
pace
> > > > testing instead, so I can't speak to the obscure invocation as both
> > > > commands seem insanely long and obscure to me.
> > >
> > > The long and obscure command line is a red herring: a simple
> > > "modprobe test_xarray" is all it takes...
> >
> > That command worked before too...
>=20
> Exactly, great!
>=20
> > > > You should look at the userspace testing (that this broke) as it ha=
s
> > > > been really useful in certain scenarios.
> > >
> > > BTW, how do I even build tools/testing/radix-tree?
> > > "make tools/help" doesn't show the radix-tree test.
> > > "make tools/all" doesn't seem to try to build it.
> > > Same for "make kselftest-all".
> >
> > make
>=20
> Where?
> > > BTW, how do I even build tools/testing/radix-tree?
                                ^^^^^^^^^^^^^^^^^^^^^^^
>=20
> > Or look at the make file and stop guessing.  Considering how difficult
>=20
> There is no Makefile referencing tools/testing/radix-tree or the
> radix-tree subdir. That's why I asked...
>=20
> Oh, I am supposed to run make in tools/testing/radix-tree/?
> What a surprise!
>=20
> Which is a pain when building in a separate output directory, as you
> cannot just do "make -C tools/testing/radix-tree" there, but have to
> type the full "make -C tools/testing/radix-tree O=3D..." (and optionally
> ARCH=3D... and CROSS_COMPILE=3D...; oh wait, these are ignored :-( in the
> source directory instead...

I'll await your patch to link all this together.  Please Cc the authors.


>=20
> If these tests are not integrated into the normal build system (see
> also [1]), I am not so surprised the auto-builders don't build them,
> and breakages are introduced...
>=20
> > it is to get m68k to build, you should probably know how to read a
> > makefile.
>=20
> Like all other kernel cross-compilation? Usually you don't even have
> to know where your cross-compiler is living:
>=20
>     make ARCH=3Dm68k

Ignoring that I had to make a config - which asked challenging
questions...

And ignoring the steps to get m68k compiler...

> > > When trying the above, and ignoring failures due to missing packages
> > > on my host:
> > >   - there are several weird build errors,
> > >   - this doesn't play well with O=3D,
> > >   - lots of scary warnings when building for 32-bit,
> > >   - ...
> > >

In file included from ./include/linux/sched.h:12,
                 from arch/m68k/kernel/asm-offsets.c:15:
./arch/m68k/include/asm/current.h:7:30: error: invalid register name for =
=E2=80=98current=E2=80=99
    7 | register struct task_struct *current __asm__("%a2");


>=20
> > > At least the kunit tests build (and run[1] ;-) most of the time...
> >
> > Do they?  How about you break something in xarray and then try to boot
> > the kunit, or try to boot to load that module.
>=20
> If you break the kernel beyond the point of booting, you can indeed
> not run any test modules...

Which is extremely easy when you are changing code that runs so early in
the boot.

My code found a compiler issue because it's the first function that
returns a boolean.  This is stupid.

>=20
> Which does _not_ mean the userspace tests are not useful, and that I
> approve breaking the userspace tests...

Perfect, let's revert the patch then.

This is such a waste of time.

