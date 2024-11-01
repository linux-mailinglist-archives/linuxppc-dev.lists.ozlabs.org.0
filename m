Return-Path: <linuxppc-dev+bounces-2759-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE47E9B8D5D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2024 09:55:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XfvpJ6Ymvz2xst;
	Fri,  1 Nov 2024 19:55:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2413::708" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730451336;
	cv=pass; b=FtEKeZu02WDrjPCUX8Z7nUDHNQMnrULEQ1/4NdTnDnHk4CzGJJTyJm7RyaXJN0RUP7D/xY+zTsBBRywzYKEibEGm9d8MKCPFIQgA3zE0lEy3dPNQI1TEJFa8Qrp83IyvuLrxXZrU2CaodbHMU9yPu7CvPPNd9eBygamRw/fj7hMMyCTqVWXeTpf6e6vfeNxF0AeyBpI7tF1sYPoXmL1PZNuewxo95bYNCsk/Z6QQk4AwU2W/GKos4Dau/mn2HsJv+Cf2Q8luJ+h4jtA2eOOtWIzoALdqRujvJ1h+hi2SL8IoTiwGuUf8SbwPg3o71ikBgFJ8IDWPcurnAIk3SBhKng==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730451336; c=relaxed/relaxed;
	bh=sbffchmQXk65NcjHEoL7HWnSehoHXtl2r5zOyuYjPVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CNouR0r6eNF7/wyAuyO3q8IIq662xEz4wjuHUjzX+ysS9TPrQZD08dZwFz+nwjNPLcnPJyaCBpPyYtudyWsPkRutqRrNMqznrEjn9tIG2CxGtLg0/86qcos3PBmlozmG1JBxT4hNigHbI0ITN0LrYupdutvRJgo9dRnon+o/oiQbzUnKaElR3Y/t5vn7M0AGiIx1JkQVUWm+W+ncgxVsYX7hPsjy3CMjPt1SCl0t4Y+CRSc6r9za2v7ETiq6KqgJnhtU7msqL3Ki5UX32wYKXG3K0G3bkBBXzpAW1/B0fT30Ox46g6/QxVGiv3nym1gXCD3pk8uSxFxTd1yZzrir/A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=corigine.com; dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=aGvnOLDX; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2413::708; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=louis.peens@corigine.com; receiver=lists.ozlabs.org) smtp.mailfrom=corigine.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=corigine.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=aGvnOLDX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=corigine.com (client-ip=2a01:111:f403:2413::708; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=louis.peens@corigine.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20708.outbound.protection.outlook.com [IPv6:2a01:111:f403:2413::708])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfvpG3JkRz2xnS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2024 19:55:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAs6JAcNEQ0xr/1CzLvBbiQFzyfYoJW9CaxMd4bvZJHHuwIyj4GgEE1Sw/qqDfmOFzKx3PhO1A9GXGkF2SAcWuVo3SgKcfZY6F2UpX4ud4EVW/tHui3NiN77ZlA9Q/nxU/wsG8p5IZ6Ja5H+UpNRc9xUif/DFbaNX5k46rozY778BjGDGGmNw2tmhGqIq/HuXwJpcVyJcdXMqmtNxSFXOazidSLUSzm2+2CStANWdXcBSi+o9OwB29T9g/E93IqfasBEwYdqrnZxghrZZDLydRjl4HFFotaTEdPX5Mf4mr9NxLYONK6Dpll8IJJvdnQ2SVKiCCU/7uxBwcpqMXyq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbffchmQXk65NcjHEoL7HWnSehoHXtl2r5zOyuYjPVY=;
 b=O1XsuzeI251sBzgNI5YzhnY62isFy5stGRBn4H/g2A89bleghQGQSMdYNK3ccv/n/1UnYRPPW1y++oIm8/XPZqf5SBGu5bN4U1vTPJBR6WVHTRoL/6kOeRf6XwRA5IGLKrsg+BxGFuQYG674Q4zfdh10F/ibS4sIzFqnAdJ1aMPERxd3G9Ol41kNtYUXSF5UQ5rk7nYw2f+i4bF+OVID/gYj2s9Cu0lavBL4m+3HVSTgnVsYe21wj0hUbml98xNgJyUsiB2jCZ8d0R6M0TlJUJfpBHVpMy4/UPrvkCJzitCBWlwmTDZ3/X9LfSAm7FYp9O+B+p4ZIu+SRVShL1ph/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbffchmQXk65NcjHEoL7HWnSehoHXtl2r5zOyuYjPVY=;
 b=aGvnOLDXdsiK0C4Y2X37CyZ2iV0GlbCu4kRqzzcNtSciY5kErsP+8mhWTdk705IsU8cqG1HsHYWFO3mX/FhtcRYqGKlVWFoAR8gbXzA7yFbPbbXzEgZOeYqt5ET0Ydtm3As1yCgwekFSlTG0JTlTyMmmfOFBhDhYL+d5TSvb230=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from BL0PR13MB4403.namprd13.prod.outlook.com (2603:10b6:208:1c4::8)
 by PH7PR13MB5551.namprd13.prod.outlook.com (2603:10b6:510:139::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.18; Fri, 1 Nov
 2024 08:55:05 +0000
Received: from BL0PR13MB4403.namprd13.prod.outlook.com
 ([fe80::bbcb:1c13:7639:bdc0]) by BL0PR13MB4403.namprd13.prod.outlook.com
 ([fe80::bbcb:1c13:7639:bdc0%6]) with mapi id 15.20.8114.020; Fri, 1 Nov 2024
 08:55:05 +0000
Date: Fri, 1 Nov 2024 10:54:47 +0200
From: Louis Peens <louis.peens@corigine.com>
To: Caleb Sander <csander@purestorage.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arthur Kiyanovski <akiyano@amazon.com>,
	Brett Creeley <brett.creeley@amd.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	David Arinzon <darinzon@amazon.com>,
	"David S. Miller" <davem@davemloft.net>,
	Doug Berger <opendmb@gmail.com>, Eric Dumazet <edumazet@google.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Felix Fietkau <nbd@nbd.name>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Geetha sowjanya <gakula@marvell.com>,
	hariprasad <hkelam@marvell.com>, Jakub Kicinski <kuba@kernel.org>,
	Jason Wang <jasowang@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Noam Dagan <ndagan@amazon.com>, Paolo Abeni <pabeni@redhat.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Roy Pledge <Roy.Pledge@nxp.com>, Saeed Bishara <saeedb@amazon.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shannon Nelson <shannon.nelson@amd.com>,
	Shay Agroskin <shayagr@amazon.com>, Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>, Tal Gilboa <talgi@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org, oss-drivers@corigine.com,
	virtualization@lists.linux.dev
Subject: Re: [resend PATCH 2/2] dim: pass dim_sample to net_dim() by reference
Message-ID: <ZySXV46T4IE8YVqX@LouisNoVo>
References: <20241031002326.3426181-1-csander@purestorage.com>
 <20241031002326.3426181-2-csander@purestorage.com>
 <ZyN8xpq5C36Tg9rz@LouisNoVo>
 <CADUfDZoba9hNOBU7TT+0K6BYiYzVkZ_awt751g6HBm+-cCZf8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADUfDZoba9hNOBU7TT+0K6BYiYzVkZ_awt751g6HBm+-cCZf8w@mail.gmail.com>
X-ClientProxiedBy: JNAP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::16)
 To BL0PR13MB4403.namprd13.prod.outlook.com (2603:10b6:208:1c4::8)
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
X-MS-TrafficTypeDiagnostic: BL0PR13MB4403:EE_|PH7PR13MB5551:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d8bdfe6-0633-4198-a7f8-08dcfa52e107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dERpOGc1VTdTSkxFMGFYTnFUeW5CZ3JNZUI3ZGU0aGtiR2tVbkFybUNKSkps?=
 =?utf-8?B?Znh2ZmJjTUF6UnhQLzBSQ0QvY3NvQVMxUTNiVUJScE42Mk9tdHd4QmNMSTY2?=
 =?utf-8?B?a25iTkhtNjA3dVpYcWlyNVBjMlBhbHBnVWFncU1EM0dDNWVrQVppUEppd0J1?=
 =?utf-8?B?OFJtLzI3anZsRm40YVR0UUlORittcUFFUk1NekIyNWZucFN2aU1SREE1VGN5?=
 =?utf-8?B?ZlJ5R1JlemZJYjlaZUZOK1F2RGFSTG0rNm1JY0FOaXpLRU5MclpSUUxXeTJJ?=
 =?utf-8?B?dTRWZ3JvRVA4eFNPN1hRbTA2alUxVzRXL2h1OVRJZHZaTFM1c0JVOStPVE0r?=
 =?utf-8?B?R1ZNNThkYTNxRWZ2SmRYNm5YcFFmNDhJOGl5ZkhUR0JXZ0VOQWxqUDJoZEdU?=
 =?utf-8?B?UElJTVFMRVNFZUxpbW55S2RNSHA1VlcyU0V6Nnc5QW01cU1iR3NDWmdKTUt2?=
 =?utf-8?B?TFphTE1YWE9HNktoUm5pNFJ4bU1nVDVLZnlBSXlMKzloWjRpaG80YlBxZGxl?=
 =?utf-8?B?aHUxdzJBRGNuZDlqcVFRcWNkNDRFbkQzMjBqZ3RVNmFac1VTUnBZeHJEZ2Fy?=
 =?utf-8?B?dm1rY0xSckNhZ3YyNXAwRER2WWNzNmlXdFlxaGxIN2c0ZG4wdndhV1BBNGpr?=
 =?utf-8?B?Y0d3TUxPK2g3aUtWVFBTcUlGUkd1ME5ud1pibmxORFdmNFF5Z0VlZ1VSdkZt?=
 =?utf-8?B?eW5RSVEvZmNkZGZsVldNL2Y2Mk9rNXphODdMaXpTU0hSdTdlM0RKRGZPTmpQ?=
 =?utf-8?B?bWdQUnFzK3hMYlRmeFpxQWsya1JpcnBaRFhsN2UrNDBWZEZwTHFxN0JrVGw5?=
 =?utf-8?B?VFlMdE0rS1ozc3JrYTZXNFA5TnM2WEdOQnp1eDc1ZGdIUGxBZ1pGbEp3SklH?=
 =?utf-8?B?SGUrRlhPZ1ZRVjBuN0ZJVUdoWnNxS1BtdDljc2RTWnhSNndvQWw0VFB3bkpq?=
 =?utf-8?B?eEE3ZFhlZ1JkZXc2bEhhZFVOK0FvY29aZnd5LzNmQVlPRTZTNG9WWERud2lB?=
 =?utf-8?B?VmNBZ0Q0dzAvczVrQXZoQkpjaDVFZkVTQmFoZ2Mwb0YwZU8yQlhyWVNPcE9y?=
 =?utf-8?B?emk3NFMzUDRoNTl1ckI3aEU2NXc1N25MYXhlMmdON3AySjlnQkJvc0FFZ2FD?=
 =?utf-8?B?blFJekJnd2s4OXNhamZqZTRCamtZWHJVRWhEUjVWZlFIQ2tsdWY4cGlJNm1E?=
 =?utf-8?B?SHA5QTlONlI0VFY1RTBheDJKRUN0TXRBbnRpKzZoYTJKRW96QmRPR09MNGE1?=
 =?utf-8?B?cy9tWWhFT3Nibys0dDRObHBWejBtZjRQQjJtdE5xNWhlQ2xRWUY4Uzl1UUlP?=
 =?utf-8?B?Zk9EcWNhaW1IcTVHRUJ6MzlJdzR5a0lnd2tlcG42TjBPR0Y4VkxmY3pVM2tL?=
 =?utf-8?B?ZWpjZExKNnNQdFJkSHRRMmF0OWw4ekRLaDd3blFscm1FRENGSmVMZ211WktH?=
 =?utf-8?B?Yy9nUkk4S0pEbjNZOXBya1VVVG1PdWdSVFo1dWFhTmJEWGxjN3dLTi9COXlS?=
 =?utf-8?B?MzB1KzBHTGkxZnRVS3Q1RlBSV3Vla2JtSUl3T2svQWI2alcySDF0a29HVS9a?=
 =?utf-8?B?QWxJbjF0ZWhDZXJwaE5USk93SFcwck5tSU4yMlRFMzJFQ21tQ2h3dUVQazl0?=
 =?utf-8?B?MVR4OE1QREFMeWtVcS9RSlAxYVZJZUlnU3VkbmhjalNUYlBnZjI0Y2w5bHh1?=
 =?utf-8?B?ckFLNXplcDFYU1lhYXJrWk44UlNCeHpCSXJHQUVrelpzbm5tSWFOcTVOQTkr?=
 =?utf-8?Q?rMkm9ankgJ5yeQpdDJ+kOSqeC3ZQDXq0OmPHFkS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR13MB4403.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1BlVEFFVVEzczQ3Q3Fac1cwcDRDdWhtK00ybk5VV0JUUUQvdytQSjdoRTBu?=
 =?utf-8?B?ZVl2TGJRMW5XTWsvdU1RT1VaNE9Oc3V0QmlvL1RnUkZWVGcyL2hacW9LdlEx?=
 =?utf-8?B?alBCRDkydDA0Y3FFV3pTSzVzSnJ3dFloM293c3I5UkthZzJLeU9YTUdicmxj?=
 =?utf-8?B?cEptNFI1cUdKVWQyLzdiLzdpaThic1Jva1N4aFJmbTlRSkhPQ2E1Zmh4RVND?=
 =?utf-8?B?a3BDejhMRll5SnFJUXltWUZncWt3TExzeUtaWjl2bFVMby9wTEQwdWJ5WVJF?=
 =?utf-8?B?S1E0bDBsdzVJTGIzWFhrRDFhUjJYSXI0RlFaZXBsNFJTdEdEczY4ZTlhM2k1?=
 =?utf-8?B?dlNoTlArbXJDTEJISDBTVHNHOXF4Vm1oQnVLOG9kYU00Qm9hb1UwcllWaU9i?=
 =?utf-8?B?aXBRM1gwTHZZNTRmOVczZXNkOW5IeGZkZlNxYk9KY2d5NlZ0YmNaa1lOM1hu?=
 =?utf-8?B?LzM3WGJMV0g5MVpwTkVCQXBwUWYvd1E5azl0NDYrSEovdDlVamdqTWxMY3FZ?=
 =?utf-8?B?bDlQbUFTdEQ2WGJXeloyWC8zSlc0ZFUxSW1VRW9sS1lXRlF5NS9iUFFxckdY?=
 =?utf-8?B?WnU0VVR4Uml3cTd4YnhCdGY4ZEpxdEVpVjJmdEtqNGx4cW1VRzRQZGQ5RlRq?=
 =?utf-8?B?Qyt6Q1BUajFGb3V2RDRneDdjQ3VPdWJKNC9sRkp5Nmh0Y1kxZE1BbE5vNVpL?=
 =?utf-8?B?Q2NrT2hCMHhFLzg5VFhuOVl0NVBIa2VkM0RMS3ZKNVVYSG4vSXI0RlZqelFz?=
 =?utf-8?B?ZU9IM1hlZlNrc0lvYjFUTjFtVmdLSTROaTBweGsxdU56QlZUWXhqYTNGSndI?=
 =?utf-8?B?cCtJV1NycnJxSzFpZ1BWQzliS3plcUJORmxHMEFpejgyMUZQQTA0emplN2s2?=
 =?utf-8?B?Q21kNUkvRDg0cHRuSWlPdHNPZGFhSGdJTi9VWGEwL0JaMUFIVW1SeXZxbUky?=
 =?utf-8?B?a00rbi9QZjBCWTBXcFpoTnBVQ1dYYkY3SzI2Q21LcTdabVBZZmJlRVEzZlR0?=
 =?utf-8?B?aStkbkM5bm13RDc3VG5kUGYrNWRnbmNPL0pPNVByVjVwalVBRFMrd2t3dm5Y?=
 =?utf-8?B?MnphUU9TYjJ4VFRrRjVUQTROd0ZzcnIwSXdBVFIxdjB6R292ZVpxL1hndzZB?=
 =?utf-8?B?c2t3TXN6R0dVbmc2S3VaNVhGTnZSNUhKWk1sSGdkUk1uL3B0bVgrWmpLaDkw?=
 =?utf-8?B?bXUzZkhZMkJZV3ByVjNUSDVJUG1zNCtHUTNVRURpMFdLbUVXRVpkZVR6ZE10?=
 =?utf-8?B?L1RlMFdNWHBNY1VlbzJqbXF0anE4TXU1SUpFNzVjTW5XRGEwcFBqUTEweVNB?=
 =?utf-8?B?U2s3TG5ydzVibktiUS9pSkxUTWNWSHlsV2lodDYzZVdtdGw2Yk8yNi82STlW?=
 =?utf-8?B?MVFmeEFIYW40ZEl5c1NBMU9PUWVMYzM4cGdidHVtektKY2FkREsra2JjeWRO?=
 =?utf-8?B?R2VXY1Z0VzY4dzVHTjJrMlAzRUhOcVVKTWlPYXp4Vi9RSllJZ01Na1lnSEt3?=
 =?utf-8?B?Y3lTY21zSGMxUHlBdWdwUGRmbUduTktpaFhuQ2dnU1dhcWdtd3lPNGdSSnYx?=
 =?utf-8?B?YitKb1Z6Y3p0VUxtYmJnOW92cU9aYWNmNkZoS3cxU0ZhaWhFWVFkQTNsb3FT?=
 =?utf-8?B?RWFhcmhqUzZrcVRDTFZFRFB0OW50SncrZmd6SkxLaVdRTzNDN2JIM0Q3RmZP?=
 =?utf-8?B?RWlNV0FOQ1lzdGJFWGZxSVBKV2VJZHBEMEYycjNjcUxmTUFVYlUxK1R2R2xJ?=
 =?utf-8?B?YnZnOFAwU0o2YXR0ZG8yVWZHWEoyM1dOMGpML3JKa0FVUzMrcUVzazFlSkpB?=
 =?utf-8?B?QmRoMmcxbTJ1N05DcUQwemxpcEdBZHk3N1NySTZLcjRtcHN3c1FqdlVZREhW?=
 =?utf-8?B?RUJnTmgwb1NPcHBRby9Tdy9nbGFsekxIOUVsdTVaYjR3aHpaRzhQNUE0ckNp?=
 =?utf-8?B?MHZEMGhQdGZkVnp6aklwNktCT3VmdVROQ1JkK2tHVWFEQUNQNExRLzFWZTNN?=
 =?utf-8?B?aExyWW1WTWppeE5qSllUUi8rdjVNYW5JUnZJb0l1enR0b0VrS0JKcHVjbGhK?=
 =?utf-8?B?WlJrVVRyZ0dYSkVEa3BXRG1NWHRMaG9nN1lsMzhVRzJBOEZkQnMvb0xIdkhD?=
 =?utf-8?B?Lzh2NXcyM2EzYlk1bWpabDNVd3pLNm0yY3A5RG5ZNzlIbkVRQU1xK05uU2pj?=
 =?utf-8?B?Unc9PQ==?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8bdfe6-0633-4198-a7f8-08dcfa52e107
