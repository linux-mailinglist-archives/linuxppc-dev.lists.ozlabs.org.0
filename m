Return-Path: <linuxppc-dev+bounces-11645-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58192B410C2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 01:25:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGhg45K4Dz2yr1;
	Wed,  3 Sep 2025 09:25:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200a::627" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756855520;
	cv=pass; b=Ok3Egecv3NzGdMxCP4zhd7S0+YpFURC/JZtflgS/wBlsDPg+5GxIJj6EjhNhChKD66G6H911Ou0B0WBoQEiKvQ7bMs0YoPHJNT7kgD6/gozaLGWIpC2Rk7LkhjP0P7MsSYkyYAktYOyffUoSx39DWaiBm+zHL7Dt7ymtv0Pd9jmVqC7xYv9RTNAVpQCyGZMmGjqZ7lgnLC8e19Zv8uvqxAuiFN9FLpDkTFttc/WyobeoJWZVFN2v8PIPd0obkASYwc+vQnc64Zs+/uIeUk+IOmsu0140dyDttDqlg7FtPNrEkXKNNWAeho0eHgrO4CDT5kAHMDKR6WJih39taYKqnA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756855520; c=relaxed/relaxed;
	bh=5WhB/bSCKzhLBnuuHt7TF4nSB4uzH/8ebtNNvqKnLZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FDjkf9ZgdoqyUFa6lxEI0x2YMJxksjeu2e/dNMmAYg2Eavrd9pBv6Z3UMD4P0HwqPvm5h3eGpJeuEinwvxZBpbR+ng3/X/S4DN0VonHWKQIq8IRFum1OkXRw+W7ubY6GrqQtZnyhd6ApVOSNfr6vqwgVwkbAVVidC3ditrKrpDXX5Zl5T8JU8PEMXb8XJSgdasfPF/bRVYLIJ74FdqUL/peDtaD9OiHf8Sjgh7WibI9/WWbWQJFNhix2vvOVGBYzrl9Pf5A6PaZPCkMQz6QRRjxjsCHDW0jblByF7hz7tQ+BuSLdSzbBuPYFMFFzLgpFtFHdWljpsFt4FlxbdfAesw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FrwZLjyp; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:200a::627; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FrwZLjyp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:200a::627; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20627.outbound.protection.outlook.com [IPv6:2a01:111:f403:200a::627])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGhg33qSyz2xQ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 09:25:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPPUGTpBQtvDStMLISia+THnTG3E+xG7M30x/PlBo2tAa/Nr/FmSG//W8J1ytvmYfhHAim/W9vQgGujfcSuDILGI3MLD6pI6zS/OBY6OjTRcOngtk4jHhyGUh7jyRRB7szMQuPkC0FVnIUpnLJxS17iQdNA6AwS8d3tSA1dKuSftvGm2YCpQt3teeyNM/4nDnpsnuHxKCtSsm4ZxJ7lDZKrevojcXGC2x64W2xWlegQeMIK2rdxpSOR3mUEg+68waaoLnziZs6CRUl9OORYmCDYjZdsiUhla3kDKGqETPLX9l+jUVxkpUfFVQZaaMQUTmy9sd4idVJ3XjDo1oc5Fqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WhB/bSCKzhLBnuuHt7TF4nSB4uzH/8ebtNNvqKnLZo=;
 b=Bp8uobg7Bc/BzSSDdn/btXqGPCvh/sMoJV2WrMiwae2gLXXMNa74iBFMOK8/Kd3nIe9DK65EPLAHjJyQmW8DOXDs0DsFGRmQLve8gYV8a6tY17tfpTo8zCgFv5+3GgNHnagEytgV8j4HLlBahFH4W76yI1oHiycXqbmiQtuJxjyhuu6icEqsWPa7LoOyNl2pEd2PzvwHOQbnGhYo3Fzzd9EA/sudkNK/l5w4yDPSkDAmsiZvXW6QfcWhCsAF2m1x/v5zC7XkqaqZe82trwitDyL1DcbG/w15m/gyz76Y438tMp0oBXpcw+HMFmc6FRhQx7LSn25C6eW1Cargibj6zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WhB/bSCKzhLBnuuHt7TF4nSB4uzH/8ebtNNvqKnLZo=;
 b=FrwZLjypAbDrjjqAKk256crdzVZq5Sew5KLCSVqXFIm6JyrV7WWqseMrpiu6vHBAy6Xlq7hJUsVrsT/FkYId14wsn536VKml4D6dVf0nX1pDWvZdYx95NPTtj+TUehlsqj5w0TNjWea9EzqyGH1Szex82Slu5m16O469Jqf4vo8LVpYziiKli7KTd/FS6+moUTxeys5qqRTu4BHPio4D6BiG9luxRnn5KUs1cBGj9i9sQBFRtT+dthQPMa8u8xyA4r41LbqjNUFXR0e1kW0r+ZfYYrCZlj/fR+WLDmZd8zFTpgKVynLwnmDbpnxukVNhCQvtdttg4v7iM17l9idL/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH1PR12MB9574.namprd12.prod.outlook.com (2603:10b6:610:2ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 23:24:58 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 23:24:58 +0000
Date: Tue, 2 Sep 2025 20:24:57 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Keith Busch <kbusch@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leon@kernel.org>,
	Leon Romanovsky <leonro@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 14/16] block-dma: migrate to dma_map_phys instead of
 map_page
