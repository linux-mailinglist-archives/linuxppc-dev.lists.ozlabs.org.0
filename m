Return-Path: <linuxppc-dev+bounces-15180-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C405CEFB51
	for <lists+linuxppc-dev@lfdr.de>; Sat, 03 Jan 2026 06:37:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djq8K4Bc5z2yFh;
	Sat, 03 Jan 2026 16:37:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767418657;
	cv=none; b=lWjCpzVClVHQsOHCeOTRKMm7kDpPJdbNTe0mUWt65UVpGnwmuQSiZSJ2jTLN+YAqXxCFL4pNIXeCGYjJq5Fj6csl7gPqSvBrDOaTDYOBKIf4kGcKyl7hJlECcvg0qHmQZsSyArb9SyYJhuX3i6uJZNL8wG0ZgpB48ZwcSRDClGrWYK0Go4ew3VSHOAE5DUx65nUhBpWoxXYYvjumEwfOh4ik5C8dFM7kkcjos4H7W6dQG7JFeoxSeUtieaspcPkc1dJ/eBSBDk9bRkFS6m9I7z4SJuMqg3xi1sQYPm+Z3xSQLiI++znr4Tl1W1fORVEZIMOcP5+zEtyXs//KAVnoxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767418657; c=relaxed/relaxed;
	bh=10gk4kIzv5viXrYP6wsblohOaaYzL8Wh9uCfOfLAyTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPGsNNXK0tyJRgDcbYlev+9pxvQtDUybfFciCslNuSiKHqZ22eyF/AtWqvyhhJ39kJ59/aOWNKCdlH1+3UdpY9L8bu0Xt1ncTOCcc4ueXZ5vsUvXjVFgezSMXXLbNhOB9v/kGQsTNpSsDwtzsYn4NBhL9sdTCnZA6hiESTvcoAar39Fu3ErETz2w+6cWnk+XGpGgn8b+OdG5JRJfLsQ6hUODoNLIYYwMxJAsb/sDKG0uyXobD9JBdNyomtv4hpItzWrCx4M219TPWZY/2TJVxfzPWrkZujZcUu4h9Z9eRrePJiMZkBlFldfDyHsFZEB+y3uWcS7ddjBGq66A2vXVDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UXKGj6hF; dkim-atps=neutral; spf=pass (client-ip=209.85.221.52; helo=mail-wr1-f52.google.com; envelope-from=shorne@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UXKGj6hF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.52; helo=mail-wr1-f52.google.com; envelope-from=shorne@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djq8H5HRFz2yFW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jan 2026 16:37:34 +1100 (AEDT)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so5132001f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 21:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767418591; x=1768023391; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=10gk4kIzv5viXrYP6wsblohOaaYzL8Wh9uCfOfLAyTE=;
        b=UXKGj6hFCPN7mJ3MyLjnMDj2RSBDexiMt0nb67oQVXPmb221B7pyKVCppxiGKQgSPx
         +M/Fl0pxC1lYaTLI4rxgJ2L0niuapk0aaSRy+ywHlNcTcyibfpUs6L1VTx9caNw5QOvU
         RS/aDKl2mHgbyLnaLN+J+Up4uWfhAduXkt7L5TMQnCUa5cv4RwxDtKP+WjC/3cMsJGpw
         jyemxXe9jBNYOFadnZq9O1WkRzl2mifygdxqtDNH3jpe+TQTEUcX5TMP88MY8drMpn75
         nvI49N/6FTT7aLM9YJJjPRyxQR9nghngH9vT0eKQ5yKk5TZ7mPquTIYgRAKwTcjZvTe0
         eSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767418591; x=1768023391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10gk4kIzv5viXrYP6wsblohOaaYzL8Wh9uCfOfLAyTE=;
        b=fduMDd1FOfGO0nKlerJwRENkvN42YNSz8IHfMAIWO/idEtzNFJl+S9SSYJTs9beqUj
         Z5I/HLTXzOU7b9eyMLASu8VoZbqLILllJQjcSq96UjV9tWzbfwBI+kKEotD1JL5pRPKf
         SwNe0UDGj1L1eu1kfJXv+kIpR2V+SDtBof9yL92f0AYC0NlybBzM6m+iuzZv86ZfPIW/
         G7lI7dgQ1qJjTszg5AdNyA9R5S2zO9iNccDjFN1nDq35JVAuYnrJlzAalD76atW+XnOk
         8N91cOatMDbXwHfxpAFuAaM+sb0HwYCMuGU9NSXORQkCIUXB3oFc/5gV9mOwzlXlNq9w
         Yl0g==
X-Forwarded-Encrypted: i=1; AJvYcCVcs0hsO7IGnCyT4KAceND7XsScHubi41taAADAdBMKYjh4dZDDzONuA/EbRrjyUhk6RmAqXFRVXdIdSqs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyk1KIxIIyjIrb1jqoWekW7UVyIaenfqewgdc9kY4FhSNAsTw8Z
	vjL3phsxqqLWWmaQtdGN5PfjENP+p1TpSN46U7PD4pwYy6B43+MjTt3p
X-Gm-Gg: AY/fxX4qJ/gkPfANq943DasSvVpfl1DiW6h1+Nry7g/qOinKrB/LW7hFjsbM403F/+Y
	QjbRMou/3PnfqDpVWNG9GVbB6RK8YNamh/nqsXC0xw1+4dMa9v0UxbtCsrRfc64G05mEOtMCiyG
	+EJKL8bZgEdvW2iQgf7iIW9PoUtImmaWS03iMj9KPIRRbKXLt1pNrUwN2mh5Zz4znTitS1dovZ7
	KDhaRzNVse9wiI5oHPS9I9XQrMAlh+5QzS/YLR04s3HaSJIW/ug/hJ/xKkjc6sZsUIxH/SACjSK
	L3J8yh1pomFhgj9jqiBtLSIQuZfAo7GcobTNMF8JwdwiCTlALFk4unMIVW+opVA3DtPwl7/CXar
	9pScasqdrFyLvy3fAIAYhcghxKE+Ba1vgmaQoSL+Asg0lhMvKbamM2MLAfG151hORHHlvoq3BfU
	Itiln4gMP37cjCPtwiU7pvXHQ8dR04xlcc4pvMfrCIsR6K8S8ftAhF39zyjyfVwM0/
X-Google-Smtp-Source: AGHT+IGVfFhDmvRzquITceR9a5MtoKyW2aPxvUx0HbCgVxiLGpVVcSZGOqzt3JsoKLBzXfIUaXLywg==
X-Received: by 2002:a05:6000:178f:b0:430:fd84:317a with SMTP id ffacd0b85a97d-4324e4fb825mr53362620f8f.38.1767418590643;
        Fri, 02 Jan 2026 21:36:30 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm89007161f8f.37.2026.01.02.21.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 21:36:28 -0800 (PST)
Date: Sat, 3 Jan 2026 05:36:26 +0000
From: Stafford Horne <shorne@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	x86@kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 12/28] openrisc: introduce arch_zone_limits_init()
Message-ID: <aViq2vsMk5tltK0f@antec>
References: <20260102070005.65328-1-rppt@kernel.org>
 <20260102070005.65328-13-rppt@kernel.org>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102070005.65328-13-rppt@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 02, 2026 at 08:59:48AM +0200, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Move calculations of zone limits to a dedicated arch_zone_limits_init()
> function.
> 
> Later MM core will use this function as an architecture specific callback
> during nodes and zones initialization and thus there won't be a need to
> call free_area_init() from every architecture.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/openrisc/mm/init.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/openrisc/mm/init.c b/arch/openrisc/mm/init.c
> index 9382d9a0ec78..67de93e7a685 100644
> --- a/arch/openrisc/mm/init.c
> +++ b/arch/openrisc/mm/init.c
> @@ -39,15 +39,19 @@
>  
>  int mem_init_done;
>  
> -static void __init zone_sizes_init(void)
> +void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
>  {
> -	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
> -
>  	/*
>  	 * We use only ZONE_NORMAL
>  	 */
> -	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
> +	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> +}
> +
> +static void __init zone_sizes_init(void)
> +{
> +	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
>  
> +	arch_zone_limits_init(max_zone_pfn);
>  	free_area_init(max_zone_pfn);
>  }

Thanks, this looks like a good cleanup.


Acked-by: Stafford Horne <shorne@gmail.com>