X-MS-Exchange-CrossTenant-AuthSource: BL0PR13MB4403.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 08:55:05.3918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KfOjza+ZdjFk4RMUawhjmgmovGNx6p7cqk/Oh1/GS3h1ox6NjxKPdezupN8WmFjxm4rVGiAMXzoJ0OggCNnJh+cVLszvRz+DoDNxb9+PBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR13MB5551
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 31, 2024 at 10:19:55AM -0700, Caleb Sander wrote:
> [Some people who received this message don't often get email from csander@purestorage.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Thu, Oct 31, 2024 at 5:49 AM Louis Peens <louis.peens@corigine.com> wrote:
> >
> > On Wed, Oct 30, 2024 at 06:23:26PM -0600, Caleb Sander Mateos wrote:
> > > net_dim() is currently passed a struct dim_sample argument by value.
> > > struct dim_sample is 24 bytes. Since this is greater 16 bytes, x86-64
> > > passes it on the stack. All callers have already initialized dim_sample
> > > on the stack, so passing it by value requires pushing a duplicated copy
> > > to the stack. Either witing to the stack and immediately reading it, or
> > > perhaps dereferencing addresses relative to the stack pointer in a chain
> > > of push instructions, seems to perform quite poorly.
> > >
> > > In a heavy TCP workload, mlx5e_handle_rx_dim() consumes 3% of CPU time,
> > > 94% of which is attributed to the first push instruction to copy
> > > dim_sample on the stack for the call to net_dim():
> > > // Call ktime_get()
> > >   0.26 |4ead2:   call   4ead7 <mlx5e_handle_rx_dim+0x47>
> > > // Pass the address of struct dim in %rdi
> > >        |4ead7:   lea    0x3d0(%rbx),%rdi
> > > // Set dim_sample.pkt_ctr
> > >        |4eade:   mov    %r13d,0x8(%rsp)
> > > // Set dim_sample.byte_ctr
> > >        |4eae3:   mov    %r12d,0xc(%rsp)
> > > // Set dim_sample.event_ctr
> > >   0.15 |4eae8:   mov    %bp,0x10(%rsp)
> > > // Duplicate dim_sample on the stack
> > >  94.16 |4eaed:   push   0x10(%rsp)
> > >   2.79 |4eaf1:   push   0x10(%rsp)
> > >   0.07 |4eaf5:   push   %rax
> > > // Call net_dim()
> > >   0.21 |4eaf6:   call   4eafb <mlx5e_handle_rx_dim+0x6b>
> > >
> > > To allow the caller to reuse the struct dim_sample already on the stack,
> > > pass the struct dim_sample by reference to net_dim().
> > >
> > > Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
> > > ---
> > >  Documentation/networking/net_dim.rst                   |  2 +-
> > >  drivers/net/ethernet/amazon/ena/ena_netdev.c           |  2 +-
> > >  drivers/net/ethernet/broadcom/bcmsysport.c             |  2 +-
> > >  drivers/net/ethernet/broadcom/bnxt/bnxt.c              |  4 ++--
> > >  drivers/net/ethernet/broadcom/genet/bcmgenet.c         |  2 +-
> > >  drivers/net/ethernet/freescale/enetc/enetc.c           |  2 +-
> > >  drivers/net/ethernet/hisilicon/hns3/hns3_enet.c        |  4 ++--
> > >  drivers/net/ethernet/intel/ice/ice_txrx.c              |  4 ++--
> > >  drivers/net/ethernet/intel/idpf/idpf_txrx.c            |  4 ++--
> > >  drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c |  2 +-
> > >  drivers/net/ethernet/mediatek/mtk_eth_soc.c            |  4 ++--
> > >  drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c      |  4 ++--
> > >  drivers/net/ethernet/netronome/nfp/nfd3/dp.c           |  4 ++--
> > >  drivers/net/ethernet/netronome/nfp/nfdk/dp.c           |  4 ++--
> > >  drivers/net/ethernet/pensando/ionic/ionic_txrx.c       |  2 +-
> > >  drivers/net/virtio_net.c                               |  2 +-
> > >  drivers/soc/fsl/dpio/dpio-service.c                    |  2 +-
> > >  include/linux/dim.h                                    |  2 +-
> > >  lib/dim/net_dim.c                                      | 10 +++++-----
> > >  19 files changed, 31 insertions(+), 31 deletions(-)
> > >
> > --- snip --
> >
> > > diff --git a/drivers/net/ethernet/netronome/nfp/nfd3/dp.c b/drivers/net/ethernet/netronome/nfp/nfd3/dp.c
> > > index d215efc6cad0..f1c6c47564b1 100644
> > > --- a/drivers/net/ethernet/netronome/nfp/nfd3/dp.c
> > > +++ b/drivers/net/ethernet/netronome/nfp/nfd3/dp.c
> > > @@ -1177,11 +1177,11 @@ int nfp_nfd3_poll(struct napi_struct *napi, int budget)
> > >                       pkts = r_vec->rx_pkts;
> > >                       bytes = r_vec->rx_bytes;
> > >               } while (u64_stats_fetch_retry(&r_vec->rx_sync, start));
> > >
> > >               dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sample);
> > > -             net_dim(&r_vec->rx_dim, dim_sample);
> > > +             net_dim(&r_vec->rx_dim, &dim_sample);
> > >       }
> > >
> > >       if (r_vec->nfp_net->tx_coalesce_adapt_on && r_vec->tx_ring) {
> > >               struct dim_sample dim_sample = {};
> > >               unsigned int start;
> > > @@ -1192,11 +1192,11 @@ int nfp_nfd3_poll(struct napi_struct *napi, int budget)
> > >                       pkts = r_vec->tx_pkts;
> > >                       bytes = r_vec->tx_bytes;
> > >               } while (u64_stats_fetch_retry(&r_vec->tx_sync, start));
> > >
> > >               dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sample);
> > > -             net_dim(&r_vec->tx_dim, dim_sample);
> > > +             net_dim(&r_vec->tx_dim, &dim_sample);
> > >       }
> > >
> > >       return pkts_polled;
> > >  }
> > >
> > > diff --git a/drivers/net/ethernet/netronome/nfp/nfdk/dp.c b/drivers/net/ethernet/netronome/nfp/nfdk/dp.c
> > > index dae5af7d1845..ebeb6ab4465c 100644
> > > --- a/drivers/net/ethernet/netronome/nfp/nfdk/dp.c
> > > +++ b/drivers/net/ethernet/netronome/nfp/nfdk/dp.c
> > > @@ -1287,11 +1287,11 @@ int nfp_nfdk_poll(struct napi_struct *napi, int budget)
> > >                       pkts = r_vec->rx_pkts;
> > >                       bytes = r_vec->rx_bytes;
> > >               } while (u64_stats_fetch_retry(&r_vec->rx_sync, start));
> > >
> > >               dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sample);
> > > -             net_dim(&r_vec->rx_dim, dim_sample);
> > > +             net_dim(&r_vec->rx_dim, &dim_sample);
> > >       }
> > >
> > >       if (r_vec->nfp_net->tx_coalesce_adapt_on && r_vec->tx_ring) {
> > >               struct dim_sample dim_sample = {};
> > >               unsigned int start;
> > > @@ -1302,11 +1302,11 @@ int nfp_nfdk_poll(struct napi_struct *napi, int budget)
> > >                       pkts = r_vec->tx_pkts;
> > >                       bytes = r_vec->tx_bytes;
> > >               } while (u64_stats_fetch_retry(&r_vec->tx_sync, start));
> > >
> > >               dim_update_sample(r_vec->event_ctr, pkts, bytes, &dim_sample);
> > > -             net_dim(&r_vec->tx_dim, dim_sample);
> > > +             net_dim(&r_vec->tx_dim, &dim_sample);
> > >       }
> > >
> > >       return pkts_polled;
> > >  }
> > --- snip ---
> >
> > Hi Caleb. Looks like a fair enough update to me in general, but I am not an
> > expert on 'dim'. For the corresponding nfp driver changes feel free to add:
> >
> > Signed-off-by: Louis Peens <louis.peens@corigine.com>
> 
> Hi Louis,
> Thanks for the review. Did you mean "Reviewed-by"? If there was a
> change you were suggesting, I missed it.
Hi - sorry, I do still manage to mix up when to use signed-off-by and
reviewed-by. I did not suggest any changes no, and since the main focus of the
patch is not the nfp driver I can see in hindsight that Reviewed-by: may make
more sense. So updated:

Reviewed-by: Louis Peens <louis.peens@corigine.com>
> 
> Best,
> Caleb

