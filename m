Return-Path: <linuxppc-dev+bounces-16194-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB7HGhMUc2l3sAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16194-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:24:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B13570E4E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:24:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy7Dt735Sz2yFK;
	Fri, 23 Jan 2026 17:24:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769149454;
	cv=pass; b=IX34yvueJAQzYd3J8TGMZAj6jsnFRcJgCkb0QISgNxanEuwkFnQDLdf9kUN/avgAutafb0r6AhCvlx1Qbl5jBi5jtjCyKoq5+o0AuqQuj9uC2K5xdH+YCjYkoLk/IFnKAOxjWq6/J1dpYjRf08wvcJgGeRKPIyJYoT0/052bJwkOUYoiKY34mwbkRxq00kVncycwaPAZarUZVLVVri4l9/W7RM/Mdf66Bgat+HjRUpnQG8UDxh6llDSV/j0OD1UGmPs/mTOx0ZkFVr5WA3wbPaj4tHF9jptCmXXGPWWxLqUL27U9qRkXKj+XHfG+22dtu7MI4QrrZsuUk3RVURQMWw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769149454; c=relaxed/relaxed;
	bh=xD+Pvh4eETe8DHjrfq7a8bC2+wEQ/sG9UjQVVasxINA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JxNuF/ndxViwRadWZwDWFgYmt3+zAutWOGZBeVwqqTvGMjtc6FNELrJeMr8diwepX2NtG8RM/Xax8I9i0cBmE6DWTHS7f6MH7SuESa6/rpJiL81kdk3DUi2VEzaD04VfysFewF8LjI9D2myA1IV6fO/TpLmJAtszGlWu8NC6muSDdC2VfYHbvPIiHvxm0hhPyE+R13V5VqPw54i4QQQGR00BSVL/rPc8lRvESZ4evY48I/j3L9IXvRjr3jo4w97e2d23PubF+nSQxgCtiRkpeP/8VACxF9f6CqScrs4AGnPPg+Xq8ywx9ws/UWkf3EBk32r5Hf+inmbj9lrwGEEzMg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KcNDYk+P; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KcNDYk+P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy7Dt0Krkz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 17:24:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wizd7qBiQkJ1V3/b5YKQ6Ngd+nUqmFrvJ/BKOjDaJxHPzxzElgPYKd3AD5ZDo7nC1Ul17iXd9CS1VxASWjuytpdUOIjshmbqnKHaNaCA7e+H/U2EDftL8+UNKTQm6GCRURh26XJk/wa6fvTgX4yFP0nfNbmJsKcdNI2BE6DAknet3Q0X7RxSFnyncnnt15FVZnlMPydmOWto3Qq6XNObY98Gr+BVX/RGhBtbP2yNP+WDTnmWVt8szF7Yl/JQOwlbgOqILu39CKwkltFGkvIHug2HsC7Mc6vrYxDRm5/InXbc3VueJq68472gV9xHp1y04TJdfGp01MX9X1o5BLYBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xD+Pvh4eETe8DHjrfq7a8bC2+wEQ/sG9UjQVVasxINA=;
 b=cpa86Dd2ocNWlO1uwKbv3matZMqAP7Y0mxA9too0tzhCPD00WMfTw8zcme33ccdeCHtIA+la6HFbyDgYClhXeYAQTn9Sm6c3EnQBOTCGoTCoWk0czuuG/ED2/K8B3m3sbdmQJBzHEtazV9E6ptu4BvKEgT9VJIm7OKaTL7MLmdqCK0yEczkXSMpi8HsnrWF/tLmOeA0Iu+j+HM1rDXGEPDM7zaPihnnvrqA8zTTi5jx2LP7Ch/UF+Y9nA5PFz6PuzkmV29VsDciHuSQnKlc1x4/Q7p4ElvmdQaIz1FklOdcR7dpM1TMkzE+NUHzXzdCDxFj8xKtbhE2TCjPTJlxT7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xD+Pvh4eETe8DHjrfq7a8bC2+wEQ/sG9UjQVVasxINA=;
 b=KcNDYk+Pz3KF9sBLsZrZM2Gd9Gu8A8yhmDOA7AURKD+dl+7TvL1+76uwLR9i8nIGp2857qwbXPMwmiWwq8ZrT2e/KenWLqwGNfuUIUBcP+WZ+UM2o1fCfYZ9fdaJ3GS2fHUu5IXWud9xjUMw6+heMrdyxx5hCeOw89pMon7os92/fxSHK47IJxWjk2N1NkJ6XgPbHk6bvCAOduvtV0nqXTza8tflXncYvOj0idihnuvI71YWaQ4NSHdDOaAtlQmSgDEmJqxswhMj9zBpX2uYVjpHjAqwmM4dLNh70B2uzQ+U9YoewnrKDHMiH4oWWt5GXZkbgGz6lAkJNQhbwnmYNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS0PR12MB8020.namprd12.prod.outlook.com (2603:10b6:8:14f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 06:23:49 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 06:23:49 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	david@redhat.com,
	ziy@nvidia.com,
	apopple@nvidia.com,
	lorenzo.stoakes@oracle.com,
	lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	rcampbell@nvidia.com,
	mpenttil@redhat.com,
	jgg@nvidia.com,
	willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca,
	Felix.Kuehling@amd.com,
	jniethe@nvidia.com,
	jhubbard@nvidia.com
Subject: [PATCH v3 04/13] mm/migrate_device: Add migrate PFN flag to track device private pages
Date: Fri, 23 Jan 2026 17:23:00 +1100
Message-Id: <20260123062309.23090-5-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123062309.23090-1-jniethe@nvidia.com>
References: <20260123062309.23090-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:a03:255::33) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|DS0PR12MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 472a69d3-daa7-4611-97e2-08de5a47f8ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j+JA5zzMfaYbruHYBT9D9glM5gS3T1YRSrXabi05Whza77lzXOM4AR4t3HdI?=
 =?us-ascii?Q?psSI9us/J7car8yH2tiQJpBjlFb+Awjf9gzQU4/o6X57N5/Nl38z2BkNbN2C?=
 =?us-ascii?Q?NL2BMJSbHll4JNdIn97UcVMrxt0UhezFBUG4jIDBEeJKBNyI5f273a6K82gd?=
 =?us-ascii?Q?PTXKsUYVHJvvrLQrzfzhtrRQ1HLTjIm0uTi+fqG+y96PJTF1UI3ZvlM7eaVQ?=
 =?us-ascii?Q?1ZRm/iFiu3UVqPXcCpSYsCCBAMNnkLsggSHN8zpZ4SViFMGsaM5sBoFy3Kj/?=
 =?us-ascii?Q?QkhuEKs85lJj+QiL6wlVNo/FlNgKw704Tyj8vQaQQ/Rpe8fmE7Kdhp3MWtmc?=
 =?us-ascii?Q?2Y4U76+rzKJ8igbqh8nMM3r6JjAN4twaEK4cn9PMuzYpxEZqhS9xkIJmx+Q/?=
 =?us-ascii?Q?plaKbTQ4CybZrQboH5J7XyMJ1lXUk2nwkDwxmd8LNu/fuqOBk+TNphdE40u6?=
 =?us-ascii?Q?rsUA/Ty54rQrOfXJs1pI21teDmoZxLYLH1ZpEKH+J3e5lILETlM/GHWaHM6J?=
 =?us-ascii?Q?TaaI4j68wR0sD9fn6ZaUzjceskP9Wgt0hxa19125pf1PRdveLdzdQE3+rKNB?=
 =?us-ascii?Q?Ouns19fYoS5CZ9dF7HU2oSEMnPD66kaoaHgSrYaXWNl63R1JPK8+cDjMPEut?=
 =?us-ascii?Q?nNUhIOuVZZ3ehNTNQ+9gfTLUQjgvUHpouHim5sCaiJR6OhrPUAkwHT9NnYfR?=
 =?us-ascii?Q?wKdhCFSMqfQNkq8ajMXIic5Zm/BAORJoYO9dDUtnXshJO6P9JveFB0BNMgsb?=
 =?us-ascii?Q?ARDNqjqEY1LLtEHjgbRUD1MJwveFxkLFb2NSgf0cXAd2koeKeAEJMSsNH3eN?=
 =?us-ascii?Q?6ErfmrAQrsdufxynUHgwh1NcoXLxhj50CDDKOs4512HVCD6JWPAtR4MEFF6X?=
 =?us-ascii?Q?iKroaMHu0ATHDPXUFazQOWH3+3d26PXY/enj+T4x8kXvjG4IsxlIC/BqOQ55?=
 =?us-ascii?Q?z9PHgmxG74KgDCDS1nR7CgjSkt/wA6ms6MmjhY7s7/kOqEB+qug02OX9KqNO?=
 =?us-ascii?Q?GypFTxKVapmQCbSM1NHeoE7EbMXLYUlcgCbWdIw2gPt0ludvuTIqw+Gge/Gs?=
 =?us-ascii?Q?P4Ak0kDL5QAEFkR4bB2AULH5qCwaG5cISyxPv65OXaCudUz2gEpPX9fOAqHL?=
 =?us-ascii?Q?koQ2BlIHlcjLiVgzN9OuUZw4M6Qee1bzRrMIVdSAvKlSrOAXR1BfI+R3nZDC?=
 =?us-ascii?Q?8o0EYmuKoGT9NL2/xDMKbCFCsD8sICY4m4u/ESQFxPs0ljqARnNd6sbmwVrr?=
 =?us-ascii?Q?aOKjw5/JzTcfmM5s+f/OKZW0z+WRe8RPpf9bs4xnoxuNlDKlIgA0Ju9p0HnU?=
 =?us-ascii?Q?w6f6e/M0htXWs2sfds3efr102AwpJ0mPjn5Jk9mbo+vnQEpiwhRp4lvzDbyS?=
 =?us-ascii?Q?qDW6v6bNG4gTtxXMXoqLnkbtxXNCMWIWRwn9715j0wXoMUrtvV7qJlCZ1EF+?=
 =?us-ascii?Q?Hd1rlYKm9ubk/49cFpDe317uzr/DxRn6r0vwPc7FGvXzA+2dGbkeaV8S6hV3?=
 =?us-ascii?Q?tqSvPwOPl2Et4VeGO2Ksenh+mN0WoNs9E1kiVufu5/ma2X1Fqg3+4nNPPD8W?=
 =?us-ascii?Q?7zQcpB+2warx9/Q3YOE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SV6nXNNkd+o7ImN40D3i5B6fxQMiMed5jRJB2TPuC2LHzUx6MrQq64T6yVVI?=
 =?us-ascii?Q?rMBA2Ywk6kUB0nBWbTwFonbM9GsIwhFoqJYELsAAt6zsv055j/qKD+4vAdxf?=
 =?us-ascii?Q?U4Aq4HNIHeiH9nYgsvDyKwEuPHuiyg728fd4ydjCIcjFc6ZfvWQAOE+yH24u?=
 =?us-ascii?Q?LoihPlAMYtgkx541FlvSVBiA9TqqYRWm68FeCBRnHI7R+H+wfWsXh0OoKXVs?=
 =?us-ascii?Q?lpnS6ASMg0ASa5t7V9+Bqhyi0XDhum6BNfQNwshyFTnV8mmIkRJ0MaTEhT8T?=
 =?us-ascii?Q?8QhNFPsNg+N7iB27RuWs3HJPsr7be8vbBIjmEA8uUTRsP5MlhBA+UUwopyUo?=
 =?us-ascii?Q?nuP/oCeoSjRT7xTMlrACzFzfIvy9VMUjxJBocMvdg2HlmbyG0oOMy4q3B+zc?=
 =?us-ascii?Q?sYQEnjNfBPBO0kmFzyPVvpJysHaDK21f+vbjytiIS4VV55FtTf5ZhUfYFM9w?=
 =?us-ascii?Q?OmDSH5x/Xxsl4dGHkoSuu0gEw3pJww0Ou3i6cWUwSbpkm2//zi/hYAJsTDd5?=
 =?us-ascii?Q?doPCVPnDOfBv6Y3hjK8WuD1CiM/ZIotPYD2qW9SfSJqn+YxchMrVJMRli2+B?=
 =?us-ascii?Q?5ewh8Q2b67qJR8+Nx9KuwGgy4CN9ROz8RnxpIPI6scxI939dpxWXtOhJJUz7?=
 =?us-ascii?Q?BZqXrCngdWAAVqK5jzwaMmJkFt5O5llYR4VkIU0pOg5WmCGRXlcHxiCM74cr?=
 =?us-ascii?Q?KRoGCc8KjOyaHGgPK0U0vNZKI5zCNMDueMOApIs+hAEI/ph5bwVsXTDsdF55?=
 =?us-ascii?Q?mp+0IWPgECLAArwY4UB9y3ol81c+iI8ih6DBzIo5fvF/Jqg60jmA1HpueAzA?=
 =?us-ascii?Q?AjK4kYi7JSRRt+cqGDISEwFhU4b98A1aUcd4a6nZ62s9HQE2ei/ReZ24FHW8?=
 =?us-ascii?Q?mtUdFz/WCK8Sqc1+jQAaezoM2qn8YNjbCpTsV4a2FrQOEMM2s5ZqUL9jdS0E?=
 =?us-ascii?Q?HjYLjnNYRHFfxI+171thUmTiQyt5auCRdGRoLIHd48ljrxYZ270Irp8JG/nS?=
 =?us-ascii?Q?JQqdYxcg69wgcR5QgNy/i3TFvPk3ApubIcZ3cBWjL2yEpGlIvtB6FzMinHOh?=
 =?us-ascii?Q?HaOujNfRqF6Mlank8flZxh72KVdUVL0kvx2XqWg/nHaD1GKreF1TBVuzVgT3?=
 =?us-ascii?Q?Z8LCsw8oC9Ey+9+we2Is7NodgciwOXGWoGzzQ4R0VxC9CWZ9htMpzfjFsH7v?=
 =?us-ascii?Q?UpquX5vEqHotPryX28cE0OSgmynR+yN27+nbWYA5l0LymJBX+MP3H+VQVT2L?=
 =?us-ascii?Q?7iICtIhd1Xw3wyKKeGdz+fENxVl4H2WPzsDYnwFUHZddGBKy0Dd3MiYOsMaX?=
 =?us-ascii?Q?bsrqDIYAacFoCQ3Fi+32XGTT1U04RUbqF7O8ppbbHFDeHcsVXVKFIsxH6cl7?=
 =?us-ascii?Q?zZqiMcMF0tnjoca5mdYKgeQWWg3nRtpkhNQoMDtZp3VToRUDdkMbOBGF+LoU?=
 =?us-ascii?Q?58FUz4tjcLRZlcouWSi6QNF/wJdyGCft2pQ30DdE4l9Cv0JgRQQ0Iz3UDCgf?=
 =?us-ascii?Q?REIUTn/C5vuOYLo6jKbEl2kPZ7SU2wFQV5nK68G17ZUMm/24uslg7smde8Jk?=
 =?us-ascii?Q?hJu5+W7aX8C+RVvD3gUF3mDjUuKTd6GUTvX4caunbDkdzU0f2Jfc3gcYyh9N?=
 =?us-ascii?Q?2pFMu3vCe78vex66uyJfGNuNPi9tLta+3+AvT7dY1LPhWBzYY3LDhFF/Hpv5?=
 =?us-ascii?Q?+SiCVgTHToELq26Egs9vVwBlEth3kqAlAv/w8Fm5DGkzXigJ/q0Q8eZhjIwJ?=
 =?us-ascii?Q?zUl71hFCvw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 472a69d3-daa7-4611-97e2-08de5a47f8ad
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:23:49.7043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2bSGOKxy5NX0Dg90VH5ufjdruBmFvoMcYPaeteRuQuDYOy+oVZQmYWoDkvSLKG+rM66xCkI5zCn8aa18i2AO7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8020
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16194-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.097];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 6B13570E4E
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal PFN and must be handled separately.

