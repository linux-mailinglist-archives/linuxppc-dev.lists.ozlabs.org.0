Return-Path: <linuxppc-dev+bounces-16446-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN/dOfKRfGk4NwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16446-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 12:11:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2110B9E55
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 12:11:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2YH75LN8z30M6;
	Fri, 30 Jan 2026 22:11:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c100::f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769771491;
	cv=pass; b=S86kyVuCPY1iyo0icJSCHBXAuEWxKhd1nUGQbAh4kPQpWQTOBUeXFr86bJ0CqKW0oMBjRQA6UUSNU64DxMnw60qdjyJRYkZE+U37odxI2eqvk/lPss0dZ/XsgueaORGLA7ijr4kgQrNQYM5OnCXjSklNcSfh1QOQcDjDZPgeS+P5qMZQzRfftpQ3v2BdamTvpoKOQsmyQTb6GTJarOQYFN0nlCjTie8VvrINZEUhFvIxUNVsIN+0LJmJP7IGWxYi6U314Agc1/GbLOcBNt4wbF0okS1DnIdjlOZu5dKJxAEIJfXYWBKmJ/LGOqe2fwWG6V3O2iDDxAozfnB5dYtXzw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769771491; c=relaxed/relaxed;
	bh=IDBWE6/St7qj4ff/J/FUPD4WDbdSsilSRHHU81V58eY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mrm/69de6ufS716qzp+RlBiq5Zw+SuKOjeCrnNr7xsuunCIu0gtx1mId4JTeycZDPUkad9jqRqrKBB/i+JXa4XfsFrY6kohhe0iaptBimSkRWub3j3fo0QlfzPo5nBnkZMaNNhdOgvrFd4FNfH96C5ow79deeRcaDaGZ4HU6BT92coFmzrVctkMoMkEXOfzWSDhIIH2Yy2j6KEibTkq7isDqqpMKnpBdwJ4hpO1c9mQ/s0BiZUzh/NNXIvnrX4+i+YGLvzLWKSVikQcchayg13DDhzGPomHPwaOv7oC71UNzQddw99idDIOfBc0BJN4A1R45GmJD3HVTXV2bNkLdxA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GmSnN+Br; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GmSnN+Br;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazlp17011000f.outbound.protection.outlook.com [IPv6:2a01:111:f403:c100::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2YH660S5z2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 22:11:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EvVFCYYk7lYA4WsaSwSlVwWuJ1O4Ur5kOfmx6lLqJznD+laAz9H28mAc9UNHtysiPeoUlv6PexcazfSO/SRVhOxIpRLlC0ffftxS0DDMEOC3bJogf8BXQPadKMJCs4pSwN9rnpvPdgvixFj047xXZgROJwWcq8fquMB+uigMFraMTLy8hvBjfilj8TQPDBWcJliazn4FtsBYzvcrYdTVtVpQkl17CP8yi6AnsXI62FweEScGjNChyogSsla3JkQKtRqvHFIdNpShkjsmJP1xLNPvRvJZ29qdklAHkEQ/R+k43TBSZpKLdsIPmR/ja2OOgSNLYPeRoWqLyt4ZE+kzQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDBWE6/St7qj4ff/J/FUPD4WDbdSsilSRHHU81V58eY=;
 b=RiTIVJUZXHrHm4aByGSa8LMb9JkXND3FvDOB35SQM0DwXGzD2fSENVuEtODyvFoqWaMKZCHFumfZV+jOTDmFJ3GlCGVAQXCaAgR3pEeQfF9oxkNd8h+PII80n6ru0OZVxo6EoReOwE0nZBPWzjrTUj7IgaOQQ70kniOALoApwnsNCH0iB5teoLbnflFAsnfAjbJvQ/EoD3FWnE4yVLcoEbs+A9xJayejE/izYXPjSWEPfKfcFsRWQ1CNW/gCkpUGQkj86tkFdRG1MRpeqYt6sS37X8h1Uk2tGSDw7LKhk0euRRbx9BCNM89syH9vU3bZ7YlUaEjXoXvDZUBZkHEbdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDBWE6/St7qj4ff/J/FUPD4WDbdSsilSRHHU81V58eY=;
 b=GmSnN+BrXCK6rFrXHoZgJla55zaGY008G7NHa+/dbhVzeN9VfFBZGqRBqskpWjYbgYWptHziEtIOxrUkGWyWIXPQca6K951OcVzRVEnXnJcaHS58bzVtpa2glIWFiyT8Tvqs+IrN+5PnR4WhSmF2S6fPQKtgiJPyrOrgY7sIj747s7encSdEftNj1+Q0AB9eHhH+EBOlR/EBw8D11gjARgT4Rs1dGW5sJp4g0v+IQm/vdY8xlqWScUGsljYVUaEit9hjEA6T918kMFJi1LJ/Cz4K08NxugpRypt3bmzA4lvUn6oJiOgQGhEtJelSov61ytfDNOos5aQox+HE7p9tog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 SN7PR12MB7836.namprd12.prod.outlook.com (2603:10b6:806:34e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.11; Fri, 30 Jan 2026 11:11:06 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 11:11:06 +0000
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
	jhubbard@nvidia.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au
Subject: [PATCH v5 03/13] mm/migrate_device: Make migrate_device_{pfns,range}() take mpfns
Date: Fri, 30 Jan 2026 22:10:40 +1100
Message-Id: <20260130111050.53670-4-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130111050.53670-1-jniethe@nvidia.com>
References: <20260130111050.53670-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:a03:255::24) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|SN7PR12MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc287f2-89bb-46bb-f9ab-08de5ff04378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pKCQx66wG9qXvaJD8UIWFdDF9X4+ibRwzogiLe83sLeEj8thgH5kItH5VywH?=
 =?us-ascii?Q?sWuqTB378tVOJlIQeinqfkCXLwR0j6XqHerU0S76ark9veTn46NK4p/LHmGi?=
 =?us-ascii?Q?0pfeVhGWs0iQ073rlmcal9lqPJ9BPVWjMb/jRfNDq5RncnG6XeZRiWDtIhqD?=
 =?us-ascii?Q?e1JbmXgW8d9DgvW+slRkXCKZszfQD8ENZEZm0S6x4M8gH10YWEycGAsHpjD5?=
 =?us-ascii?Q?Eciud4K/fTkhGO0LjRkQ11YmQOburYkobIPVbnXpiX7e3H8XC7HcgtxayWxh?=
 =?us-ascii?Q?HBQpsvoB7NWCSH6ra17Bz4kIhH1owxPUyTzb8xcH0iScS3KI8kj5PDeVX+uT?=
 =?us-ascii?Q?lmfxJ9gyXAIc5Oh03NwAA7Hg+Q1Xy/JsN75wWupg4TAkXh8SlaM2ir0MJG31?=
 =?us-ascii?Q?dfgrNLkXFP9FVOELvzb8ljyPQ8+98ydZvG+riH0ZN+rwX0dZ7hauJcKKBl06?=
 =?us-ascii?Q?AIG+lcWbMFiY/05IRZdDMA5I1bRTKcP9TqH7In/Yofopk+dfwrCFIYsINLJX?=
 =?us-ascii?Q?KehARBsOErrhivO49ddrxD29lOexdxq6qGfCTwHNGMzf4kQylF89MSOpDRXP?=
 =?us-ascii?Q?NJ1SoIqdSh4VqNdTOSRMz16rlZf8nd3D9Goj+Z9rMG7jjLOgWUwdhRunNAfS?=
 =?us-ascii?Q?6PtIF+GK+0chyfPH26eLAElvLX+usKujC8MM6gYCEhLr7mo86PzXugeBfAFt?=
 =?us-ascii?Q?K3zJRlq64EyxW/DYjNsg4L6+2ZpeaSkXNGSdZGfyExuSvOOJL6vgDRiEO0vG?=
 =?us-ascii?Q?sS2hMbXmgYSYIsBayXf3eSt43XtyGsbNpsoymX3StxwCHKMIt81Q0/3sO1O+?=
 =?us-ascii?Q?4nS1o7xRwqOdL0l9kuKamxxOffIKp+EfhOmemVvz/BqBimrjp6s9RQuZH9s2?=
 =?us-ascii?Q?OB6HdD8I3UOKpj/GdmURq6MvW245qbfFviyIDoUJXfwM+dbYmTPPe8njUvEL?=
 =?us-ascii?Q?uFdxXgfB252CsdEba6svDQD+meoTYtj65f8mMNYXtDR5+zREi53AqTJe93RK?=
 =?us-ascii?Q?IWe0VVEBKBGbQ2jR9eOPmC8g3Gz+Vw7ei0ik9UJckqABvOqg4qoyhXbXl7eN?=
 =?us-ascii?Q?6GB8oTK9a7Fpl2gj2JtSv4FKUS8h1MtkOxjR1JjYlil4bJCwfJ0qOgZIvLlB?=
 =?us-ascii?Q?IGH9dfrZ5yRCQoZyrukU6QfEhlk1bKA/rIkc4pcnqV+Ov68AqH8vv0uQSrZU?=
 =?us-ascii?Q?r0Uo4pG9fDRMNqK1aP9u80J7AhqWWAy43q2833D6SWRatu+Z3m5194kb1Z81?=
 =?us-ascii?Q?gE1ovNUkSs1QbboOtADAQ3MqkWo2MmDDJ1Dkhg0+26WzfjwuD8XC2IxdlYqq?=
 =?us-ascii?Q?lzP/7TWK81m7/GSLo/R4oBSkcgUbcBcYaCb1GRRpdW5w1rikGqi18TGcejoh?=
 =?us-ascii?Q?LziNbpg2U87/o9HPGaq/bNyX3sulC0Q8qgZ9J+rTHOH3KdsPX56KipEaYvFl?=
 =?us-ascii?Q?K4PWeuLaI8ikZbvDv4XsAqQRoubvwk/4XvDSTwenW3CP/+uh+JeoTQkBAj3I?=
 =?us-ascii?Q?/8eLiZrTksrbmOVw3igSeApYUWZVeolNULboop0+zTGas1dFrz9AVssxp2TD?=
 =?us-ascii?Q?SXg2FBDyKz+DnPXLm4U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vf3RjMr/IOKMXwOHJQSWwK1SJb/ffjqAduLsLxAu+bbJu/07v9ZNZ+LAYodT?=
 =?us-ascii?Q?NUpnrULtBvWrfBGbAhryN9sh/H2Pk2QJ/F3YiE4/M/DXfEOAq0a2xrdWlzEs?=
 =?us-ascii?Q?50RVyV2Mz9Uzr4lNmmr4A94p2YzbI9TW1HoCFQy8n5H7hIOhQiMhdf8rYQHD?=
 =?us-ascii?Q?QXolw+nKyG4h7RkyWq2KPciYXGkD3wm+41yZo03vNLoSIa/5r1fBxvFp16XA?=
 =?us-ascii?Q?KC6SWr7n7fARbZpn5WztbL2yRTKTF3tWAG3N/kAnj0jQjbrIcGgOmBtM2jSK?=
 =?us-ascii?Q?4v7AZavONEzHuPJGL9USYFgZi5tvF47WP/4p50PFwuEOWCTHPYqwXMN0kvmt?=
 =?us-ascii?Q?lFSfAOdI1IUXv2INznYG53LPxdBmpx5Bg4iiMMP5IH1Ld0n2sVGtglxpWdfP?=
 =?us-ascii?Q?d0S+t1q6aHvTMY98REyhpMiAzQHOjiLohDBK5kIgZ39fKijiJHG7+hoBWzu/?=
 =?us-ascii?Q?gXGPlf89c2PODF6dTljuL8sRpdq/aWzRT+jiVX98P8br3wYfcJKsWsvCYmg2?=
 =?us-ascii?Q?TtSoYC/Z9fbz2rfg1d1U2W+/58jdC/3TSuqpvLAx7vnPkuNSx34+VxMnobOB?=
 =?us-ascii?Q?Fa8Hfr9zdMbDp2MwvAq87/wixTmJkHLZt1X154HfJoR3whlH96cKp0DWZM4y?=
 =?us-ascii?Q?n7D59M+dT9BEgIdFlI73d08TFbAenywrD9yBuMlJgWKaVS1nxQQHYjIFuaS1?=
 =?us-ascii?Q?A+1Gao+k6meAqQNa0UrZFj+1DFYhm7OWCcMsYLodE93nNL+waA+0PmS9tesO?=
 =?us-ascii?Q?RTcL+4RjCqIAnsxMZziMgYhBIilNk1eg3msVEKoosqKxIYoDlXFjdtac0QNs?=
 =?us-ascii?Q?DuRYNaCRQOz9gn4a+dLbQInXM2yeLWQ5nO8JDZg6oPs89URtJJhMqjnl+sm2?=
 =?us-ascii?Q?Hc6OZUyiDwOjbgg7wGmFvOGS73pAGBLrq93vtbwLZDeWEZW5Alc1wzczxoUm?=
 =?us-ascii?Q?++zcMsToF/yAixrpGYY9yM0Url2w68QFaCSSMyI0jXCWYPwPY6iz+NfED10u?=
 =?us-ascii?Q?l0Wy0M7lgcoTXyFfJoy4p4OqTGJOYFnzpxJvbd/pouK68hL271Ce6sZWSFlo?=
 =?us-ascii?Q?adsUb6StvgWsNDHpULhMGYiOQpsVgDT2D/WV23QlM2oHy6e/89S5e9kfI6s4?=
 =?us-ascii?Q?WifeDpuLPDYg7KJ/wzqX5+JI9xmcsD60Z+8uOW7dndrUiRiV1wsSWr0x9Vxq?=
 =?us-ascii?Q?PJnlJC5vNCxZ7ZlADqArvza3ujtZ1r+3LQxdnFt7UptC5ZlucLHww4dP90a/?=
 =?us-ascii?Q?VE1TGfwtFxAQrGLNhErvdG4bLkA/MEeKNTcR9sY/j1+QqkhMis9g9rheRdP7?=
 =?us-ascii?Q?XLOQNBeP2DsnrPJwdpnaSl/eYliMOH1br9SaOWPNWgklXmE3BO0TuZ91EnW4?=
 =?us-ascii?Q?jOMYLq6nMwDPG00wa5faItvzooVfWDcJScu80QJu83dutFgtTZvEgdkjmoaX?=
 =?us-ascii?Q?nawSVKHovTaiJ+XHle7QsC40DVstVGo2Qyu0x+fwg6oc0XnF1rj4WpPUggOb?=
 =?us-ascii?Q?JNisn5/LybBabnc8vHjHBh7gMRgJkprsHOuYraph9IsReHEqR9CcocV7oyg5?=
 =?us-ascii?Q?3j0Dn5iWXRYeAL5GYotDig/PFSB7Fb/y1olWhd/9OV+Vy0m4xzs6c8mhbyc/?=
 =?us-ascii?Q?fpX9x7/piZKKmpIII9KWljmqHg/3/EsDZBO/UkLmSiEBapUwG6kXo3OQllR9?=
 =?us-ascii?Q?BJk+vGKezTj1x/M95+hu6+ZXPB6ED1VaXfCpT4kQAsQyw7ZwsPZZyE4cn6X2?=
 =?us-ascii?Q?nSezoOorJA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc287f2-89bb-46bb-f9ab-08de5ff04378
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 11:11:06.3184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWJZrfKzNUL00c6YZ8JHDmynT41LPPDFGlEJyAIVDstZddYwmfWWSSQx9A1ZhrUfa+tgJkGFke194c2BBrkpGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7836
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16446-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: F2110B9E55
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn.

This causes an issue for migrate_device_{pfns,range}() which take pfn
parameters. Depending on if the device is MEMORY_DEVICE_PRIVATE or
MEMORY_DEVICE_COHERENT will effect how that parameter should be
interpreted.

A MIGRATE_PFN flag will be introduced that distinguishes between mpfns
that contain a pfn vs an offset into device private memory, we will take
advantage of that here.

Update migrate_device_{pfns,range}() to take a mpfn instead of pfn.

Update the users of migrate_device_{pfns,range}() to pass in an mpfn.

To support this change, update
dpagemap_devmem_ops::populate_devmem_pfn() to instead return mpfns and
rename accordingly.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v2: New to series
v3: No change
---
 drivers/gpu/drm/drm_pagemap.c          |  9 +++---
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  5 +--
 drivers/gpu/drm/xe/xe_svm.c            |  9 +++---
 include/drm/drm_pagemap.h              |  8 ++---
 lib/test_hmm.c                         |  2 +-
 mm/migrate_device.c                    | 45 ++++++++++++++------------
 6 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 526105aa4b05..13072c8665b9 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -505,7 +505,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 
 	mmap_assert_locked(mm);
 
-	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
+	if (!ops->populate_devmem_mpfn || !ops->copy_to_devmem ||
 	    !ops->copy_to_ram)
 		return -EOPNOTSUPP;
 
@@ -590,14 +590,14 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		goto err_aborted_migration;
 	}
 
