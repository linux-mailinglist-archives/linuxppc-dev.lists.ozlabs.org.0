Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0550665070
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 01:40:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ns83f4Lf4z3cdt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 11:40:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=fvVGLpB5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stgolabs.net (client-ip=23.83.212.47; helo=cyan.elm.relay.mailchannels.net; envelope-from=dave@stgolabs.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=fvVGLpB5;
	dkim-atps=neutral
Received: from cyan.elm.relay.mailchannels.net (cyan.elm.relay.mailchannels.net [23.83.212.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ns82f49F7z3c3w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 11:39:35 +1100 (AEDT)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 5897C10096E;
	Wed, 11 Jan 2023 00:39:30 +0000 (UTC)
Received: from pdx1-sub0-mail-a248.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 483AB100D6C;
	Wed, 11 Jan 2023 00:39:29 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1673397569; a=rsa-sha256;
	cv=none;
	b=4v6UPN5SfyA0iJURp4Vpw71der+PcSVx9tPgkhlowH6X/Ne5j5AbnzRoargl/CS+CvBsCj
	ZmbS0ZKwdsASZsrGXICyIe15qIlRmlO59wh2p7EJOV5maZa3UBaENtIN+YI2hug069fXo2
	QdsRfkv7zD2Li38HFvFTNTc9XkgBJE6Jw+it0LA8Hwazd//Yhxf48OU19ZaEj72w7cyXQ+
	GVAELTNc/ybWWUwNUI/YfIG5gd4qENGT370nnCNYmwBwiF6K09cHmwBtAeBFRPS+dvYELj
	cNx4MHsBfcBjQf07QucOLjyXftEz8yr4FrGJpxx5Yl3Uz2BeEM58j+h4h4RnJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1673397569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=o8yEaYcRgiVvt7yHXPFiT7zox2nJmD44kCtYTtXc45I=;
	b=xMDiKumsooLDj4yhWokPg+7/VQbh2V3hsQxjziMEAO1vvLQQyX56LJXYsn+soxngNHlEFd
	zY/97naxJXtb1A5rPIcRlQKoIrzsaArWoP7uQHY+8DCSayhQWGgcvAzDtGutHzuV7aD+MR
	0c8ZXg/4Y9bJEbbkUgsxt+7r9UtDgbj/BUDTVNhAmUrlPpVThfqc1aPlHzaNBYZdO/Vkv4
	XP9WdeZzbrjFGbUXf1fZOIDHdhxtbQq/+X8ROuPGfZiUQmIaQqG7J17cSMeZ4Bm6ZNF5oa
	E5irqhIokyb2h3SFp7B+0ougzhP9ef9BQJhSnoIUi7dCKDdkmI7tKX8L2OuBCA==
ARC-Authentication-Results: i=1;
	rspamd-7cf955c847-95cc5;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Tasty-Reaction: 7153c6b5624d9204_1673397570082_815930916
X-MC-Loop-Signature: 1673397570082:2253401169
X-MC-Ingress-Time: 1673397570082
Received: from pdx1-sub0-mail-a248.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.126.30.45 (trex/6.7.1);
	Wed, 11 Jan 2023 00:39:30 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a248.dreamhost.com (Postfix) with ESMTPSA id 4Ns82Q1SxXz7M;
	Tue, 10 Jan 2023 16:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1673397569;
	bh=o8yEaYcRgiVvt7yHXPFiT7zox2nJmD44kCtYTtXc45I=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=fvVGLpB5u6C0euGhg1uhftkOix9hq0800aRoqQn0FfD/XsAZRRcVVzKCZWFiLwMHr
	 6SbMStqI9JBKXDnHvoaz6Qhsb/IQMECSeQ8inaheo9GA79l/Vwrd1WNseCK3iR6jkC
	 Es7W+EzwDI2P0Iv4Cu+OGEoglXmHjTXs1vsqJEQjar1BvbYE7I/JvIWxIITtOLrWLV
	 Q0xiL0kCY6ryfoFp4EQfi9PzLg/W100y2AnqxALsmKU2iLebbG0yoHRz4kl1G3lEH6
	 dencuMZZOtI43MOKNY88F/IXWrwfyI0jiisiCl9W3lpq9akVvdSdOlnWd1p3puoSW/
	 Ux0VSz7seypsA==
Date: Tue, 10 Jan 2023 16:13:31 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 08/41] mm: introduce CONFIG_PER_VMA_LOCK
Message-ID: <20230111001331.cxdeh52vvta6ok2p@offworld>
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
 <20230109205336.3665937-9-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230109205336.3665937-9-surenb@google.com>
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

>This configuration variable will be used to build the support for VMA
>locking during page fault handling.
>
>This is enabled by default on supported architectures with SMP and MMU
>set.
>
>The architecture support is needed since the page fault handler is called
>from the architecture's page faulting code which needs modifications to
>handle faults under VMA lock.

I don't think that per-vma locking should be something that is user-configurable.
It should just be depdendant on the arch. So maybe just remove CONFIG_PER_VMA_LOCK?

Thanks,
Davidlohr
