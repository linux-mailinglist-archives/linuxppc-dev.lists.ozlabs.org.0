Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDC818AD26
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 08:06:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jdHh0rR9zDr4d
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 18:06:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=miVDWU3+; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jdFD04dszDr68
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 18:04:31 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48jdF71sjtz9v1Md;
 Thu, 19 Mar 2020 08:04:27 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=miVDWU3+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id LNpYefN951gJ; Thu, 19 Mar 2020 08:04:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48jdF70XNZz9v1Mc;
 Thu, 19 Mar 2020 08:04:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584601467; bh=5ZZ9JpRLP71PK+VNpemb+Gegi8ltDnpAruGHqikdnkM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=miVDWU3+a2y0u275N9hD/wlPdJIb1qmEFxnWhWbDAcuzzhQKA62bOJRlcQS+0FgpJ
 1oDaIjZur3d9lpK8mGIRkzkhqA4W3uvhQ9x7BDYfoczEr1ShtNesHCpCKh7CmjNR3c
 w9QIjLFWO20jXxv/VZmy7eFG3M/ZUt7wHjFbPowk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E903D8B772;
 Thu, 19 Mar 2020 08:04:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NWMcTA98PEcE; Thu, 19 Mar 2020 08:04:27 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F89E8B769;
 Thu, 19 Mar 2020 08:04:26 +0100 (CET)
Subject: Re: [PATCH 2/4] hugetlbfs: move hugepagesz= parsing to arch
 independent code
To: Mike Kravetz <mike.kravetz@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20200318220634.32100-1-mike.kravetz@oracle.com>
 <20200318220634.32100-3-mike.kravetz@oracle.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <2ca058dc-47e6-1d08-154b-77d2cbe98e34@c-s.fr>
Date: Thu, 19 Mar 2020 08:04:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200318220634.32100-3-mike.kravetz@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "David S . Miller" <davem@davemloft.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Longpeng <longpeng2@huawei.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/03/2020 à 23:06, Mike Kravetz a écrit :
> Now that architectures provide arch_hugetlb_valid_size(), parsing
> of "hugepagesz=" can be done in architecture independent code.
> Create a single routine to handle hugepagesz= parsing and remove
> all arch specific routines.  We can also remove the interface
> hugetlb_bad_size() as this is no longer used outside arch independent
> code.
> 
> This also provides consistent behavior of hugetlbfs command line
> options.  The hugepagesz= option should only be specified once for
> a specific size, but some architectures allow multiple instances.
> This appears to be more of an oversight when code was added by some
> architectures to set up ALL huge pages sizes.
> 
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---
>   arch/arm64/mm/hugetlbpage.c   | 15 ---------------
>   arch/powerpc/mm/hugetlbpage.c | 15 ---------------
>   arch/riscv/mm/hugetlbpage.c   | 16 ----------------
>   arch/s390/mm/hugetlbpage.c    | 18 ------------------
>   arch/sparc/mm/init_64.c       | 22 ----------------------
>   arch/x86/mm/hugetlbpage.c     | 16 ----------------
>   include/linux/hugetlb.h       |  1 -
>   mm/hugetlb.c                  | 24 ++++++++++++++++++------
>   8 files changed, 18 insertions(+), 109 deletions(-)
> 

[snip]

> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 2f99359b93af..cd4ec07080fb 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3149,12 +3149,6 @@ static int __init hugetlb_init(void)
>   }
>   subsys_initcall(hugetlb_init);
>   
> -/* Should be called on processing a hugepagesz=... option */
> -void __init hugetlb_bad_size(void)
> -{
> -	parsed_valid_hugepagesz = false;
> -}
> -
>   void __init hugetlb_add_hstate(unsigned int order)
>   {
>   	struct hstate *h;
> @@ -3224,6 +3218,24 @@ static int __init hugetlb_nrpages_setup(char *s)
>   }
>   __setup("hugepages=", hugetlb_nrpages_setup);
>   
> +static int __init hugepagesz_setup(char *s)
> +{
> +	unsigned long long size;
> +	char *saved_s = s;
> +
> +	size = memparse(s, &s);

You don't use s after that, so you can pass NULL instead of &s and avoid 
the saved_s

> +
> +	if (!arch_hugetlb_valid_size(size)) {
> +		parsed_valid_hugepagesz = false;
> +		pr_err("HugeTLB: unsupported hugepagesz %s\n", saved_s);
> +		return 0;
> +	}
> +
> +	hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
> +	return 1;
> +}
> +__setup("hugepagesz=", hugepagesz_setup);
> +
>   static int __init default_hugepagesz_setup(char *s)
>   {
>   	unsigned long long size;
> 

Christophe
