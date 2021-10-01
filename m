Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F56C41E824
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 09:15:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLLwp0Q4Tz3c6f
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 17:15:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=fe9H/w2X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=fe9H/w2X; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLLw83yFjz2yM4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 17:14:47 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id s75so8620252pgs.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Oct 2021 00:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=hQ5Dp9x0o7vj9OmS5x46emFCr7Zl/nJolk9+Z2BpJ/M=;
 b=fe9H/w2X2vuAp8bhFAjKcirq956EvG0Xsc4F/qPYLCr7shEcx/7zVRCvPxYTKIseYq
 cM0bGEaE6AOBmeVWMByscucDo3qj28Mo1bYpVvfDkpGyt16RzahFoQ3vLK88+7PljDI8
 g4xwbvUg0m6Q0tlQhV1A905dnxfllF0FbKG5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=hQ5Dp9x0o7vj9OmS5x46emFCr7Zl/nJolk9+Z2BpJ/M=;
 b=aK8Do0ftydrM2rDyr8WJRes7yaP2u5IMLu4e8mZyxHeRlcJm1egI4o3OdUaVSxjAKs
 DNTcec9mVXweu98OJvX3x4BP6eIfwcmTfsX9p4x8HGSIrymSecDpOAuZneLHNh+lGx98
 7Eqr7bgkim32hkeHuj3XKvw6zPujTWwGiAIFqRg06diabun2jYh9+vN31cwoMp7h2bAz
 dO/zuwJ9X4u77g8TaJxPnIAfS/v9OtWL4Q8kVmQvgwYNlulxjkLd8febu0YNTdkChw+9
 /1d6GAvAHyBgA6yUxhNd14B348N2djC4LhbY6gj3jiPFauI74+a1EBYiwr+/BSLQGPec
 vTkQ==
X-Gm-Message-State: AOAM532GB8lU8yUPyNbwiiRM8a7H1Nxp+4F5Zk/KvGjFpARBYv5ggIJB
 e+9u5uES0xLF5yb1EnrT30OVZQ==
X-Google-Smtp-Source: ABdhPJybs5wSHjwxNYuL3Oj52Xlb/bebURrnTQ6GT1WSxewTOdLpU3woiWbsUUuDzK3q3lC/kp1vUA==
X-Received: by 2002:aa7:9a0e:0:b0:44a:3ae2:825c with SMTP id
 w14-20020aa79a0e000000b0044a3ae2825cmr8564635pfj.28.1633072484450; 
 Fri, 01 Oct 2021 00:14:44 -0700 (PDT)
Received: from localhost ([2001:4479:e200:df00:c98c:9868:6328:c144])
 by smtp.gmail.com with ESMTPSA id k12sm1219967pjf.32.2021.10.01.00.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 00:14:43 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Andrew Morton <akpm@linux-foundation.org>, arnd@arndb.de
Subject: Re: [PATCH v3 2/4] mm: Make generic arch_is_kernel_initmem_freed() do
 what it says
In-Reply-To: <1d40783e676e07858be97d881f449ee7ea8adfb1.1633001016.git.christophe.leroy@csgroup.eu>
References: <9ecfdee7dd4d741d172cb93ff1d87f1c58127c9a.1633001016.git.christophe.leroy@csgroup.eu>
 <1d40783e676e07858be97d881f449ee7ea8adfb1.1633001016.git.christophe.leroy@csgroup.eu>
Date: Fri, 01 Oct 2021 17:14:41 +1000
Message-ID: <87ilyhmd26.fsf@linkitivity.dja.id.au>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>  #ifdef __KERNEL__
> +/*
> + * Check if an address is part of freed initmem. After initmem is freed,
> + * memory can be allocated from it, and such allocations would then have
> + * addresses within the range [_stext, _end].
> + */
> +#ifndef arch_is_kernel_initmem_freed
> +static int arch_is_kernel_initmem_freed(unsigned long addr)
> +{
> +	if (system_state < SYSTEM_FREEING_INITMEM)
> +		return 0;
> +
> +	return init_section_contains((void *)addr, 1);

Is init_section_contains sufficient here?

include/asm-generic/sections.h says:
 * [__init_begin, __init_end]: contains .init.* sections, but .init.text.*
 *                   may be out of this range on some architectures.
 * [_sinittext, _einittext]: contains .init.text.* sections

init_section_contains only checks __init_*:
static inline bool init_section_contains(void *virt, size_t size)
{
	return memory_contains(__init_begin, __init_end, virt, size);
}

Do we need to check against _sinittext and _einittext?

Your proposed generic code will work for powerpc and s390 because those
archs only test against __init_* anyway. I don't know if any platform
actually does place .init.text outside of __init_begin=>__init_end, but
the comment seems to suggest that they could.

Kind regards,
Daniel
