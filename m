Return-Path: <linuxppc-dev+bounces-13115-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCEDBF73FF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 17:07:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crbHf3Nb4z30D3;
	Wed, 22 Oct 2025 02:07:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761059230;
	cv=none; b=LlSThw5cx6I9pdM9o94mo2CuHN2dqkXtN0+yo4dHY9p+metldmEqZ6eBg8YFWUP0SAzY/HbCtMz2Ljman0dPX6JlBDuyO9hErtQUIbaxQF6WodW9T02IAvwccEBZv/BxKqaHLkzIlmOwSdQW6JJ+RsYVgF56XKQONYq1uTFymvnLFEr1jacGCXdynN1SkYLlLd8goSamwfkVGPwZ2Qtk+ttBtR470Uk0IOBm/MB7cuCKAasopGi6saFwEFHRRFKeYSCXwkdxSI2/loENamnnoRyF8UM8KpSSilWkcNqRBbfTYcbMQpm4kXf8e4ne05RWj/cgfNzmA5NyOMXCOvIJBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761059230; c=relaxed/relaxed;
	bh=5p3iIWVRp3NUhUS8ltDIPiH8ErmpKdyMg8XkHtjDt5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZCl1i7BqpM/tpfpwplp/XmBmlE2bQLOHXuT/wTWU7dGQ/TvIU8bDDQFUco0eneAmZuBjCqiCQhgJNPyLRB7tepJXMQO8byr6wWmXvfRy0jK3ybojXNQE2HM/Zl7a5zgBQDQj44ZVfBPPhLp2kg6T5QtRFYiE06Bxjuj/MOSenluI/u+5uAQJqfPOj6hVMYrUgHJKgT435SMYtvdmoEqrXyfRHxlxW+/th1PcBrMsmD+oURyhrUVqSvIPXy65xAPqycgR9NeyDsd9atYO1vVPmUkdPAOjdH58y3MmxCx7YE+f8NpykZQ7dL5MFIDBWbu+BPtJ3xtJxGIy6wZaqb4EKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Fizkrgv8; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Fizkrgv8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crbHc3sVqz304H
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 02:07:07 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-63c3d7e2217so7667588a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 08:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761059219; x=1761664019; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5p3iIWVRp3NUhUS8ltDIPiH8ErmpKdyMg8XkHtjDt5U=;
        b=Fizkrgv8Q2u9GIpQ9nSHR82/1DlWW7e2SRujyjNNDW4F/yYQiZgFgUGVKqVEz426iz
         I25CecLVTr1tQFyFiq6gCQW5SkNmvWiMpp5/WgfFhPsSY2TBIoao3AxDtoGSFH/o/W3Q
         2gQNMdbEUKsRJIdtcn8iZ3Bs6CxZjfxj7D6OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761059219; x=1761664019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5p3iIWVRp3NUhUS8ltDIPiH8ErmpKdyMg8XkHtjDt5U=;
        b=R5E+bEl+VGHN2QwyhI0yT+fITbKLshNRX+qZt7odVX7CDFSDFTKftxO0dgOmJZT5WQ
         GQYbJrsjfJcyYKL/SkP7+g/ODfnsAG3vaYX9wCbkPLa4aqR/NWNQVJXN/+VmKruM2bye
         weCNC0a+T7hFpGtwUsYoGOCF0osH89bCdqZxceJnegFvwXSooUzvPZwD8CyO4DVNRYXq
         aORw/B+FTUHjZrDOWtIA0X18V+rZlu09iWQSzMIALEH+X/Xw8g1YdEJMAYx8ylFNyBle
         fuUj9hk5QoraAB0YtenTHlyaSHNcDWm8B6yS2wg+gmkRPBw6g+2sonxkFwMmLTDDD/8Y
         YZfg==
