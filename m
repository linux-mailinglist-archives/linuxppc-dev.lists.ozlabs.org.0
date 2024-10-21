Return-Path: <linuxppc-dev+bounces-2462-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF799A6854
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 14:28:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXF2R1j41z2yRC;
	Mon, 21 Oct 2024 23:27:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729513679;
	cv=none; b=okTsa9QCz22URXLjsv3fCjSyb9L4dSuYrVLaj+OkGuXo5UcoC3bDG+2lOefZfQTHv6ILGFy6GdJqFzv7QSGQDzOSuYsBxKnKO+50C5uUZP3JdzVf7U5+C8xiqnyWVOivQyS7uiVUgDq24mrb/aLOQhqZcFIizj0+p1NDDqJFN4sZlx3+FCm0P5BxmzM4luyiiniNjo54L69a8vpV+PubC/y9CLgran2vUeeoC5uSb+4gIWyjQZnf8cQTEqqYHdUSeElsJtnGmHZQHyRH957vAHsHoP3INr9AtYNqN0ywLOjbBSyyCIowEX67Cv3MpDPmusqtFJNNl+pEKZLIYCXvLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729513679; c=relaxed/relaxed;
	bh=99jFXW/CwdyRcK8sGANnfyq1NG9lVOM4bAuwhhPMZ3Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ug3Yo91UMKaWjshgjXbzpIHfo768zf9tedZ1izW7RQhTAtBSf4qNm9b5kFFm43ZRty6IDXLbaqLvSPh812MQLLQBfNE8u4c9ptNpQnSXZMN1ia5KnROlhExAzJJKLxHriV5r0xDGBhaJooUJJvvtqWU4N2JEB5o6YOynUpRv620YBAr9dE7NsLGT6nruWZ+DESYQpaG7GB3zw7Jw1kMAe7wuUNvMFngWMowu4+CIb8TeZydFA5eGFokrvV8pZamfTBGa247fFNfZFbjc9JbbUcp23PNqQQHY5xuoDbQf7aYJ9p7JWN6dwZEYZI5UAmmjzhJlgzdT5njL2L3fmSTxPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FTfTwZiv; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jrFA/5hQ; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FTfTwZiv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jrFA/5hQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=john.ogness@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 56778 seconds by postgrey-1.37 at boromir; Mon, 21 Oct 2024 23:27:58 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXF2Q1l21z2yLT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 23:27:58 +1100 (AEDT)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1729513667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=99jFXW/CwdyRcK8sGANnfyq1NG9lVOM4bAuwhhPMZ3Q=;
	b=FTfTwZivkJNNhVUSQLAGwI4zc3HGwCHeWIQA0KRcXWbxaIpgYlngv319X4Uv76M05mAzUF
	22eCKrIOuqvbcI7TaLpvYlkfncXaP3jLvoqqnuQeQEySbVqszPIhZgfAT3okHPkbOJUSbK
	IbAUIHTGs/UFQt+u8h2Dq2WY1lQY3mFC2kashseP/IUONO/GBVhPx/44NC/XeP8TRmY+sA
	rPvhpqHjdwUpCecLlwkzAQsIoTbLBz4IvJZD9/MN+/ESx2TCDXQwX5cOK9K5nNKizzSr8K
	cB8CTiksFaTuKECBpLrjbUpPCt37kSF7zqnqDK7iVzwxrDubIe7ybOm/S5EeuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1729513667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=99jFXW/CwdyRcK8sGANnfyq1NG9lVOM4bAuwhhPMZ3Q=;
	b=jrFA/5hQfVqm9mel2IJlzbl//WFQCYPiYzZVO8TNDBHkNTn0/XLklq6P50n5V5eh1cGQiz
	7OE84fab6r5wXfBA==
To: Ryo Takakura <ryotkkr98@gmail.com>
Cc: christophe.leroy@csgroup.eu, hbathini@linux.ibm.com,
 leobras.c@gmail.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 naveen@kernel.org, npiggin@gmail.com, pmladek@suse.com,
 ryotkkr98@gmail.com, sourabhjain@linux.ibm.com
Subject: Re: [PATCH] powerpc/crash: Allow direct printing on kexec
In-Reply-To: <20241021121159.331940-1-ryotkkr98@gmail.com>
References: <844j56v75z.fsf@jogness.linutronix.de>
 <20241021121159.331940-1-ryotkkr98@gmail.com>
Date: Mon, 21 Oct 2024 14:33:46 +0206
Message-ID: <847ca1fxod.fsf@jogness.linutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,INVALID_DATE_TZ_ABSURD,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024-10-21, Ryo Takakura <ryotkkr98@gmail.com> wrote:
>> Rather than removing the deferring, it would be better to convert the
>> console you are using to the new NBCON API. Then it would be able to
>> print direct and safe during panic. (printk_deferred does not affect
>> NBCON consoles.) What console driver are you using that you want to
>> see the messages on?
>
> I was working on qemu ppc64 this time but I am usually working on 
> Raspberry Pi 4 (mostly for fun and study) which uses either of 
> bcm2835-aux-uart or amba-pl011. It would be really nice to see them 
> working as nbcon!
> I am thinking of taking a look at [0] but If there were any other 
> references, I would really like to look into as well.
>
> [0] https://lore.kernel.org/lkml/87wn3zsz5x.fsf@jogness.linutronix.de/

The lastest version of the series is here [1]. The series is still
undergoing revisions, however the changes are 8250-specific. The API for
nbcon consoles is already available since 6.12-rc1. You are certainly
welcome to try to convert one of those Raspi 4 drivers to the nbcon
interface. I would be happy to review it.

John Ogness

[1] https://lore.kernel.org/lkml/20240913140538.221708-1-john.ogness@linutronix.de

