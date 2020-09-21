Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CD8272E2E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 18:47:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw9MX61J8zDqTV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 02:47:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=SWjERXJF; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw8HH53hkzDqnv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 01:58:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=Br0UNVJe+Ev8cjKbRyN9LsJUKEZ9LG0bn+D8b/Qg9zo=; b=SWjERXJFhFEJH0lY46f34q+9oU
 vq74TEbEiWNWWoKzmvHh1PqERulc8ABD/2ghgG5DwgGiRNfujzlKgQIkT15zQ5UzbS6TJh+8GbjQ5
 svc1PjoRSCHzX9SFxCaWnocjW2KiQZx9QqLumxVQdo09x7GfDB5QPMWvKbyeImqK4XQnoMHH8wwpT
 5qpgL6zAox9JUXP08NvZdJpLq+66Cujskyow5xM/ulsfZk81wyg6mz/TN+RxVVj8OK3RdmqLiRHM5
 DYJrSLJPU2imFQoqwV/W/Ep8N8afm+rV4uGQ1FBog/WDTNhKpelzDF1WvAacqp38cRb5RZ4T3VTH/
 iwwhQk+w==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKOCb-00074H-0l; Mon, 21 Sep 2020 15:58:05 +0000
Subject: Re: [PATCH V2] Doc: admin-guide: Add entry for kvm_cma_resv_ratio
 kernel param
To: sathnaga@linux.vnet.ibm.com, linux-doc@vger.kernel.org
References: <20200921090220.14981-1-sathnaga@linux.vnet.ibm.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <82d06ba5-592c-1f19-aaae-a1f7b4041c7f@infradead.org>
Date: Mon, 21 Sep 2020 08:58:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921090220.14981-1-sathnaga@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/21/20 2:02 AM, sathnaga@linux.vnet.ibm.com wrote:
> From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> 
> Add document entry for kvm_cma_resv_ratio kernel param which
> is used to alter the KVM contiguous memory allocation percentage
> for hash pagetable allocation used by hash mode PowerPC KVM guests.
> 
> Cc: linux-kernel@vger.kernel.org
> Cc: kvm-ppc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>

Hi,

> ---
> 
> V2: 
> Addressed review comments from Randy.
> 
> V1: https://lkml.org/lkml/2020/9/16/72

In reply to V1, I didn't add a Reviewed-by: tag, but I can now.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/admin-guide/kernel-parameters.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a1068742a6df..932ed45740c9 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2258,6 +2258,14 @@
>  			[KVM,ARM] Allow use of GICv4 for direct injection of
>  			LPIs.
>  
> +	kvm_cma_resv_ratio=n [PPC]
> +			Reserves given percentage from system memory area for
> +			contiguous memory allocation for KVM hash pagetable
> +			allocation.
> +			By default it reserves 5% of total system memory.
> +			Format: <integer>
> +			Default: 5
> +
>  	kvm-intel.ept=	[KVM,Intel] Disable extended page tables
>  			(virtualized MMU) support on capable Intel chips.
>  			Default is 1 (enabled)
> 

thanks.
-- 
~Randy

