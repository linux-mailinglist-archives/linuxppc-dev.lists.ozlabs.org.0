Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A31267ED19
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 19:13:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3Qg92Wr3z3fKG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 05:13:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=JIDFKbwU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stgolabs.net (client-ip=23.83.209.135; helo=olivedrab.birch.relay.mailchannels.net; envelope-from=dave@stgolabs.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=JIDFKbwU;
	dkim-atps=neutral
Received: from olivedrab.birch.relay.mailchannels.net (olivedrab.birch.relay.mailchannels.net [23.83.209.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3QfB5GQ2z3fDD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 05:12:32 +1100 (AEDT)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 51AA7140B4F;
	Fri, 27 Jan 2023 18:12:29 +0000 (UTC)
Received: from pdx1-sub0-mail-a215.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id DAFD81418BF;
	Fri, 27 Jan 2023 18:12:27 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1674843148; a=rsa-sha256;
	cv=none;
	b=8gZAzNhiY910f4xRltxYtaoXOXMwHRoC42Z3yBFi9La4R5jiiKxSZByeaz7GX6QT4UZyZ9
	hTBmJzgoxHTam2zim9I5IckCVSleJJcwssq7PPYGjI22xI6tNj8klWI0e/JZgNmH0IMYg3
	+qHViyzJJfnkKL2YvOOuNKp6l1BWgPN6jAPXQg/1/jaFFoprwSECxxsVEjrllSEn+Nu69h
	aBd+3TiFCO4thbgTo7nhH++DpnjRElj21RbuglqT/KX6HkGs8deHCykbaXGD1l7MO2TiPY
	hzDUxHP8K7wtZ7Rs04lqsQxpFEg876u2TSEGJNMQ2sVn2nD9jEefxRxQfsWSPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1674843148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=AFPAQrpTa6JQv90tZx2cVE3JvvG6vY0G/Jb1Gz+6tWw=;
	b=O02PU6dv984pHWXFsjmM+jzulO8KVIeZqcPBsmbpNzbp58bz5sTH4TLgJ395b4db1K4glH
	PNzxBM/4bDYTLaHUA+bT/m5lUHemJxoUJc+dSBdw/t9R+t33SbS3vzOC8OBlhwLEZ1IkCV
	XaAX9hmkTRrEhivqwt203HCJs/eLqwaGIpJIXb0kVvnY+OPlNdY3KfM9JPDK9qSvH3GWov
	iL+Ew5cQznNQx8yGqiruPl76Or9XsLWMbcXU4ArpKFSDf+S55e9oeLT69a7xmpkNIkM9WJ
	v2JZ+oerCm9Wfbc4tn9p/crPH16WMSdM/19woLyjLplNZSNQMZGKNHLhfK+Y6w==
ARC-Authentication-Results: i=1;
	rspamd-544f66f495-wxdrn;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Relation-Daffy: 020a35f967655b8b_1674843148840_886956793
X-MC-Loop-Signature: 1674843148840:7612868
X-MC-Ingress-Time: 1674843148840
Received: from pdx1-sub0-mail-a215.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.24.83 (trex/6.7.1);
	Fri, 27 Jan 2023 18:12:28 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a215.dreamhost.com (Postfix) with ESMTPSA id 4P3Qf00Vj7z95;
	Fri, 27 Jan 2023 10:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1674843147;
	bh=AFPAQrpTa6JQv90tZx2cVE3JvvG6vY0G/Jb1Gz+6tWw=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=JIDFKbwUDw0JZ3SbrpB/Bj4GbFEpmvP6tr1C3RSKUPhp73vxhg4Grmp8npGv1MdUu
	 fKSGECsi57IjiXo5Wkl6SDhd2OGhJgE1CXQbNjgo/YsxzFZ6KkZS6khj0tqTtaCWxX
	 RBmLEBlN7Jm3H6SCAQb+5sh1Hd1UlaapKft3DzcVH+SuqpZGU71b6NEt/RVlzCXXIp
	 29+9+f5sWbofBI0N/otn9+yak3RFmUhOpOTT2tLo9PdLOhZ9xqCEJn5MJuRcmM20vL
	 KT/9Nes1IeXPlQeTSSJyvq/gCCjkUw9T7OpCcLsxOS2OVRLzesjsxKz66+aKM8NNAv
	 /pHd0aOp7eX5w==
Date: Fri, 27 Jan 2023 09:45:30 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v4 3/7] mm: replace VM_LOCKED_CLEAR_MASK with
 VM_LOCKED_MASK
Message-ID: <20230127174530.sws4xg3qjsx3agh4@offworld>
Mail-Followup-To: Suren Baghdasaryan <surenb@google.com>,
	akpm@linux-foundation.org, michel@lespinasse.org,
	jglisse@google.com, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, mgorman@techsingularity.net,
	willy@infradead.org, liam.howlett@oracle.com, peterz@infradead.org,
	ldufour@linux.ibm.com, paulmck@kernel.org, mingo@redhat.com,
	will@kernel.org, luto@kernel.org, songliubraving@fb.com,
	peterx@redhat.com, david@redhat.com, dhowells@redhat.com,
	hughd@google.com, bigeasy@linutronix.de, kent.overstreet@linux.dev,
	punit.agrawal@bytedance.com, lstoakes@gmail.com,
	peterjung1337@gmail.com, rientjes@google.com,
	axelrasmussen@google.com, joelaf@google.com, minchan@google.com,
	rppt@kernel.org, jannh@google.com, shakeelb@google.com,
	tatashin@google.com, edumazet@google.com, gthelen@google.com,
	gurua@google.com, arjunroy@google.com, soheil@google.com,
	leewalsh@google.com, posk@google.com, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
References: <20230126193752.297968-1-surenb@google.com>
 <20230126193752.297968-4-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230126193752.297968-4-surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.o
 rg
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 26 Jan 2023, Suren Baghdasaryan wrote:

>To simplify the usage of VM_LOCKED_CLEAR_MASK in vm_flags_clear(),
>replace it with VM_LOCKED_MASK bitmask and convert all users.

Might be good to mention explicitly no change in semantics, but
otherwise lgtm

Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
