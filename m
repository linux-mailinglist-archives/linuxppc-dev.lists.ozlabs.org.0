Return-Path: <linuxppc-dev+bounces-3676-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 545C69E0ABE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 19:13:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2Bjp71zVz2yng;
	Tue,  3 Dec 2024 05:13:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2417::622" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733163214;
	cv=pass; b=EhhGM/WxXmFADN4hXaRQh3NZnTzKvoUn4Xkw1TaWeU52anftPthe8tvTE2a+Y8FStlOnlKa0Ys4UHhDaPKxg0qdI8o/6gOFAcyAWTts2RxwIJx55diEpccjJBR15weZ41cV189OtCHeRw9JqBD50FZZzd+K2PItAOaioVYcnXZ/xINweEoqI0I9JNB0rrRrRvk9KoyqRxchxbeKDHLQ3CUUsb4xvn796/byCZ3NGMD9RebxQ2h1onvl0Tkr303dMyB9BbFrXqKw8Xgrv27eFnBPWTt1By8a5WLBE2hFN51aksz4/SERRxdmoD69kZNYdTrMS2ITjXCmVHWSsUcCEeA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733163214; c=relaxed/relaxed;
	bh=Ei0lTZ5eKbYP0Ivjgwkk/GM2PoXLbM3P6MnbxRQimv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NREe5mBV2oSIN/w62P0GM1PDYUUSa0Az63WXwpYl4iefVawC4LEedtEqttu0lWDBQBt0sqwx344ncvLaXRxZixZn1V5gQuG2he1krifzA/8DfqaQFYXb+VcVUUK7alZLxDP1Cz+YkN3kTSRH3E7FkyBSGIAW0v8ISWv5j+QPj9vSwRX53vtjO9bnG94jKxwYt//6MH/hcHVSqthAcKM7gI9eQriN0GNdpWdly0ftIdoQuiisa390HRK8b1okIUpg0PNhLAiBWotnuNLuJuwNdrtQsl50bU6DhFGHucJTVtIJVz2m+lYyhsK7MWPq+JElpbnEA2h+Ke+7URV8jeF+rw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mMxfE0jA; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::622; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mMxfE0jA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::622; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20622.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::622])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2Bjn3jJhz2yjV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 05:13:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hz7M2j5LsXsifHDNEFmlPzZXQGukrGn6YRRJnulFYOs3mj8SEU6hgjNl5WYtqGpBCtMmZyuYMFa5Ua791204o4IRBqNWoAguIkODBm5ibcCFc7fz51MLuz8jEU+/nXnsA9jx0Q5bzGeZSH4a2X/Zw8v8SGSg2gdQmMhDuH3tuuRGFKfybCLVB6PaME1UJ+1n18qZ+9QUEfbYGNLFoTjJ4bAyAmpfh9gUQroKml56nIIz5furTujExMTlisl3ULLjUOKjSAlhfsUmMnDTlxO+Jnc5xfnVmirnyOa73P5afRIqvMeaVGyZAx5Y4giVjxAW/tTX3tLOklcjsZI0o0Z+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ei0lTZ5eKbYP0Ivjgwkk/GM2PoXLbM3P6MnbxRQimv4=;
 b=vyr6CIFwCefugUqhJ82CxEX4dmP/jNCixZ80Vv6ZSqjgyIngt6jDn5RvtlbkVjz6ODilDxeeeGBp6KrwD7BVGBx+Nq503f41YcTIFnjs1/ma8Be//O4uQ+yZjQQe87Iy7EhEBKo8FpovIeKIUrHp9AUfzjacSfWspXGWqAwiBfTDgZn6PEqoyDyRCFbgU6FdURVfzQyfQOhCFQ+SWrcBlJpkvkZrxSh/FUup8iQneMRGGFuy73kISF/TFCpsEU7WEN4XHO2ovTcfbdlVtuhjK4QpfSw9SpE890aEfC1ybPmfJz1YWTwCT9gbqUx4CIejObJQ1X+0B8LFIz+9FTOhqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ei0lTZ5eKbYP0Ivjgwkk/GM2PoXLbM3P6MnbxRQimv4=;
 b=mMxfE0jAOm+jn/7NeOkH+SYLE/WCHxwJ1CYvGVhNKCyUng2p9QTq+qV7v1Tu2h6YEIsPUL98oo0dOu4RzZMMDrNmm4IyAE07mvQhD3OeQL0IQamHyHJff6UarlKkjtmy1T4n4jFkpHcVOE9POV5Amf7pG4ZGqP+MlP9ToiGcNL9ZigNragnVNVTMN0R7D0JD9NOHDV2gyB7B3PZa6GFbWaVVsRSUe4ljyw1fwGc6f73HIkNIC6UzTwFSpilzhq7Jmm0FRqaqEUUhlIV1JI9YKLXMgpUZ3R6AVyyA5qMTLCazkgc0VT++j7BAWUIPn0+B/vn/YFZRq7f3h4zjYFfpjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY5PR12MB6647.namprd12.prod.outlook.com (2603:10b6:930:40::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.17; Mon, 2 Dec 2024 18:13:12 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%7]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 18:13:12 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v1 3/6] mm/page_alloc: make __alloc_contig_migrate_range()
 static
