Return-Path: <linuxppc-dev+bounces-3503-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0289D6425
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2024 19:23:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xw3Py4m2lz2xn3;
	Sat, 23 Nov 2024 05:23:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732299814;
	cv=none; b=dXR9P4/0B43E+sBkXVsOEuoU7a3JLkG87sAy+1OJQEVCxuZ5ROS/G3js5xns4UbU+IhqyrJVCmmnxUaoZzpZhJA+QWBgbBbOSehxUU7XnAYMkeyGEcXlgkQMEQl0K2CS8qJP5Nyz+SA5qk59W8QiHqeaSXAWxJL3kZAG215M+EMnwj4CFTjztLCgHA3TySdPvOTghnDqUmo5OlIwl6RDrzyqoT+IvWFc3b1yQ45W4IiWLOnBBE51OrsMUK9SiR1fHNWRGuigUClttfFzpULjad2JFrnls40K7k8V5j0bW8U1ZPvrZWjzEynYgWD3xc2QydM79HpuCD2YIl0WgP05jg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732299814; c=relaxed/relaxed;
	bh=JgWJuWzzZdWVc2fPTgYPRbiswOFfHlPecfqZMgXkDDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ByL+B7uW50X75Ng41BbYFmIW2uInpASuDnwz+LhXqwq8K62DY6rMKEZwqA4lNzZ/OIrRAzshuWFzrMRDd8qvxUa6ZZjV8qnpdU5aU64FLwQE8qzi/GIuYmgcq0GuS2LPKEw75SyVZqaLW3uIEJc1xxr/HSKOPotpeB1PqWSW3M4ljoAIqKt7OQw0Sy5nRzMrxF9KpvCzlX4Z9BQ7Mo7/90hk29gcU2aTi69Dy0H9nCYdWuNe2sQVexSMPHsJj2HFhdoeucpgxLuIEvgfhgToEL4T8T4kZSwPdsCSecwJ7YaaD7tKByopb+qZ3ssl4/Rc04a4VVlbTQ1Ii2pCbciIzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=CfqeOoUi; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=CfqeOoUi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xw3Px0g69z2x9j
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Nov 2024 05:23:32 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a9ec86a67feso404639066b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 10:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1732299805; x=1732904605; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JgWJuWzzZdWVc2fPTgYPRbiswOFfHlPecfqZMgXkDDM=;
        b=CfqeOoUi5OnlnHhEuS1UC94ZBdfX76i5IR+OUAFYfgU1DsLENH0iF2fSyUB4rQRZmf
         5Lb8gVPGbrCnqbGS/5L80kvwS/krvPgtGbkOimmEmtbyQVaYb3oNOYGMXj8Lcu7zY4fz
         j1Y+vUb1joRMkJFWI56pV567qg/RzOcc2XiY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732299805; x=1732904605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgWJuWzzZdWVc2fPTgYPRbiswOFfHlPecfqZMgXkDDM=;
        b=eC3DBbFWToXpAvmM4GMKIAFHU6ZdhfRMPvj7ImB5Cyn8NXzdN+rjkRPwLzrGFuBC3g
         B7hEwYR/AoBMDczYX+sKvNcZ0ErAqjWBBJDvvVReoCVrh/fYgaC3fk4jn9kLqlGjOltq
         J7xOGmLnK/3EDUwYxIk8ZZlFYxh+gI/oF/1te/XFaMg411H7dWxLKLZ2D0KQl2PaD+Aa
         /HVoOfkttzpKuzOcgXNkPixjArTuqjCLnHZxI9RW4Ohjkc+4n9ExvMD6S+u1mQyzUtXt
         BqC8TKSRdVU73A+vzzMaMAn6/G+xKXZD/vqb+ZSKkQvB0gkTT/9GuMquai4sxZplSzir
         BnDg==
X-Forwarded-Encrypted: i=1; AJvYcCXD6Ts8H/P+XJDhEfV+JxEQgA7jnRXxz4f6Q+RkdIGmcw4/NddhrexVFrJKtEsDsMTRgSXR5Vd/8rQPNS4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx+t/ISaruv7o0bSaYoaRCOhFeOipQLzlsTiDPUcXNT77R4xRhv
	ZynmvehNiX1WnDoglQtmQg6QTViCu6P8h/VObqfk8w94z0F26rlzbOh/PgkBMS6IFhy4wpcHnqS
	AJ0oJ3Q==
