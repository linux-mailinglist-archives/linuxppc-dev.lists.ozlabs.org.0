Return-Path: <linuxppc-dev+bounces-552-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D55195FBF3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 23:45:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wt43j2lfqz2yDM;
	Tue, 27 Aug 2024 07:45:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::62e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724696273;
	cv=pass; b=YNSo+rMPqAdq9Bs2kHIbrn1amVg/Nf2d1+RKYi/lfLPhtkPflMD3p9Vt6VGNruqCrBzYg605DyASidktRDkOZ5lMLqSBiuSv5HCUWQEMIo0lXIA2n6MKVSOhDKVhnmmuoGAMzi/v7xhFLxih3jAvy3uumqp6PxNz82l/VTHU3l2x0GB3gpVmCAfBY6QGS8rQyAN04SRe312eXWcHWlkfrn5i+YVnVU5yitJ1eeV97dB63pdBxV6qI+WdeizNN2FYmieGraoQREmpb5Ql66MnaPxTcHdsm7KgEmE11ZPDxqjNRNArtHQK+VVkLeAMy4DwBTF8cTbIWW6m7A6t/jhZ/w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724696273; c=relaxed/relaxed;
	bh=VM8HSFmdHRw+Kj/DB+BjLklFurgWXdhNeGXSyXH/nTw=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:MIME-Version:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jgxrlTkn; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::62e; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=bfaccini@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jgxrlTkn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::62e; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=bfaccini@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WszS04qFXz2yDj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 04:17:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEySrexGko8YVVzC6WCTldB5xgQLS14M7MYpAjU5k8ngBCeN1DTExL7WiMAcJR/d2vXrcsK5E+szvr47zYXytv7x9zIOJB0mCYGAHJNK+DoUQYugUwiDPrGmyH9c9Ntu6J7NRIGCLHEhHccKMVP08fY17B37LrkN4mxpI7NJwsRLeJ0xHM0noc2CPDnRcBWow3vttMf31O2vfbtOyHIm1nGtTgoCk5oQgv3YwzkGj0T87LAEjlfCiqtDwGrcPDQczmxHyH2/ZsOytffc9e1zTL4JCBNGLRGvCtxPXllBLd3LaCcdQWSqu5Ib7KT1/kJcjYgEb6KPZK0O1M7nXP+btw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VM8HSFmdHRw+Kj/DB+BjLklFurgWXdhNeGXSyXH/nTw=;
 b=tCsnzaxXmsm++zRfrEYq4r/MR07TLDkVUz68vkn3plYtQ0S9PReQxop+JJ2MPptuYBCYYWkMXuKhkxylRh3xZsw02yXrsWaP4jFXwVBi15TPWl2TWy7rY1CKGb7yry/qn35WTPQZr3YyKSWhCiy88leFDqj7iP8k9WeqTObJVpKLWG1G6xKJHUcfGKK7CjQYV4e/n1evbK2P9uFpoWouKxxCpQopPCLcw4J/2zkLVMmeYMKqqJVhEm+6mBkSOMrdLAF3k4mBcAv4R2pKVi75c0pTAsDGKz0aDQG800nGcNIvU5RLCjjlz72FMcH4kOtk0HGgiOXknr3mqop+JSXUsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VM8HSFmdHRw+Kj/DB+BjLklFurgWXdhNeGXSyXH/nTw=;
 b=jgxrlTknuTGzV28VUbbIWTaUTjGAIAXOQQgJm8I3lwe2+ZkyD14iF3pKUyewH84HbkIhdbQX3zEwlEeiZrtp8ZLLjaPcRZ33+X212fczN1+JeSl7nmVmMCuxoMbggH6Q+b02io4SraH5fjWMoJamDNWUJFf4s/sO3K7Hgd9mD8LUVgJvJBr7SCpxvY9KqjnYp+/PnPh8CFofvxTAJU4b6DgVCXiZJtDr6j9qAtQ3Vj3iGlifJ6gydzhzQ9y1Co1ZvMW7dT5jS0TlMXJTaXR00YRJ69nIh/mOO4pyKvVwHpVUVHanmINpXHAqSMCtt40GfZf3B3PHdb6QPM7wg/3blQ==
