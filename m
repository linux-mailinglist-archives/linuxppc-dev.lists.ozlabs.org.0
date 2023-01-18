Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FBD671102
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 03:17:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxTsw2wtMz3cdQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 13:17:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LEYLSbN+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LEYLSbN+;
	dkim-atps=neutral
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxTs017WXz30hh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 13:16:19 +1100 (AEDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-4bf16baa865so448558527b3.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 18:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=plQIjN2wQ9XQXBQ5PSme4vUCmLrYkEIK9If4doKFLBI=;
        b=LEYLSbN+VJha9Y8r6nX3W37X12OGy8n862kizG4i1KEMLBQvAcrAa7awSx1mGj6i1M
         UZO5TbjxfJVrwATY1r5dwUg8ulM2yFaaEytzlAWSqp+tigueh/wVI7At443/LMXGGcdV
         02aU2qgTw4KyyW2cVar/Q+JPbd/GajrGO3fhydG8cNxnsGEj2DNXX1lHjQcNta+ndKLq
         VlrCSw29Fmnei5ErjNjvLZbBUUKgepCwNTFqoqk9hXLiOqQJA6NxpzwZj5tNijHCrCY0
         zNFBA/nJjj38TAHajL1bHQYqy86Qx8fnD261/akARVMdMAHEV4rhTf3wbpcFOTD1vzhT
         StSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plQIjN2wQ9XQXBQ5PSme4vUCmLrYkEIK9If4doKFLBI=;
        b=hoO+KYJxQCd12hbxGBMHR0JDso1FGH0jWk3NLV4fxRBQhoqlt6p95mxtRk5AVxP83E
         bSa8r9IAF33138lZ+yraxaGtnNX5uNcfgqqXOPXXbatMXQOCIlmP3WE+0Q7LlgWxJIRZ
         9mS5zfjFoy+4xSLW0UmwHsyVNMku+snUteLp5Da7S2f4rvus6pwv996wIHBc8I6gVKoP
         XSsfQhbKFOCmyheMvgg4umMgSWdjOTgUivYdz2uEaq7tSpMCj5NZmkVHcozZzFypF0/o
         R1iCBZa8Qhe8fUT+XbVnZCL1nEwtKhSmICM9a5kZNQYb8AEBpzTeGEZwMxTLMWC4RWcZ
         NlLg==
X-Gm-Message-State: AFqh2kpz66EIBPaNw4mW8ot4nuhXVJ6XFJk2mmBKreeaF1jeAyrn7CEm
	u4xGxYx+E351uO1C62k3McJFZb+XNQc+a3B0JKqhVA==
X-Google-Smtp-Source: AMrXdXu0PzeQzUrtMPh6Q6gmLxuEYbH19qaRWq6JHAbxojJ61ekKXs60PExdWQAgVi5xOUd0vb27BXUobHRewBc0eVw=
X-Received: by 2002:a81:9105:0:b0:3dc:fd91:ef89 with SMTP id
 i5-20020a819105000000b003dcfd91ef89mr584557ywg.347.1674008176468; Tue, 17 Jan
 2023 18:16:16 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-10-surenb@google.com>
 <Y8av6HjRUvaujeEO@dhcp22.suse.cz>
In-Reply-To: <Y8av6HjRUvaujeEO@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 18:16:05 -0800
Message-ID: <CAJuCfpFNp5dZvhx168k0MC+oBTRLY2ZVWgMQL_8VTZDTY3URDg@mail.gmail.com>
Subject: Re: [PATCH 09/41] mm: rcu safe VMA freeing
To: Michal Hocko <mhocko@suse.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.ne
 t
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 6:25 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Mon 09-01-23 12:53:04, Suren Baghdasaryan wrote:
> [...]
> >  void vm_area_free(struct vm_area_struct *vma)
> >  {
> >       free_anon_vma_name(vma);
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +     call_rcu(&vma->vm_rcu, __vm_area_free);
> > +#else
> >       kmem_cache_free(vm_area_cachep, vma);
> > +#endif
>
> Is it safe to have vma with already freed vma_name? I suspect this is
> safe because of mmap_lock but is there any reason to split the freeing
> process and have this potential UAF lurking?

It should be safe because VMA is either locked or has been isolated
while locked, so no page fault handlers should have access to it. But
you are right, moving free_anon_vma_name() into __vm_area_free() does
seem safer. Will make the change in the next rev.

>
> >  }
> >
> >  static void account_kernel_stack(struct task_struct *tsk, int account)
> > --
> > 2.39.0
>
> --
> Michal Hocko
> SUSE Labs
