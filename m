Return-Path: <linuxppc-dev+bounces-4872-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C353A066AE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 21:56:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YT0b01t07z30VL;
	Thu,  9 Jan 2025 07:56:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:2009::624"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736369804;
	cv=fail; b=CMhAb0G7hKVB5mA4JnuUC9mGH0T+8EwCuhdE5CrsCNn2WleGMrCx4hhIbQR1cU4DXDEvnnCDVPJq2cYSpXzaqu0Z4WfY7An/IpenrOjrmZDJgTFM0D7Uo+9wOHeKnKFCg8fpyE/vDFmbGY9I+TeX6bSS510ZBElZq/4PQq5UscDQhzHLH6djv5BjagKatch8A6S0vaoFA/wySsqBl98AaQ8ooynafOtkCh3P62lXJxz6/C0IaLgy415MIxuX36i2bbHKfog4ZrhWLc+UHd1fdi1Q2Ps0AWeo2Wwvbwz8onueZ/5Vy7t1KTDLtejGle3u+sstLdURMy3OzLjn4NQ56A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736369804; c=relaxed/relaxed;
	bh=n6HnHhdGqQ2nqMMTQbNSKaVJ4APwMFG2lrCysZJ8r00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A1Q0kvQtmmWMthzAbGKK0DBLYiAyRYPw+6isl4i8ZS2yDCR9DIYbxPkjCSBcrT+fmD/nz2+84DNS20u4YqP2T/c0uxUX+2UVOw/pqFlIfnqcxT0m0xByee9mu6QLFg1GhNg0D7hbBnXirN37gJdOlUoOqQ9wkP0hgqw0LLmQCuPw4mjysJejATmzZ6p5heZWkFchkre5u/+rJMJ2uvOgpXKYQXE03KYHKxCDPslCqtWoxe1V6GB2oDPU3SlFsLi8iwUBJUC1GoyuLUu4LUkcczEyd/+F0xIwQvSHtT4T5BEsHqxn0xs7u08jhKw4oroGaOqBGlZVT59GoXi4ApVjSA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=fail (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lB9T7v6l reason="signature verification failed"; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2009::624; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=yazen.ghannam@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lB9T7v6l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2009::624; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=yazen.ghannam@amd.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20624.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::624])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YT0Zy64HWz30TM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 07:56:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y33zeN5pEo0DI11vf5t/SV5/SPDteYEl4qmHrA1nRvyjLlQrKjUGHhtjygR0hk91McZknBtosV9M9XSMjjv+v3EriP4TbN+YtAk1Q78I3rVfKHJXbOf1YYuClqgsRbdzUYUWKY8/0hEv9/qh8w+zUUCqwvnW58yiWcAiq3o7DNhbaE4L1yKUJkv2JUc8PMJONCLLoSOH0/vtnQ+QlXJlEHaN1FTr7+KlRkZMH1HYsJmQSFYYPfZbYgu9uwHPNV9ccG68pGqhQd47QMKPJ3iqF0prFv16qYEantDKl0GTOuUyyHpxIOuBW2u1lMqJQv0f806oavO6rWsmCHYwG34rKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ol5QEW/yl9DTDn0YLynCm/t0EeVmtsC4WwSVLZaQUE4=;
 b=bOBCVAtKoOP9r1m1iFK0mqMr/koDa4gmz9jKM6wJkukoVVZhhVVRolBdJBI8o4HSK402OpfIf3puqhOWIDjRDpeuPzJlqiWiBtmtSAec3tQTOFuYTMrx5jcD1xoRQIJl4x1r4yOZtkG0J2cI49YlDbt48HlXa19Agwh4+/wFVakO4jOlXJjngbB2b6pthAMSNxZ+bWXIrgRTmVX91kVjL0GXdNXq/rwDp2lnrxS3n0wvIb9VTTojyzrTnO1DLYBVhQJevrbKS4UlSGw4mGpEhTjNs1S/Z4m3BnULG6UG8FugUS9o2Z18LjCkL8zcGKv6uvmM8Y5V5iB9FsBs+oqkQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ol5QEW/yl9DTDn0YLynCm/t0EeVmtsC4WwSVLZaQUE4=;
 b=lB9T7v6lFNQW/YeyuNI/hQEo1bojWNy7GUdcKZzIoIqjmpKjY2xw/xN7sjgN0T2EPTdPdxJS2Rba/arFkv9qYkwkfu/r73WkDDoQ3RMjWxJ9As7ijaERxnZWp7PIOR9nFKwFQ/EFp5bj5X7fAo5VBZiStJD/IknuzCk9e0v0JpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 DM4PR12MB5747.namprd12.prod.outlook.com (2603:10b6:8:5e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.11; Wed, 8 Jan 2025 20:56:21 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f%6]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 20:56:21 +0000