Prepare for this by adding a MIGRATE_PFN_DEVICE_PRIVATE flag to indicate
that a migrate pfn contains a PFN for a device private page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>

---
v1:
- Update for HMM huge page support
- Update existing drivers to use MIGRATE_PFN_DEVICE
v2:
- Include changes to migrate_pfn_from_page()
- Rename to MIGRATE_PFN_DEVICE_PRIVATE
- drm/amd: Check adev->gmc.xgmi.connected_to_cpu
- lib/test_hmm.c: Check chunk->pagemap.type == MEMORY_DEVICE_PRIVATE

v3:
- Use adev->kfd.pgmap.type == MEMORY_DEVICE_PRIVATE
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  7 ++++++-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  3 ++-
 drivers/gpu/drm/xe/xe_svm.c              |  2 +-
 include/linux/migrate.h                  | 14 +++++++++-----
 lib/test_hmm.c                           |  6 +++++-
 5 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 3dd7a35d19f7..5478e41877e5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -212,7 +212,12 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
 unsigned long
 svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr)
 {
-	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT);
+	unsigned long flags = 0;
+
+	if (adev->kfd.pgmap.type == MEMORY_DEVICE_PRIVATE)
+		flags |= MIGRATE_PFN_DEVICE_PRIVATE;
+	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT) |
+	       flags;
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index bd3f7102c3f9..adfa3df5cbc5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -484,7 +484,8 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	dma_info = kvcalloc(npages, sizeof(*dma_info), GFP_KERNEL | __GFP_NOFAIL);
 
 	migrate_device_range(src_pfns,
-			     migrate_pfn(chunk->pagemap.range.start >> PAGE_SHIFT),
+			     migrate_pfn(chunk->pagemap.range.start >> PAGE_SHIFT) |
+			     MIGRATE_PFN_DEVICE_PRIVATE,
 			     npages);
 
 	for (i = 0; i < npages; i++) {
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index fbf5fd284616..a8aad9e0b1fb 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -770,7 +770,7 @@ static int xe_svm_populate_devmem_mpfn(struct drm_pagemap_devmem *devmem_allocat
 		int i;
 
 		for (i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
-			pfn[j++] = migrate_pfn(block_pfn + i);
+			pfn[j++] = migrate_pfn(block_pfn + i) | MIGRATE_PFN_DEVICE_PRIVATE;
 	}
 
 	return 0;
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index d269ec1400be..5fd2ee080bc0 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -122,11 +122,12 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
  * have enough bits to store all physical address and flags. So far we have
  * enough room for all our flags.
  */
-#define MIGRATE_PFN_VALID	(1UL << 0)
-#define MIGRATE_PFN_MIGRATE	(1UL << 1)
-#define MIGRATE_PFN_WRITE	(1UL << 3)
-#define MIGRATE_PFN_COMPOUND	(1UL << 4)
-#define MIGRATE_PFN_SHIFT	6
+#define MIGRATE_PFN_VALID		(1UL << 0)
+#define MIGRATE_PFN_MIGRATE		(1UL << 1)
+#define MIGRATE_PFN_WRITE		(1UL << 3)
+#define MIGRATE_PFN_COMPOUND		(1UL << 4)
+#define MIGRATE_PFN_DEVICE_PRIVATE	(1UL << 5)
+#define MIGRATE_PFN_SHIFT		6
 
 static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
 {
@@ -142,6 +143,9 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 
 static inline unsigned long migrate_pfn_from_page(struct page *page)
 {
+	if (is_device_private_page(page))
+		return migrate_pfn(page_to_pfn(page)) |
+		       MIGRATE_PFN_DEVICE_PRIVATE;
 	return migrate_pfn(page_to_pfn(page));
 }
 
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index a6ff292596f3..872d3846af7b 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1385,11 +1385,15 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	unsigned long *src_pfns;
 	unsigned long *dst_pfns;
 	unsigned int order = 0;
+	unsigned long flags = 0;
 
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 
-	migrate_device_range(src_pfns, migrate_pfn(start_pfn), npages);
+	if (chunk->pagemap.type == MEMORY_DEVICE_PRIVATE)
+		flags |= MIGRATE_PFN_DEVICE_PRIVATE;
+
+	migrate_device_range(src_pfns, migrate_pfn(start_pfn) | flags, npages);
 	for (i = 0; i < npages; i++) {
 		struct page *dpage, *spage;
 
-- 
2.34.1


