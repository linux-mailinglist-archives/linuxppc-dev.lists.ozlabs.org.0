Return-Path: <linuxppc-dev+bounces-1963-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8073399821F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 11:27:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPPYR2CJgz3blC;
	Thu, 10 Oct 2024 20:27:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728552459;
	cv=none; b=Bd7InydXNfjJE31ozm4RN3o6AjmDh0gbE0AryVStqlcuXcnExHv9BV4QaAmE2+5ZBhF+JUs7fshqsisxtGkHnmLEwb/fAI+GCWbfqCH3F85ceksifFTh6rXpXwmA0qBCSDqFEgrqHwOUC1Au2cR9ytEilBQa1gMFfUR6hB+MwrQR2R2NeF0q5sYoNeC382xmARNVDAoT9cnq8Qw3xJK0VyDImbpnI19Vbcg4t6ky/2AEXAj4g7L9kFl+8z9sc5UYB5TVxIn5ipDXsWo4NJhLpLDZ14Xp9d9SxfISqXdCBeCiRh+mhscCOL5Fi9c16U9YoKiT5RG9xHWxeUSAH0CcuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728552459; c=relaxed/relaxed;
	bh=EC6uVc1pRBXn7XTs+16IgJy2nYthZT5ol6aI7idN9eA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JA7LazHbKb+eCcCDDwMVY9V0abGNCoK+jMS0SweE79UDU9PQsvWeCKxEJN/o9s5cGhQmFrh5P3m+Lu2Fp+5tYLYTzGe6NdWH+YNy+NNgF3HGruRumw64G3JdLR2CU2YgfIDniSFp6VJCNwfdoo+FrfBpD+wM1i+soTnI2h8pwQnQSViHWqdzZW5fA5Wi00kbq6q9Xs1cjrXsYAr7M2Qz3vAjIe8EHvyqNZV18gyWcUqgen/7JD1eKhKpryUMEYWC5a3hsfssul3Fs1Q3wTXFGhytPvWuMGWbdkp8FN0JPlywKHMtQIuPhyLsZ9cwzhTOM0LkNOX6uTCBU8d9cC9+Ug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=N+BkNhHC; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=g+34NaGs; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=anna-maria@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=N+BkNhHC;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=g+34NaGs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=anna-maria@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPPYQ1xHjz3bl7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 20:27:38 +1100 (AEDT)
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728552454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EC6uVc1pRBXn7XTs+16IgJy2nYthZT5ol6aI7idN9eA=;
	b=N+BkNhHCW97yOqTChI+9nX7KOHJ2MNyJP4Z7VS8z55Q0lu0TkNCcIHBROivA/WwIHqOrNO
	JVEp9JHMiIaX58U3ffhiySfjLKGftMl7k4K2POtygO+Pk7q8TE23L/NcWN2x+qBmQ69td8
	8pzdJTPiuQ+bdYwWZD+XDk6GIA4ukTGqcOGDT9WZN0dcrqNvCI6F9VeMWZ4aFa+bzLepDF
	UY8lFg9hZor4y6YIS7iTuBWysfWkctq8NvMlXhlczCmLFTscsG5OGEUUhtJYYR+VyvKarR
	kzR8HulrI6y3pvk9M43GVA1L1T/+wj6RUhJaW+wbHNeUaZ4dgrVcH3Kbyq7J3Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728552454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EC6uVc1pRBXn7XTs+16IgJy2nYthZT5ol6aI7idN9eA=;
	b=g+34NaGstkjfHtkUiZ66r6z6Hm9oYWibG1iGT7Q6bsKblJpkMnBJWBQAd2VqLz4iKQIrpN
	T8qirBVC6FnoWsAg==
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 13/15] powerpc/rtas: Use fsleep() to minimize
 additional sleep duration
In-Reply-To: <ZwatTfHxojsZwqHw@localhost.localdomain>
References: <20240911-devel-anna-maria-b4-timers-flseep-v2-0-b0d3f33ccfe0@linutronix.de>
 <20240911-devel-anna-maria-b4-timers-flseep-v2-13-b0d3f33ccfe0@linutronix.de>
 <ZwatTfHxojsZwqHw@localhost.localdomain>
Date: Thu, 10 Oct 2024 11:27:34 +0200
Message-ID: <87msjc9uk9.fsf@somnus>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Frederic Weisbecker <frederic@kernel.org> writes:

> Le Wed, Sep 11, 2024 at 07:13:39AM +0200, Anna-Maria Behnsen a =C3=A9crit=
 :
>> When commit 38f7b7067dae ("powerpc/rtas: rtas_busy_delay() improvements")
>> was introduced, documentation about proper usage of sleep realted functi=
ons
>
> related*
>
>> was outdated.
>>=20
>> The commit message references the usage of a HZ=3D100 system. When using=
 a
>> 20ms sleep duration on such a system and therefore using msleep(), the
>> possible additional slack will be +10ms.
>>=20
>> When the system is configured with HZ=3D100 the granularity of a jiffy a=
nd of
>> a bucket of the lowest timer wheel level is 10ms. To make sure a timer w=
ill
>> not expire early (when queueing of the timer races with an concurrent
>> update of jiffies), timers are always queued into the next bucket. This =
is
>> the reason for the maximal possible slack of 10ms.
>>=20
>> fsleep() limits the maximal possible slack to 25% by making threshold
>> between usleep_range() and msleep() HZ dependent. As soon as the accuracy
>> of msleep() is sufficient, the less expensive timer list timer based
>> sleeping function is used instead of the more expensive hrtimer based
>> usleep_range() function. The udelay() will not be used in this specific
>> usecase as the lowest sleep length is larger than 1 microsecond.
>
> Isn't udelay() for everything below 10us ?

It's larger than 1 millisecond...

>
>>=20
>> Use fsleep() directly instead of using an own heuristic for the best
>> sleeping mechanism to use..
>>=20
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Nathan Lynch <nathanl@linux.ibm.com>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
>> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
> Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

