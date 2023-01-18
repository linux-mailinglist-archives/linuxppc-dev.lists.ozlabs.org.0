Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 678BA67265F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 19:10:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nxv1x1W7pz3fBD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 05:10:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RdMZLq/Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RdMZLq/Q;
	dkim-atps=neutral
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxv130mjyz3bY0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 05:09:42 +1100 (AEDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-4c131bede4bso479784377b3.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 10:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N/4EcSnYgCt7dm1vNWuzZoT1Acf95uMzMIRPStS3MFc=;
        b=RdMZLq/QQKbxmGqQjXr2SeQws/2SpJNVIc1YXEDJY02ia+icN35A9Qz9jYm2yUdvEd
         Xr+WWARyr0zV20f7yWYlcOhGvzWd8O8v81a9FJglG8qskf5nz0R7uGPjkiKhwo2NA/0H
         W2V5YnwNjP9h+XiZgS9gFvIcACLINv66ZmymmN6T0zNrurs7rcDth7z1bX/qCvlkRrTg
         cqrOYqdgFn4Ze7NJzTVZt7+ZIh80R64qt1dfA87Xrn1ABHiwTzck+/URo7+EwgLdO6vg
         /jhlLK73LBaFi/fbg7bG9ean2FWK1dwMJBf962UEC2hTydBhcydgnQY6B2wgHquKYb0d
         IBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/4EcSnYgCt7dm1vNWuzZoT1Acf95uMzMIRPStS3MFc=;
        b=CaQ+pznrsUNeCVRbb5L8ZZmef4lr/CW/kGAWS+wqhr7DQjvN0C3ilzPyIcrNd36PQv
         9EIUYRtNebZh2idiaTDAWa+dBEOxPlALWTr/55X2D1a/C+X1K+AZaR0T5sMS5QJ2tvpw
         qjXprHrFCmFMkoc4SA2kyhRYN9B3aFfwRGNHEexgriL2wXBFR2CImPrxkANYd5znFZvV
         p6klTV5kgGKQRfTCIjnPqPlQc+5fJVUxNcaFHhizLVr6YjbacYWHNwFamRmRH1BvMfG1
         ff8TojhJc/BkwSLs6VKGAxpF2bOeJS5uzcsqdYVVH5v43Zi333JMY66rlBOKPDtMfMaQ
         woRA==
X-Gm-Message-State: AFqh2kpPS+H3VVMbK92FD3ETQhVcBpSZw0NLOungvmDG1DltCJ7Re40z
	Td7jUYQwmkcMbug98iKPfiMXJSsq9ntaevLv850HSw==
X-Google-Smtp-Source: AMrXdXuWCJrbgxuKUwMr0EieyUKi+tebQWoa61PUevsrL055U9RwXQHwmG3dI3jim2t9TghOc/KsUXPKuAsyvHfLBDM=
X-Received: by 2002:a81:9105:0:b0:3dc:fd91:ef89 with SMTP id
 i5-20020a819105000000b003dcfd91ef89mr872169ywg.347.1674065380386; Wed, 18 Jan
 2023 10:09:40 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-18-surenb@google.com>
 <Y8a734ufLZjPHgtT@dhcp22.suse.cz> <CAJuCfpGoYaF2-z7FCiN4X8gEGD6nAwnQC+=n3tUHuMWZa7zx8Q@mail.gmail.com>
 <Y8e6lm76fIoT0603@dhcp22.suse.cz>
In-Reply-To: <Y8e6lm76fIoT0603@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Jan 2023 10:09:29 -0800
Message-ID: <CAJuCfpHtV5xEo97X62uR=LXjK6wQMJXhhV2OxXexTfyudGOptw@mail.gmail.com>
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

On Wed, Jan 18, 2023 at 1:23 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Tue 17-01-23 18:01:01, Suren Baghdasaryan wrote:
> > On Tue, Jan 17, 2023 at 7:16 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Mon 09-01-23 12:53:12, Suren Baghdasaryan wrote:
> > > > Move VMA flag modification (which now implies VMA locking) before
> > > > anon_vma_lock_write to match the locking order of page fault handler.
> > >
> > > Does this changelog assumes per vma locking in the #PF?
> >
> > Hmm, you are right. Page fault handlers do not use per-vma locks yet
> > but the changelog already talks about that. Maybe I should change it
> > to simply:
> > ```
> > Move VMA flag modification (which now implies VMA locking) before
> > vma_adjust_trans_huge() to ensure the modifications are done after VMA
> > has been locked.
>
> Because ....

because vma_adjust_trans_huge() modifies the VMA and such
modifications should be done under VMA write-lock protection.

>
> Withtout that additional reasonaning it is not really clear why that is
> needed and seems arbitrary.

Would the above be a good reasoning?

>
> --
> Michal Hocko
> SUSE Labs
