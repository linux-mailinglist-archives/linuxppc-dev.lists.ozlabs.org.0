Return-Path: <linuxppc-dev+bounces-9647-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A39FCAE46DC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jun 2025 16:35:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQrG22lTjz2xPc;
	Tue, 24 Jun 2025 00:35:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::607" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750689306;
	cv=pass; b=OhT2+3XEBkmLwScHLF3KOoUlJkrnNqeh56s9yw04esqgs4f4nSWYY58m+N/w2uGoGC8X05L4vjkcDvVLoPENNKp2nqk39JAmRmrzVsU77skYUt9l3h1NHpBKtuRzY0zeI25ojR7riqXNtbwnPCOnMSv1tw32cKR/o1Ml+lIxpJ88q0n+D+LAfAtSk1idSUlrJMtknZgqMGU3KLmYxLkC0XaRyLFZwWxN8S8hZKpdUthBuW0zntHl3ns3OmxKQjxhsXbxDKS2uswRm2saLgusOtqElxs3gHfqaanMf9wtZyeFSDJID7V8XeJeRzzKk0jBZml7sf054wegJG0hLjX8Dw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750689306; c=relaxed/relaxed;
	bh=8weA93N2cRbwllbDNs+9Sc92HYmUvqg+NHfJqInB1bQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZkHNYgJz98LFihAhg4vgoSuMMddHiAvBawghN1LG+aLKgbIyf3a5a8/wTaQtcrHA+rkLjWgE/0KnxyPh2ZJK8ARjnPcpoWgY6pKAb/szPfh0z0b3wEN+6MK4oKWh3am0LRWoxv1/Qd2vXBH7fiePx+x/PapQKGmfVWRcoVmqfzrfVpI+riSBfi+Yg9z+Rj/KpfIm3/bhiW5p2NPHZQDG5tbsAGn2FR0iuS8xxhMG1ipd15400tlS4zYdfx84TozzK5mvQZiaQ2VwuSmUG+2pdizxfSdpd5HSTT9H62/obch7JmzbhRef/qLJjnNZ3gfuDX80upPJVYS29Fpf/I+H9w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oPbBnqVJ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::607; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oPbBnqVJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::607; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20607.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::607])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQrG133qTz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 00:34:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9LebYTc9fQivO4UmkhLPS8wFJOgDwqQ0k/u9DoeDHQ6UaVC+NPYiEfoqSuYlWLPmnRUalt9mOPkX/2OxtBo3soE+1kaqeFSaisNO8OfHsnNgUKeuFuxViwyg6IWhBu9mXVsfgpsBrGpRIqMHob7E+4eb7aqVsW7Gyn5UH7ipau8kHejnmcehfQlzanHE6KqAt6lXnOGQRpND44Yn4y3BrHeVsvhhTM9pkai1dz3cR+Pn4nU/tl3kOCWUefls2GKaUn5gJ+SExlsjQhvcpk5FbeR+V2s7SWKnJ+hUzCQHrjaiv1IRktFKnnILPlEu2uzUtSZw6LA7es/jA6IolfeQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8weA93N2cRbwllbDNs+9Sc92HYmUvqg+NHfJqInB1bQ=;
 b=Vxd7H8X4lYnDjXRGHdbZjqb0MEmH001XasYq9yA1mrwkARvtDS3Seq1Eg1Tm1TyrblauSL9UtgcCTFFRY6G7/qmKnbr8jPWTpbGD0TOP5objl2kDvrNfBec6BkCxfCGT7HhdjB8rO1qptrNmCxlGkPe7FN+BVLlkM5dW4ZEqIWulWgFjxs4k6HqnPqubgq81nI0Tm5F2FviqPws0IbU7nCH4w+fCWGmDyuiMbSiXvI4JSeSB2ZuMpQTsKrV9DnO8wEPyS0BJHB8Z+VRDZ4z5EbU9YzGFPSqDlMxE1KkSp1G0BZGqY86dHXoMr7z9nqiQwYXm5w5YlTwBqeu0PRtWmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8weA93N2cRbwllbDNs+9Sc92HYmUvqg+NHfJqInB1bQ=;
 b=oPbBnqVJK6tFUW1RWd1WSr7bL9csYn6N7s5Kz4HEEAEgjHbwi/wrJF7OebRIbSEwBqZwjwWzOKmsJsws9VJcs7+l+lFI+7g1HZhTbQf8x1qMQsPrOxfv9j1TOcwUVseg4rLh/tPNsiv+00pEY1k4hSmrzCpZxKOTz83gQJ7gfhU0YyP5PDMuseTZcHA5P+Yb7CmuGd0EJtaSt6VOzX7aLBpxqx+wf7IEflgTvriipU+R3C0LE+kFiaY7gNzgQ0buguXzV1mak/Ggr66zDs0m8mvCH1C2wvlO977Kyuu7olLawZpEJoIEIGkTqdpqscswkAmLPwGo9u5RevyAbAEdIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA0PR12MB7750.namprd12.prod.outlook.com (2603:10b6:208:431::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 23 Jun
 2025 14:34:35 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Mon, 23 Jun 2025
 14:34:35 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S . Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <kees@kernel.org>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Hugh Dickins <hughd@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Matthew Wilcox <willy@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, sparclinux@vger.kernel.org, linux-sgx@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, nvdimm@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] mm: update architecture and driver code to use
 vm_flags_t
