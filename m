Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6B267838A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 18:47:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0yGw2jJ0z3cdD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 04:47:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=SdR/39hw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=SdR/39hw;
	dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0yG21zFVz3bSk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 04:46:34 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 123so15815490ybv.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 09:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XGfK59iWA2VlvgRXkqRDqLtLKye7Z5SSTP2RGu4Ar9c=;
        b=SdR/39hwgrAyKI4iGTaqEHY0PZx07Qq2iedH3AUTUZ1UbDUzkBukyUzn44oMlC56Q3
         lkroO9Cs7sD/B778Bv2Qfm5VLknd6XgJWRlnBxIG40CWw30+itJvuAQtdRVW9AH1Xay1
         KHj4xgWmJVEYuFp1ks8zPeSyal00rHWScfhwzQK3TM6RuZ9KJBIooS8YCnaAfUjDoSaR
         OKvFhrSSIlS7uiQQ/Jz51PzTN/X8l55QxRJYPJV2dK0vYMsU2JePdTp7/piHNQHUsCuO
         xKSnavE7rZxGa/wdyvkSpsuC03skPO5h7FOhPT10JRmp/3aHuwtuBNCTcnCuwJlm9dGH
         BTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGfK59iWA2VlvgRXkqRDqLtLKye7Z5SSTP2RGu4Ar9c=;
        b=rPOCvPAFutJboikJEviuCmY5JXgjVOZQFH9IYCKdfv5hGuWD+XERLHfMsAY/RWv9GR
         mNmpzUh1ahXsIOA7ATBJ08kv1kl474WU9oX56Zcl/Y9X5wl9WIXG1L9NqmjhQkKtkkYb
         lv2904Wl3v7+hd8P2CNHI9uqZo7AtUiFDm5IqEdvlvHkxn+EzYXgY2nI1+KXpp48SgOd
         89SVpp0jMgZuaB5ymaaLR++7VmapIVFzzroCVj4zLFjAxstxA+/w9/f07AVF7EeaYR3K
         pgKTiwx2zn1GC/3FbsiQsQ2c8S/CatUIbHP6qJwDb9wLga3dfJVZUsd6KRfIEyLS69Pg
         lk5A==
X-Gm-Message-State: AFqh2kr1/l44RZJXkfXlr8A2loCmc9Lj08pqxn2PyIfSys9B2k7mqYpi
	B/OY8svEnuLy10U7ql/H+3Hc54yP6CYXwl6bRCaTDg==
X-Google-Smtp-Source: AMrXdXteaJfzBdOfhYOTTo0923koQH1CezojDs1FTte0YsILtf2ySXsBRH58x0a8KuKynJ5TyY0FxTcWX+1TjHC2E1Q=
X-Received: by 2002:a25:9801:0:b0:7d5:b884:3617 with SMTP id
 a1-20020a259801000000b007d5b8843617mr2229246ybo.380.1674495991353; Mon, 23
 Jan 2023 09:46:31 -0800 (PST)
MIME-Version: 1.0
References: <CAJuCfpF20nuP6Meib9h7NVrJv+wybYS==vZFQXxUW6n-ir9bvQ@mail.gmail.com>
 <Y8rGJq8LvX2C+Cr7@casper.infradead.org> <20230120170815.yuylbs27r6xcjpq5@revolver>
 <CAJuCfpH4o-iCmzdUcYD9bKieJ6-k-MZYLuHFhH+bN9yE07sibw@mail.gmail.com>
 <Y8rQNj5dVyuxRBOf@casper.infradead.org> <CAJuCfpG3YaExGkzsSSm0tXjMiSoM6rVf0JQgfrWu4UY5gsw=-w@mail.gmail.com>
 <Y85Z0Ovl68o4cz2j@dhcp22.suse.cz> <CAJuCfpG86qc4odkpUbzuROb+jThQgXGWjcFXb0e-c2i0wEGg4g@mail.gmail.com>
 <Y868Fadajv27QMXh@dhcp22.suse.cz> <CAJuCfpGSCHpnZwwVV_922fmMBpFPZL0HAHMABuDzMfuURF2sWg@mail.gmail.com>
 <Y87A2CEKAugfgfHC@dhcp22.suse.cz>
