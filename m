Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D635A67D108
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 17:11:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2m0v4jclz3cJC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 03:11:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dnxwXMBL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dnxwXMBL;
	dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2m0101wwz2ylk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 03:10:39 +1100 (AEDT)
Received: by mail-yb1-xb32.google.com with SMTP id 129so2611080ybb.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 08:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZillkAQcPkfKcuR5z2FouZl025AEUWnaCf8P3oZ7OXA=;
        b=dnxwXMBLep5R+FehvqPgRhUAguuUtvmXE3Ig6NgptPHYVWIRfyKSvsp5vzKcOhhin8
         Y8Xtmu+WwcdZSDk6wkPgW7Fvaeq2vIQEHqJcRKjz3HMN0WxNn5YkqCtyW+tukJBK/H6B
         2a95hltksedzFqojZM11HXR5tDWNzKtsfI34jfOPOy3rYuwkMiq/4uLqkh02F9NnXaON
         LIzRMI4TVIAYMq5JVOiYS/9h1FSjJ+kkcjInPnFxFs5N3qv5B0l8RSyBNdfLEOEvS+H5
         zvs/hmgowHhxsRrzAOlo0dJxHNc/nC7Fo/Vb1sNUS2zO713oOq7Jv9SDri/HSNsmK9jD
         7y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZillkAQcPkfKcuR5z2FouZl025AEUWnaCf8P3oZ7OXA=;
        b=pCnm1W2LOs86/c6aRjLLMPDNe/syotN7uwkJ1MYc3UB+PCiVBFP9JwX22Wecn+ClF+
         ViLOL7uQFIZZEOYONbGxl9iLStNfdhK9qSdGbyBSUmJ3zZaPxxZ0k98IUbVTNbev5U5C
         bjJ60ltM33LM5wgM3NfPAifTlBTDvI5yFJ4OcBB+OPVgZPH9ACohnhb4hawAy3A1kMpo
         9C9zntJ8hsKXijlLSeaoC/p1QEIWikZ52KBcAVe5jmZVAxZo5irQeM5xqh/rJGAsl6rZ
         S8YAKnmwXb7ZHKvQqs0FHjqhvf3uUSzGmJQY7C/0skDjaFZ7UOHyRnpO3mtxMGQDeeu/
         UQkA==
X-Gm-Message-State: AO0yUKUGA1XNqRWhLB5qmWfdWE8JPN2HYgVXiMGYKOvJ0PS+IcOsg07z
	8zxYntbfaDFsr8iWF0QTwcAyRINdeEq68VDu4fFfQg==
X-Google-Smtp-Source: AK7set9O1l93hGrWLunCpG3rRqj7icW6f5ntPr5CkFep+bB1YJY+4Iq5pDRLfxFVN6CNNogAmMZ46djgKR1gZe+HLYY=
X-Received: by 2002:a25:5209:0:b0:80b:5988:2045 with SMTP id
 g9-20020a255209000000b0080b59882045mr1087115ybb.59.1674749437114; Thu, 26 Jan
 2023 08:10:37 -0800 (PST)
MIME-Version: 1.0
References: <20230125233554.153109-1-surenb@google.com> <20230125233554.153109-5-surenb@google.com>
 <20230126151015.ru2m26jkhwib6x6u@techsingularity.net>
In-Reply-To: <20230126151015.ru2m26jkhwib6x6u@techsingularity.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 26 Jan 2023 08:10:26 -0800
Message-ID: <CAJuCfpEzAbpy9rZ5KeZXQsqFTPOGYv6CZQfP9SHqcqFi0s7neg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] mm: replace vma->vm_flags direct modifications
 with modifier calls
To: Mel Gorman <mgorman@techsingularity.net>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 7:10 AM Mel Gorman <mgorman@techsingularity.net> wrote:
>
> On Wed, Jan 25, 2023 at 03:35:51PM -0800, Suren Baghdasaryan wrote:
> > Replace direct modifications to vma->vm_flags with calls to modifier
> > functions to be able to track flag changes and to keep vma locking
> > correctness.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Acked-by: Michal Hocko <mhocko@suse.com>
>
> Acked-by: Mel Gorman <mgorman@techsingularity.net>
>
> Minor comments that are safe to ignore.
>
> I think a better name for mod_vm_flags is set_clear_vm_flags to hint that
> the first flags are to be set and the second flags are to be cleared.
> For this patch, it doesn't matter, but it might avoid accidental swapping
> in the future.
>
> reset_vm_flags might also be better named as reinit_vma_flags (or
> vma_flags_reinit). Maybe also encourage the use of [set|clear_mod]_vm_flags
> where possible in the comment to track exactly what is changing and
> why. Some cases like userfaultfd just want to clear __VM_UFFD_FLAGS but
> altering the flow in this patch is inappropriate and error prone. Others
> such as the infiniband changes and madvise are a lot more complex.

That's a good point, but I don't want people to use mod_vm_flags() for
the cases when the order of set/clear really matters. In such cases
set_vm_flags() and clear_vm_flags() should be explicitly used. Maybe
to make that clear I should add a comment and rewrite the functions
as:

void mod_vm_flags(vma, set, clear) {
    vma.vm_flags = vma.vm_flags | set & clear;
}

In this patchset it's not that obvious but mod_vm_flags() was really
introduced in the original per-VMA lock patchset for efficiency to
avoid taking extra per-VMA locks. A combo of
set_vm_flags()+clear_vm_flags() would try to retake the same per-VMA
lock in the second call while mod_vm_flags() takes the lock only once
and does both operations. Not a huge overhead because we check if the
lock is already taken and bail out early but still...
So, would the above modification to mod_vm_flags() address your concern?

>
> --
> Mel Gorman
> SUSE Labs
