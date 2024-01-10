Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 775E9829E01
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 16:54:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=ZQ9oPBt7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9C6X060dz3cS0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 02:54:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=ZQ9oPBt7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9C5g0NyCz30g6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jan 2024 02:53:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2DC78B81B7D;
	Wed, 10 Jan 2024 15:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46889C433F1;
	Wed, 10 Jan 2024 15:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1704902032;
	bh=VExTAiazsv1g0aY0B55Q7g+sXT0qRACvGzmBLH2Jgb0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZQ9oPBt7bDzRZBHYow8LOiyL91eqgYQn2ntahsGax2Fw+QLnKGR9Nbjjnwdpv6qYZ
	 3n2yxOVXeMsbtaRCMeqbY8oiXEkYun5nZoB84f34g4rSZAygKfeCEjW+h9l436TnuM
	 VUd8g7DUaP6AGF7KPd9Rf/qwlupWUUF4ecYhgFOQ=
Date: Wed, 10 Jan 2024 07:53:51 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Donet Tom <donettom@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/1] selftests: mm: hugepage-vmemmap fails on 64K page
 size systems.
Message-Id: <20240110075351.f4b6f43e31629ddcb96503cc@linux-foundation.org>
In-Reply-To: <3b3a3ae37ba21218481c482a872bbf7526031600.1704865754.git.donettom@linux.vnet.ibm.com>
References: <3b3a3ae37ba21218481c482a872bbf7526031600.1704865754.git.donettom@linux.vnet.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-kselftest@vger.kernel.org, Aneesh Kumar <aneesh.kumar@linux.ibm.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Geetika Moolchandani <geetika@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(cc Muchun)
On Wed, 10 Jan 2024 14:03:35 +0530 Donet Tom <donettom@linux.vnet.ibm.com> wrote:

> The kernel sefltest mm/hugepage-vmemmap fails on architectures
> which has different page size other than 4K. In hugepage-vmemmap
> page size used is 4k so the pfn calculation will go wrong on systems
> which has different page size .The length of MAP_HUGETLB memory must
> be hugepage aligned but in hugepage-vmemmap map length is 2M so this
> will not get aligned if the system has differnet hugepage size.
> 
> Added  psize() to get the page size and default_huge_page_size() to
> get the default hugepage size at run time, hugepage-vmemmap test pass
> on powerpc with 64K page size and x86 with 4K page size.
> 
> Result on powerpc without patch (page size 64K)
> *# ./hugepage-vmemmap
> Returned address is 0x7effff000000 whose pfn is 0
> Head page flags (100000000) is invalid
> check_page_flags: Invalid argument
> *#
> 
> Result on powerpc with patch (page size 64K)
> *# ./hugepage-vmemmap
> Returned address is 0x7effff000000 whose pfn is 600
> *#
> 
> Result on x86 with patch (page size 4K)
> *# ./hugepage-vmemmap
> Returned address is 0x7fc7c2c00000 whose pfn is 1dac00
> *#
> 
> Signed-off-by: Donet Tom <donettom@linux.vnet.ibm.com>
> Reported-by : Geetika Moolchandani (geetika@linux.ibm.com)
> Tested-by : Geetika Moolchandani (geetika@linux.ibm.com)

I'll add 

Fixes: b147c89cd429 ("selftests: vm: add a hugetlb test case")
Cc: <stable@vger.kernel.org>

> 
> diff --git a/tools/testing/selftests/mm/hugepage-vmemmap.c b/tools/testing/selftests/mm/hugepage-vmemmap.c
> index 5b354c209e93..894d28c3dd47 100644
> --- a/tools/testing/selftests/mm/hugepage-vmemmap.c
> +++ b/tools/testing/selftests/mm/hugepage-vmemmap.c
> @@ -10,10 +10,7 @@
>  #include <unistd.h>
>  #include <sys/mman.h>
>  #include <fcntl.h>
> -
> -#define MAP_LENGTH		(2UL * 1024 * 1024)
> -
> -#define PAGE_SIZE		4096
> +#include "vm_util.h"
>  
>  #define PAGE_COMPOUND_HEAD	(1UL << 15)
>  #define PAGE_COMPOUND_TAIL	(1UL << 16)
> @@ -39,6 +36,9 @@
>  #define MAP_FLAGS		(MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB)
>  #endif
>  
> +static size_t pagesize;
> +static size_t maplength;
> +
>  static void write_bytes(char *addr, size_t length)
>  {
>  	unsigned long i;
> @@ -56,7 +56,7 @@ static unsigned long virt_to_pfn(void *addr)
>  	if (fd < 0)
>  		return -1UL;
>  
> -	lseek(fd, (unsigned long)addr / PAGE_SIZE * sizeof(pagemap), SEEK_SET);
> +	lseek(fd, (unsigned long)addr / pagesize * sizeof(pagemap), SEEK_SET);
>  	read(fd, &pagemap, sizeof(pagemap));
>  	close(fd);
>  
> @@ -86,7 +86,7 @@ static int check_page_flags(unsigned long pfn)
>  	 * this also verifies kernel has correctly set the fake page_head to tail
>  	 * while hugetlb_free_vmemmap is enabled.
>  	 */
> -	for (i = 1; i < MAP_LENGTH / PAGE_SIZE; i++) {
> +	for (i = 1; i < maplength / pagesize; i++) {
>  		read(fd, &pageflags, sizeof(pageflags));
>  		if ((pageflags & TAIL_PAGE_FLAGS) != TAIL_PAGE_FLAGS ||
>  		    (pageflags & HEAD_PAGE_FLAGS) == HEAD_PAGE_FLAGS) {
> @@ -106,18 +106,25 @@ int main(int argc, char **argv)
>  	void *addr;
>  	unsigned long pfn;
>  
> -	addr = mmap(MAP_ADDR, MAP_LENGTH, PROT_READ | PROT_WRITE, MAP_FLAGS, -1, 0);
> +	pagesize  = psize();
> +	maplength = default_huge_page_size();
> +	if (!maplength) {
> +		printf("Unable to determine huge page size\n");
> +		exit(1);
> +	}
> +
> +	addr = mmap(MAP_ADDR, maplength, PROT_READ | PROT_WRITE, MAP_FLAGS, -1, 0);
>  	if (addr == MAP_FAILED) {
>  		perror("mmap");
>  		exit(1);
>  	}
>  
>  	/* Trigger allocation of HugeTLB page. */
> -	write_bytes(addr, MAP_LENGTH);
> +	write_bytes(addr, maplength);
>  
>  	pfn = virt_to_pfn(addr);
>  	if (pfn == -1UL) {
> -		munmap(addr, MAP_LENGTH);
> +		munmap(addr, maplength);
>  		perror("virt_to_pfn");
>  		exit(1);
>  	}
> @@ -125,13 +132,13 @@ int main(int argc, char **argv)
>  	printf("Returned address is %p whose pfn is %lx\n", addr, pfn);
>  
>  	if (check_page_flags(pfn) < 0) {
> -		munmap(addr, MAP_LENGTH);
> +		munmap(addr, maplength);
>  		perror("check_page_flags");
>  		exit(1);
>  	}
>  
>  	/* munmap() length of MAP_HUGETLB memory must be hugepage aligned */
> -	if (munmap(addr, MAP_LENGTH)) {
> +	if (munmap(addr, maplength)) {
>  		perror("munmap");
>  		exit(1);
>  	}
> -- 
> 2.43.0