In-Reply-To: <Y87A2CEKAugfgfHC@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 23 Jan 2023 09:46:20 -0800
Message-ID: <CAJuCfpGJRZATfc8eUurvV5kGkSNkG=vK=sfwJbU72PESOyATSw@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, Matthew Wilcox <willy@infradead.org>, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, "Liam R. Howlett" <Liam.Howlett@oracle.com>, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@g
 oogle.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 23, 2023 at 9:16 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Mon 23-01-23 09:07:34, Suren Baghdasaryan wrote:
> > On Mon, Jan 23, 2023 at 8:55 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Mon 23-01-23 08:22:53, Suren Baghdasaryan wrote:
> > > > On Mon, Jan 23, 2023 at 1:56 AM Michal Hocko <mhocko@suse.com> wrote:
> > > > >
> > > > > On Fri 20-01-23 09:50:01, Suren Baghdasaryan wrote:
> > > > > > On Fri, Jan 20, 2023 at 9:32 AM Matthew Wilcox <willy@infradead.org> wrote:
> > > > > [...]
> > > > > > > The page fault handler (or whatever other reader -- ptrace, proc, etc)
> > > > > > > should have a refcount on the mm_struct, so we can't be in this path
> > > > > > > trying to free VMAs.  Right?
> > > > > >
> > > > > > Hmm. That sounds right. I checked process_mrelease() as well, which
> > > > > > operated on mm with only mmgrab()+mmap_read_lock() but it only unmaps
> > > > > > VMAs without freeing them, so we are still good. Michal, do you agree
> > > > > > this is ok?
> > > > >
> > > > > Don't we need RCU procetions for the vma life time assurance? Jann has
> > > > > already shown how rwsem is not safe wrt to unlock and free without RCU.
> > > >
> > > > Jann's case requires a thread freeing the VMA to be blocked on vma
> > > > write lock waiting for the vma real lock to be released by a page
> > > > fault handler. However exit_mmap() means mm->mm_users==0, which in
> > > > turn suggests that there are no racing page fault handlers and no new
> > > > page fault handlers will appear. Is that a correct assumption? If so,
> > > > then races with page fault handlers can't happen while in exit_mmap().
> > > > Any other path (other than page fault handlers), accesses vma->lock
> > > > under protection of mmap_lock (for read or write, does not matter).
> > > > One exception is when we operate on an isolated VMA, then we don't
> > > > need mmap_lock protection, but exit_mmap() does not deal with isolated
> > > > VMAs, so out of scope here. exit_mmap() frees vm_area_structs under
> > > > protection of mmap_lock in write mode, so races with anything other
> > > > than page fault handler should be safe as they are today.
> > >
> > > I do not see you talking about #PF (RCU + vma read lock protected) with
> > > munmap. It is my understanding that the latter will synchronize over per
> > > vma lock (along with mmap_lock exclusive locking). But then we are back
> > > to the lifetime guarantees, or do I miss anything.
> >
> > munmap() or any VMA-freeing operation other than exit_mmap() will free
> > using call_rcu(), as implemented today. The suggestion is to free VMAs
> > directly, without RCU grace period only when done from exit_mmap().
>
> OK, I have clearly missed that. This makes more sense but it also adds
> some more complexity and assumptions - a harder to maintain code in the
> end. Whoever wants to touch this scheme in future would have to
> re-evaluate all of them. So, I would just avoid that special casing if
> that is feasible.

Ok, I understand your point.

>
> Dealing with the flood of call_rcu during exit_mmap is a trivial thing
> to deal with as proposed elsewhere (just batch all of them in a single
> run). This will surely add some more code but at least the locking would
> consistent.

Yes, batching the vmas into a list and draining it in remove_mt() and
exit_mmap() as you suggested makes sense to me and is quite simple.
Let's do that if nobody has objections.

> --
> Michal Hocko
> SUSE Labs
