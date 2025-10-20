Return-Path: <linuxppc-dev+bounces-13051-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8FEBEF84A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 08:51:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqmKn0K2lz300M;
	Mon, 20 Oct 2025 17:51:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760943068;
	cv=none; b=CGpUy5f5T/8c/JIUgajFMqqQBLvOtk64xsqnDjeAGj5Ky2cglewTE4Zpmf3jDwqQJZZq09PeJ3w8y9jENdSDfiGKCqAamse7jczvIPL0z/ZhKGMHLD9/X0kXp7UrGhldzlIWzY1nUQn2fCP7vttLUNfwZToG2BXSWkQ6DM9hJ5if7c3xY5Qa09UP9lbhsEfQsS85vx++olAN0FfvrJz5wUX7fpOdXeCS8PzMvhKxUkFWCz9Kju30fUxaCySKW3ZB1lBXLOMH60C4ybfhsB+IxC2e/nhcGK8cOU8HnY3KGFgOsLeALy5GRl3GZpPFcVSljFboNrBH5fXZYyRCusR+TA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760943068; c=relaxed/relaxed;
	bh=QZCiJUNbDBKZU7NscC9t+cPIbwSt1d1aTLOIOEONDRo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QvXGXmw1WCPX/mUOBLmF2PI9dMRrgEhb51GwqX3FPDHXVauc14C5dGukOzOT18jzxmUG5dw9w76Zfgx6PChckdPlKo5tYGqU0qfBxFFit/stu6DjahN6pJcjj4VeamqPa/ZBhECrV9RAAOiwtDBBHbW7I3uBxSqPFrWg5b/1E6brzqJfYJeavMOada8NTl8LUFIidAw2OM7Py9gsR3Pv+eIBj5b3qTYcTjmtXOI2BQLvW0Ppt4GFl5Tso2vl8HVmWARDfDflXLRHoZ1XQotWuDPT3hCbnGZR0AsLKdcLCfSaxLd8E2/nsN6GGAVz3d3AQ3SmmqeLohkPiZ2kWNAzlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=aBpWibfQ; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=JHg1coFA; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=aBpWibfQ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=JHg1coFA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqmKg6Hq6z2ygH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Oct 2025 17:51:03 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760943055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QZCiJUNbDBKZU7NscC9t+cPIbwSt1d1aTLOIOEONDRo=;
	b=aBpWibfQy7NDvaZaGXNCdeOTgstNqJSd72h/HvfsU+bxtPLg46jN298a5AmbZZ0I8qsmk+
	d+9FiLZZFEkKF34+6aD/geC//vXqFAxlhvsIuTZ0otTv1PFTa68B8uXOwFcWk4+8WYI5an
	IUvxnjVByp5cBtfO9vsxxCUqKZIHzZsfrdbZZf3kacNHifOfvhESr5BlU2Lf/PbfyV38By
	KVznd395E5j77XdHOnXPD6Z0vpewpRYK/FK7/w8iwdhVqFvHHEA4Stu+hyylX4JdUwRORb
	fu7YAxMMiLqA2Vrpd+zZrafVfIA99TO2e4VyA7/HhfSxLwAND/A9kWLVflkZvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760943055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QZCiJUNbDBKZU7NscC9t+cPIbwSt1d1aTLOIOEONDRo=;
	b=JHg1coFAEo4pN71GSm+4Y8XD2IbiEBac1CDhS7fUoq52oNxVyS/BaH8IlhDFLi/qxEKwbs
	tEjcxtPV9FDv1sAg==
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, LKML
 <linux-kernel@vger.kernel.org>
Cc: kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Linus Torvalds
 <torvalds@linux-foundation.org>, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 08/12] uaccess: Provide put/get_user_masked()
In-Reply-To: <d58b798a-3994-438c-9c02-678f3178b21e@efficios.com>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.315578108@linutronix.de>
 <eb6c111c-4854-4166-94d0-f45d4f6e7018@efficios.com>
 <d58b798a-3994-438c-9c02-678f3178b21e@efficios.com>
Date: Mon, 20 Oct 2025 08:50:54 +0200
Message-ID: <87ecqyyskx.ffs@tglx>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 17 2025 at 09:45, Mathieu Desnoyers wrote:
> On 2025-10-17 09:41, Mathieu Desnoyers wrote:
> [...]
>>> +/**
>>> + * get_user_masked - Read user data with masked access
> [...]
>>> + * Return: true if successful, false when faulted
>
> I notice that __get_user() and get_user() return -EFAULT
> on error, 0 on success. I suspect the reversed logic
> will be rather confusing.

In most cases the return value of those is treated as a boolean
success/fail indicator. It's pretty confusing when a boolean return
value indicates success with 'false'. It's way more intuitive to read:

       if (!do_something())
       		goto fail;

Just because we have this historic return '0' on success and error code
on fail concept does not mean we have to proliferate it forever.

In fact a lot of that 'hand an error code through the callchain' is just
pointless as in many cases that error code is completely ignored and
just used for a boolean decision at the end. So there is no point to
pretend that those error codes are meaningful except for places where
they need to be returned to user space.

Thanks,

        tglx


