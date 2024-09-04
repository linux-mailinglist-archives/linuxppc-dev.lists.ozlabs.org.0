Return-Path: <linuxppc-dev+bounces-1017-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CE096CA77
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 00:33:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzchb3Dbrz2y8P;
	Thu,  5 Sep 2024 08:33:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1036"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725475923;
	cv=none; b=cJ3fR1k8axhkZiXs4BWgAPWDdKRkB4qwa2JdRMpIpi53WaJuMm8Hs6Wv9riZiGAL2uzk/dQUsjII48qN15zF3R4A6VXcgTgZHwrFfko4VBbh+pMmrzY0UdUOw2VH+XqhheWpCoE6mxuPRtEF/ZPMAkbHldKwhQtHLn6e/bm9CGLAixNfjNdAxaRUJalGHMp9tPtY0RPlivyQ17QIzjW8NurF8bHOgIPxSB0dq2aPuOwhIjKiYZRaut3V1sGmi9WSmRMeiI/ACWTT6yNSZpeXgeDrEcXx0k6xPpLkna3YqIS/kiUcQCa9BEdR4Bk45743nk1z+ukiwkSEGQuDGARgRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725475923; c=relaxed/relaxed;
	bh=O6ZVaLfTmncaiFC3xCMQJd5Si2uYtr9Mg2hPai6p2Zs=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=lvoWA+6QLLM3YEMbUBOc2waqyAHirprPj9+j+1p48eIFCUDsonqzz7kaQDlwn7+J0AOCEptCQFtMd7ijdz8gXVgglGiOBjTVvnmVm+552cZ36lC6dODkgAUwLaV01g1qCf2VvycxOU2myjcjfCZBv9Jx+OFf7Y5A8OgQtd9kYmRnigZXGBMVchmcujkn0qji8xSDHdxXyZx7XvNBxz6HVUbYzxziDnOV9DhpDOQX0DOJmFx0rUc/V11UXjADleh4VJzmhlwgWB6pQ1trBDVrRtiq8ydML13igWcZEC7eWu7k4A8BeyrNfh3q3zP+FS2Dgw7MvuUFOv3zVrxUCQYt7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=MKtkeCDP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=debug@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=MKtkeCDP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=debug@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzWnG500pz2yYd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 04:52:00 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2d8a744aa9bso2984982a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 11:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725475918; x=1726080718; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O6ZVaLfTmncaiFC3xCMQJd5Si2uYtr9Mg2hPai6p2Zs=;
        b=MKtkeCDPI9gOnaEmCsEo29yF7jnA5WnSfgTbUhSKL4O3lg6ExLroTF6TiZKk35Lugy
         14c644Nlii31I6FSKZQQFwcT+TZ31NUplgF6jKvfMuWv8+vQ5qgRVhrJzKb94hlaU4mT
         8ii6U0utswLpQolvnLQd9K23rfJAWOV6vfILl5nDkQZorOpcWQbF0DBSmy8YDIYoWVbU
         eqbGZg1ksKy2kAkbgdK9eHQpYb66TLga7D/XF8OR6hEoqhnEuKk6lqhj7iv6xoAvKr5l
         2J+kea9s1c1ltqkiGHCbMTfcfimTu8CgKR8s3h9cqsUo3PPCC31gQ/bm+5Jd46dojDLW
         HF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725475918; x=1726080718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6ZVaLfTmncaiFC3xCMQJd5Si2uYtr9Mg2hPai6p2Zs=;
        b=YhiNbGeXulfxjGXFHw8l4lKNYVEvxIdcbMXpVxiYy8Jn0oATBEmc2ItXhwyPCtSy71
         ALY7sxg3/VvpQQBCWW6nOZVCBoknEth8ZsCPAj+ooaAF6PVnVlJgVsG6jcnBDH+zVOTY
         tWuqmtk8Tkt0mCFL8cU+DxcUpPZZNT/Oyo4QubQQ8/qIn4X/OqndfOGTo6pcS+Fc5Vc3
         dhepEMQFF7htiT5+reHZVqVcyYz5cvlV5QJoq8/Qorut5rW7/053bYwEUxhPi8PSlPNI
         lUWqGEHrlHf8WV9+AIUKI4eeIcTO73XSUbYW0siijftfj45TJYjZSlY863EMraFPNAaP
         qwwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3waRUIkn60AAVd1a4DsyYhRqepdjv4llh5VNNFnQEXmqps7BxLA/o/hPHE/LveJTxjsaI2LENBegyJIU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzWxKSvsjh47yXskeXV/T6F0hNnv6AthZAaCOweXoh/1zNFw+IF
	y3nxFrLUj/KVIIAXBqIdOOCGpmpm9g044u4lBE1VlU1s82AbdMQLvQS6/qJMoIo=
