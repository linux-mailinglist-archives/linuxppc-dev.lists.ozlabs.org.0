Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D26E3FC2A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 08:18:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzH7Z6kMxz2yJn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 16:18:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=emCEUMlI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=emCEUMlI; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzH6v1CX1z2xrH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 16:17:57 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 w19-20020a17090aaf9300b00191e6d10a19so1618930pjq.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 23:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=h12y69BzOdAqtGfc38mtOtL/jCEg2kKWm7ttfdSU3V0=;
 b=emCEUMlIwclLmJQocMR7Nf+pbHFowImda37C+Ud6SPflKSIYLYQF718TUTX8KR+Xhq
 fjhyRLZS3IJE8WCoVlQYfGfh7e4uDTSAnw2g6l1eZYG7KudOnCgj0EhOjqSOuL5xxWuf
 y6GVOT0nfPLGpJKb8WL2nBnCtzDqsJXiaNmbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=h12y69BzOdAqtGfc38mtOtL/jCEg2kKWm7ttfdSU3V0=;
 b=O7IRYWUuU5WIAUodNDahEThJ8XDZKa5gWsWhhKhSz/D1eQN3cMfipcD6M7nI/9jqrq
 cnmhtEFh8q2VS9XaKIV8zq4SfL1ybHNv7M8IpwumgENh34daXbSe8SdNbZDc9FvMtm+u
 hMTvtaGhilSDVpIFELPcGg4A52PtF0h/MSW63LLeq3PIPEtgELRtUAGEwec1DuAaGn6c
 BEa0KLvWx7sBWbjETZHJiwgD3oy+8BTL81wtzDH2BIJPStvz5/jepuBdo/QJWvo+tOci
 bcBqtHw4b+WaYlG7PRZFjka+bMSe/pv828+r1gd43KwdiWwrqKUucxInXMgr4teRNqIH
 K5mg==
X-Gm-Message-State: AOAM532YEb9QjoZfrg7qRnWl+RD8viZtBUmFWVPRUJD5WWBOmtyFSwoN
 qJJ3FgePOvVa18bIejvkJjombw==
X-Google-Smtp-Source: ABdhPJxpq2UUe896c6F9+t4U+EcOSQym3Unk4xrZMcWw0fCd5KpWqEqrhj8H2Qi7pXbsdRuKFGmwZA==
X-Received: by 2002:a17:90a:3849:: with SMTP id l9mr3384862pjf.7.1630390674896; 
 Mon, 30 Aug 2021 23:17:54 -0700 (PDT)
Received: from localhost ([2001:4479:e200:df00:a664:ffe7:ee94:4600])
 by smtp.gmail.com with ESMTPSA id u10sm15890366pfg.168.2021.08.30.23.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 23:17:54 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: Avoid link stack corruption in kexec_wait()
In-Reply-To: <3ffe7775f3fcda8e5fca6a7bc7db0b8251153c67.1629705147.git.christophe.leroy@csgroup.eu>
References: <3ffe7775f3fcda8e5fca6a7bc7db0b8251153c67.1629705147.git.christophe.leroy@csgroup.eu>
Date: Tue, 31 Aug 2021 16:17:52 +1000
Message-ID: <87ilzm6str.fsf@dja-thinkpad.axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

> Use bcl 20,31,+4 instead of bl in order to preserve link stack.
>
> See commit c974809a26a1 ("powerpc/vdso: Avoid link stack corruption
> in __get_datapage()") for details.

From my understanding of that commit message, the change helps to keep
the link stack correctly balanced which is helpful for performance,
rather than for correctness. If I understand correctly, kexec_wait is
not in a hot path - rather it is where CPUs spin while waiting for
kexec. Is there any benefit in using the more complicated opcode in this
situation?

> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/misc_64.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
> index 4b761a18a74d..613509907166 100644
> --- a/arch/powerpc/kernel/misc_64.S
> +++ b/arch/powerpc/kernel/misc_64.S
> @@ -255,7 +255,7 @@ _GLOBAL(scom970_write)
>   * Physical (hardware) cpu id should be in r3.
>   */
>  _GLOBAL(kexec_wait)
> -	bl	1f
> +	bcl	20,31,1f
>  1:	mflr	r5

Would it be better to create a macro of some sort to wrap this unusual
special form so that the meaning is more clear?

Kind regards,
Daniel

>  	addi	r5,r5,kexec_flag-1b
>  
> -- 
> 2.25.0
