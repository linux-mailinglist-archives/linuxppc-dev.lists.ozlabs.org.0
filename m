Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2816664B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 21:19:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsfDP39vYz3fB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 07:19:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=TaLEus5K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stgolabs.net (client-ip=23.83.209.24; helo=buffalo.birch.relay.mailchannels.net; envelope-from=dave@stgolabs.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=TaLEus5K;
	dkim-atps=neutral
Received: from buffalo.birch.relay.mailchannels.net (buffalo.birch.relay.mailchannels.net [23.83.209.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsfCR2dF9z3bTK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 07:18:57 +1100 (AEDT)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 632623C0F4C;
	Wed, 11 Jan 2023 20:18:54 +0000 (UTC)
Received: from pdx1-sub0-mail-a292.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id D4E573C11B1;
	Wed, 11 Jan 2023 20:18:52 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1673468333; a=rsa-sha256;
	cv=none;
	b=o1bQ0SlWXjhpUMKJqMY++h4yREFBaCy0k2PvwXuAG4DrW1ePtRtSfUHKgUVtCEi7WmtBm1
	K8LJstY7q4J9lkTMSkrlDtFxz2URtHnCMulJzWyHywRklCbvHwq3l7cB1v9Us1lk9knA6O
	j5DXed8U13miKm/nBWvuG4L/DdedVLuIzyfm/vDZ5MpNEfhCMxa2yYfOHrNwDZ0LiS/5pX
	oDxplhKMvj7qd5oNlYmzaZbgZazs1md5VqHFAbmttlIaf9ci7IYNjmjHh2XrnONnRyKMV2
	uCWagx6IWpE2LoeEHzSiL10ss5NmpmrpjEaea/sZqd0SCHkhQ4IOSh+eM2j8eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1673468333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=wS+GmrFpvGE25kGRXu4cr712LGdTZyedIO8N8BIAZig=;
	b=H2ZwOVFAek61HzxEZRCNoRGEE3TpYPeKeGa0IA69wusZLobsCkJ1AtQ2+tjkJaDhAi7zOo
	LbSf+vFGJSg1k2GwlqgIHTbJDKFNdbt3AlJL1RFo8DYO2uz0/m+/08aPY77Y31m4S0qBbv
	4MCfRc3iYiP6cfvakD8UwW3PCyMR12fN1G/aCltT8A1awF0+n6eu1tdNAm28zBPNix02sY
	bnGimyZGhYs7QXBFFFFPuoXli3Yfw01sYBSFWLImeOP0gE+YIO9KnidAWfWuYBRvhvGQfu
	xURvDIuIDDDbmcNXzJg9wbar6skAsdpq6EcPZcolQ58aC/D5UW79rzGR0JAZug==
ARC-Authentication-Results: i=1;
	rspamd-6f569fcb69-64672;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Plucky-Reign: 1875abcc38b9467a_1673468333974_2650156361
X-MC-Loop-Signature: 1673468333974:760517353
X-MC-Ingress-Time: 1673468333974
Received: from pdx1-sub0-mail-a292.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.229.59 (trex/6.7.1);
	Wed, 11 Jan 2023 20:18:53 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a292.dreamhost.com (Postfix) with ESMTPSA id 4NsfCD1FpdzBR;
	Wed, 11 Jan 2023 12:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1673468331;
	bh=wS+GmrFpvGE25kGRXu4cr712LGdTZyedIO8N8BIAZig=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=TaLEus5Kxs4Xgc7EFqEAlAtzzYTJ5Ns/cPdthJRVyguJMTXO22OiW4rUNoNV+jYft
	 MP/2MMYkp0ThoDJyLDqGUOnh0yCFasMO62DOBsGuNoJGZ5IrSxev/cRsPVvLbzqObC
	 dgPbP3psGAjHX83NlTwPhHUjOImqFGW22izEgF06mr4IzxI9GVmAEjwi+ATAQMbJGa
	 VoHJUBiUAd6BgFmPomIsoyyiDr9nV6YhCh1M2ftpXxiLnB4oB+VfaNNTtSVJWPqhoN
	 x3RU+K3bNgNwCDLw3fSHcMpIaP/lxT1tXjlql6EzObb+ULQjwk/xfdmcwEFX2Dbbbn
	 WfXRzd2RzPlaw==
Date: Wed, 11 Jan 2023 11:52:50 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 13/41] mm: introduce vma->vm_flags modifier functions
Message-ID: <20230111195250.cj27sg4yoslbdjdp@offworld>
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
 <20230111154726.stadwtzicabwh5u5@offworld>
 <CAJuCfpFmO310qoFJr2EKHRavLx87k6tVkHO3-JCE0s4q5g+TCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAJuCfpFmO310qoFJr2EKHRavLx87k6tVkHO3-JCE0s4q5g+TCw@mail.gmail.com>
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

On Wed, 11 Jan 2023, Suren Baghdasaryan wrote:

>On Wed, Jan 11, 2023 at 8:13 AM Davidlohr Bueso <dave@stgolabs.net> wrote:
>>
>> On Mon, 09 Jan 2023, Suren Baghdasaryan wrote:
>>
>> >To keep vma locking correctness when vm_flags are modified, add modifier
>> >functions to be used whenever flags are updated.
>>
>> How about moving this patch and the ones that follow out of this series,
>> into a preliminary patchset? It would reduce the amount of noise in the
>> per-vma lock changes, which would then only be adding the needed
>> vma_write_lock()ing.
>
>How about moving those prerequisite patches to the beginning of the
>patchset (before maple_tree RCU changes)? I feel like they do belong
>in the patchset because as a standalone patchset it would be unclear
>why I'm adding all these accessor functions and introducing this
>churn. Would that be acceptable?

imo the abstraction of vm_flags handling is worth being standalone and is
easier to be picked up before a more complex locking scheme change. But
either way, it's up to you.

Thanks,
Davidlohr
