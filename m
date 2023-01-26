Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5695267C201
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 01:52:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2Mcs1yTJz3fCn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 11:52:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hw634KVE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hw634KVE;
	dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2Mby4t52z2yHZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 11:51:58 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id d132so307607ybb.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 16:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=erqaH/f6aiKK2Y2revDVg8Kw4fhimJKEevbWpDvyDBg=;
        b=hw634KVELmZovB0koBFlTAd5HhJuv9a7pYcJyRWRKHoGtoQdRC7yF8vjOQ2U0bypmG
         bxJMDOSqi6YCIMq0O0u7h7DlvsucKb2iKlM/NvE7Dmx0WmnHc7FtctOsvR0ZSG7Pdi/c
         RIAivTP216iTEOjdE9b7cFfM4NXSuPy059FKCQhl9h+cH8k+Q2vVGluOc8e9Sq0ojcpT
         3LP64M2kOZduDnYP/DTPERa7qITWr9LoSvGDwwlcByzhMus0GTtyhtr99lMEUJLUgkVM
         Nvw0hslXpJWDqz1wU+kVDqiaq4XhMZ7lGAb1fmx6jFLYgoaep29ldxo9/UK06Uu6JPcS
         mLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=erqaH/f6aiKK2Y2revDVg8Kw4fhimJKEevbWpDvyDBg=;
        b=t5ycZW3nzRPB62A2w0rnzsYBT8kPUamCC3DPxQz9havV6Z/yYAMzSW4UPxStDWh0tG
         k03RbBbwPnvtm9+0walo71dNqC08gvdv2ovi7B5jtDu1NMLQAM6OUXx8L89+ktVrCKh2
         zRuhrypjqNbaek009AoWJKJNNPe/0LAnZZZO7RO4c3DbwSrMBwfVrfzLlrSjtupMXRTE
         sEeEKKziKdOz0JMQAqL35cJ47Uy8tctx9vXQPeUpYkJPsHP1kG4jlC1/JH60aRJWNzae
         k/8v8lXo684xyNBhLx8HSAgTRE2vEBGHhlY9lRgHFI7GhDR1P4A7Js0/bcGjr47sCNlG
         0CNw==
X-Gm-Message-State: AFqh2kqBy3UgS4YILKi4/ZNcUjLaKELKoJCQ4eDh3BO3Ywtpdvs2Ho5o
	E5gaO79yEGtrvKMGNhx+6ikTD+l8mF+DNaK3e7FdCA==
X-Google-Smtp-Source: AMrXdXuWS62n/voZpqLFx7lY106TWS0DFfvcP0at+KMVcEseFA31+u6DR/UW+7IKRl7uOX0L8iaQWbLpM1VsRjvwvbM=
X-Received: by 2002:a25:f305:0:b0:7b8:6d00:ef23 with SMTP id
 c5-20020a25f305000000b007b86d00ef23mr3939970ybs.119.1674694315876; Wed, 25
 Jan 2023 16:51:55 -0800 (PST)
MIME-Version: 1.0
References: <20230125233554.153109-1-surenb@google.com> <20230125233554.153109-3-surenb@google.com>
 <20230125162419.13379944d6c0d4253d7bc88c@linux-foundation.org>
In-Reply-To: <20230125162419.13379944d6c0d4253d7bc88c@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 25 Jan 2023 16:51:44 -0800
Message-ID: <CAJuCfpF21a7seLpEcoWbDLDWUznAOdQo9P6LERmi-iyKMgQGXA@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] mm: introduce vma->vm_flags wrapper functions
To: Andrew Morton <akpm@linux-foundation.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 25, 2023 at 4:24 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed, 25 Jan 2023 15:35:49 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
>
> > vm_flags are among VMA attributes which affect decisions like VMA merging
> > and splitting. Therefore all vm_flags modifications are performed after
> > taking exclusive mmap_lock to prevent vm_flags updates racing with such
> > operations. Introduce modifier functions for vm_flags to be used whenever
> > flags are updated. This way we can better check and control correct
> > locking behavior during these updates.
> >
> > ...
> >
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > +static inline void init_vm_flags(struct vm_area_struct *vma,
> > +static inline void reset_vm_flags(struct vm_area_struct *vma,
> > +static inline void set_vm_flags(struct vm_area_struct *vma,
> > +static inline void clear_vm_flags(struct vm_area_struct *vma,
> > +static inline void mod_vm_flags(struct vm_area_struct *vma,
>
> vm_flags_init(), vm_flags_reset(), etc?
>
> This would be more idiomatic and I do think the most-significant-first
> naming style is preferable.

Thanks for the suggestion! I will rename them in the next version.

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
