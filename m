Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D440D93D08C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 11:41:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=erbBnHVt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVjS65w6kz3dBZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 19:41:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=erbBnHVt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVjRP6SNxz3cG3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 19:40:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5FE54CE1349;
	Fri, 26 Jul 2024 09:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9535FC32782;
	Fri, 26 Jul 2024 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721986830;
	bh=/W5kbKWSvcsVRYIH6lNhUURaeOalcNxprGj7xwqXc8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=erbBnHVtheMUAGs7sb6st1OpVR9FaIVHYj78yec90OKFphlkSZV5k/wAOzf9v7bHw
	 qD/B4sk/oLODwsgv3p0XiErsiTqRDrNBJUfunPPt2ly/fcLhz146SfXfrJeznvLkZe
	 U5MzHL6oELYwecQ5CE2FRGA7zc5ak6Om4kOHFE+xDor4Bpwaxj+6BMtxs9zpKRb0zj
	 t0frO2fOt1mK8tuZJlZLn78/gGZpvARM3U+4DMaFSKK7j8fCZBwVSU2h9+v0uuhWmf
	 doJp2N540bOFVoqeMi8DgOk/gCs4xM/TGYVOkNqWaGGBNobmAGDB5q2iYuCtHTHaiN
	 kQwqqR1cv6trg==
Date: Fri, 26 Jul 2024 12:40:03 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v2 00/25] mm: introduce numa_memblks
Message-ID: <ZqNu8zwjhiTkbpIB@kernel.org>
References: <20240723064156.4009477-1-rppt@kernel.org>
 <1D474894-F8AC-427B-8F90-5A6808E77CC5@nvidia.com>
 <6336C276-113E-4D93-A09E-13420A6438D8@nvidia.com>
 <231F6DF6-96C8-4149-92CF-4FC03C9FE357@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <231F6DF6-96C8-4149-92CF-4FC03C9FE357@nvidia.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 24, 2024 at 10:48:42PM -0400, Zi Yan wrote:
> On 24 Jul 2024, at 20:35, Zi Yan wrote:
> > On 24 Jul 2024, at 18:44, Zi Yan wrote:
> >>
> >> Hi,
> >>
> >> I have tested this series on both x86_64 and arm64. It works fine on x86_64.
> >> All numa=fake= options work as they did before the series.
> >>
> >> But I am not able to boot the kernel (no printout at all) on arm64 VM
> >> (Mac mini M1 VMWare). By git bisecting, arch_numa: switch over to numa_memblks
> >> is the first patch causing the boot failure. I see the warning:
> >>
> >> WARNING: modpost: vmlinux: section mismatch in reference: numa_add_cpu+0x1c (section: .text) -> early_cpu_to_node (section: .init.text)
> >>
> >> I am not sure if it is red herring or not, since changing early_cpu_to_node
> >> to cpu_to_node in numa_add_cpu() from mm/numa_emulation.c did get rid of the
> >> warning, but the system still failed to boot.
> >>
> >> Please note that you need binutils 2.40 to build the arm64 kernel, since there
> >> is a bug(https://sourceware.org/bugzilla/show_bug.cgi?id=31924) in 2.42 preventing
> >> arm64 kernel from booting as well.
> >>
> >> My config is attached.
> >
> > I get more info after adding earlycon to the boot option.
> > pgdat is NULL, causing issues when free_area_init_node() is dereferencing
> > it at first WARN_ON.
> >
> > FYI, my build is this series on top of v6.10 instead of the base commit,
> > where the series applies cleanly on top v6.10.
> 
> OK, the issue comes from that my arm64 VM has no ACPI but x86_64 VM has it,
> thus on arm64 VM numa_init(arch_acpi_numa_ini) failed in arch_numa_init()
> and the code falls back to numa_init(dummy_numa_init). In dummy_numa_init(),
> before patch 23 "arch_numa: switch over to numa_memblks", numa_add_memblk()
> from drivers/base/arch_numa.c is called on arm64, which unconditionally
> set 0 to numa_nodes_parsed. This is missing in the x86 version of
> numa_add_memblk(), which is now used by all arch. By adding the patch
> below, my arm64 kernel boots in the VM.
> 
> 
> diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> index 806550239d08..354f15b8d9b7 100644
> --- a/drivers/base/arch_numa.c
> +++ b/drivers/base/arch_numa.c
> @@ -279,6 +279,7 @@ static int __init dummy_numa_init(void)
>                 pr_err("NUMA init failed\n");
>                 return ret;
>         }
> +       node_set(0, numa_nodes_parsed);
> 
>         numa_off = true;
>         return 0;
> 
> 
> Feel free to add
> 
> Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
> 
> after you incorporate the fix.

Thanks a lot for testing, debugging and fixing! 
> 
> --
> Best Regards,
> Yan, Zi



-- 
Sincerely yours,
Mike.