Date: Mon, 23 Jun 2025 10:34:30 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <714676CC-8DA4-401D-A4CD-72045BB55337@nvidia.com>
In-Reply-To: <b6eb1894abc5555ece80bb08af5c022ef780c8bc.1750274467.git.lorenzo.stoakes@oracle.com>
References: <cover.1750274467.git.lorenzo.stoakes@oracle.com>
 <b6eb1894abc5555ece80bb08af5c022ef780c8bc.1750274467.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BLAP220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::9) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA0PR12MB7750:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bdf757c-f025-4487-27ad-08ddb2631335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bWOfSER8OHxnJz7hdhYI+UnpqCONALxeFtdATWjyybyTuic6GOmHpvkaCucs?=
 =?us-ascii?Q?mzutQ6UFRHvdj96oyT+lG+idq6TkUG50pEbHwGc8npr1J8Y48rMy05YK3Md5?=
 =?us-ascii?Q?/WRV+5A0PamN06ath3QrdtrnStxdgrqYPFUTyeVGvmY4A7k7ZsZWn7MvhsOl?=
 =?us-ascii?Q?Sr1I8XAx+gF8OV2pVCLGj1OxE8HYkwv3XOg3YEpTBe5OCvDvKsEckcU5H20f?=
 =?us-ascii?Q?AoUYatBvfMjLiqcD8h0GOadDTGfBgUQjdbGfk8N5xQCJJChs5A8HpShQ7qVd?=
 =?us-ascii?Q?Jm1NjkWDNT4Mmrio/7Y6lbFqa6eIsEG54NqM5wMQ+xOmlGtwCGuiM3GKJQBb?=
 =?us-ascii?Q?uKiogYJmny0exj17r3dA9ujBsTnrWLlZAUrsZbCW8IclPM2PqYiMScTDtq6P?=
 =?us-ascii?Q?HvbwDwFvCRLlRYtrxoDomIjfQhStxj1shZ4LgM16mi4sxrUVsukFA7JjlBZU?=
 =?us-ascii?Q?b53oF4HkQbuLLi2MTKP659BiYgPn39CfXRMUQN93NPC02uXuFz0OZ3MVIGxS?=
 =?us-ascii?Q?LLBOE3JOjvmrOUY020p0IRSTFgGXn9pYzueNhz8MN9d+v8StuKtDmBX+qE2l?=
 =?us-ascii?Q?SHhAxXldCugjU32j/iAVPLozZ2KE1OCHpNdHVTVt/NTAP3xa2GluUeYYX2EW?=
 =?us-ascii?Q?qGo9ZH7VMEZtCu17AvcPhsLpo2k9YBkZD++lpwJOsLT5nBD5GRRhTqLBGrJK?=
 =?us-ascii?Q?m7RUkFh9ahCPy6jkF3pew1/PZN3lwGkyyKMUpXytcCMPDPr1cTB75iDG8D8S?=
 =?us-ascii?Q?T4bBNBR+AGoPIyFMLGxVNsLAdPSvCQ5icKqlgupHZzN/AZ0hXlvaherbNQNt?=
 =?us-ascii?Q?Thq6FEzLabmbOJT2iD1By3FLRVO4enmjl1jwCfMBtmoB3jKw+PLvAtlAZUbG?=
 =?us-ascii?Q?gEYWdu3u7RuzhNL3aezGEeIUHDVDzgXf7lG9qmUd1hvXy0ZrDP2XQUO98w+A?=
 =?us-ascii?Q?fOWYR3IigPNmTlEhb7yLB5J1P57TN4ksY+H/Do6fyKLCN5nt1W+4svxxO0GM?=
 =?us-ascii?Q?54SEz+ete7DJysYjCrPxcaRdu3EFEpQgKctoSN4MtEgycSD48LC2aHALmeEM?=
 =?us-ascii?Q?Iq5hLGGK+14ZIPL0sH2fCCWMvvixZxc6ji0fYNX1pPq+60GGR6yT65S1U2Jn?=
 =?us-ascii?Q?lRoFP2WEWWTGRd6fayLL0+O109VgXpnZVfjNDKM2Wn1YqgBSc4AY8bB8nqFX?=
 =?us-ascii?Q?f2xmh41If2fsMZq2DYBBTrO1yCdONC+JYFSatCvGoF0E1+tdWK9DIYGCdZIP?=
 =?us-ascii?Q?oPXz8546pOhFKaJSKUw6SofVT3NIvU3VW3V+nzwyHcwWrjRQPLJJiv9qiHvW?=
 =?us-ascii?Q?x72bXdmhgM90dTInP3hkxNsmcQgVVUiDtjCwMjCqD9lDoOjUQb1s7dY+N35H?=
 =?us-ascii?Q?fkVAT3sCyzCRdlQtMQZ7vR6M9TZXyqnearLOhaDnfuAVYotXIA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DzWNMbdn14cGAcKRUt/rLvraaT3ZEIzi0np86ZB7zg1xq384XydJQKAjBEGc?=
 =?us-ascii?Q?jTOoenL6u0ydEMrkl7+QmD4802R2MBv+sx3v80R6075Go3kkQEx+ywTJrs/c?=
 =?us-ascii?Q?qjgEzqvGbeZtWFU0v2/Gjwgrt1BBQxs5TjIBKZMlAbxjnrVI0bgqYF8BBpoz?=
 =?us-ascii?Q?A17gv/ooQd1SeUYWRT+X0Fpm22BiNZeRlwCSFLa5fegrp7OGdi5Szwpfi5jN?=
 =?us-ascii?Q?mg/Jb1ilX5q9efnPj6X48odyVRkl0Q6e01jRFdhB13n7iLP6Gwloz7cNhmmO?=
 =?us-ascii?Q?Il397nPSWNjZ9D7UJhvMFZdnqLfwfg6WsPte1D0FLdsFcVOjlIrjoXXyaAHX?=
 =?us-ascii?Q?9YwSLgMnS1GF8sFshdM1rBb4Jzy/Nw0w8AXo5sGELtxEKfTnY0dWjd+o0qId?=
 =?us-ascii?Q?GBlsjyucgD8ereBx1K1UakMGWBtA3a+EEOO8BOpAT56fKf6QMpYih/F6lote?=
 =?us-ascii?Q?PPrt1OMl+lW3iuq7y5CpufcAM2G5ZDsyxsZOboD0pX+l67w8jc12blLMT2xj?=
 =?us-ascii?Q?KyUpKoopvX/DjXoBl37M4fUT5qpHIfXuMMF8UMgoZ/Tokp47o166gsNSZ9IK?=
 =?us-ascii?Q?OKKPzj5qt/294IiqROxn68eCrvAJlmu563vHOQLPxjIWrCy6NPnSEXhuRZKe?=
 =?us-ascii?Q?GogghK4GYZZEaLdiGqCgtG9PGG8P2qnB8PyNdEjHTmo+rL0yAH1UY3Pr2VGo?=
 =?us-ascii?Q?cY0BRE2QDHrAiBP+ZTT0TVI+CWgWRl9QK3gygYbJvkqjku7V3aui0G/iH2q9?=
 =?us-ascii?Q?4fFZIVRfiin7rJ/sWhmrCfQUoG4IghODVQjftWfL1JwedtA3lvTUiNpDFpa+?=
 =?us-ascii?Q?204IJsK51RgK0j7ciuI7phjbACNQzQoIVBEF1d2mkRIqDxlAzIc3fNKMRGwS?=
 =?us-ascii?Q?g9vFgz35TXIqQMCOliggJsDCX2pjSAgvVo7+HpqbaxjiwZaDwtkS7MlDMqc9?=
 =?us-ascii?Q?/IV+W2fPQ25AHI1QAj2iqJi57kdQtaz+rguhFgfiBM0Sdd02UxsKR/q2ATm4?=
 =?us-ascii?Q?SF90SsVJz97N5n2iET4DzBSVCPLC4+eE6bpvu2gPkVc7bFJMhfuBZ45u7sg6?=
 =?us-ascii?Q?YJ3m09O+gYKwcm0TGxWr6u33dKX82dBsoY2AKDLz+XJd1Hm3lx28rd3ppwHs?=
 =?us-ascii?Q?ZU511kSab2ssT8XfxLxWMiJ2BSl8wxjTDjopqKwsUuK8c3ci5LQwTdN1AIDz?=
 =?us-ascii?Q?RxZdH0/5IzzMvGMOEjZOsFVPlwC7oiqQO9hT6xpAsz/xei9sFWBiDEbNRqZN?=
 =?us-ascii?Q?l0OPKsMHIdBtXvAZ6DDvT0O456Calu3akilQZ+etVS+9sJb4rCL2VtWPbuqn?=
 =?us-ascii?Q?0oSUkIFbO7FSXMjZn0/dFjJ8uVjrFcw38YiouOvB/sYec9pTSAUJewxh0ZXV?=
 =?us-ascii?Q?8ERwxeUVbkC+e93yXaJAUB+sK1G5wZY6e13HWQLpZz0M0zSLyML8+HaMA8et?=
 =?us-ascii?Q?awKAwrAeD1rlQ1kTvFSv7DZMmNlvM+2stm2NoK/oWh5LA63pXV6MXDuTYaw3?=
 =?us-ascii?Q?UBxAlB3GRBX0Gfjodax0M5d6eDxs7iqd96eYef1Yh/Zk9USbf77yEYuxr9F0?=
 =?us-ascii?Q?pwGfX8j+5d+aA9ADkg3CJUgH/dJ2LaQ2nvTHrPsE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bdf757c-f025-4487-27ad-08ddb2631335
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:34:35.3545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hk6uwfE5QrfaH4Lsj+VfGsGcvRYl/t+EmnGowE6oPVf9jymL32iP5L1TBB3QzAX/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7750
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 18 Jun 2025, at 15:42, Lorenzo Stoakes wrote:

> In future we intend to change the vm_flags_t type, so it isn't correct for
> architecture and driver code to assume it is unsigned long. Correct this
> assumption across the board.
>
> Overall, this patch does not introduce any functional change.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  arch/arm/mm/fault.c                |  2 +-
>  arch/arm64/include/asm/mman.h      | 10 +++++-----
>  arch/arm64/mm/fault.c              |  2 +-
>  arch/arm64/mm/mmu.c                |  2 +-
>  arch/powerpc/include/asm/mman.h    |  2 +-
>  arch/powerpc/include/asm/pkeys.h   |  4 ++--
>  arch/powerpc/kvm/book3s_hv_uvmem.c |  2 +-
>  arch/sparc/include/asm/mman.h      |  4 ++--
>  arch/x86/kernel/cpu/sgx/encl.c     |  8 ++++----
>  arch/x86/kernel/cpu/sgx/encl.h     |  2 +-
>  tools/testing/vma/vma_internal.h   |  2 +-
>  11 files changed, 20 insertions(+), 20 deletions(-)
>
Acked-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi

