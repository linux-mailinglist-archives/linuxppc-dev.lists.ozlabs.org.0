Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C169B2F7C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 09:12:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DzL12mqBzDqRv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 17:12:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="ooZK0Kk4"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DzGN4JQ5zDqVQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 17:09:16 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id c5so2160288pll.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 00:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zv6mEACBFNnHpTtqofUcdCjxsiBj3nDjmG7El5zs98s=;
 b=ooZK0Kk4w+4FK5exqqa5+2xtZT1VHu8ObKZpmEIRsJ65XbpnmH1KrWSW5tYmAsjcqv
 rpqkaVuzkpX9s3XQPepak0XTJiWt4/t8SOLoaujNi42LfbndKllusYrH4lXTMtG2XBiH
 ZbU2aS9PcvzVtoU7ttveYDi/bahtPo9rbAa+4IK4tXrQ/m1HeOwqgUZ1djNgHPU4GGkb
 H0i45PB5ELokbdlFj+1oFzYXAEtXZE+2QOd2ibqgxXMc/d3GdoPiXaRhua0+NjEmtqyc
 c0pod4MzpvHhrVTbIm7M3o2HgM5qMHOxXvXPEWXQjr2Q5gt+ejjCoKqSKNXcUDLxvv1N
 LaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zv6mEACBFNnHpTtqofUcdCjxsiBj3nDjmG7El5zs98s=;
 b=N73nwFSXUxyRx9M77+6HyJWtks3feet9nJVAgYjt4vLwMSXYtw2bfBKINt2US1qBDR
 Of0UZNXs9+07TBT04IJyP1Mp5LUdAxGpWg3B4Xa3ulEHMBtjeWPmoDKyAdd2jHalIkWP
 7uFQbbk9Bu0Ng4sZgh29nv9Nvj5UbHEDMD/jKPa6F6oPAFyPopgyQVnWpXaOKdiHknwC
 v20nClHj4Lp7kGFBkTY173mnFcs/ZrAUqNmB5RGi1dDlOH/ogyAhUyJJPuIuTpkdci89
 MeYUIAgas25FzHe7nlz/Bmi7pgpw7aVkdMSsLWznfBxirRf17mR2xvEte/NCGNZWelry
 f9GA==
X-Gm-Message-State: APjAAAWqgvTWBZGPOq0NzmHU+a3ATfWncgYHLnxsXJyoZTV8XU92vfWR
 j0Nz4+anys3N1UqwoaliZgQoWA==
X-Google-Smtp-Source: APXvYqyh3E+9LZwkiE7e9eYT3jMIayjCBdPLdzJWiTyLrgoKYnKqIL2r30euGcASxPYiEBV8KvpfkA==
X-Received: by 2002:a17:902:18a:: with SMTP id
 b10mr2360771plb.277.1559200153200; 
 Thu, 30 May 2019 00:09:13 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id n12sm1607469pgq.54.2019.05.30.00.09.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 00:09:09 -0700 (PDT)
Subject: Re: [PATCH kernel] prom_init: Fetch flatten device tree from the
 system firmware
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20190501034221.18437-1-aik@ozlabs.ru>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Openpgp: preference=signencrypt
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <a62a8612-77f5-5c6b-a6a2-15f006051d5e@ozlabs.ru>
Date: Thu, 30 May 2019 17:09:06 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190501034221.18437-1-aik@ozlabs.ru>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

so, it is sort-of nack from David and sort-of ack from Segher, what
happens now?



On 01/05/2019 13:42, Alexey Kardashevskiy wrote:
> At the moment, on 256CPU + 256 PCI devices guest, it takes the guest
> about 8.5sec to fetch the entire device tree via the client interface
> as the DT is traversed twice - for strings blob and for struct blob.
> Also, "getprop" is quite slow too as SLOF stores properties in a linked
> list.
> 
> However, since [1] SLOF builds flattened device tree (FDT) for another
> purpose. [2] adds a new "fdt-fetch" client interface for the OS to fetch
> the FDT.
> 
> This tries the new method; if not supported, this falls back to
> the old method.
> 
> There is a change in the FDT layout - the old method produced
> (reserved map, strings, structs), the new one receives only strings and
> structs from the firmware and adds the final reserved map to the end,
> so it is (fw reserved map, strings, structs, reserved map).
> This still produces the same unflattened device tree.
> 
> This merges the reserved map from the firmware into the kernel's reserved
> map. At the moment SLOF generates an empty reserved map so this does not
> change the existing behaviour in regard of reservations.
> 
> This supports only v17 onward as only that version provides dt_struct_size
> which works as "fdt-fetch" only produces v17 blobs.
> 
> If "fdt-fetch" is not available, the old method of fetching the DT is used.
> 
> [1] https://git.qemu.org/?p=SLOF.git;a=commitdiff;h=e6fc84652c9c00
> [2] https://git.qemu.org/?p=SLOF.git;a=commit;h=ecda95906930b80
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  arch/powerpc/kernel/prom_init.c | 43 +++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index f33ff4163a51..72e7a602b68e 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -2457,6 +2457,48 @@ static void __init flatten_device_tree(void)
>  		prom_panic("Can't allocate initial device-tree chunk\n");
>  	mem_end = mem_start + room;
>  
> +	hdr = (void *) mem_start;
> +	if (!call_prom_ret("fdt-fetch", 2, 1, NULL, mem_start,
> +				room - sizeof(mem_reserve_map)) &&
> +			hdr->version >= 17) {
> +		u32 size;
> +		struct mem_map_entry *fwrmap;
> +
> +		/* Fixup the boot cpuid */
> +		hdr->boot_cpuid_phys = cpu_to_be32(prom.cpu);
> +
> +		/*
> +		 * Store the struct and strings addresses, mostly
> +		 * for consistency, only dt_header_start actually matters later.
> +		 */
> +		dt_header_start = mem_start;
> +		dt_string_start = mem_start + be32_to_cpu(hdr->off_dt_strings);
> +		dt_string_end = dt_string_start +
> +			be32_to_cpu(hdr->dt_strings_size);
> +		dt_struct_start = mem_start + be32_to_cpu(hdr->off_dt_struct);
> +		dt_struct_end = dt_struct_start +
> +			be32_to_cpu(hdr->dt_struct_size);
> +
> +		/*
> +		 * Calculate the reserved map location (which we put
> +		 * at the blob end) and update total size.
> +		 */
> +		fwrmap = (void *)(mem_start + be32_to_cpu(hdr->off_mem_rsvmap));
> +		hdr->off_mem_rsvmap = hdr->totalsize;
> +		size = be32_to_cpu(hdr->totalsize);
> +		hdr->totalsize = cpu_to_be32(size + sizeof(mem_reserve_map));
> +
> +		/* Merge reserved map from firmware to ours */
> +		for ( ; fwrmap->size; ++fwrmap)
> +			reserve_mem(be64_to_cpu(fwrmap->base),
> +					be64_to_cpu(fwrmap->size));
> +
> +		rsvmap = (u64 *)(mem_start + size);
> +
> +		prom_debug("Fetched DTB: %d bytes to @%lx\n", size, mem_start);
> +		goto finalize_exit;
> +	}
> +
>  	/* Get root of tree */
>  	root = call_prom("peer", 1, 1, (phandle)0);
>  	if (root == (phandle)0)
> @@ -2504,6 +2546,7 @@ static void __init flatten_device_tree(void)
>  	/* Version 16 is not backward compatible */
>  	hdr->last_comp_version = cpu_to_be32(0x10);
>  
> +finalize_exit:
>  	/* Copy the reserve map in */
>  	memcpy(rsvmap, mem_reserve_map, sizeof(mem_reserve_map));
>  
> 

-- 
Alexey
