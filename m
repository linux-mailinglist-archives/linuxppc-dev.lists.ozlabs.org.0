Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6BB4AF1B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 02:39:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45T5gg4FbDzDqg8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 10:39:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="hiKbt56N"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45T5ch6mSRzDqhn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 10:37:07 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id 19so8619982pfa.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 17:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=haw/uJEjokg0RcoZr7nO9DDOpI6nbsEXawjYSz3kqQg=;
 b=hiKbt56NOlKkE5nP8qz4YZmKr/7xmy6oFqmSLRQX7BU1lJtj//2Vv4iLAwWzDRJLv7
 /KiCuz1/y4GICi9g0HmnO5LXonj+7c/86L8OCFI0Bd4YmaoQHiyTQDElq7u3PgMSjcnY
 8v8OO/luyfpHm8kLcnVh4JTa9c+DsecxxwohQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=haw/uJEjokg0RcoZr7nO9DDOpI6nbsEXawjYSz3kqQg=;
 b=boWW2g4/iwd0J6HXq13ctcfWhD7mUqMLD5OlIO1OCcSlJzGFRLXEqqtazbh3fr0Gho
 DKJ7wEAY6eKnZm6+xpQx8oWjfMRhW94nqfVk3hx8i+tgOOlv5u5t9Nt06ETqQmaVAAcp
 A1h5aKpPdnIGfM3Q0nMqYONIGW5+iYj5XBF8W8L2MEB+1WbkNtgUwkeYKnXng6CN2+pR
 hSrLz66BQMLGwcaz7qtnzp6MAgVq5d4kXZeGdA4XErbCtJoFXcKpTdR1L8PnC5ADjRUF
 9LLADbJ24qCW+y46nriJVwVgFo5t3W/z+3sT+7k5NIc/kZAbzIZDR/dgSiC3fPaYfqoN
 bcPw==
X-Gm-Message-State: APjAAAULmYYfEzcbRW6TN5MhXfS6zio2p2fIKi/U34eK6JUu7oUiIS/X
 h8A0Ub54GVoLK9GJiKlmX197Lw==
X-Google-Smtp-Source: APXvYqzDNXTwX5fv6QNKCIgdYTGcWxJlfnRoS/a8g6aYPKG2RjIcxr6RLvAnLyludLzBMgjEheLI/A==
X-Received: by 2002:a63:d415:: with SMTP id a21mr5039278pgh.229.1560904624628; 
 Tue, 18 Jun 2019 17:37:04 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id u23sm18230040pfn.140.2019.06.18.17.37.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 17:37:03 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Andreas Schwab <schwab@linux-m68k.org>, Radu Rendec <radu.rendec@gmail.com>
Subject: Re: [PATCH 0/1] PPC32: fix ptrace() access to FPU registers
In-Reply-To: <875zp2rcip.fsf@igel.home>
References: <20190610232758.19010-1-radu.rendec@gmail.com>
 <87r27t2el0.fsf@dja-thinkpad.axtens.net>
 <5fcdb5767b7cf4c7d5b7496c0032021e43115d39.camel@gmail.com>
 <87muif2y4l.fsf@dja-thinkpad.axtens.net>
 <fbf9f9cbb99fc40c7d7af86fee3984427c61b799.camel__46559.9162316479$1560860409$gmane$org@gmail.com>
 <875zp2rcip.fsf@igel.home>
Date: Wed, 19 Jun 2019 10:36:59 +1000
Message-ID: <87k1di2yxg.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Oleg Nesterov <oleg@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andreas Schwab <schwab@linux-m68k.org> writes:

> On Jun 18 2019, Radu Rendec <radu.rendec@gmail.com> wrote:
>
>> Since you already have a working setup, it would be nice if you could
>> add a printk to arch_ptrace() to print the address and confirm what I
>> believe happens (by reading the gdb source code).
>
> A ppc32 ptrace syscall goes through compat_arch_ptrace.


Ah right, and that (in ptrace32.c) contains code that will work:


			/*
			 * the user space code considers the floating point
			 * to be an array of unsigned int (32 bits) - the
			 * index passed in is based on this assumption.
			 */
			tmp = ((unsigned int *)child->thread.fp_state.fpr)
				[FPRINDEX(index)];

FPRINDEX is defined above to deal with the various manipulations you
need to do.

Radu: I think we want to copy that working code back into ptrace.c. The
challenge will be unpicking the awful mess of ifdefs in ptrace.c and
making it somewhat more comprehensible.

Regards,
Daniel

>
> Andreas.
>
> -- 
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."
