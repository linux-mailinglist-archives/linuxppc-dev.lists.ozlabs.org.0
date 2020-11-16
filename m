Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 463572B42D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 12:32:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZRk92xZSzDqLV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 22:32:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b42;
 helo=mail-yb1-xb42.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QnkJ2u35; dkim-atps=neutral
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZRcY3NjSzDqLJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 22:27:08 +1100 (AEDT)
Received: by mail-yb1-xb42.google.com with SMTP id s8so15292916yba.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 03:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RA52pn8MaZH7xZTx5g2jPIp9RO4lpE9y7bIaH6ByAsk=;
 b=QnkJ2u358zISGRf1VPFWi64uQmLAG1WEH4mYIho/obEwuolz7skMiKeOaoAZ46cFvl
 ehlK1W1tSQs+x6WfwFUIgxFiE7GnpJ9k2geg/QMYT3jFTCndmKYjLRwt0EQ+4Dn4JTJz
 soRR2SXpI5pGjdKjDyR5+8AxcT2+LLpa//AnsIZOn3Uy+FlhKl9SD9hjs5QgoxuPmSWm
 2pE0bAHBF0s+5lXfVmahUWriO9DZXqtuRlrFQXHzcElmig7p4n4T80XVxQSRKwl1/i2f
 J+0dovANyKjPeHqk0tCQTTjmJIqV8Pyvj1lgGePu0nJB50SLtSKJfd/xp4DlJmc8u4Uh
 KEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RA52pn8MaZH7xZTx5g2jPIp9RO4lpE9y7bIaH6ByAsk=;
 b=LnfCZ3YXzjY5TKMMD6FWsPu+8sqeWHC51WTzstxT8c0768mdq7O9JS6IGs8DzIBhzI
 SneS6W9D73gTn2hYlQVzI2MfBFeiDqgUoRRdzRXQjeJAqysxCO56GN3BqWBgjv7OUqHY
 JDDyUSxLYPoqGPMGL/pQAb56KCNCopv68SY9ImpxwmrK0ajF3I9MUJEBgfc6cik/gba1
 H6AT+tUHpexN36lHJxAqqSRuRNTzfRzimgLzkBPiKsFgLMTlYqxhesnw6NR9k+SrROWc
 jV7Aob2B+Hchkar0Cx5dLNrU9Guo1QT9KG2E3HF9Rz4DDxyD4RE2za6b4YKAl0Ty+PE8
 8Epw==
X-Gm-Message-State: AOAM530qRok7bt1xaB7OBhxUAzRoHCIawqrFviqQxLLv5OSYr6RRvC6+
 U3hiZzacjdCbHYqWdj2t6YUZwX3/VEL8o1FHT+U=
X-Google-Smtp-Source: ABdhPJzjfl9/35Dd1Y6pTSPvYKRWPlcS4vGXRhWd4wl8umrpYsgOxNvTM75khAokdWpVrWt/zKSjReU7jM82xJC4svU=
X-Received: by 2002:a25:2e0d:: with SMTP id u13mr11652278ybu.247.1605526026684; 
 Mon, 16 Nov 2020 03:27:06 -0800 (PST)
MIME-Version: 1.0
References: <20201116043532.4032932-1-ndesaulniers@google.com>
 <20201116043532.4032932-3-ndesaulniers@google.com>
In-Reply-To: <20201116043532.4032932-3-ndesaulniers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Nov 2020 12:26:55 +0100
Message-ID: <CANiq72=1qmMYa9kejXqCDyjTU1RSgKc1VC-C4AdFFqQkwFVLog@mail.gmail.com>
Subject: Re: [PATCH 2/3] Revert "lib: Revert use of fallthrough pseudo-keyword
 in lib/"
To: Nick Desaulniers <ndesaulniers@google.com>
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
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 16, 2020 at 5:35 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> This reverts commit 6a9dc5fd6170 ("lib: Revert use of fallthrough
> pseudo-keyword in lib/")
>
> Now that we can build arch/powerpc/boot/ free of -Wimplicit-fallthrough,
> re-enable these fixes for lib/.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/236
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Looks fine on visual inspection:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
