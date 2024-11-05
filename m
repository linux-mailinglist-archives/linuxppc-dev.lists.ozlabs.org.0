Return-Path: <linuxppc-dev+bounces-2855-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 661EF9BC325
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 03:27:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjC0H4Wmqz2yFQ;
	Tue,  5 Nov 2024 13:27:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730773631;
	cv=pass; b=kgoKNQL5L5LwBYQHTzXx4vtyXP4g02nISz05K6+YPcO8YSMrkIJdtqdHuJ+V3rKVQFOJO2m+2mgD+C4XdEpesDaMNURBk6SdmCGz009VILBzGobtzYvncgvuzuY23TmUcrx2EReBhdy6GInOenSbKuWYgfdkcxYk10fFPyewQHcH3PNC6b0G5ACz1wxeUiGQQStHXXv8dJDt6Ob3Ga9TZoIj7nSDrVqLuYhCdfCkIJmb9Qm4WcW3NwEEZYP0e6EjRD4zJqVBXvyW6gQsaZ1CLqe2fXE7AwecX9lhdU3hD7PMlChy43HLIzOoR5bI/XUbMEeZZ/hyI4HKMXgFD1vSZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730773631; c=relaxed/relaxed;
	bh=gGzgFNZRE/uuzsqIr/e2RBNFNS7HhUAa8z1wQ0CXDVk=;
	h=To:Cc:Subject:From:In-Reply-To:Message-ID:References:Date:
	 Content-Type:MIME-Version; b=jbchie4oE5oUQXOUJYPZBOXAK/PcJ4znwPiHD5LZS7twjTPTpZQju2/K4dP32Q25ZibhvsdsXKwJLZo29XRMVaVN+4QiYp9C9/PzkeivJS6IS6xyCXbYrjDOI/J1irt2q3VJesUC6xM9d8/zWs3EEufLn+8w3i7peVnXzxwKJvlqZbqzKAuTQ632qBefHQKKBjF1dE3qPAwkH1pQ3cDp0807rtlmOtEB/hZP2T1U7qXwBaWMxAj1vd8hvjalYpTlvKQO+dOb4Bfvskt1dH/rjWuH3eS8G7Fe8MmmKdC5ewJpAHoHkP1IHvf3dM30i4badk+af3ae//xv2qrdqt2mNg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=XQERhgit; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=IIS/g3HP; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=XQERhgit;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=IIS/g3HP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=martin.petersen@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 3622 seconds by postgrey-1.37 at boromir; Tue, 05 Nov 2024 13:27:10 AEDT
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjC0G07DBz2xgr
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 13:27:08 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A50fw5n004265;
	Tue, 5 Nov 2024 01:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=gGzgFNZRE/uuzsqIr/
	e2RBNFNS7HhUAa8z1wQ0CXDVk=; b=XQERhgitiGxjjsSehzKrQFPH7DfJrEnH0W
	V12SuwqVCXPRWg8RHq5aApoPXzzLmeaWnpMB0PQRcOKg9/l5HOuU3+TN4CPgZHFI
	dc4cv5WvB3KzFuKlN/zvz5385fLDkwUr+yHjYQSVIgHL6A5wEHtljKSAmGZsquQA
	GomivjhkQBeqqM3ySkjKFRuQPDLGQccBGaAVqiIiCMFuS7F/wZNQsN3aiSDgrI/H
	PjYu8ieyxFMOigsvrLgONK3AxhoJ8FegafJdhyHoo973qTiUBAImsdETTQSxKnKO
	ixk0PbBRC2g0wLEK7DfyPC7wWa1rofunmm5KNM3C45RGAux2hLhQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nby8v5be-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Nov 2024 01:26:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4N96EL008674;
	Tue, 5 Nov 2024 01:26:07 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nah6hgt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Nov 2024 01:26:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQHT2coXiBsJxlPN9qP92BqxzCF4f7A9L59D/mwXbXkBP0DPjRLjwCZFdvdwcF/Rydoyd68b/R+MQ2vWEgK6DZWr9qS4VhxW4V/zPqV+cL7mo/aa0HImUY35ktbSLEUW7Ai3hjTl4jbjno6WTQqmmxJxaaBSg1NlCG4lVGHLapTsFPpQfHPPPBWXqbZ6h0ESobfFzdvCY/sFffPIr7+3Vc3oWa3pn79h+4u+Pffwyeqgk0WR/0wBcyPN4Et4kkdiVfYdgTYqnlD8htWSgZVWZNBT+fPfiXAmk4xCLv9xhbNBtXNoa8dlyZ9LSp/y+Rk0SAH644uo+kWTfP/cYth9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGzgFNZRE/uuzsqIr/e2RBNFNS7HhUAa8z1wQ0CXDVk=;
 b=xzOZC/gt/MbVgfKO2GW0ajYlFSlQQIIxK8mVmFnNXSwzyQqGJSNT7JPZ9jUeYrRi0WTgggSc0N7HrvZwi0aWwOzylZ5tkcBT+jlJ3luaPVb+tSGh4lfRnSoat4tHItjPPFtMW/TV7Hi0rNP+U3ZWZ9+Ii6TmUpk2hY2pveomY1T1FMZQXb93prLQ7W+CPSFo8UWz37MvA525sTeSqhAYTyFTj9+nohqgUEt1jFun5ib29giOJgRkIONiIycUMp6rv51ezpyuzz9mEUqTKI67I6mr2t3wzuH/jbJ7Ul/moyRyQLZsaXiss688Ek/eJ0UdAWBMsSocWhhhqTe1X9RaWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGzgFNZRE/uuzsqIr/e2RBNFNS7HhUAa8z1wQ0CXDVk=;
 b=IIS/g3HPunVBWHHcE7Mdr4xYD3frkSJ3zgPBPpUebkPwfZ4avBPodlJF7lnlkfzzMMOra+rIRIjwv95+XSUH7c+RjNIgVdYrl3ChfvdOXHRZU/lo0QS0PDWmz+FqNOuiw1AMPDbjs7kuy150cGmQTG6VZBvaLCGuUqO1eu74IEQ=