Date: Wed, 8 Jan 2025 15:56:13 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-kernel@vger.kernel.org,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 5/7] PCI: Store # of supported End-End TLP Prefixes
Message-ID: <20250108205613.GB1342186@yaz-khff2.amd.com>
References: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
 <20241218143747.3159-6-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218143747.3159-6-ilpo.jarvinen@linux.intel.com>
X-ClientProxiedBy: BN7PR02CA0035.namprd02.prod.outlook.com
 (2603:10b6:408:20::48) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|DM4PR12MB5747:EE_
X-MS-Office365-Filtering-Correlation-Id: 52b292a2-4003-4fe3-2ec4-08dd3026e789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?gjhAOw4Xpnz1ouSdB3M1s1aiUfyuL52LgYcbjVOBLx+E1ouGF4c9NrOkr5?=
 =?iso-8859-1?Q?DElTVx6MafMk51qh/BLWSuRfn/Vl9fEtdTktOHoX5DnlYoKNuIqx471VKg?=
 =?iso-8859-1?Q?DYN/bJjcjbQwlxevX9KZgN9ZtM3Cb6JeVRXB/bfWZ5CE2KUocppnMvLl5X?=
 =?iso-8859-1?Q?j31HkRoUbxi7lrXMOV6WTgCxWpKkSHfEpbgmB+67coEW191voxGCw01x/2?=
 =?iso-8859-1?Q?uMWtkrJHhAlw/fk/PcLo1ND1SruYaUwK0C9zVIpc2QIh2tvc9HMT8qxaB7?=
 =?iso-8859-1?Q?POjrBn1UdIXRU2Hqef5JuhNYREVwPo6s1DAknXei1V6SDpaw2gqZiK2cXb?=
 =?iso-8859-1?Q?oCOU9aOm0EFUft6spR9v0KA9rp8dCsFz0H3mD4bophO8TWf4QPT7I2M/h1?=
 =?iso-8859-1?Q?QVTRyVb0VljIBues9Q/6NWPEhrIh3QkxOojUoFbNZDOD3CxVPqjv1CrmC8?=
 =?iso-8859-1?Q?8DYZDJ+gcAp5+wZOPsXNI4Ef94dNj10TV3uPozhrTbkUaiN0XLoL8WfF7u?=
 =?iso-8859-1?Q?qktHONvyQciXf6f8EJOJx5PsgFSQNXY/0Qzd9PKwXVBeg/fBrVk1u4Bahk?=
 =?iso-8859-1?Q?E1CeEeIetJBTS6x/jGQ1HAUQR+l9mm6u1MJ7m2ih5TucOa1Wnu0wrVgGsh?=
 =?iso-8859-1?Q?H0O+4zvllBLtIPgilHmfVxrtYVBffiBUQeJ8fU1h/wqCfv5YmTAhX5uyZ+?=
 =?iso-8859-1?Q?MDj3kkfV5bPVHVRIT5czCbgmz+I89Oi8eSw6MZ09VSrN0dgyjB3J8hsi2J?=
 =?iso-8859-1?Q?SzZC/7DfJ6AoltKIRmUYRO832zjsLgu1W9MOVYiEpFFUTW8hy8tR2QGiWj?=
 =?iso-8859-1?Q?kEh6lMPL6xCnWDiqsmzb9QWhRLGjfkX/hy55iAo2T7TDjK4bYLWj/WV/qf?=
 =?iso-8859-1?Q?n1hA4kzWxGQ2CDMcmIV3BGO/O+qLjLZ+MHeWvKs/fhc+8noMMnwlNYwmE8?=
 =?iso-8859-1?Q?i04l3RSFG0sWFw9H686shPGGKGFit3j285s8QPQYS1OKyvIRHPXMPrG4kK?=
 =?iso-8859-1?Q?WYI2Qg2SrA6Lfe+MMSVog+ZZ10Bje0rKj+yNKJSb1/18oEg4ktF+Im2CTe?=
 =?iso-8859-1?Q?C0mXAQzTH3kf+g4OUy1t/Hysee9OEGA2qq6zOoG2TOds90kzYuuZS+TbaD?=
 =?iso-8859-1?Q?zkzZzhsQtNyweV2xdq9DgkewEs6vF+jCIlY/68afuGGQfNpaXGsZux3V4J?=
 =?iso-8859-1?Q?RT9PI/+f5mb8Bh3YnBvuSrlS2+IZ9YzyqWhx06mK3327wbWSEgbl8+DmJS?=
 =?iso-8859-1?Q?4okaTHBGBPRH1cNCYY7ax3IsEtldufUGoB7wgvYSXy23dKONb3eADIYJ91?=
 =?iso-8859-1?Q?jn8NUa2z/QKhn3A59h9kyUP9tFaTOuF8dHbCW5QbzBrqfNtMMZg1+gY3IR?=
 =?iso-8859-1?Q?lXC2sm/qJASLi/I4QQhaVctrvYAX+JbRB528QT/UUWGoZ47zTedzmP7kdJ?=
 =?iso-8859-1?Q?f/vfojZWsNnhZ80M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Rzgnotx1bsd08ZJhXFecQllmrgYwuBYnfhnDBn1DxgRcI5Ijuu6CQbDcS/?=
 =?iso-8859-1?Q?36eplPXAulzpIY+bg1rrh+UzrDXkoLbyJniBxnsjIwSyLZOl/2QGyw4Kqa?=
 =?iso-8859-1?Q?74eo0EStemef3IhI2nxnLUU1bXERZp0QGNcpnlg3Fxas0TSF2pOLow5cig?=
 =?iso-8859-1?Q?AqYP9SybWf6ZKNLd718XHZwbb9O1awbb5o09HFRAplOSXB7k4QpcLDLY0t?=
 =?iso-8859-1?Q?PNlODnJDN6EWnUdYLzkD8xFNGr7vDlob0hghHrpr+5mTZp9CFgJvSiEeYI?=
 =?iso-8859-1?Q?YMexhOiofwf0N2CFI1EL0BvGyb4fS4AQ840TxKRqz5xccu4oQPARHklNtZ?=
 =?iso-8859-1?Q?oMQ6yTD5rFrfyylCosV2gWArYW2BDJ12Kbg5yrtEmGcvkmBskPgFqol5N2?=
 =?iso-8859-1?Q?/JFaBTisynILDR0KgX3HA6/SfewSUA2c15Tw5kzMDPUbaMlhvQ3VYWtxDg?=
 =?iso-8859-1?Q?VH+HbFEaZuRyeSvAXJZgO5oIIsGwbdLTDOVjB24CSLUOfi6SV96ZnzIO9g?=
 =?iso-8859-1?Q?SuTzNtxMwK0pbdK44G1PVR74dTL0r5SVU08yliFMgFAmKAsgZuNgaxfHq2?=
 =?iso-8859-1?Q?LvWnTeMwYaUTxqoE0RN/ienxFhmvcwVlDcvSECwD8b8oFINBSPx7D4DoFW?=
 =?iso-8859-1?Q?10hRRWw0LJxdMRa1SIBV/+sHQWFwCNcXqIEGL7ZF2ef0wJvgtYH1VcoJw+?=
 =?iso-8859-1?Q?AVsduhp/oCzg5GADuPcmyDKA+DqlNDDs+RykpsfzrfUXQaZ5h0Pr9Rni2I?=
 =?iso-8859-1?Q?ng7bh7va5p6fQjqNZ+JwNmM8lzPrtNbsTHeFfTRhl0o65lElIrN4qW7huk?=
 =?iso-8859-1?Q?quGezftHHI1G0cigfpzNPoxUTeBSUvQ01ZQcMlr0cV4GDvH9Z/cjDOiBCD?=
 =?iso-8859-1?Q?fsOUbkkW9xEOdPM+EEUnDxcOSbmNQA6eDeFPQgZNR/bbZyRZTUD7nkTwa2?=
 =?iso-8859-1?Q?3pkYwSz5RAcTaQftkHkBXW8SLeyearP22yRkzJRhtRdY1FfzUE6UHo0v+v?=
 =?iso-8859-1?Q?esAtClPUIT/VqUQm4RBgOBiCf5MEDmy9P3FVOK+fmJx501t2H7pem61Nc3?=
 =?iso-8859-1?Q?sh4hJjjmPucmGSpSt3bnzl+P4AIDNLK19J9kV7gLnLwyie2cl0jK/4Jpbg?=
 =?iso-8859-1?Q?ypeU6UuTjKZctYMEqe8hryHa5z77yUgGKjupzIwLl6wQOSw7hTExTkQoQ9?=
 =?iso-8859-1?Q?BfhWEyPL09lX0Z5+g1/zArvcYhSVJNC0cWAFSlWTT9zCqL29bl60v+pRO/?=
 =?iso-8859-1?Q?GkT8WEGFCq9ZWx4Ot2+Nk3HJSGs4JMZlNNT1b6gwJyPhaNRU+nJzz9UQQL?=
 =?iso-8859-1?Q?OUlWrNsxB+E+BVBrbHWDExV5fyCBlDBn9x8x5NpC0QdLYIyngSJW8o7tUp?=
 =?iso-8859-1?Q?aRxqycVaNNIH/pWdkkrB4c7N9Go2tMoLDXI1wzF03C5QfJwTSPW27wQAJu?=
 =?iso-8859-1?Q?0XQuEsfTOPX7QWXlyzdUtypUjAM7d68+v1Cs7OHQ4JxfjgFGqm23pDb/kj?=
 =?iso-8859-1?Q?PJ2k0aVCURT+UejzxfIxCBdH85MYIQTmLaBrrSFcewa3EH87HHFT7EIcES?=
 =?iso-8859-1?Q?dFPHdAUIm8AwZWHXrLNqF2yGg45aigN38TH6hDjyT/1grumDZjnUD3m2pl?=
 =?iso-8859-1?Q?/+zlaKty6e+/gDyqBgPA35Y04sM8OMT5YA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b292a2-4003-4fe3-2ec4-08dd3026e789
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 20:56:20.9786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yehb9bFL32tlTI3y7xDZikB9dI7M9piO/YRQCSlOV8T+hOl7rnn9FyD8tsH2F6gP5bqLD7d6W/vmiUpXV2d7sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5747
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 18, 2024 at 04:37:45PM +0200, Ilpo Järvinen wrote:
> eetlp_prefix_path in the struct pci_dev tells if End-End TLP Prefixes
> are supported by the path or not, the value is only calculated if
> CONFIG_PCI_PASID is set.
> 
> The Max End-End TLP Prefixes field in the Device Capabilities Register
> 2 also tells how many (1-4) End-End TLP Prefixes are supported (PCIe
> r6.2 sec 7.5.3.15). The number of supported End-End Prefixes is useful
> for reading correct number of DWORDs from TLP Prefix Log register in AER
> capability (PCIe r6.2 sec 7.8.4.12).
> 
> Replace eetlp_prefix_path with eetlp_prefix_max and determine the
> number of supported End-End Prefixes regardless of CONFIG_PCI_PASID so
> that an upcoming commit generalizing TLP Prefix Log register reading
> does not have to read extra DWORDs for End-End Prefixes that never will
> be there.
> 
> The value stored into eetlp_prefix_max is directly derived from
> device's Max End-End TLP Prefixes and does not consider limitations
> imposed by bridges or the Root Port beyond supported/not supported
> flags. This is intentional for two reasons:
> 
>   1) PCIe r6.2 spec sections r6.1 2.2.10.4 & 6.2.4.4 indicate that TLP
>   is handled malformed only if the number of prefixes exceed the number
>   of Max End-End TLP Prefixes, which seems to be the case even if the
>   device could never receive that many prefixes due to smaller maximum
>   imposed by a bridge or the Root Port. If TLP parsing is later added,
>   this distinction is significant in interpreting what is logged by the
>   TLP Prefix Log registers and the value matching to the Malformed TLP
>   threshold is going to be more useful.
> 
>   2) TLP Prefix handling happens autonomously on a low layer and the
>   value in eetlp_prefix_max is not programmed anywhere by the kernel
>   (i.e., there is no limiter OS can control to prevent sending more
>   than n TLP Prefixes).
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen

