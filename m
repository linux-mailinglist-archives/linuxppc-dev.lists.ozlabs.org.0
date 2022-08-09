Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 559BF58DCD8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 19:10:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2KMx0mtMz3c4Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 03:10:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KlWeX2Pq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KlWeX2Pq;
	dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2KMJ5tc7z2ywN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 03:10:20 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id bq11so17889541lfb.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Aug 2022 10:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A9YjzO6pf9jUuipiXd320RsVb+qwVho6k/x9nJJSSr8=;
        b=KlWeX2Pqpmmm0Ttm2l2VCcsfY9ZqUVUh1HiPtrtKusMk8sThEghUmgtTErO6cmHfhF
         O70vD96WTLu4znZoxpKzyO7W4KuvBTM0m6eplMh+nMa49J3GUDlWGV7c+yqacRJc39BH
         Z1LPxVZ/wStTSQ6Ly8qjU00dqlHykxeK8OPVH81321pmphmBE3GSBVJFizApe7+4lB2B
         30q7fKtl3vo0vbDOS0GIFIFL26aEmZyurQZJpm6k4SxA9pDwearrewCw6FHRSBPinluD
         W49YWwDEt9FNyO8CfukSCOgOBLWvNAsVh8gby9IM8A7Y/a7xz4LxpEJJjtZ6v7o2rvUN
         GM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A9YjzO6pf9jUuipiXd320RsVb+qwVho6k/x9nJJSSr8=;
        b=RHb9yPJVp3KhPotlK6wEm7c3lbj73PbHyGo4TrK3S6zO5pRk6imxyb+Ie8ANUXYQKt
         RI8S7a5e08vr84mkYRbiNXA41SmErF6p51vm1Ssrhzovle31wZGuJyRnzgIakTtc9V2Y
         wTrU4Nw9PACypRVOP18ZuDiwGO4aicr+aRX1t+bbyHAjejhGYUgZjnmNZlOlrnzCeteX
         PLDXZ3PkYnobx4T6OInfKuNpLBSt3k0G2r/uEBlwJ55SwkZ0larm09Zu0ChjzO8lze4q
         U7JKJh3O12qpxSm0GK2peGtnfIvn+tDUMXT26C2M7UW1Wa0kMNsPVMx/nz1xrvY8w7GE
         i4Xg==
X-Gm-Message-State: ACgBeo2/Vl2225Hr0mySA5PaLSxv8isrRvsR2zkM7pLp6q0UDYGH/wpD
	wHzjCkL2Odw30RBlaJG5Hw3Mh/GxxmF1gxd9QszTaQ==
X-Google-Smtp-Source: AA6agR6BEEKvSMl+Ivvhp+4oYj2Oi9CGwNxaApycDinRhh+MWc3sKk/e+l5U7pLBntE5A/gb5KQYmxwqP2blZ90KuAA=
X-Received: by 2002:a05:6512:1317:b0:48c:ed42:5cf4 with SMTP id
 x23-20020a056512131700b0048ced425cf4mr3117389lfu.103.1660065013239; Tue, 09
 Aug 2022 10:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220809095907.418764-1-naveen.n.rao@linux.vnet.ibm.com> <CAAUqJDsAWRedULdKx3rEK7jL4=gHfJebCT4ujzWq4vSXZbju3w@mail.gmail.com>
In-Reply-To: <CAAUqJDsAWRedULdKx3rEK7jL4=gHfJebCT4ujzWq4vSXZbju3w@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 9 Aug 2022 10:10:01 -0700
Message-ID: <CAKwvOdkexR9fc3=Dv+D5roJTBjkk6SpgoVd1xZNuuGUh2fUOvA@mail.gmail.com>
Subject: Re: [PATCH] powerpc64/ftrace: Fix ftrace for clang builds
To: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
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
Cc: llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 9, 2022 at 9:59 AM Ondrej Mosn=C3=A1=C4=8Dek <omosnacek@gmail.c=
om> wrote:
>
> On Tue, Aug 9, 2022 at 11:59 AM Naveen N. Rao
> <naveen.n.rao@linux.vnet.ibm.com> wrote:
> > Clang doesn't support -mprofile-kernel ABI, so guard the checks against
> > CONFIG_DYNAMIC_FTRACE_WITH_REGS, rather than the elf ABI version.
> >
> > Fixes: 23b44fc248f420 ("powerpc/ftrace: Make __ftrace_make_{nop/call}()=
 common to PPC32 and PPC64")
> > Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> > Reported-by: Ondrej Mosnacek <omosnacek@gmail.com>
> > Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/kernel/trace/ftrace.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>
> With this patch my reproducer [1] is passing, thanks!
>
> Tested-by: Ondrej Mosnacek <omosnacek@gmail.com>
>
> [1] https://github.com/ClangBuiltLinux/linux/issues/1682#issue-1330483247

Thanks for the report and fixup. I filed
https://github.com/llvm/llvm-project/issues/57031
as a feature request for -mprofile-kernel in clang.  If there are
other missing features for this target, let's get bugs filed for them.

Acked-by: Nick Desaulniers <ndesaulniers@google.com>
Link: https://github.com/llvm/llvm-project/issues/57031
Link: https://github.com/ClangBuiltLinux/linux/issues/1682

MPE: can you please ensure the above two links get added if/when applying?
--=20
Thanks,
~Nick Desaulniers
