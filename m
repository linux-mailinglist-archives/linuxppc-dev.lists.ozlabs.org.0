Return-Path: <linuxppc-dev+bounces-16199-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO2sODoUc2lksAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16199-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:24:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4597870EDB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:24:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy7FN4JPMz3cHx;
	Fri, 23 Jan 2026 17:24:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769149480;
	cv=pass; b=BGtNjrJhFpeCOZNY4Dodb5pQnBh3S//Z79kFd4XfpdtdlHYPGvV6BH4upd3aFbPHWBI3B8tRrh0LSn9weDFykN4uB00/fIkmWXDdr7fS7bs0Keegnd2qHtVjojFILWWdhW6vuQ8I9OdO+s8bFw69+rIGApbmZebUvEut3z7i+FHRXlLNPhfcRfzzSXQn+J24pbW7IaK0k9wUfLLGb078fS6EKjKtnzqCRryz1BOi6q2r7cR0F3gXO9uSVWp81kFFv1xunxj0EHM5u7/wFlOVBtcvJnLvbfn8pPgVccUGV4812KOot6Bz2NXtfcMbX1iLiELFK1tdYuDVlgfNPWjsrg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769149480; c=relaxed/relaxed;
	bh=NJRKGijDy281u3FFBQFNlpVMWwAgnO4o4gEkUuYonCE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fxL6Ji32ojylaP+8rcdsnMPxJiI64end61ecVjfPwwLSk1/OSLWtu7/e6kB7KNACCYrRA/jU71Uk2cbREk2zSVEgMKLf7dNway+t24wcPWyp++GQ7VUoFn8pTTe+qVjFPchf+omUsg4j9z4RDbv4xLtdKVZMU/W5Tfmrol78MpFIhHFRB99ezSYnoCOvcCVr9VX9MdgMCbA8wJG/Opa4OJUj5uzalngqfQEUIcNLNPVjGUhDqLI0SbucjLlQy/tiQ9H9AnHkiuP1rBoInUcIrvtvjFrg8ieCzoZgdiN6sT+AbETqgt+bxJLS8uMGCj0eSTqSubGqxEuja7Q2l2mz7A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NyeP3h+7; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NyeP3h+7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy7FN04hPz30hP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 17:24:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGgv+RejmHYyW0jMISSGTfDmv5EbLzLJ9F6rUK3cH7rwhTc2rZlhL/EHdtMVFNDb4tyr+iMR73Ujd0uGNqhPOVSRIeQ285alRRdViSTAQd23hFHrJAbUBB1mDXewfZyKGZhMPQK1GpNW4XEumU1V71ojbr75rlhAoq9LshqiJ4BkrrDlBd9qO+89lYk1qSgqFVjhXOcNgQvlucJEuX2aTeIpl9Yg2Tz6n0mPXtyRcloYhUhZv8xdtZXUJN6R3YYHTOqqQj0NC1eVY8wOgzVFp0Qu7CM0cNfbNr5CKvvovbUBxtW8a8JOkMT17zN2156TU3MH1K11p62MKjXcDndT6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJRKGijDy281u3FFBQFNlpVMWwAgnO4o4gEkUuYonCE=;
 b=W0BDjLvC/a+DfrylfzRwdBQ+1i86YIQ7Gs2YaYfGPTzdw1JN6TQOyDvFsZkXiVZ7riVz6qe9/mf0uBV/MHHj1hvLYTmcb8zz/HTYhKucR4gcwBsYagoIlygeaQRKVwCbk/gndEyaXlgST1jZNdtXBBPUu4bvuuFMmvIcBmx/dopg50UAHovVNbL9a/aygIShVLY87FDNhGOI3N8pdT7WH+I00uiYZEody4iBwph8LwEgYtGM1HAXo66gZJYyu1h1dlYHDzy6tM4SFUPnP0VA/euT4/dac5XhwUK/waIkW9y/2YK4R0mwD4djdAOZIXDa+IyRFNw5eaCpXTvcGyhrpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJRKGijDy281u3FFBQFNlpVMWwAgnO4o4gEkUuYonCE=;
 b=NyeP3h+7xaqd9Sc94XwpktoNdy2JS0OBzZPJoOq/N1vAeKSk/CWLYaUJXYYUnMe6B/B4xsHNivjsEFGaGtof5sBYTmHXg1okBjrsXYHL+WrTYrKPSRDnM+9xd5hKfNhOBtWmDFPt0hOKLSe4iJH1DHCZ5HyBBXgwDIuH+nRG1ScCnvA/Gw5k6qRflIaeKMQ06SwhtGbZv8GgKCTUrIdaSbcbbH4dwr09dhZxE7OvCh1FCqXnqwgRgyZ62h234/9AkRxjTghV1/ShM2sIVe8pmrjQUFUZA3bEmrVnk8fNuHlWtmh7YmuLBAeHQniGoffVx+2h2q7tRDr6i4BtDMCADw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DS0PR12MB8020.namprd12.prod.outlook.com (2603:10b6:8:14f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Fri, 23 Jan 2026 06:24:23 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 06:24:22 +0000
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
Subject: [PATCH v3 09/13] mm: Begin creating device private migration entries
Date: Fri, 23 Jan 2026 17:23:05 +1100
Message-Id: <20260123062309.23090-10-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123062309.23090-1-jniethe@nvidia.com>
References: <20260123062309.23090-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:a03:338::7) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 39f25c91-e68c-476f-d320-08de5a480c2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SH9CfAR6FJtJBsqN/p0iwChxvE5nPF5fcbX/G7B8JmDd1CuuP3A9kvedHkgi?=
 =?us-ascii?Q?Sm5uzYFZUMG8JKxmXAsvK02uZ1oaNPhOf3LcUKg7tsC+48PpUdttfJ1UYOCB?=
 =?us-ascii?Q?cXlevDI8DsVTNd6UOa4a3XW9Hj1BDeQUJXFApzTVv8VMKQdO0znxkf/PMrKc?=
 =?us-ascii?Q?Lvr0KqGimRw7AB8HQG42KnJClhieb7eI5tfDv6p9R2mCVvwUPIRR39+2DHZK?=
 =?us-ascii?Q?w2b2KNUzLqYDkeE5dHhTxRJWNQuCjdhH6WKSuoH+blqULzX1BitkEdfllWPf?=
 =?us-ascii?Q?iffGevZ6m9ophCTaeKjYeojnaHoZdh6kZzmJP4tuBUNCNJePgePXfbny8r+Q?=
 =?us-ascii?Q?Np43k3z7E8ak9M61u4/Kc3sK2/sTb1dlOUltG9z4BrYtOY6fBkbwRj1gq+iV?=
 =?us-ascii?Q?+1CPnwlC7Ytx002vhqDuSdrLq4BqK12jZkqjXPDo/HImnEcGSupS3AAV9kTi?=
 =?us-ascii?Q?bwcYc5cnPpVAKqeLPx1zlFjlvTxmvPeMQTufBXoV7aHE2WL/7sxqxw3sA5L4?=
 =?us-ascii?Q?/UZJYXfADSOyHedJWW3AH5AGRl21FLgpgKudIiQ/sgNzwDz+S9KVTjga16qK?=
 =?us-ascii?Q?ZG2QFHp7RtRtVnB1JyHY2AQwSLib2TPtz0GH2qSG/12CB/Y96NfL5i6+FYwj?=
 =?us-ascii?Q?jE0qJSSIOIEitHn0EEGPrqCeMtHjozrgJLO49PuQX9MCU5xePtTba/89/mhu?=
 =?us-ascii?Q?KABaDfQX7AUNdNZcAWmX0PShtE2JtMNr1wvZIxb/paGWkO/N5YAHmbNIb5F1?=
 =?us-ascii?Q?4E0gzOcSeZ80mpIcNeGcjkV+aex8O9KegNgtP+vQG4rQ8d8itFxiJBEXt3oC?=
 =?us-ascii?Q?M45FxYsQ5nnUtqtS8sdT/dEkPRmsDPJUT7hkyhv27c5TKWNfdlGmbL5Rr2zQ?=
 =?us-ascii?Q?rRfhmh7zmkCykYCUO9ZPZ6VJ6WpZJqQB4p86fcYnp1/dHS8n301d/YDtkKUF?=
 =?us-ascii?Q?8KlxKsTyv5vSFyWktb0aR8Z8L6INQcZLdp6wDV43dvQojDx5zG8lcBGzK97q?=
 =?us-ascii?Q?QCiPPlwfwKPJ1j/zSJJ6y0DmpF/TNQA/zAKGtu8BFhvsH8BcDKYdzUra9/G2?=
 =?us-ascii?Q?F7AJZfZ3+ZTHnrBRHtEVMBS307bJqpVKhbjmpXqk2dDZQpbe8k3AxHVbx+1F?=
 =?us-ascii?Q?QM0VMgXtGSvmr8xq/9mUaJp4UT74QTEnVQyJxbgMJYlF60DqFeFTVsfcn0Hw?=
 =?us-ascii?Q?inKMrExIKX3/hG1XE4+kDkr6RYSy8XQbcW1cBKAPLzz80SrKJLu/hUnA70XW?=
 =?us-ascii?Q?dYGYzcJpIln7qnnVRxFdTHqzQGA6YiJDTyDnu+JFOaoHuhb7JfeMgZ4999ek?=
 =?us-ascii?Q?jbLC77wX+iGifw3G4H1K/pRDe/vV0ajctDWqdeevdBmk2dEwmnmaU2GXU63X?=
 =?us-ascii?Q?JTmxy82uDI+Sij61eWI8jQiPV9HDhFQKwy7mkrc/D2vPet2aqq9ZnF+GqVcc?=
 =?us-ascii?Q?b4XuCf2h/H6MUvf/wTIiUFVDI+SGeqkVPefrpblci2mbQo1QTgEdEc7RgkAc?=
 =?us-ascii?Q?w1I3GPW96piLS0eYGvM1X5R2NisaOX++l7Q5DmjAaJ3pjOLrqT3+MHRIFX2p?=
 =?us-ascii?Q?ZtYCgaEW0vyQF3CMIbY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UDxsSYvR3+rWsQll0qtAhWHNxVvRvP8t7WvEuTWX+2tP1HzOPKeSmLZXM8fp?=
 =?us-ascii?Q?U3JiY9VhsmDg5opcoIaldP4xa6UsgLDV/hTSF1tHdcXX3l97EZXdzlvRkd5d?=
 =?us-ascii?Q?BMgP2H15TKOJhJi5s08lOUP6+wKJoE5VFyrDI6+QDU/sGVOeSi4Pkp+iSSqm?=
 =?us-ascii?Q?ys1pZohzdxO9Ni9SjQTY67w396Qfdnxqk2IIshzVXPmn5YIMxVdq4ctTIkJx?=
 =?us-ascii?Q?b0S4WxlfYjKb3X9H1fjt3206pmnBpdWWgrfeJgk6Tf6Ku5h/IX2CnRcwQ2EE?=
 =?us-ascii?Q?9Uw5nNXDzoVb4EWq7R8c9yxLjiyDI0WgCIn12ToHAZfST7EneUbt2maUhub9?=
 =?us-ascii?Q?NZKdV+Stqak4gMXDyLa2MMiUj2r/wYlywnrAwYwmoFeAIGGoBuFUnLlHgz9t?=
 =?us-ascii?Q?YZmgWHMn/TPdKN0+zNmEYwE+XAQBwxHGf0zs9IHO5zhLEkUQT6Z6jJBGMBov?=
 =?us-ascii?Q?0r4YJVRz5iZOeguvKcH3Vqqjb33KdoiriT4SlZByAioEWFLl3HvEXu9W5fZ/?=
 =?us-ascii?Q?cS6Pue/Evkk0zuZ3NJ+wA/kPi8kT9be+CmpxmgWWx1hIKpC/07/9oh1kFCKC?=
 =?us-ascii?Q?Yl6BIUQddjfoAf38zT+2rxrpGfBF4Xj1q4tvvejbppBMC7nIZ32OJNRHyHOA?=
 =?us-ascii?Q?io6TOgma4p1GhW4U1wGsGKtqVq6nr/uAseliWcuXelNrTMVxZsj4cHR497Dd?=
 =?us-ascii?Q?yyMc6q2pA3Y3w5BpTKYMnpJJWOR4aBnvzvTHk4TqX8cVDHQuq1uVyyTV5B7O?=
 =?us-ascii?Q?QUjEnAyRKa4ekznxqok6b+KnwSVs6x70tc1F7TDQJwomxCN0urg2vgrAfLi6?=
 =?us-ascii?Q?AKqoIa8C44LdKldzCruZ3DU74UCIQ2dQgf8nk/wiM+tADSE4n8OD4w+EKDyg?=
 =?us-ascii?Q?JxKaqC7/uywUdUFmi+IcRJq89gY1L+24OsQMM7zJ1SPo/zwvNxZzhlYNY+ed?=
 =?us-ascii?Q?rH1N1jIjUWTh0Z2yrYODsj5pByK4G8MryrERkWMTtmK7jScUj25HeiQMHIDU?=
 =?us-ascii?Q?D2xCjh/yLZUdBO7zyn7UJfX5EJ2KGExyh776PEUPHydAQfyNtW8lXtCJ9SNz?=
 =?us-ascii?Q?jZmT0vzv4W0LNHsFOXeawWPRXmfoYPw96Rmjw1k+QVBA28sKN/iMTotv0h10?=
 =?us-ascii?Q?J3wTkXJwN46mS30BO+g8w+XEKXFNBHRtnvVoMYvpmfwBje2YTdY5CwKymqPE?=
 =?us-ascii?Q?TLds/mZFeZwWPo5lNni3rrdeCE4ghnYCQRqLf+gJomifyPnU/ytdAseQ7Gjy?=
 =?us-ascii?Q?Zo/4w4Sil8ItS3skllv2ecsgqycMPOczhQJIRaDzrlQMadH5HI54pP9z0ITI?=
 =?us-ascii?Q?ZVA5DODWwQXoeAxVrDQyzMNHMB3dKSb2zBYQyCRisdVVGH6qZAG3CwRXLjjv?=
 =?us-ascii?Q?8tR1cb3QtMzl7G9lqTqYqGniaDdN0kMbqQZvOj7SZHNNTXyLw0LheLFdLtHH?=
 =?us-ascii?Q?vDBb5/Hafqs4i9Qp7PwRWJmWMM8WtAkiFnevYOwhrP/TEHWJxcTmd0P98JvL?=
 =?us-ascii?Q?BWuac9xBVRODcjEF9X9CkQWTHGituU8dPOqpi3VCZJcFOF+KiGEYihSp5tj3?=
 =?us-ascii?Q?syosOfvzucumElK6FyaMsOttLdR/MUfbzx5xRjdXXuwC3o3/06fBO7TucXcU?=
 =?us-ascii?Q?bI9PcqP7bCM7jegkM8h7g2zBc45Pp9U7/n5cHLBaYdhVOlWZW1YREe2IIiTA?=
 =?us-ascii?Q?d4+7vw+UfXe1uRiXxpodkrqTks99N4I9HSt2ULaTM0xYryxcP8mpFIOdeo4Y?=
 =?us-ascii?Q?tbwFSjivJw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f25c91-e68c-476f-d320-08de5a480c2a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:24:22.2519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNEiXOdYbiSJnz0SoMv5FhVodGtjVBJ4aJMoXZOL2h4haGw4nrf8gsSyw/vvQNNdUPcAdmXRf7PIEBPw7p0Dcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8020
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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
	TAGGED_FROM(0.00)[bounces-16199-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_SPAM(0.00)[0.210];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 4597870EDB
X-Rspamd-Action: no action

Update the migration entry creation helpers to automatically create
device private migration entries when invoked on device private pages.

The corresponding softleaf predicates have already been updated to
expect both migration and device private migration entries.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v3:
  - Provided as an individual patch
---
 include/linux/swapops.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index a70a6809e9c6..2591ed914d22 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -205,6 +205,10 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 
 static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page, pgoff_t flags)
 {
+	if (is_device_private_page(page))
+		return make_readable_migration_device_private_entry(
+				page_to_pfn(page) | flags);
+
 	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page) | flags);
 }
 
@@ -216,6 +220,10 @@ static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset
 static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page,
 									    pgoff_t flags)
 {
+	if (is_device_private_page(page))
+		return make_readable_exclusive_migration_device_private_entry(
+				page_to_pfn(page) | flags);
+
 	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page) | flags);
 }
 
@@ -227,6 +235,10 @@ static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page,
 								  pgoff_t flags)
 {
+	if (is_device_private_page(page))
+		return make_writable_migration_device_private_entry(
+				page_to_pfn(page) | flags);
+
 	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page) | flags);
 }
 
-- 
2.34.1


