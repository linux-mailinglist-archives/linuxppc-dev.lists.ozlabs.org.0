Return-Path: <linuxppc-dev+bounces-15369-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E95CFCCF8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 10:19:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmMtJ4kt7z2yjn;
	Wed, 07 Jan 2026 20:19:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.56.71 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767777560;
	cv=pass; b=lkmZht5HM9L2bDWtQ420nu87y+opZmWeqjcQocyv3ESpmJzY86sKD2Y1xL+qXpu6DoF9y6JRMF+MrBDGs2+ueSG4NqshwKYKimIhTNPwKFFdTQPZbvw9igxs/dkmf9eGb9wGdkgPRaJuG33EZOrKpqHqeg0uaOiSXoDgiTjADL4nPm+At56kvUnCjG12F8Ans+WrVeN9X8ffGGNslRpYRhmVGb8FgDMmzS5kedP3JoqrsyUkE8ABj7YJldtTeb27V+g6fggTFNCI7DFQfjkcKx1cNWZHPor9xDZAW+p1A5quoxwF7Zg+5j7gw+EDIPXUvV9obl94+MsRRCP+3ESR7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767777560; c=relaxed/relaxed;
	bh=Zf6IV6tZXTgf1IS6YNiAkxg/IGQzn0YllYcg+NS+wHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bnU+LHzML+AUbs0Ee13JGqNPdXxhJLMdcTnMiLGRBrdRoiqWwy+yBWsoQEcoGxtos0hPbFpoa+4V065muYzICVTNFicy/E3ryUQLQyjRyJPIHil2+zMAZkmnqUIMu65FMswvGevTmOVIRXuddJ6JYkEuHlizDBX0A15y8uQIqKq+/v4/vT8fu0Llyjfs2DjoJHBpck2wUenmGUT2pQBPtgS/U8KGqmCe5pA/AZY786FqP6xrH/LxS/QypmEnVJTfAAG5IE7UGVLPplFqhWNu+5xbaFumcL+8D1ULiFa2LepgfXbQ3JpMcNB+unQMOLCJzAehsptxJI7IXdsdgXLbEg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=c63egCc+; dkim-atps=neutral; spf=pass (client-ip=52.101.56.71; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=c63egCc+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.56.71; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmMtH6VvHz2yfP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 20:19:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QULxXJwmkntpLOv6fDP7+KyT01Ie9KZIWyrnv4AtaGmzljyeuRO3uQTyoWiSvJjv/64MeykcvFcgNGQvCLuoGsEgr+abd7V/hTgCdbRofSGclLMkrwTmo7g4h7AgYrxOjxhklZz06S9LpVUQQWwdeS0qYZ9Ght68s4eOrmq/wVi8vNdfROdZHWIvrL9yubyofFcDwl+IUggm4Rx99omVLzag8VbuNS3ZKs5bui9GkuekXi7BR86kJYsIhJQa4LCUnRd+bWKiqIGwxccTeXlxCq5pgD46AsIIxq9649G9/uqPkf5NgU1quXOUmxua7X3l5VWVjTfffhx75PmWLlI92w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zf6IV6tZXTgf1IS6YNiAkxg/IGQzn0YllYcg+NS+wHs=;
 b=qzndGrIBQsbqILl+4xpVRgOGbMrfLSQmS9EZQj8iigwAiyrQIOdBDyVlnVR406ODp3vSGptDSidAHtvqAAYRxZqrClx3on4Kap04fG3ZB8i8tPdSAKaC0k+bb+dgKDYTjrVfObre+RSKqBjJi1y6Ex+/38pLdbZE+HkE5ELtZ4bRceWTgFdOz5C/JfAFkbFm+v9k+ghCAhDIKKQu9XrU77UJtY6py8uHPZvl9wINlA2uUhD4JLk8wITr3yvzvrJoQ7Pjs5zBlVC3DKJs/DIDu8tMMvcnx8sHkVh0dc0n+fSEItu1rdgL2YMt2wy2viIBPZYif3mGITKgB+UFS9A6hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf6IV6tZXTgf1IS6YNiAkxg/IGQzn0YllYcg+NS+wHs=;
 b=c63egCc+rCvpGLlnqmT34iyjdBn9BewTq84VqrwmjTxonQytbcJyHPumQAmDnsaIW0Yc6VU7zQipLMlv2jTCU87gYMELdN6yMC7GLDvVOwwcsKW/Qci+RnkFUlZ0FSYV6L8dZiFaWYhXdx/NPu4E0tvQRANMA+kYYg3B8KxETaoMTmN87LuvIJUfF0X5qHj86sPKZ1ETcS6Ps1ACWO/Cz2YAICQO36v00SuXOYgOxbZWptbyt2X79cvGA5KNGM0plZzxQ0CrJWX/kiiv3pY8oGX01UDQ1K66bjfJaaPBABg4X9YPGa0LnLoQby1DgeltFN33sKgLGkt6kXUbkbJNSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:18:54 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 09:18:54 +0000
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
	Felix.Kuehling@amd.com
Subject: [PATCH v2 06/11] mm: Add helpers to create migration entries from struct pages
Date: Wed,  7 Jan 2026 20:18:18 +1100
Message-Id: <20260107091823.68974-7-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107091823.68974-1-jniethe@nvidia.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|MN2PR12MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: ed9d0255-1ba9-4962-8240-08de4dcdc79c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ss+e89OmxvIPdxHV529XDg76+6jI+nNnNn+jf8iTeHF6n92rb8AQg7SLT88/?=
 =?us-ascii?Q?EZQNzop/BewZUIcClUleIXBBnsIhXuQxJCGRsoCaiy6+50AHflq0jdUUojM8?=
 =?us-ascii?Q?tsILHH/hOportFgfztPmV4i0I/kB5BfqoBs/BA1Pe40SayMz2E2maCzBvmDl?=
 =?us-ascii?Q?cCShP1hiF65beUYex7DdEk/b0mDffgzwpV1yIhRtVtpAsFNqfsGG/VhUH3d/?=
 =?us-ascii?Q?2yUxsDHAXXYoHnXprhV6LJR4LeoEMHcCq8z7Xu/SEjl9kNpdxQ/7VR/jTjcy?=
 =?us-ascii?Q?4XaI9lASN/8qsWdNPB1dzHUxcTlhHHhWpyFqYxRtKANsqtDWtqgilFJvJH2Y?=
 =?us-ascii?Q?04BLXsL3JpwyBouHK6W/i5zspjrMHErB+FEcEnSQ1iQ9R97JYNcRqMcbaTIV?=
 =?us-ascii?Q?IXwlYS81rKX8GysJJ5YbyWNRbubVEguAlm36aLvrD5ZFxR37IX4LhbVUxO6b?=
 =?us-ascii?Q?7dzRIPM0rH76o4CwWDXwRTdcSQ1/KGxO6pGwmobiBgSyFFs3SbTHOP0wG2Sh?=
 =?us-ascii?Q?KWu0NiHIKMp5+pgqSPxrrMiWYBJ7Qn1cmWPmbpZ6Ly1HctAklQZ3nUQkEFEC?=
 =?us-ascii?Q?2nogpKMQ3T+ztDT6AjKEFwJqLOx8pUk+KL99tVSSABNZgWNgcvrArjSt39La?=
 =?us-ascii?Q?0TPnPJraUpkv6oiXj46JvB/K7LTmzVxbUbNKVYfLjWT+sW+qFcbfyHYftjMc?=
 =?us-ascii?Q?DutsdjG2nUBnVxVgf7m7ALsM3TmQbS2q7txusT5v7DpNuuzqyZgK35JIFiv6?=
 =?us-ascii?Q?cLHiIGospwaml9mm077g+KP3zUdbWxWOzrA2LC27leA+++MwZI+7Sj1Hrd16?=
 =?us-ascii?Q?lfS9YlKp1WdKCxSHkvDTUXkpKgFCf+odyEU2ZQvDTHK1TmnPUHDFwhW9qDp6?=
 =?us-ascii?Q?BQHhwSUsSk7te31oHkyzSqb0P+baxEopW8czagjH+hoPV7Q2fWPO+eGjT5wZ?=
 =?us-ascii?Q?09G0USk4j0agvnPuoLCoAQ+y2Q9KVp+1NWv09AMnE4/QnbCFExND4X5SEGaj?=
 =?us-ascii?Q?IvcLWqUGvdsXuf31RecL+vkwQWAyTr8wLgSCOnjRKXQmMubk5pvBE18nAwCD?=
 =?us-ascii?Q?0rQkeLFumIoSmj3Mjsi1WB8WiWfRDukM0VeoR16m5S1/tGLH54DwRzQGgFQu?=
 =?us-ascii?Q?eN+PgJCKmO8CXJAZ1RPdMEQ9bc8pP6rMwIaBXRYlH6RtYZKPFdCnhZjozTxg?=
 =?us-ascii?Q?wKKJnPPZef9dAcXeBkFAYL3bzmwZ74Fw7zpankC0kJjSSGUiIii2GXbmT+Wk?=
 =?us-ascii?Q?epUxv0129LZC8WDIvSHupWBtndYIUJjvk9h33yJSQ5EiXkzoOQBTivi/zSJW?=
 =?us-ascii?Q?PFG2HrF6NaCQXi9+W7MWECd1pV2nBd5JYhku+LKtmrJrSZgXZMlnnwMpUcQe?=
 =?us-ascii?Q?g7HIvxn3Ev9ja9oHzpf5wIW39A+XvhMp0nH/rwUMYZvCkrnp9BMtPEdHvQTQ?=
 =?us-ascii?Q?4yiM6zhWv2MsgPD7+1XmSl+rqU3Qry/H?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qhSh1ak+t13fIw2XRUH+9FUq6MUb46Qgu0rnGAGHnlmPLOnnqt74T9JErbag?=
 =?us-ascii?Q?QlnlZqBQ0Y+J/D9Hi9ukIw/B5SOau3+y18y6cyZxBrWA07owkKaRIHGgZmrD?=
 =?us-ascii?Q?JykPoUO8KobaEQI5+q8rt4BJ9wJ8OiRCUh8aq8qgHhqnay30d4EYybOcVTUc?=
 =?us-ascii?Q?QK8tojC1VdDGn4lJdS4pr6j2cPoj4ePKAYQ7TbVWUhw9AVSVnh66NWQ92dcC?=
 =?us-ascii?Q?Mt4Sh/EFPqcWHpaKLl2LjBneMsl8kILvW9AjhP8VO1YBUXJRE/Ui1vAUFnpb?=
 =?us-ascii?Q?hm0etE1ngoO+ahobYFNNUjhUOzWKWu0lNTaIkO0Ks5N2Izzjn1UebcP60BPl?=
 =?us-ascii?Q?CNpwTkVtVxrYC3YkNHTzQ80ovx5R33JgAesPvLMMivvAHPE5isGNo6R6RPM0?=
 =?us-ascii?Q?KqMnBNsKmYLnaD2mOWt8f+HhQ/COU7rRffcPWIQ40oFCU4C5AipYmyHQUXey?=
 =?us-ascii?Q?2d8diJkS1QIDnOzU8lVfkXSyD3DcECnmTGNgDoTDuLjSD6UxtIbMxvVvDzj+?=
 =?us-ascii?Q?w0OZCbi3ysSRxt37E3OuM32uoyohr81Ngw5KEd52yqz8NXCFP7UrgyytZb59?=
 =?us-ascii?Q?t6fUWUZkA3Y5T2Nq2KXEofP/THpqAXzvAEAeI8gKXjJmkEzucoPUMKaJdoYY?=
 =?us-ascii?Q?1aVrUbGatAd+AzNbiE2yVNgDJySdFtNQhpijpK6VF9m9vMNXqnJnAEhR+Vix?=
 =?us-ascii?Q?TofoCxMx7if4eSXlt3UVupvz2abkcSlEV0PN8P5WVN2Q3ASv2bgAlcpRaF6D?=
 =?us-ascii?Q?/8j/8XeG1D45H3R5one9e+OWnCCVKpDO1MI8zcNxGDe0LJ9h1W4M9yVZ4YSP?=
 =?us-ascii?Q?DrW9E6e4HilUpTQlhJSdGzA4+xCtMVisp4PQd80cGn0KSHkEqDU/JuZuYcRt?=
 =?us-ascii?Q?v0lk5QPk21E2g900Zz6ZelbQXTKFL7rIhwh1fK4S2M1AahA4mvmSoKhYIdVQ?=
 =?us-ascii?Q?mAbpnpOVupcv0dADY2bmQb9+UMgP7It7bZS9tJK0kMPSOn34QjkwWyaL+q+x?=
 =?us-ascii?Q?ShqEy6dBorfkQrAHoxK3fnhnsbt8RjhIFBqkiO8QgeFjYSNEI73T10ERcIqK?=
 =?us-ascii?Q?hDvIEqcjSI1X0MyGBjAmuz2W6Fca84U+w9cpytKvLf7SVJVJVeV80MSSl2+E?=
 =?us-ascii?Q?vhUS3iVg7pcOLvJ09OvcvbjqyoM/kaNaMi4f9j1AfmYh8NsclXLzSCn0XW6b?=
 =?us-ascii?Q?DPpF+hwCEIsKh9jfxlyvlgbQm2iK+lMxV6Ufh+rDOS3TSnTMuxw4tTtAZcoT?=
 =?us-ascii?Q?36r6yGJjen0Bba+M1Dwn7trWOFENR1Jl9McCWMt56397JtUoaMqkQwT5r6wn?=
 =?us-ascii?Q?/IpXfVdzm69pEyaM+U8xwPdltdqqhr1qnpXbQJtCRkGbjV/Z0560MUMIqAP1?=
 =?us-ascii?Q?rdPEh2Pbk7sR7w9mfgdGBoReLn7UfJWrcUb9D6D8g/v8vwc3cYbDLil06V1p?=
 =?us-ascii?Q?dmqB6cByGjhNbr3VXl9GvyC8XJ305KdkZYSwgFcdtgHWge+ApcxoFLaawGHg?=
 =?us-ascii?Q?V6B/o4HSBiyaqCFjEzaKAfSAR6eoVTNfZJbCW0ZnIFRLHttfwxJX7NVJ9r+W?=
 =?us-ascii?Q?slHo3I+GZW8fvPY2RgQbo8QS0g72V43fvspHNQ/1cd3h/2gIiaP3a0Vt/RjF?=
 =?us-ascii?Q?JbL1svu+OPBh6u1ImFbsektxIUPAvMahz4qtYG8ksEPcxbzk09cCr2TxJazR?=
 =?us-ascii?Q?3yRQRVgZO/Z5ECTep+weJrVkaAa9jIEY8Oy3nElQNjqI56G0IOGpD2VSwTBu?=
 =?us-ascii?Q?oFwo2D0jBw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9d0255-1ba9-4962-8240-08de4dcdc79c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:18:54.7160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVf5792X5i5KCYV/pwbIG33k0SxUgDQkrNz4jv7ILaGq2m9nqLchiwc7Wi+WKyjMiYBpdpkL9OLj0V8vZYqbUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

To create a new migration entry for a given struct page, that page is
first converted to its pfn, before passing the pfn to
make_readable_migration_entry() (and friends).

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn and must be handled separately.

Prepare for this with a new set of helpers:

  - make_readable_migration_entry_from_page()
  - make_readable_exclusive_migration_entry_from_page()
  - make_writable_migration_entry_from_page()

These helpers take a struct page as parameter instead of a pfn. This
will allow more flexibility for handling the swap offset field
differently for device private pages.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v1:
  - New to series
v2:
  - Add flags param
---
 include/linux/leafops.h | 14 ++++++++++++++
 include/linux/swapops.h | 33 +++++++++++++++++++++++++++++++++
 mm/huge_memory.c        | 29 +++++++++++++++++------------
 mm/hugetlb.c            | 15 +++++++++------
 mm/memory.c             |  5 +++--
 mm/migrate_device.c     | 12 ++++++------
 mm/mprotect.c           | 10 +++++++---
 mm/rmap.c               | 12 ++++++------
 8 files changed, 95 insertions(+), 35 deletions(-)

diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index cfafe7a5e7b1..2fde8208da13 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -363,6 +363,20 @@ static inline unsigned long softleaf_to_pfn(softleaf_t entry)
 	return swp_offset(entry) & SWP_PFN_MASK;
 }
 
