Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1867067414A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 19:53:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyWwg6Kdtz3fH5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 05:53:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mo0ihRCw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mo0ihRCw;
	dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyWvl4JpMz3fDT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 05:52:18 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id p15so133164ybu.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 10:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ToHyrSNIoPykkmHjpmy+AXA0uDswLz8tCL1AkqWK5E4=;
        b=mo0ihRCw6Y3aWSIWf6n6XXsp3Czez4pmBoLn4xxcvfC7MIJwMGncIVEoR+KlAAsFdZ
         X+KL3ImyMm7CDvgKDNaitAKtQYJmfDiQS5wzretGPDK1Mi1wi1p+dYAlWVDWQ7EB8COm
         73VnlegayZ9CXqL1k0bgORj7azfFIJkz0+xJkhEfX5/5LxFj6WaWcB6V5foMDa3ZSoca
         mTUKfpVRCQYGi2+eL0D4ZMiEMZnLqo9cHtAvJNd2hYyr8+pslpkuYm69SorYbX73aFGZ
         KE1jn5AwD+MqZBLCrvWROTxITII/UL5w0qzHVSzaDoEabOI+otr/5WNJbNSN6S8nkrsZ
         TpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ToHyrSNIoPykkmHjpmy+AXA0uDswLz8tCL1AkqWK5E4=;
        b=5h71NY2KfEhW3mWCb6Eq+EUFj6KtORWDL3oiCPUE7LDdPK7RYlgtRmK9RGVK5vJrtG
         2uy1q/8gJX1tfI0lfQKos9B2n7dAh8LDwaa2E07RJOKAOe4Lf7a7csKxqRLtg47moCLC
         KFi7Nlyg06xkIRnlEwKsOonkURTGv6GHHsJODoFomC/SaNn2yk/0mg6EhOeEU6d2zwXm
         L01ELbvh2iu8RtmevIfLKVUdVhDH0ThSqc0zhwfjMrWRktLHDC9BUebxyBUFeGxz+pLk
         VNArqbHCivsMX90gKWoKSuLCvgLHcsDeEZs4+xj+1j9tLVfxH4mlengVWJlfb1xgHvCv
         4OAQ==
X-Gm-Message-State: AFqh2kpJKNyN5DuaFOCwnTVjrA7WOTO8cybo3X/31lWZ5+YfOHurHgqA
	sviyO2PMQP51nIGD16GOgMqDf/0aTo1x7jc16yKjUQ==
X-Google-Smtp-Source: AMrXdXv4wX6M2y+O+IjiMg3HAJdiZYlyaI74hGgkr4eEujY3dQUI2lPzn402SgrjGkBzZXopyxNC269/MaskvyV/RAQ=
X-Received: by 2002:a25:9801:0:b0:7d5:b884:3617 with SMTP id
 a1-20020a259801000000b007d5b8843617mr1116250ybo.380.1674154334935; Thu, 19
 Jan 2023 10:52:14 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-40-surenb@google.com>
 <Y8k+syJu7elWAjRj@dhcp22.suse.cz>
In-Reply-To: <Y8k+syJu7elWAjRj@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 19 Jan 2023 10:52:03 -0800
Message-ID: <CAJuCfpEAL9y70KJ_a=Z_kJpJnNC-ge1aN2ofTupeQ5-FaKh84g@mail.gmail.com>
Subject: Re: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in vm_area_free
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

On Thu, Jan 19, 2023 at 4:59 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Mon 09-01-23 12:53:34, Suren Baghdasaryan wrote:
> > call_rcu() can take a long time when callback offloading is enabled.
> > Its use in the vm_area_free can cause regressions in the exit path when
> > multiple VMAs are being freed. To minimize that impact, place VMAs into
> > a list and free them in groups using one call_rcu() call per group.
>
> After some more clarification I can understand how call_rcu might not be
> super happy about thousands of callbacks to be invoked and I do agree
> that this is not really optimal.
>
> On the other hand I do not like this solution much either.
> VM_AREA_FREE_LIST_MAX is arbitrary and it won't really help all that
> much with processes with a huge number of vmas either. It would still be
> in housands of callbacks to be scheduled without a good reason.
>
> Instead, are there any other cases than remove_vma that need this
> batching? We could easily just link all the vmas into linked list and
> use a single call_rcu instead, no? This would both simplify the
> implementation, remove the scaling issue as well and we do not have to
> argue whether VM_AREA_FREE_LIST_MAX should be epsilon or epsilon + 1.

Yes, I agree the solution is not stellar. I wanted something simple
but this is probably too simple. OTOH keeping all dead vm_area_structs
on the list without hooking up a shrinker (additional complexity) does
not sound too appealing either. WDYT about time domain throttling to
limit draining the list to say once per second like this:

void vm_area_free(struct vm_area_struct *vma)
{
       struct mm_struct *mm = vma->vm_mm;
       bool drain;

       free_anon_vma_name(vma);

       spin_lock(&mm->vma_free_list.lock);
       list_add(&vma->vm_free_list, &mm->vma_free_list.head);
       mm->vma_free_list.size++;
-       drain = mm->vma_free_list.size > VM_AREA_FREE_LIST_MAX;
+       drain = jiffies > mm->last_drain_tm + HZ;

       spin_unlock(&mm->vma_free_list.lock);

-       if (drain)
+       if (drain) {
              drain_free_vmas(mm);
+             mm->last_drain_tm = jiffies;
+       }
}

Ultimately we want to prevent very frequent call_rcu() calls, so
throttling in the time domain seems appropriate. That's the simplest
way I can think of to address your concern about a quick spike in VMA
freeing. It does not place any restriction on the list size and we
might have excessive dead vm_area_structs if after a large spike there
are no vm_area_free() calls but I don't know if that's a real problem,
so not sure we should be addressing it at this time. WDYT?


>
> --
> Michal Hocko
> SUSE Labs
