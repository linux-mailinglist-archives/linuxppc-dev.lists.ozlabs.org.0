Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B632B5679
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 02:56:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZpvz0ympzDqPC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 12:56:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rtx/RU+s; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZpsf3rJ1zDqKW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 12:54:44 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id j31so14607952qtb.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 17:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NTtCzB5VIaFDrBNNNZ7NaHNKVBpJ8Hadb4R3oCLX97k=;
 b=rtx/RU+s+8cPVIrxRCrElV7tpyND3P0XAg2TofP4rT0WDB7pYRXWgCN0tPwwytBqzm
 dQiiSC8vlen4ulMHSLlnPMzExAzkL6dtKyTO1aF34lWSB54q67cx5AsGAA6vVYx4xTG3
 o1CCon4XTtNcfJkxdg4qxQeqx6YXpLey84hDTajAudYBngKt9IxD3lqQz7yaOv2iNRfE
 pF4ZQyQP+C+x7DWc/knwsv6HNK36wcCcVwLEs04rQ/30YGHjF1IPZ0zmchERdoem/XKA
 qqI8xfpGXe6HuxEj+ltWDXovggWLBZaST43NW4VJugRHzyUBOyYqGKSh2hKRmtr14HHt
 vGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NTtCzB5VIaFDrBNNNZ7NaHNKVBpJ8Hadb4R3oCLX97k=;
 b=H033dLmWRQzGXso74gB1DthWCZ8jERtmtEfCM/IWafYEfWHAqYEIWQtncoxCSj5aQ5
 ycNQ+zrxdy/u7faptKpVpxBssg5CIU30xutPElWt8AId5YpF/pdeC2lCxWZ7Qqz4fONv
 sSsLBq2tqra4Dsxw2kIXvB0yPCWjE5OkxqfKhb1HqiR6NdVL1QWfvPpb/qlHshXW5Rm2
 YWvL4TKQveXMw/KnHg7wwdq6wpYGsBiTR+NAZZ4Y4hs+Uhfgct7Z5wK0cZopVthBTolw
 oScIodbfTtKWSCrGA0/S+T9i19qx2kHhNYzhn0sZWrXDdTEFeZtsoebu9+DcOiMj2ShN
 AGZw==
X-Gm-Message-State: AOAM533RYon7121OThCu+1aQHQWairx927q8GSeVBd2h6K0qy3q3OnY4
 2byDKMOG3xcq9vx+r4xOOCQ=
X-Google-Smtp-Source: ABdhPJyuFuM/Nr8VHJEMu8p4WFcxiSTMgMKAz+9tvCAPF267qYflO/YfHmr2Gr/AgEALLCEUyJl0CA==
X-Received: by 2002:ac8:6b06:: with SMTP id w6mr17145176qts.6.1605578081016;
 Mon, 16 Nov 2020 17:54:41 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id f27sm3258802qtv.95.2020.11.16.17.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 17:54:39 -0800 (PST)
Date: Mon, 16 Nov 2020 18:54:38 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 1/2] kbuild: Hoist '--orphan-handling' into Kconfig
Message-ID: <20201117015438.GA299247@ubuntu-m3-large-x86>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <CAKwvOdnf5WKJrLnwM9dDDniP0eG5gnFSMB0rapqWLUAZbVJZvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnf5WKJrLnwM9dDDniP0eG5gnFSMB0rapqWLUAZbVJZvQ@mail.gmail.com>
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
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Arvind Sankar <nivedita@alum.mit.edu>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 16, 2020 at 05:41:58PM -0800, Nick Desaulniers wrote:
> On Fri, Nov 13, 2020 at 11:56 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > Currently, '--orphan-handling=warn' is spread out across four different
> > architectures in their respective Makefiles, which makes it a little
> > unruly to deal with in case it needs to be disabled for a specific
> > linker version (in this case, ld.lld 10.0.1).
> 
> Hi Nathan,
> This patch fails to apply for me via b4 on next-20201116 due to a
> conflict in arch/Kconfig:1028. Would you mind sending a rebased V2?

Hi Nick,

This series is intended to go into v5.10 so rebasing it against -next
defeats that; please test it against v5.10-rc4, where it still applies
cleanly. The conflicts will be handled by other entities (Stephen Rothwell
and Linus).

If you want to test it against -next, 'git am -3' will allow you to
easily handle the conflict.

Cheers,
Nathan
