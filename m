Return-Path: <linuxppc-dev+bounces-5530-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9D0A1AA12
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 20:11:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yf9Xf2yQpz30Gq;
	Fri, 24 Jan 2025 06:11:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1033"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737659490;
	cv=none; b=htODncKoy+kMf/jS2Osk15cV/rTbnxMmlma2Im6HzHmerW7n3FRkcEW1161TyJslpgToXrmZlVmhyY/7pMwa9Hx78VAJfjAWe0qlwob+ZJ0o+fkK5dg8u08GcCYPcokPV6VrdBPZhVa4PDuocFtBUz/WNvtkW+fngN7SPczJB0xSmJyJ7WhKblV9ew/9SXSza9bfAVD7rHa3r6SPt6vZKFTpg5cATQTiFMs6LUGFtLSXLJ5jhxvp+jqI72SDyIo5LCHDvfFfXOeWyVQzHN1OBLPbBwfKLEfG9QYoBoSemo+raRIeLyf2sPVeKnqsgapmdj0FK9ttbAeU6Bsqk/xecA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737659490; c=relaxed/relaxed;
	bh=6JNHKj5uig/YqluTsbwA50ILrASTBtg5feg1KazBQVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FcDMjaqexbzLkZWjoehvQQsUoCFZJO6mWdiJi+uRQgMtuSSN8aLQtqXGgf/tOPXxjSK3ef1clv1QHPeJfNCAMUQLRe6q1TDgvK8tDRligxc+zh8jexe8/yLKna0h5WdYJwLo/0AOjKeMAF0CnW49orO9ZVeMpP6h/EBMkfok38avNSp/gSCLdFN1XYt8u4aaMZR32TjIF3HVAV/Sd67f8hGqXVlH+natoiej3Emp3or6cq8k1j2VfLn2Cxd+5gHICO8ToF9WzQr0Y/A6MC+MmS3TjawzNN73+5Dkj0S2OMce4QS3rAnumRYhVd8633Kcbvxc72j/U6hZkIevxX5Dww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GJCDHc1o; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=evgsyr@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GJCDHc1o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=evgsyr@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yf9Xc4PG6z30DV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 06:11:27 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ee8e8e29f6so1982152a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 11:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737659485; x=1738264285; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JNHKj5uig/YqluTsbwA50ILrASTBtg5feg1KazBQVc=;
        b=GJCDHc1oBEyo7sC10GAgpNzl/8IqMd5Bmg3nhjBSsBslVxbhT0OLqhMEWoKGI7c/4E
         5Gtyt4cBGlnc+IqXjgyAlIAQVveqhi0e62u423ljym8Z0638aL/R18x20KdN9EPNOvIo
         IznJ4obtITZSXkYVBZYuJQ+JzHlB1/TxxfVNDZIRZlR9v3aMY0E/1fVC1y2/kMJYNOy6
         JxXpr4ng2KUo7OvZfG1PDW/MwMxtCHpNxzms5a+aziazWnZPUx0A+Z6QHshfIc5/0aG8
         jUNZby6QpNxrP427OMTXT2L5K2SF99awxxXXxPdxgsj+TqgCQH7affELNTjiu+fgknty
         HlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737659485; x=1738264285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JNHKj5uig/YqluTsbwA50ILrASTBtg5feg1KazBQVc=;
        b=IXmu2HpMslSWQOBxSPDt0x2oftgAa6jfomiAUxagqcZYjbMFuWMJPD9JGRDmtPieBv
         vdpznRI2TUbGrcRQjs8bFSWO4eNTS9Jfbe7BEZppPpiBIBDqeQH0YcPDehhQLm2xSUYT
         kHY1kcoBchUwKg2QblkRyODJg+iHTLjap/L+l7j4C2i3MhjeLVVWw2bayJEtfzBX5spJ
         vLoN8jADzTiVvTB1vdg3mNnjV+YyzyF6x8YVL2WxyPSnu7BYOOJXh7qn/5MV/mhlZsMM
         0t1g/JAf2Um6tXXWmOYvczQv8FmLCKQ5dAhr68DjYL/BOz5dTtuE3NlFc716b+b4eScZ
         r9yg==
X-Forwarded-Encrypted: i=1; AJvYcCVKyUTIgxwt8OHoEP9/cWBKEf3q4ByR6H5U29jgpyclUdSjkoGWI+2j5T40TpxsDDShWWdlJ6vx/wYYX88=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyowHJVeenkUXnVexSHP741Sm+Vr8qf45GNUyy2pyL4AmmMtIgD
	4Z2LTUbEZebTZ3ABBED50q6VqSnN7T0Jj5HOJ+oAI+/SUjpJrctVDF22/TMP4QcNoilsB2lLWgP
	SltWoeXjsNfmeD6y1/BnqP/Zaako=
