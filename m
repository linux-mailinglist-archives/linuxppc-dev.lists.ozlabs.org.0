Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D22879458C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 23:59:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=m2yx96YV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RgxB02wmrz3c5f
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 07:59:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=m2yx96YV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=mingo.kernel.org@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rgx935bfDz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Sep 2023 07:59:02 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31c65820134so311758f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Sep 2023 14:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694037535; x=1694642335; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUEsUDVRFl9we3IvMz1iDQ5wrm80qIsR/HrhiCU8qwU=;
        b=m2yx96YVQYXR8Usg7d0Ql48NNLMDRNyfD3Wjclx2EolO83lr3BofKIdSR6mTAy/ths
         DW3hOTOef3E4UIMLo2wfs+iy5mhPXY9Z3dOmBhmgRnSM4j2Ts5OdxyJP/edJW+InvSR4
         KtUYfJKWSbGCghto0Fa3b06yV8bMn+jDdq+ygTZUR6xpGoNehegBUQDYvT3HhUUHv26Y
         Max0XEpiw9UR6+rQwRscfMx9x0qDwkgtdY6e8MzJBRZU4AGqs+4wn+p9Qa7CfoYS5yst
         vSqCq0fgYagLY9RA400zCsFGjBQRZj5vE5LtnuscsXNDkBiMC3j6toc0tS1vLhH5epSr
         +7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694037535; x=1694642335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUEsUDVRFl9we3IvMz1iDQ5wrm80qIsR/HrhiCU8qwU=;
        b=Sf0ZjK2hLOSjj2/gzNrEjUn1Nsqz/fN/3h18QSNlVWRrj7WTMm5xpd8g/GmDPwCHkL
         ZLkoHoE96nauQHZwsZA3YOs3xovB9uBcHAdE7p81LW3/6llehoOpj+P8CLJvZ0zWL4op
         zo7+uzr3lP+47UFvfMPoLaxPNG0hzL3gqom13Vc7/I7cAXfNmvz39geZ8xlqa0bDdi7f
         C/xfQHb++iYUFGENPynHVZXHht4juqzGFIuR01E/waht1IptHw3CjUYbxKBJotRkHHUp
         kSt2JQvtLUYSI8cdBbenVeAdlpmp+qTyVFLjLbxt8A4NraEBIbDKVEvTt6Tcf6WitscJ
         HGlA==
X-Gm-Message-State: AOJu0YwGUWOg1GfYM3FLYvwbOJfM9qNqvSkx22W5HYTm3CxXe8EywyI2
	89NXJAiEvTMQFg9H9Q0wks8=
X-Google-Smtp-Source: AGHT+IG5nMeuL/VoGmcwCLwFLhOfCIhRsiIb9391lHp1yY958vfciaCR4r3uuUZhhDYYQHGkLNQJgQ==
X-Received: by 2002:a5d:604b:0:b0:30e:3da5:46e5 with SMTP id j11-20020a5d604b000000b0030e3da546e5mr3830642wrt.59.1694037535283;
        Wed, 06 Sep 2023 14:58:55 -0700 (PDT)
Received: from gmail.com (1F2EF6A2.nat.pool.telekom.hu. [31.46.246.162])
        by smtp.gmail.com with ESMTPSA id n10-20020adffe0a000000b003140f47224csm21447397wrr.15.2023.09.06.14.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 14:58:50 -0700 (PDT)
Date: Wed, 6 Sep 2023 23:58:47 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 3/8] arch/x86: Remove sentinel elem from ctl_table arrays
Message-ID: <ZPj2F4retSgg3vAj@gmail.com>
References: <20230906-jag-sysctl_remove_empty_elem_arch-v1-0-3935d4854248@samsung.com>
 <20230906-jag-sysctl_remove_empty_elem_arch-v1-3-3935d4854248@samsung.com>
 <d0d30ad4-7837-b0c4-39f4-3e317e35a41b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0d30ad4-7837-b0c4-39f4-3e317e35a41b@intel.com>
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
Cc: j.granados@samsung.com, Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, willy@infradead.org, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, josh@joshtriplett.org, Nicholas Piggin <npiggin@gmail.com>, linux-csky@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
  Iurii Zaikin <yzaikin@google.com>, linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* Dave Hansen <dave.hansen@intel.com> wrote:

> On 9/6/23 03:03, Joel Granados via B4 Relay wrote:
> > This commit comes at the tail end of a greater effort to remove the
> > empty elements at the end of the ctl_table arrays (sentinels) which
> > will reduce the overall build time size of the kernel and run time
> > memory bloat by ~64 bytes per sentinel (further information Link :
> > https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> > 
> > Remove sentinel element from sld_sysctl and itmt_kern_table.
> 
> There's a *LOT* of content to read for a reviewer to figure out what's
> going on here between all the links.  I would have appreciated one more
> sentence here, maybe:
> 
> 	This is now safe because the sysctl registration code
> 	(register_sysctl()) implicitly uses ARRAY_SIZE() in addition
> 	to checking for a sentinel.
> 
> That needs to be more prominent _somewhere_.  Maybe here, or maybe in
> the cover letter, but _somewhere_.
> 
> That said, feel free to add this to the two x86 patches:
> 
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com> # for x86

Absolutely needs to be in the title as well, something like:

   arch/x86: Remove now superfluous sentinel elem from ctl_table arrays

With that propagated into the whole series:

   Reviewed-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
