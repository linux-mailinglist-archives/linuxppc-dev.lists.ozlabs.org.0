Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9E967415E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 19:54:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyWyd47j8z3fHX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 05:54:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=S6oQkRuW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=S6oQkRuW;
	dkim-atps=neutral
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyWxl4cGNz308w
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 05:54:03 +1100 (AEDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-4d19b2686a9so40574157b3.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 10:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8Hbmn5N3c+7Gw/65T8JMoIPDAauVRxveWrxDyVKiAmA=;
        b=S6oQkRuWnpsm0oT4EY6oDOfbr3SfXlxJH7te7SWEg4g+g+QkCCIHJyVvM61rjUg1bK
         HkfEMCh9wK5lUJodmfbK7ainv+lY3roQVUMfL/HPP08y9A44w50DedT2R8+d8v6OsM78
         F1TH/xLu7+OsivESTUy5pd8reCLyw5qIvwYjlAer3MZE9HacN6KiXvaYX56dy/vQTL6m
         sMkWfVw4nCd+YFJpTFuBVoDSt0VVx0yiFR6Ta24SRikrOGCNJ6oWFq04ugwVJaexrHis
         KMRX04ZxKbH2WCPyNDn4xag8MnSxGtMyIm49/3pOUlsPxEuRxCjxT98j/0u+1IwkNR3v
         eyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Hbmn5N3c+7Gw/65T8JMoIPDAauVRxveWrxDyVKiAmA=;
        b=blZWH8kGsmvvYw1Q3GaCGDkkkjGVDyY/x7NBDmQQvha8TrJRQVtMsyfJMxgssh6Nio
         lM4Zm3v9e7OjRsDV84cRhdLakGvSDhYlVPVtziAToC7qxErcBv2+whHvT2jc5BtZ7uhy
         c4CsEMuSThjZTX8cvjPBk8axXtrivrMF5RMtcL/QSDppi6QB9aE5o6+/wGtdDrd2cHVv
         tfLVZhwbyl1Jx8727YPqypEYTjWYjhGG8/92tk29c56QQEQ6dX0XMe3MTESrsavOfk2q
         Hqr9rL5bTmOqxhfNHb0E1KTpH7vl5WFSVHLO4daeL9bZEKiYGweeaEb+dyuPQXlrLWoy
         Gllw==
X-Gm-Message-State: AFqh2krmaoP04T1V+K8ldM/xHd/CAZoYQ63TUihxauq4OkDPMZFenUdy
	JG7PUxbiFoRG4mbR3jKnvCusn92YKKcDaoVDSRtcpA==
X-Google-Smtp-Source: AMrXdXvv2B+4vOLYHk76C7CB+4Wx7e94nPDtbp7xYrGWt3A23raxsvG0sNfvN79p2SmRHXJoa8xn07dPoTTQDNsV7Bk=
X-Received: by 2002:a81:1d2:0:b0:433:f1c0:3f1c with SMTP id
 201-20020a8101d2000000b00433f1c03f1cmr1593029ywb.438.1674154439858; Thu, 19
 Jan 2023 10:53:59 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-18-surenb@google.com>
 <Y8a734ufLZjPHgtT@dhcp22.suse.cz> <CAJuCfpGoYaF2-z7FCiN4X8gEGD6nAwnQC+=n3tUHuMWZa7zx8Q@mail.gmail.com>
 <Y8e6lm76fIoT0603@dhcp22.suse.cz> <CAJuCfpHtV5xEo97X62uR=LXjK6wQMJXhhV2OxXexTfyudGOptw@mail.gmail.com>
 <Y8hls4MH353ZnlQu@dhcp22.suse.cz> <CAJuCfpF3j5Sx+D5p5QPCHP4jcWZUiYm=FfUNYhc6QyHZQvDgpw@mail.gmail.com>
 <Y8kN3stHeEyAoB+D@dhcp22.suse.cz>
In-Reply-To: <Y8kN3stHeEyAoB+D@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 19 Jan 2023 10:53:48 -0800
Message-ID: <CAJuCfpHXvm7XxivP-E1tm5M=E9y9F1W=avDAiDBSTLBNmTcn4A@mail.gmail.com>
Subject: Re: [PATCH 17/41] mm/mmap: move VMA locking before
 anon_vma_lock_write call
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

On Thu, Jan 19, 2023 at 1:31 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Wed 18-01-23 13:48:13, Suren Baghdasaryan wrote:
> > On Wed, Jan 18, 2023 at 1:33 PM Michal Hocko <mhocko@suse.com> wrote:
> [...]
> > > So it will become:
> > > Move VMA flag modification (which now implies VMA locking) before
> > > vma_adjust_trans_huge() to ensure the modifications are done after VMA
> > > has been locked. Because vma_adjust_trans_huge() modifies the VMA and such
> > > modifications should be done under VMA write-lock protection.
> > >
> > > which is effectivelly saying
> > > vma_adjust_trans_huge() modifies the VMA and such modifications should
> > > be done under VMA write-lock protection so move VMA flag modifications
> > > before so all of them are covered by the same write protection.
> > >
> > > right?
> >
> > Yes, and the wording in the latter version is simpler to understand
> > IMO, so I would like to adopt it. Do you agree?
>
> of course.

Will update in the next respin. Thanks!

> --
> Michal Hocko
> SUSE Labs
