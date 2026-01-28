Return-Path: <linuxppc-dev+bounces-16375-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBcJAZWKemkE7gEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16375-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 23:15:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C86A972C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 23:15:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1c6Q4hkzz2xqf;
	Thu, 29 Jan 2026 09:15:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769620791;
	cv=pass; b=VZ5vhBKt+YsS65ku5X5YnYeUvY4OQzQ/W4HncUDAo9WRRCoD/6pBhUvR+PmLRxtmr9B707vqbIew0EWu3FF7nXcj215r5XTByBy/ohalK9axK9OTjRk7lTYF4CPQ7HITAefe05gqr7lSWacdO3QMbFGVZN21JBeeNfZSMsYI3MwhNAfUwlLjIeuh4mieDNj2LREkfTnPxg/bt75/GmuPW4wpUerB+i/MN6YOwQtxPT1G0GByRPZM03VE0hQA9TAtGqzpCErmmZ2Wq3/0NGbJkVw5Paaxtac9QWcwhct6txLR0HWQBtDWw5MchtEXjYV5XOOfimb4uUrKGyVaayy5sQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769620791; c=relaxed/relaxed;
	bh=F4qr0ol93S9XApf8bDOPSkwvYyrnOg3nGUhtaCfs1jA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gcxxe/4w6kezYAztIYeLf4YfiVQFFahYGYDN57O1PxFdNtHwIsx4JrdWDMpX4Yrl/XqYoBpQL20PVVkFvoZyuuF/uUT6ZrQmIDbUSYxyQh+1kzCH51U6g8lOgIJmy+04YGxuain05x5BJ7GRZxuHS/DZifvqDzuNhspc9EjMh57FlvfeYzbyjU4xu/IlJF3HaT82vyJO4lEJckFF7R5smwIuacl3N+X8VVThlU3Nqc9siyr39S7Fh4tjqivgDXTXyB4ou0dun8LdShrH2tUZq5HyXk5fjul3nR6XxfCuiID3Xzeb5n4LQ4bNmj9uWDIt82OmRqjkg5wNHw/TxovaXQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=BqzsbpdP; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=XiOPOXwP; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=haakon.bugge@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=BqzsbpdP;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=XiOPOXwP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=haakon.bugge@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1TY171pRz2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 04:19:48 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SGiWib1337323;
	Wed, 28 Jan 2026 17:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=F4qr0ol93S9XApf8bDOPSkwvYyrnOg3nGUhtaCfs1jA=; b=
	BqzsbpdPdbQGLQ0QLrSuhPi6VxsbiuY0lY4nzFCA+/2dCLZcoNCjNQ+aPUf4jzeZ
	2MWBPvCmwZFZjXwITrjdVVnDfA3tBaawFoaKBLPgQKQ2ugzbAmZ6vJRGV4Xf4/ct
	5dp11zKfmjkIkJWnH06hNHCj5JC6g5vgxbBfgnktfi76sNoEyPTQMomfYDOyy+Vg
	33hac6eALTJPajEWHUoNeqBY8qiApx7srCb8KhC7PNxtCeXiBFaUrKlAk5U/GR6y
	auybd+V5EJBvjlfWcH5BvqXbD8wCFOSgJh6LG8itfkzA8K+fkI2wp8LXyEeNa2F/
	2L98oHplGNbU3OEA7CxUtg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bxx09jdu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Jan 2026 17:19:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60SHGs1s019813;
	Wed, 28 Jan 2026 17:19:38 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011010.outbound.protection.outlook.com [52.101.62.10])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhggnt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Jan 2026 17:19:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxtFR9w1p597+XVGYjB5+v0DTPdgHVdFglAz2SkiD6ElnX6yfN+zhXpuykwCyyn4UDyxkjFZuAtiAAN/SSg0xC+LErHj+ALXrZCzArqLptnfYEFGPS9SUoebfoBn2wTjAwyuGj/qX7+oHq8cisa/GQuMh+UCXxUq1w2xBgbADznKulR/7i6aBCYoLk8LwOQVvS2DFAKeM6Z41/6go6HDbS7PQoGehvBaUbKfZcBKXSPbPSTtyxsMjtXtBMcLoBDLc9DytglHtTAmJ1HbUUNjgAKRoz+TesrVQXyBiq4DK03aSbK//xsGvtQmHtb/Qvppt+gZvxPsuJDziVKRKXvkZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4qr0ol93S9XApf8bDOPSkwvYyrnOg3nGUhtaCfs1jA=;
 b=RVjivMeluqJijrx8PR4jUiOKsMLvQCvfOydkAicmFtiC1YrPQ+8sndn67yXWXFyPkB+pjLIE32OrGtRHrgUBKoRn1m0JqMgbtFkLjT+xMyJSjQ5pRWhtoO+hc+n5nWN9GiN0jlLbPc1Yh/kRRpgnE+ysXgrzVx9afjBGS+fu9DoAuNQavzU7+h9tQTGFkEJkI3+AyaaWiD0am7wrxp+qgxtDP3MK58r+ZdEeR+hwwGm+x9FlhU9Jq1RhF0fX7nbVJbERqYbxY6pF7a5mDAwW1y7e4eeDWZvNw2ZlpO/Gig4ZVsOKV55YcLY6RzyDHG7Zu/DDcJLcXAST8xik1ZEdbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4qr0ol93S9XApf8bDOPSkwvYyrnOg3nGUhtaCfs1jA=;
 b=XiOPOXwP93IiMTcqGw411azK7tbtq8T3gomFKOCm+Lxa6/gv+60aOQq6bqUqcGtkbhivc4gFW18XEPWXEjWSbIt96NSmEOfx4Nwu4Jm4ieVUaAGXZNQodS7gzSFsWRqb0tPsLNv1aqfWnLJVxBcmn6cFxH2GT5hFjzhp9Be3jI4=
