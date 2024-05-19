Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 01EF88C975B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 01:11:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iu90FAOX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VjGS40rjbz3dTl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 09:02:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iu90FAOX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=andreyknvl@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VjGRG32sgz2yk7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2024 09:01:43 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-351d309bbecso1487286f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 May 2024 16:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716159693; x=1716764493; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pP8H1QGY/sk27w7vno3j6ucygejbv8hF4gXfEvTkZuE=;
        b=iu90FAOXib4y73ADgvjx3bMEoyY2Yj85P9FQi6+ZBi3I+wd5HmbdBimnGHmcr1ZsWk
         JuomI/R8kqir2zVq937UhYSjaPJpxEHbj+jCNJoriTfon+qHqSpvPk3IRlBTPS3fdPRu
         izSGMkfDKKNmqkk5nMP22D3e2n0jTEp+UQJtDOL/0yruUyfJ8cpy2uvFh9QCooOeO+nH
         Qy5nDkj2LOvJagB0DQyqgsIeu5q7el1s3H4GIpPEw2FAH8Soysqq+J/YcLFL6zP0E1vm
         XQcLpOOOEpXmLfKMPPJhZQsmxAKy9SomgNWPML2ze2PR58qNutlqYaIboBTq0nkdAkSa
         2g8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716159693; x=1716764493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pP8H1QGY/sk27w7vno3j6ucygejbv8hF4gXfEvTkZuE=;
        b=SC/PGqdy0q6qvObPGoRpN7Rzn92h4T6WtU95eaYVkzUnmsCEpEYEUBG3fLjvO4FNCl
         OkiD0xm9tkxe3dYX8lFdh6aBRzf12GXjZ62G4C/6hdAwY8N/3V2gMyRQtMKnhKA6+5+Q
         5h9mMC7ruJ/N0BNqn+ngoLaG9iek/dLdbrXAhm/FM4UCIBT5Kot8QVeFHhqZHHXVrflH
         H2cDQ+6+BjLj/SeFYBRo8fWx7BDAB4OOKV7umo6IdGSFpoQlYKCcqm3ZrpS49bIJkhna
         drbha1uPwj3YETP+pVpuAPENEGTv/RmJZuSlZGPAPbm6+4VA7s6SdVI03eTt5cad9915
         2oUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbCyH6eQzDjSe7aHDbcIgEm4WIESWH3XhVoiNSuI1M8GlcL3Gr1s5odh6Y9TGOC/QR43C7tqTID5mRhB08iOsQEDALQnwzhoioaetpBQ==
X-Gm-Message-State: AOJu0YzMSMCwYMRoBeYhQy+BTAx5cyCP2NT97n7yIIFZRVO8r/RQ3S+n
	XMSILnoX6lPPHPuSUbuSypjn4fHrZQXYgsy31wCsnVLCzFRoWCszFn4xcq7vLZdiwS9xibNZ3PD
	SFiJjv0aQkU5Z4TJvD97HADlrFivDJr/1
X-Google-Smtp-Source: AGHT+IEQUmIu2T7OVPGGqTKbdQ0hKw9Ku6RQt19WUiptlpkmXt9rinOBULWz6djACYrjsbGf7qdgUoyBjs+CUFYF1Zk=
X-Received: by 2002:a05:6000:c0a:b0:34d:a33d:7f3e with SMTP id
 ffacd0b85a97d-3504aa634c2mr23316871f8f.65.1716159692654; Sun, 19 May 2024
 16:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240427205020.3ecf3895@yea> <20240501144156.17e65021@outsider.home>
 <CA+fCnZdNBEekgcfaGafJKmpb-A7R6rBuL5QojOhpqkHZvz1nKg@mail.gmail.com> <20240518170548.13124cfa@yea>
In-Reply-To: <20240518170548.13124cfa@yea>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 20 May 2024 01:01:21 +0200
Message-ID: <CA+fCnZeeJub5iCwwwGM2pDt9wzX=T4+wpZbbGhKQ7Qbtb+tFeA@mail.gmail.com>
Subject: Re: Machine freezes after running KASAN KUnit test 21 with a GCC 13.2
 built kernel but runs tests fine with a CLANG 18 build kernel (v6.9-rc5,
 32bit ppc, PowerMac G4 DP)
To: Erhard Furtner <erhard_f@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Nico Pache <npache@redhat.com>, kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 18, 2024 at 5:05=E2=80=AFPM Erhard Furtner <erhard_f@mailbox.or=
g> wrote:
>
> The patch fixes the issue on ppc too. Thanks!

