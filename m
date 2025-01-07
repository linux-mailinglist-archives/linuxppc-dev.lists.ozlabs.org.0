Return-Path: <linuxppc-dev+bounces-4772-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F69A03F69
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 13:37:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS9Yt3YJlz30WY;
	Tue,  7 Jan 2025 23:37:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=94.231.106.210
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736253474;
	cv=none; b=I656aZlZoJ8a9r8ooxISd3RuXZkciKH6/4diSMdghEWeTsYKfrns2iNPNanyx5hQtOCDMuCHSRN80uLntjUI6ZQaa+CtPiUK4/b6CPF3GpGRcihStT1LrlwDuqRGIrO3tAXxNwkhHvokZojPBbNmML2i0SPJ1R781x9sRPSvNaXXTLicSmArGAJXpCLdN7EERVcjPjJRfPVpmwv5G7qaEGZ9TM4LHbi0NhsT5XjsTBi7fQuJRWAoE3Fea6TqehLAKf4W8XxgZEQfngspRcmlVr9XiGokCgIn6fnnBWL44LFmkFVKbOmhrABsHOoOY9x++VClQ4J76m3KaqDmZGT8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736253474; c=relaxed/relaxed;
	bh=afiW8AwTqxiyrnYAmDWsh5UN0PQKjWSItqqmcC5x0jI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=If9f6/YvCqpo13hugmMq6sY8vMCsxe9DcRBufQHPrFesZl8wnegVFsbAS79MQOEx9zAI6CnWF8k+yXvfNJ92qAys4sJzX0ZxkBGwkP5ieSevQou3QI/7YLerIUjp6tUdmNsLVSkg73ZARwlvfRuMgA+hUi/UHpibpuqpHQtciJFmiKjCE5fgMYGLuw4U36WQXIVRpBy6ZOPiqzGjo1VswkaiX23erlPrvNonVFiRz/aLNWr92aQDz6u6Scnmb1m4fGPCb4PbIsyLOu5ykx5gKa0zIfNtTm0XFmYHAmVMyTH40OmLmXk0CpKm7gWvm0VCw1CTWU8bmSYcUt4yyGPIDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; dkim=pass (1024-bit key; secure) header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=unoeuro header.b=K8Sn0vHt; dkim-atps=neutral; spf=pass (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org) smtp.mailfrom=gaisler.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=unoeuro header.b=K8Sn0vHt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gaisler.com (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 335 seconds by postgrey-1.37 at boromir; Tue, 07 Jan 2025 23:37:50 AEDT
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YS9Yp0n5Dz30WT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 23:37:50 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4YS9R95VpRz1DQrv;
	Tue,  7 Jan 2025 13:32:05 +0100 (CET)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4YS9R855Gvz1DPkt;
	Tue,  7 Jan 2025 13:32:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=unoeuro; t=1736253125;
	bh=afiW8AwTqxiyrnYAmDWsh5UN0PQKjWSItqqmcC5x0jI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=K8Sn0vHtwM1d9RRHFMpf2UBap6Ok8/k3Y7KwC2OxqXXituKlp3nxPRyAyw6ESSaEg
	 nRhg8kkgeHKR8GWCh1uafNV9eGH67rpjoOXkPL//LTDEBibTsZkLTAwXFx8/Wb/AXh
	 cIT1WOGyJ7orxqpPCFoWzougYe222KDCTr5pTxiQ=
Message-ID: <6e1aa2aa-a70d-4292-9c5e-21c8fea386f5@gaisler.com>
Date: Tue, 7 Jan 2025 13:32:03 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] mm: pgtable: introduce generic
 __tlb_remove_table()
To: Qi Zheng <zhengqi.arch@bytedance.com>, peterz@infradead.org,
 agordeev@linux.ibm.com, kevin.brodsky@arm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <f7febc7719fd84673a8eae8af71b7b4278d3e110.1735549103.git.zhengqi.arch@bytedance.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <f7febc7719fd84673a8eae8af71b7b4278d3e110.1735549103.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024-12-30 10:07, Qi Zheng wrote:
> diff --git a/arch/sparc/include/asm/tlb_32.h b/arch/sparc/include/asm/tlb_32.h
> index 5cd28a8793e39..910254867dfbd 100644
> --- a/arch/sparc/include/asm/tlb_32.h
> +++ b/arch/sparc/include/asm/tlb_32.h
> @@ -2,6 +2,7 @@
>  #ifndef _SPARC_TLB_H
>  #define _SPARC_TLB_H
>  
> +#define __HAVE_ARCH_TLB_REMOVE_TABLE

sparc32 does not select MMU_GATHER_TABLE_FREE, and therefore does not
have (nor need) __tlb_remove_table, so this define should not be added.


>  #include <asm-generic/tlb.h>
>  
>  #endif /* _SPARC_TLB_H */
> diff --git a/arch/sparc/include/asm/tlb_64.h b/arch/sparc/include/asm/tlb_64.h
> index 3037187482db7..1a6e694418e39 100644
> --- a/arch/sparc/include/asm/tlb_64.h
> +++ b/arch/sparc/include/asm/tlb_64.h
> @@ -33,6 +33,7 @@ void flush_tlb_pending(void);
>  #define tlb_needs_table_invalidate()	(false)
>  #endif
>  
> +#define __HAVE_ARCH_TLB_REMOVE_TABLE
>  #include <asm-generic/tlb.h>
>  
>  #endif /* _SPARC64_TLB_H */
LGTM. 


With the removal of the define for sparc32 in v5:

Acked-by: Andreas Larsson <andreas@gaisler.com> # sparc

Thanks,
Andreas


