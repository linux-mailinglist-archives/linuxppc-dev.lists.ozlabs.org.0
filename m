Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01548147125
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 19:50:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483WYm4sHZzDqbg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 05:50:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=Mj9KYt/E; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483WVs3Q01zDqYb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 05:48:04 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id r19so4794181ljg.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 10:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nTTlf7PIq8m+h1b8hl1eM7lP8o081tv0+h5Byplabe4=;
 b=Mj9KYt/E2aNDAWdYyMNCrPSCFRO71sOFNKIv1qcIG2H25vJy2SyD3sMLVq4FaDcfeP
 iGlcEsouR1fuzQs9IjFsmMH6TyLgOGNtzw0PWZ+6esf3f+uNHjTwy2QjoAL8divZL0PF
 0AN44j8uLfXOosmSCqaAgRkchGVu+6EMdfKNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nTTlf7PIq8m+h1b8hl1eM7lP8o081tv0+h5Byplabe4=;
 b=KoF4Ukz86gfBsQq9+rP6Y3XBJZ29LlETYGG7d62aSD9lvLCYrgx6SlKKlm+JVvpbpB
 zk/MyIS2xhudnUzOQIG6g20Y+NDwTHb6Yp2958xkSaHz4XwjvJeqUWfDPMyB091OlWz+
 pZ+z+/WlV3Ta3fSGV8gGVcGSaN8B1DlU5ig2Yp9v/dSlFTNhdss64JLDV4YACdPS0jkJ
 xhSSU1YbqGPA/g7m8o92TkXz6o8rNaxmLCmfJYT9CptOAoua0jgV7KJxm8yqpjUyWtUG
 IX0HkBZM0Rnzb+bgm+JGngeF1oes0k42wYlolnj7Lc0Y803jETsCpnNF91NBMo2G7H+s
 YL4Q==
X-Gm-Message-State: APjAAAWofTbtX3JZLP4snv2mFV8AUmiDsFfNRjGCrG5ccstCTWXPNbKp
 uCLnQFwqcZoJExOUFAP34VRviEwO1pU=
X-Google-Smtp-Source: APXvYqx6BO97Q8RcOkw4K3CyZ3ArKrHucKOZWgToWYsKNIRu+T+VfTXyHZa1jzJAC5tD1HA65eswXA==
X-Received: by 2002:a2e:9c0b:: with SMTP id s11mr23357892lji.11.1579805279377; 
 Thu, 23 Jan 2020 10:47:59 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47])
 by smtp.gmail.com with ESMTPSA id u16sm1742132lfi.36.2020.01.23.10.47.58
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 10:47:58 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id v201so3094354lfa.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 10:47:58 -0800 (PST)
X-Received: by 2002:a19:4849:: with SMTP id v70mr5482335lfa.30.1579805278133; 
 Thu, 23 Jan 2020 10:47:58 -0800 (PST)
MIME-Version: 1.0
References: <70f99f7474826883877e84f93224e937d9c974de.1579767339.git.christophe.leroy@c-s.fr>
In-Reply-To: <70f99f7474826883877e84f93224e937d9c974de.1579767339.git.christophe.leroy@c-s.fr>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Jan 2020 10:47:42 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgcm5JzyacekDGQ4Ocoe-F5it-7-sbgU8oPnhwnSH3KAA@mail.gmail.com>
Message-ID: <CAHk-=wgcm5JzyacekDGQ4Ocoe-F5it-7-sbgU8oPnhwnSH3KAA@mail.gmail.com>
Subject: Re: [PATCH] lib: Reduce user_access_begin() boundaries in
 strncpy_from_user() and strnlen_user()
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 linux-arch <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux-MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 23, 2020 at 12:34 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> The range passed to user_access_begin() by strncpy_from_user() and
> strnlen_user() starts at 'src' and goes up to the limit of userspace
> allthough reads will be limited by the 'count' param.
>
> On 32 bits powerpc (book3s/32) access has to be granted for each 256Mbytes
> segment and the cost increases with the number of segments to unlock.
>
> Limit the range with 'count' param.

Ack. I'm tempted to take this for 5.5 too, just so that the
unquestionably trivial fixes are in that baseline, and the
infrastructure is ready for any architecture that has issues like
this.

Adding 'linux-arch' to the participants, to see if other architectures
are at all looking at actually implementing the whole
user_access_begin/end() dance too..

               Linus
