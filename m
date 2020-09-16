Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B9A26BCB5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 08:21:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrqkT1MVNzDqDD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 16:21:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=DsBud3yN; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrqgK2lnBzDqHq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 16:19:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=fse+h8UCPDsleRNPufm6YCU5bALHyxaJ9NrZcm6xYM8=; b=DsBud3yN3zMNa+2ZYy1fFVo6t6
 b+xLAGAzKH9Op3myuxDOH7JrQPH0g+Y0wi6n+ZmdCfJDEFuI1PA6lRnb5zu1m3v0oVnWPalTEXpoR
 +cPDQORK6hBHtAvSCyJo73Vf8XmZldkrg44MW4H7Af+x98KfFOBoTOFz2XSHDD89QHpBlDGhK0Shf
 xV1vaRVt0cm5Pqc+4qL6sfRC5tITrJnPNZiSoW/YJrMC7ejuq8bHD3nCRM2fFzul+EysUkUv6U5Gi
 VZJI3Krd3r6uX5jTnPaJId+Hal8YM6cSwm68plBGaCxTBCQrn3fD+UjPSsggdbQ3Lt1b8Jvwiwk4j
 o6Kp8nMw==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIQmO-0006tb-Lm; Wed, 16 Sep 2020 06:18:57 +0000
Subject: Re: [PATCH] Doc: admin-guide: Add entry for kvm_cma_resv_ratio kernel
 param
To: sathnaga@linux.vnet.ibm.com, linux-doc@vger.kernel.org
References: <20200916061130.723411-1-sathnaga@linux.vnet.ibm.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <28eb9747-e4cc-424c-1f16-c68ed165b36a@infradead.org>
Date: Tue, 15 Sep 2020 23:18:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200916061130.723411-1-sathnaga@linux.vnet.ibm.com>
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

On 9/15/20 11:11 PM, sathnaga@linux.vnet.ibm.com wrote:
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
> Signed-off-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a1068742a6df..9cb126573c71 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -599,6 +599,15 @@
>  			altogether. For more information, see
>  			include/linux/dma-contiguous.h
>  
> +        kvm_cma_resv_ratio=n
> +                        [PPC]

You can put [PPC] on the line above.

> +                        Reserves given percentage from system memory area for
> +                        contiguous memory allocation for KVM hash pagetable
> +                        allocation.
> +                        Bydefault it reserves 5% of total system memory.

			   By default

> +                        Format: <integer>
> +                        Default: 5
> +

and please use tabs for indentation, not all spaces.

>  	cmo_free_hint=	[PPC] Format: { yes | no }
>  			Specify whether pages are marked as being inactive
>  			when they are freed.  This is used in CMO environments
> 

Entries in kernel-parameters.txt should be sorted into dictionary order,
so please put that with the other kvm parameters.

thanks.
-- 
~Randy

