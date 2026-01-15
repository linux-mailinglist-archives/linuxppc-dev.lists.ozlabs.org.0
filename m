Return-Path: <linuxppc-dev+bounces-15767-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 886B7D22BFF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 08:13:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsDjj19lPz2yFm;
	Thu, 15 Jan 2026 18:13:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768461225;
	cv=pass; b=k7qZMYrsV1hDzNL6Ab5KD+YJ8Yta9g8Jo7tkpO3wl2qqII3E5U5/F2Yd7mu6Eh3fFsjc6CPmBuhfMjdovSDnHj7d5tiDchusnJfbBu8afte/kzt8kSulH/BDWyPRD+4QYlVmuEPfsXCRv5l7WOMavP6+7KthZv7RAjVG0+kPIMhCnyhfyC6gyu1NMWeNzmoNaPijmQm6pBFLf53nYN6DRboDmZuporGUHNg6TKmMvR+oDmyb3a4R3T0TP4RFX27zVMF8Ey0ohTuNd6n0hmn3MYFTNcyDoaKtvNYI3zXUDV+AIJgPpTgYcQLiA58BFmhmDmh6yn8UsqNb8nfjBvAyYw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768461225; c=relaxed/relaxed;
	bh=07DuJI6A/zziTK+2Pd6aWysmc3w5qjz3nmFIuYNUkaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P9Uiq96jZ6hSCWjdc2lqzch9gtuj5m18lLPv7QPRfusdMpuuIlDdwrd5GL3+QCfrJH0Q6QBFK0vRU+40b+1WyXHUvJuhoqZMyZ4//UKIu5Qd9xJjZS6dc9K1LhWP88kwjtYn+T+LXMugBU87v25Oa6OSs8SZbHzmDwZzL3TIRkUiO6p13dqj9lu0bWFyLgPORif8Sz7JnPDWE16u6ALCPtKW5ULBYxVLjDWv+m+9lIzmKzhs3hzuG5Yr83mM69gDAZJXvxADfg4a4+w5hl5u1uzgmLWU+sNZlD4S0maHN1ZGgUsX29OKIY1Axr5D72mg5R7Q2HI0OK15cRhmIgrYIw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=W5dcKCEv; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::9; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=W5dcKCEv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c107::9; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170100009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsDjh2fN2z2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 18:13:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MriPi8lXMJwRVeTQAfCqbt5Pt0KrypnrC6/7vIVULtQaoCZGh5P2wWLFgfspaXM9sZksisG65hASinj583X7b7we2w9dHL3unKMGpevtuYyOwfvjM0IGGUhyycXHAmdWK93sUHLVO09WdJ4Q93MWF7qUqbSynVYXWaOTTFgM8PygZ2cIGfxsWqBxg6KC1oViI+hcbYgAFas4oi1YcuYUE8RRnQrPpeBPQcfBI7j3XY3TtPTmdcZ4QioN+bTHWtXaurohLoyGp4oZcXJwQSf+L0eJrQuOg0UQ5DH9/qdksI2E+5co7dk9lzhsGK3P/rwVsyy3+55eoLGz6IcEAw7drA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07DuJI6A/zziTK+2Pd6aWysmc3w5qjz3nmFIuYNUkaY=;
 b=biiWFI+oAecnTqXSNswNBlBiDtl0k0my60jlL3vMZvfpS9XhIVCFdboxYoIMjJm72s5U5zJR0I8w0ne4zzJ7emS9Ie6s5hdkJquIQ0BgD4vXHM3EAU/xM4v5oTW6XP/g+tpcrD8wJ47Qo7ctrSrFSK2HIZggxb2I6x5JsySIdyCJC4SZLLRbGjxZBU9q1enk+QcOrx+TKPWha56vYfdjBwOepujxgYr7PGY2ilKQWXFo4b8UTGMHQ2/cXeM7RZLnhdnO3viNt6wrcU06BalxJMo3UpLQRzxdtC/7pWxbWDZAwKhh4e3DTKD9bDuC9uNaTofIW0K92pn3uEEX1Zm5gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07DuJI6A/zziTK+2Pd6aWysmc3w5qjz3nmFIuYNUkaY=;
 b=W5dcKCEvFJzJT/1hKm4GaXkEDU6mvM+UZA3JFMcIZtVk0DzfYfYUo9J3hSWnQ0eK2PRbq2kcoysYHMLQa0AqZchQmH5vbBdV+Uruf3PbSr0ppfKz0DOt9KlTp7rQwu/diCCxq2T6X80i6NWIeLcHPhe3D4RoAQ6+A4EBoTPrUDCRb8SDEiu1V6O4DDYZPaq6N/2i0vbX8AjrWQEIFRBhMvVWpoKpzdAAuyBCWesCG9s4PxFBEgJkoncDL9xNAE91lR1X1p7DjnriNRlBI40oVj9gSknnPfxV550fawyYJm9rVDRy8ndePh0II11Pn1LgOPPpDUkrkaD2RaU1LUdY7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH0PR12MB8127.namprd12.prod.outlook.com (2603:10b6:510:292::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.8; Thu, 15 Jan 2026 07:13:20 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 07:13:20 +0000
Date: Thu, 15 Jan 2026 18:13:15 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Balbir Singh <balbirs@nvidia.com>, 
	Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	Zi Yan <ziy@nvidia.com>, adhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <5in4ndnpn2lwohjyxhibwxf7hidmens6twi7x2jtgwrnhye3jb@yuvuwph44fpv>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
 <4cd42f41-660d-40a6-8365-e06fa4fca6a1@nvidia.com>
 <aWhT6i3lFxkqnbST@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWhT6i3lFxkqnbST@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SY5P282CA0083.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:201::9) To DS0PR12MB7726.namprd12.prod.outlook.com
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
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH0PR12MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 89c51342-9a89-45be-5e48-08de54058fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEJuUW1IdlVhbFNuU0p4ZHFUaFF0QStPTkc2NXF0SkYwTmFWWGJ2eGRELzRl?=
 =?utf-8?B?RGtLVHlkRzRjaEx4QXp2Q1NqS2hnQ3VBL2xjb0FteTIzbklBT2ZoRXZNSzBs?=
 =?utf-8?B?bmpFK294Tk1OT01QdEI4M2hPTjB6YzlXSldwa0FGZHlYSXViZmRmNDhJd2VG?=
 =?utf-8?B?SVNCRnl1di9lUGx4WjBkUSswWk1kRnZpdXNRWnpwQk9tU3ptaWNnamhYcWZU?=
 =?utf-8?B?ZFJETXBEcWRxTVBnWEdLTzJxb3Jmd0swZFVSUERSYmpuOTFqeE91M2hhTDdR?=
 =?utf-8?B?MXFVZVJKN0NaQ2M3Y0dhRDVTTGlVTUt5OGpPV3VKU29yZzBVSjFSNTR0YW1G?=
 =?utf-8?B?R21BYkIxVGpjdjY2WDV3SkxYSmYrQ3EwK09MVkNSSW9zZUd3SFJjVG1VL0Fh?=
 =?utf-8?B?blZRdDFGRlc5RjI0bnRITzg5b1NkWU9rU3Y4Rm9TbTJDVjd3aDdWT0ZzT2s0?=
 =?utf-8?B?aFdCelNDL3FHMWxIQzRJejJBK0g2S0hybmxrZ2xWcWQ3dXR3czEwekl6Q0Qy?=
 =?utf-8?B?OXJxckthRjJ4d1ZocGJkb0V5aU9wMWl4ZEc3WS91Ym5CS0g5UHJzOXZNMnky?=
 =?utf-8?B?R1lUL3QweXcyVjBGakRub1IySXRjMjVhRkZpWnY5WW5JQU9FR2J1ZnhGRFRp?=
 =?utf-8?B?Mmd0d0F5ZzE3dWxPQk9RUzlENkczRnFEejVoSjJFQXFtN0NSbGROM2RuWXlP?=
 =?utf-8?B?VCtENFlkb1NkeElxRDhmUFl6TWhjVXRwQmNhbDhVRGh0NVR1emRpUFJMYTVB?=
 =?utf-8?B?M2x5aFU2c1A3WTJWUmJBVFZiK0Z0ME5MZXBMVmRYU1ZnUXJWbjI4dGZiR2cw?=
 =?utf-8?B?dEpnc2NmK0xESW03S1FEZ09nSFFtMkcwU1V5dnl0MXZwcUk5Q0FFL0JDZ2JK?=
 =?utf-8?B?MWFXd3lrV05wUFZqbzBoNFBKVXlVQUNseC9YOS9PcExEMWVWTkErMEdLQlRS?=
 =?utf-8?B?bE5ldU82N1JYa3ByNTd5UUJaZnA3UnBHSkIzY09mWVltY1BWcjltZWdRNSt4?=
 =?utf-8?B?dHArZVVnQm03blZpZjBucllSelE0RFlmd0o1c0NtOWtMNzgwSmFOcUk4cUNa?=
 =?utf-8?B?dDVSREQ5UzFZV1BSZFFyVXA3STFTU2N1aU0wYlpUYTVKeFQ3NG8zYmlJU3RZ?=
 =?utf-8?B?cCs1dVhpSXAvdnRmaW1VRTlSSVdwVURpYjlTRFlHTDJnYVhpWTIxOTZaYmlC?=
 =?utf-8?B?WVlrNW9xMHF4a1Q5eko4Qys4cDVOZENyL2FnYWFXQlR1cW43YUVmUjczZURj?=
 =?utf-8?B?WSt3SE16eUxRSDNySFM3UG92TmN2T3RvWVZ5a3R0cW53b2NrR3Q0ZnJXN0RB?=
 =?utf-8?B?VGZzVE9aMTM3eEk2Qk5sVjExVGI4VlB3SXUreWo4Z3ZZNzFUNkhhOTd5eHdL?=
 =?utf-8?B?MkpwU3gzWTZTVGJDRktCNERLTEd4enlYNGltOE5OcjQ5NXZVNmFVSWwyRjRa?=
 =?utf-8?B?MG05NVhJd2g5NFAzQWJ6VkQ5cXB6L2dSNHdxUUZNYjcra1lwUDdHYTRuaUV6?=
 =?utf-8?B?TE81RGJsMmhSYmJUd09iZFdISGd2QTV3QjRoL1daVjFqZFNjOFZPdi9QNSts?=
 =?utf-8?B?Z2lnSWlnSTNDbWdnWGxQSWxxWGE3T3FhWTlGZXlLWmFrRHQ1MTUzQjNlMTRB?=
 =?utf-8?B?UW5Xay9XZ3hHNVhsQXhTK20veWJxOFllRVl5NzMxdS8wOXVMakdScHJKdEVB?=
 =?utf-8?B?SUFQTGJwSy9aWFhuVzl1c2liYUZXL1lSWGRQSi9XOGFzakxsc1VQTGZBZVQx?=
 =?utf-8?B?dXhPQ0pRUHovUXd4UVB1WngzaVh3UWRqSVlvVE1xR3Vzd201ZVNoL0x2TWRP?=
 =?utf-8?B?aG5TelNSYXV1YlE2aVZac3g1UlV4cTJ6aU5mRUlEdzl2NjZRVUJsdkcyeUZh?=
 =?utf-8?B?cU1NZ3ByZVdDclJsL20rRE5DOTJYYkFFYmU2MWREeWVFSG0xODJXb1VXdFhh?=
 =?utf-8?B?a010bWxaZWp4SkZzVEtiN3dUa3pZQXBuS2dhZEtCZmUwWldsa3dpUkZBU1VD?=
 =?utf-8?B?Umpwa3c3aHJTcnhTakpMeHFOT1IvRURReFp6TFh3QVprUjA2TTd3RnJBcnh4?=
 =?utf-8?B?VnlHU3VuWXRYeThBeStMWjRyVElJZ2xnVFhzTENOaDM0VDAvNDRMRUQyNFIr?=
 =?utf-8?Q?Qk+U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEdUNktGK2xqRmdqOWMwNlNlVFFGM3dCcFBBMHNyUHo2aS80ZFNOUmdvbEh6?=
 =?utf-8?B?aVZPRE1URDhzUy9RTGpTMXNOSHJqV1pPaXZNT1crZmo4OU82bWpHa1kyQkFW?=
 =?utf-8?B?VVBWcXovV3JpdGF2UTBCV3VvYTk4V28vZ2VnOWZmbW5SMFQwZ0trV3ZMbnNM?=
 =?utf-8?B?eFhyUk5scVVFOEF5em93QUZhZXFJTUVBU3F2d0FxdjFIRGNFUUZBUHg3Qjla?=
 =?utf-8?B?N0k4Zm0vRiszeVZEY1NHcUsyQXEzcXE3bTVEM2JaRG5uNjVCMmNIZi9OZUhi?=
 =?utf-8?B?UnUzdmRVM0lDRmJiT0U4VkxiS3VGQ3BNc1phM1JIVjVyTzlLK1REdm82Mit5?=
 =?utf-8?B?T083eUtKYmJPYms0dnFDWFJ2UWNPaHNCYUxaclhrRVdvNkN0TjNjWWJid1Fu?=
 =?utf-8?B?dUVQWFNSclNBRlhhRkRxWFVGNzhSY1lOcjJac0J2c0NJcGVPeHpNT29iRGRQ?=
 =?utf-8?B?Vjlub0NKTGpZUUFpTmZ6OXZ0NGQ2cktqY2IrV09hL2l5dzFYTDIvZ2FtekJx?=
 =?utf-8?B?Z3ovV2Q4SUhFaE93MUMxL2Y1b3R0VmoxY2RnRWgwTFVjMS9KY2ozTDdleVlk?=
 =?utf-8?B?a1hweGxPRXFuQTViT3dMTUZyOVNuR1RnckRNelNZa1JMWVZBd3dXV0pvT1ZU?=
 =?utf-8?B?WU9KRU5NQ0thT05kd0k5SDNadzNaUEx1NG5NRjVUY3JPazk5eXpOT0JOSml4?=
 =?utf-8?B?a0pleFBvMnJUTkpSVmxqWlZvV1lBVjNLR1BzL0FkT2c4V25YWEwrUk9meWxY?=
 =?utf-8?B?c09oOW9VcVRaNzErVnNsYVg3QktTaWhmQVZ2RkxkL0pxenVnK1BibEw5cENy?=
 =?utf-8?B?MDJVNzgzeHBEaUdGcmszY3pGcWhtN0NMR216Q0JXQnpoSkdROWxIWEIwUUho?=
 =?utf-8?B?c2VXN2lVRjFJTEJWSmFVR1puNVZJWjJEMUVZL2NZeGVDL0tZRmZvTnhWSE9M?=
 =?utf-8?B?NVFIV0tMMUhQMkY3Ui9VZDFGYVBZVDdSVGROMzVhVkZmY09BZklJT2NpbFNJ?=
 =?utf-8?B?YUdWak5LZXJlSzZNTGdZQXZEUURMNXZVdUp3djFqanEwZW9KRkNlbHhXb2hR?=
 =?utf-8?B?LytUK21KcDFlenViamNndmdDNm95RVVza0hFSzRxa3hmUnZBbE0zVmdiV0ZL?=
 =?utf-8?B?NGdqMVBtT25mVjR4NTZ6R3M5NHo0K0hocjVFV2plSlg3YjZDNnl3aUorclZy?=
 =?utf-8?B?NkhiVkFqYmNmckwyUHZGUmFyQjRvV24yb1Q0UTBqd1BPTHRwamZsWlJTUVIz?=
 =?utf-8?B?Z2FMckVDK043by85djRWUWsvMEZCRnVKMFFnSVBFelJ1TVdBSzkwUTFqdFN2?=
 =?utf-8?B?N2ZhcUYrbVhvdFFVZEc5czRXZlZFRzh5V1J3VU5pT2Z6bUljUHk1dlY2TE5t?=
 =?utf-8?B?eXNQcVVoWmlBRWFsdkh3ZWZ6aWlnZUk4MEVYS1JOcTl6S0xxd0xOcnNHak56?=
 =?utf-8?B?RkFOcjcxSnQ0Y3Y3UFlKTnZsYmF3K2ZDRzZVVEpuQ3pIRlNCYnAwQ3ZDbFhk?=
 =?utf-8?B?SktYZDVUVTdLU2habHhwSEx3TC9EUHNWc1U4UjN4TGc5N2lHQWhUK0ZUZlBX?=
 =?utf-8?B?MHplS2NGeWcxNytxWVJlZFYvaFNzdmNITyt2WHJCak50bDIyeDRSVUxIQUh3?=
 =?utf-8?B?UGE3TGtmNWhXWEV4UUdzVkVCYWVSYStmQjM1ZGFqOTFkdEtPb2h3TStINU5s?=
 =?utf-8?B?Yzk5T29VTVRYRWNFUjJMeFZzR0FSblZtd2RCRVR1alROSm1QWVRELzI1QlZO?=
 =?utf-8?B?ZG13MkpvMWpaWFlFWGpqajZobFhSaHFHbTVRT203WC9FbERGOVlPUDdJckVC?=
 =?utf-8?B?ZTZORGliaDBSYUNjdWY5UGFVMkN3VTRXRTAyOFlHSUZkSE5YWGY1eTNDMDVP?=
 =?utf-8?B?WjFoTTBsVUJaMTVIMG5DczNyTHlKUXF5dGZTOTFHU2ErSDhxRFJXbEpGZzgw?=
 =?utf-8?B?QmFGVFRBWjE5MmZOU2pjZWRZUkF2RzRVYkdxOExTM3lIN1oxUGpZMTZKZVZP?=
 =?utf-8?B?TFF5VHBjVnc4VmpOQzF3ZVVQK2ZzNXMyTS8zcjdLZlpISEF1WFVCenVtWFh3?=
 =?utf-8?B?Z1NzT1ZDSnZyQmFaTnkzWmxuWHdOY3pjZ2VDS2pMeXZwcWVSTGxoa2ZuSFpC?=
 =?utf-8?B?QXJnWkV6cGtuK2hGQ2hmWTM1UUlLOW85NjJIazlCMXJ3MWNyR21KVks0Nkh3?=
 =?utf-8?B?ejBnMk9MQlZzZm9rcW5VUk5EM0d0cnEvWnFwdkR3Zkx2aUZBdFdWdjc0dVR1?=
 =?utf-8?B?MEZWY2xYVTgzdW93NXh2QkRyb3ppTEJ0NWNxcUY0OStDbDNEc0lpcDA1Zm9w?=
 =?utf-8?B?VkpvdkxqdUNtSVFzTVdXM1FBTFppZjV6aG1MVkEwc1dQUTdtNGpKUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c51342-9a89-45be-5e48-08de54058fe5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:13:20.1941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+rdWYUh0gjckgn+r87VvGiHKK73+7v5hVl8V8Ty393fL3bC9rkMlkkmRvfBx774WD85dBd/7ynxV0cDzfHmGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8127
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2026-01-15 at 13:41 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> On Thu, Jan 15, 2026 at 01:36:11PM +1100, Balbir Singh wrote:
> > On 1/15/26 06:19, Francois Dugast wrote:
> > > From: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > Reinitialize metadata for large zone device private folios in
> > > zone_device_page_init prior to creating a higher-order zone device
> > > private folio. This step is necessary when the folio’s order changes
> > > dynamically between zone_device_page_init calls to avoid building a
> > > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> > > must be passed in from the caller because the pgmap stored in the folio
> > > page may have been overwritten with a compound head.
> > > 
> > > Cc: Zi Yan <ziy@nvidia.com>
> > > Cc: Alistair Popple <apopple@nvidia.com>
> > > Cc: adhavan Srinivasan <maddy@linux.ibm.com>
> > > Cc: Nicholas Piggin <npiggin@gmail.com>
> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
> > > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: "Christian König" <christian.koenig@amd.com>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Simona Vetter <simona@ffwll.ch>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: David Hildenbrand <david@kernel.org>
> > > Cc: Oscar Salvador <osalvador@suse.de>
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > Cc: Leon Romanovsky <leon@kernel.org>
> > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > Cc: Mike Rapoport <rppt@kernel.org>
> > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > Cc: Michal Hocko <mhocko@suse.com>
> > > Cc: Balbir Singh <balbirs@nvidia.com>
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > Cc: kvm@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: amd-gfx@lists.freedesktop.org
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: nouveau@lists.freedesktop.org
> > > Cc: linux-mm@kvack.org
> > > Cc: linux-cxl@vger.kernel.org
> > > Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
> > >  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
> > >  drivers/gpu/drm/drm_pagemap.c            |  2 +-
> > >  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
> > >  include/linux/memremap.h                 |  9 ++++++---
> > >  lib/test_hmm.c                           |  4 +++-
> > >  mm/memremap.c                            | 20 +++++++++++++++++++-
> > >  7 files changed, 32 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > index e5000bef90f2..7cf9310de0ec 100644
> > > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > @@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
> > >  
> > >  	dpage = pfn_to_page(uvmem_pfn);
> > >  	dpage->zone_device_data = pvt;
> > > -	zone_device_page_init(dpage, 0);
> > > +	zone_device_page_init(dpage, &kvmppc_uvmem_pgmap, 0);
> > >  	return dpage;
> > >  out_clear:
> > >  	spin_lock(&kvmppc_uvmem_bitmap_lock);
> > > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > index af53e796ea1b..6ada7b4af7c6 100644
> > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > @@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
> > >  	page = pfn_to_page(pfn);
> > >  	svm_range_bo_ref(prange->svm_bo);
> > >  	page->zone_device_data = prange->svm_bo;
> > > -	zone_device_page_init(page, 0);
> > > +	zone_device_page_init(page, page_pgmap(page), 0);
> > >  }
> > >  
> > >  static void
> > > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > > index 03ee39a761a4..c497726b0147 100644
> > > --- a/drivers/gpu/drm/drm_pagemap.c
> > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
> > >  					struct drm_pagemap_zdd *zdd)
> > >  {
> > >  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> > > -	zone_device_page_init(page, 0);
> > > +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
> > >  }
> > >  
> > >  /**
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > index 58071652679d..3d8031296eed 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > @@ -425,7 +425,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
> > >  			order = ilog2(DMEM_CHUNK_NPAGES);
> > >  	}
> > >  
> > > -	zone_device_folio_init(folio, order);
> > > +	zone_device_folio_init(folio, page_pgmap(folio_page(folio, 0)), order);
> > >  	return page;
> > >  }
> > >  
> > > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > > index 713ec0435b48..e3c2ccf872a8 100644
> > > --- a/include/linux/memremap.h
> > > +++ b/include/linux/memremap.h
> > > @@ -224,7 +224,8 @@ static inline bool is_fsdax_page(const struct page *page)
> > >  }
> > >  
> > >  #ifdef CONFIG_ZONE_DEVICE
> > > -void zone_device_page_init(struct page *page, unsigned int order);
> > > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > > +			   unsigned int order);
> > >  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> > >  void memunmap_pages(struct dev_pagemap *pgmap);
> > >  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> > > @@ -234,9 +235,11 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
> > >  
> > >  unsigned long memremap_compat_align(void);
> > >  
> > > -static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
> > > +static inline void zone_device_folio_init(struct folio *folio,
> > > +					  struct dev_pagemap *pgmap,
> > > +					  unsigned int order)
> > >  {
> > > -	zone_device_page_init(&folio->page, order);
> > > +	zone_device_page_init(&folio->page, pgmap, order);
> > >  	if (order)
> > >  		folio_set_large_rmappable(folio);
> > >  }
> > > diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> > > index 8af169d3873a..455a6862ae50 100644
> > > --- a/lib/test_hmm.c
> > > +++ b/lib/test_hmm.c
> > > @@ -662,7 +662,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
> > >  			goto error;
> > >  	}
> > >  
> > > -	zone_device_folio_init(page_folio(dpage), order);
> > > +	zone_device_folio_init(page_folio(dpage),
> > > +			       page_pgmap(folio_page(page_folio(dpage), 0)),
> > > +			       order);
> > >  	dpage->zone_device_data = rpage;
> > >  	return dpage;
> > >  
> > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > index 63c6ab4fdf08..6f46ab14662b 100644
> > > --- a/mm/memremap.c
> > > +++ b/mm/memremap.c
> > > @@ -477,10 +477,28 @@ void free_zone_device_folio(struct folio *folio)
> > >  	}
> > >  }
> > >  
> > > -void zone_device_page_init(struct page *page, unsigned int order)
> > > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > > +			   unsigned int order)
> > >  {
> > > +	struct page *new_page = page;
> > > +	unsigned int i;
> > > +
> > >  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> > >  
> > > +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> > > +		struct folio *new_folio = (struct folio *)new_page;
> > > +
> > > +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> > > +#ifdef NR_PAGES_IN_LARGE_FOLIO
> > > +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> > > +#endif
> > 
> > Not sure I follow the new_page - 1? What happens when order is 0?
> > 
> 
> This is just to get _nr_pages in the new_page as folio->_nr_pages is in
> the folio's second page. So it just modifying itself. I agree this is a
> bit goofy but couldn't think of a better way to do this. In the page
> structure this is the memcg_data field on most builds.

I still don't follow - page == new_page == new_folio so isn't
&new_page->_nr_pages the same as &new_folio->_nr_pages? I don't understand why
we would care about the a second page here.

 - Alistair

> 
> Matt
> 
> > > +		new_folio->mapping = NULL;
> > > +		new_folio->pgmap = pgmap;	/* Also clear compound head */
> > > +		new_folio->share = 0;   /* fsdax only, unused for device private */
> > > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > > +	}
> > > +
> > >  	/*
> > >  	 * Drivers shouldn't be allocating pages after calling
> > >  	 * memunmap_pages().
> > 
> > I wish we did not have to pass in the pgmap, but I can see why
> > we can't rely on the existing pgmap
> > 
> > Balbir
> > 