Received: from SN6PR10MB2957.namprd10.prod.outlook.com (2603:10b6:805:cb::19)
 by DM4PR10MB7451.namprd10.prod.outlook.com (2603:10b6:8:18e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 01:26:01 +0000
Received: from SN6PR10MB2957.namprd10.prod.outlook.com
 ([fe80::72ff:b8f4:e34b:18c]) by SN6PR10MB2957.namprd10.prod.outlook.com
 ([fe80::72ff:b8f4:e34b:18c%4]) with mapi id 15.20.8114.015; Tue, 5 Nov 2024
 01:26:01 +0000
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>,
        Davidlohr Bueso
 <dave@stgolabs.net>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Alison Schofield
 <alison.schofield@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Ira Weiny <ira.weiny@intel.com>,
        Alex Deucher
 <alexander.deucher@amd.com>,
        Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
        Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Dennis Dalessandro
 <dennis.dalessandro@cornelisnetworks.com>,
        Jason Gunthorpe
 <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
        Tudor Ambarus
 <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <mwalle@kernel.org>,
        Miquel Raynal
 <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Naveen Krishna Chatradhi
 <naveenkrishna.chatradhi@amd.com>,
        Carlos Bilbao
 <carlos.bilbao.osdev@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        "David E.
 Box"
 <david.e.box@linux.intel.com>,
        "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Richard Henderson
 <richard.henderson@linaro.org>,
        Matt Turner <mattst88@gmail.com>,
        Frederic Barrat <fbarrat@linux.ibm.com>,
        Andrew Donnellan
 <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Logan Gunthorpe
 <logang@deltatee.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang
 Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui
 <decui@microsoft.com>,
        Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-rdma@vger.kernel.org, linux-mtd@lists.infradead.org,
        platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-alpha@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v2 05/10] sysfs: treewide: constify attribute callback
 of bin_is_visible()
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
	("Thomas =?utf-8?Q?Wei=C3=9Fschuh=22's?= message of "Sun, 03 Nov 2024
 17:03:34 +0000")
Organization: Oracle Corporation
Message-ID: <yq1h68m5v5q.fsf@ca-mkp.ca.oracle.com>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
	<20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
Date: Mon, 04 Nov 2024 20:25:59 -0500
Content-Type: text/plain
X-ClientProxiedBy: BN8PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:408:94::30) To SN6PR10MB2957.namprd10.prod.outlook.com
 (2603:10b6:805:cb::19)
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
X-MS-TrafficTypeDiagnostic: SN6PR10MB2957:EE_|DM4PR10MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: 1115d897-72b8-4026-8afd-08dcfd38cf02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8JlNNHxUgQOOx/wGCPnA8kRl/YI2u5+wqohNareR/E5DeLjDCWMIrSNp/foS?=
 =?us-ascii?Q?9jLcQJsdC4Z56feldh5nydh5DtUjLPHtOgXrNAXm5z99NqyBgx1pkMtEkMkF?=
 =?us-ascii?Q?KbcWr+C9WzyQqYa1fgV7v3laI4wxUlqonVzpQZaT+iLogTIcEe2XHxVsHIWX?=
 =?us-ascii?Q?If27VrXVPxqJJ4xACw3jQFd3i7wWsp7JZl9OCmCdwlUVvNIBuVpy+3g+x6+N?=
 =?us-ascii?Q?fn2gJEe8g5V0bVffGlDHkYwrMSVHk6t712Wr8iNQHi1/NfWRoUXyF2RFZj2T?=
 =?us-ascii?Q?EX/1+zVwiehEZV2kqjbKD2qL4SYtuY+6gIkbcnIGwReTENdXhgQNMVgXj6oP?=
 =?us-ascii?Q?ChucY6GquqFqxuXYvgnddYrsxgeOqztgmNQXfvmpnD/PyN8+HWLg+UN6fw8Q?=
 =?us-ascii?Q?yelnNf9YOhR7MKwH9LGxEZP+NM63sfKCUjEm+OKM4H90kYfe3cftFcIkk7h+?=
 =?us-ascii?Q?Ulf8+7TT7FyCekSsC1fkqz5MVtc/WUJqFcCl7TixSNIDvmskZWtWoB+MOT3Z?=
 =?us-ascii?Q?pZ6I0HsUDPltZvLNeqDFpN59lzoysYAwa5swihyn4qd37M120xq3dn5wfS/E?=
 =?us-ascii?Q?Q140B/Heis486A7Y5QtpirTZoJFmmE7YBISlyCopOPcNo2X27AK0JkuDLkFJ?=
 =?us-ascii?Q?GtgGl2MOzD4e+lH8AihaJ/ksT4qPiig0ZQ+nFCgeHKqZyoNIBWZ+PXEW+894?=
 =?us-ascii?Q?OIl0/a9BJfxUXXoyro5RUMIEkFdD4pgzqV6azp5H8zpEhvplf3D3vYSzNG+U?=
 =?us-ascii?Q?jXv5O4uxvuOFsqGLl2P1IbjGxpkhZt8IY1wRwT3I8oAFSdbL1hfG9zjXaDUq?=
 =?us-ascii?Q?eO+zv17HNITR0z1cbzQLcpAqojE9hZgR0okQsqtXRxy7p6d8KLmu+Uh8QDhz?=
 =?us-ascii?Q?vB5/LQ1G8MhOg8nwEbxT7px2tc9Jp9RzPhJHQJBDiByz0CioQAwMU7lmSB7H?=
 =?us-ascii?Q?SpZiWe/LiWP3LkXh2OkINp4JZeaaM2sWwhQY5TnSPZNUXORnSWegwzqy2Rds?=
 =?us-ascii?Q?paFgezM7dDe6WVopE4TFd0s9TUE85StI4fDAWh/m1cTJ6jzPuazVN0tURmpt?=
 =?us-ascii?Q?wd0teH2RxHcJ2dNCwl+cICfIHxNwCjAgeR6NhX1oqnmCtvq18e+4xRFhjnuA?=
 =?us-ascii?Q?hUVIQSmNzoSrCtcxpncZVdL08eFgEawjQr203U+K79jDQWKybIJH+7Sv7mlp?=
 =?us-ascii?Q?rVwW6zKr+I4dOVehgOoHRi2Y6PDQAr9kl0wpo0vxjUkGyK3XIzmNe5gKRR+j?=
 =?us-ascii?Q?k/11E5xJqqAe6/GnGv9Tl0f/2yVHhyNkXDYRSitOeeFt3AXGlmwhv4iFbuQJ?=
 =?us-ascii?Q?wbDCCrPMq6MU4m2ZYnUxAGsk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB2957.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wAzTCY7NmgkQEkBp+rPfMWsogGaOcF2jk0MwN2tNerE6T69LdgpRxJ/kGvRc?=
 =?us-ascii?Q?FRA9ZikaVmPTdndgt2DacZB8gY3Vf7zjLuf0vpNSZ+BCNCw28XE+/xB6nVgt?=
 =?us-ascii?Q?ipDHNkEmGZvGKWFZnc2Q1sBoUojWjSiynB5PufPp7P3d12TCS+JH1A+jRSVU?=
 =?us-ascii?Q?WEGFWbNkTvUkmyO3zCZbjJnzVpauqosvuLDRW63GqxnpxnEw9wI2qpDkcN6C?=
 =?us-ascii?Q?G1zpdPwKPUHUouQLQGJnw1q2pOg/+pDDBEpIZikQ5Yq5UYJDAjhYAHzT5nUy?=
 =?us-ascii?Q?SR5hXktkXIWCAwy0+OOuteeioSj1F7ZJ+HP2glnh0/HXkIc7kPG0eP8AIyDX?=
 =?us-ascii?Q?PGtrPXg3ys2F7lvXSZj+fWI6EqR9DCbInkC570Rg6iVCnA0Ggfj2aGsEuzd7?=
 =?us-ascii?Q?AXFzxdOjQQG5VOWfgLIR03LWoKYF6n6/3ysjFlCwua3y22YUNHdnXCyjWBRj?=
 =?us-ascii?Q?8iwvRFOIBEUQFTXF8RuS1MDFeefRe0q+LgIQwYA1nZPj0lEQ6zKRifh9Kyqm?=
 =?us-ascii?Q?2mrPQPasgpzbyLRamQUIFkUcZcy2z5Oioadl9ARwtx+LLIQG5wd+lRWDh3SK?=
 =?us-ascii?Q?zSDjMlX9IKB9YTxO7MNtn+Vyd08Gf7SMWMO75upVk5ickm7xJeGQXmeK5KVz?=
 =?us-ascii?Q?urPgOGD3cjN20r/E18OpBa70fqxyjJfDhjy6jx1EpkdouEouIghxjW7tl6zO?=
 =?us-ascii?Q?7tqKJP+HtvBguhMlgXdXLNcGE15BxkYMXLnUbQoIwU+NTVLtpHDcQaRnJ9gV?=
 =?us-ascii?Q?wEFZGbv3FB0WynMMjwYK26OUfGIkcnHiUtNFJDt4S3EhZwpxyI8qPWCOKzyo?=
 =?us-ascii?Q?eC/8VlzGN23AFuKoZM28AO9iAmewzQSh9hUyt1fkv6DXc2fRPYKWSVYe7LiJ?=
 =?us-ascii?Q?fueFSpJv+KKDMYEtvsrFMrurtQGlv/5/p4Us6SREx7KxM4h4UVYDDoCSRGeZ?=
 =?us-ascii?Q?b+oTXCZWL3OT/5WLUPCQONVgG+udmNhTFI+Gp47cgY/gwtCHpiuY1ri59wrC?=
 =?us-ascii?Q?w6ePA/E4z1lCbcSRDt+wA/DZ6q8l99/4kOu9PbOeh3SLRkCDKma0SVG47Y8H?=
 =?us-ascii?Q?olkY7iA43nNQ6SJGrpHxL0SecdDp1DqY/sj6AqMV81kQ8XZucawxUFy2qr+6?=
 =?us-ascii?Q?aomzD6X7s7gost44eLc7qamx8TbmsXGMK4xaZZQEMr8e90ZuPilsaq6zjoKG?=
 =?us-ascii?Q?w8YZNYm9/SSJLP2PCJJeecGUj3eZyrbULR8criP+4vm9sYQWUZzWGKC6SAgY?=
 =?us-ascii?Q?ryvkyv5W5TS5AVjgj0Ueqiki6dTNZ0aBPRpxUaJK49UVi4kdaUwB63IIpjMz?=
 =?us-ascii?Q?uEK1Uk8m+MBaZ9G6iAJNbKdhS+12IoyXBaRS4aB0c5/49dQRZcVbzL6yB8/4?=
 =?us-ascii?Q?+KLGcrAXuVzoKBYeo2C8SzMJ3FrAGe+mmz5Mz21vafx7PGG6IzFFg2NHiH0M?=
 =?us-ascii?Q?RjM7DUyVcwX2tfL8ekdBzD8yOzUT9qhiD3lfAH3ImzMLT2vy94Tp1mghVsz1?=
 =?us-ascii?Q?Oj+GgAooX79rZ1pp1huKhGG+CI0bKOz8N25Y/DASM0vG84dQvsG86rX/fOWk?=
 =?us-ascii?Q?uGTfYhAUk+7uacfFk0DcjpGuSh7TiXZgllurc2J6J8PxBwn7/kQGyLFrJUrl?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lktBQ6ttR2/pY3qLvBGVLCLGDAn4LJMtzYnZfoW3YluovouaAuJbvx+GMECsTFZCGMKYDEG4I9fOnwgP3/YP2z7brfoqpp9HrPXN//yyz8xEd22YW2lA3M7beSs5Z4/BlCxZ3T4ZPxTvaWnh266W+cZ5+S1jYSR9kPVB3mEDbNIClYSpo2LvqgMZ1JsK8s/Q+W9KIkXllYWGyBUWwAXp8slPdZl7Ucgp3UCrKiC0hs7x5rn0RytSwQ3tbH0Aae/cWW4r2VSoLRdJ7VcDCDkrxUExOmC/s0H9NdGniL4oZNSpivM3Rdx+P8SzOywglk7jUllEzfoBE9FfdhOTQYexF0t8iDRAixxsMejkHtYPuOc+3nSxo0uZLwi/cvz+M48LzX9qnLEE+q0jXUq656FkpGRcn+ap6vWhGP008BuPma4RKBccEPITaGhOXAgXugwaoLiMToE7QPmZUdHEGWIhxOIze8lMhf0lEcDMzAE+Z95rGD7mW/WyuqSWruPkuUlvNZkjNcWXDrUNlvtYow+OaklMUr9cdmgY2MV4LNLEvnsdLByCPq1NDtut7tXhN3E2ur1w3HQ5KJGME65Ot2ppKoEbi2kXNobaRRUwSBfNWWk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1115d897-72b8-4026-8afd-08dcfd38cf02
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2957.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 01:26:01.4181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLeACfNSIrXc0SHxglPRfCmk42fYbWaal4s2idGcoau2yPDF1mQqvgB3dHbD6AXvwWl01pufXK0/JRkagpdTOFnlEGQ1t2RUBvrvcePJbTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7451
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_22,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411050009
X-Proofpoint-ORIG-GUID: gP9D6kUH2AMQSDhU8_rAC_Iaia2dcK9r
X-Proofpoint-GUID: gP9D6kUH2AMQSDhU8_rAC_Iaia2dcK9r
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


Thomas,

> The is_bin_visible() callbacks should not modify the struct
> bin_attribute passed as argument. Enforce this by marking the argument
> as const.
>
> As there are not many callback implementers perform this change
> throughout the tree at once.

For scsi:

Acked-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering

