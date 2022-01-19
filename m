Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87478493401
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 05:18:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jdsnq3csNz3bTp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 15:18:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gAmqQ4rY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gAmqQ4rY; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jdsn8232Gz2xs4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jan 2022 15:17:46 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id
 59-20020a17090a09c100b001b34a13745eso4986067pjo.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 20:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=AKF/m4crRjUPKaEVyR47iJWpF9556rhB20qICdT0XMw=;
 b=gAmqQ4rYYDr653fs21as+JGb8WVc3EmyhbYjx0q2IQ5dWwJZKJ4GnqrquUtrvSB9OB
 yrB2KyU4M340MMrv250jTVTm9egqTgMtoitKsWrnZig7xF0hOskKydBZPGefcGE0csbP
 AiWdymunWo98bs9atvLMSPnGTL+cKj+CVfnPBiHWx4Exxb8VTZv3RGeCwPszEkMQiHOl
 7RVADXLKYlCe8CIcbja61x2w0JRXJUjn5z1wkaIVivzwlVoMaedV2Yu12vPxNe4yUID6
 AI9KiKUKOHS2QOSPlOzLqKoMbfHEMjJecKbks82ZSv6NLKRWAaGowwlsYIP1sXYCr2Nk
 XDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=AKF/m4crRjUPKaEVyR47iJWpF9556rhB20qICdT0XMw=;
 b=uJK+9hdOBV/Lrsm3vMl0DjY+cUf7ShegpbPohH+q/2aAJv03HJWnSxJHQDGu1hapHH
 BueD5nF3lXB0mi/83iVwaMJny5N+JtXI8lnkNLgbXRwcipjL+27YfKNW1AiLXdHvabgU
 qzhsF+pp3Yiq24C9ZRRlFwgQv0z+QZlR8KypxvIrnsLh95exMgcG3jC/rcUNLbltzGLV
 0QHvoBAcZJF1tc6isk3hirPwbKx/iwEluOAcA80ExcCjvHO4HPNLgwg2jZYVwuyC4Ldl
 K8+sj/apv1sAOwT6OiPQzIID02FMxOP70fbKZTMeozXPH9sm+i8aR6emiQhlM13OZgOY
 7egw==
X-Gm-Message-State: AOAM533enHfLmGx+Dcv1mfxxcGxERWOo7CSyALGPImoP4NpFCg1vmZb2
 N7jw2LI0owaqpv/sNjErx3E=
X-Google-Smtp-Source: ABdhPJx3OvhLmFtcmBgPOWtTOgtFz5eNT+qAc0Hg/uqwpDFNuWOOlw66tKXtoYn5ZRQ3+6wnEZ9b/A==
X-Received: by 2002:a17:902:6b89:b0:149:7aa8:d98c with SMTP id
 p9-20020a1709026b8900b001497aa8d98cmr30797727plk.72.1642565863190; 
 Tue, 18 Jan 2022 20:17:43 -0800 (PST)
Received: from localhost (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id n5sm18226822pfo.39.2022.01.18.20.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 20:17:42 -0800 (PST)
Date: Wed, 19 Jan 2022 14:17:37 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 3/3] x86: Support huge vmalloc mappings
To: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet
 <corbet@lwn.net>, Dave Hansen <dave.hansen@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, Kefeng Wang <wangkefeng.wang@huawei.com>,
 x86@kernel.org
References: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
 <20211227145903.187152-4-wangkefeng.wang@huawei.com>
 <70ff58bc-3a92-55c2-2da8-c5877af72e44@intel.com>
 <3858de1f-cdbc-ff52-2890-4254d0f48b0a@huawei.com>
 <31a75f95-6e6e-b640-2d95-08a95ea8cf51@intel.com>
 <1642472965.lgfksp6krp.astroid@bobo.none>
 <4488d39f-0698-7bfd-b81c-1e609821818f@intel.com>
In-Reply-To: <4488d39f-0698-7bfd-b81c-1e609821818f@intel.com>
MIME-Version: 1.0
Message-Id: <1642565468.c0jax91tvn.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Dave Hansen's message of January 19, 2022 3:28 am:
> On 1/17/22 6:46 PM, Nicholas Piggin wrote:
>>> This all sounds very fragile to me.  Every time a new architecture woul=
d
>>> get added for huge vmalloc() support, the developer needs to know to go
>>> find that architecture's module_alloc() and add this flag.
>> This is documented in the Kconfig.
>>=20
>>  #
>>  #  Archs that select this would be capable of PMD-sized vmaps (i.e.,
>>  #  arch_vmap_pmd_supported() returns true), and they must make no assum=
ptions
>>  #  that vmalloc memory is mapped with PAGE_SIZE ptes. The VM_NO_HUGE_VM=
AP flag
>>  #  can be used to prohibit arch-specific allocations from using hugepag=
es to
>>  #  help with this (e.g., modules may require it).
>>  #
>>  config HAVE_ARCH_HUGE_VMALLOC
>>          depends on HAVE_ARCH_HUGE_VMAP
>>          bool
>>=20
>> Is it really fair to say it's *very* fragile? Surely it's reasonable to=20
>> read the (not very long) documentation ad understand the consequences fo=
r
>> the arch code before enabling it.
>=20
> Very fragile or not, I think folks are likely to get it wrong.  It would
> be nice to have it default *everyone* to safe and slow and make *sure*

It's not safe to enable though. That's the problem. If it was just=20
modules then you'd have a point but it could be anything.

> they go look at the architecture modules code itself before enabling
> this for modules.

This is required not just for modules for the whole arch code, it
has to be looked at and decided this will work.

> Just from that Kconfig text, I don't think I'd know off the top of my
> head what do do for x86, or what code I needed to go touch.

You have to make sure arch/x86 makes no assumptions that vmalloc memory
is backed by PAGE_SIZE ptes. If you can't do that then you shouldn't=20
enable the option. The option can not explain it any more because any
arch could do anything with its mappings. The module code is an example,
not the recipe.

Thanks,
Nick