+/**
+ * softleaf_to_flags() - Obtain flags encoded within leaf entry.
+ * @entry: Leaf entry, softleaf_has_pfn(@entry) must return true.
+ *
+ * Returns: The flags associated with the leaf entry.
+ */
+static inline unsigned long softleaf_to_flags(softleaf_t entry)
+{
+	VM_WARN_ON_ONCE(!softleaf_has_pfn(entry));
+
+	/* Temporary until swp_entry_t eliminated. */
+	return swp_offset(entry) & (SWP_MIG_YOUNG | SWP_MIG_DIRTY);
+}
+
 /**
  * softleaf_to_page() - Obtains struct page for PFN encoded within leaf entry.
  * @entry: Leaf entry, softleaf_has_pfn(@entry) must return true.
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 8cfc966eae48..a9ad997bd5ec 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -173,16 +173,33 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 	return swp_entry(SWP_MIGRATION_READ, offset);
 }
 
+static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page, pgoff_t flags)
+{
+	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, offset);
 }
 
+static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page,
+									    pgoff_t flags)
+{
+	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page) | flags);
+}
+
 static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 {
 	return swp_entry(SWP_MIGRATION_WRITE, offset);
 }
 
+static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page,
+								  pgoff_t flags)
+{
+	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page) | flags);
+}
+
 /*
  * Returns whether the host has large enough swap offset field to support
  * carrying over pgtable A/D bits for page migrations.  The result is
@@ -222,11 +239,27 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page, pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_writeable_migration_entry_from_page(struct page *page, pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page,
+									    pgoff_t flags)
+{
+	return swp_entry(0, 0);
+}
+
 static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 {
 	return swp_entry(0, 0);
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 40cf59301c21..e3a448cdb34d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1800,7 +1800,8 @@ static void copy_huge_non_present_pmd(
 
 	if (softleaf_is_migration_write(entry) ||
 	    softleaf_is_migration_read_exclusive(entry)) {
-		entry = make_readable_migration_entry(swp_offset(entry));
+		entry = make_readable_migration_entry_from_page(softleaf_to_page(entry),
+								softleaf_to_flags(entry));
 		pmd = swp_entry_to_pmd(entry);
 		if (pmd_swp_soft_dirty(*src_pmd))
 			pmd = pmd_swp_mksoft_dirty(pmd);
@@ -2524,9 +2525,13 @@ static void change_non_present_huge_pmd(struct mm_struct *mm,
 		 * just be safe and disable write
 		 */
 		if (folio_test_anon(folio))
