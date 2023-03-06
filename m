Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D628A6AC98B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 18:14:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVlYl4r5dz3f3Z
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 04:14:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lwipPy4w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lwipPy4w;
	dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVlXr5DzDz3c7K
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 04:13:47 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so8686102wmb.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 09:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678122821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gj13L4BUXvytGxxa1g10XICA4jSK6uFNLJQ+EdDsYDA=;
        b=lwipPy4w6ZgFewdDOcufE0PASv0Lac+0DO0Al+fxtEKhmU+ZaF6Gsngrp7tVg8ZqvC
         4vUNOFnP5F0aJ3covIEcYDCx1OOY3IFTl0MD+XPNOCKRTAwqWDTE53DQqAPmkQXWKrXn
         CX9QKZe5xazXf7dHa4CkurYXCPrJnqOm66mOxVSNqLQj9VspZpYvLJT6Vd0dOYrPOMsx
         o/AqZx8wBnf5FiHgbd0PUYsNH5QDxm6f1k4DOPlakLgaS7TnNiHpfjYwhMa+pXHN6mHe
         Lrkn5uXddEl5eCCKdJx+9QV1p0yeoPuOxXYAZqUpYmN2TmIrMAJlzE5fN6kA33RkEqrY
         UDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678122821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gj13L4BUXvytGxxa1g10XICA4jSK6uFNLJQ+EdDsYDA=;
        b=fIoOOeUbphKpZ9yY6Q3xxpsXvcdaii0cnRqsKHifJoBGk6JbwQGW8c9qK9dvSTghRU
         sHSkCcPbeZuHT1K1CxNyyvK57WOaDo8HgSsRlQLAhyJSzJ0JKIKPIaLPnuqb2jBdqFVL
         ozEUtEfCOQso5MiRGRT2DEZcsE6BDGY9iOYPF3MRb55ZJsarxEVAd46X2ZMJrpN6OZaK
         Xa7vqxWPNGzgnL3r0xt2om2+sH3bvrBrIejs9cMp9hVi32fgUR/PhS7PjKJwlhle9AOu
         fgYjmp2RgETgqrUpaPVIJ2YPmW1/ADfw4JdwGaA4FtG+Gd2tM4BxKcG3Q1WudjWL9RHN
         f1AQ==
X-Gm-Message-State: AO0yUKXhEVnJJiHGIL+fGw+PMMMFth+5bVa8Oj0IhN14HwrjFPY3vvzv
	F+eRAJW99IdvFKbVD+OfBfjG3k6+Wfq4k1+5WUpcZw==
X-Google-Smtp-Source: AK7set+NlylrgXCQEd0NBIjjvBltXMJIo9VQQCn7U8WLf0FuBNSvm77ccyWMsIkMAvFmtisDe11jLksGFkRy2hy2Nek=
X-Received: by 2002:a05:600c:a3a2:b0:3eb:246d:7ee6 with SMTP id
 hn34-20020a05600ca3a200b003eb246d7ee6mr2574115wmb.3.1678122821567; Mon, 06
 Mar 2023 09:13:41 -0800 (PST)
MIME-Version: 1.0
References: <20230306135520.4222-1-ldufour@linux.ibm.com> <7161f75e-9f40-f881-84b8-1eaaec0b0e3f@redhat.com>
 <d720d943-ea5d-451b-b8fa-ec9ad56f6dbf@linux.ibm.com>
In-Reply-To: <d720d943-ea5d-451b-b8fa-ec9ad56f6dbf@linux.ibm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 6 Mar 2023 09:13:29 -0800
Message-ID: <CAJuCfpEEcWcU26n11t=r9DKj8DH41E=rdA3=81BDpTKp9PPKEA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/mm: fix mmap_lock bad unlock
To: Laurent Dufour <ldufour@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Sachin Sant <sachinp@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 6, 2023 at 6:09 AM Laurent Dufour <ldufour@linux.ibm.com> wrote:
>
> On 06/03/2023 15:07:26, David Hildenbrand wrote:
> > On 06.03.23 14:55, Laurent Dufour wrote:
> >> When page fault is tried holding the per VMA lock, bad_access_pkey() and
> >> bad_access() should not be called because it is assuming the mmap_lock is
> >> held.
> >> In the case a bad access is detected, fall back to the default path,
> >> grabbing the mmap_lock to handle the fault and report the error.
> >>
> >> Fixes: 169db3bb4609 ("powerc/mm: try VMA lock-based page fault handling
> >> first")
> >> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> >> Link:
> >> https://lore.kernel.org/linux-mm/842502FB-F99C-417C-9648-A37D0ECDC9CE@linux.ibm.com
> >> Cc: Suren Baghdasaryan <surenb@google.com>
> >> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> >> ---
> >>   arch/powerpc/mm/fault.c | 8 ++------
> >>   1 file changed, 2 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> >> index c7ae86b04b8a..e191b3ebd8d6 100644
> >> --- a/arch/powerpc/mm/fault.c
> >> +++ b/arch/powerpc/mm/fault.c
> >> @@ -479,17 +479,13 @@ static int ___do_page_fault(struct pt_regs *regs,
> >> unsigned long address,
> >>         if (unlikely(access_pkey_error(is_write, is_exec,
> >>                          (error_code & DSISR_KEYFAULT), vma))) {
> >> -        int rc = bad_access_pkey(regs, address, vma);
> >> -
> >>           vma_end_read(vma);
> >> -        return rc;
> >> +        goto lock_mmap;
> >>       }
> >>         if (unlikely(access_error(is_write, is_exec, vma))) {
> >> -        int rc = bad_access(regs, address);
> >> -
> >>           vma_end_read(vma);
> >> -        return rc;
> >> +        goto lock_mmap;
> >>       }
> >>         fault = handle_mm_fault(vma, address, flags |
> >> FAULT_FLAG_VMA_LOCK, regs);
> >
> > IIUC, that commit is neither upstream not in mm-stable -- it's unstable.
> > Maybe raise that as a review comment in reply to the original patch, so we
> > can easily connect the dots and squash it into the original, problematic
> > patch that is still under review.
> >
> Oh yes, I missed that. I'll reply to the Suren's thread.

Thanks Laurent! Seems simple enough to patch the original change.

>
> Thanks,
> Laurent.