Received: from CY8PR10MB6826.namprd10.prod.outlook.com (2603:10b6:930:9d::13)
 by PH0PR10MB4566.namprd10.prod.outlook.com (2603:10b6:510:36::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 28 Jan
 2026 17:19:34 +0000
Received: from CY8PR10MB6826.namprd10.prod.outlook.com
 ([fe80::f9d3:19ef:4ce8:4d63]) by CY8PR10MB6826.namprd10.prod.outlook.com
 ([fe80::f9d3:19ef:4ce8:4d63%2]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 17:19:34 +0000
From: Haakon Bugge <haakon.bugge@oracle.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Bjorn Helgaas <bhelgaas@google.com>,
        Niklas Schnelle
	<schnelle@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver
 O'Halloran <oohall@gmail.com>,
        Greg Kroah-Hartman <gregkh@suse.de>,
        Kenji
 Kaneshige <kaneshige.kenji@jp.fujitsu.com>,
        Alex Williamson
	<alex@shazbot.org>,
        Johannes Thumshirn <morbidrsa@gmail.com>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 2/2] PCI/ACPI: Confine program_hpx_type2 to the AER
 bits
Thread-Topic: [PATCH v3 2/2] PCI/ACPI: Confine program_hpx_type2 to the AER
 bits
Thread-Index: AQHci6Bzoxg7BPJ1h02CdG3Ul0x5+LVmoDYAgAE9BoA=
Date: Wed, 28 Jan 2026 17:19:34 +0000
Message-ID: <5B14DFEB-18F2-46C0-8DD1-166A3BC275B4@oracle.com>
References: <20260127222442.GA379147@bhelgaas>
In-Reply-To: <20260127222442.GA379147@bhelgaas>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR10MB6826:EE_|PH0PR10MB4566:EE_
x-ms-office365-filtering-correlation-id: 83c11787-52f8-44b7-908f-08de5e916838
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?OXNLV2F6KzVlQm51R21zQ3ozT0NYbmZRQXRodHlqTE9lS2E2RmE2TWl6SXIv?=
 =?utf-8?B?ZDUrVUxFVkVUeGhzVHU1Z01ITWJVRG1tZHQ0K1IxREZLeWpnTkJoTVY0Wnpp?=
 =?utf-8?B?SlRuem1STm1KWGlZRjR5ejc1bTBsUjVZTGdVd3QvaXBtWG8yc3hTMVdvYUZ5?=
 =?utf-8?B?ME14MzFudTlDeTU5M1VrcTNJT0tkemhZSGlMM1NjOXJRSzN4RDlsRHo4ekJ5?=
 =?utf-8?B?R0tOcjRINzNER2lyQUlpOTB4NHhObGtyYW1ST2VBT1BOZktRenJQTXNtRTVY?=
 =?utf-8?B?L2RaR2tzZmNkQm9WTGRFSDVkRnpFbzhQdXlSN0dLY2VkaFJXZTJyNEk1T0M2?=
 =?utf-8?B?UkdFZ2RVZFB1bnlWL0NtZytYbW9XVEF5SU5pci9IMTB1Q05OYjh3Wms5NnBu?=
 =?utf-8?B?eE5ZZzVmK0RpdCtiSlBteUI4dmVzWkJCSlBmSmEwZ0lHL0dkeEptQU9zalhI?=
 =?utf-8?B?YW1VaVJNQ2JMWjRoV0t6MFVxTlNNZXZ5RFdnRkVqdFpRbHMzUkN5VG5jSTdx?=
 =?utf-8?B?ZjBXT2ExYTJFOHlvOE92UHhJUGlXRVFaVmNoUlpzNG8xTjF3L3dLTjdmbkVh?=
 =?utf-8?B?aCtjR0tuOFNZNFhadDA5VFJkK053SW8reUo1NVAxb09wenAwd0JuZENQcGRz?=
 =?utf-8?B?VFBGT05KZmRHRGJ0dGtoNFQ5aWpYVHFlbUNLdERXaTZFcS9YdEY0ODJ3ODdI?=
 =?utf-8?B?WmVob2JZYXlRRkpzaFJjOWhtTFh5bEpZdGVPMUtlUHFtTkplVXZocWFidDZu?=
 =?utf-8?B?SXRwbGRXdks0c09CRzRvTncvcEQ5QWhNWnc1WGZqa001dHF6YUdDaE1iSFZ2?=
 =?utf-8?B?WTJqcFlrVDlzQ1dHdm5oZnA1cGJHMWdtZWhDQm9pQTFXS2dXQVZwMW9ocktX?=
 =?utf-8?B?Y2RhVUlOS0U3ZEpmT1JTZG9qOWdFeFMyY2tFa0hUL1dNL0czQmd5c2JDcWI3?=
 =?utf-8?B?UUo2WUVQejZUL2l6NU43SmV3UmN2cDgzYXhDSkZ1VjhnMnMwYU9GRkxhK1Rh?=
 =?utf-8?B?MmNvRjRRWlgyZ2VUTnJUZi9UamJnUlNSU0tIR0g5dStqbWVub0hzQXp1aG9u?=
 =?utf-8?B?cXlicXBzMVIzWGVpRzN4Tk40NU0yenNVZWNtenQzRytPUWFZNFkxMWdrdDZk?=
 =?utf-8?B?bzNwbmZnM0xmOEJyemNRblpEcE1Qam5xQzFZaWttbENOT2FCTXdJT3dIOGRH?=
 =?utf-8?B?WkpSR24rOE5hRzQrUVVWdHZtS243dFRqS2RNWDBDbWNKK2xtYWtLcnc0aWUv?=
 =?utf-8?B?Wm0rV1NFaHZDLzlXQTFCK2NXQkpFUUpCK1cwTllXYlhYQzEzSHdzcGZlUHV5?=
 =?utf-8?B?OHgzRDA1WUxpZm5lSGNXbGdYcldYdzFhMVpYbG12UTE2KzAxa21sV1VaMlQx?=
 =?utf-8?B?WERnWTQ1ZU5FcFgzaWxrYmk3TDR1eE9nVHVZcEh4ckxLME8wRlRYWFBLWDUv?=
 =?utf-8?B?Z2RzYzdJdEo0eWQvQitNcHVqekVoc0FCR3E1aE9uT3U2SU9JN0k3UGZIWjBI?=
 =?utf-8?B?NGlJbWdpN1MwUDdvTSsrWFVNaU5IblVDYVlCSEF5bVFCRm9oOENRL1hDdDgv?=
 =?utf-8?B?YzNWdERuTEZld3o3aE1sRXhGaTBsdFd4Z3BrcVpNdXo0T0hlUEJ1U2dzUjdO?=
 =?utf-8?B?cDJVVC9MZWtGZitsMzl2VDh5dHI4QkxhZ2ZhR0wzK0syNWgyeTE3NzMyVHZn?=
 =?utf-8?B?ZVk1aFErTTh0Y0Nvc25DeXdTYmdFYnMvZGgyS0hwckFSdEMzTHBRSlFZRzBZ?=
 =?utf-8?B?elNra000TExXNnMrZngrZ0FINnlqZ3liNG9nUWlha21GMlVFOTdaNnlpNk15?=
 =?utf-8?B?bnhReDFlblFBYTRIa1hyMExWL0xIaVd0MDFkYmxYYnNBdlFVdXpGOWtkT3My?=
 =?utf-8?B?TDhPbG80ZVd2YzZCbWZIalJJYXJoYlA3eFJYR1JCV2NWaFFYU04xeXJQbnVo?=
 =?utf-8?B?cnZOUE9zM1ZXbkFXdTZHMnBwWjRkMFpVeGI0bWs1UktVVnlwOVl0bFRGUUN0?=
 =?utf-8?B?VlJEcjBoYW52ZjhHUGs3TThiY3o5bkRTbUdLMG01eXY4TlBsOSs1YTZLWnFW?=
 =?utf-8?B?Nk9KZGJ5cGl0U0M2RXVpQ2pDOVMyYUNsS1VicHVmODhIc1BBVTQrdEc3d0pa?=
 =?utf-8?B?OXVWTjVydnUxRm9tSk8yajNzOVNsaEI1QkxFUkpMU0VDWjhVTG9UTXZzTmhn?=
 =?utf-8?Q?4t2rkhBazRsyyJ6tJZdf1Hc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB6826.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N2wyTWpaeVdidnRKRUdVN3ZxVDF5YTNrdkZsSGFab1J1bDRZeVcrL3o0Ujc5?=
 =?utf-8?B?a0dwS0JnS3hjWGI0WGNqa1E2dVgrVkRyL0grbHNmRDZEcmZ1Mmd3dG1jU1Ro?=
 =?utf-8?B?Lys3RWJxVlNRQWFXWHV3WjZaQlZLcERnM1Z3RGFqM0VpaXJoaEFjVDdKbGJa?=
 =?utf-8?B?T1pGTm92ZjREY3FlVUIwUkFXYTVONnpZRDlkd0NHZnh2aXQ3THhDclJ5blhp?=
 =?utf-8?B?T3M5NENwc0dGSXN2eStaWWZ6aFJSQTE1M0E2YWRZZTVQVk5Fb2ZDRWdqUjEz?=
 =?utf-8?B?Q3p6NGJsandiMjNFa21MaDIxUTRGbVE0cXoyVE9UamM3NFJIZzJ2cVU1bFBK?=
 =?utf-8?B?emRtbm9TQVE3cjlreldNV1MrcWpyUEU3a3l0WFVKemtuNkYyNzh2TzBHdm5R?=
 =?utf-8?B?RXB3RVFNM2NKT0V6aTF3cEpJR2MvQ2RZVW8vaXdmMlFnZm95ZmFyRkh3K21Q?=
 =?utf-8?B?QVZRWlhlYmdmZVNnWkxRU0NZbDZYOFl0KzFrWS9uSXNJUDdJTmlHNktYUldM?=
 =?utf-8?B?dGgrbVdGZ2ZkN3hicUR3bjhaREhOTitmc0hZaUtSbzVJRG1ib1lqTnNxajJN?=
 =?utf-8?B?eUtGbXNMcTNJV2xDQW94N3Q1NEFzZ2Jla09KanNRUTRoRnpWMEk3QXlDQU1l?=
 =?utf-8?B?L3dERU9VL2Jscm01QTh2MGtvdEY4Q0dsV0c4WExJYWVDQ1lGSk9yVHJtOVpK?=
 =?utf-8?B?eFJKakRTY3hyOWVoZHZsODNqYjdqQmZmL0dkeXoxQ3RaN0Npc3ptY1lPRmgv?=
 =?utf-8?B?dHBkNWN5UlF4REpNN1dnOXdWNDdGUWtBWFJLZ0g4WGZ0d015Z1J5Z2c3ZFIr?=
 =?utf-8?B?WlBHcllnVzNESVpiK251dmxKNjVYWlI5d3lxWDBoOHA2bFB1b2pualdqTGRS?=
 =?utf-8?B?bjdJcTJhRXRYenhuYm9pdDBxbjlKKzU5My9tNUZ5RjVkWitqK3N4YWU3dk1E?=
 =?utf-8?B?dVZYMUJ5U1hWeXRiUkFrU3VUSCtSMHp5UEJ5YlFtN3lLY2pucVFjUm80UXdC?=
 =?utf-8?B?WFNFNFMwWml6N1dVZExKTXVwUXdiNHUyQzJlSjhMVkZRenI0eU5kMGE2bmg1?=
 =?utf-8?B?ei9Cc2lqMElUZGtITjZBQVIycExueW8vSDZvTnlOZGhZUm96ZkQ3ZHcyZk5J?=
 =?utf-8?B?UWJGaW8vUU5zbVk3YjIxK05EZHhUZnpVTHV5NFJTRFpsZVNtNUx5OHNUOUtM?=
 =?utf-8?B?aTVwcVl4Tis3TzVKV3dvcW5ZRGdvZThhTjBORVcrd3A3Y3VtZ3ErSXdYUkJn?=
 =?utf-8?B?a09nTlU4TWx2N1RtTzIyVThpbG9oelhXejJZQ3Z4dHRTY1c4NjhnYi9xeDJw?=
 =?utf-8?B?Qy96Ti96QzNhTE8rbXozSEJxWnZGMTJ4Z2lDWmhoLzFZK1d6MnNPdk9VakJn?=
 =?utf-8?B?SVBtM2FvTW5tWlVwNy9uTFpNaUpIOS9JMy9oZjdXdUM3MDQwZFI2WDNGRmMw?=
 =?utf-8?B?RjNic3MxQWNPUER0ZTAxak5sSEswU0lLdStmNkVLdVhvK0pucXA1N1A3SDZQ?=
 =?utf-8?B?M0tFbjZCcnp2QzN1TThoejJFSFk3ekpIQ1A2clVrb0pxT2hqak1SK0REaS9E?=
 =?utf-8?B?Q0hkYmV5bW9HQmt1NEpDaUZyeitTSnBzM3I0K3g5aURqekd4OHJENVJsQlZx?=
 =?utf-8?B?T0k2OXQ2Y0c1TklxL1JBaTZibXlubXVpQUhnNUVseGczcXIxVzNvUXBvUXl4?=
 =?utf-8?B?NnRPVkhxY3hQY2NtbDZWT05ERHJLNzMwYnlmUGJyOUtlRFBDV0hzYndRRXc4?=
 =?utf-8?B?cHVwWnZnTUhObENUTy9aVTlBN1p5QnVSVTZURlhDd2E5N1luU2VXcWwxTkg2?=
 =?utf-8?B?Q05SY3hEMkRwamVmQUZCUmRySkdWMFRRODgyaElVNkJYbHBqcytNMURNQmUz?=
 =?utf-8?B?dW1JNlhIMy9sMy9Wb2RMVlFaVXhDZjNuMWtaRGorRC9QY1puTGt6YnZZMGJv?=
 =?utf-8?B?MVFZRk14OFZBMlF4SmlyWnNmdHJPSE1YRXpqdjNQbTdVekRBVW1SRGpyUFNV?=
 =?utf-8?B?Wk16VlpJMUtqTFVZWlQxNUR2elVpb1JRN1NxL2JvdVlaY3JLc1crZWRFdHdi?=
 =?utf-8?B?ZVdxRHhqV2JqOU9WTmNBcE9uSzcxMmhia3VyamcyUXRtak4rZ3BtaHVQVWkw?=
 =?utf-8?B?b3NPeHJYWW0zUEdsRldBSytwZ0JCbjlBYUlzbnNJT2dxd1JnNzR1MjQ3dUdX?=
 =?utf-8?B?ekFoT25kK1hBY0lUaHA0YkRHZVFDdy9BQWVkdlpEKzRqWmNFTjZ1SStud0Ji?=
 =?utf-8?B?U3JGQWhhbjc1R0kvRnpTZkg5MldOWktnYldlY3Q2OXFCUTlESExhQkNPeFlG?=
 =?utf-8?B?ZHhiWmhVRmV6UWJRS0cvUzV1TTNYRmcvaFlFN3dtN3ZKdGNzZThTa2wrdHpK?=
 =?utf-8?Q?wUaMstf7aEbTMU4ICnmJSBcl5CWsmvbF6p1XS4NDXuq3J?=
x-ms-exchange-antispam-messagedata-1: 1JO7kGWP8IJA7CrmdmkwFUfLWQqjYrms56E=
Content-Type: text/plain; charset="utf-8"
Content-ID: <821B4C98DF516F47B6AB872F43167DFF@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
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
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8Eor+Z+BChzOLUW/9z1yIzf8tSXDFR3gO4rtNR7j791yypedaXGFj2yCISrSlZndYuyLWhNxGHURzXxbwFPLIrrr657Pk5z0bk29o8+BTQ7riPzHiQUgtdbS08M5fCvcqdExOTzWFLYSc7pAjFShTqiaev1HSx8B8Os1XmYDz8fxAmkuVTJF++5puBB8V/3KC9HzWovSCWorRGJUE0gyu+4kyhu9gDzeEiaWP/1mxcr8u24eKs4TIMes/+8mTuDp/+QHPDaLe9v3tAWlPnEJaYZd9sslEzWGvvy+Z+3nOOvpbaKC+eqqZEiR5lDoXyreI9qrpyPs0tWrH7lSRRNEyKroFecKViyc8dc9KJ+F8H7OmjYqc5ejXUz1CYZ7db32YIME9ZTQongwWDMbTEE9NF5aCNzADkuadRHVEGP4m+JAr3QyC4pnG208xCUDqGJyS0Ef7BP5I6r3JbfZ8yb/dmZQ2FyXM97P+y/fqaHyY3NjCnMwfgpvpM/r8JfkQVBjQgipo98gLK56oL1w8qszyU0kxIKjY9NSgB06geI7Zb8YX4KxCrfZ4M259sLXnQdp26eUdKDaDLGfPUT/1clXXwgxv8dcjoSMqu6HW+TrykM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB6826.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c11787-52f8-44b7-908f-08de5e916838
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 17:19:34.4690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C9IdIXH5+yBW149PNJ/x+DbSTKgn20LRZ0eU/uQqdPnGzxxM6VMgFY1uOazxcujteuSZAZ/g9rhUJJHDe1qYBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4566
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601280142
X-Proofpoint-ORIG-GUID: lwEdK6n3ONuzciqOEK9o8lbxZN08P4kn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDE0MiBTYWx0ZWRfX1/1NmIJy2itC
 xgLoYcj48+znk5eM8Vhe0pzTVcFxwmoPiXjSj7V6k+Rvclcd8Ty8fVvaxbLJId/XSCibo5cTwuS
 hPGCbPVPkpzV8OJMlCgJDSmEcPme1zeS4h7GTII1t26+zZzVNeDG614k6zK9+SyJ8+ASODgOwOD
 UZUdoedAhhpIibKX8ei6BpNRpeReSns/F7G5pjw/r7jIh3E9yFkqPuO5R0gFO/ZZ8OfQdZD1qQZ
 j75Q0agcBrEJR9ieC5xoUJJoSkWJ0GUbJIRjN/Q9TORKOu3v9sYYr3q0s2oCxOHoVV1Wh+XGAau
 wvuuD7x/030L6IFNIKETffTRhEgpQyB8lgQNGT8K1JL4+n1Ox88V7tUnigwDMBgt6KMRZSE42Av
 fRG29U1awSbvU+2r3Nuzl9tezIilGJHmU8decOl2PSQmajzVa1CNjpF2lz88VbyIZc4bsBANTQx
 DRwFlFz9SChS5lkhkNXW8xmoVBTgj1nIlWDXlfQI=
X-Authority-Analysis: v=2.4 cv=Qe5rf8bv c=1 sm=1 tr=0 ts=697a452b b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VZ1iOhEU9zX66thIh9EA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12103
X-Proofpoint-GUID: lwEdK6n3ONuzciqOEK9o8lbxZN08P4kn
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.11 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	MAILLIST(-0.20)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-16375-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:bhelgaas@google.com,m:schnelle@linux.ibm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:gregkh@suse.de,m:kaneshige.kenji@jp.fujitsu.com,m:alex@shazbot.org,m:morbidrsa@gmail.com,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[haakon.bugge@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[google.com,linux.ibm.com,kernel.org,gmail.com,suse.de,jp.fujitsu.com,shazbot.org,vger.kernel.org,lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:mid,oracle.com:dkim,oracle.onmicrosoft.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haakon.bugge@oracle.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 33C86A972C
X-Rspamd-Action: no action

PiBPbiBUaHUsIEphbiAyMiwgMjAyNiBhdCAwMjowOTo1NFBNICswMTAwLCBIw6Vrb24gQnVnZ2Ug
d3JvdGU6DQo+PiBwcm9ncmFtX2hweF90eXBlMigpIGlzIHRvZGF5IHVuY29uZGl0aW9uYWxseSBj
YWxsZWQsIGRlc3BpdGUgdGhlIGZhY3QNCj4+IHRoYXQgd2hlbiB0aGUgX0hQWCB3YXMgYWRkZWQg
dG8gdGhlIEFDUEkgc3BlYy4gdjMuMCwgdGhlIGRlc2NyaXB0aW9uDQo+PiBzdGF0ZWQ6DQo+PiAN
Cj4+IE9TUE0gWzFdIHdpbGwgb25seSBldmFsdWF0ZSBfSFBYIHdpdGggU2V0dGluZyBSZWNvcmQg
4oCTIFR5cGUgMiBpZiBPU1BNDQo+PiBpcyBub3QgY29udHJvbGxpbmcgdGhlIFBDSSBFeHByZXNz
IEFkdmFuY2VkIEVycm9yIFJlcG9ydGluZw0KPj4gY2FwYWJpbGl0eS4NCj4+IA0KPj4gSGVuY2Us
IHdlIG9ubHkgY2FsbCBwcm9ncmFtX2hweF90eXBlMigpIHdoZW4gdGhlIE9TUE0gb3ducyB0aGUg
UENJZQ0KPj4gaG90cGx1ZyBjYXBhYmlsaXR5IGJ1dCBub3QgdGhlIEFFUi4NCj4+IA0KPj4gVGhl
IEFkdmFuY2VkIENvbmZpZ3VyYXRpb24gYW5kIFBvd2VyIEludGVyZmFjZSAoQUNQSSkgU3BlY2lm
aWNhdGlvbg0KPj4gdmVyc2lvbiA2LjYgaGFzIGEgcHJvdmlzaW9uIHRoYXQgZ2l2ZXMgdGhlIE9T
UE0gdGhlIGFiaWxpdHkgdG8gY29udHJvbA0KPj4gdGhlIG90aGVyIFBDSWUgRGV2aWNlIENvbnRy
b2wgYml0cyBhbnkgd2F5LiBJbiBhIG5vdGUgaW4gc2VjdGlvbg0KPj4gNi4yLjksIGl0IGlzIHN0
YXRlZDoNCj4+IA0KPj4gIk9TUE0gbWF5IG92ZXJyaWRlIHRoZSBzZXR0aW5ncyBwcm92aWRlZCBi
eSB0aGUgX0hQWCBvYmplY3QncyBUeXBlMg0KPj4gcmVjb3JkIChQQ0kgRXhwcmVzcyBTZXR0aW5n
cykgb3IgVHlwZTMgcmVjb3JkIChQQ0kgRXhwcmVzcyBEZXNjcmlwdG9yDQo+PiBTZXR0aW5ncykg
d2hlbiBPU1BNIGhhcyBhc3N1bWVkIG5hdGl2ZSBjb250cm9sIG9mIHRoZSBjb3JyZXNwb25kaW5n
DQo+PiBmZWF0dXJlLiINCj4+IA0KPj4gU28sIGluIG9yZGVyIHRvIHByZXNlcnZlIHRoZSBub24t
QUVSIGJpdHMgaW4gUENJZSBEZXZpY2UgQ29udHJvbCwgaW4NCj4+IHBhcnRpY3VsYXIgdGhlIHBl
cmZvcm1hbmNlIHNlbnNpdGl2ZSBFeHRUYWcgYW5kIFJPLCB3ZSBtYWtlIHN1cmUNCj4+IHByb2dy
YW1faHB4X3R5cGUyKCkgaWYgY2FsbGVkLCBkb2Vzbid0IG1vZGlmeSBhbnkgbm9uLUFFUiBiaXRz
Lg0KPj4gDQo+PiBBbHNvLCB3aGVuIHByb2dyYW1faHB4X3R5cGUyKCkgaXMgY2FsbGVkLCB3ZSBj
b21wbGV0ZWx5IGF2b2lkDQo+PiBtb2RpZnlpbmcgYW55IGJpdHMgaW4gdGhlIExpbmsgQ29udHJv
bCByZWdpc3Rlci4gSG93ZXZlciwgaWYgdGhlIF9IUFgNCj4+IHR5cGUgMiByZWNvcmRzIGNvbnRh
aW5zIGJpdHMgaW5kaWNhdGluZyBzdWNoIG1vZGlmaWNhdGlvbnMsIHdlIHByaW50DQo+PiBhbiBp
bmZvIG1lc3NhZ2UuDQo+PiANCj4+IFsxXSBPcGVyYXRpbmcgU3lzdGVtLWRpcmVjdGVkIGNvbmZp
Z3VyYXRpb24gYW5kIFBvd2VyIE1hbmFnZW1lbnQNCj4gDQo+IEkgbG9va2VkIGF0IHRoZSBzcGVj
cyBhZ2FpbiBhbmQgcHVsbGVkIG91dCBzb21lIG1vcmUgZGV0YWlscy4gIEhlcmUncw0KPiB3aGF0
IHNlZW1lZCByZWxldmFudCB0byBtZToNCj4gDQo+ICAgIFBDSS9BQ1BJOiBSZXN0cmljdCBwcm9n
cmFtX2hweF90eXBlMigpIHRvIEFFUiBiaXRzDQo+IA0KPiAgICBQcmV2aW91c2x5IHByb2dyYW1f
aHB4X3R5cGUyKCkgYXBwbGllZCBQQ0llIHNldHRpbmdzIHVuY29uZGl0aW9uYWxseSwgd2hpY2gN
Cj4gICAgY291bGQgaW5jb3JyZWN0bHkgY2hhbmdlIGJpdHMgbGlrZSBFeHRlbmRlZCBUYWcgRmll
bGQgRW5hYmxlIGFuZCBFbmFibGUNCj4gICAgUmVsYXhlZCBPcmRlcmluZy4NCj4gDQo+ICAgIFdo
ZW4gX0hQWCB3YXMgYWRkZWQgdG8gQUNQSSByMy4wLCB0aGUgaW50ZW50IG9mIHRoZSBQQ0llIFNl
dHRpbmcgUmVjb3JkDQo+ICAgIChUeXBlIDIpIGluIHNlYyA2LjIuNy4zIHdhcyB0byBjb25maWd1
cmUgQUVSIHJlZ2lzdGVycyB3aGVuIHRoZSBPUyBkb2VzIG5vdA0KPiAgICBvd24gdGhlIEFFUiBD
YXBhYmlsaXR5Og0KPiANCj4gICAgICBUaGUgUENJIEV4cHJlc3Mgc2V0dGluZyByZWNvcmQgY29u
dGFpbnMgLi4uIFt0aGUgQUVSXSBVbmNvcnJlY3RhYmxlIEVycm9yDQo+ICAgICAgTWFzaywgVW5j
b3JyZWN0YWJsZSBFcnJvciBTZXZlcml0eSwgQ29ycmVjdGFibGUgRXJyb3IgTWFzayAuLi4gdG8g
YmUgdXNlZA0KPiAgICAgIHdoZW4gY29uZmlndXJpbmcgcmVnaXN0ZXJzIGluIHRoZSBBZHZhbmNl
ZCBFcnJvciBSZXBvcnRpbmcgRXh0ZW5kZWQNCj4gICAgICBDYXBhYmlsaXR5IFN0cnVjdHVyZSAu
Li4NCj4gDQo+ICAgICAgT1NQTSB3aWxsIG9ubHkgZXZhbHVhdGUgX0hQWCB3aXRoIFNldHRpbmcg
UmVjb3JkIOKAkyBUeXBlIDIgaWYgT1NQTSBpcyBub3QNCj4gICAgICBjb250cm9sbGluZyB0aGUg
UENJIEV4cHJlc3MgQWR2YW5jZWQgRXJyb3IgUmVwb3J0aW5nIGNhcGFiaWxpdHkuDQo+IA0KPiAg
ICBBQ1BJIHIzLjBiLCBzZWMgNi4yLjcuMywgYWRkZWQgbW9yZSBBRVIgcmVnaXN0ZXJzLCBpbmNs
dWRpbmcgcmVnaXN0ZXJzIGluDQo+ICAgIHRoZSBQQ0llIENhcGFiaWxpdHkgd2l0aCBBRVItcmVs
YXRlZCBiaXRzLCBhbmQgdGhlIHJlc3RyaWN0aW9uIHRoYXQgdGhlIE9TDQo+ICAgIHVzZSB0aGlz
IG9ubHkgd2hlbiBpdCBvd25zIFBDSWUgbmF0aXZlIGhvdHBsdWc6DQo+IA0KPiAgICAgIC4uLiB3
aGVuIGNvbmZpZ3VyaW5nIFBDSSBFeHByZXNzIHJlZ2lzdGVycyBpbiB0aGUgQWR2YW5jZWQgRXJy
b3INCj4gICAgICBSZXBvcnRpbmcgRXh0ZW5kZWQgQ2FwYWJpbGl0eSBTdHJ1Y3R1cmUgKm9yIFBD
SSBFeHByZXNzIENhcGFiaWxpdHkNCj4gICAgICBTdHJ1Y3R1cmUqIC4uLg0KPiANCj4gICAgICBB
biBPUyB0aGF0IGhhcyBhc3N1bWVkIG93bmVyc2hpcCBvZiBuYXRpdmUgaG90IHBsdWcgYnV0IGRv
ZXMgbm90IC4uLiBoYXZlDQo+ICAgICAgb3duZXJzaGlwIG9mIHRoZSBBRVIgcmVnaXN0ZXIgc2V0
IG11c3QgdXNlIC4uLiB0aGUgVHlwZSAyIHJlY29yZCB0bw0KPiAgICAgIHByb2dyYW0gdGhlIEFF
UiByZWdpc3RlcnMgLi4uDQo+IA0KPiAgICAgIEhvd2V2ZXIsIHNpbmNlIHRoZSBUeXBlIDIgcmVj
b3JkIGFsc28gaW5jbHVkZXMgcmVnaXN0ZXIgYml0cyB0aGF0IGhhdmUNCj4gICAgICBmdW5jdGlv
bnMgb3RoZXIgdGhhbiBBRVIsIHRoZSBPUyBtdXN0IGlnbm9yZSB2YWx1ZXMgLi4uIHRoYXQgYXJl
IG5vdA0KPiAgICAgIGFwcGxpY2FibGUuDQo+IA0KPiAgICBSZXN0cmljdCBwcm9ncmFtX2hweF90
eXBlMigpIHRvIG9ubHkgdGhlIGludGVuZGVkIHB1cnBvc2U6DQo+IA0KPiAgICAgIC0gQXBwbHkg
c2V0dGluZ3Mgb25seSB3aGVuIE9TIG93bnMgUENJZSBuYXRpdmUgaG90cGx1ZyBidXQgbm90IEFF
UiwNCj4gDQo+ICAgICAgLSBPbmx5IHRvdWNoIHRoZSBBRVItcmVsYXRlZCBiaXRzIChFcnJvciBS
ZXBvcnRpbmcgRW5hYmxlcykgaW4gRGV2aWNlDQo+ICAgICAgICBDb250cm9sDQo+IA0KPiAgICAg
IC0gRG9uJ3QgdG91Y2ggTGluayBDb250cm9sIGF0IGFsbCwgc2luY2Ugbm90aGluZyB0aGVyZSBz
ZWVtcyBBRVItcmVsYXRlZCwNCj4gICAgICAgIGJ1dCBsb2cgX0hQWCBzZXR0aW5ncyBmb3IgZGVi
dWdnaW5nIHB1cnBvc2VzDQo+IA0KPiAgICBOb3RlIHRoYXQgUmVhZCBDb21wbGV0aW9uIEJvdW5k
YXJ5IGlzIG5vdyBjb25maWd1cmVkIGVsc2V3aGVyZSwgc2luY2UgaXQgaXMNCj4gICAgdW5yZWxh
dGVkIHRvIF9IUFguDQoNClRoYW5rcyBmb3IgdGhlIHdvcmQtc21pdGhpbmcgYW5kIGltcHJvdmVk
IGFjY3VyYWN5IQ0KDQo+PiArCS8qIExvZyBpZiBfSFBYIGF0dGVtcHRzIHRvIG1vZGlmeSBQQ0ll
IExpbmsgQ29udHJvbCByZWdpc3RlciAqLw0KPj4gCWlmIChwY2llX2NhcF9oYXNfbG5rY3RsKGRl
dikpIHsNCj4+IC0NCj4+IC0JCS8qDQo+PiAtCQkgKiBJZiB0aGUgUm9vdCBQb3J0IHN1cHBvcnRz
IFJlYWQgQ29tcGxldGlvbiBCb3VuZGFyeSBvZg0KPj4gLQkJICogMTI4LCBzZXQgUkNCIHRvIDEy
OC4gIE90aGVyd2lzZSwgY2xlYXIgaXQuDQo+PiAtCQkgKi8NCj4+IC0JCWhweC0+cGNpX2V4cF9s
bmtjdGxfYW5kIHw9IFBDSV9FWFBfTE5LQ1RMX1JDQjsNCj4+IC0JCWhweC0+cGNpX2V4cF9sbmtj
dGxfb3IgJj0gflBDSV9FWFBfTE5LQ1RMX1JDQjsNCj4+IC0JCWlmIChwY2llX3Jvb3RfcmNiX3Nl
dChkZXYpKQ0KPj4gLQkJCWhweC0+cGNpX2V4cF9sbmtjdGxfb3IgfD0gUENJX0VYUF9MTktDVExf
UkNCOw0KPj4gLQ0KPj4gLQkJcGNpZV9jYXBhYmlsaXR5X2NsZWFyX2FuZF9zZXRfd29yZChkZXYs
IFBDSV9FWFBfTE5LQ1RMLA0KPj4gLQkJCX5ocHgtPnBjaV9leHBfbG5rY3RsX2FuZCwgaHB4LT5w
Y2lfZXhwX2xua2N0bF9vcik7DQoNClRoaXMgd2FzIHdoYXQgY29uZnVzZWQgbWUgYSBsb3QsIHRo
ZSBiaXQtd2lzZSBOT1QgYWJvdmUuIFRoYXQgbXVzdCBiZSB3cm9uZywgYXMgcGNpZV9jYXBhYmls
aXR5X2NsZWFyX2FuZF9zZXRfd29yZCgpIGludmVydHMgdGhlICJjbGVhciIgYXJndW1lbnQuDQoN
Cj4+ICsJCWlmIChocHgtPnBjaV9leHBfbG5rY3RsX2FuZCkNCj4+ICsJCQlwY2lfaW5mbyhkZXYs
DQo+PiArCQkJCSAiX0hQWCBhdHRlbXB0cyB0byByZXNldCB0aGUgZm9sbG93aW5nIGJpdHMgaW4g
UENJZSBMaW5rIENvbnRyb2w6IDB4JTA0eFxuIiwNCj4+ICsJCQkJIGhweC0+cGNpX2V4cF9sbmtj
dGxfYW5kKTsNCj4+ICsJCWlmIChocHgtPnBjaV9leHBfbG5rY3RsX29yKQ0KPj4gKwkJCXBjaV9p
bmZvKGRldiwNCj4+ICsJCQkJICJfSFBYIGF0dGVtcHRzIHRvIHNldCB0aGUgZm9sbG93aW5nIGJp
dHMgaW4gUENJZSBMaW5rIENvbnRyb2w6IDB4JTA0eFxuIiwNCj4+ICsJCQkJIGhweC0+cGNpX2V4
cF9sbmtjdGxfb3IpOw0KPiANCj4gQWdhaW4gSSdtIGFmcmFpZCBJIHN1Z2dlc3RlZCBzb21lIG92
ZXItZW5naW5lZXJpbmcsIGFuZCBldmVuIHdvcnNlLCBJDQo+IG1pc2ludGVycHJldGVkIHRoZSBw
Y2lfZXhwX2xua2N0bF9hbmQgYW5kIHBjaV9leHBfbG5rY3RsX29yIHVzYWdlIHdoZW4NCj4gSSBz
YWlkICJpZiBwY2lfZXhwX2xua2N0bF9hbmQgb3IgcGNpX2V4cF9sbmtjdGxfb3IgYXJlICpub24t
emVybyoiLg0KPiANCj4gUGVyIHNwZWMsIHdlIGFyZSBzdXBwb3NlZCB0byBBTkQgdGhlIHJlZ2lz
dGVyIHdpdGggcGNpX2V4cF9sbmtjdGxfYW5kLA0KPiBzbyB0aGUgaW50ZXJlc3RpbmcgdmFsdWUg
d291bGQgYmUgYW55dGhpbmcgb3RoZXIgdGhhbiAweGZmZmYuICBTaW5jZQ0KPiB3ZSBPUiBpdCB3
aXRoIHBjaV9leHBfbG5rY3RsX29yLCB0aGUgaW50ZXJlc3RpbmcgdmFsdWVzIHRoZXJlIHdvdWxk
IGJlDQo+IGFueXRoaW5nIG5vbi16ZXJvLiAgU28gSSB0aGluayB3aGF0IHdlIHdvdWxkIHdhbnQg
aXMgc29tZXRoaW5nIGxpa2UNCj4gdGhpczoNCj4gDQo+ICsJLyogTG9nIGlmIF9IUFggYXR0ZW1w
dHMgdG8gbW9kaWZ5IFBDSWUgTGluayBDb250cm9sIHJlZ2lzdGVyICovDQo+IAlpZiAocGNpZV9j
YXBfaGFzX2xua2N0bChkZXYpKSB7DQo+IC0NCj4gLQkJLyoNCj4gLQkJICogSWYgdGhlIFJvb3Qg
UG9ydCBzdXBwb3J0cyBSZWFkIENvbXBsZXRpb24gQm91bmRhcnkgb2YNCj4gLQkJICogMTI4LCBz
ZXQgUkNCIHRvIDEyOC4gIE90aGVyd2lzZSwgY2xlYXIgaXQuDQo+IC0JCSAqLw0KPiAtCQlocHgt
PnBjaV9leHBfbG5rY3RsX2FuZCB8PSBQQ0lfRVhQX0xOS0NUTF9SQ0I7DQo+IC0JCWhweC0+cGNp
X2V4cF9sbmtjdGxfb3IgJj0gflBDSV9FWFBfTE5LQ1RMX1JDQjsNCj4gLQkJaWYgKHBjaWVfcm9v
dF9yY2Jfc2V0KGRldikpDQo+IC0JCQlocHgtPnBjaV9leHBfbG5rY3RsX29yIHw9IFBDSV9FWFBf
TE5LQ1RMX1JDQjsNCj4gLQ0KPiAtCQlwY2llX2NhcGFiaWxpdHlfY2xlYXJfYW5kX3NldF93b3Jk
KGRldiwgUENJX0VYUF9MTktDVEwsDQo+IC0JCQl+aHB4LT5wY2lfZXhwX2xua2N0bF9hbmQsIGhw
eC0+cGNpX2V4cF9sbmtjdGxfb3IpOw0KPiArCQlpZiAoaHB4LT5wY2lfZXhwX2xua2N0bF9hbmQg
IT0gMHhmZmZmIHx8DQo+ICsJCSAgICBocHgtPnBjaV9leHBfbG5rY3RsX29yICE9IDApDQo+ICsJ
CQlwY2lfaW5mbyhkZXYsICJfSFBYIGF0dGVtcHRzIExpbmsgQ29udHJvbCBzZXR0aW5nIChBTkQg
JSMwNnggT1IgJSMwNngpXG4iLA0KPiArCQkJCSBocHgtPnBjaV9leHBfbG5rY3RsX2FuZCwNCj4g
KwkJCQkgaHB4LT5wY2lfZXhwX2xua2N0bF9vcik7DQo+IAl9DQoNClNpbmNlIHdlIGRvIG5vdCB3
YW50IHRvIGZpeCBpbmNvcnJlY3QgZmlybXdhcmUgaW4gdGhpcyByZXNwZWN0LCB0aGUgYWJvdmUg
bWFrZXMgcGVyZmVjdCBzZW5zZSB0byBtZS4gQSB2NCBpcyBvbiBpdHMgd2F5Lg0KDQoNClRoeHMs
IEjDpWtvbg0KDQo=