-	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
+	err = ops->populate_devmem_mpfn(devmem_allocation, npages, migrate.dst);
 	if (err)
 		goto err_aborted_migration;
 
 	own_pages = 0;
 
 	for (i = 0; i < npages; ++i) {
-		struct page *page = pfn_to_page(migrate.dst[i]);
+		struct page *page = migrate_pfn_to_page(migrate.dst[i]);
 		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
 		cur.start = i;
 
@@ -624,7 +624,6 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 			cur.device = dpagemap->drm->dev;
 			pages[i] = page;
 		}
-		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
 		drm_pagemap_get_devmem_page(page, zdd);
 
 		/* If we switched the migrating drm_pagemap, migrate previous pages now */
@@ -979,7 +978,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	pagemap_addr = buf + (2 * sizeof(*src) * npages);
 	pages = buf + (2 * sizeof(*src) + sizeof(*pagemap_addr)) * npages;
 
-	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
+	err = ops->populate_devmem_mpfn(devmem_allocation, npages, src);
 	if (err)
 		goto err_free;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index a7edcdca9701..bd3f7102c3f9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -483,8 +483,9 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dma_info = kvcalloc(npages, sizeof(*dma_info), GFP_KERNEL | __GFP_NOFAIL);
 
-	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
-			npages);
+	migrate_device_range(src_pfns,
+			     migrate_pfn(chunk->pagemap.range.start >> PAGE_SHIFT),
+			     npages);
 
 	for (i = 0; i < npages; i++) {
 		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 213f0334518a..fbf5fd284616 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -10,6 +10,7 @@
 #include <drm/drm_pagemap.h>
 #include <drm/drm_pagemap_util.h>
 
+#include <linux/migrate.h>
 #include "xe_bo.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt_stats.h"
@@ -752,8 +753,8 @@ static struct drm_buddy *vram_to_buddy(struct xe_vram_region *vram)
 	return &vram->ttm.mm;
 }
 
