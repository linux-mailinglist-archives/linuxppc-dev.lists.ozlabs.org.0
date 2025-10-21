Return-Path: <linuxppc-dev+bounces-13119-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F22BF77FE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 17:51:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crcHC4dnGz306S;
	Wed, 22 Oct 2025 02:51:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761061911;
	cv=none; b=lYEA9or8X4ZQzXEoAjR1qWXFNuII2LXj4ug8BQnNxyVmnyA8J2t/P4HDO8swQlNgCcOq8k/hX/xWYeo4gaNbFVawx2cqUBhrpPd9KlPzM4H7fzn4Ct+H5UHx6Okg8xBqHfmkco/1wm5yXIrP1hVmxc7tCxkmEtUsxTS2Zy2pVY8uicyhAlq0l+i9LpoZvYHXIhm82XbEoZTixGCyV/t37ocQDQRDDHYzBp6ixPhehTBsWp7/1CyKWzJQ9JIvzQG3ODt7jSp6uD/m4l635kBdPJkNwRpg9fhsKmA8Um+hS1HcKIBw8SlgyxhsgazlISJkKOx5M/ke+JYvBVdKtFtFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761061911; c=relaxed/relaxed;
	bh=+0cSMAwFRMJRxsYANvmyJeRZmZI2zdPSEESzl/tT500=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NAOSCGKCNVdmUpCmS0pfIv0ai0uRiuP11TQj7H9h+lE43aT7tFUJhUmt16GZ3rdrMhFRfiv+ZwD/o5NkvcEb1m2PrL2thTA7RFePuYIt1/yarz10pXc30gbteer72+NHpClzsms8zv0HXCnyhThNC4qM0MeLNT9A8INQY0OGRC+ll9NQWnRnwEZ8fIyoqwhS3GC6lJpwYsTnaaO5F0c3D69SDjfUr/8HzPCRd5JdH80LgCRETS80k6JKEIQkt/iq9m3Ydc9dgX12NsRtNtKZFqCyBDQ9OO4W6uE+rbgLlEF6p951+FsGTTxGM6fX6yrAWNwmm7MT+Im7B0DyMjhs4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LmIf1sve; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LmIf1sve;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crcHB1syTz2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 02:51:49 +1100 (AEDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so1095408566b.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 08:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761061906; x=1761666706; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+0cSMAwFRMJRxsYANvmyJeRZmZI2zdPSEESzl/tT500=;
        b=LmIf1sveNn1+D4vKjLLx8g0ndD/Jvzd0eTnud59U6JUaUxRa2TpfsX6wfCoYb36a8f
         LNuf87oil/dpNm6BsCU/vfC3Tj3DEJd473dFGmj4MjlG7HyZZnk0Ul2Ce3UotMIctL+l
         nZIC37dekUTdv+RILf3oqsaYxTz0XaqCMxik4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761061906; x=1761666706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0cSMAwFRMJRxsYANvmyJeRZmZI2zdPSEESzl/tT500=;
        b=KqJ1UDQy60oEMKTOedoipZopaB6ZJBKgkYEPkI1tvkd+wLiQkOszpa4VlwEXTlczbm
         hI2ysVLCzoqWZpBvgPW0PzN8Z787I3rFHH5mMTHeP1aPkNCWwbCInNTYZTwTV8iPZwXK
         xw0/wmZQ/hS3Ip0amFAAiXzUnMXWgjUhjTSzjplAq3iyGyUUHch5am2MTkJdiXTLfceP
         o1UygDUwCuaBnjrBnYq0r9oYOgrCML3ZFiekE4jYoY4qWDSSetK5cLtYDOu/mfPzdlct
         qPCakLhGUfjyF/cgc05bSaRlDs0gzdcaNIE6JLE/2Xulm9WMp7CBBT7MC/YAPHEbs49P
         m1Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVrtfoOu6Q/zTamRE6Fdo4DD9OP9FbyEF8IMMQ+ZJVFIY70NZ7SI8Ufv/T8N4lEGjHiy5Re3bPNLx1iUYo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwIr77KE7BYaGQZiG+AKqag5RZsJ0kSIKgg/TgiA/A4VAJn+sWc
	1xDGO5wN9QQiEQyCvvEGtRChT71etXc0vKO0AMshKSDYVVRbr+8JWCR+c1jFaq6LjFz6nDpWo42
	UGq/ZrL5JZw==
X-Gm-Gg: ASbGncscP6tU40jPcjrgUeHfGoqdkfo7Qwac5BZMt9Q5L18x+qkOEyhCXo9p5tNuK0O
	aQLTXwcdGPCnP7BvSGyRqU4gmzMHpHxeddfBQKigmaDv9tqYSqAWINTGIml8PMZLY3cB6pK531B
	1boav3fvAt8JznlWMZEEi67VZuDjhzUlsnGfXa6CZHqc2RyPNSH+9dngHpf2TRUSC0CPC5DXPYE
	WvaNfAGZRQiPbStgjxPkdP1UuSEH55WPlxcekkK9mDTXKR+rcmq1lgybrOjlu5bM/RDggDHpet2
	YGHAoSm2ig8wBRuXhoo6dlDAfRKP/RcYYj81b8wVUz3wK4QB8thMZ2bmxWkcGNtIStoIhuQvU3B
	58VwPnJsq/xdCg1OBG148hcWwpU/JigRTBsd/UvSckRK3bGOLdNlZEr4Lzhl0ZFE0GSB3TaPLvA
	x9pgMGEVELh3sn8HZqWRHgRpyKHDv/PGKpE9OAIvSIGArL85GOgaMkLx0twzE687cZC/ylt3I=
X-Google-Smtp-Source: AGHT+IEh77ZfNpV1poIOVlhKOJApFVt3lSKb9YWk3qU3YtIVHw9UdFLSQTF0in+yClfB3/VMjJ2mEg==
X-Received: by 2002:a17:907:3f12:b0:b3e:9818:30e0 with SMTP id a640c23a62f3a-b6474b35e37mr1925885166b.29.1761061905921;
        Tue, 21 Oct 2025 08:51:45 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e83958fbsm1116157766b.27.2025.10.21.08.51.44
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:51:44 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so9311529a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 08:51:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJsJhhMy0kxythOyX8urgI25SCvzHcTccVdoicAGKuFWbz/Fj+l29IPTp0qPIplFmBIcEwkMbVQ8udaz4=@lists.ozlabs.org
X-Received: by 2002:a05:6402:518e:b0:63c:4da1:9a10 with SMTP id
 4fb4d7f45d1cf-63c4da19c97mr11628470a12.31.1761061904052; Tue, 21 Oct 2025
 08:51:44 -0700 (PDT)
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
 <20251020192859.640d7f0a@pumpkin> <877bwoz5sp.ffs@tglx> <CAHk-=wgE-dAHPzrZ7RxwZNdqw8u-5w1HGQUWAWQ0rMDCJORfCw@mail.gmail.com>
 <871pmwz2a3.ffs@tglx>
In-Reply-To: <871pmwz2a3.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 21 Oct 2025 05:51:26 -1000
X-Gmail-Original-Message-ID: <CAHk-=wj3VgQAwUjfM_6f5O5gFr4kXBma2q5m8PLarRCnA8R49w@mail.gmail.com>
X-Gm-Features: AS18NWAG7YIQvZWdpCHOlvhJ3OJWyOrD174ntZFm1lwB34kJVwOkBypjHYnGjQo
Message-ID: <CAHk-=wj3VgQAwUjfM_6f5O5gFr4kXBma2q5m8PLarRCnA8R49w@mail.gmail.com>
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

On Tue, 21 Oct 2025 at 05:46, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Tue, Oct 21 2025 at 05:06, Linus Torvalds wrote:
> >
> > We could still change it since there aren't that many users, but I'm
> > not sure what would be a better name...
>
> I couldn't come up with something sensible for the architecture side.
>
> But for the scope guards I think the simple scoped_user_$MODE_access()
> is fine as for the usage site it's just a user access, no?

Ack.

               Linus

