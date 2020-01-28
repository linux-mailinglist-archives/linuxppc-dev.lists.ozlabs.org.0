Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A31BC14AD55
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 01:43:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4867CF0xTszDqFF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 11:43:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RbbmmtXm; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48678z271DzDqDh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 11:41:39 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id n7so5705547pfn.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2020 16:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=kDD2Nw5a1HsD1q3unvMkHjyOz7+BQNaiQnHUiEf/Opc=;
 b=RbbmmtXmliCh1NSIjpuHACogDdI0YaOc3x9VPseOZuHT5eLFgUb/9LhwlQNRHBxaKt
 kKV7O1KSixw42n0gEOEKyYgpzZeDkvBlAfRpQywsoJLshWL5wmsB7hOEuYEEoRKMz0Ol
 01PqP2J6YkokmmS1MpBfU1JTmYMrG34nFg5v4nRp0EbbMDYG5Jql3bq21G7TA41dMooF
 wnLBlICkgLwlZxfMua46K/izUWycV5aMyETQBWd/h+Xt/DPYYHeYIVOQYKqQwMy3xf3L
 Bw99P073ybGkwQUDEH2TmPVk9k+acMnRQB+ubdvsHLdd94qtNSigHtFrlZTpAUuNbHvf
 Uf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=kDD2Nw5a1HsD1q3unvMkHjyOz7+BQNaiQnHUiEf/Opc=;
 b=myCS58nKFz1h1Syh3oC1CcOs2lB8E+OtsTn9+DdiCnZ9jkAuFt0kqI1/lG8zkGqpxC
 j1LNRnQMcqtbQQIwVbH6j0JC8/QUH8o4pcDUvofCnzky4Y4IjWkVdoe+bWq4K+5qK5DB
 pWKASTaj1E/h+ZwqpfxeBRgOj0uxykDRJq5fjS2sH2nnhk4yDss/cu791Q+yCjzQZNIU
 CbzwDNCpKssOvXZqqnF2LQEy1ZR3Fe4g1+B5CU8524mTiFfyjsUdIt2d4Lut0JVQn0l0
 48rQmPLPgGWS8FxBTJQeBc18s26eUK3cDQY7Js/ATUmkXj4a+KAl1pJFTU5kZg4bVVlt
 2Qjg==
X-Gm-Message-State: APjAAAVS4b5nJ2DQCxj6hDz1i7rc9hhlqVhxhOVxSJ7SEX+AvwiGDQ8F
 eLIRtc5W7BhmJCwaWOT+LrY=
X-Google-Smtp-Source: APXvYqwWX4msIM+mRp0hk1G1BRgj20r3tYmqtvmjUlRnEhBi3QzICc25yhw7OWAmUokuS9/LTnwTxw==
X-Received: by 2002:a63:5c0e:: with SMTP id q14mr13903881pgb.313.1580172096029; 
 Mon, 27 Jan 2020 16:41:36 -0800 (PST)
Received: from localhost (203-219-188-70.tpgi.com.au. [203.219.188.70])
 by smtp.gmail.com with ESMTPSA id t65sm16220909pgb.17.2020.01.27.16.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 16:41:35 -0800 (PST)
Date: Tue, 28 Jan 2020 10:41:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: system call implement the bulk of the logic
 in C fix
To: Michal =?iso-8859-1?q?Such=E1nek?= <msuchanek@suse.de>
References: <20200127141712.96738-1-npiggin@gmail.com>
 <20200127180832.GX4113@kitsune.suse.cz>
In-Reply-To: <20200127180832.GX4113@kitsune.suse.cz>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1580171821.hhr2i98lkm.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek's on January 28, 2020 4:08 am:
> On Tue, Jan 28, 2020 at 12:17:12AM +1000, Nicholas Piggin wrote:
>> This incremental patch fixes several soft-mask debug and unsafe
>> smp_processor_id messages due to tracing and false positives in
>> "unreconciled" code.
>>=20
>> It also fixes a bug with syscall tracing functions that set registers
>> (e.g., PTRACE_SETREG) not setting GPRs properly.
>>=20
>> There was a bug reported with the TM selftests, I haven't been able
>> to reproduce that one.
>>=20
>> I can squash this into the main patch and resend the series if it
>> helps but the incremental helps to see the bug fixes.
>=20
> There are some whitespace differences between this and the series I have
> applied locally. What does it apply to?
>=20
> Is there some revision of the patchset I missed?

No I may have just missed some of your whitespace cleanups, or maybe I got
some that Michael made which you don't have in his next-test branch.

Thanks,
Nick
=
