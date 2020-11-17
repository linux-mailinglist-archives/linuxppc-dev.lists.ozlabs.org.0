Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD892B565F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 02:44:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZpf40VnzzDqKW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 12:44:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=XZGU9wBk; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZpb82tjDzDqNg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 12:42:11 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id c20so15932400pfr.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 17:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E3Yj6MxC5crUK7IuES9DqL9WoDqZYYvodYdqIPte+C0=;
 b=XZGU9wBkaMlMXvLU1MUoF7I1s4G2CQxhNwgG7VdLHlH4m7vZboHFrmZeVgwGPNUCSi
 bap6mH6ogJ/m8tlDUZbm0PSwUSkFcS8j8wfglOvae2DotC+LT8Bp7mx4S5wiVopmN5jZ
 SRs7Hf8X/Y0dAVfVkeaHF/FZioUMpBBZHRPoV5Q8N1lnN4J7swehJq+k1RIupqO56yx7
 pzpbJI3v9q8IN6rRvsWTTpFcv7wnrpsmJPTFNnPuouGSquf882aTmYuAO6nnQk7wnEUF
 2go/unpaJDnT1xibRqEQqfmWcpfclJPOPgoA7oSIFiTVDdr5rFI3d7Q3jE51j9xbLcU7
 HTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E3Yj6MxC5crUK7IuES9DqL9WoDqZYYvodYdqIPte+C0=;
 b=Z+MOw3efkVWOGa1K1cMjscmld8yQbeKRz1mISHzKoGDCinf5KhQbX3BljVHKz1K83x
 M/R4p1zwk3/awMyzYOO5ibkpmXvwbT+txbAZPqWsWx07izncc7UXlNq6pwv/rYsdj7iC
 o8p4mTLOVhu6Nw0y3TRISGJmLdVHHwaOzf9bVYfjjafV32kcS/VOhZhRbhMUgJnig/vf
 DycuKW3I0FFvUHqOg1saaLb5jHX+GPCrKLnFJtmeZFwG3Yob60x5IcH4YRpypMn07y++
 BW36BUvioY4Gyg+/wT5RoFaDSU2VAiLSaA1R5SkIlMHJSVjtMMjzdp7+ZrpoQr6KKRc2
 rowA==
X-Gm-Message-State: AOAM531Vs60czRJlWApGt5rJnt/F+SKe4uVAH9+/1ly+/Zvrkm71HmpG
 vmbAEYGAsJjueulO/QdHwtiP9nBM/mje6MDrF7mQFw==
X-Google-Smtp-Source: ABdhPJwNHpOk0+HRm1uU6Mqd2ce6rC9mlHOhKfPpWrAuZPmqw8IqSxCNfIY/p1NZ/9P4yrKoL2Yb00iZN311n6OaSzM=
X-Received: by 2002:a17:90a:6b04:: with SMTP id
 v4mr1945507pjj.101.1605577329449; 
 Mon, 16 Nov 2020 17:42:09 -0800 (PST)
MIME-Version: 1.0
References: <20201113195553.1487659-1-natechancellor@gmail.com>
In-Reply-To: <20201113195553.1487659-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 16 Nov 2020 17:41:58 -0800
Message-ID: <CAKwvOdnf5WKJrLnwM9dDDniP0eG5gnFSMB0rapqWLUAZbVJZvQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: Hoist '--orphan-handling' into Kconfig
To: Nathan Chancellor <natechancellor@gmail.com>
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

On Fri, Nov 13, 2020 at 11:56 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Currently, '--orphan-handling=warn' is spread out across four different
> architectures in their respective Makefiles, which makes it a little
> unruly to deal with in case it needs to be disabled for a specific
> linker version (in this case, ld.lld 10.0.1).

Hi Nathan,
This patch fails to apply for me via b4 on next-20201116 due to a
conflict in arch/Kconfig:1028. Would you mind sending a rebased V2?
-- 
Thanks,
~Nick Desaulniers
