Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FB96759CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 17:21:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz4Wh2Vgpz3fHj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 03:21:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=a3fpOXPW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=a3fpOXPW;
	dkim-atps=neutral
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz4Vh2lDBz3cLb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 03:20:59 +1100 (AEDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-4c24993965eso79088307b3.12
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 08:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mfgPoshwuIu4b/1jDgs3cdlztQz/vsY4EyScZyBxABE=;
        b=a3fpOXPWNViHSb5VK8vv6GJ9OmjGr4J4zqU4T6ftPkVNCscUsuTtDDXL5UD9ux6sdV
         C0Qm2jvON+yzeEaRn5EGinE0oa53S+FAHBxJzKLsuFtanPw31pELeAvEJoY/yaBISJcM
         oZyV2Lj9bVOFMBWicMFpowezChEy/etWrkR++6jVuHqIjnOtt+gvWs/hH0z9I+hVbxLK
         DdHjJ3jcS58ULiPGvEyZtKwUEI8IP12OcCaoFotUfcap+K1AkIWIglgZwi5rcdiqfHFL
         rPSSgGWeY5keQ2LWcVC+CM7q02imT0drV8318cIgX8BCEYEkWOEzW/6DbkrmOLaX3cWG
         1G+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfgPoshwuIu4b/1jDgs3cdlztQz/vsY4EyScZyBxABE=;
        b=p7sT30OS66eZasOkaJQ72R6mwkUvkmVY1GxA5jJO/iSuvDrYpMjOqj5+/M8uuwsytL
         tb9vjzbPhPJVB274f4rOz87TmnSi53lN3bTppu0crZCNBUNSRGgIP0gtBJqj73AtdwRU
         Tk+y8gJeZ7RtJIu/44czx7wQjPGVMNBDshPov4FWxASTR8DmXHeNElaBH5Ixr3v4hs5Q
         +9tOHeomCBvzkMEMN58MjNwnVqBQYI9+nfHKGuWDNW2ufbY/dIldhTyBRTcyh2sLzkhI
         rJvUoynrksiE9Huj3cY00N4gH6/nCiRVRyjuMDPT8eRBqgo4pNNdtY/3qdQ4JeSlLers
         rmWA==
X-Gm-Message-State: AFqh2krQEwQUuhatmxbJ1zpJ2Xyp0m2BzeepPMF6w+2m4hx3flOIH7D0
	0toa86SV/6ycgC6v5nqqcPA5pGd1mbY0zn09q8V+Bw==
X-Google-Smtp-Source: AMrXdXvNN5DOlSBxjqhx1vO405B++97EByJYfshx6Ib0y61OUe+J+zmBSfLMkdUumg4HC6CkMKiKUEscqc4n/PQFmVk=
X-Received: by 2002:a0d:d484:0:b0:4dc:4113:f224 with SMTP id
 w126-20020a0dd484000000b004dc4113f224mr2100604ywd.455.1674231654470; Fri, 20
 Jan 2023 08:20:54 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-40-surenb@google.com>
 <Y8k+syJu7elWAjRj@dhcp22.suse.cz> <CAJuCfpEAL9y70KJ_a=Z_kJpJnNC-ge1aN2ofTupeQ5-FaKh84g@mail.gmail.com>
 <Y8pWW9Am3mDP53qJ@dhcp22.suse.cz>
In-Reply-To: <Y8pWW9Am3mDP53qJ@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 20 Jan 2023 08:20:43 -0800
Message-ID: <CAJuCfpHeuckG8YuNTgdDcNHNzJ3sQExD_f1hwXG_xmS7Z-925g@mail.gmail.com>
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

On Fri, Jan 20, 2023 at 12:52 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Thu 19-01-23 10:52:03, Suren Baghdasaryan wrote:
> > On Thu, Jan 19, 2023 at 4:59 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Mon 09-01-23 12:53:34, Suren Baghdasaryan wrote:
> > > > call_rcu() can take a long time when callback offloading is enabled.
> > > > Its use in the vm_area_free can cause regressions in the exit path when
> > > > multiple VMAs are being freed. To minimize that impact, place VMAs into
> > > > a list and free them in groups using one call_rcu() call per group.
> > >
> > > After some more clarification I can understand how call_rcu might not be
> > > super happy about thousands of callbacks to be invoked and I do agree
> > > that this is not really optimal.
> > >
> > > On the other hand I do not like this solution much either.
> > > VM_AREA_FREE_LIST_MAX is arbitrary and it won't really help all that
> > > much with processes with a huge number of vmas either. It would still be
> > > in housands of callbacks to be scheduled without a good reason.
> > >
> > > Instead, are there any other cases than remove_vma that need this
> > > batching? We could easily just link all the vmas into linked list and
> > > use a single call_rcu instead, no? This would both simplify the
> > > implementation, remove the scaling issue as well and we do not have to
> > > argue whether VM_AREA_FREE_LIST_MAX should be epsilon or epsilon + 1.
> >
> > Yes, I agree the solution is not stellar. I wanted something simple
> > but this is probably too simple. OTOH keeping all dead vm_area_structs
> > on the list without hooking up a shrinker (additional complexity) does
> > not sound too appealing either.
>
> I suspect you have missed my idea. I do not really want to keep the list
> around or any shrinker. It is dead simple. Collect all vmas in
> remove_vma and then call_rcu the whole list at once after the whole list
> (be it from exit_mmap or remove_mt). See?

Yes, I understood your idea but keeping dead objects until the process
exits even when the system is low on memory (no shrinkers attached)
seems too wasteful. If we do this I would advocate for attaching a
shrinker.

>
> --
> Michal Hocko
> SUSE Labs
