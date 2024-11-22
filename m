Return-Path: <linuxppc-dev+bounces-3483-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D319D5749
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2024 02:43:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvdCX0N4qz2ysb;
	Fri, 22 Nov 2024 12:43:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::60d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732239784;
	cv=pass; b=bmFSXOaPQg3EX9xQNnhm9CmBOLynthVFicGXWHkARgLZfxAqOLZLCBGpGxtIR7NkInVPerUHEWY/AaWK6oS1WIYx86OOsROuAqD5mhxCOKJl3t8MMJJwYNUbQOqFxUMFgqIudxrJHCQfbwYoRq1pYOOI/nlarYX58HjiWSap+1maDpV9bf3B4F2Wrb54zpEO4KnSR7QXQbmmopkR4jXUog8mTUf/ocr/iP+/MH7ujt6/RaBR1tl+0BDh8+w7kbSClFIVzbc5OjomrysJrXf4L8ivll66peTHbgtg7InF7RaN2oAhIjkV1zkVfHymJUYHwi4pZ0772+eEw+icwruTaA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732239784; c=relaxed/relaxed;
	bh=e2xU6oSD+FHRjg+/4Fy6dbYJdX7wRP3wZtGIxoMZTGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NA9HyPw07iScwnqpq1lrLsXcKLLh1IW6nri6LT476zKER+vWa2wE8+/q51i4znjX/bHXzK7HdXV1LsM+0xs5iqS8JxUrT3uUAguqN0iG0XOHQfTrn7aC6DJpr9QR3RaVA4opQ2Dr0kpyqFdTtlVuI2yGfrJMMpr0358cw9IBBs/fuhAqEzA1k3QLxpC1gRy8y07BAkM08mpDrziDa57ww90rJQMJBVb45OLPEwaSZc5OXVAMe9E8Km/X2eLfjU9uyV4jHObgiaTGYlAuZc8mauoySQsjIZAIv3n7B1ZfsZqBxC4BCJNW48dYyodV9JmO4YPFDecwIqr1eWekbGysyw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=c3VUCeoj; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::60d; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=c3VUCeoj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::60d; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::60d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvdCW1HJHz2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 12:43:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vA4CRiuZuT9v5tT/N3Q8qIXkPC/Yx1pUAsWaoPZtzbmKfP6Jc4ZL9yNYjAQvF6fgeqXmNA5N6N9m4ywSodcEUUZ6KtW7VRWsHXQj6iaWYjOVnsSh5hjSjumgUofcIYNJFEgODJwP+SPFVNI4va5TGBmgv3bFKII+QTNzw63k6mGauhlL1sOG6MT16ugtns+tL8rz8/wsGLDJfBZcQ6LXWK//REaF2U7QK8v9FhYNfUThOJeWVj5rJNZtN1702ipqJhn2oFNWSomY0b7D/y3B3AkXA+MfjIA4V1ZaNM+TEzl5JEIX9WHwFjvyaWb/jNlD3MmtmC1OH6C7WVoxuH09NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2xU6oSD+FHRjg+/4Fy6dbYJdX7wRP3wZtGIxoMZTGc=;
 b=XanYBd/DxP2D4LruCV/z6N5pDOUdcs9coREPv37BAboIpdTRCSjeA1u0SW37509Px3Xbeq79W47q9elJSbM5lUeL30daNNixgeflrcIOl0xlute+CuXel146Su/IiUZ1VQz5vh+mCkKZ6gPcUTlrgUqKhmA/qeei5VTsdk5qWDf0w67ZjdUvWa2/eWA1yUI/vJSfl6hORrWSa/FYbUY+ZwIeDet11T3NLtE17lTi4Y4Xu6mdInn4jbKQBBIpg6Km64HiLDo5Ol6Vupivw/+0PHDt2J45RHlyvpKf2QoRfbCaB3WkujuFFYEWoSjLJGqumYnJnL68ndjMdJ9AASJbIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2xU6oSD+FHRjg+/4Fy6dbYJdX7wRP3wZtGIxoMZTGc=;
 b=c3VUCeoj6yF99BOq7WkrhuCX0rlQMoq+qEnuZCC3vH6QQQyj0+10iCT4URlVl/ouiaz1TYjDRyuHMj7n+5DY79AP5ofhOSq+qmVSvSG3F6bbiMNjl4GvMoYnsQKSEGC9WX9AY79a6q9UrNG6y2NviQL/1PtwLLgtL6TChwNgLhiCCdEYGSkj6IZA+RvX9Dzu+8rIC0rJo0aLUS9GcXdEwv19tT1a9w0ICymLwn27ul+iUcRZfDboHn7CsVxufWIeB/BgRNm5d+JDujySBZvzqoIMZdRgBQ0eJzjLU81gx1isJSBOXUwHYJhz6TVJsQTwYUgzoBXTo1rHV3P90d0JdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 BY5PR12MB4131.namprd12.prod.outlook.com (2603:10b6:a03:212::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Fri, 22 Nov
 2024 01:42:42 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.8182.016; Fri, 22 Nov 2024
 01:42:41 +0000
From: Alistair Popple <apopple@nvidia.com>
To: dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>,
	lina@asahilina.net,
	zhang.lyra@gmail.com,
	gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	logang@deltatee.com,
	bhelgaas@google.com,
	jack@suse.cz,
	jgg@ziepe.ca,
	catalin.marinas@arm.com,
	will@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	ira.weiny@intel.com,
	willy@infradead.org,
	djwong@kernel.org,
	tytso@mit.edu,
	linmiaohe@huawei.com,
	david@redhat.com,
	peterx@redhat.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com,
	hch@lst.de,
	david@fromorbit.com
Subject: [PATCH v3 19/25] memcontrol-v1: Ignore ZONE_DEVICE pages
Date: Fri, 22 Nov 2024 12:40:40 +1100
Message-ID: <86b1894c81725688cc54afc8019ebb3cb3b6dae4.1732239628.git-series.apopple@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.e1ebdd6cab9bde0d232c1810deacf0bae25e6707.1732239628.git-series.apopple@nvidia.com>
References: <cover.e1ebdd6cab9bde0d232c1810deacf0bae25e6707.1732239628.git-series.apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0134.ausprd01.prod.outlook.com
 (2603:10c6:10:1b9::12) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|BY5PR12MB4131:EE_
X-MS-Office365-Filtering-Correlation-Id: a0400356-4ae3-4c76-9b27-08dd0a96f3ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BgTh3UJqMWcTWWQHMqyDtb11ZYC5LrHScWl00Z5dzqzn5Te8Ye/A281z6SIf?=
 =?us-ascii?Q?tYRtJESDk5IVKroP3dZNIyhalN/Z7holHo9JCKJKdNWSOQxROudA3+xTzEXr?=
 =?us-ascii?Q?OcgxB1j147C17d5c/4bLnYerqIQJ2N/2f+yJbtG4nyXY+pkhbQWLYUyyWJJT?=
 =?us-ascii?Q?jpyPyQ3vGz6NQNXWvE/1tMNStLHirNC1zdguN8v9e2tDTiQsoouqH9i2lkCN?=
 =?us-ascii?Q?GDmCxGAtNt3nRoMIH98+yn5Mu9vh8vY0cQPbgdLFdkZj8dIfW49u236inM3V?=
 =?us-ascii?Q?2A3NTxLoBuaKE0zyYC4OX/ptfJKm+Z9guDHj2qGTUgT9mwILmtJ+HPDffzrt?=
 =?us-ascii?Q?vGFs94hKOhsU10gFL8q1zYeSFyj3ieOLa16tQkY2l1SYYNGECpi6T9unJwau?=
 =?us-ascii?Q?9MuSmL7QBo++KaARY7cRQ/biPK2vSGiyuxKNhVeMxoCCgsQYbUD0t9FlSXN8?=
 =?us-ascii?Q?xxPHj3HRHfxd4Md5wHnh+LPy/qX5iKezAHOjdP7cFGioKVoNV5Fi8TrPVVwi?=
 =?us-ascii?Q?XXMDfYN3fBQlL7nM0et9/U6Vn+HxUMEbskGThVCQWeesGx2yFcHz0x+ka4Eb?=
 =?us-ascii?Q?GQ33b1d/ckQHje0rrBH2v0kFxKXSr9SqTFqddD5wA8F7lRQs1/XttQd1OgON?=
 =?us-ascii?Q?Fvmm03rASg3ydaOWDwW3pUy89Oja75oLNG/c+CMB3lqxQVxShtVF/ibM4w7d?=
 =?us-ascii?Q?/Xg5C6cL38kmDWagD3lNqB2BB1heHxclWRfCYdUMzWNcOD2FG03ICAS8UNB2?=
 =?us-ascii?Q?U572MXcKmAKf2Drsl1oUN/xBHPNwgID6l76gbKuFlksRlpJWHzeU7FFJ/yR0?=
 =?us-ascii?Q?ArhDQgmkLeSOhDFbZygPj+t2D8Kr3dXi2TKKAaD/Mc2xg9iQMVG+fYqwqj+2?=
 =?us-ascii?Q?aTUJ2QGC6SeWORMFjNXSinnNe0LKJRkINv6hn+ACGKRdyw/8N04fbL2gtr6t?=
 =?us-ascii?Q?pdzDNpR1+N2zUdFwu3DSb/K454dIqAFmG5pOWowXUx1FeSgjhlWzuSALGYh7?=
 =?us-ascii?Q?p5GbyJVUGRMYEWCefwuHulKX5nFvE6NCHgL5RC90oaIsT4pRFY8VLNNXoJHq?=
 =?us-ascii?Q?yxy4GCe34t+DDK6OKkAzWqn+TRwMXrnl3952jRlsi/0IGzCuwA1GgihlSYPj?=
 =?us-ascii?Q?jX/AopGCSfHHcCId3n7FGEwUM9gUOkfAqizkgvEdKiHEHELKuRi8Otirp5MD?=
 =?us-ascii?Q?lJVmIXAqArAZiWNELghIYSH+WAWz8U7F6p8YKrHmBC4hncQgCyOVvPjEZN9J?=
 =?us-ascii?Q?qiEcaCTnBY/mwYDhRkdZ6uQuaRILSSqao9Zgkx85GY6SVuXe4pRlwu/TfUP2?=
 =?us-ascii?Q?BEe04+e6Iab+Aq1k+te7POM7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gG+P7NKv1NBMcLXVSZFeSqIEzlZzrtsJwVSMNPc3SgFsqNKJkYAvpm0jtdKt?=
 =?us-ascii?Q?g1gGL0SXjJuxEcqC0re+1IAijwxOtL4oLNd4I3/GgKy0hL5YejWATZDKBu2L?=
 =?us-ascii?Q?NJG8ZJsgiY4M1QEXaJrj7HFpxz/o5XVGNp/ua/AsBf3bziGYuGnmaAaDfWfR?=
 =?us-ascii?Q?JifWV3vgG2quHIJBFdrajBk+JgYMZxCUz2WFsmhok2NaLRnzbS9iQoPQ4Wqe?=
 =?us-ascii?Q?5F96OJgjEIJL+DG5MK56nCxupQkKOdiCLExj8zJp/2UQQ7RdvIiGcgmkOqbQ?=
 =?us-ascii?Q?l9RUe82V9/GFrs8H/e7j88rTT4dUj4KlkEdphwieULNcgUrDI1xIpTVleiTw?=
 =?us-ascii?Q?MlQCgqO06rwr0tzHUwLgDq86Qd7DTu8Dq7jVhqpbvgo4xFZKQHeaGW0T1rG7?=
 =?us-ascii?Q?PiKAQL6OFLC3O81zqctvy0j/Dg2vvtRB01fN359adXdv3bRMiq71BqnRs9U0?=
 =?us-ascii?Q?5GtMLqzVuuuwALVA6zfJMYa+dYJHs+P0k6B5KnU5kVbRHV7luZUvI84iOcGf?=
 =?us-ascii?Q?OOpa8mPzkArKYS0zkkoE6Wssuqgeoerr4+0ce4ov1n63o4nBDk6iPpZQ9bmx?=
 =?us-ascii?Q?gxowy6nGIRfzNyodlpOoNgUEIT9T/m55g62aVi2yU40AzFbyLZY0Z90RC9H3?=
 =?us-ascii?Q?1Jv6IHFZyGt7ZLoWQ31jpwXTUSdb6mdFMUrN4ULyXt4SpM9vv68bp+rXT7cj?=
 =?us-ascii?Q?T2ByaghsHTJH9iLw7EOJlMg+G5sRWnjkLttgXuUwDRY5cEo3NA3/JL+FuSV7?=
 =?us-ascii?Q?bAT5HJjJLGOya141SpCfacd7U2viWXaEL33icFAuJZDjvqYvruyjJEBe0+NS?=
 =?us-ascii?Q?R5Q+MYSE0Te7zh5jOVXHXuEKyDw3o3IZ9w2IQhW0WRuNh7WIkZdL87CD2KST?=
 =?us-ascii?Q?wLHHoYovi9gPyFMoWPMMpBdGmxjRWhVqhFT6z+nMXo7weZu1JwXXDCOOw0qB?=
 =?us-ascii?Q?B+0TxQEmgEGuOf27MA1cQY/hkOp2tvCTOgq+7ZZWLNg5kYOQfXmRH8BRAW6X?=
 =?us-ascii?Q?9+1242WMn0Vap7yct62zVBXZbw9JmELCO3QDYQ2RcHdwCi+t0+V+wMV81H6D?=
 =?us-ascii?Q?wfP6XSncXa7OeZEmO1r9QYwz3VaslshjdWMOXiJZnI94nbA540P72HPhHuUT?=
 =?us-ascii?Q?XjD+cIuVmFb4llPQ/Npi9fgq6q8z0055djhc4NAS6eyg4Wcad1P2CgRu7o6F?=
 =?us-ascii?Q?XfxGXt5OP9TRzwtNKq95XPVcp5O/sd+BuJuu3POXK8Ch+OLq1qaw/k12zW3H?=
 =?us-ascii?Q?fKmy9PSuZV0atWKsjZ2sytrlM5kc0LSJHXMyFEg9vVRypTmf8LGISPkSZ36l?=
 =?us-ascii?Q?/34cLZzMsegufucz7GYz28DVcQ4W7YlHS2n9TFQlML8maq0jOh6I83xScwuA?=
 =?us-ascii?Q?LPJgVWqTHvVGFAz4Oi4TCWEyyQ9WmJy1iwNy8Qm2R2gjaFrofmhYbW3/CEwN?=
 =?us-ascii?Q?rTG2u7Mp2gavofbRG02nrjCSr1fO9/xaTCb+I2V0R3nCrF5hfNHsKBSbANIv?=
 =?us-ascii?Q?8TOb0KztYJ9K+x/h0+5AoGUvnXuZAx+/2PuSPA76B07zbIs1P/fV7IPSeO+i?=
 =?us-ascii?Q?AAf0gjTPZRH8OGsmkh5Rzx7TMBpF2XrRmOSBNsiz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0400356-4ae3-4c76-9b27-08dd0a96f3ff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 01:42:41.2651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJnoaEdfL5nvpmzDUnjqmrC4/KNz1GaFsgxUDhSTMgcAKYYgN2R/jHcWvWEtBmQdN03aJABY4mS4f01AbBYs/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4131
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

memcontrol currently ignores device dax and fs dax pages because these
pages are considered special. To maintain existing behaviour once
these pages are treated as normal pages and returned from
vm_normal_page() add a test to explicitly skip charging them.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 mm/memcontrol-v1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memcontrol-v1.c b/mm/memcontrol-v1.c
index 81d8819..b10a095 100644
--- a/mm/memcontrol-v1.c
+++ b/mm/memcontrol-v1.c
@@ -667,7 +667,7 @@ static struct page *mc_handle_present_pte(struct vm_area_struct *vma,
 {
 	struct page *page = vm_normal_page(vma, addr, ptent);
 
-	if (!page)
+	if (!page || is_device_dax_page(page) || is_fsdax_page(page))
 		return NULL;
 	if (PageAnon(page)) {
 		if (!(mc.flags & MOVE_ANON))
-- 
git-series 0.9.1