Date: Mon, 02 Dec 2024 13:13:10 -0500
X-Mailer: MailMate (1.14r6065)
Message-ID: <460F2E4C-3DCD-4E11-A175-FE3EAA130AB1@nvidia.com>
In-Reply-To: <20241202125812.561028-4-david@redhat.com>
References: <20241202125812.561028-1-david@redhat.com>
 <20241202125812.561028-4-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0001.prod.exchangelabs.com (2603:10b6:208:10c::14)
 To DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5)
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY5PR12MB6647:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d2fea2a-29e7-4dd0-8af1-08dd12fcfbdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sz1qLBusXJSA0EDLyL3PCMIx6ck7FSpLW/ndqygsVYDkwmlWozhaPwF08hLq?=
 =?us-ascii?Q?tYM8Y5goStPp2nfGIq2o5sfu+IXQ1/qUKrCjQQIlyrn4rRZaDMwB0MZWzw6x?=
 =?us-ascii?Q?47G9d37SUNAI4kc2Am/we6RAHO6M3RHLZMiCLJfrB19lJSxGHAQYhpysiZVZ?=
 =?us-ascii?Q?A7Wi7vT+FwB9IHBrB6XWtsfVsVk4F3HJsPNxWzsjAEWND+JCalgIYWFdZKeK?=
 =?us-ascii?Q?w+22DMYiGvK4B+qX2kHLPTe+fhcCKVAvVhoo5fbYe17ptXIz4ogkI8dC+Zo1?=
 =?us-ascii?Q?Tnzin8cjsmgYoWuZmgQntEa5VXL1JHOiKFiIrTusZ6aNJw1XpNcTBOotAGsp?=
 =?us-ascii?Q?+mUt/Vv8TeMrdMd24ZBKDRV0SQfwf9LVC7iigRuUbp6XcoYr8088TvUnQILY?=
 =?us-ascii?Q?x2hlXvMihApYGbGlKLMELRq/TkRhy/w0m0qDK5kmRQXw5wiIG1seuQEuQP3o?=
 =?us-ascii?Q?m0dSae46yTTFr0c2uTkqi3GXLwhLUP+GByxj3hY4yKxp3sCWEc5gbYCNCC2H?=
 =?us-ascii?Q?Y1UrHYmAc75vRbSCfYHzqMOTRAO1w30QMGXOfwtI8mZUtSce5sITW9HBRtj7?=
 =?us-ascii?Q?DTlDQgl/Ay4PinoJe1acSAkLcN2t1IheP/MywrsHi/XuYK40pnXmL7FXYwFK?=
 =?us-ascii?Q?Q1JLV7B+5M2kkrHuSO6ulvLBSsmyimOHGCWL3z1nW2kODju2OQNCfg99LzQE?=
 =?us-ascii?Q?5dlsi0GDmtd7XKFJ3bo6gsMAFU1avQvWVQtaomyqSZsQeh6gKHm0kQBFHyyR?=
 =?us-ascii?Q?eUKUgag4dmpkAiF1gfuDg2hhfGUqPDZLnv+FWiScocqBGjQ8i6rI9Laypm4+?=
 =?us-ascii?Q?ZTAsEVmBT6iGaZoWkYma1ZXhu/zZcjR1h7GedTIj+M+CUfUNb/1RZ1I7n8WX?=
 =?us-ascii?Q?vpn5JvtsD2F4gXT8PtbtrD8tP8G6zOaI51bSyJd8E9wYvQyzkISLxHCGS7C+?=
 =?us-ascii?Q?cCd7vO6bJKk75P6FBVkCH6m0Fww66LB3g7qHu8TCS00QlAPeiydDJMBBAgRf?=
 =?us-ascii?Q?QKL8kggax91mp1+KkgnS3Ffi6HnpWfQyZnfAox9D3RUNI2dFenLuOMJcfJW7?=
 =?us-ascii?Q?XkSksE9DCb8Bn1jtQ2ztJQn0ymfMUSpDgKJmpqPcPUm1HufcfYYyPO7chKIK?=
 =?us-ascii?Q?H0ipLHGj/31J2OlYltbDB6n3aINDyN7+Yf+8nLvvQHVOT/87sxG8CgF3ojPA?=
 =?us-ascii?Q?XMj0k+leblrg+pMt1ZkXOlxwsizsOtIP+pYU+0w+21NCLrNeKqi+dMJAWenV?=
 =?us-ascii?Q?OdXkTvZmVoM0dIya05W23FiNQc6WXeNqpejiZHwh5NijFJv2UrKdkeJKqxTR?=
 =?us-ascii?Q?YQj7uSeJf90ObfAVC/gE3AeFfE7GTiDRJQqntf0Pi/cCRg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8DSQdlaaMVl+sCAO1B9dZLTXIQaY6VuFgRiSedsTuan21UHbKHV7xA74eMGK?=
 =?us-ascii?Q?sKp1BDJ7dpdwGjlykt5FzBNShyZpY5Ig3Gr6+TWDvD99IT/O//BGrPT8adpC?=
 =?us-ascii?Q?Nm648srLqQemtnk7t9SgeejI68hPy6A9TOtPBLo5uZSBTArPOytKTD0Udg+G?=
 =?us-ascii?Q?GBPu0hTVM+/71WayczzdJqD6FSdlMVM7ofeplY8UgJmESo5JSrB46EV5QKKi?=
 =?us-ascii?Q?T2mwdausNEsf1znjhg2lUKfjOmWcSBvgHOpUh79+N9Eh1gP9taSnOame+gRv?=
 =?us-ascii?Q?cS7fn0DPmHD1I11z9AbBNoUyFzOHyKDcUv4Dxe7p916bAJl+ZMOlnbf6ECMs?=
 =?us-ascii?Q?1hral8tvm4dkYg+3O8CaBNKdLtfhsXWTOw4Tu9PJnAFI0i2isDTbQOrLXDHu?=
 =?us-ascii?Q?NNXUnxMHsCGuYzuMr/Z3eY2xd3VsQ0IwPQ7r09geaMNdC9/JnDbas1tpKGB9?=
 =?us-ascii?Q?VVcziyDyb/YAK6QxvdL7CDr+BfLS4fUO4YNHrbOOg1GjdU+/vQrTWWQu+Uvy?=
 =?us-ascii?Q?JJdncn06TUW4rMraI0IMviMtafkScu+6LGXksnvSiLdh+f7LCd96miD+wzF0?=
 =?us-ascii?Q?VptSXQD5LMKXkaAVL7seA5/og9OWq6P3RAvgSbfMfM9s1mK3yWBx7PU/Q7z1?=
 =?us-ascii?Q?3AR4VYz2B5WsT8lYVj802DPhzQqNAEWHgGz/JWr9U28BtHvdRUcrbAmgmls4?=
 =?us-ascii?Q?90K1WaNlRq3rpBQBEU8r/cq0pHnbZxo0D0gZDP+DojcKXRJT7h03oPAlaTkj?=
 =?us-ascii?Q?FNke4nSGkTM2G5h6fXJiaTs0ZTcHQmQSIugmG43ZCQDa2ASQaGgZ2LBgxdSu?=
 =?us-ascii?Q?WKB8ZXDkDg3dTfPT/4OcyyIQxHjQ5DIiqddadX88a7tJhGOLTv4PEwEBFe5N?=
 =?us-ascii?Q?dZ2rrzHMDYcgnPjejDTDcJ1gmS4UKwpcbJH82Xxb1fP4vov8otRlbzvQsAhE?=
 =?us-ascii?Q?KyNBCVGbIyKcToTpvUPGVnjOJwqetDs3mbEexnwZlql+CIKHlY6J2/Qa0/lF?=
 =?us-ascii?Q?mE7umWZz6J3/7P9f2Wf3iaBvyeqZg2T9UhJffGYgkfE6gv3oetdMZDYmAtZE?=
 =?us-ascii?Q?/HfN+1tEjV3zJgDovtKWDW9VmlpiRr+R+tdyvsoqPNGMKrrUlOnkjGWjWV1s?=
 =?us-ascii?Q?sZ6y+j3ooU/vVbbcEEBbN5k2Snw/A49B5cmXIoWrLWwFtU+h9AmP0jJ1jLaB?=
 =?us-ascii?Q?vGEm4LWzG/LFjYcM7qZoOzdb1fghlcZ+S67EiaKb9j6G96aHsStWY3ojpp89?=
 =?us-ascii?Q?xQePOYNzTpbkbx7X0LHVkS5WyJm2CT1uSJMDy53hnvpZvEHFEa5XzpizvaK8?=
 =?us-ascii?Q?A/7lLN+Bgp06rEnMZL8T4DiuKSh+L845ThPB3R8eTBHdRTbcjKyG2DUTwe4J?=
 =?us-ascii?Q?RC58/HhhPKnjQwWBx4VC+0Lv/FnyUo71vJRJ/C9HN4BENwQ8l2di/V9u+UYJ?=
 =?us-ascii?Q?LjV5/qfEBE6y/brMHywfWqGh917hvhkOaXsHw76Atyxkvq8AkRUMqobMZKau?=
 =?us-ascii?Q?OwJeMWbKrCMpeabxk98Hcae01+yv1eoX7p8shSr5D4wfrYQAznWbiOQluCzQ?=
 =?us-ascii?Q?j1EXo3tDAVoG5tpscgKxDUYhsr2VPub0sJitF1UX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2fea2a-29e7-4dd0-8af1-08dd12fcfbdf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 18:13:12.4229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KES1rbRCN4MwETnRjMS8e5f0weecLwf+ne8eGpmJfLn5NcoBZK5IhMqc8Ao000ax
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6647
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2 Dec 2024, at 7:58, David Hildenbrand wrote:

> The single user is in page_alloc.c.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/internal.h   | 4 ----
>  mm/page_alloc.c | 5 ++---
>  2 files changed, 2 insertions(+), 7 deletions(-)
>
Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi

