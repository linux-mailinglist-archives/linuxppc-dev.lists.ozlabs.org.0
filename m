Return-Path: <linuxppc-dev+bounces-3588-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 991A79DADE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2024 20:32:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xz8hy6G2Fz2y8p;
	Thu, 28 Nov 2024 06:32:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732735938;
	cv=none; b=mEE6rVC/7nkWInuH+1Zf5j1YZ17LMypQfZhvaUt09gFaMG1HD7txn7zIW8ofWcB17xW7I/vYFRtQT++p8A/0VJLlTKWgzoPVOrMABzcrld2ZnMzDx5s4rms7VnPi63Q2CFFGqe2KmHnd6TN9lv86De76SApu+E6WfuLi3y+VlXalmF/FdZ6iquwQvOkBMsxwgBAw8wCvXb+AJi6/9sqTO6PmYWWp5D3vV/UnatXmTen3AlewLnN73KbGL+/Yy2KR1EAaLXBjivu1h9pVWcJE/8oy0EX6+wc7iJZ0tL5fIpylB++9i1scJeDfkOMSrt88KHBu/z1xNXpFvgPA+u+BTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732735938; c=relaxed/relaxed;
	bh=wYD9+WzWy/AtpAhh9/Y90J+SPB0CH5V5FKAn0rVlHi0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PbiEM/ZNHEvpGYzaFccZ7HDWB3k8ogKAnFpQ8zQhxebv70Mw9zpINzhYLE92RG4aiXjVge4WlsonviUUyxgGrWWFMMJiiEQdbtvX7SlcBCshc+EUEnNkLt/k2GVwP1l73LDYEqfp3tf8ZWbP/o4wlcbvfbTKPMOUwmsRjpsRnsPUHnmfujali0Jo72WJf1lxP2XXGpW8ebros/Xmdn1pDAJ2cKVRUq4vgoMStofb361ZcZ64hkT8rkbYdd7w1xgxiC0MD/CcGe7wl8t8KAiGXfLKlqtLZA1RGcwLxCvMUGv0IBX+dUBJHZNBttfhGalTVXOqye6ZWJYCZFnzPpv8xA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X2BtrIqN; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X2BtrIqN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xz8hw5K3yz2xs0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2024 06:32:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25421A439F3;
	Wed, 27 Nov 2024 19:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD69C4CED2;
	Wed, 27 Nov 2024 19:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732735930;
	bh=xrciW+EMhZ5UEofbJw9NwB4YNk6WJ7ZsUg3ugalAKtY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X2BtrIqNGPOvV+49M5YnEnvMfq90m+ylhD7PzWNtlQWXRcWLiIC9o7ibIu7Z+6NCF
	 kcXzlV4NXbHYexopnI8wyMqZtXl1aARG1Kv+1kHo2QdWtEH8r51A6kx0Z+b8YMEuGQ
	 KkVWB5pfPFETZ3jygkOvTt1oTUJ7ox8ovqX6d1E+iA+5p2Dg3oRun7qGKNbz7lmsz9
	 P2yGA8boYanYTYFxQR6QsePoSp98SjRizDnHD/Y6HoJ2E4HX1u+AiXq7pnGqhQjajY
	 UFL0t9n5dlc0Yh9Rql7BGoHCScG0i7PhlQ+71XDRGrapyLXfaRB16QrJ7c3W0qJT2C
	 zsuLVCEMA8n/A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tGNlf-00GLsr-Kw;
	Wed, 27 Nov 2024 19:32:07 +0000
Date: Wed, 27 Nov 2024 19:32:06 +0000
Message-ID: <867c8ov5ft.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	nvdimm@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 24/26] arch_numa: switch over to numa_memblks
In-Reply-To: <20240807064110.1003856-25-rppt@kernel.org>
References: <20240807064110.1003856-1-rppt@kernel.org>
	<20240807064110.1003856-25-rppt@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
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
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: rppt@kernel.org, linux-kernel@vger.kernel.org, agordeev@linux.ibm.com, andreas@gaisler.com, akpm@linux-foundation.org, arnd@arndb.de, bp@alien8.de, catalin.marinas@arm.com, christophe.leroy@csgroup.eu, dan.j.williams@intel.com, dave.hansen@linux.intel.com, david@redhat.com, davem@davemloft.net, dave@stgolabs.net, gregkh@linuxfoundation.org, hca@linux.ibm.com, chenhuacai@kernel.org, mingo@redhat.com, jiaxun.yang@flygoat.com, glaubitz@physik.fu-berlin.de, jonathan.cameron@huawei.com, corbet@lwn.net, mpe@ellerman.id.au, palmer@dabbelt.com, rafael@kernel.org, robh@kernel.org, samuel.holland@sifive.com, tsbogend@alpha.franken.de, tglx@linutronix.de, gor@linux.ibm.com, will@kernel.org, ziy@nvidia.com, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, linux-s390@vger.k
 ernel.org, linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, nvdimm@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org, Jonathan.Cameron@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Mike,

Sorry for reviving a rather old thread.

On Wed, 07 Aug 2024 07:41:08 +0100,
Mike Rapoport <rppt@kernel.org> wrote:
> 
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Until now arch_numa was directly translating firmware NUMA information
> to memblock.
> 
> Using numa_memblks as an intermediate step has a few advantages:
> * alignment with more battle tested x86 implementation
> * availability of NUMA emulation
> * maintaining node information for not yet populated memory
> 
> Adjust a few places in numa_memblks to compile with 32-bit phys_addr_t
> and replace current functionality related to numa_add_memblk() and
> __node_distance() in arch_numa with the implementation based on
> numa_memblks and add functions required by numa_emulation.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Tested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> [arm64 + CXL via QEMU]
> Acked-by: Dan Williams <dan.j.williams@intel.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/base/Kconfig       |   1 +
>  drivers/base/arch_numa.c   | 201 +++++++++++--------------------------
>  include/asm-generic/numa.h |   6 +-
>  mm/numa_memblks.c          |  17 ++--
>  4 files changed, 75 insertions(+), 150 deletions(-)
>

[...]

>  static int __init numa_register_nodes(void)
>  {
>  	int nid;
> -	struct memblock_region *mblk;
> -
> -	/* Check that valid nid is set to memblks */
> -	for_each_mem_region(mblk) {
> -		int mblk_nid = memblock_get_region_node(mblk);
> -		phys_addr_t start = mblk->base;
> -		phys_addr_t end = mblk->base + mblk->size - 1;
> -
> -		if (mblk_nid == NUMA_NO_NODE || mblk_nid >= MAX_NUMNODES) {
> -			pr_warn("Warning: invalid memblk node %d [mem %pap-%pap]\n",
> -				mblk_nid, &start, &end);
> -			return -EINVAL;
> -		}
> -	}
>  

This hunk has the unfortunate side effect of killing my ThunderX
extremely early at boot time, as this sorry excuse for a machine
really relies on the kernel recognising that whatever NUMA information
the FW offers is BS.

Reverting this hunk restores happiness (sort of).

FWIW, I've posted a patch with such revert at [1].

Thanks,

	M.

[1] https://lore.kernel.org/r/20241127193000.3702637-1-maz@kernel.org

-- 
Without deviation from the norm, progress is not possible.