X-Gm-Gg: ASbGncu/F1ayBy/oV0QAcxCdRU5+IHtoXr/+11bjD6GTziMDS8qSUybpq4OqehmvGlf
	7HXtUTe5trNlWhdgcQcXfD3V2KC6A2342fqlW7m/0p58UXLM8IdnEudh0Hs3VNWtXVMnQj9C3sI
	V9S4jskP0H1h0R+tWG47y38KLQRvz0ZhjRyJGYHUdQloFDzEU6dPOMcZA0Y0QHwfgv7ZwwOOE/i
	+QKF9isVb+qUl5koz11ysZQRzExQu7XG5rS8iQOc71vdZ4I+/qfYQPYcnQHaY4++rT1ePb12gOX
	Knj8fzIrgeRpnP14z+vPymAQ
X-Google-Smtp-Source: AGHT+IG5xuMfGZ5PsgxSffJKn2RxSs1qg3Gm+rm+hwzc3wOVywvL3NwnwBg8zIhN8i/cUCopCdDKFQ==
X-Received: by 2002:a17:907:1dd4:b0:a99:ff2c:78fc with SMTP id a640c23a62f3a-aa509d12d98mr283726566b.57.1732299805347;
        Fri, 22 Nov 2024 10:23:25 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa51759737dsm98827966b.81.2024.11.22.10.23.24
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 10:23:25 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cecbddb574so3259893a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 10:23:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbwjv+//VsAz1KZpaheuq8s+4kMNtLoeeXHflwTr4ibzcN3r58W7MBwohFUy/AJjuKWwjmgVp4d+ET34k=@lists.ozlabs.org
X-Received: by 2002:a05:6512:12c2:b0:53d:d589:a8b7 with SMTP id
 2adb3069b0e04-53dd589a95dmr2151598e87.54.1732299434382; Fri, 22 Nov 2024
 10:17:14 -0800 (PST)
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
References: <cover.1730166635.git.jpoimboe@kernel.org> <82cbb9983fef5ecf6f1cb33661e977172d40a7e6.1730166635.git.jpoimboe@kernel.org>
 <20241029032735.pw3bg64bpneqnfhk@treble.attlocal.net> <76bb85ceeb854e3ab68d87f846515306@AcuMS.aculab.com>
 <20241115230653.hfvzyf3aqqntgp63@jpoimboe> <CAHk-=wgLCzEwa=S4hZFGeOPjix-1_fDrsqR-QLaBcDM-fgkvhw@mail.gmail.com>
 <20241121214011.iiup2fdwsys7hhts@jpoimboe> <CAHk-=wigHm2J4LkUL1=y_H8zGwM0JsK2CrWyLNbz9fvXfbaBQA@mail.gmail.com>
 <20241122001223.t4uywacusrplpefq@jpoimboe> <CAHk-=whm4fEYrzrrRrqEhELLFz2xNCMT9be+J0uiR_EwXwa0DA@mail.gmail.com>
 <20241122031115.5aasuktqrp2sidfj@jpoimboe> <CAHk-=wjJt49tgtmYv42bXU3h0Txb+mQZEOHseahA4EcK6s=BxA@mail.gmail.com>
 <ab5cdb9b-227b-473b-ae39-6b4969506a5e@csgroup.eu>
In-Reply-To: <ab5cdb9b-227b-473b-ae39-6b4969506a5e@csgroup.eu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 22 Nov 2024 10:16:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh0tnmhigqc=2wN-0OtdLhJU-9eYXgpFgbOR6eKrsh75A@mail.gmail.com>
Message-ID: <CAHk-=wh0tnmhigqc=2wN-0OtdLhJU-9eYXgpFgbOR6eKrsh75A@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] x86/uaccess: Avoid barrier_nospec() in 64-bit __get_user()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, David Laight <David.Laight@aculab.com>, 
	"x86@kernel.org" <x86@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Mark Rutland <mark.rutland@arm.com>, "Kirill A . Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 22 Nov 2024 at 01:20, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> On powerpc for this kind of stuff I have been using do { } while (0);
> with a break; in the middle, see for instance __put_user() or
> __get_user_size_allowed() in arch/powerpc/include/asm/uaccess.h

Oh, that's indeed a nicer syntax. I'll try to keep that in mind for
next time I come up with disgusting macros (although as mentioned, in
this case I think we're better off not playing that particular game at
all).

                Linus

