Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7469B6A47C1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:20:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQS1Z2qHsz3c92
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:20:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=P4+zFqd1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stgolabs.net (client-ip=23.83.209.25; helo=bumble.birch.relay.mailchannels.net; envelope-from=dave@stgolabs.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=P4+zFqd1;
	dkim-atps=neutral
Received: from bumble.birch.relay.mailchannels.net (bumble.birch.relay.mailchannels.net [23.83.209.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQS0Z6sDbz3bTq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:19:25 +1100 (AEDT)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 94742822240;
	Mon, 27 Feb 2023 17:19:14 +0000 (UTC)
Received: from pdx1-sub0-mail-a283.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 1D4368221D9;
	Mon, 27 Feb 2023 17:19:13 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1677518353; a=rsa-sha256;
	cv=none;
	b=7qK8WP9xLUa7NOK0vVjVvQ1cpz8s7JzUL2wjI9WfPDrYoWw8C8SrngUcxz6l8LJUpaW8GA
	M4U2yV4+NNYlkqhnz3qWLMqjssoQVOQmb8bQws0RdD3+wcONRqy1OJfBPOWsdFsWEE5uZZ
	HKXRAhWPYYEOchlBrVNjdK8PF7UVGah20Mdnofjp1QwcuhzS3NuaTwHEW3OjIwhUTCt64l
	Kcbpn5LS41LK7QVcf2Yk8FrS+khm0gmmyvtEpRypGLUF69m+QNEDvVDaz26KJrb1p92AKm
	GsAsdFJPk7A2CHbiGJ4tQxi2NCeFwFTRa0q5VI3ZGincPVGwXitSb6vfeV+A4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1677518353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=/Zq7yYZW02DEXPDh0jvm5FuZmU/4MNa5LSJgAHpINyg=;
	b=te61hAUCQ+tZN+uobKa6zFok7w6YPA5fOak2DcWekG+bwCdp7wyJ6OjZ6yMY+/LpL+ewSK
	Mv81ajKZJqauh5sQZ4GPzAUEnUyycAzhlihERijXQDLEqKR5P+DrXiUWwUxwVTnRCHayrM
	ReLarN54oANeUb+DkEkv5iSMaKmRKrFFnnxtPZGuJd0snh9hrKD5EpCsLeeIwr5AxNGdvK
	5jTg1NiuzuRHVch4c0lKYWpurVR6chOOIeqaphyVu+Q+aDCzyLo+OUgIucUM5dKNwPLA5i
	FjzxnyE9WHli8qHOps0cySW4zgVVdgo8Svc7ls5UnViwI0vbS8XqKF1B0VyP2Q==
ARC-Authentication-Results: i=1;
	rspamd-69778c65cd-rcs9v;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Chief-Rock: 6d068aaa56b8eeae_1677518354170_3920225541
X-MC-Loop-Signature: 1677518354170:914489716
X-MC-Ingress-Time: 1677518354170
Received: from pdx1-sub0-mail-a283.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.123.200.110 (trex/6.7.1);
	Mon, 27 Feb 2023 17:19:14 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a283.dreamhost.com (Postfix) with ESMTPSA id 4PQS0G0kM3z1d;
	Mon, 27 Feb 2023 09:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1677518352;
	bh=/Zq7yYZW02DEXPDh0jvm5FuZmU/4MNa5LSJgAHpINyg=;
	h=Date:From:To:Cc:Subject:Content-Type:Content-Transfer-Encoding;
	b=P4+zFqd18/HpmFmQiEDYB0/3JWYFiZaZ1VOp8YIuBndJB+bBcPRDFJlT9ROk85IeP
	 2+lhgf9vSf38GIcohoWPqF8tFEU7veK/9o/e1INc67MvfVAyYfkJ1QWhlnrH2eMBsh
	 AjZ7T0DT1SfHleDKzopq4Mt4Pzqv2B91Ueb3OIDo9TOxjr1Ljpf2pVQV+XEIDjz4Kn
	 8KwNW9VOOqYh5c46TpLJCo8AU4vluDoWFzA7ecV2hZ5McJjMwx9daQzdx2nmiFvMdz
	 bZx1RQMZixHhR+M6YWKyr2nYvIUmvhO44tIu249YE6n0SDXb/zSUGGYKqrnM1euMSU
	 E4YuALYi5otNQ==
Date: Mon, 27 Feb 2023 08:50:32 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: freak07 <michalechner92@googlemail.com>
Subject: Re: [PATCH v3 00/35] Per-VMA locks
Message-ID: <20230227165032.taj24j4leu7dlbqc@offworld>
Mail-Followup-To: freak07 <michalechner92@googlemail.com>,
	surenb@google.com, akpm@linux-foundation.org, arjunroy@google.com,
	axelrasmussen@google.com, bigeasy@linutronix.de,
	chriscli@google.com, david@redhat.com, dhowells@redhat.com,
	edumazet@google.com, gthelen@google.com, gurua@google.com,
	hannes@cmpxchg.org, hughd@google.com, jannh@google.com,
	jglisse@google.com, joelaf@google.com, kent.overstreet@linux.dev,
	kernel-team@android.com, ldufour@linux.ibm.com, leewalsh@google.com,
	liam.howlett@oracle.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, lstoakes@gmail.com, luto@kernel.org,
	mgorman@techsingularity.net, mhocko@suse.com, michel@lespinasse.org,
	minchan@google.com, mingo@redhat.com, paulmck@kernel.org,
	peterjung1337@gmail.com, peterx@redhat.com, peterz@infradead.org,
	posk@google.com, punit.agrawal@bytedance.com, rientjes@google.com,
	rppt@kernel.org, shakeelb@google.com, soheil@google.com,
	songliubraving@fb.com, tatashin@google.com, vbabka@suse.cz,
	will@kernel.org, willy@infradead.org, x86@kernel.org
References: <20230216051750.3125598-1-surenb@google.com>
 <20230224092134.30603-1-michalechner92@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230224092134.30603-1-michalechner92@googlemail.com>
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
Cc: joelaf@google.com, michel@lespinasse.org, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, gurua@google.com, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, paulmck@kernel.org, x86@kernel.org, hughd@google.com, willy@infradead.org, peterz@infradead.org, mingo@redhat.com, vbabka@suse.cz, rientjes@google.com, gthelen@google.com, kernel-team@android.com, soheil@google.com, minchan@google.com, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, axelrasmussen@google.com, ldufour@linux.ibm.com, surenb@google.com, linux-arm-kernel@lists.infradead.org, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, mgorman@techsingularity.net, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, linu
 xppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 24 Feb 2023, freak07 wrote:

>Here are some measurements from a Pixel 7 Pro that=B4s running a kernel ei=
ther with the Per-VMA locks patchset or without.
>If there=B4s interest I can provide results of other specific apps as well.
>
>Results are from consecutive cold app launches issued with "am start" comm=
and spawning the main activity of Slack Android app.
>
>https://docs.google.com/spreadsheets/d/1ktujfcyDmIJoQMWsoizGIE-0A_jMS9VMw_=
seehUY9s0/edit?usp=3Dsharing
>
>There=B4s quite a noticeable improvement, as can be seen in the graph. The=
 results were reproducible.

Thanks for sharing. I am not surprised - after all, per-vma locks narrow so=
me of the performance gaps
between vanilla and speculative pfs, with less complexity (albeit this is n=
ow a 35 patch series :).

Thanks,
Davidlohr
