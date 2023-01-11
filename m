Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 344EB66601C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 17:14:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsXnF0jbjz3cfg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 03:14:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=MgHokpDI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stgolabs.net (client-ip=23.83.212.18; helo=bisque.elm.relay.mailchannels.net; envelope-from=dave@stgolabs.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=MgHokpDI;
	dkim-atps=neutral
Received: from bisque.elm.relay.mailchannels.net (bisque.elm.relay.mailchannels.net [23.83.212.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsXmH4fDvz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 03:13:33 +1100 (AEDT)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 7FC96881032;
	Wed, 11 Jan 2023 16:13:29 +0000 (UTC)
Received: from pdx1-sub0-mail-a240.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id BBDBE880899;
	Wed, 11 Jan 2023 16:13:27 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1673453608; a=rsa-sha256;
	cv=none;
	b=kBt8CodQDMxAaJCJ9NkjMnsMHYrzssuMjtELc8yv22zwenwf+6kU3J7TvMY1y+cBd2WUy7
	h4m5WUCVqLN5lE176ZhbHkrlKaQGoNJ0hv5z70ilWehI6lEVwPk+3y4z4ezJ9ErjqBdgDm
	yQ8gfZJ08NogfWw+v/e3+YYkGc8kqFNxslFxVeP1nQNaEaj/DE9pz2EmKqxwhelOM7NWpU
	c17pYNAQx1+pXL6SUucpK7n1oCpmJVs9B58wUGnBOqEw7fwZEXD60u+OZqmPpBrEfGpJlu
	WzBdKs768TdId/v64LwIKfy+PyseSOcoGGRpPuJ5NytC/ExLpJF5WMD4Jb5YBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1673453608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=KqIdSfYPmousuY+i1hAYcNEcFaIbxrAIfRrrhY59IL8=;
	b=luH8dHpwgxUE+PsIhm23bxBHudBJcBtkq2X3xfr03x1FSwr2Zf+JFpIliyQWFlQb/g9xYf
	t8Z+2vPvgF+GK7JW3Aw6pPdw31Lv7RHpj152RMr1Ovz/GW/8iwwVmGjUxaBI0/ojUQdUyd
	LGMXUYpd8a+73BAaqD2l5NBJYJDwz+7OOMnPLbIQFrJIFFByH93GtTJdLCIq0MbeYVD0aA
	dU8ioi09wDuQPFwSciZevdL8D7SInxxvKE0mHxWO1LOx0Rn2CKJSDZyb1u9qfBMdph2BeW
	YdWuAwGxPwHiGYXGIDNBiVch7rZ8SVMWeiIkSUmDeILv0VqtefzrbJykKe9wzg==
ARC-Authentication-Results: i=1;
	rspamd-7cf955c847-cfcxj;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Eyes-Abaft: 22751edb54470cba_1673453609106_2379691172
X-MC-Loop-Signature: 1673453609106:2687867213
X-MC-Ingress-Time: 1673453609106
Received: from pdx1-sub0-mail-a240.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.134.75 (trex/6.7.1);
	Wed, 11 Jan 2023 16:13:29 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a240.dreamhost.com (Postfix) with ESMTPSA id 4NsXm31ljkz2L;
	Wed, 11 Jan 2023 08:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1673453607;
	bh=KqIdSfYPmousuY+i1hAYcNEcFaIbxrAIfRrrhY59IL8=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=MgHokpDIPaFmfSbcnF0EHEFEvg0EoFiKyrM7Sz7SHRg0Jdy9hMryQ5+V4NEnQX+Oj
	 PNhCzQrfq4+IaNp6XAKB6Fp/Hrjkr29MKyhqR1hm91ne+tr33nCDYpRWnB8paCpmwN
	 a3Rj8zxogdkLlSB6kgz1P68UXMlRpsKKTqBZfA98LL8YPwnW/RCO3OyH/1qdecIVu8
	 S46cPS7yT0U9Bo6BbMAdBLjgmoCZgMlIoBGSddz7fKiUwOFcg4g0MH+rGLgNttS6ap
	 ZW+pYHxNXpPl/O+Xzu9dLdHce/4Jz/A6W+V2lOPYE8w8uU+cfT4j1V3NVfQRvoGRP/
	 J0ftdyQQJWHgw==
Date: Wed, 11 Jan 2023 07:47:26 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 13/41] mm: introduce vma->vm_flags modifier functions
Message-ID: <20230111154726.stadwtzicabwh5u5@offworld>
Mail-Followup-To: Suren Baghdasaryan <surenb@google.com>,
	akpm@linux-foundation.org, michel@lespinasse.org,
	jglisse@google.com, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, mgorman@techsingularity.net,
	willy@infradead.org, liam.howlett@oracle.com, peterz@infradead.org,
	ldufour@linux.ibm.com, laurent.dufour@fr.ibm.com,
	paulmck@kernel.org, luto@kernel.org, songliubraving@fb.com,
	peterx@redhat.com, david@redhat.com, dhowells@redhat.com,
	hughd@google.com, bigeasy@linutronix.de, kent.overstreet@linux.dev,
	punit.agrawal@bytedance.com, lstoakes@gmail.com,
	peterjung1337@gmail.com, rientjes@google.com,
	axelrasmussen@google.com, joelaf@google.com, minchan@google.com,
	jannh@google.com, shakeelb@google.com, tatashin@google.com,
	edumazet@google.com, gthelen@google.com, gurua@google.com,
	arjunroy@google.com, soheil@google.com, hughlynch@google.com,
	leewalsh@google.com, posk@google.com, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
References: <20230109205336.3665937-1-surenb@google.com>
 <20230109205336.3665937-14-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230109205336.3665937-14-surenb@google.com>
User-Agent: NeoMutt/20220429
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 09 Jan 2023, Suren Baghdasaryan wrote:

>To keep vma locking correctness when vm_flags are modified, add modifier
>functions to be used whenever flags are updated.

How about moving this patch and the ones that follow out of this series,
into a preliminary patchset? It would reduce the amount of noise in the
per-vma lock changes, which would then only be adding the needed
vma_write_lock()ing.

Thanks,
Davidlohr