-			entry = make_readable_exclusive_migration_entry(swp_offset(entry));
+			entry = make_readable_exclusive_migration_entry_from_page(
+						softleaf_to_page(entry),
+						softleaf_to_flags(entry));
 		else
-			entry = make_readable_migration_entry(swp_offset(entry));
+			entry = make_readable_migration_entry_from_page(
+						softleaf_to_page(entry),
+						softleaf_to_flags(entry));
 		newpmd = swp_entry_to_pmd(entry);
 		if (pmd_swp_soft_dirty(*pmd))
 			newpmd = pmd_swp_mksoft_dirty(newpmd);
@@ -3183,14 +3188,14 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 
 		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
 			if (write)
-				swp_entry = make_writable_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_writable_migration_entry_from_page(
+							page + i, 0);
 			else if (anon_exclusive)
-				swp_entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_exclusive_migration_entry_from_page(
+							page + i, 0);
 			else
-				swp_entry = make_readable_migration_entry(
-							page_to_pfn(page + i));
+				swp_entry = make_readable_migration_entry_from_page(
+							page + i, 0);
 			if (young)
 				swp_entry = make_migration_entry_young(swp_entry);
 			if (dirty)
@@ -4890,11 +4895,11 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
 	if (pmd_dirty(pmdval))
 		folio_mark_dirty(folio);
 	if (pmd_write(pmdval))
