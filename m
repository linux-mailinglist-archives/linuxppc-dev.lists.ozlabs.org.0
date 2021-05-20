Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F366389ED2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 09:21:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm1PX2Bbxz3bs3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 17:21:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CKkNwQcL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CKkNwQcL; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm1P31mzxz2yXk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 17:20:53 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id s4so6937868plg.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 00:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=1a8BUw6AmeU9jhk87302iJ+1G3wTSv+KqaggD9Jw1iM=;
 b=CKkNwQcLmL9XT1YxqvpiT4WQqkLq6fl1hYX4Xob56iKlCTwzeudFh6yA4JqDw/4gq5
 q4PmUVIZMDmsWnktlag2cO+kRIUupe3EWQAdh0Gem92MgNjItFfQpEMUS1Guyvbjqyyz
 OS9ztbZmm/tU23FsNi2NFVFxt2CjJmNNNRMnYQhMqZ+vZGKiQQVN3glRMc3AbcNOqVN2
 nMO+tqq1T1JKkUv6cnJfuc0AqgOxCSp5ndUC6ksSjljp8jmU2tFbsYEai0OXcQrRDt7p
 mgQAS2D1jQzqVVDsns0EbJnj0iHP0ScoV8y8qLBdxRs+O9pluoBgwl5IPHcc4V9wiAO3
 Tz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=1a8BUw6AmeU9jhk87302iJ+1G3wTSv+KqaggD9Jw1iM=;
 b=YWJiw6PGPWPar374TseJRzOuzlgg0JqfCun9pI9hv3aG+MeYgjG1SrceMkV6tY/7Xa
 3nQKnpn3EavbQ9bShxrTV8cX+y+9qQeO6Qa5PFplE+9o5lb1f7l/+j440MuA9LJH9B54
 YoW4BUB5zBI0HFrHIIXV7NB6nYPLr+jxFQ9kV4weh1FPGN7s8o1blOXlXH0fPezq56oJ
 gusxiZSTKHRqDUkkzdWMQZrVCPhGKTgaDIbDtvC5bZDtzwTOb1uSLuaJBS2MgG1xtEES
 BQu0t0+XIzIUzn2HJknaZr5ZGXFg07uwu0WuPnrBAimxjnKI+WrKREaBIQgOZy1zDSu6
 EWbQ==
X-Gm-Message-State: AOAM531GgVntpPTt1gcnuKoLGXZhqXgdlyoJNC+NE1M/SaBCpwAf5Fd1
 3AN9lbIci1Lq79DabKgTwUU=
X-Google-Smtp-Source: ABdhPJwVWmrn/1S+RJBq0TSn/TxhD0DfUJPNLQu3qiX7wTQBZhgAvAEp7yTpQcWX0uzXnRImCKzY1Q==
X-Received: by 2002:a17:902:e812:b029:f0:aa50:2f1d with SMTP id
 u18-20020a170902e812b02900f0aa502f1dmr4167957plg.79.1621495250742; 
 Thu, 20 May 2021 00:20:50 -0700 (PDT)
Received: from localhost (60-241-27-127.tpgi.com.au. [60.241.27.127])
 by smtp.gmail.com with ESMTPSA id l1sm1271991pjt.40.2021.05.20.00.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 00:20:50 -0700 (PDT)
Date: Thu, 20 May 2021 17:20:44 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Linux powerpc new system call instruction and ABI
To: "Dmitry V. Levin" <ldv@altlinux.org>
References: <1621410291.c7si38sa9q.astroid@bobo.none>
 <fb9b6a6099855bd00efc6ffe540ccad14dd9a365.camel@infinera.com>
 <1621413143.oec64jaci5.astroid@bobo.none>
 <20210519143836.GJ10366@gate.crashing.org>
 <11d62aa2488e51ec00fe77f24a1d7cdcc21af0b8.camel@infinera.com>
 <20210519152205.GL10366@gate.crashing.org>
 <adec4377144a44b6f9ddd10c1b5256b80c9ceb50.camel@infinera.com>
 <20210519234846.GS2546@brightrain.aerifal.cx>
 <20210520010612.GA25599@altlinux.org>
 <1621478448.743zqcrxza.astroid@bobo.none>
 <20210520025948.GA27081@altlinux.org>
In-Reply-To: <20210520025948.GA27081@altlinux.org>
MIME-Version: 1.0
Message-Id: <1621495199.91bc4mp4tb.astroid@bobo.none>
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
Cc: Rich Felker <dalias@libc.org>, musl@lists.openwall.com,
 linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Dmitry V. Levin's message of May 20, 2021 12:59 pm:
> On Thu, May 20, 2021 at 12:45:57PM +1000, Nicholas Piggin wrote:
>> Excerpts from Dmitry V. Levin's message of May 20, 2021 11:06 am:
>> > On Wed, May 19, 2021 at 07:48:47PM -0400, Rich Felker wrote:
>> >> On Wed, May 19, 2021 at 06:09:25PM +0000, Joakim Tjernlund wrote:
>> > [...]
>> >> > W.r.t breaking ABI, isn't that what PowerPC is trying to do with th=
e new syscall I/F?=20
>> >>=20
>> >> No, it's a new independent interface.
>> >=20
>> > Unfortunately, being a new independent interface doesn't mean it isn't
>> > an ABI break.  In fact, it was a severe ABI break, and this thread is
>> > an attempt to find a hotfix.
>>=20
>> It is an ABI break, that was known. The ptrace info stuff I fixed with=20
>> the patch earlier was obviously a bug in my initial implementation and=20
>> not intended (sorry my ptrace testing was not sufficient, and thanks for
>> reporting it, by the way).
>=20
> Could you check whether tools/testing/selftests/ptrace/get_syscall_info.c
> passes again with your fix, please?

It does.

Thanks,
Nick

> If yes, then PTRACE_GET_SYSCALL_INFO is fixed.
>=20
> By the way, kernel tracing and audit subsystems also use those functions
> from asm/syscall.h and asm/ptrace.h, so your ptrace fix is likely to fix
> these subsystems as well.