X-Forwarded-Encrypted: i=1; AJvYcCXOwzve72jm/jr+cDUY8maEktHBPA5Mj/S+5tbUErX+eRShDGsPYd232iad7RDB6cEmzgMM9rSRh433g8c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzL7/1rLGdYcgRbBURZmyCffs63v8ynMaBPTamjs4nisbIWOI7Q
	JxNSjxxm1N+2JE3IyS2ZcmMjHitsBEaKAAjP3ZrsvDbhRqoJ+sIwYCz6DkPWO+3TDeVkmLZKH9V
	mTb4IYH8=
X-Gm-Gg: ASbGncvqiYPWVOGHv6PkmhvI01rRbLajpyINJl78v3VcoY3V192Dr5JeACREQtmBqdd
	zcV4G16IMT81c3z877seW6wRs4/+fsMcwB1RVelOVGZGGdDE0g1fkS+q5XNZDworx6E/WByPvL1
	rtwn0nyWhyIxMcnNPcRIkFX8uAMBD4vrev0ic/IVe5hdhcUWA9UTD7r+puYvR7E12X1QrblSzJ2
	5yrO++nA6J/UdoFunDvgZKSIdkZRLxK6At5CaDDaA2+xq5o6w05bEF5tQ+9MBrlHljBDOul6dJs
	VP1D3e4T5XFeUISKCCmrdchXBJhbSCj+K2pw4cZP3wEZbWEbWmvB/59hVpGhKeSsiKOLuk5OKET
	z0BpAxoD3jZieM6hPF2xwDrVI0PK7q5yFj7F9erTd5GZr6SnxBlR2LhsrKapooVQg0VIeMIO9Q3
	p8g27W2amusVRqsueds7PqgUkE4fZP8zcaVZNBAAq02/uD0DgVjg==
X-Google-Smtp-Source: AGHT+IGbHq5M1tTtGjxlrZwKMs5+hAceKdLwWU53XCjAxVTYGnO+3H7h/FbQtTdU4RPmStwk4oOY8Q==
X-Received: by 2002:a17:907:7fa1:b0:b5c:835d:8d2a with SMTP id a640c23a62f3a-b647323e845mr2160488266b.15.1761059219290;
        Tue, 21 Oct 2025 08:06:59 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb03636dsm1096327266b.52.2025.10.21.08.06.56
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:06:57 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63c3d7e2217so7667424a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 08:06:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6DzKruATnTCxNrkFdyCvD5qzgCOPkZFH7bU8MMcY2XBXp7Tug/8xfI8/AF+B1dRDEfASeKr6eCw5Advs=@lists.ozlabs.org
X-Received: by 2002:a05:6402:1ed2:b0:631:cc4f:2ff5 with SMTP id
 4fb4d7f45d1cf-63c1f6c39a0mr15531402a12.25.1761059216055; Tue, 21 Oct 2025
 08:06:56 -0700 (PDT)
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
References: <20251017085938.150569636@linutronix.de> <20251017093030.253004391@linutronix.de>
 <20251020192859.640d7f0a@pumpkin> <877bwoz5sp.ffs@tglx>
In-Reply-To: <877bwoz5sp.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 21 Oct 2025 05:06:38 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgE-dAHPzrZ7RxwZNdqw8u-5w1HGQUWAWQ0rMDCJORfCw@mail.gmail.com>
X-Gm-Features: AS18NWA4hFVtubdvPHiqdyKph2ZRKrwMfjnw6C6eEZqbhQOMaKTPF5q4gpdDvSA
Message-ID: <CAHk-=wgE-dAHPzrZ7RxwZNdqw8u-5w1HGQUWAWQ0rMDCJORfCw@mail.gmail.com>
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access regions
To: Thomas Gleixner <tglx@linutronix.de>
Cc: David Laight <david.laight.linux@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 21 Oct 2025 at 04:30, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Mon, Oct 20 2025 at 19:28, David Laight wrote:
> >
> > (I don't like the word 'masked' at all, not sure where it came from.
>
> It's what Linus named it and I did not think about the name much so far.

The original implementation was a mask application, so it made sense
at the time.

We could still change it since there aren't that many users, but I'm
not sure what would be a better name...

                   Linus

