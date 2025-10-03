Return-Path: <linuxppc-dev+bounces-12658-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F8DBB7857
	for <lists+linuxppc-dev@lfdr.de>; Fri, 03 Oct 2025 18:18:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cdYkP2fw6z3d7n;
	Sat,  4 Oct 2025 02:18:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c101::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759508317;
	cv=pass; b=aXN77UAjJHGx+bLFrjv6CaewBTe8juETnW+W6o9alSgXRY9iDPQKnL3R3Zt+sFEu4/yRltIin7DPQPPMLhj0eFwygUds2GnyvuRzZPmGfumD0M74pvjjol4PvtOW5QKVHfZ6qcm/j5buXQXwJoXEFTRWPHOl3Ze5uN/26/hJXsryTNb0Ty5UJGcNkEtz8izRtzf8mW3kZ8wNqaTo8hBvB/gHtuMRDfTk2jh4RZbhjPTbJZz6LkgQ6k2/28MrIa1lO4pBVVRAR0HCEwhYL1U4LuXot4Q6sKxPHa6Y5Ku4hwN+iT/Hj+Z9F4VBsr+XMdQ39NzdNnf7kTQBIRJysRQGjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759508317; c=relaxed/relaxed;
	bh=9V49pYcr+0eeDSdeFjgDw9UEyVFhz0t2sXRuoEevw2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PlDYq8GPWeTxFg8D2Bs9BnZsMzWcg3+iyIUKe9UbYeh8LVqO13B1599EuTs3obqgDpXYnVYfFrp7d5k8SVI4eviwGpaPoMlaAC7b3NnBqrfWq7uvFfKkJImqk4NwY08m7fGwXRZKzfCQuenbH0xl1CJRiFa0RN3QKPY6Tmz0cbTpks2iSOqwXWZUzcFn2ixegItVnTnxGDUMCrCskUmkrzsSgcf6zfJl2OvzhFR0tYTyCZWrreYpYQ/fxPkkWKazRQMeb+CVAKYOrBTnc7mzRcK3bpbedblA73uNYBgAbAEOnR8OvoPpfeOnLKBABJ0zWQykw3xslm2VxmMXGA6IPg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bVpgAKEr; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c101::7; helo=bl0pr03cu003.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bVpgAKEr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c101::7; helo=bl0pr03cu003.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazlp170120007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c101::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cdYkN4fT0z3dBK
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Oct 2025 02:18:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZAxt1ZCmoaBU2MVKHMAe+JANSRjsCrK09Di8IeXmFwNw5uorYn4if2b1ZCp1Wz6RjM99z3oGAxsOl2LkfAOyffBAglZS+P1Fqy56vvNj+if7XtxiCc+vGjnJPt1RI8vPBQYpEX5LqifpRmjPhi3tD1npIVu43pLqpgB3OHwpw+YM6WtEi2Kk2p5yuPnN1pmkN5AaytJML/8B3H0c9DiFBTWCbZFi9/Y59LIEE9n1LFI1fR1SQf9FxLS1GN+P944EOrrcJEXdBHifMmLMWK9/gFB290akGNreF0C1IZzemRLGOhx3oNxzixC6N//2PtO57bRWajj644Q3URc1eji3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9V49pYcr+0eeDSdeFjgDw9UEyVFhz0t2sXRuoEevw2I=;
 b=JxIJAcUeQdOvByLsMQyUn5Ta0P4YaSGR0JJhrUUG6EGM4MasGYtqHP8xhcCEyQLj6cFAb/C8rUtO/B6pGc3GcdApIzv8Vvc7L/lUg7oR2s2QFL3NKL0Uownqd6IlqAn9tN09AAIjc/IVflbBNe2fhetVZM3JSVnZAsxpFemeVezF0QjnL7u3cNWHTBnPbzk9RDyuXEkLIqtVhlcYzzhTD2qxnoZSn/oj8lDFoSodhO/G4Zl/kS+aTEKmFrV44SUSB7Az3Xyp3yNqUtXcoiAqqmxKqFGqjcJDZt0WE86GA3pvk1GlsmypJxdq4ZAgi3ToqtZniS+otW1wcN+Um6KwyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9V49pYcr+0eeDSdeFjgDw9UEyVFhz0t2sXRuoEevw2I=;
 b=bVpgAKErgW/ekPafD5ASNIo3c89Y1EQZD4JBqzZvDzqItk4olyp+kAmvSJA1cMN6nN3lw+S891iLx73ENunLZxiK4hV6uRuExfgwEdwWw2crXpltjyaiT0Jv19RZI0Q4oeZJmOOHdZ0S3UP+jO0lbZOuGolvh/XQ8Qm8usPWC79Xk6VDnZyov423g+UTfixdd8M7dgLJxioAy3SlqCA271a2OqpQVBVJxuj8Y2G377YV9UGlIueqEXpxVQredGDl8hMk9Spg50IMEHG1IMjh28uBjTslJPjXui5plGwMtPmE24RzVAlOtTfPK+WGUb/SpAY3Sj8sGY1lfTnjZYhKMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by CYXPR12MB9280.namprd12.prod.outlook.com (2603:10b6:930:e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 16:18:28 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 16:18:28 +0000
Date: Fri, 3 Oct 2025 13:18:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>, iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev, x86@kernel.org,
	xen-devel@lists.xenproject.org, Magnus Lindholm <linmag7@gmail.com>
Subject: Re: [PATCH v1 9/9] dma-mapping: remove unused map_page callback
Message-ID: <20251003161825.GH3360665@nvidia.com>
References: <cover.1759071169.git.leon@kernel.org>
 <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>
X-ClientProxiedBy: BL1PR13CA0148.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::33) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|CYXPR12MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: 55fe7add-e739-4cd4-94fa-08de02987c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8HAa5uboeD1h6ARLZdwtCq9KRch2abHjXiw5asWTL4fhWGYHAm4C0BTqRq/O?=
 =?us-ascii?Q?dmtk0tB2KyqGE2l63Bf1irS8tAvd7JAONGy3x8jKh+XpIoIHTlNMTOMJpJTf?=
 =?us-ascii?Q?P18cschd/k74/bQqLgkfSsR/uqmhgxokX72ei7mbaj7ImypIqf0wvzYGT1Q6?=
 =?us-ascii?Q?fne8iZi9nWUUf2z7W+ecp6T/Llx3rWsGuwWX4ggTCpCuem1FqMAo4eWE4Moj?=
 =?us-ascii?Q?VddJzYxOz+oXc1VwCjrdjPIH01n90hxRhozWwYuR23i5TbtGCbX30FaumXCB?=
 =?us-ascii?Q?DYna2zeW98EgdY7uMK6CI1vxhzuO9f3PMWdqe2MvbYR4/5Vn8f3ldsBBFoxS?=
 =?us-ascii?Q?aAhDSiY6X1+H0j+Q8TlQM6KNfgeYBbeJB4Y09C7VQ5chRUlDPA3zlLVybnF3?=
 =?us-ascii?Q?CLjmr4spZSEuiQKDDzQbqDOOIAgVoh6f0yuKf5b3q475zkN1IAYnmBLWzhCg?=
 =?us-ascii?Q?WjnBwaqHqztih+129m4uifvk4daAhcbvDoUmQuKUN3tp83tSxWWA3Rs03pSv?=
 =?us-ascii?Q?WdDuEdtiB7LwZguIBr2tMHbPOQ94hkC6P5pbrn8RsHcXsX64VscByYt3i9Le?=
 =?us-ascii?Q?qEMjGuOxcKChDO4jeRwHJbJhetiVh1TWJeq03p5UdzXyXfDBeSRULFz4/Qp9?=
 =?us-ascii?Q?841h+wmQVejd5gNnSL/EYGc0UelHLTgHsFtvBakldWIQgjLh//bUfzW7c97W?=
 =?us-ascii?Q?UideQODf4OJv52ZBEne8IJgY4EhY8oPAOLma13QkczLzPKdUU8CUNZIqP/ov?=
 =?us-ascii?Q?JhWIAHkisSnr3pAm+Hp2/8ku10ueekdPlqZXxRdCiAMLDEFUU6+3PLE0xQcd?=
 =?us-ascii?Q?OWkMy2X8CLJ0O3xkKGmai7AOleY1LXHw/ObSc5dlf3koyBRkWDPSVFt1f3zC?=
 =?us-ascii?Q?z5UIjd84XikhBpavxdQexAO2sPD8otYE/LNJCqRpClURAoU2cPAHYLnYxroM?=
 =?us-ascii?Q?2l0pKWGFYmmF4RiE0v21zyh2evvtCIJGe9Dg5XZi/jWf3RGOH8Z/+tFJJYi2?=
 =?us-ascii?Q?w7J2+EJw+krm+1KLWqtYzUquw4gsHeA7vMG6QKg94zTlUN1EqbcSkd2ykYa4?=
 =?us-ascii?Q?NaS90dymt7sLrGFi9hnyMAxRt96LrBU/Sm6MGyJH1QKXBITIA2kFwc3cabd1?=
 =?us-ascii?Q?AC8XFT2IBmnJ4ufPvCoMdi77iiKMmqO8VUeIV1FY+jkbQPkJhuHIM2DjM9WJ?=
 =?us-ascii?Q?vPaPTfX0cAFMieY2mY1+VGKXK2J39+HTd8fcET/wkyrfkmQdzaMLNqjHkOjU?=
 =?us-ascii?Q?nIWi+ioLMKsiASDeFnLquC9qPwiZvnUtimGYuoRhbQY3Dv/IOP8QX3f6Tu+w?=
 =?us-ascii?Q?gN8IGXlG+V2qT9LCHEwIHdpQ0Qkr3NDo71/LG4J3hiJQhDVHtfsatxXJrvYj?=
 =?us-ascii?Q?/eyJj2z7+h0z5om6lwDXeG6Z2ETBco+YTBrvEiHq2qtFALgwnD+wKUaaQYql?=
 =?us-ascii?Q?Mv6JxRFw3K0l+Ck/M1ZYFF6mISsuAky3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5757.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tJqu5HQWfVC576vdptBhQXSrPx14A7GicND2ojHAr9VkoWgx6aO9YKPabKXu?=
 =?us-ascii?Q?1XBQo8J7HGUPKPahD55FQQZG1JeiLZ6Vfwn/akyM8KF2DP1I+ho/EDYflZaz?=
 =?us-ascii?Q?GTng2DrKMn83xenHUnKDfS6LGzYqDwATpnblcigs1DEFk+dr4zbCgH5C+4Yl?=
 =?us-ascii?Q?iIWCBbtaDiQV7aO07dJiLEMLABl59SZFZlch56dq/9YNYZuCuGX2uJYyygf9?=
 =?us-ascii?Q?ikJg4lIgWvpeO/g9N9shdoD8XRql7fX85Uc3h0RsA1iNsPvvXIH9SqICuQu2?=
 =?us-ascii?Q?kcShlpCHhSDNQg5SWMb/PMKiAp6tbzO/skw+mveU6L8CIHbkYSEEH3c9TrNT?=
 =?us-ascii?Q?MWwShe332HFl00f1tK90tNUCl1vEGGBjXMVzE3VdJS7VHLYUSCEZNg+eVZ3O?=
 =?us-ascii?Q?pyVcqWnXxJG0cjGIdBRgkTO/p4DT7bFCf0obVQ5BbScSDs170C+TQY8aTAQC?=
 =?us-ascii?Q?xKm4UXedGymG8XOD1W1HdWa1Wsp+gL++/DdBT6yvR7L/N1BLmsXcpcZcOOwM?=
 =?us-ascii?Q?A82Zt+yMu/Up4GDw3eQ0vzhY/rqRkCvlYmoO616eGAQ7AE8CR7wBzClI4Rda?=
 =?us-ascii?Q?G+SnBcB+4DT6uujPboWDt3p+d1r7APKQxzWeKhJnhOhsiHRaG1Z6Hv63N1Wy?=
 =?us-ascii?Q?QOVqA8GvvQu/uxlm6Lz3NFFAGYr2j8LSw/b3j/I5PM8vXIhBDODKQDBUanaL?=
 =?us-ascii?Q?jic+jOUwcC4yAG6VfnKuLxRACpony5gMh7nTWm0xNkcn8BYMRiFxbGZI1+B+?=
 =?us-ascii?Q?+epFdz9h666xRcYSlhyOhYJb8ANg8AsNkbGiK//r/EaVnsPsKoQo0DwPF1ET?=
 =?us-ascii?Q?gUskWv/BtGlh92sp2hmq6JKoyCPp80iwvtAgFYcYld3zUvKEaDpgjw9ulEbg?=
 =?us-ascii?Q?s7BsdB/vkNhTHC+4sTWJaTroR01Ayh+IBtKZ3gAD1mpH664k6+3vq/eXPL1J?=
 =?us-ascii?Q?0qQxxKLLaksBSNyj970aVMqJ3Op4iPbf0sfxeeY0aN9KS1VwdiVTw555M4gB?=
 =?us-ascii?Q?KUUwxc/RZIe/5Gs7xnkHcY26PkCsIndKKCS+OFrFzqXPA7W60E/a8bQduBUw?=
 =?us-ascii?Q?DGMXPFMUkH90OvPo3tqHlFhIwl+lJhwYTnx/uaN8U2WGzkk7fxfohA4sD+Jq?=
 =?us-ascii?Q?5lhWH39Fou9Cd7Hsb3gMDgBnR8Co3n6U8WxD6cGRxjBnGgCMqNXR7Fk6An8C?=
 =?us-ascii?Q?FLuuLY6nz84JG8UoHLC++BM//3Ssz6Q1wAshNVXvx57XfzqEV1yG6TvHD2Hx?=
 =?us-ascii?Q?7KzTLpe+nlZ4wxYKhfBUaaiKs95yUYwQfLU5u4qeiAbTdrpCXwQfGcXn25JD?=
 =?us-ascii?Q?OZZtRrpgx8r4smqSBVcAZXaCUFE0CfUDWe7+2cEh0unZzcggQHvYklnLJiMF?=
 =?us-ascii?Q?/reTOfEjSYOT1KfqwDQwLkCAsNi7CyfJ0fRRMVLNbieVijVmJ25YGTniHvho?=
 =?us-ascii?Q?Qsn+tPFr7dW1aAUYMM8CpeZh+hnsYA2zqdo8snWiobGyvFefrU+yNBDsqXsf?=
 =?us-ascii?Q?+aaXM9JoVHxDYJ1ZBC8ZRmLsEEVedEmbP5vaLqGMN6rF0JDiVMFPJM5dr0lZ?=
 =?us-ascii?Q?dH24wRIoU7PkZZjJZoI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55fe7add-e739-4cd4-94fa-08de02987c81
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 16:18:28.2119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JtzAxDmQJNnADOiQAKtwe+/YqCcJjOti1yS0z8wf0TWQHhO0Uypjly9OUjPMTlr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9280
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Sep 28, 2025 at 06:02:29PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> After conversion of arch code to use physical address mapping,
> there are no users of .map_page() and .unmap_page() callbacks,
> so let's remove them.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  include/linux/dma-map-ops.h |  7 -------
>  kernel/dma/mapping.c        | 12 ------------
>  kernel/dma/ops_helpers.c    |  8 +-------
>  3 files changed, 1 insertion(+), 26 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

