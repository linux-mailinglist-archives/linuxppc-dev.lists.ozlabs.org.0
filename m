Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE1873BA0D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 16:25:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=WwBmUsRk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnffZ0mXHz3bkm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 00:25:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=WwBmUsRk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3k6uvzaykdaqwierngksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnfdZ70Smz3bSt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 00:24:48 +1000 (AEST)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-666e6e5dfd0so330408b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 07:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687530283; x=1690122283;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BXhTC2v6pUxG+hsvCgrpr6X6lmLWxVBU76yUJ1it6mc=;
        b=WwBmUsRkRn+d8K/CUFTITZPAiijq+mNGS23VxcXDWgRBaO3YeaAb9CGn5UYNvw8xuE
         is8581SmMpYLnoN3gopCiZicYEgrIlJsgqac5H1AF7ZnOWhdoT9h/BpiJUczHfcku7Eh
         8EV0af9YQFDIB/M88OhnjoEMPnIzFEVdVKYHik/izpp1ocZFmTaCdfRNWjI8/9HG/6TR
         vEFtwtAgAzYJW7bYhgj26Z3Zt7pDbKqs7galF5t81QJPtacywYWIVDzFtPR/Kohip92r
         /JwmOjZm8bzsO7Vd9sH6FhVTDK7VsTg/K6DrmiJ7/tYERHbJzNcO5hUnVHih1KxcJZ91
         9ObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687530283; x=1690122283;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXhTC2v6pUxG+hsvCgrpr6X6lmLWxVBU76yUJ1it6mc=;
        b=hCCf9QMTvOk3TMBjHMwZEbb9KuP/5FuN/0305yCC+lEEeqVPuxuUohGl9IjhpxTPQK
         5BsUL1uNbsatvuupyKZgS4Vpa2rLLYaHUleZX/6tJt1f10GPU/fxu/rPmdfq+L271viJ
         R8yDf0wxFu83wHkHQRwoQ4s7j+9/7//6pOPiSsalW8HpnBjkxqLMa1UWWeu1nF5EES7J
         ppIdMrjcq2uZL6LnZx9PiYd7MqlP2Q8/7QwvAt56JE6qa9ra+781660xHZUdjUoU2QSx
         ZSwiTnWLnFlr8Rf3Xbp+G7p/Z/a0ulA5+vrkLB6HUgcGNJhigcstagsAJY9rYt/GP5ad
         TI6A==
X-Gm-Message-State: AC+VfDxY7cEuHd2TH5fIXpEAZYj/oGRZ7GopOLWuZfGkkwtmFTDhyPdq
	3I0Xs7+gupmewDE0P1Ow7gojtP6+MOQ=
X-Google-Smtp-Source: ACHHUZ6iBSV9DmoTyY1jspZcL24GA4euc/C+hM3clmSVzwcxNI+pnsjYRfjGYHdr6fPXdhC20bEdElnUsQU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:991:b0:659:ac9e:830 with SMTP id
 u17-20020a056a00099100b00659ac9e0830mr5944982pfg.2.1687530283463; Fri, 23 Jun
 2023 07:24:43 -0700 (PDT)
Date: Fri, 23 Jun 2023 07:24:42 -0700
In-Reply-To: <20230623125416.481755-3-thuth@redhat.com>
Mime-Version: 1.0
References: <20230623125416.481755-1-thuth@redhat.com> <20230623125416.481755-3-thuth@redhat.com>
Message-ID: <ZJWrKtnflTrskPkX@google.com>
Subject: Re: [kvm-unit-tests PATCH 2/2] Link with "-z noexecstack" to avoid
 warning from newer versions of ld
From: Sean Christopherson <seanjc@google.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico =?iso-8859-1?Q?B=F6hr?= <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 23, 2023, Thomas Huth wrote:
> Newer versions of ld (from binutils 2.40) complain on s390x and x86:
> 
>  ld: warning: s390x/cpu.o: missing .note.GNU-stack section implies
>               executable stack
>  ld: NOTE: This behaviour is deprecated and will be removed in a
>            future version of the linker
> 
> We can silence these warnings by using "-z noexecstack" for linking
> (which should not have any real influence on the kvm-unit-tests since
> the information from the ELF header is not used here anyway, so it's
> just cosmetics).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 0e5d85a1..20f7137c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -96,7 +96,7 @@ CFLAGS += -Woverride-init -Wmissing-prototypes -Wstrict-prototypes
>  
>  autodepend-flags = -MMD -MF $(dir $*).$(notdir $*).d
>  
> -LDFLAGS += -nostdlib
> +LDFLAGS += -nostdlib -z noexecstack

Drat, the pull request[1] I sent to Paolo yesterday only fixes x86[2].

Paolo, want me to redo the pull request to drop the x86-specific patch? 

[1] https://lore.kernel.org/all/20230622211440.2595272-1-seanjc@google.com
[2] https://lore.kernel.org/all/20230406220839.835163-1-seanjc@google.com
