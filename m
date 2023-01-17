Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ABD66E624
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 19:35:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxHdC43B9z3fBY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 05:35:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=poslRgeb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=poslRgeb;
	dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxHcJ3Pcgz3cdB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 05:34:39 +1100 (AEDT)
Received: by mail-io1-xd36.google.com with SMTP id 203so4644109iou.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 10:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WQstPUbztcQ3oNJU/jnXWE9GGqVn0CTYXvJ///cN2gs=;
        b=poslRgebD7N051xL0dlQ/s+Ezqw18K2i/MiyhjW69tD8Q8EWVF96k5wFPqBT68fIx4
         UW+FBcvboauGVEVYcGOYlMCrKMALhEZA6FzdBO7hQ/yy98POithKQbpUgSoBLfCQX/0/
         mJFhqGlui74HddUG5gvjSzhjV1UFMflKwN3ojHD7sq+Of/9IGSYd4RX0Bny2aHq9T6kz
         t/LR7AstaK1J+f+cW7PCcQlb6SZ7W7jpqeEYhVrnXFbSmdgrsuHVjXiM0XSUrm5lu0IF
         OLrxwCiYBNX5chzmqbr8AiRTqv2U25IqwvgeRrbnbHsVx3+eSncfTAhX20VyHDelBId/
         G6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQstPUbztcQ3oNJU/jnXWE9GGqVn0CTYXvJ///cN2gs=;
        b=ASo7JY2xiG0dMmK+TyjQHlJlmiiDwG2pPLxHk7gd9bm99DSB1DzwmTIdTtEK2NpGux
         xUGV+N13MmZQhmzHUvoOPu4nA2vmsbLrdL4WHe+npLFJcBvDwydSp60ephb7BXsZiFe+
         RGiV3PIF/Cb3JsyYLTaJLu036C7Zm03lFIsKfOxj/9Jncs1KgCUyXciFGyaVIdcptDJg
         fx/YnuZ2T9exPmQzxhkWOwy42V8+5s6R48MWtM+fg3Zw+gQESvcEGT4fyBMxBj42kkWg
         CQ5ANRhkrvtjjE11xM4KduOszansjbAr6UzNBju+40tmpq8BJEASc6MGi7PPN/FSM2Cn
         nAdw==
X-Gm-Message-State: AFqh2kr/l19FHpmiJ0r9vpPP+bo/WndH14d47EHyMpsSzU9NkYJM07j4
	ioDTW2pRFovBr7AfeZQxLr3UTujvkYUd5Nvo/gmPFQ==
X-Google-Smtp-Source: AMrXdXvKN7wlexSy7gop1ACSgNR8UjrskPXnJONDdTkzOd0szS0kK6a+OFW7XqVKezwp7mdwKsCdCkJZHIHSfB+9s1E=
X-Received: by 2002:a02:aa99:0:b0:38a:49b8:bc49 with SMTP id
 u25-20020a02aa99000000b0038a49b8bc49mr335554jai.66.1673980475940; Tue, 17 Jan
 2023 10:34:35 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-41-surenb@google.com>
In-Reply-To: <20230109205336.3665937-41-surenb@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 17 Jan 2023 19:33:59 +0100
Message-ID: <CAG48ez1=-tY8nrsX+T=AJBmW05E8sAvZNj80Wev9sGwR9NZysQ@mail.gmail.com>
Subject: Re: [PATCH 40/41] mm: separate vma->lock from vm_area_struct
To: Suren Baghdasaryan <surenb@google.com>
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

On Mon, Jan 9, 2023 at 9:55 PM Suren Baghdasaryan <surenb@google.com> wrote:
> vma->lock being part of the vm_area_struct causes performance regression
> during page faults because during contention its count and owner fields
> are constantly updated and having other parts of vm_area_struct used
> during page fault handling next to them causes constant cache line
> bouncing. Fix that by moving the lock outside of the vm_area_struct.
> All attempts to keep vma->lock inside vm_area_struct in a separate
> cache line still produce performance regression especially on NUMA
> machines. Smallest regression was achieved when lock is placed in the
> fourth cache line but that bloats vm_area_struct to 256 bytes.

Just checking: When you tested putting the lock in different cache
lines, did you force the slab allocator to actually store the
vm_area_struct with cacheline alignment (by setting SLAB_HWCACHE_ALIGN
on the slab or with a ____cacheline_aligned_in_smp on the struct
definition)?
