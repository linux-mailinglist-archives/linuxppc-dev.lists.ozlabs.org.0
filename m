Return-Path: <linuxppc-dev+bounces-13107-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F0BBF7213
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 16:42:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crZl86BbXz306S;
	Wed, 22 Oct 2025 01:42:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761057748;
	cv=none; b=ZH+WdMU0fXTbgiayQd4kZsId/Q+HGJwhyotQZdhlKjesT+T/hbGgsCPUKQGuADBsGZkC8NXLdO0FW/13NNvBpejjeLioWRK9JyRuEg3eDN2pRYZbC39NmLiMRojlNp1jEhpEE9zHNkRhybUZImkGAUxefptuCdTgPjfSnyBiB/ZfcBQ21E1w02uyTvpZYFao6uUSVpvWqoF4VezApqSwAoych1yTAFBvGtWXmt4SSEXVBjP0ExCHbin04N+yJuz+NxpIdmhUEnqI4sRKfun4AmjCy5l4MTMqT+ji58gFtKpxzYD70E5s9N72h3anyxwAqcLNJNHGa/s8IGzWpWxLrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761057748; c=relaxed/relaxed;
	bh=c27Kz3PCpHpOUA2hxoFAn/lgFIxKWu9eCciI5q0PFVA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nAnqSbNJcbC3GDulSBarROrSU0Fe8YsD5chHlXXumNPtasuLtXVOsDGOgkULdhAG0IdpeuLVM42M/x/4MA5Vuan1TPGOIc7L7Dhl4ajfwq3Rcsz+t+CXsmOkVjZ9W/DsdW+vuf3cHO3FnA+hsrx/iXO5/Vl64tkO58m6oVuUfM10uM4S+hnVvyhjKDHAHL3aE7RlyT+/n9z3eLx9DOlFARqnPhIikrzn8Y8D6iJ+iVMHclTtMq1fQ3KRonzEbjRkDnyxHZNdzUV+pmdFM2kPoQGFvVtIBfU0r729WMojCktbgC2ri52FX6QCQW4xVZYZvE92zj7kbQuk/G8I7mGgMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1/g8k/vY; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=v+qP/IJ7; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1/g8k/vY;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=v+qP/IJ7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crZl61n8jz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 01:42:26 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761057743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c27Kz3PCpHpOUA2hxoFAn/lgFIxKWu9eCciI5q0PFVA=;
	b=1/g8k/vY5UCh/boWPJmgNdB7ubbYE/A/fsOkfq3wSrNQGzQ5valPHvmdpxXGZqcnRroQ58
	Bejn39YCg/SlHMeJklk2aBag1ZZ/ZkJkTivx6X2k6zFCy9QlKITW6ujrMH0xoF2co7FakR
	/dutCEVT+SfKWOjjeaJTqJRMh89jW+zebxPrs6Ff9MEqAR4Jz/7LUbv+E7A5ITdaxbZChA
	LQsIRW35kAAcwrybohHORnbCHtCEJbOoM88Ok56KpnArXwbr5s8s3yRrxzfqZOWUQSPOoj
	HHlLFLvQYsl/+KPI+DNPkp5iCy3GtuWwAiSjCg7LL/RU6tt4yt9gYNWiE4WiKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761057743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c27Kz3PCpHpOUA2hxoFAn/lgFIxKWu9eCciI5q0PFVA=;
	b=v+qP/IJ72B74NWtVCOdsRXgUn8qUa/Jvf+CPgpV7YyvANjj4e/t31Aew02eNWfxowW2zLI
	+slcDYUqT+9nxODg==
To: David Laight <david.laight.linux@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>,
 Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access
 regions
In-Reply-To: <877bwoz5sp.ffs@tglx>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.253004391@linutronix.de> <20251020192859.640d7f0a@pumpkin>
 <877bwoz5sp.ffs@tglx>
Date: Tue, 21 Oct 2025 16:42:22 +0200
Message-ID: <874irsz581.ffs@tglx>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 21 2025 at 16:29, Thomas Gleixner wrote:
> On Mon, Oct 20 2025 at 19:28, David Laight wrote:
>> There is no requirement to do the accesses in strict memory order
>> (or to access the lowest address first).
>> The only constraint is that gaps must be significantly less than 4k.
>
> The requirement is that the access is not spilling over into the kernel
> address space, which means:
>
>        USR_PTR_MAX <= address < (1U << 63)
>
> USR_PTR_MAX on x86 is either
>             (1U << 47) - PAGE_SIZE (4-level page tables)
>          or (1U << 57) - PAGE_SIZE (5-level page tables)
>
> Which means at least ~8 EiB of unmapped space in both cases.
>
> The access order does not matter at all.

I just noticed that LAM reduces that gap to one page, but then the
kernel has a 8EiB gap right at the kernel/user boundary, which means
even in the LAM case an access with less than 8EiB offset from
USR_PTR_MAX is guaranteed to fault and not to be able to speculatively
access actual kernel memory.

Thanks,

        tglx