X-Gm-Gg: ASbGncvzFrrtX/nCXGhfCADc8O/LA9UBFjJIgRNG/l69nmmcUBEDq/m+I+G3Uf90jDx
	yRx7hYZl34ZthRmMSFUYUKomyY/IhAbLDAqxG8SCxoHjHBLV81litz6YrRMgJAWL252OIMr5k
X-Google-Smtp-Source: AGHT+IFD9++RFPHYhWrtVVXBxmWB1PT0sGrKkCjtHtQsGlwW0SCJyHVypMeZ6hk6fsahDmfX8TmPAnvtpwCu+xtDOBI=
X-Received: by 2002:a17:90b:520d:b0:2ee:8e75:4ae1 with SMTP id
 98e67ed59e1d1-2f782cbfcadmr36089264a91.21.1737659485345; Thu, 23 Jan 2025
 11:11:25 -0800 (PST)
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
References: <20250113171054.GA589@strace.io> <6558110c-c2cb-4aa3-9472-b3496f71ebb8@csgroup.eu>
 <20250114170400.GB11820@strace.io> <d249e9e2-511a-46af-bd6e-397812b67058@csgroup.eu>
 <20250123182815.GA20994@strace.io>
In-Reply-To: <20250123182815.GA20994@strace.io>
From: Eugene Syromyatnikov <evgsyr@gmail.com>
Date: Thu, 23 Jan 2025 20:11:44 +0100
X-Gm-Features: AWEUYZkFqnfrMLmQHHqcu4Y2mkYVWA4BZtsX9neMR1Kcef_h71o5OVO4st5cnVU
Message-ID: <CACGkJduSVLThnZkVFc0aJWjwD5AdBPmXLvZsqy2UxEVRrLm7EA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] powerpc: properly negate error in syscall_set_return_value()
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Alexey Gladkov <legion@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Mike Frysinger <vapier@gentoo.org>, 
	Renzo Davoli <renzo@cs.unibo.it>, Davide Berardi <berardi.dav@gmail.com>, strace-devel@lists.strace.io, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 23, 2025 at 7:28=E2=80=AFPM Dmitry V. Levin <ldv@strace.io> wro=
te:
> Indeed, there is an inconsistency in !trap_is_scv case.
>
> In some places such as syscall_get_error() and regs_return_value() the
> semantics is as I described earlier: gpr[3] contains a positive ERRORCODE
> and ccr has 0x10000000 flag set.  This semantics is a part of the ABI and
> therefore cannot be changed.
>
> In some other places like do_seccomp() and do_syscall_trace_enter() the
> semantics is similar to the trap_is_scv case: gpr[3] contains a negative
> ERRORCODE and ccr is unchanged.  In addition, system_call_exception()
> returns the system call function return value when it is executed, and
> gpr[3] otherwise.  The value returned by system_call_exception() is passe=
d
> on to syscall_exit_prepare() which performs the conversion you mentioned.
>
> What's remarkable is that in those places that are a part of the ABI the
> traditional semantics is kept, while in other places the implementation
> follows the trap_is_scv-like semantics, while traditional semantics is
> also supported there.
>
> The only case where I see some intersection is do_seccomp() where the
> tracer would be able to see -ENOSYS in gpr[3].  However, the seccomp stop
> is not the place where the tracer *reads* the system call exit status,
> so whatever was written in gpr[3] before __secure_computing() is not
> really relevant, consequently, selftests/seccomp/seccomp_bpf passes with
> this patch applied as well as without it.
>
> After looking at system_call_exception() I doubt this inconsistency can b=
e
> easily avoided, so I don't see how this patch could be enhanced further,
> and what else could I do with the patch besides dropping it and letting
> !trap_is_scv case be unsupported by PTRACE_SET_SYSCALL_INFO API, which
> would be unfortunate.

The semantics of r3 on syscall return (including the negatedness of
the errno value) is documented in [1] (at least for the 64-bit case,
but I conjecture the 32-bit one is the same, sans the lack of the v2
ABI and scv there), so I would suggest to consider any deviation from
that a kernel programming error to be fixed.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/arch/powerpc/syscall64-abi.rst?id=3Dv6.13#n30

--=20
Eugene Syromyatnikov
mailto:evgsyr@gmail.com
xmpp:esyr@jabber.{ru|org}