Message-ID: <20250902232457.GC470103@nvidia.com>
References: <cover.1755624249.git.leon@kernel.org>
 <CGME20250819173845eucas1p221cd6842839f5e7130f131cd341df566@eucas1p2.samsung.com>
 <22b824931bc8ba090979ab902e4c1c2ec8327b65.1755624249.git.leon@kernel.org>
 <2d8e67b2-4ab2-4c1f-9ef3-470810f99d07@samsung.com>
 <aLdoyWevrQMQUGyz@kbusch-mbp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLdoyWevrQMQUGyz@kbusch-mbp>
X-ClientProxiedBy: YT4PR01CA0469.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::7) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH1PR12MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: 63dbd94d-8dd9-4729-0d10-08ddea77eed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Higtp3/WM5oOHXkSSI5Z6pkQhOJorSSmJ1rnzoaJINMSn5inopVW+5S1K/Ek?=
 =?us-ascii?Q?7UrVD4MqKyLijH5h/vlsnHGvvpnFBsM7bvA+EFOiGdGldsWfaZYD8zUnE+Ia?=
 =?us-ascii?Q?ecNJ/0eJumt+b4s+tCBkkWx3wAlbR3L7ZwRembGJ0qEAW5a8nMcl2O4pKBo3?=
 =?us-ascii?Q?PdQLHRgzmpB+Zi9Fyvs7ObYDwqrX3SvjiyXTY7dfz6xgl2cNvZLi0VYii1/b?=
 =?us-ascii?Q?MkmMnZxsMlCME5PY63Vbs+iSk/IsvqtWZHysYL4ru2GKkqHySeU/UxTsKS9H?=
 =?us-ascii?Q?NCQuJHY9AoYkjqmoR9wiyV8tPiNXWxpRtpTZLV+P9wxTPx+sIP6lmWoS5/S8?=
 =?us-ascii?Q?tScHp8k0n3YfKg3GgKbdM3XqOzkoumuJYdU2wWmSvEiefzhn121027ScVc0M?=
 =?us-ascii?Q?mgzvNL4BID9woA1Jopw2qWMOUr6I42j9dddH10a2Hv1fG7SqI425nv/pOe0t?=
 =?us-ascii?Q?XJLZrlOU3bEWKkS5qf5qLZ4koodOuW/or2bHHG01Kw+qVJViR5uQMQErX1Rn?=
 =?us-ascii?Q?dtqR9Vv9ju+N686ia1iq1DS9dkK7YGKHd5W0b0ulhNTSQMFxZH3cWGGjfWTk?=
 =?us-ascii?Q?pjUR3HiLnhZ/Gd+XDqBYF4iqr14XCZkC491u0cxXUHDii+HrI0WlyWJ2BKs0?=
 =?us-ascii?Q?dBy7a/RbGYkwaioywaADLcf4CQNWk5/2GrFCGWhBSwYB4ZjprP1MGHvYdI3R?=
 =?us-ascii?Q?DMzz2x8pNRL7Mivdz1EtHsC/rhFLc7JonZiWPL/pvdgvSnbboCWHS7c6QOpl?=
 =?us-ascii?Q?0swby8pOQj4N0n49XZtvW/idwcbe4eNzXJ0jm7wrkcFtMMUxVvl8m7yvIDtZ?=
 =?us-ascii?Q?lkBLoshQkBjqhFQ/rMBX0tNenSjQGAw3q6U+TAYT6ONJyKzPzXMD6ONMEEr2?=
 =?us-ascii?Q?lM7nczTb/5U62gC4bHgrqTQZG0/IV/K146tgoh4kVZhRNS4+1TDwn85Ef00w?=
 =?us-ascii?Q?b25m6ZgpKhrAxPuKScb48bdqsiYSeRjlub9AcOjtrsTjupvo5g4b1uCSu360?=
 =?us-ascii?Q?ihn81VgyyrErWwvwyxXUY+zUoPHstPTvUXgO4hhJQGEphLgRHf5IZJ8FNF9E?=
 =?us-ascii?Q?y8aOe+19T3uf4BgYrljrHnyl7H7Ivmy/M3TWnpkf0Ne3P/rxpcFURQqPyxrA?=
 =?us-ascii?Q?nmax8Lk0p77thdRstB+Hc504ESJo3wkqm2nGrwePMZqg9Ex+ZwuwPzIh+yFc?=
 =?us-ascii?Q?NW4E84kHyQmH9bigD2OQ2nj80E+nsEUiEfPtQu9DDNkHPhsc3DWmsQp5F5ID?=
 =?us-ascii?Q?v2iXvkdUv4q4fUxzbDu8lvbKB34fT2OkWHmduiMObfU44H+8USLbzFbYGHvp?=
 =?us-ascii?Q?W+zopG0awjW8HwejpiP/r5KxoNSrY51NLps/3h1ryMebgbOTFkdvuQ/1Jubh?=
 =?us-ascii?Q?wHoM62r1+0y7npOtu7w7ng34SwuefUBlBMTA1ghgxypuzWM4sbecLls4XAyK?=
 =?us-ascii?Q?d1RHM5UhoGk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p5eHAhSaNlykrbWpG/UPoqPb+iB4di9SrzYYl3qOPeAc97/mV6PDVi69YGjb?=
 =?us-ascii?Q?/G5ZcFGR6SHgsNA89667543XYP54vL2aGbWD7mO+dDPSxdYPwrSwbR4OZKGj?=
 =?us-ascii?Q?0uZ/4QYa3QBppOpU7LU6Ruc7Eb3ZaXR3MCTcpATP7+YKn3PKMq/qRJBInuh0?=
 =?us-ascii?Q?mndkVYAZ72At+hxcF5ZZ1QA16/AxGYtIV/Rwnv1vRZM5FjoG/84e4j5oYx0S?=
 =?us-ascii?Q?ocyFVke+zLfEuBT2oM5/3BmRbPrJY0izl9cUqeCfBv+jquc7o7TVk014BH20?=
 =?us-ascii?Q?TrICRhQ3NARiEsVmZK87iG72oNredufI/8XNg3bhNZYwsHRYRQcEPg6aDbLL?=
 =?us-ascii?Q?mT/NPGXf52sa56OYUv6OkB7bxN24Uich0CeXNjMtCeNXO2pASJCwHnwEB1gZ?=
 =?us-ascii?Q?PV0X5lZBA2ewO+tX4LQUKqqT3mB8MTEJYbqCa94pF3vxk5cbJMuob9np/A/L?=
 =?us-ascii?Q?o6CfmeH6x+Z7S8Pfqgb/Q12IwsSGyQFRPyo7W8hR2V/qW5e7ER223wB7eCyx?=
 =?us-ascii?Q?ZIg3y+y0vcamWCdg2D0pXVK9J4+85ZPfxV7N1YX2oez3G9epg/ohsdHic9fu?=
 =?us-ascii?Q?JxCIJgemIxztEXy4YoOTaMsgz4GYwTVodoS1cZ0NYpMROKPBCTm7xT4XBjq6?=
 =?us-ascii?Q?2+DE2mLQ/UCL5jhiTp6poXSCR0qBOgWzUJKyaLwjQ1GZAyzxbNrcljo82ame?=
 =?us-ascii?Q?TKeXuuv6aBzpD/6RZMBMAZzh2sr9hg0LORN8vJe5fFvmR5JRmNzsO7Q9ris6?=
 =?us-ascii?Q?HfrkG070I/eqfwuSBDJ4nzLvACcAJoQhez6FytC0UcpRlbOPD+r1rMwKdl+w?=
 =?us-ascii?Q?8lx/vYLaNoXVZSsWZEpftqg+gPlzE2ccC3sAfFDqYq3osSe3yhfuGgjIngrI?=
 =?us-ascii?Q?N763ZBm1UZHKcOoUIJkq1IlWBPaat+KVqpOv53f9E59PqJtGu2/h6H95WyRJ?=
 =?us-ascii?Q?bW7CcTqQM9bEWsW9kzofp/5dvkCxlaWHY3Nh4Nxjy0jS2fGPWAPM3qZAc0jS?=
 =?us-ascii?Q?V9kmZydsir6/Cx30g7K33l3dwibq6q46+W03IF+gjL9XnaWlmCieooWek8lW?=
 =?us-ascii?Q?h/uGyVI8CqH12zNfrFojddv8yK/hTDrQN9jYSkA1ahEv6ZL1DLwqBlMya4Ap?=
 =?us-ascii?Q?/r5/qlXRyAHu5A0QAwyPDGs5ml3qsMX2ajkBGSk9X0ntPihhkWkUqk8sd2hO?=
 =?us-ascii?Q?rlkadpZpHqJepYOKHZrUdi3WSU0xKSSJeQ+u71wDEK9qghkKVjSYjER13IuG?=
 =?us-ascii?Q?i4NUzxZ2pIKqaql+Ty58blZQRf1++v8itAdRiREY4lAVu2ikKLoPkfJFvxNJ?=
 =?us-ascii?Q?Q1hdIWrcRdvBX+JaZtvjSYcRpyrhBZdKBE0l39mN8fcvqiw5hQ3glHMoqD8j?=
 =?us-ascii?Q?ccHD1YCwdTzvyjY8bMoZJ/h7M+UAHuTS16dOswEl+UJKX5koND+Ql9PGkxhP?=
 =?us-ascii?Q?9fgidwA9mzNyZdN9S2gZjRAls3FnVg2GPr6TkGVDXf8WJ8ZImtMPr+uZU7Kx?=
 =?us-ascii?Q?C3uqBfEEQfmHvbJAVwFTC6HZU+GYssMua51pl763bOE6Zw39qHuaSaSowPOq?=
 =?us-ascii?Q?x1wOdD6P+giXyxbN/Ko=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63dbd94d-8dd9-4729-0d10-08ddea77eed5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 23:24:58.6964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zp9UTtFHtRHHEdUZ3DhGe9qQeSrMw2x+t/nR0QIEskMOvB26XU5zEDnMfQkF+y5a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9574
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 02, 2025 at 03:59:37PM -0600, Keith Busch wrote:
> On Tue, Sep 02, 2025 at 10:49:48PM +0200, Marek Szyprowski wrote:
> > On 19.08.2025 19:36, Leon Romanovsky wrote:
> > > @@ -87,8 +87,8 @@ static bool blk_dma_map_bus(struct blk_dma_iter *iter, struct phys_vec *vec)
> > >   static bool blk_dma_map_direct(struct request *req, struct device *dma_dev,
> > >   		struct blk_dma_iter *iter, struct phys_vec *vec)
> > >   {
> > > -	iter->addr = dma_map_page(dma_dev, phys_to_page(vec->paddr),
> > > -			offset_in_page(vec->paddr), vec->len, rq_dma_dir(req));
> > > +	iter->addr = dma_map_phys(dma_dev, vec->paddr, vec->len,
> > > +			rq_dma_dir(req), 0);
> > >   	if (dma_mapping_error(dma_dev, iter->addr)) {
> > >   		iter->status = BLK_STS_RESOURCE;
> > >   		return false;
> > 
> > I wonder where is the corresponding dma_unmap_page() call and its change 
> > to dma_unmap_phys()...
> 
> You can't do that in the generic layer, so it's up to the caller. The
> dma addrs that blk_dma_iter yield are used in a caller specific
> structure. For example, for NVMe, it goes into an NVMe PRP. The generic
> layer doesn't know what that is, so the driver has to provide the
> unmapping.

To be specific I think it is this hunk in another patch that matches
the above:

@@ -682,11 +682,15 @@ static void nvme_free_prps(struct request *req)
 {
        struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
        struct nvme_queue *nvmeq = req->mq_hctx->driver_data;
+       unsigned int attrs = 0;
        unsigned int i;
 
+       if (req->cmd_flags & REQ_MMIO)
+               attrs = DMA_ATTR_MMIO;
+
        for (i = 0; i < iod->nr_dma_vecs; i++)
-               dma_unmap_page(nvmeq->dev->dev, iod->dma_vecs[i].addr,
-                               iod->dma_vecs[i].len, rq_dma_dir(req));
+               dma_unmap_phys(nvmeq->dev->dev, iod->dma_vecs[i].addr,
+                               iod->dma_vecs[i].len, rq_dma_dir(req), attrs);


And it is functionally fine to split the series like this because
unmap_page is a nop around unmap_phys:

void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr, size_t size,
                 enum dma_data_direction dir, unsigned long attrs)
{
        if (unlikely(attrs & DMA_ATTR_MMIO))
                return;

        dma_unmap_phys(dev, addr, size, dir, attrs);
}
EXPORT_SYMBOL(dma_unmap_page_attrs);

Jason

