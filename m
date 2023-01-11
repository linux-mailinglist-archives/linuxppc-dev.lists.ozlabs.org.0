Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD40665836
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 10:55:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsNMn6lGPz3cFB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 20:55:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ez55A3lc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=mingo.kernel.org@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ez55A3lc;
	dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsNLv2zCyz3bWw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 20:54:30 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id z8-20020a05600c220800b003d33b0bda11so2305730wml.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 01:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFXFErf1cq+teYIb8hlzraGgrqjKGOqEZ+fy0lNXo3c=;
        b=Ez55A3lcqCOOEpQ5a4MBkBx/2zChunM795At0TWV11V9WbBJ3DNkEB+66S9HGrtTvn
         ZDrwYqwzDgMm/GUyX2mzE2EyNcXUbISgQIhYJEFkNsxa/WJWRcmrCKKbqV3CK84/r0Hx
         gQf3ozUakFu5DN1h0mhXmm1aXmV2UdIPGbHqRzOGvUihTrEa/8iNTkAkHvzMJhamqLTm
         QEJD46zYp2AUnJ8M0wB+YLQ0S8c8KCU/HRIw8my1jcP70fUUhlXfPYdDdPu4vClkcdjb
         i8UhuaFbVL7Wq8WsQORBLS3P0UyAc+JZsDHoSzAQqympHQwKCHd983BEMxllkefRdkgp
         ruvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFXFErf1cq+teYIb8hlzraGgrqjKGOqEZ+fy0lNXo3c=;
        b=Ju2f2p+2AVr4a1B/689X4Wk8yy3vOr3Hs3lLzllcp990IRDMUNiH7iZi3xKQ0dg1Cz
         zdricqF3d6AtcA2vZHHU1Kk+xepzDXtnYvmNNcs3ogMCOeXviBC7fqlE1CuPDQ8xzJV6
         kiUivM7dUgO9wz1G93RpqseKnt2wWtwibDAdSrg15pvnAEM7LHA0DiPDrEiTI8pNy/DB
         xVSLofzV/HDr7Wsp8Nhe24JIUR4hQY+533DVkPWrfCfEcbPGX5LNcrKADatKzCurmosO
         lSEb0xDSnpigLhqe00/szNlkNXtbvrFvkU7qHjtjQMBLZOrrTj0LFVfZ/TUV4yLQLz6L
         B/QA==
X-Gm-Message-State: AFqh2kryBrsjIv1FDoBa6/ARaJy+UwEbZ+meSJtr9G4wgavyw/46Rw8T
	4CbE3JFc5wmBB5dUR2OaEhQ=
X-Google-Smtp-Source: AMrXdXs4Bilzbryqesa6Iq2CcbBPhULbeIu/iOoHs0IaVyp+PUdwh0hB46bGVPQijouO6TJpzE7mXw==
X-Received: by 2002:a05:600c:229a:b0:3d9:ec70:befc with SMTP id 26-20020a05600c229a00b003d9ec70befcmr9365764wmf.13.1673430866212;
        Wed, 11 Jan 2023 01:54:26 -0800 (PST)
Received: from gmail.com (1F2EF2EB.nat.pool.telekom.hu. [31.46.242.235])
        by smtp.gmail.com with ESMTPSA id f19-20020a1c6a13000000b003d9fb04f658sm4077431wmc.4.2023.01.11.01.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 01:54:25 -0800 (PST)
Date: Wed, 11 Jan 2023 10:54:21 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH 08/41] mm: introduce CONFIG_PER_VMA_LOCK
Message-ID: <Y76HTfIeEt8ZOIH3@gmail.com>
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-9-surenb@google.com>
 <20230111001331.cxdeh52vvta6ok2p@offworld>
 <CAJuCfpEv--awCY0=R3h5Fez8x74U1EZCzNkq4_7deCYqej5sSA@mail.gmail.com>
 <Y75x5fGPcJ63pBIp@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y75x5fGPcJ63pBIp@dhcp22.suse.cz>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorm
 an@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* Michal Hocko <mhocko@suse.com> wrote:

> On Tue 10-01-23 16:44:42, Suren Baghdasaryan wrote:
> > On Tue, Jan 10, 2023 at 4:39 PM Davidlohr Bueso <dave@stgolabs.net> wrote:
> > >
> > > On Mon, 09 Jan 2023, Suren Baghdasaryan wrote:
> > >
> > > >This configuration variable will be used to build the support for VMA
> > > >locking during page fault handling.
> > > >
> > > >This is enabled by default on supported architectures with SMP and MMU
> > > >set.
> > > >
> > > >The architecture support is needed since the page fault handler is called
> > > >from the architecture's page faulting code which needs modifications to
> > > >handle faults under VMA lock.
> > >
> > > I don't think that per-vma locking should be something that is user-configurable.
> > > It should just be depdendant on the arch. So maybe just remove CONFIG_PER_VMA_LOCK?
> > 
> > Thanks for the suggestion! I would be happy to make that change if
> > there are no objections. I think the only pushback might have been the
> > vma size increase but with the latest optimization in the last patch
> > maybe that's less of an issue?
> 
> Has vma size ever been a real problem? Sure there might be a lot of those 
> but your patch increases it by rwsem (without the last patch) which is 
> something like 40B on top of 136B vma so we are talking about 400B in 
> total which even with wild mapcount limits shouldn't really be 
> prohibitive. With a default map count limit we are talking about 2M 
> increase at most (per address space).
> 
> Or are you aware of any specific usecases where vma size is a real 
> problem?

40 bytes for the rwsem, plus the patch also adds a 32-bit sequence counter:

  + int vm_lock_seq;
  + struct rw_semaphore lock;

So it's +44 bytes.

Thanks,

	Ingo
