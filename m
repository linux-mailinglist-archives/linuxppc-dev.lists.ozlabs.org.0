Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1126161865D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 18:45:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3B45662hz3cct
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 04:45:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=dod+VUiB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=dod+VUiB;
	dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3B380sNrz3cC0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 04:44:34 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id cg5so1671428qtb.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 10:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mA1Z7Cm83w+Vyx+oBgGwMaOfCfLAZylXYXAtJ1Raiz8=;
        b=dod+VUiBUEq1hk72lAssa/ES6lzBPt/3grGL93+x6xqazqzSesxF5gOoKjy5hsuBii
         dpyo6KG7QmoqhIT3bctyKBZuOrbntQ/3KSRaUa+QlclegAP50WUv80YibEtoQqHjPJB6
         Uu61/FFf2iArbTLONCqSdQPP9r8phlQw2FnrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mA1Z7Cm83w+Vyx+oBgGwMaOfCfLAZylXYXAtJ1Raiz8=;
        b=QL0QLfAiKp3nSoFfd12RnA3uSHKFe9+Z1mV3fetnGzKvjw3feCwL5718E1L8ebEqpG
         Mg6GD+mnn/sBprURzSfsXmjPdqDBlGOY9HMDIo3RNXiPhtlSdh08OFmNgjLkbdN6FyK5
         XfnyETazdewfyUFYlg588sWcSuKOXTLdyRlGnkmIU03xthWzfduOsTQ90PoFd1lhMFV0
         6ga2TeEnoTjLU2WdoPbk3WSBpgiinqTBvlJeytQD/lVZc5n7p0nlt/58SB4VfWixr1U/
         2QVyyYZKMeEcrgUqWKprI4ZxVb/RLzfIEArSu1sAJM/EExsGcCj3hJERFEenKmWiuecj
         8BBg==
X-Gm-Message-State: ACrzQf00o/ifDgU7LwFIFFKsaE0X/G2pUAKjZVUJOBsC+c4hMdUkElQ7
	7FZ0MXWWsv/VFHaow5Q1Rx44ZuzMygyM/w==
X-Google-Smtp-Source: AMsMyM43/9DoGN3LF3pANy4f5yr8r59HPPeh4mQ61KFLUX7yzFTh4SaSHNmdNh9/fF7Rgm3pBb+WBw==
X-Received: by 2002:ac8:7f48:0:b0:3a5:4234:8a18 with SMTP id g8-20020ac87f48000000b003a542348a18mr10408750qtk.340.1667497469329;
        Thu, 03 Nov 2022 10:44:29 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id j6-20020ac85f86000000b00397e97baa96sm942536qta.0.2022.11.03.10.44.28
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 10:44:28 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-36cbcda2157so22309177b3.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 10:44:28 -0700 (PDT)
X-Received: by 2002:a81:8241:0:b0:370:5fad:47f0 with SMTP id
 s62-20020a818241000000b003705fad47f0mr22362989ywf.441.1667497468069; Thu, 03
 Nov 2022 10:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <87o7tossaa.fsf@mpe.ellerman.id.au>
In-Reply-To: <87o7tossaa.fsf@mpe.ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 3 Nov 2022 10:44:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh87aGtg3eJPkA31V0Pn22hah0DWRc8oWsQ__5P2SXaTw@mail.gmail.com>
Message-ID: <CAHk-=wh87aGtg3eJPkA31V0Pn22hah0DWRc8oWsQ__5P2SXaTw@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-4 tag
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: schwab@linux-m68k.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 2, 2022 at 7:09 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
>  - Fix an endian thinko in the asm-generic compat_arg_u64() which led to syscall arguments
>    being swapped for some compat syscalls.

Am I mis-reading this, or did this bug (introduced in this merge
window by commit 43d5de2b67d7 "asm-generic: compat: Support BE for
long long args in 32-bit ABIs") break *every* architecture?

And people just didn't scream, because 32-bit code has just become so rare?

Or is it just because those compat macros are effectively not used
elsewhere, and x86 has its own versions? Looks like possibly mainly
RISC-V?

Side note: why is it doing

        #ifndef compat_arg_u64

at all? That macro is not actually defined anywhere else, so that
#ifdef seems to be just confused.

                 Linus