X-Google-Smtp-Source: AGHT+IGxM6h9S0OM8htpvDl1qRKbi0apkGb/RUsvutqrVBDacyDPb7hJbcL2mjRY0/SNPdo0kubr6w==
X-Received: by 2002:a17:90b:3903:b0:2d8:8430:8a91 with SMTP id 98e67ed59e1d1-2d89728b29emr15224775a91.10.1725475918042;
        Wed, 04 Sep 2024 11:51:58 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8e1ae1b3fsm6674555a91.33.2024.09.04.11.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 11:51:57 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:51:53 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-mm@kvack.org, Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 3/3] mm: Care about shadow stack guard gap when getting
 an unmapped area
Message-ID: <ZtisSerxbnDaWr5l@debug.ba.rivosinc.com>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-3-9acda38b3dd3@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240902-mm-generic-shadow-stack-guard-v1-3-9acda38b3dd3@kernel.org>

On Mon, Sep 02, 2024 at 08:08:15PM +0100, Mark Brown wrote:
>As covered in the commit log for c44357c2e76b ("x86/mm: care about shadow
>stack guard gap during placement") our current mmap() implementation does
>not take care to ensure that a new mapping isn't placed with existing
>mappings inside it's own guard gaps. This is particularly important for
>shadow stacks since if two shadow stacks end up getting placed adjacent to
>each other then they can overflow into each other which weakens the
>protection offered by the feature.
>
>On x86 there is a custom arch_get_unmapped_area() which was updated by the
>above commit to cover this case by specifying a start_gap for allocations
>with VM_SHADOW_STACK. Both arm64 and RISC-V have equivalent features and
>use the generic implementation of arch_get_unmapped_area() so let's make
>the equivalent change there so they also don't get shadow stack pages
>placed without guard pages.
>
>Architectures which do not have this feature will define VM_SHADOW_STACK
>to VM_NONE and hence be unaffected.
>
>Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
>Signed-off-by: Mark Brown <broonie@kernel.org>
>---
> mm/mmap.c | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>
>diff --git a/mm/mmap.c b/mm/mmap.c
>index b06ba847c96e..902c482b6084 100644
>--- a/mm/mmap.c
>+++ b/mm/mmap.c
>@@ -1753,6 +1753,14 @@ static unsigned long unmapped_area_topdown(struct vm_unmapped_area_info *info)
> 	return gap;
> }
>
>+static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
>+{
>+	if (vm_flags & VM_SHADOW_STACK)
>+		return PAGE_SIZE;
>+
>+	return 0;
>+}
>+
> /*
>  * Search for an unmapped address range.
>  *
>@@ -1814,6 +1822,7 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
> 	info.length = len;
> 	info.low_limit = mm->mmap_base;
> 	info.high_limit = mmap_end;
>+	info.start_gap = stack_guard_placement(vm_flags);
> 	return vm_unmapped_area(&info);
> }
>
>@@ -1863,6 +1872,7 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
> 	info.length = len;
> 	info.low_limit = PAGE_SIZE;
> 	info.high_limit = arch_get_mmap_base(addr, mm->mmap_base);
>+	info.start_gap = stack_guard_placement(vm_flags);
> 	addr = vm_unmapped_area(&info);
>
> 	/*
>

lgtm

Reviewed-by: Deepak Gupta <debug@rivosinc.com>

>-- 
>2.39.2
>

