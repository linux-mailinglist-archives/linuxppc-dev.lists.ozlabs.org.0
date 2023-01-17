Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFE566E681
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 20:02:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxJCz6d54z3fBm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 06:02:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=CjLP+GN4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=CjLP+GN4;
	dkim-atps=neutral
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxJC56Qyhz3c7x
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 06:01:20 +1100 (AEDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-4b718cab0e4so436203247b3.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 11:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LIZZvFyQtXHixD5sWfvEaQUvi24ljYnGZNh2fBEIyp4=;
        b=CjLP+GN4eJ8YGFZvjoqXnYn0mL/Nm9o57f+7WOJDJDHEjmOn/4ZZF6+enYJUFh56p6
         ZjMUPNGSRgQRosE3EMtoX1RXdV9HlQD3govS4EbUA9vX5E0lvyII7jNgKbkxa9q55Ofi
         5fHxRCrBasHddp+A5FhlnIGxMd1HsMsFjjUSptfu2Xn/GYum5SsgoXsfxk+bQ6S1eMxn
         TjquS1QRX6eEGqUoWMTLZ0Uen7LLC6vfFjMFZvmVjQlE+SMKypaTTEwOKRHnLLugiZMU
         Ca7UGjlXIklsuObkggD1KlRzV4LfytQE7UWnMkJIywJkawE+81OksYcPHkL0icjcL46L
         ZAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIZZvFyQtXHixD5sWfvEaQUvi24ljYnGZNh2fBEIyp4=;
        b=U/Vw4/a6eOteiUhbd2x3bATnY/cy8p9b6hXhCkmvS0VhyL3VUY1SyJUTAp6ZjM68nr
         ZfRIJQw9b5rvfmi6LIEv50SoWmSCqoDdlBIPNSN8g6C3mPDfJd2h7rCzw0Vmx7/jPeCX
         YhbOZsD+7fjZ/uQtymdH8j9Mh5YqXalLt8k+8JAM41AToJwIr1SB3E/pSRi3Ii4eTmob
         5rUirGG8n8TESCXzd7RrF9ORhUQnQ1h7N23+c3eufPfKGkkqNrZAJFgIAap8Ub+IoSdU
         luZlxHnFpQNyj4FMhsqra83xoS9++111iONQXhdCILBHBSL0D1zGwuylCQ5FO1m95dpY
         q5tA==
X-Gm-Message-State: AFqh2kpDqHtoOhliG3jccJ/RVwc/MgkmLWNBKZc0b8tVwLpdwJ1jmWnc
	WZmyxjkhYT9EVXVDY8hlm8uY3RFFI+JREHuAalrxiw==
X-Google-Smtp-Source: AMrXdXuXSHUCPjq8vGtgRecAo+K4qxgIc9+GydwwGOLIiPEqHLP5AyNSTg15twzR8exVpLWal97Wzf6SyesXXn7pY10=
X-Received: by 2002:a81:9105:0:b0:3dc:fd91:ef89 with SMTP id
 i5-20020a819105000000b003dcfd91ef89mr459982ywg.347.1673982078402; Tue, 17 Jan
 2023 11:01:18 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-41-surenb@google.com>
 <CAG48ez1=-tY8nrsX+T=AJBmW05E8sAvZNj80Wev9sGwR9NZysQ@mail.gmail.com>
In-Reply-To: <CAG48ez1=-tY8nrsX+T=AJBmW05E8sAvZNj80Wev9sGwR9NZysQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 11:01:07 -0800
Message-ID: <CAJuCfpHSZouW44MqdZxpAB_NAdimdU2kcZ2sDo2mfNCf_nmL3w@mail.gmail.com>
Subject: Re: [PATCH 40/41] mm: separate vma->lock from vm_area_struct
To: Jann Horn <jannh@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 10:34 AM Jann Horn <jannh@google.com> wrote:
>
> On Mon, Jan 9, 2023 at 9:55 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > vma->lock being part of the vm_area_struct causes performance regression
> > during page faults because during contention its count and owner fields
> > are constantly updated and having other parts of vm_area_struct used
> > during page fault handling next to them causes constant cache line
> > bouncing. Fix that by moving the lock outside of the vm_area_struct.
> > All attempts to keep vma->lock inside vm_area_struct in a separate
> > cache line still produce performance regression especially on NUMA
> > machines. Smallest regression was achieved when lock is placed in the
> > fourth cache line but that bloats vm_area_struct to 256 bytes.
>
> Just checking: When you tested putting the lock in different cache
> lines, did you force the slab allocator to actually store the
> vm_area_struct with cacheline alignment (by setting SLAB_HWCACHE_ALIGN
> on the slab or with a ____cacheline_aligned_in_smp on the struct
> definition)?

Yep, I tried all these combinations and still saw noticeable regression.
