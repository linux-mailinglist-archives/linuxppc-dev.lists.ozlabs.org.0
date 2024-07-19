Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 644DF937AFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 18:29:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQZrH2rGbz3fS0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 02:29:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQZqv1fTcz3cdy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jul 2024 02:28:56 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WQZn61R1mz6K7Fc;
	Sat, 20 Jul 2024 00:26:34 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 9E616140517;
	Sat, 20 Jul 2024 00:28:51 +0800 (CST)
Received: from localhost (10.48.157.16) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 19 Jul
 2024 17:28:50 +0100
Date: Fri, 19 Jul 2024 17:28:49 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 06/17] x86/numa: simplify numa_distance allocation
Message-ID: <20240719172849.000019a0@Huawei.com>
In-Reply-To: <20240716111346.3676969-7-rppt@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
	<20240716111346.3676969-7-rppt@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.157.16]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav
 Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 Jul 2024 14:13:35 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Allocation of numa_distance uses memblock_phys_alloc_range() to limit
> allocation to be below the last mapped page.
> 
> But NUMA initializaition runs after the direct map is populated and

initialization (one too many 'i's)

> there is also code in setup_arch() that adjusts memblock limit to
> reflect how much memory is already mapped in the direct map.
> 
> Simplify the allocation of numa_distance and use plain memblock_alloc().
> This makes the code clearer and ensures that when numa_distance is not
> allocated it is always NULL.
Doesn't this break the comment in numa_set_distance() kernel-doc?
"
 * If such table cannot be allocated, a warning is printed and further
 * calls are ignored until the distance table is reset with
 * numa_reset_distance().
"

Superficially that looks to be to avoid repeatedly hitting the
singleton bit at the top of numa_set_distance() as SRAT or similar
parsing occurs.

> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/x86/mm/numa.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> index 5e1dde26674b..ab2d4ecef786 100644
> --- a/arch/x86/mm/numa.c
> +++ b/arch/x86/mm/numa.c
> @@ -319,8 +319,7 @@ void __init numa_reset_distance(void)
>  {
>  	size_t size = numa_distance_cnt * numa_distance_cnt * sizeof(numa_distance[0]);
>  
> -	/* numa_distance could be 1LU marking allocation failure, test cnt */
> -	if (numa_distance_cnt)
> +	if (numa_distance)
>  		memblock_free(numa_distance, size);
>  	numa_distance_cnt = 0;
>  	numa_distance = NULL;	/* enable table creation */
> @@ -331,7 +330,6 @@ static int __init numa_alloc_distance(void)
>  	nodemask_t nodes_parsed;
>  	size_t size;
>  	int i, j, cnt = 0;
> -	u64 phys;
>  
>  	/* size the new table and allocate it */
>  	nodes_parsed = numa_nodes_parsed;
> @@ -342,16 +340,12 @@ static int __init numa_alloc_distance(void)
>  	cnt++;
>  	size = cnt * cnt * sizeof(numa_distance[0]);
>  
> -	phys = memblock_phys_alloc_range(size, PAGE_SIZE, 0,
> -					 PFN_PHYS(max_pfn_mapped));
> -	if (!phys) {
> +	numa_distance = memblock_alloc(size, PAGE_SIZE);
> +	if (!numa_distance) {
>  		pr_warn("Warning: can't allocate distance table!\n");
> -		/* don't retry until explicitly reset */
> -		numa_distance = (void *)1LU;
>  		return -ENOMEM;
>  	}
>  
> -	numa_distance = __va(phys);
>  	numa_distance_cnt = cnt;
>  
>  	/* fill with the default distances */

