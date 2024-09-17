Return-Path: <linuxppc-dev+bounces-1425-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF2697B445
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2024 21:09:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7WXm3t2qz2xwH;
	Wed, 18 Sep 2024 05:08:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726559453;
	cv=none; b=OJnq2DHlmKDm51lLkJ3vA01IicBnBmH2+RbxskDlH6eQt4BPHq6y3lNHLRoYX6dT78kUemUM9dHzwLraAcomoYm8EDKHUonFxPdTadD78ipT5vq0bKImdDLXs96VENwmmwDoTEw21G9O4bz+IwuscZSYUomQ3+BhLjc5tYK7zfkS8AYMDHMg4zsvIXfObQDgE+PKenVnO4ZPWlq4E0SK1P2rK387xLQN4dtYk1WAoiubg4ummXkML5UcvX9Jp2QUtZnQxlxAa90eC/bEWOj2SRmPdzOzyqS+QuuMUXcc2KOcqN6asz4pJlPvoCfPT8Rwlr5Jcf8oPM8UxuYU95nQ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726559453; c=relaxed/relaxed;
	bh=tOUiZZqfeKnAUWXSdwDzahgPVUGaVsj6hbmrJ1t/ZYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BklQdAmAe1p5c2SopE578t5NODzPBSlDcUCLBdk633hOVj7hdB9fhlGU+O0cpve7p5aLXZzZFGCGLIQQEhkEuPywikKRykvitAqqRSJOR0pmAaxXS9WuCCnWdLs1Y/DvzPhjFC+ria3s0t3cX8VX7gEZztgG7EFGV6QFRCpmkkbuXlXetRFF1qsnOs3ajIx7FN5tnwuyMqvjTzSxva2I+YtTXmNATGw86qGkdzMTx6fZ0vDUpbrf0mn8QVjDBu3awirDmg9RxnMSbc1RZ1aQfrOLEPD5Y5kbJiIFlGtS90Xl+CO6memIrG9aShOjHc/ExG/1U0h4XiyeW4TzZUP3Xg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UsHaXFpV; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UsHaXFpV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7DVN30JFz2xb9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2024 17:50:51 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-374ba78f192so3993185f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2024 00:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726559445; x=1727164245; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOUiZZqfeKnAUWXSdwDzahgPVUGaVsj6hbmrJ1t/ZYI=;
        b=UsHaXFpVG5OimjZzo6mWefht1/xr9A9RNwB/ZRRG1BtwUgvLXfbu6NtCeFhKRw1vSX
         qijkoavzcgXaQ658zNgy6fMHQJjlwztXUSTrPYJB3A6w/KGQlbHa/I7dHGG6Ll1AkiTn
         4k/MFRZ5fvlUyKCjrisP4lUT7lHiPzk7BYamfiBx/QG16u6FoJW+b6zZWrEa2C8cm1qL
         04OuNScIdc8JIMpCSn+laPqH7z35GPIlQ9xcREWxjEiOmf95PCrB1M0af+ZyGokk+/4I
         ZiaGdpNiimKt9X8s9CaHjWGyb0+z0rpbYuaVwr2bdojIcVQZ9Syg6vLOwDnxDbv070nI
         GOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726559445; x=1727164245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOUiZZqfeKnAUWXSdwDzahgPVUGaVsj6hbmrJ1t/ZYI=;
        b=LhgM2/ORDlxI141OP3dF4HTW1wKRhZpBe1Nl54imF1FsFKd2YSjv8owZCQH2O8wW5S
         M00vz+DnPGg37DdedsDO1u/1dPw6FTLNdMculFG2vNB7dr/ifgUeiNNeZ3pSk0LnVHrK
         fkZFywtxhoMWCEcH/ObNDC3ZQ9P6LmSzfpgPlqPs8+GX0ioTFesRM24uBHTPWalxdMDG
         bkyILYaDD4TF/mDjhT7MlBONINm+ByBcdIgfKjbpv5CwxJAafkc/NUJrteJV2wdWmH4s
         m2KHA2B+wt79HtPmIejhRJpkaDUlXX1Xhqs5Ro2C8ESkKrgm4q3tbEIIi9NrXu80GqJt
         RZMA==
X-Gm-Message-State: AOJu0Yy2k3UnMLavLRenp7xwKdnc6K4F1ZLrArBxL4XqcLUVEYXQsCos
	LFSLLh2ILSE+68KUqkjbWqC/3yHAX0yVQAFv8Dkktn0MXuo4Qt4tq4TyncnG114OdnSkw4TMZ87
	nj7axRlHFr9K7mT4e1ZpaBmpnkqw=
X-Google-Smtp-Source: AGHT+IFUHNwJD1rrVSNnhBUjozimr/IRIRFM5+UiXaaxNqJx5qpXzHSNwoRONcrku8KUyImYw3I7mWhNqeuUD/xJVUk=
X-Received: by 2002:a5d:4248:0:b0:374:c847:866 with SMTP id
 ffacd0b85a97d-378c2d06352mr11130199f8f.23.1726559445170; Tue, 17 Sep 2024
 00:50:45 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240915205648.830121-1-hbathini@linux.ibm.com> <20240915205648.830121-18-hbathini@linux.ibm.com>
In-Reply-To: <20240915205648.830121-18-hbathini@linux.ibm.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 17 Sep 2024 09:50:33 +0200
Message-ID: <CAADnVQL60XXW95tgwKn3kVgSQAN7gr1STy=APuO1xQD7mz-aXA@mail.gmail.com>
Subject: Re: [PATCH v5 17/17] powerpc64/bpf: Add support for bpf trampolines
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf <bpf@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"Naveen N. Rao" <naveen@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Vishal Chourasia <vishalc@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 10:58=E2=80=AFPM Hari Bathini <hbathini@linux.ibm.c=
om> wrote:
>
> +
> +       /*
> +        * Generated stack layout:
> +        *
> +        * func prev back chain         [ back chain        ]
> +        *                              [                   ]
> +        * bpf prog redzone/tailcallcnt [ ...               ] 64 bytes (6=
4-bit powerpc)
> +        *                              [                   ] --
...
> +
> +       /* Dummy frame size for proper unwind - includes 64-bytes red zon=
e for 64-bit powerpc */
> +       bpf_dummy_frame_size =3D STACK_FRAME_MIN_SIZE + 64;

What is the goal of such a large "red zone" ?
The kernel stack is a limited resource.
Why reserve 64 bytes ?
tail call cnt can probably be optional as well.