-static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocation,
-				      unsigned long npages, unsigned long *pfn)
+static int xe_svm_populate_devmem_mpfn(struct drm_pagemap_devmem *devmem_allocation,
+				       unsigned long npages, unsigned long *pfn)
 {
 	struct xe_bo *bo = to_xe_bo(devmem_allocation);
 	struct ttm_resource *res = bo->ttm.resource;
@@ -769,7 +770,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 		int i;
 
 		for (i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
-			pfn[j++] = block_pfn + i;
+			pfn[j++] = migrate_pfn(block_pfn + i);
 	}
 
 	return 0;
@@ -777,7 +778,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 
 static const struct drm_pagemap_devmem_ops dpagemap_devmem_ops = {
 	.devmem_release = xe_svm_devmem_release,
-	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
+	.populate_devmem_mpfn = xe_svm_populate_devmem_mpfn,
 	.copy_to_devmem = xe_svm_copy_to_devmem,
 	.copy_to_ram = xe_svm_copy_to_ram,
 };
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 2baf0861f78f..bffc7fd5bef3 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -192,17 +192,17 @@ struct drm_pagemap_devmem_ops {
 	void (*devmem_release)(struct drm_pagemap_devmem *devmem_allocation);
 
 	/**
-	 * @populate_devmem_pfn: Populate device memory PFN (required for migration)
+	 * @populate_devmem_mpfn: Populate device memory PFN (required for migration)
 	 * @devmem_allocation: device memory allocation
 	 * @npages: Number of pages to populate
-	 * @pfn: Array of page frame numbers to populate
+	 * @mpfn: Array of migrate page frame numbers to populate
 	 *
 	 * Populate device memory page frame numbers (PFN).
 	 *
 	 * Return: 0 on success, a negative error code on failure.
 	 */
-	int (*populate_devmem_pfn)(struct drm_pagemap_devmem *devmem_allocation,
-				   unsigned long npages, unsigned long *pfn);
+	int (*populate_devmem_mpfn)(struct drm_pagemap_devmem *devmem_allocation,
+				    unsigned long npages, unsigned long *pfn);
 
 	/**
 	 * @copy_to_devmem: Copy to device memory (required for migration)
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 7e5248404d00..a6ff292596f3 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1389,7 +1389,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 
-	migrate_device_range(src_pfns, start_pfn, npages);
+	migrate_device_range(src_pfns, migrate_pfn(start_pfn), npages);
 	for (i = 0; i < npages; i++) {
 		struct page *dpage, *spage;
 
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 1a2067f830da..a2baaa2a81f9 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -1354,11 +1354,11 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 }
 EXPORT_SYMBOL(migrate_vma_finalize);
 
-static unsigned long migrate_device_pfn_lock(unsigned long pfn)
+static unsigned long migrate_device_pfn_lock(unsigned long mpfn)
 {
 	struct folio *folio;
 
-	folio = folio_get_nontail_page(pfn_to_page(pfn));
+	folio = folio_get_nontail_page(migrate_pfn_to_page(mpfn));
 	if (!folio)
 		return 0;
 
@@ -1367,13 +1367,14 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
 		return 0;
 	}
 
-	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
+	return mpfn | MIGRATE_PFN_MIGRATE;
 }
 
 /**
  * migrate_device_range() - migrate device private pfns to normal memory.
- * @src_pfns: array large enough to hold migrating source device private pfns.
- * @start: starting pfn in the range to migrate.
+ * @src_mpfns: array large enough to hold migrating source device private
+ * migrate pfns.
+ * @start: starting migrate pfn in the range to migrate.
  * @npages: number of pages to migrate.
  *
  * migrate_vma_setup() is similar in concept to migrate_vma_setup() except that
@@ -1389,28 +1390,29 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
  * allocate destination pages and start copying data from the device to CPU
  * memory before calling migrate_device_pages().
  */
-int migrate_device_range(unsigned long *src_pfns, unsigned long start,
+int migrate_device_range(unsigned long *src_mpfns, unsigned long start,
 			unsigned long npages)
 {
-	unsigned long i, j, pfn;
+	unsigned long i, j, mpfn;
 
-	for (pfn = start, i = 0; i < npages; pfn++, i++) {
-		struct page *page = pfn_to_page(pfn);
+	for (mpfn = start, i = 0; i < npages; i++) {
+		struct page *page = migrate_pfn_to_page(mpfn);
 		struct folio *folio = page_folio(page);
 		unsigned int nr = 1;
 
-		src_pfns[i] = migrate_device_pfn_lock(pfn);
+		src_mpfns[i] = migrate_device_pfn_lock(mpfn);
 		nr = folio_nr_pages(folio);
 		if (nr > 1) {
-			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			src_mpfns[i] |= MIGRATE_PFN_COMPOUND;
 			for (j = 1; j < nr; j++)
-				src_pfns[i+j] = 0;
+				src_mpfns[i+j] = 0;
 			i += j - 1;
-			pfn += j - 1;
+			mpfn += (j - 1) << MIGRATE_PFN_SHIFT;
 		}
+		mpfn += 1 << MIGRATE_PFN_SHIFT;
 	}
 
-	migrate_device_unmap(src_pfns, npages, NULL);
+	migrate_device_unmap(src_mpfns, npages, NULL);
 
 	return 0;
 }
@@ -1418,32 +1420,33 @@ EXPORT_SYMBOL(migrate_device_range);
 
 /**
  * migrate_device_pfns() - migrate device private pfns to normal memory.
- * @src_pfns: pre-popluated array of source device private pfns to migrate.
+ * @src_mpfns: pre-popluated array of source device private migrate pfns to
+ * migrate.
  * @npages: number of pages to migrate.
  *
  * Similar to migrate_device_range() but supports non-contiguous pre-popluated
  * array of device pages to migrate.
  */
-int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
+int migrate_device_pfns(unsigned long *src_mpfns, unsigned long npages)
 {
 	unsigned long i, j;
 
 	for (i = 0; i < npages; i++) {
-		struct page *page = pfn_to_page(src_pfns[i]);
+		struct page *page = migrate_pfn_to_page(src_mpfns[i]);
 		struct folio *folio = page_folio(page);
 		unsigned int nr = 1;
 
-		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i]);
+		src_mpfns[i] = migrate_device_pfn_lock(src_mpfns[i]);
 		nr = folio_nr_pages(folio);
 		if (nr > 1) {
-			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			src_mpfns[i] |= MIGRATE_PFN_COMPOUND;
 			for (j = 1; j < nr; j++)
-				src_pfns[i+j] = 0;
+				src_mpfns[i+j] = 0;
 			i += j - 1;
 		}
 	}
 
-	migrate_device_unmap(src_pfns, npages, NULL);
+	migrate_device_unmap(src_mpfns, npages, NULL);
 
 	return 0;
 }
-- 
2.34.1