You're welcome!

> The test run continues and I get a failing one later on (though not '31 r=
cu_uaf' Nico reported but) '65 vmalloc_oob':
> [...]
> BUG: KASAN: vmalloc-out-of-bounds in vmalloc_oob+0x1d0/0x3cc
> Read of size 1 at addr f10457f3 by task kunit_try_catch/190
>
> CPU: 0 PID: 190 Comm: kunit_try_catch Tainted: G    B            N 6.9.1-=
PMacG4-dirty #1
> Hardware name: PowerMac3,1 7450 0x80000201 PowerMac
> Call Trace:
> [f197bd60] [c15f48ac] dump_stack_lvl+0x80/0xac (unreliable)
> [f197bd80] [c04c3f14] print_report+0xd4/0x4fc
> [f197bdd0] [c04c456c] kasan_report+0xf8/0x10c
> [f197be50] [c04c723c] vmalloc_oob+0x1d0/0x3cc
> [f197bed0] [c0c29e98] kunit_try_run_case+0x3bc/0x5d8
> [f197bfa0] [c0c2f1c8] kunit_generic_run_threadfn_adapter+0xa4/0xf8
> [f197bfc0] [c00facf8] kthread+0x384/0x394
> [f197bff0] [c002e304] start_kernel_thread+0x10/0x14
>
> The buggy address belongs to the virtual mapping at
>  [f1045000, f1047000) created by:
>  vmalloc_oob+0x70/0x3cc
>
> The buggy address belongs to the physical page:
> page: refcount:1 mapcount:0 mapping:00000000 index:0x0 pfn:0x79f8b
> flags: 0x80000000(zone=3D2)
> page_type: 0xffffffff()
> raw: 80000000 00000000 00000122 00000000 00000000 00000000 ffffffff 00000=
001
> raw: 00000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>  f1045680: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>  f1045700: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >f1045780: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 03 f8
>                                                      ^
>  f1045800: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>  f1045880: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: vmalloc-out-of-bounds in vmalloc_oob+0x294/0x3cc
> Read of size 1 at addr f10457f8 by task kunit_try_catch/190
>
> CPU: 0 PID: 190 Comm: kunit_try_catch Tainted: G    B            N 6.9.1-=
PMacG4-dirty #1
> Hardware name: PowerMac3,1 7450 0x80000201 PowerMac
> Call Trace:
> [f197bd60] [c15f48ac] dump_stack_lvl+0x80/0xac (unreliable)
> [f197bd80] [c04c3f14] print_report+0xd4/0x4fc
> [f197bdd0] [c04c456c] kasan_report+0xf8/0x10c
> [f197be50] [c04c7300] vmalloc_oob+0x294/0x3cc
> [f197bed0] [c0c29e98] kunit_try_run_case+0x3bc/0x5d8
> [f197bfa0] [c0c2f1c8] kunit_generic_run_threadfn_adapter+0xa4/0xf8
> [f197bfc0] [c00facf8] kthread+0x384/0x394
> [f197bff0] [c002e304] start_kernel_thread+0x10/0x14
>
> The buggy address belongs to the virtual mapping at
>  [f1045000, f1047000) created by:
>  vmalloc_oob+0x70/0x3cc
>
> The buggy address belongs to the physical page:
> page: refcount:1 mapcount:0 mapping:00000000 index:0x0 pfn:0x79f8b
> flags: 0x80000000(zone=3D2)
> page_type: 0xffffffff()
> raw: 80000000 00000000 00000122 00000000 00000000 00000000 ffffffff 00000=
001
> raw: 00000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>  f1045680: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>  f1045700: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >f1045780: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 03 f8
>                                                         ^
>  f1045800: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>  f1045880: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     # vmalloc_oob: ASSERTION FAILED at mm/kasan/kasan_test.c:1680
>     Expected p_ptr is not null, but is
>     not ok 65 vmalloc_oob
> [...]
>
> This is in line with my CLANG 18 build where I get the same vmalloc_oob f=
ailure: https://github.com/ClangBuiltLinux/linux/issues/2020.
>
> There Nathan already found out this happens when the machine got more tha=
n 867 MB of RAM. Probably this test failing may be a ppc specific issue. I =
can also open a new thread for that if you'd like.

Yeah, I suspect this is something ppc-specific and might not even be
KASAN-related: somehow vmalloc_to_page + page_address return NULL. A
separate thread with ppc maintainers makes sense.

Thanks!
