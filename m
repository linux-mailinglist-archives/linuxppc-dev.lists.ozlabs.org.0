Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5393058CDF7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 20:48:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1lZl1Hq0z3bc9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 04:48:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rIwKG1dy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rIwKG1dy;
	dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1lZB0B9Dz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 04:47:44 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id d14so13888952lfl.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Aug 2022 11:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=spLx4BmS0ESQuFMLlfBbiEsVcFilYdm6jlWZCb/lP3E=;
        b=rIwKG1dyJQEyjuMi1QLgibUoOzQIG1Och0sDLUfq6AwqMRaKay8U1ROjw0BPOQfccD
         ypVPSWEgS6aO1jHxtVHzma4sMfFhmKGIgZNTM7IWPQNYoO4/hIjZB2MSbV2LD4ISmLEB
         2rJQgmWnWMHsqHk6bQn7cQZ6+BSlQmP9Y0iTz5lgBRmV6cZAQCeUKSfbtAejOW7C6nuj
         JBiVhW467pd3ToP3UI/g16Cw7hsMJZVfnWvys3vBRc+1Paf+Z5kHa1ZWZ7EYlby7eDtl
         yc03WR8YamDZ8u/kRiY26QQErFvgCf1qmea0t+hHyYMTfNjhwVvvFAYfkFS0YuCx6xOX
         4K7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=spLx4BmS0ESQuFMLlfBbiEsVcFilYdm6jlWZCb/lP3E=;
        b=kMM/G2AzJkB9NoKnzEhtoM4PWFx5DHOjsY1U+KUcY7dNVykUFSiUP5clRQRQ3Rm7t5
         zXi/qzH09Tv+PbE+BA/SRTlIzraFaJESHNBQPkziG0bgRFbKBrEaKCwC64V0xMGHbDgr
         xzVAGtaLarMQJX0rhGd1j9lkKrX2cZ3u5P5TvGmetJQw7L+lP/X73+nah6eViY5q6PL9
         DwUUNqQSqd5sbHltqydns9uy464o8YcVrTUg65BFY3KT1/ePnOGcuPDNDpN+UN9l4y9F
         86h4HOWsj4YslDNjdJW797mGBfaWg4Dq3E4iTExcOu5KW5tc8Mhw/VQOEJhOCQTKup8M
         T2UA==
X-Gm-Message-State: ACgBeo2mfTfgQGDrbLevnJ1TFXK7SetGNUGFtBcmc/GEJFSVFHVWGHQz
	azbjujdLwlpyURcFuEs6bMG2GqKoLNjuj08MovM68g==
X-Google-Smtp-Source: AA6agR7JGTS75eRLb3PpWY05edC4/z5G8WRhg3NMJzHeWfFvV+hZJIJ99SEIAlSxZ00vAdN1IrpEj4h4o4KGIuJ5bqw=
X-Received: by 2002:ac2:4f03:0:b0:48a:6061:bd8e with SMTP id
 k3-20020ac24f03000000b0048a6061bd8emr7629025lfr.647.1659984455809; Mon, 08
 Aug 2022 11:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652074503.git.christophe.leroy@csgroup.eu> <96f53c237316dab4b1b8c682685266faa92da816.1652074503.git.christophe.leroy@csgroup.eu>
In-Reply-To: <96f53c237316dab4b1b8c682685266faa92da816.1652074503.git.christophe.leroy@csgroup.eu>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 8 Aug 2022 11:47:24 -0700
Message-ID: <CAKwvOd=VBnx63Gj1vTH-8tR50Zd1r50x+NS8JRc4nXARaC2FcQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/25] powerpc/ftrace: Make __ftrace_make_{nop/call}()
 common to PPC32 and PPC64
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
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
Cc: nathan@kernel.org, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, omosnacek@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christ...that's not what I meant to send; sorry, mutt is giving me
bizarro errors today so I can't insert myself into threads using the
usual incantation I have in the past.  What I meant to send was:

Christophe,
Ondrej reported a regression with ftrace when building w/ clang
bisected to this commit. Can you PTAL?
https://github.com/ClangBuiltLinux/linux/issues/1682

Thanks,
~Nick
