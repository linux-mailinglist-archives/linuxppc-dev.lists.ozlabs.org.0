Return-Path: <linuxppc-dev+bounces-2163-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 089AA99B7D4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2024 02:53:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XR2182LLCz3bpp;
	Sun, 13 Oct 2024 11:53:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728780828;
	cv=none; b=LsgSD64W/PBnITXnWDeVzwFCYKk4Q9ZrPcVlk0Knuvp0yl3aVAs8MV8HhUFPBRx9IYVZYYOQMpV0jqJYjgcHIanaxMpPu2shsWilXIYIIM4cQZ/dqw5qHRr9NN4E6qmP7r3wpVfD1Jkuk07bZtjTsai7y1Tm9dD5sfexzGz0/EpeyjY43rlQAFs2+HPqpD/cr15fpKRaQok0MAhv71MJOIcp4H2eBMvJ35WUnJP+0988tA1kkS0csEw/zFx95SDaQCsnZHXekGVOB6Trs/mNhZBtnK/J45CQXOZSb3kbrHzaTsTbyjoHcRbDXEoWS5EXznlIIW0R9/tdmG/ztUoOFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728780828; c=relaxed/relaxed;
	bh=QLpE5RgoZ+DVzeHgOxcGYuCQZprDuE7hzttC3czAaSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCag0Qlv5biGvfQYeihVbFWXymX6rAxfsZknBoH8OpUjZeZw83vQkbA1kKdAhOPwWhqLt7smKxb7keGoL1yPZu0dhSyvAwiMZHS3O7TsGwD6DUO6vUQ+Tv5JNiROH/RL57QAYslmp5LAyhXDTYCzTP5of0f/nnI5stne2yvYwLhWRdnubpw3Yg+1UzlQhoGYdazUa5mmByJVLT4C0aCIZ3pOAYUMK3QBj9knjCil6kbQMh/SFT4zPqKscaOIdkuc2MoiTpew/89hZ8biKoWuk+asUEnEuOjbR2xM6q+iTKt7dTVagCr3iX1v+0Qnn8r3bNmCWEYvzuemp54ergx5Ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=TSblFLSY; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=TSblFLSY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XR2163Prjz2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 11:53:44 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a99ffeea60bso30966366b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 17:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1728780817; x=1729385617; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QLpE5RgoZ+DVzeHgOxcGYuCQZprDuE7hzttC3czAaSM=;
        b=TSblFLSY1TnF6t1OEds83VaoG9XNcQa0rFCKLoeEg25kNxu3xi7vQ/4hUrlvS+fmIe
         YBEG3RnvEH947actaQPqJJLHZWCGL68EsA6IcQYfG87H8bDWnYSo8WYQiiC/Woe49m7F
         /MJiqUsNIiwz43aZ+hykH2eDywIdPDsAKCpjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728780817; x=1729385617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLpE5RgoZ+DVzeHgOxcGYuCQZprDuE7hzttC3czAaSM=;
        b=IKXLuXdSsl0lOPMvEx2nOZvpkIjTTOEqu686VigSuUB9+nLwZB4n3KJFYcXJtmnhzI
         513rFbFzWJ/WFLaxdvAc2wC7OkVKw9fC23hSO6s1YKAARlBmpIznBlSjo686hIpUiSXx
         4OzuzAaR0v930RfNFHd09uaDGMxhgT1+qlI3cdKTYV2brO3mHEwQ8P4F5i6JRzvtVI4d
         dMQOqotYVO/nZhRn3wZwTu+ghfrC1ODvqCmwt93E0QdbY7bZfZ4Fkuzd2QhGcCKlx+jR
         U4z4ok1oGIWmzs9DK6Wv7kUZNCQuu5SeL6uQnl8ptscE2kzvOnvCfOyubXi++sdDVHJU
         YmYg==
X-Forwarded-Encrypted: i=1; AJvYcCUJjj/cacJDSImDNOIiyKJTr+Mf88t86EgXAHVzlMhtQ6Vxpb+kjWdKtiQxuGOSJTNTQEY8lTiJMbqzVO4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyMQs0KCPNoOwTS+lbv69QIjKVAPIwQbqx+jfLcPFk5VQKoQltl
	tG2Mys4yylAwcn5EzoCtBu80HfUJ/Ps3fVg7QzM2xtuP2nkV1z3R3UIjnCJwyREpa6YDIT6a4bl
	Kke7tRQ==
X-Google-Smtp-Source: AGHT+IGWfZ+KN///ETFfvoRdI8ehGQIlFwP3ge8QWwYIUeiFUfdbzv9+3B27v+YVbKxVoxTCX/bi+g==
X-Received: by 2002:a17:907:9446:b0:a99:6036:90b with SMTP id a640c23a62f3a-a99b9400c6amr692645266b.24.1728780817294;
        Sat, 12 Oct 2024 17:53:37 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99f629a849sm88073266b.140.2024.10.12.17.53.36
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 17:53:36 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a994cd82a3bso454943866b.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 17:53:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbrxdRO1Zz9xxpo9awPmzRb34x7BZRwyBw9SSH+1fCfvyUniPR45J3SNva9PxGzhYb7sTNYoSpVfxP1FI=@lists.ozlabs.org
X-Received: by 2002:a17:907:72c3:b0:a99:faf4:50e4 with SMTP id
 a640c23a62f3a-a99faf45183mr126559866b.56.1728780815770; Sat, 12 Oct 2024
 17:53:35 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org>
 <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com> <CAHk-=wg=DovySzKb3=g53DeCwv1ZOa-RebaBpYXNXrdhY=a5Qw@mail.gmail.com>
 <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com> <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
In-Reply-To: <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 12 Oct 2024 17:53:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
Message-ID: <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 12 Oct 2024 at 10:44, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Anyway, what's the speculation window size like?

Note that this is important basically because we do *NOT* want to
check the address against TASK_SIZE_MAX like we used to, because not
only is TASK_SIZE_MAX not a compile-time constant, but with linear
address masking, people actually *want* to use addresses that are in
the non-canonical range.

IOW, see also

    arch/x86/include/asm/uaccess_64.h

and notice how the x86-64 __access_ok() check *also_ does the whole
"top bit set" thing (iow, see __access_ok()).

IOW, this actually goes even further back than the commit I mentioned
earlier - it goes back to commit 6014bc27561f ("x86-64: make
access_ok() independent of LAM") because without the sign bit trick,
LAM is a complete disaster.

So no, the address masking can not depend on things like
__VIRTUAL_MASK_SHIFT, it would need to at least take LAM into account
too. Not that I know if there are any CPU's out there that actually
have LAM enabled.

            Linus