-		entry = make_writable_migration_entry(page_to_pfn(page));
+		entry = make_writable_migration_entry_from_page(page, 0);
 	else if (anon_exclusive)
-		entry = make_readable_exclusive_migration_entry(page_to_pfn(page));
+		entry = make_readable_exclusive_migration_entry_from_page(page, 0);
 	else
-		entry = make_readable_migration_entry(page_to_pfn(page));
+		entry = make_readable_migration_entry_from_page(page, 0);
 	if (pmd_young(pmdval))
 		entry = make_migration_entry_young(entry);
 	if (pmd_dirty(pmdval))
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 51273baec9e5..6a5e40d4cfc2 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4939,8 +4939,9 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 				 * COW mappings require pages in both
 				 * parent and child to be set to read.
 				 */
-				softleaf = make_readable_migration_entry(
-							swp_offset(softleaf));
+				softleaf = make_readable_migration_entry_from_page(
+							softleaf_to_page(softleaf),
+							softleaf_to_flags(softleaf));
 				entry = swp_entry_to_pte(softleaf);
 				if (userfaultfd_wp(src_vma) && uffd_wp)
 					entry = pte_swp_mkuffd_wp(entry);
@@ -6491,11 +6492,13 @@ long hugetlb_change_protection(struct vm_area_struct *vma,
 
 			if (softleaf_is_migration_write(entry)) {
 				if (folio_test_anon(folio))
-					entry = make_readable_exclusive_migration_entry(
-								swp_offset(entry));
+					entry = make_readable_exclusive_migration_entry_from_page(
+								softleaf_to_page(entry),
+								softleaf_to_flags(entry));
 				else
-					entry = make_readable_migration_entry(
-								swp_offset(entry));
+					entry = make_readable_migration_entry_from_page(
+								softleaf_to_page(entry),
+								softleaf_to_flags(entry));
 				newpte = swp_entry_to_pte(entry);
 				pages++;
 			}
diff --git a/mm/memory.c b/mm/memory.c
index 2a55edc48a65..16493fbb3adb 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -963,8 +963,9 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 			 * to be set to read. A previously exclusive entry is
 			 * now shared.
 			 */
-			entry = make_readable_migration_entry(
-							swp_offset(entry));
+			entry = make_readable_migration_entry_from_page(
+							softleaf_to_page(entry),
+							softleaf_to_flags(entry));
 			pte = softleaf_to_pte(entry);
 			if (pte_swp_soft_dirty(orig_pte))
 				pte = pte_swp_mksoft_dirty(pte);
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index a2baaa2a81f9..c876526ac6a3 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -432,14 +432,14 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 
 			/* Setup special migration page table entry */
 			if (mpfn & MIGRATE_PFN_WRITE)
-				entry = make_writable_migration_entry(
-							page_to_pfn(page));
+				entry = make_writable_migration_entry_from_page(
+							page, 0);
 			else if (anon_exclusive)
-				entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page));
+				entry = make_readable_exclusive_migration_entry_from_page(
+							page, 0);
 			else
