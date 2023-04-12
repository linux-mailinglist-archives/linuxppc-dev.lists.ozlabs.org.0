Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 942176DFFA4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 22:23:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxZ113Brvz3fCn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 06:23:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Xm+oLaLy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Xm+oLaLy;
	dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxZ061dkxz3chq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 06:23:00 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id c2so2517265ybo.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 13:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681330977; x=1683922977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgwjS6Tr4i1305yeX30DIlabH7TqwnvRJKw/s8cbqkI=;
        b=Xm+oLaLy2xX8U8M3214PtlhA3pWh+6m/xZ7SE7GRIwizo0thViCEKmE8fPlBFQ9G3p
         Hztwgts8VEscCrAsloNWb4fLv9+D74xec1d79hZVChGcAk33NydBAoUVkiYPRpWmxJuI
         L8XbeIvSa4EO+hMUKbHSi6E49wl6FZq7+dd6a+eB4GC2MIRGdSJEJMrHCQN4jD2FQdFr
         q9UupqcdO5LzGVxuSOFY2SahZmlT9PaBzL8csr8/oQFAbkb+L+bw6FunMFSct6Ssw3BV
         k/KrwVIswr4u5gtNbbBOIPx4b4dypSzrhc1Rdab8MUsS0s/HjiDiKIXQTNhKw8QFsEBy
         QLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681330977; x=1683922977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgwjS6Tr4i1305yeX30DIlabH7TqwnvRJKw/s8cbqkI=;
        b=Zu/8bBWjUU0MSZB1JN9e44AHu6eglo5e0ZZGs/oWCtOt7zC0pFe8NuuEUkhMZO8N0T
         3Wln2YUGiESFg5aTST0spBGQ8xqHv9zofQYIt2DS/sXSY6BwXClmUHM0C1jmrCfGtMtS
         QkzNJosq+NPhEtOKTAW22Fi+euA8yonrUEG9qbLu7WVcEHsTZRkrAocG5N/+T8DQN7Y5
         n0HsGU8xNDGD6bFj5szsXZTMq2x+gqyeCGweMKgx5WjXXKJX2nTth2tIphW0eQELokAl
         Z7avDO3Iypq3whHMVc8fGSjF3ResQB/+H035IllkLJZBxxA3OSYLJ331mxeeVIHWLwST
         LRIg==
X-Gm-Message-State: AAQBX9erdE1URddq9fYU3ajCloPJTtAdoyDhxa5Rmoh0wH3lp2ibJ8xy
	OHpuhfaKWAMIMHZZIKPSLAjgohH474u9LxgYT6Q=
X-Google-Smtp-Source: AKy350YfoLyqtWzzli9vHTYdX013KqUtiC1U6d/03D/of28HrW6Se3PJdf29WJ92nMhtkEq1HTJZDmV6JX+LoQ8cWV4=
X-Received: by 2002:a25:d9d0:0:b0:b8f:350e:ccee with SMTP id
 q199-20020a25d9d0000000b00b8f350ecceemr2358222ybg.11.1681330976992; Wed, 12
 Apr 2023 13:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230412-no_stackp-v1-0-46a69b507a4b@google.com> <20230412-no_stackp-v1-1-46a69b507a4b@google.com>
In-Reply-To: <20230412-no_stackp-v1-1-46a69b507a4b@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Apr 2023 22:22:46 +0200
Message-ID: <CANiq72moZqOWvSQ=updqMEVe1NggyAO-_iD6s0UMSL8HZF0mtQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] start_kernel: add no_stack_protector fn attr
To: ndesaulniers@google.com
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
Cc: llvm@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Borislav Petkov \(AMD\)" <bp@alien8.de>, Tom Rix <trix@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, linuxppc-dev@lists.ozlabs.org, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 12, 2023 at 8:32=E2=80=AFPM <ndesaulniers@google.com> wrote:
>
>  include/linux/compiler_attributes.h | 12 ++++++++++++

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