Received: from MW4PR12MB7261.namprd12.prod.outlook.com (2603:10b6:303:229::22)
 by LV8PR12MB9272.namprd12.prod.outlook.com (2603:10b6:408:201::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 18:17:28 +0000
Received: from MW4PR12MB7261.namprd12.prod.outlook.com
 ([fe80::d231:4655:2e3d:af1b]) by MW4PR12MB7261.namprd12.prod.outlook.com
 ([fe80::d231:4655:2e3d:af1b%3]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 18:17:28 +0000
From: Bruno Faccini <bfaccini@nvidia.com>
To: Mike Rapoport <rppt@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams
	<dan.j.williams@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, David
 Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>,
	Davidlohr Bueso <dave@stgolabs.net>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Heiko Carstens <hca@linux.ibm.com>, Huacai Chen
	<chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, Jiaxun Yang
	<jiaxun.yang@flygoat.com>, John Paul Adrian Glaubitz
	<glaubitz@physik.fu-berlin.de>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, Jonathan Corbet <corbet@lwn.net>, Michael
 Ellerman <mpe@ellerman.id.au>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Samuel
 Holland <samuel.holland@sifive.com>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily
 Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-cxl@vger.kernel.org"
	<linux-cxl@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "x86@kernel.org"
	<x86@kernel.org>, Zi Yan <ziy@nvidia.com>, Bruno Faccini
	<bfaccini@nvidia.com>
Subject: Re: [PATCH v4 24/26] arch_numa: switch over to numa_memblks
Thread-Topic: [PATCH v4 24/26] arch_numa: switch over to numa_memblks
Thread-Index: AQHa9+PnbbKOeq9MZUCqeSdNNiH7eQ==
Date: Mon, 26 Aug 2024 18:17:22 +0000
Message-ID:
 <MW4PR12MB72616723E1A090E315681FF6A38B2@MW4PR12MB7261.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7261:EE_|LV8PR12MB9272:EE_
x-ms-office365-filtering-correlation-id: 0a953250-4b78-45a2-5f4c-08dcc5fb57fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?WCCi6zb54X3YnWFFAst3EJov2lI7PgFVtNaPzBbWHbwWMQJC3DPzPyE4lxrf?=
 =?us-ascii?Q?IdYw0PJULtH9/7uzeydseXWsQS0/KK1R6YY9lHwaKu1suAvJhVojMYrSA/54?=
 =?us-ascii?Q?ZduqS0xqQSlEsYdRdjwdrGpDU2ppWwjoXpXbtfDgWrDDSOltFyvqdd4tt3MP?=
 =?us-ascii?Q?upExSbsI+a57Yw6XvCuUBGgooZKSytgbEB3gjeTpIcVx9lbv4uyPZ/NMn/v1?=
 =?us-ascii?Q?1FFjoaMBzLxVS5ij1U1tuZF9d8CFSNmzqTtkSZz8iDLXLLmp/ShyBRhnYGXE?=
 =?us-ascii?Q?WtH2HnPQb7FKxZi+KVUVyGWg2eEH+JZ3F2L4oqgZb7RbshOcsO7ddeD6rgIS?=
 =?us-ascii?Q?XkZ8PdcOb8TAvEmAOBJNGi4H80TxPfTzcpVE+iozn+czdJZjqLpomCcL+iei?=
 =?us-ascii?Q?8rQOE4lHf6Ql9dgkYUZ0N6UTpLhCXTRsjvW+ms7EDeZ3hOXIWr7Qi263ooKJ?=
 =?us-ascii?Q?iQWZhXUVXjGhGkMejrRedkBh7sO6kKpQ99k3mKlJlFztYP7hc1uumrv4WUQz?=
 =?us-ascii?Q?jfCAtw+6xelopJ9hihYq9qthWC198bbryyZF0X0cEYUmC+dL1JYAYrZ+8Go9?=
 =?us-ascii?Q?U1nqiSq7Y/MTJuvi9ncODNMwSGVvfTuy+zp3LUrECPLoM0Mmyti9ouyR34Lh?=
 =?us-ascii?Q?w6we/wPp79hcb8cc6VfUGW4D4Xff9PVI1+8Tu4XKMJURlfzMeZZelI2JzvNY?=
 =?us-ascii?Q?+Pg+GbFXRDmGYlt7Lqytswku7bTVaAIvabGpBi8dI3z1KLFv5gDY4Nye8zp8?=
 =?us-ascii?Q?o9P7+u99sr9pEhTysOa0Rof9Nl2AuvMNpnFZRSxKT9IE6Qk3HgyJqiO2n0Ox?=
 =?us-ascii?Q?pqmM7TQbCWnTQtPLssw2rbQxnX74tjO2Yt2a12aLnJW+gmRzxssGKVptK0GI?=
 =?us-ascii?Q?C+Xj7Y+hYzokGV+pijQ7GNqBVaRgUR36J2XBIgCQ7nSoNvZXNdZ66QZ5kBap?=
 =?us-ascii?Q?Gvc1eC0R7rKbBbo8SZRYL/9MWdg6MK6maph+c9WJvq2K966bdchetf4Ntf7o?=
 =?us-ascii?Q?hw7LBAyaT8SoXiM9HqKJpmeQld28ZOdx+3jl+pmUdy4BKQLv23t15QylzNkv?=
 =?us-ascii?Q?S5h61DGzJJxSAh8D95s0u9DBuImXllY3fZ6Tq5KWdbCEeXsWbI0iM0ol43h5?=
 =?us-ascii?Q?dUiPoOkF5pLbojn/0S165mu+VxVkan7+m+HyOlzeTYBw2qDDQkRfIW69JmvR?=
 =?us-ascii?Q?G8zwE2mE5BsFbogFpr/PTADAZFaLALmVmCrsQJGrSrkFJYkcIePLsHBsJC2h?=
 =?us-ascii?Q?wYyY9yJDO7l11WykzM/FQQBJNydIvy37ex9bj+zi7ew0zfY+OTBaaiq2vlBy?=
 =?us-ascii?Q?Cw8c6hNPPRFNVuXCxPWMCwF/FZmXTqa/Sf22/S1YfGOzHY91CBNzxE1oJGbR?=
 =?us-ascii?Q?ba5Fk579pns/2310LrjA7PsEJzX1o1Zw/K0q74//ZJp6mMMnZQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB7261.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Y2+GQAowM/iaIDHLHb9dWAAoOrSMJzqkOGTCLBs3AObEdDG0VN1uUET0+1ug?=
 =?us-ascii?Q?6q27pKnkrCt8BQog4LX/1ziXooDNUss1hIiiJVRC50Jv8E16EUxAiOYhOrM8?=
 =?us-ascii?Q?/eEJ8V24UeJbRsmWhrA9UgGJu6fhFnaopWaP4R3+T/Uapl/CVMhkcy3zAC2u?=
 =?us-ascii?Q?LePMGJG+QwaT3con+8GyT3ilQLMyD5/yy7jg+mFjXmadJca5mQlK+r3RXJEh?=
 =?us-ascii?Q?AZpt34T3iEMDSDsnt8ODjLf3NkPGvopGs8zgnpU8hdmTBXOcwYshy23LHF44?=
 =?us-ascii?Q?0MFmF+CoXrewji6mlPC74qEzOC9lUJZ5fVDR8l+Gc2j+LB27wiQ3zJopUO4v?=
 =?us-ascii?Q?Q0FiWS5kHCQv5lKhiFTdv2h72R28S8MLHQhC6fSwSGHzZLBHaJfcfrZ/9QfN?=
 =?us-ascii?Q?tIgdmJZDnKmgT4CxhKMcbBVMsLAoaF9SRgstT0w9TA2Exf6fye+oQ9mDYcw3?=
 =?us-ascii?Q?jyOtEjSJxgDXIFvtIDj9ftLUjgZTYEzZaTksZJrdbDVYITUkRHtNpujGJ+iQ?=
 =?us-ascii?Q?eBQUI3X1sfYra5HEN9qVa1IaoIVVuHK+/I8WIKlbPoF1cDuqiwuzBPGB8eX3?=
 =?us-ascii?Q?rrr0iiG/wfprxLcogXlOIIiKe0l+bPtfZq6KcSfoSfNIc1ciPEYBWQhtVtYJ?=
 =?us-ascii?Q?KfwuaCmjzLB+dJExRJ9RFqrvfu6pM2dmxsYLxz5RQ05rBnK1jRFn/U/jqTHm?=
 =?us-ascii?Q?pIrog2EVSQz2qe2G1gwhSKIGpQo3rJP6p1/h7pYKQQUzx8MTMKvcp/PR5Rlu?=
 =?us-ascii?Q?dX19FeGV0pENh2XXuIvJPhPGOt2Lc4YrqNSpTdSmCJerx7c0gGRJ5AKnEqYD?=
 =?us-ascii?Q?21kihEmceNXgo2TQXJl/7+pLYc9ijejdEmcqLEcq9d14eWnZ/GbFfpRwiKAt?=
 =?us-ascii?Q?cjF8erSSuRnYrychKXcMD+rmK00DpmmKDvfrBl/b9Bwm6CcaO2tqpZqdMgHR?=
 =?us-ascii?Q?v0YfTaBLKcF8LH4qc1hx7L9xmLdTC88pifUyUscDuQxJS2PkY/af8T3buCAO?=
 =?us-ascii?Q?qKbdF4YeEQ1eB/KB+lZSV/ij3Ht6C07FvciUYxnV447mqx3gjTmuHexKMY8J?=
 =?us-ascii?Q?sadflXHBtC6xfXfu1hogdihdyoRQKiLFQDGL9peqvvH0Xd2+H/eONc363G0Z?=
 =?us-ascii?Q?M/XxDJQWPoW6KfjFdWrTw3T4lYt5ZcBjoRZUToMzQgKrszExAlF0lkeifkNN?=
 =?us-ascii?Q?V4RR/59eZXY+dWCUaUlygfYwxANQw4LpCnKT6QXbp+UnaqZzOfaORhG1Hqkl?=
 =?us-ascii?Q?dMLRph/DMo2fUYIHXPMi+IpNFDnhiDjujoAl/C0DPkRoTXdGXDos5nMBpHgq?=
 =?us-ascii?Q?0p0E1E+v+/ZPV6Blsy9EsnzTok7wKXrgPDo+xqWGaUccEk54jco2r7R2QkwW?=
 =?us-ascii?Q?7fevh6qpGbx0hFkOU5koJNI9l5nqgvYhaXwqCT9uzD8woPm/f1LgznWJHggf?=
 =?us-ascii?Q?1Tffj4rXk7xqG0RqeJGdRdhkjSADzy226G+ZTHtjrBzakuYByTtKYbclu8tR?=
 =?us-ascii?Q?BhDoipaSES+WuUv4My5Lq4l98K/VdmHuBbpVldpHSuqB6cYMlv+o96VPhKf0?=
 =?us-ascii?Q?b9EtxnRZFLKVj6cbI6VFThkO4aHhqazo9m1yUxCX?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR12MB72616723E1A090E315681FF6A38B2MW4PR12MB7261namp_"
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7261.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a953250-4b78-45a2-5f4c-08dcc5fb57fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 18:17:28.3296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P7Kf4GKF2/bAvxUeuwvm+Le8ngFSQMRIft+pDj3c8hDJhzCB3vVIWm0DubdhnoYEoJBTjVDaE/7i2s7T4+uwjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9272

--_000_MW4PR12MB72616723E1A090E315681FF6A38B2MW4PR12MB7261namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 7 Aug 2024, at 2:41, Mike Rapoport wrote:

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org<mailto:rppt@kernel.org>>

Until now arch_numa was directly translating firmware NUMA information
to memblock.

Using numa_memblks as an intermediate step has a few advantages:
* alignment with more battle tested x86 implementation
* availability of NUMA emulation
* maintaining node information for not yet populated memory

Adjust a few places in numa_memblks to compile with 32-bit phys_addr_t
and replace current functionality related to numa_add_memblk() and
__node_distance() in arch_numa with the implementation based on
numa_memblks and add functions required by numa_emulation.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org<mailto:rppt@kerne=
l.org>>
Tested-by: Zi Yan <ziy@nvidia.com<mailto:ziy@nvidia.com>> # for x86_64 and =
arm64
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com<mailto:Jonathan.=
Cameron@huawei.com>>
Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com<mailto:Jonathan.Ca=
meron@huawei.com>> [arm64 + CXL via QEMU]
Acked-by: Dan Williams <dan.j.williams@intel.com<mailto:dan.j.williams@inte=
l.com>>
Acked-by: David Hildenbrand <david@redhat.com<mailto:david@redhat.com>>
---
  drivers/base/Kconfig       |   1 +
  drivers/base/arch_numa.c   | 201 +++++++++++--------------------------
  include/asm-generic/numa.h |   6 +-
  mm/numa_memblks.c          |  17 ++--
  4 files changed, 75 insertions(+), 150 deletions(-)


<snip>

+
+u64 __init numa_emu_dma_end(void)
+{
+             return PFN_PHYS(memblock_start_of_DRAM() + SZ_4G);
+}
+

PFN_PHYS() translation is unnecessary here, as
memblock_start_of_DRAM() + SZ_4G is already a
memory size.

This should fix it:

diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index 8d49893c0e94..e18701676426 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -346,7 +346,7 @@ void __init numa_emu_update_cpu_to_node(int *emu_nid_to=
_phys,

u64 __init numa_emu_dma_end(void)
{
-              return PFN_PHYS(memblock_start_of_DRAM() + SZ_4G);
+             return memblock_start_of_DRAM() + SZ_4G;
}

void debug_cpumask_set_cpu(unsigned int cpu, int node, bool enable)



--_000_MW4PR12MB72616723E1A090E315681FF6A38B2MW4PR12MB7261namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;
	panose-1:2 11 0 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
span.apple-tab-span
	{mso-style-name:apple-tab-span;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-FR" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:black">On 7 Aug 2024, at 2:41, =
Mike Rapoport wrote:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">From: &quot;Mike Rapopor=
t (Microsoft)&quot; &lt;<a href=3D"mailto:rppt@kernel.org" title=3D"mailto:=
rppt@kernel.org"><span style=3D"color:#0086F0">rppt@kernel.org</span></a>&g=
t;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">Until now arch_numa was =
directly translating firmware NUMA information<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">to memblock.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">Using numa_memblks as an=
 intermediate step has a few advantages:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">* alignment with more ba=
ttle tested x86 implementation<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">* availability of NUMA e=
mulation<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">* maintaining node infor=
mation for not yet populated memory<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">Adjust a few places in n=
uma_memblks to compile with 32-bit phys_addr_t<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">and replace current func=
tionality related to numa_add_memblk() and<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">__node_distance() in arc=
h_numa with the implementation based on<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">numa_memblks and add fun=
ctions required by numa_emulation.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">Signed-off-by: Mike Rapo=
port (Microsoft) &lt;<a href=3D"mailto:rppt@kernel.org" title=3D"mailto:rpp=
t@kernel.org"><span style=3D"color:#0086F0">rppt@kernel.org</span></a>&gt;<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Tested-by: Zi Yan &lt;<a=
 href=3D"mailto:ziy@nvidia.com" title=3D"mailto:ziy@nvidia.com"><span style=
=3D"color:#0086F0">ziy@nvidia.com</span></a>&gt; # for x86_64 and arm64<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Reviewed-by: Jonathan Ca=
meron &lt;<a href=3D"mailto:Jonathan.Cameron@huawei.com" title=3D"mailto:Jo=
nathan.Cameron@huawei.com"><span style=3D"color:#0086F0">Jonathan.Cameron@h=
uawei.com</span></a>&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Tested-by: Jonathan Came=
ron &lt;<a href=3D"mailto:Jonathan.Cameron@huawei.com" title=3D"mailto:Jona=
than.Cameron@huawei.com"><span style=3D"color:#0086F0">Jonathan.Cameron@hua=
wei.com</span></a>&gt; [arm64 + CXL via QEMU]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Acked-by: Dan Williams &=
lt;<a href=3D"mailto:dan.j.williams@intel.com" title=3D"mailto:dan.j.willia=
ms@intel.com"><span style=3D"color:#0086F0">dan.j.williams@intel.com</span>=
</a>&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Acked-by: David Hildenbr=
and &lt;<a href=3D"mailto:david@redhat.com" title=3D"mailto:david@redhat.co=
m"><span style=3D"color:#0086F0">david@redhat.com</span></a>&gt;<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">---<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;drivers/base=
/Kconfig&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;drivers/base=
/arch_numa.c&nbsp;&nbsp; | 201 +++++++++++--------------------------<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;include/asm-=
generic/numa.h |&nbsp;&nbsp; 6 +-<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;mm/numa_memb=
lks.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nb=
sp;17 ++--<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">&nbsp;&nbsp;4 files chan=
ged, 75 insertions(+), 150 deletions(-)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">&lt;snip&gt;<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">+<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">+u64 __init numa_emu_dma=
_end(void)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">+{<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">+<span class=3D"apple-ta=
b-span">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span>return PFN_PHYS(memblock_start_of_DRAM() + SZ_4G);<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">+}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">+<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">PFN_PHYS() translation i=
s unnecessary here, as<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">memblock_start_of_DRAM()=
 + SZ_4G is already a<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">memory size.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">This should fix it:<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">diff --git a/drivers/bas=
e/arch_numa.c b/drivers/base/arch_numa.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">index 8d49893c0e94..e187=
01676426 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">--- a/drivers/base/arch_=
numa.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">+++ b/drivers/base/arch_=
numa.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">@@ -346,7 +346,7 @@ void=
 __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">u64 __init numa_emu_dma_=
end(void)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">{<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">-<span class=3D"apple-ta=
b-span">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;
</span>return PFN_PHYS(memblock_start_of_DRAM() + SZ_4G);<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">+<span class=3D"apple-ta=
b-span">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span>return memblock_start_of_DRAM() + SZ_4G;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">void debug_cpumask_set_c=
pu(unsigned int cpu, int node, bool enable)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_MW4PR12MB72616723E1A090E315681FF6A38B2MW4PR12MB7261namp_--

