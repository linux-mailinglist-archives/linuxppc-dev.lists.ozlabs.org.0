Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BC437D59
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 21:40:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Kbby2SRszDqpL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 05:40:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KbZS3hdFzDqNS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 05:39:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jz4maR4y"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45KbZS1FT2z8tQv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 05:39:12 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45KbZS0wNZz9sNq; Fri,  7 Jun 2019 05:39:12 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=mopsfelder@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jz4maR4y"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45KbZR6k25z9sNk
 for <linuxppc-dev@ozlabs.org>; Fri,  7 Jun 2019 05:39:11 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id w187so2215766qkb.11
 for <linuxppc-dev@ozlabs.org>; Thu, 06 Jun 2019 12:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=FLwI6+5wMwdyc5kKGJFomLa/Z2aq5u3NjMcje63l998=;
 b=jz4maR4yAxExQ0eKYrH9gqXf2ST19g3Qsaw+KyC7z33RsrY6+leAlVEuGF6QeBfwh+
 QUbKjkWHTE7A04/MJnr5XIXjHNdC56U+QWof1qeTGYIgyAzVVLhZrs+I9pkwMmkrQSf9
 Q1lq/PkAgvqcK1AY8y2PxVbInTZO++unNIYo3+DQlaunQdTM9Z/Ce2fOm7S1/XrHJebI
 yoVugTXSt6vajQREDnmIw8GJp19iP01jKDHuCY/CH6e8XnFSfJwr+xP7C/El3YcGSVx5
 Rm5jazPBDx3aiAA8Hvm6Edj5E3JJvnlhOBbENlSISz1QUy6GQNKcUfaPf+dZio8NKlmi
 2dGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:cc:subject:in-reply-to:references
 :date:message-id:mime-version;
 bh=FLwI6+5wMwdyc5kKGJFomLa/Z2aq5u3NjMcje63l998=;
 b=dj9VzEn88MINBSvdFQLeagT53drG30mjS8NZLGWFTiQn50C89RB8UYgKJ/iC1k3Is8
 yuy9suGMaJ4T3QJQlH/CJITeCEmSoIHotlvkYRxS5BeCG7nbeWwR5Cn+hTEphKMwiiBu
 t0PVWMNie2mp/pMopOsqVfjFF9WIQZHOtSnMV+07qSfnz2/p6eYdoz+sZWiJup6PCBX2
 syVuChmwF5v1hN50NmwqLrWS3aoGfM7inIJ5rqAzSqgKTNN6ny8IVTq71wzl1eGWjEnv
 lwBfhX1S/BQZHmAx0t4oOGM7LZ9myjv2MMJcmyBZznmAkOEazd6m8KaAbkrPKZ/rDB9n
 QXrA==
X-Gm-Message-State: APjAAAXuKToSx8GAx1tjOWCFBLBrLOyiLZ2rY9uUlULvFNV76Mx5gYtV
 ht2+PtLJ258gf9crKX0Fm5Q=
X-Google-Smtp-Source: APXvYqzu3XMgIC1+ZJF2Bb5Vjsv12b98ODvNNxep7Jevb15/uPzAa/DGmkE3zbMvme+fXIvu1zf0FQ==
X-Received: by 2002:a05:620a:232:: with SMTP id
 u18mr21652131qkm.131.1559849948157; 
 Thu, 06 Jun 2019 12:39:08 -0700 (PDT)
Received: from localhost (200-158-48-188.dsl.telesp.net.br. [200.158.48.188])
 by smtp.gmail.com with ESMTPSA id
 17sm1544028qtr.65.2019.06.06.12.39.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 12:39:07 -0700 (PDT)
From: Murilo Opsfelder =?utf-8?Q?Ara=C3=BAjo?= <mopsfelder@gmail.com>
To: Claudio Carvalho <cclaudio@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v3 6/9] KVM: PPC: Ultravisor: Restrict flush of the
 partition tlb cache
In-Reply-To: <20190606173614.32090-7-cclaudio@linux.ibm.com>
References: <20190606173614.32090-1-cclaudio@linux.ibm.com>
 <20190606173614.32090-7-cclaudio@linux.ibm.com>
Date: Thu, 06 Jun 2019 16:39:04 -0300
Message-ID: <8736kmld0n.fsf@kermit.br.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: , Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauermann@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Claudio Carvalho <cclaudio@linux.ibm.com> writes:

> From: Ram Pai <linuxram@us.ibm.com>
>
> Ultravisor is responsible for flushing the tlb cache, since it manages
> the PATE entries. Hence skip tlb flush, if the ultravisor firmware is
> available.
>
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/pgtable.c | 33 +++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 40a9fc8b139f..1eeb5fe87023 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -224,6 +224,23 @@ void __init mmu_partition_table_init(void)
>  	powernv_set_nmmu_ptcr(ptcr);
>  }
>
> +static void flush_partition(unsigned int lpid, unsigned long dw0)
> +{
> +	if (dw0 & PATB_HR) {
> +		asm volatile(PPC_TLBIE_5(%0, %1, 2, 0, 1) : :
> +			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
> +		asm volatile(PPC_TLBIE_5(%0, %1, 2, 1, 1) : :
> +			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
> +		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 1);
> +	} else {
> +		asm volatile(PPC_TLBIE_5(%0, %1, 2, 0, 0) : :
> +			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
> +		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 0);
> +	}
> +	/* do we need fixup here ?*/
> +	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
> +}
> +

checkpatch.pl seems to complain:

ERROR: need consistent spacing around '%' (ctx:WxV)
#125: FILE: arch/powerpc/mm/book3s64/pgtable.c:230:
+               asm volatile(PPC_TLBIE_5(%0, %1, 2, 0, 1) : :
                                             ^

ERROR: need consistent spacing around '%' (ctx:WxV)
#127: FILE: arch/powerpc/mm/book3s64/pgtable.c:232:
+               asm volatile(PPC_TLBIE_5(%0, %1, 2, 1, 1) : :
                                             ^

ERROR: need consistent spacing around '%' (ctx:WxV)
#131: FILE: arch/powerpc/mm/book3s64/pgtable.c:236:
+               asm volatile(PPC_TLBIE_5(%0, %1, 2, 0, 0) : :
                                             ^

>  static void __mmu_partition_table_set_entry(unsigned int lpid,
>  					    unsigned long dw0,
>  					    unsigned long dw1)
> @@ -238,20 +255,8 @@ static void __mmu_partition_table_set_entry(unsigned int lpid,
>  	 * The type of flush (hash or radix) depends on what the previous
>  	 * use of this partition ID was, not the new use.
>  	 */
> -	asm volatile("ptesync" : : : "memory");
> -	if (old & PATB_HR) {
> -		asm volatile(PPC_TLBIE_5(%0,%1,2,0,1) : :
> -			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
> -		asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
> -			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
> -		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 1);
> -	} else {
> -		asm volatile(PPC_TLBIE_5(%0,%1,2,0,0) : :
> -			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
> -		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 0);
> -	}
> -	/* do we need fixup here ?*/
> -	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
> +	if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
> +		flush_partition(lpid, old);
>  }
>
>  void mmu_partition_table_set_entry(unsigned int lpid, unsigned long dw0,
> --
> 2.20.1
