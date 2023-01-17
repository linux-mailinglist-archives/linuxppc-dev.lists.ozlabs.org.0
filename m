Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD3466E5AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 19:12:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxH7F31g0z3cfg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 05:12:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LOjmK81s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=LOjmK81s;
	dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxH6G5rXjz3cGR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 05:12:05 +1100 (AEDT)
Received: by mail-io1-xd31.google.com with SMTP id 203so4614158iou.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 10:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dcrz3u05liU0MW9kY4AJIlBTNw63wTKDLbyoxh2Gq7o=;
        b=LOjmK81sP9RZFAMR4E8fCCpKxP67Nz6qc4uKkLVPkpHjSZ0SakfGstIAUpYIpSI07l
         aiQ3xDCMFAyArWyIbdn9MV2vFoK0FOFT9fpzj3uJjiQuKN+gHMlFt9Sz0VcR5i+Bzwe3
         Kx6DzAEpRZ+6HJ/hEuT2a0SqHWa/T36LxiDrEewq7V3aM5yNWU4iXZYCAoNVQkEY7sdw
         6eQQ9GO4uGLBoOuC/ENtRzBdFIOLybzL/F0OeALa9dyEoJtEvEBKcNkVp1GqE5OEw78i
         QradsZza/j1i5r7w3V7jkhtJPrbMQH+Z5nrzIVonts+Wo9joxZLWOtKfFMNC3Ueb23YO
         utyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcrz3u05liU0MW9kY4AJIlBTNw63wTKDLbyoxh2Gq7o=;
        b=hXxGueNOJsshCTYRyveSSxlp3cEiT9LtLiFBapZRo3tQ2M2fLcbU0pq5fWQXKVPCWz
         FK0Eq/57s62JeodWlZ5apRE5ZYX1Tti15ohGwDVHwrKqJ3Ue6BHLAaAW9Th4lZjw/a5P
         GPrGUMB08ILzxuj9CayoVVTSfGI84Zzuhi+Pr+2215xjYnoVbShjhUula6Fl7t/XPI5u
         A1MAXOuegnedvNb5UNYxI1xKGCt56O1ENsw8x56j2Oq3faahmJFd6cKpyafmMDv7pSeB
         3SNfirmA+GVdorKoZ5qm4LDrbKpsKf/7MWNepZxtk4o7VCG+OaqVl0DCNjUvg4FXgn7W
         Oumw==
X-Gm-Message-State: AFqh2kpDGd/tSzBqDr9bhX/rfaL6Rmj9j9myI27/pNt0tAmoMksPQBwj
	dqrAl3zV0gFJYK8sNiTGS2+EDFbbh7wARleK+QilZQ==
X-Google-Smtp-Source: AMrXdXsgW7Mw7qSRUXKXfN+rdxMVcw5NgXHaFtzV+np+Si6HoBmXxOeDmNDFe8VfWaSsmByezu+xjIBOp9/ez1+o9/0=
X-Received: by 2002:a02:c884:0:b0:39e:9d33:a47 with SMTP id
 m4-20020a02c884000000b0039e9d330a47mr264435jao.58.1673979122352; Tue, 17 Jan
 2023 10:12:02 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-42-surenb@google.com>
In-Reply-To: <20230109205336.3665937-42-surenb@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 17 Jan 2023 19:11:26 +0100
Message-ID: <CAG48ez3ZNt+B3XvAMP1OaeEYuwpXJ1epmT9YtNonFLEJ6yANVQ@mail.gmail.com>
Subject: Re: [PATCH 41/41] mm: replace rw_semaphore with atomic_t in vma_lock
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
> rw_semaphore is a sizable structure of 40 bytes and consumes
> considerable space for each vm_area_struct. However vma_lock has
> two important specifics which can be used to replace rw_semaphore
> with a simpler structure:
[...]
>  static inline void vma_read_unlock(struct vm_area_struct *vma)
>  {
> -       up_read(&vma->vm_lock->lock);
> +       if (atomic_dec_and_test(&vma->vm_lock->count))
> +               wake_up(&vma->vm_mm->vma_writer_wait);
>  }

I haven't properly reviewed this, but this bit looks like a
use-after-free because you're accessing the vma after dropping your
reference on it. You'd have to first look up the vma->vm_mm, then do
the atomic_dec_and_test(), and afterwards do the wake_up() without
touching the vma. Or alternatively wrap the whole thing in an RCU
read-side critical section if the VMA is freed with RCU delay.
