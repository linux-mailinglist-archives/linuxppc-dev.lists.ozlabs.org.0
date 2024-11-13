Return-Path: <linuxppc-dev+bounces-3136-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC989C6980
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 07:51:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpDV065LWz2xH8;
	Wed, 13 Nov 2024 17:51:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731480712;
	cv=none; b=Vk5ZU0qD+haD7ZpdrZr+bQ68k2h31ceNBJxLXqfdtoA9YuMmRv5Y4D71x77s/zeuE+KwPncxlfcme3gMurr8s9Khv3rAkf6u0OfJwtrc2QN2rmLjPDBFFrbbwButfT07ljXzLGNS9khdHOJ4mBrat5ly3kvOXujVhLJXs6fwnEAUEdsft+tqLBqaHyRGmF9kVyj+mhkbZTer2CkhKrkQOICS9uq+7y6UE39ILpzsjZC+/bmvkBAo5uwABkb+/BxloWc7J2TG4WbDWX6Mekq7DY42dcDEX+ed8u6GADOb0yKim6zRGfHR6ipd0QZQID7QMbfZ5KUkdnzGKMfqqL+dfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731480712; c=relaxed/relaxed;
	bh=ds7nLYU6mFEIHej0Le/4lq/BwsbwKA+5f604fNx28XA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ao25V9UR1x/ACSJVSxugIwxGf/q08G+m63ctPfJJhbQT7DjSSpwJjiS8FiJtVPfBKp4HsODMBikGmhAo7T768qlnSFSC+k6hcvj8oBX5jsL+ctJs0SKkj5v2kthuRPlkwbtNimBG8fwyvN0mLMHZgwsfz04Vv+rrbbwWAmAdXrXCrjxzWOdGr/d70Xyd1nROLW8bmEVBl5jdpRHLDhyONVh9TccMm5mSQqI20YXFLLu/y7eds+/mjAEAUBgIL5eXY/OYBqVeuU1IGgD2C5Rc5oBKUc5Ykwmd2hqMNialJGQ+1W3o3qIoDzk+XG2ThstB1A2gUvmqlVsnfYVYUOR5SQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3YY43THN; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=kxOQ1lzC; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3YY43THN;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=kxOQ1lzC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpDTz5gt4z2xG5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 17:51:51 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731480709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ds7nLYU6mFEIHej0Le/4lq/BwsbwKA+5f604fNx28XA=;
	b=3YY43THN/zf17pu4/6rOc0IzHJbYHOaawgrHUZv3fLqAL39bOjTPUlGbsguhdW8ZfYsJxJ
	51ze2OXzEFujKkjIvOZIiA+L45XBXe2deYt0WtzUAX+JBkWoC643kVT5Gi6w+qRbLiRdUK
	N4UIswN6Nk0WSQ54H3Xn5RMufDga1uLmlHYZR3yc9++j/bU4djt0NFhiLLcvCnQk4Rkmpp
	G76ujihQAOq+vGm5N4TEZV6jkY+Hv4nv1bAClE/GTHpQP+qph2D1cQI41QwSiBbJDTMqA2
	MPzBeVhYxFoZqFIKws27t/xaP753qidxsFo871Z4S75+mFAa/q3HxcSI1eVIEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731480709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ds7nLYU6mFEIHej0Le/4lq/BwsbwKA+5f604fNx28XA=;
	b=kxOQ1lzCsdeRHYGgyYmnI0s8cZKtKiIBDanpR2/J0PurzDuxWQhV/WqqDDrY7xc1ztNw68
	t93Vc+KcMzsE8dCw==
To: Luming Yu <luming.yu@shingroup.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: Re: [PATCH v2 2/8] powerpc/entry: cleanup syscall entry
In-Reply-To: <A71D1C71E9993C21+20241111031934.1579-4-luming.yu@shingroup.cn>
References: <20241111031934.1579-2-luming.yu@shingroup.cn>
 <A71D1C71E9993C21+20241111031934.1579-4-luming.yu@shingroup.cn>
Date: Wed, 13 Nov 2024 07:52:04 +0100
Message-ID: <871pzfmxrf.ffs@tglx>
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
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Nov 11 2024 at 11:19, Luming Yu wrote:
> cleanup do_syscall_trace_enter/leave and do_seccomp.

What's the cleanup here? All what this patch does is removing code, but
what replaces that functionality?

The subject line should probably be: "Break syscall entry"

Thanks,

        tglx

