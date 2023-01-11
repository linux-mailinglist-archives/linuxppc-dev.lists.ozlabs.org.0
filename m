Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE1A66626A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 19:04:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsbCm0XNLz3cfG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 05:04:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=AH95UKrz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=mhocko@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=AH95UKrz;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsbBt1N4pz2yJT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 05:03:16 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C4EC033A99;
	Wed, 11 Jan 2023 18:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673460180; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bbHjv8f4G8yVHoUHU7VHjKcNPXbqT19MIbDP7lW2Ypw=;
	b=AH95UKrzJ1Zliz+zgEejEfNeedAWYpcTW4dL6WRZ4YuKSDpRhdJmRAgphp/BNidqkNZSdS
	n3efqyXjohG1QoWVwbLTiaMNcMXlfZ2q2fSgmImd3a+aspnHBzE78VhzTqh/A/s5Dz0f4s
	gTF0p1am8yTAw6I0wEVbjPDtyvfku3M=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 98C9C1358A;
	Wed, 11 Jan 2023 18:03:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id /ULTJNT5vmMBBgAAMHmgww
	(envelope-from <mhocko@suse.com>); Wed, 11 Jan 2023 18:03:00 +0000
Date: Wed, 11 Jan 2023 19:02:59 +0100
From: Michal Hocko <mhocko@suse.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 08/41] mm: introduce CONFIG_PER_VMA_LOCK
Message-ID: <Y7750ym6lztDoRC0@dhcp22.suse.cz>
References: <20230111001331.cxdeh52vvta6ok2p@offworld>
 <CAJuCfpEv--awCY0=R3h5Fez8x74U1EZCzNkq4_7deCYqej5sSA@mail.gmail.com>
 <Y75x5fGPcJ63pBIp@dhcp22.suse.cz>
 <Y76HTfIeEt8ZOIH3@gmail.com>
 <6be809f5554a4faaa22c287ba4224bd0@AcuMS.aculab.com>
 <CAJuCfpH_VZq99=vGQGJ+evVg5wMPKGsjyawgHnOeoKhtEiAi6w@mail.gmail.com>
 <Y77ndimzUsVZwjTk@dhcp22.suse.cz>
 <CAJuCfpEEiFNAgb6TNwibUyTJ1J3b-rEGCSw63TiK6FSA=HCdtw@mail.gmail.com>
 <Y77zwYHMfjOL+9EK@dhcp22.suse.cz>
 <CAJuCfpHCRL5B7SxqTgNbpJqhFwzROX4HAOH5KArO1iXNs_3Kcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpHCRL5B7SxqTgNbpJqhFwzROX4HAOH5KArO1iXNs_3Kcg@mail.gmail.com>
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
Cc: "michel@lespinasse.org" <michel@lespinasse.org>, "joelaf@google.com" <joelaf@google.com>, "songliubraving@fb.com" <songliubraving@fb.com>, "leewalsh@google.com" <leewalsh@google.com>, "david@redhat.com" <david@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, "bigeasy@linutronix.de" <bigeasy@linutronix.de>, "peterx@redhat.com" <peterx@redhat.com>, "dhowells@redhat.com" <dhowells@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "edumazet@google.com" <edumazet@google.com>, "jglisse@google.com" <jglisse@google.com>, "punit.agrawal@bytedance.com" <punit.agrawal@bytedance.com>, "arjunroy@google.com" <arjunroy@google.com>, "paulmck@kernel.org" <paulmck@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "hughd@google.com" <hughd@google.com>, "willy@infradead.org" <willy@infradead.org>, Ingo Molnar <mingo@kernel.org>, "gurua@google.com" <gurua@google.com>, "laurent.dufour@fr.ibm.com" <laurent.dufour@fr.ibm.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "rientjes@google.com" <rien
 tjes@google.com>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "kernel-team@android.com" <kernel-team@android.com>, "soheil@google.com" <soheil@google.com>, "minchan@google.com" <minchan@google.com>, "jannh@google.com" <jannh@google.com>, "liam.howlett@oracle.com" <liam.howlett@oracle.com>, "shakeelb@google.com" <shakeelb@google.com>, "luto@kernel.org" <luto@kernel.org>, "gthelen@google.com" <gthelen@google.com>, "ldufour@linux.ibm.com" <ldufour@linux.ibm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "posk@google.com" <posk@google.com>, "lstoakes@gmail.com" <lstoakes@gmail.com>, "peterjung1337@gmail.com" <peterjung1337@gmail.com>, "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>, "hughlynch@google.com" <hughlynch@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Laight <David.Laight@aculab.com>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "t
 atashin@google.com" <tatashin@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 11-01-23 09:49:08, Suren Baghdasaryan wrote:
> On Wed, Jan 11, 2023 at 9:37 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Wed 11-01-23 09:04:41, Suren Baghdasaryan wrote:
> > > On Wed, Jan 11, 2023 at 8:44 AM Michal Hocko <mhocko@suse.com> wrote:
> > > >
> > > > On Wed 11-01-23 08:28:49, Suren Baghdasaryan wrote:
> > > > [...]
> > > > > Anyhow. Sounds like the overhead of the current design is small enough
> > > > > to remove CONFIG_PER_VMA_LOCK and let it depend only on architecture
> > > > > support?
> > > >
> > > > Yes. Further optimizations can be done on top. Let's not over optimize
> > > > at this stage.
> > >
> > > Sure, I won't optimize any further.
> > > Just to expand on your question. Original design would be problematic
> > > for embedded systems like Android. It notoriously has a high number of
> > > VMAs due to anonymous VMAs being named, which prevents them from
> > > merging.
> >
> > What is the usual number of VMAs in that environment?
> 
> I've seen some games which had over 4000 VMAs but that's on the upper
> side. In my calculations I used 40000 VMAs as a ballpark number and
> rough calculations before size optimization would increase memory
> consumption by ~2M (depending on the lock placement in vm_area_struct
> it would vary a bit). In Android, the performance team flags any
> change that exceeds 500KB, so it would raise questions.

Thanks, that is a useful information! This is just slightly off-topic
but I ak wondering how much memory those vma names consume. Are there
that many unique names or they just happen to be alternating so that
neighboring ones tend to be different.
-- 
Michal Hocko
SUSE Labs
