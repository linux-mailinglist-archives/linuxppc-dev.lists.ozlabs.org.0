Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EF322560E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 05:04:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B965f4kffzDqq3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 13:04:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=myC+IRvR; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B963z6QSZzDqcM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 13:03:11 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id s26so8336694pfm.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jul 2020 20:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=lpszrUk3g++VjwDkyO+kB0nakBB1oFxNo5alny9wgU0=;
 b=myC+IRvRSrv66HdgEQPlUWHOsZTOJPaMknWaQKmuH5kea7GMJebrhfBfK5shocJ7PE
 PbTFzBcDYU6JsNuY0veglvqtKVZRc2OdteWXoXs6j1LUMLCxWBGNex5bm7LZAznIww+M
 DedHXMjUF0Hhn3VXVH6FSTFq7opNi8xo0u1GLPHi0XR+wLucj198wmueAIfPYaYh/8Fg
 8jlF5d8e7TD837BcvSgddivhN74F2jWyzVvtNisugRI1YKExssY/BOpG2zSuAIz/rjwL
 q3Nr+g54MEA0pJwLAnuUqZILGu8bacFa705Ph3pT0sYF0FPwYnzyfXi4jHkqUTeM/gm0
 BqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=lpszrUk3g++VjwDkyO+kB0nakBB1oFxNo5alny9wgU0=;
 b=QRgQqpUe5+NI24B1fj4dmhZpUBXAZTyGD5WGKy/r7mnhcAzOtIv3XlCOIt95Lh7EcV
 ATw2r5KJ/S4jwDpkIo531/9Ba8fP5F+axQa5iVPm+oBlkMbGb0F7cI7uZ0+I0t+CfS4w
 1DdsvfRUr8pEFp5rRH/gLLaXEc0yScLxI/+zFX1DagHh3MwkFHeXlqt+aN3aMdC5aSMY
 2EXEP4BWKj5dBrY01SeK0msPFTfW0bXQQNSp+E+xSJKI90L4QSDarcqxxV7daStcBN1G
 uQS+3xOSQD6UaVSLC9BN1g8CLshCelZ+dxgaSpF40UX0ixFP+BqaKqmj5Q/isePyKOGW
 79Zg==
X-Gm-Message-State: AOAM5337rx+jNk8oGAQaPEVkNpV0hMR432XBjVOL1g5iJUNk3jFPLlqb
 LfBpxqGkqfw7bkG3KSpIgfw=
X-Google-Smtp-Source: ABdhPJwMg06qZ+4wVzgvV5FRM4DFOwuOxF3uoQRaPM8dKXqbFpuZN/leQ1NFOn0AUHknX5kL6q7syw==
X-Received: by 2002:a63:d02:: with SMTP id c2mr16849420pgl.338.1595214188892; 
 Sun, 19 Jul 2020 20:03:08 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id u66sm14887329pfb.191.2020.07.19.20.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 20:03:08 -0700 (PDT)
Date: Mon, 20 Jul 2020 13:03:03 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 4/7] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
References: <1594868476.6k5kvx8684.astroid@bobo.none>
 <EFAD6E2F-EC08-4EB3-9ECC-2A963C023FC5@amacapital.net>
 <20200716085032.GO10769@hirez.programming.kicks-ass.net>
 <1594892300.mxnq3b9a77.astroid@bobo.none>
 <20200716110038.GA119549@hirez.programming.kicks-ass.net>
 <1594906688.ikv6r4gznx.astroid@bobo.none>
 <1314561373.18530.1594993363050.JavaMail.zimbra@efficios.com>
In-Reply-To: <1314561373.18530.1594993363050.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Message-Id: <1595213677.kxru89dqy2.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, linux-mm <linux-mm@kvack.org>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Mathieu Desnoyers's message of July 17, 2020 11:42 pm:
> ----- On Jul 16, 2020, at 7:26 PM, Nicholas Piggin npiggin@gmail.com wrot=
e:
> [...]
>>=20
>> membarrier does replace barrier instructions on remote CPUs, which do
>> order accesses performed by the kernel on the user address space. So
>> membarrier should too I guess.
>>=20
>> Normal process context accesses like read(2) will do so because they
>> don't get filtered out from IPIs, but kernel threads using the mm may
>> not.
>=20
> But it should not be an issue, because membarrier's ordering is only with=
 respect
> to submit and completion of io_uring requests, which are performed throug=
h
> system calls from the context of user-space threads, which are called fro=
m the
> right mm.

Is that true? Can io completions be written into an address space via a
kernel thread? I don't know the io_uring code well but it looks like=20
that's asynchonously using the user mm context.

How about other memory accesses via kthread_use_mm? Presumably there is=20
still ordering requirement there for membarrier, so I really think
it's a fragile interface with no real way for the user to know how=20
kernel threads may use its mm for any particular reason, so membarrier
should synchronize all possible kernel users as well.

Thanks,
Nick
