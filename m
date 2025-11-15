Return-Path: <linuxppc-dev+bounces-14196-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F13F8C60816
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Nov 2025 16:53:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7z7g5Rmgz2yrQ;
	Sun, 16 Nov 2025 02:53:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763222015;
	cv=none; b=LAHuTpyQMqYjXYKAhffdvuTA5CJ7JeHnWFGqpH8FE+wP7jldL6SFSb/ooOEFZd1470qUGLt3jHJm37Ogp9elsa2GkuMuhN3vFIJGRm47A/K9X7sny+bhE0HbWYOR/Dm9pqY8mEY9pA0XS4BDPhbwQZuybakXuvugPiVn3rtWr6XKy0BbpQiPtAsElvAfxHivVRI5y2FCskGZf896hBZCjmzqzRS5rwDh+L76C0OnLuLvZMpT0xqoKq8uVJNLvO10VSufpStHQtCC/zmnB3Cn9u15NBchHjcLKgQ+TeWx7aS2aICiaiHr8hI7yJdDn9+XUukos2F9wnmP1zQiT9tD0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763222015; c=relaxed/relaxed;
	bh=xZ3ruAdoiAVL5AiOWMufuanCJT2Hk+KKUqr8L/GImxg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZvhRoXapzswSY7IOvdJ1m6iIJ6q30sLxTibmhU+JJiIirdRNXzTSx8cHGsvK7H6qCVpnBb315Jm9+LnzA0o3hw0ftmJ40xrKqIHRtdomrO1wML2BUIYNS6nJ4DemECQkL/ogGNVrq1ge2afEaRenwIgZsFlfWZj2YVH3/xuwVHzdk8MxfueWaljPXUsWeiDtmsbtriJM0oxwOGm7bUoH2k26NYyI/GPujw3s55f8oqUz4MxKcycrd4HewSzXXTRcvEk7Ce31lHwzJwqyJANp5FfBM4egq59W+Uv5SDxoYl57rD0wD9aO5yeIouIYw7j/uhh1ISdfyQmZLGxdofEm/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SLEtXJs9; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fCWvnkFh; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SLEtXJs9;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fCWvnkFh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7z7f5rjnz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Nov 2025 02:53:34 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763222011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xZ3ruAdoiAVL5AiOWMufuanCJT2Hk+KKUqr8L/GImxg=;
	b=SLEtXJs90G/7NF9CrSjBMolaz51zpek96DGbr3R8BvIftzWculk19f97DkjJIqgyyOE5b1
	rJq4JYu+8eltZRC6K+Ky57qlhN2irEA0MVU6CbJrmV6I2WxV6d7H4STn3FmW2Nm2iAukJ1
	Lb8+gYcxQTz8PXfTHVLntDKFeg/wHLmYTUNXVU7q8+YKUJOK7GGJ4Ht7pDCTSTNrD9qetm
	bwZVGPoW3pSFcoWuUh5ciT5paxc6cOtYOyWcMyrDIjB0kKPRd+w9rnUbKiuawGL22julqt
	2tsXicGSHUzzZFnVkQbPDZJumodu0COCelq70rNBeeac/Ib2X38KS/w1VXZucw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763222011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xZ3ruAdoiAVL5AiOWMufuanCJT2Hk+KKUqr8L/GImxg=;
	b=fCWvnkFhaCE05joawZuvor/UjHcnZb/Uv1cgWtTEj3z+VMFBzvtxj4oixCLjs41kiNl59I
	ipV96EcnsYStGXCg==
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, Davidlohr
 Bueso <dave@stgolabs.net>, Andre Almeida <andrealmeid@igalia.com>, Andrew
 Morton <akpm@linux-foundation.org>, Eric Dumazet <edumazet@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman
 <horms@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Dave Hansen
 <dave.hansen@linux.intel.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 03/10] uaccess: Use
 masked_user_{read/write}_access_begin when required
In-Reply-To: <5effda898b110d413dc84a53c5664d4c9d11c1bf.1762427933.git.christophe.leroy@csgroup.eu>
References: <cover.1762427933.git.christophe.leroy@csgroup.eu>
 <5effda898b110d413dc84a53c5664d4c9d11c1bf.1762427933.git.christophe.leroy@csgroup.eu>
Date: Sat, 15 Nov 2025 16:53:30 +0100
Message-ID: <87h5uv9ts5.ffs@tglx>
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

On Thu, Nov 06 2025 at 12:31, Christophe Leroy wrote:
> diff --git a/net/core/scm.c b/net/core/scm.c
> index 66eaee783e8be..4a65f9baa87e7 100644
> --- a/net/core/scm.c
> +++ b/net/core/scm.c
> @@ -274,7 +274,7 @@ int put_cmsg(struct msghdr * msg, int level, int type, int len, void *data)
>  		check_object_size(data, cmlen - sizeof(*cm), true);
>  
>  		if (can_do_masked_user_access())
> -			cm = masked_user_access_begin(cm);
> +			cm = masked_user_write_access_begin(cm);
>  		else if (!user_write_access_begin(cm, cmlen))
>  			goto efault;

Shouldn't this be converted to scoped_....() ?

