Return-Path: <linuxppc-dev+bounces-951-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 059A396B36D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 09:51:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzF6d1fmsz2y8r;
	Wed,  4 Sep 2024 17:51:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725436265;
	cv=none; b=HPDegqw+Ldl1wtNtDDdG7NeXJzWLXZxOCz4G7WTzdatUxrVfYFYjbGl2P4lwBgTV4lGzm9xjYL/+uKbauiDA8VZO3IHRFLQjieh/qQNJX/rWd4yeQOfNyBQIQ5VsCWEFGWYuDLn02qb7VDhGcJX+XQeRvI+zesX/73NucFUaECO9vtbWntOnuvUxJVTJCNutfiDTWqXDwIasjQA4vULAmIbR3wNbL0W7fWs+58iEHqPdHrobLZ+pQ1M6gLwobn/cZVhGFKrOLkudMnKFE73oZKwHrWq5E/D7DlNQerheVLSc+nMNPgXIUTwhAt7RSK2C8fXAXsLYhUKLurqOpTiugA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725436265; c=relaxed/relaxed;
	bh=AU1p1DXBVmXIl6YxYAEjEuw7v6nXJYuynqitO9fDnNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dbgtHts0RHLmW7by0ga5q1zDAQqwkNVJbeg11AJarGXcXRIwOmryCwI3w/soq99k3YK5c0T5XJng6y+2xidLocJRYjGsYUs7tczgezZANkFBD88cA9J+8q8NIEU1kYD6D3j4Y8n0mQjRwEyul9qr4DZ3tz6fwKGK8tMyOZWkxDeDoLeNfTIUhgXa0koKlQRwGuC1uzPbbHPo6HUg0HVBpsiE2bv1wGOu3DDcpIpJBWJaQhlCRCcGSFCe5bB8jihyq0s1m7wjzCUudzVIZ+Y/XnhbB50wYb5C33+OYhxHzhzD939KlIJgQ5op+RsfC0JXlgHSJF216Ue1X/wX8vYQHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzF6c6MQ2z2xYr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 17:51:03 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WzF6T6FRvz9sSC;
	Wed,  4 Sep 2024 09:50:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MyT5AqoNw1ah; Wed,  4 Sep 2024 09:50:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WzF6T53SRz9sS7;
	Wed,  4 Sep 2024 09:50:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D7618B77A;
	Wed,  4 Sep 2024 09:50:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id XVy8Rvp824KA; Wed,  4 Sep 2024 09:50:57 +0200 (CEST)
Received: from [192.168.234.246] (unknown [192.168.234.246])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EC5188B778;
	Wed,  4 Sep 2024 09:50:56 +0200 (CEST)
Message-ID: <64e74f4d-948d-442e-9810-69907915401c@csgroup.eu>
Date: Wed, 4 Sep 2024 09:50:56 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: make copy_to_kernel_nofault() not fault on user
 addresses
To: Omar Sandoval <osandov@osandov.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Benjamin Gray <bgray@linux.ibm.com>,
 "Christopher M. Riedl" <cmr@bluescreens.de>
Cc: Christoph Hellwig <hch@lst.de>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-um@lists.infradead.org, kernel-team@fb.com
References: <cover.1725223574.git.osandov@fb.com>
 <f0e171cbae576758d9387cee374dd65088e75b07.1725223574.git.osandov@fb.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <f0e171cbae576758d9387cee374dd65088e75b07.1725223574.git.osandov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 02/09/2024 à 07:31, Omar Sandoval a écrit :
> [Vous ne recevez pas souvent de courriers de osandov@osandov.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Omar Sandoval <osandov@fb.com>
> 
> I found that on x86, copy_to_kernel_nofault() still faults on addresses
> outside of the kernel address range (including NULL):
> 
>    # echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc
>    # echo g > /proc/sysrq-trigger
>    ...
>    [15]kdb> mm 0 1234
>    [   94.652476] BUG: kernel NULL pointer dereference, address: 0000000000000000
...
> 
> Note that copy_to_kernel_nofault() uses pagefault_disable(), but it
> still faults. This is because with Supervisor Mode Access Prevention
> (SMAP) enabled, do_user_addr_fault() Oopses on a fault for a user
> address from kernel space _before_ checking faulthandler_disabled().
> 
> copy_from_kernel_nofault() avoids this by checking that the address is
> in the kernel before doing the actual memory access. Do the same in
> copy_to_kernel_nofault() so that we get an error as expected:
> 
>    # echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc
>    # echo g > /proc/sysrq-trigger
>    ...
>    [17]kdb> mm 0 1234
>    kdb_putarea_size: Bad address 0x0
>    diag: -21: Invalid address
> 
> Signed-off-by: Omar Sandoval <osandov@fb.com>
> ---
>   mm/maccess.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/mm/maccess.c b/mm/maccess.c
> index 72e9c03ea37f..d67dee51a1cc 100644
> --- a/mm/maccess.c
> +++ b/mm/maccess.c
> @@ -61,6 +61,9 @@ long copy_to_kernel_nofault(void *dst, const void *src, size_t size)
>          if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
>                  align = (unsigned long)dst | (unsigned long)src;
> 
> +       if (!copy_kernel_nofault_allowed(dst, size))
> +               return -ERANGE;
> +
>          pagefault_disable();
>          if (!(align & 7))
>                  copy_to_kernel_nofault_loop(dst, src, size, u64, Efault);
> --
> 2.46.0
> 

This patch leads to the following errors on ppc64le_defconfig:

[    2.423930][    T1] Running code patching self-tests ...
[    2.428912][    T1] code-patching: test failed at line 395
[    2.429085][    T1] code-patching: test failed at line 398
[    2.429561][    T1] code-patching: test failed at line 432
[    2.429679][    T1] code-patching: test failed at line 435

This seems to be linked to commit c28c15b6d28a ("powerpc/code-patching: 
Use temporary mm for Radix MMU"), copy_from_kernel_nofault_allowed() 
returns false for the patching area.

Christophe