-				entry = make_readable_migration_entry(
-							page_to_pfn(page));
+				entry = make_readable_migration_entry_from_page(
+							page, 0);
 			if (pte_present(pte)) {
 				if (pte_young(pte))
 					entry = make_migration_entry_young(entry);
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 283889e4f1ce..adfe1b7a4a19 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -328,10 +328,14 @@ static long change_pte_range(struct mmu_gather *tlb,
 				 * just be safe and disable write
 				 */
 				if (folio_test_anon(folio))
-					entry = make_readable_exclusive_migration_entry(
-							     swp_offset(entry));
+					entry = make_readable_exclusive_migration_entry_from_page(
+							softleaf_to_page(entry),
+							softleaf_to_flags(entry));
 				else
-					entry = make_readable_migration_entry(swp_offset(entry));
+					entry = make_readable_migration_entry_from_page(
+							softleaf_to_page(entry),
+							softleaf_to_flags(entry));
+
 				newpte = swp_entry_to_pte(entry);
 				if (pte_swp_soft_dirty(oldpte))
 					newpte = pte_swp_mksoft_dirty(newpte);
diff --git a/mm/rmap.c b/mm/rmap.c
index 79a2478b4aa9..6a63333f8722 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2539,14 +2539,14 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 * pte is removed and then restart fault handling.
 			 */
 			if (writable)
-				entry = make_writable_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_writable_migration_entry_from_page(
+							subpage, 0);
 			else if (anon_exclusive)
-				entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_readable_exclusive_migration_entry_from_page(
+							subpage, 0);
 			else
-				entry = make_readable_migration_entry(
-							page_to_pfn(subpage));
+				entry = make_readable_migration_entry_from_page(
+							subpage, 0);
 			if (likely(pte_present(pteval))) {
 				if (pte_young(pteval))
 					entry = make_migration_entry_young(entry);
-- 
2.34.1


