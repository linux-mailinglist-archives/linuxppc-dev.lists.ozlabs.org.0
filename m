Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F8413D400
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 06:55:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ythk1ZX5zDqVx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 16:55:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ytfm6hrLzDqVH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 16:53:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=FqKdsNN0; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47ytfm1x2Mz9sPW;
 Thu, 16 Jan 2020 16:53:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579154032;
 bh=9RJsA4ixbU88RCAM8/QGkNN4hFo2PgW5OQD3mizTqI4=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=FqKdsNN0+BMLA/sv1/RKIUVNjSC86xzmMHFRbQrb//m3wbAbN4rnKXI9uln9OlG6o
 5TlVgSy7N/4wJS42CWV1b2DqgfuWNNOAg9D2IDvHcioJiIYuaPbZHGMmTC+DYbj/Np
 ZX+/S7m/WmXN6ka4CEjNIYF0dVvZSEv5yMp2ooTpKtAqGPuvrTrjX6R97FYnJC/7d8
 VHmD+JvS8o4D3g53Yb43H+3lA9R9U3fs+1+LVBrXTSiwkybYxVlDSinm6F7k5dVk+K
 JhXymh3j23dlNfXiEgcOfZQQnzvRDrXm8n9KZP5rPlvnfTz9ts+pKinLnyHlt5MbhP
 yj73JrISh1PRA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michael Bringmann <mwb@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Gustavo Walbon <gwalbon@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v2] Fix display of Maximum Memory
In-Reply-To: <5577aef8-1d5a-ca95-ff0a-9c7b5977e5bf@linux.ibm.com>
References: <5577aef8-1d5a-ca95-ff0a-9c7b5977e5bf@linux.ibm.com>
Date: Thu, 16 Jan 2020 15:53:57 +1000
Message-ID: <8736cg9cay.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Bringmann <mwb@linux.ibm.com> writes:
> Correct overflow problem in calculation+display of Maximum Memory
> value to syscfg where 32bits is insufficient.
>
> Signed-off-by: Michael Bringmann <mwb@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/lparcfg.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
> index e33e8bc..f00411c 100644
> --- a/arch/powerpc/platforms/pseries/lparcfg.c
> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
> @@ -433,12 +433,12 @@ static void parse_em_data(struct seq_file *m)
>  
>  static void maxmem_data(struct seq_file *m)
>  {
> -	unsigned long maxmem = 0;
> +	u64 maxmem = 0;

This is 64-bit only code, so u64 == unsigned long.

> -	maxmem += drmem_info->n_lmbs * drmem_info->lmb_size;
> -	maxmem += hugetlb_total_pages() * PAGE_SIZE;
> +	maxmem += (u64)drmem_info->n_lmbs * drmem_info->lmb_size;

The only problem AFAICS is n_lmbs is int and lmb_size is u32, so this
multiplication will overflow.

> +	maxmem += (u64)hugetlb_total_pages() * PAGE_SIZE;

hugetlb_total_pages() already returns unsigned long.

> -	seq_printf(m, "MaxMem=%ld\n", maxmem);
> +	seq_printf(m, "MaxMem=%llu\n", maxmem);
>  }

This should be sufficient?

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index e33e8bc4b69b..38c306551f76 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -435,10 +435,10 @@ static void maxmem_data(struct seq_file *m)
 {
        unsigned long maxmem = 0;
 
-       maxmem += drmem_info->n_lmbs * drmem_info->lmb_size;
+       maxmem += (unsigned long)drmem_info->n_lmbs * drmem_info->lmb_size;
        maxmem += hugetlb_total_pages() * PAGE_SIZE;
 
-       seq_printf(m, "MaxMem=%ld\n", maxmem);
+       seq_printf(m, "MaxMem=%lu\n", maxmem);
 }
 
 static int pseries_lparcfg_data(struct seq_file *m, void *v)


cheers
