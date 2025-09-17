Return-Path: <linuxppc-dev+bounces-12309-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCE9B7EC71
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 15:00:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRf514WLtz2yhD;
	Wed, 17 Sep 2025 23:00:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758114021;
	cv=pass; b=nlm3skY8p0MPKFiYQb+WPKtAfd8ZyEYDDuuOd1QhG4E7tFIt/yzCi7h8WceWozCrAaBm1vp0UyKSH0wrNqytasbd5xdN+iRNwD/iWBhq9ohp04EzjaN+Cw8ADnG90t97VYKiANIvlFWmmK5JbQTtcgnBM1TTA6LYuJaDdlYSb0k4PssToPdCOwwujIfkzZ6Y57gG22jqrMnrQQf9nUy/nM8RY4lX0GmjNPbzkBIo7zqbh2lJ+JAbDxJqTpaRmajwZTFekjqofjhXYZR61jwwta1eGuSk3OG4DvzLiLwTOs3mXEXm8CXqEP9ZiDE1S/BxFZlSzUuoKm8XmwpxmAqJ5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758114021; c=relaxed/relaxed;
	bh=OXqiokgyAALlNMoiJJ0FZ1Sxcgo0g5pTLkiqnY5Xo4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q2ru0w/3LOVLHBsoUfwZRHvR3Tr4K7BZ+RFp7KvDGwojxUfe8mBjF5oDVESMX32z5k3T/uxnHX/CAXXQjioNZOCiiKoKk8V5twvHmsa3LN4VLrdxz6ai6pQy7EA/wpVRiKStbyg64TCk2uXrm3pMiLdJDVDwtIVGFEbxTV4AZpLCyG/aaDpkRyY8ypFWaeHgOw0SK3Bfrye/l+X6PAosHDFTcbqUdNRPnMLRkoBbfguQImtGA28gwLPfR8sunoR7Dm68TEGb00QCFF50Ptf48VKcrWYANYDlmSkLIaB3R1ZWw8dWNodt0g+CNzgJ9lXLYoC7stH++pK/7a6n89Ar+Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sPUPIOj5; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sPUPIOj5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRf4z4TxDz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Sep 2025 23:00:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OS25hzKPVDlR8ZXSC1Bozpb+OA1kVCnGfV7L/nQWzHtAq7pmOOebgpMYMvXq/VAiQJHddAbhsWO1HrbtCmh9nNMEHdcxGk/XrWnvBQs/BHKp0rKRH/kZroLKr4lKyVh0N3JicqQBQ7en+nPYH0+H2BPnrK3awbgupGFJohYZZyyHMt9aP/8btDRFTPeTcvc9hH2U08zPxoIcV7y5W1fJbaHW/bIA9QlMJ82ly3jRmUwDHd6HNvLtAOmP1yqHgSki7imtXy09lO8lgCLY3wnu8s1YqiyzSsmw9o+tMffS/uFF2GSZ0Q6BHZQ7vb/MqO/f8QZMfS8TncRS5bxt5TMEqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXqiokgyAALlNMoiJJ0FZ1Sxcgo0g5pTLkiqnY5Xo4M=;
 b=oTAsoKxB/kTGDebPCJ+VFjP6lch4ruwyvZ6QwmpxF0+E7ZumWbsHwldNshCBCDOfOS22An+N8J5kukoWY5s5RsfiOO0Cp4E2sViTeCNv7slq6X+wb4jbGPiq2KdIeVOi0IOV+yiGUhQw+RvigsGBEr7UqDcP/Pt/dA1al1ZSQB3aFnC6UR45ZpkyyGxeo702kJAdCSK5Xwu7XHwcRYN2Gz4yYJ0TE8mVUut3kRroSgpZ8oxXLOk7Hev+9mhJt6pDc6oGa3tWvvQgNoOSqB/Bcp27ZRGBipVxQfyVHAbPgu7DNSgUZ9pOYCbuk9N4LfTesGSRGjcWK9LA06V5Xa/g4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXqiokgyAALlNMoiJJ0FZ1Sxcgo0g5pTLkiqnY5Xo4M=;
 b=sPUPIOj5Di8hhgNMYh4zkRem0JxUywmWwbzhsIWFQCcDQYdYt+AjDMJogCZBO9b/e+x9Iu7U3JCewAJwOWFLmPV7ZaeoM5vUxPVQJJ5nDFwZrgT6uYNnABhmrm9KHr7GQR3fzHeHcKhEXRd2gC3LppPWaczON5cspX5727NyLQPiOv+5+fetYPVjWemf4QTcmCuQv3MtB9f2DXejJs+GMl+9C/Jcmkmbn1x05EK6ZMvPtfX8BDdxUoGaOrlxCAU68eYCWPtuSlftR10Cd/4XcTGGNKnmnnHNCIyii3mKv4S9G5LeL9kbun4YsJO6Ua0fNgJ447ymcloW60FhGegxbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by SJ2PR12MB8831.namprd12.prod.outlook.com (2603:10b6:a03:4d0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 12:59:54 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9115.022; Wed, 17 Sep 2025
 12:59:53 +0000
Date: Wed, 17 Sep 2025 09:59:51 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Richard Weinberger <richard@nod.at>,
	Lucas Stach <l.stach@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Andreas Larsson <andreas@gaisler.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Message-ID: <20250917125951.GA1390993@nvidia.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
X-ClientProxiedBy: SA9PR13CA0105.namprd13.prod.outlook.com
 (2603:10b6:806:24::20) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|SJ2PR12MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: aa7700a8-e5ef-4d0a-79f4-08ddf5ea184e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J2ir5W5eq3eMIdFc6Pq0/Q92Jwr0Qho/hue3ea8a7L62/Jg5wRJtZhlE/5gs?=
 =?us-ascii?Q?gAw6v7KHgsj5w3Q7gtDy8KpiRt1z1BAQ6NFc3bXYA2L8pYo5F+TNKMJyPYaW?=
 =?us-ascii?Q?yodkpbKxVVJ0fNu6zWojaMv+7bpmFXhDMLHTgb96iIeYd68y1VH9EW9wtNlW?=
 =?us-ascii?Q?ALQqLKRACLbikjFbtNxMuXuXXA0zafsB6gekD1Rol+l4rT4qVlejPJfab8GB?=
 =?us-ascii?Q?HuvpbW3jdJXiGBvnzfLuG93DhdVJGAJc1902vTur6eoW4d7KlYAtXZuMqWfv?=
 =?us-ascii?Q?PqrsjpnGTy+UdrKyhF9P5dAgysjrt2cFtLIOu49t0awJWvwl4D0TvYbwL646?=
 =?us-ascii?Q?dhNKkuJ5p5gkCPVIs19v8Q7ZdYgZr+046bcaRXdsg4fkCBQoFXb7+r63agP3?=
 =?us-ascii?Q?RqVEuiQOprpFepwFF34HnQuquj4KOFEdI8vn876KhKkXXhU2O/p2FpNLIKpz?=
 =?us-ascii?Q?RtmOzKivbKXvoCAlTYESThjjlL0XZGXQYGMqpC9MhUblzGZOexeMS9wyJdBH?=
 =?us-ascii?Q?yHj70J5gzFcngxKd5dhh5qaDx2SqY5fF/XG/t8V+XFVQmjdGSioM8LGK84VA?=
 =?us-ascii?Q?WE02sEM08Lwk/zHZSpVmdZCZf8BVQUhGYiLoLvPT/g/KIgDQVCR8R0twVAMZ?=
 =?us-ascii?Q?hMDH3ypERuVQmPzTbd1eCUqkjhI9nKNTh7KkDI0nyXtpNHR9tRsGeYFyUO0F?=
 =?us-ascii?Q?QcJVRIwoFz0zmwTd5oOHsSldvuOC90frYj+bkC1yFxGiwV+zBl+YrvuS4DwC?=
 =?us-ascii?Q?DdNspcdE8ypby1DBvjsFAZ3ux7BYU7S6Tsqmt5W6ALiTG7SZ5t42JipEZVc0?=
 =?us-ascii?Q?VoqLVrIuCrOMCMRs+OrCJFZn+QgHdyNa7+IN9KabRQn2KZovR0sQm3F2XIF6?=
 =?us-ascii?Q?GOk7skdI3GZ1Fe/PN9Ol79gIIuTuq4hmSxGqBXyieT5PA6ZcHcgFy+BxpEzr?=
 =?us-ascii?Q?Y/YtOlI0iyzOcx1jOfsnE0bYBVXoaEQpmHgTANTmmLQfz6MxhiKwnIg7fmE0?=
 =?us-ascii?Q?fVyheQ/kBPnKsk9R3bju/Sv5UKbiqnpdHyQZXIItfS3pCt+4ubrUNFZIHNjZ?=
 =?us-ascii?Q?NN5reggxLZ86uXyqj/vU9igGneY+TdZY2kW0f1X/dvEOGsUe+f74Kmb6sh0w?=
 =?us-ascii?Q?tVlilscPfN09V4fCidP7c9E/DDhwRpH5Nmo1SYVreDWnWRHoOpEquEToFViH?=
 =?us-ascii?Q?L9sw/kw0kJy26WLXdbMVO8g3xhVrs6ZK8UkAuPbxMD05r5aztL2w7VGSBm5i?=
 =?us-ascii?Q?lHPNe6Pnxb/MSjW+HiDuhdWr3rZ8tEDO4PlU5VC2eWoq5tvnQXgfO8C633P8?=
 =?us-ascii?Q?dPosj/z8caqJHQlJutnnN3xVfycoOv1Su+Bws2h7hhW1+iy89ai8JoFgU/OP?=
 =?us-ascii?Q?jRpySfxQiFmuDn7hQ5B/PHbZgbP4EyNLF0f3yVTne6ghnZqSDtFCCPjdsEvt?=
 =?us-ascii?Q?AxAYZalZwoc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JJmPgck2gMSqLcTSpoZSq2XAKiH51Y+khe1q0hFP1wfY1h/09RvkYBejbwBn?=
 =?us-ascii?Q?VFr7fu76JtdmSsFsws70wDhP6npIsKmfGR4fk2EX8JeKB+Zi5+A9nCPrvcNu?=
 =?us-ascii?Q?wNVYWQeJPsPnkUFLQeZkhpfDGezP8wCFa0cvrG4mj5X+FE08Jz3uiSy3Lwuj?=
 =?us-ascii?Q?iUBoi/LZkCnVHVKIKQISJTMJwnT4IwHtkPGigWMtAlnai0eA1BB1DXQUcNwL?=
 =?us-ascii?Q?4ztdJMBSyvepA5PtaU2f7Iue4G5FGZL0Pquso4MTo5CsQKGASfToFF11zXfI?=
 =?us-ascii?Q?LVaIWS83aaKcOS6xYXoVYoRGXm2IKnRdmTPZheSUOeUhDSl0glH/m8ppcLym?=
 =?us-ascii?Q?o/dMqfitUVUlHD2oAioh898i4xRJcvZK82Rfo85dgPl8FQySv/RTzC41y8Zj?=
 =?us-ascii?Q?Qbpi39ZXQw32zG2mDVZXcRcecajVtkKu7t9Fx1BeDjcji/PWcfR29yHa6oDa?=
 =?us-ascii?Q?vDhLKYEN8jSsP8ixtJlf5iIA6X+2GgKoD33rtuTUAuz8sgVFYb6xFu3AYtRZ?=
 =?us-ascii?Q?imS1HWt/ssSlzjBqWfcD9ylEZBa92NKVdCr/EtZCPnu73IhwW1Tl824JcXN1?=
 =?us-ascii?Q?LK4CCJy59GxLzeEQS30dxcTxAKtQEcljdhP8ZIbdNQaCxnPCaNWOXEeSTU0L?=
 =?us-ascii?Q?HG7qI5tktGNzpPE2w0NUELuFRIi0LgFH5nZe9of3Xe1llPADepMiJCSBvT37?=
 =?us-ascii?Q?37wVsxXqrSlxy4wKPiveMSZ92eOZ/9iQAAf2LILqcvNjtgf+ZIejmT+pQfop?=
 =?us-ascii?Q?z/QYmVRzT7oI9Pq7q7m84svzMq/hKQVk1islNHqFyyZOVePkWTWN7jDHEd+R?=
 =?us-ascii?Q?eNLLisa1S6oqTqO+luXLacHvhoIqC3lTsfSQ25dK7GzMTDvHpmJ1nyTlhy2H?=
 =?us-ascii?Q?V+Vk7fFWCOU6096IDcFiy2mec46RHU8IlFD162mevam9INBd2OI80d0kWNA7?=
 =?us-ascii?Q?sUv2P/sxmS0cE8f9Y21hx9B+fyE38UNKtv3ZVNM7THBuHCe2XMybERMiWxEu?=
 =?us-ascii?Q?wsS8kYq17iKtxZcNKwf/+j8cCU9wor/+zMq0Zlj1T75eLZbWIeAPnrAS1K3W?=
 =?us-ascii?Q?/Anbd3lW9k12oqcYomtp0ImSk8gj9LZCUtB96RyYm4c+QhLkM4sSGheQbpoV?=
 =?us-ascii?Q?TMKCc06ncbDco54szGeF0EBbTOMvhBeHAhOkgiJojG+qyZ2ey4dno6V8ksmG?=
 =?us-ascii?Q?pZv6rSo9Ln/ADTCzWZchLH2YMWMJcmg6FZqG2JUq6spt1/kxQBfhO/GCuWlH?=
 =?us-ascii?Q?r9ini5sndhbXtkIbcfVmOIrOC/E4D23a87K2sev8ExZrL2R6ch+iZGgQ7KvR?=
 =?us-ascii?Q?DkS1KOj8OccJ/pEf8u04oSEcM+VxzqLZ3y3GAAS726GEeJXGdqoYU4zuUWxz?=
 =?us-ascii?Q?FKwFznw3+PEph/BTh4c3jB/qxIaaX0cR+/UpSiyTFOBnOP9b7vZaYz4AmHtZ?=
 =?us-ascii?Q?Lu+JM1d7o8IEyxyJJB90euG+Sxe3IMoWmleQNMCfuGmr8bkItoAWe6W9s+1L?=
 =?us-ascii?Q?dDCONo+9U0LjnimYyEh07eMQN8o7QqQVhgON3HpYlROviJ2fFr98QNhaBDjc?=
 =?us-ascii?Q?l/84qijeJJzC/Eojk99UaNotlOQ3hRXifKshyST0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7700a8-e5ef-4d0a-79f4-08ddf5ea184e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 12:59:53.8246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2mI7nuHIPcH/lFYeI3aX4F9iLvSKh9cO5PfYkgmIq6PGrE4bwQrdjaQrV3tvbyz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8831
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:

> I'm still collecting information about which of the remaining highmem
> users plan to keep updating their kernels and for what reason. 

On this topic of removing some parts of highmem, can we say goodbye to
kmap_high_get()? Only ARM uses it and only for
!cache_is_vipt_nonaliasing() systems.

Maybe if so then HASHED_PAGE_VIRTUAL can go too?

Jason

