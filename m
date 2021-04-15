Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D163603DA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 10:05:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLX384zwLz3bVB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 18:05:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=da54tceN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.90;
 helo=conssluserg-05.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=da54tceN; 
 dkim-atps=neutral
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLX2j1xnqz2yxW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 18:05:32 +1000 (AEST)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 13F8561f011958
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 17:05:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 13F8561f011958
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1618473906;
 bh=LC1wwORrxX4s+QOHO85pxZXBS/KtIoUE4bsRAFozad4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=da54tceNg+886hk0L1yXNqwic53kMAl/yYDA9rfAYHj0ARbrEgFju4bNK2u7DwSzr
 0Nzz3nN74NFBD6BY3vVYIsLJyVstisa/a9wZNFo5HTfFMQNiNdQt34xs/EogI5R2pe
 cGfTLcVB02siJoTnsZGY694SycVShDrvLKCT+fJH4c6gdApVr4yI8sDuiQRVb46uzf
 5zxp+cpLvrquwzMBoqWdhFppX0LrOMfnMp2ux+33w21NjgtbXApne1xnDYHSASKVVS
 d+1LtEJ5CKw8N5jVYem55TDcIAFV5Dpgqe/WelWt36GppnQoPbMUoN2vTaIcYxpiyl
 UETUaHqyqS3pw==
X-Nifty-SrcIP: [209.85.215.173]
Received: by mail-pg1-f173.google.com with SMTP id w10so16372765pgh.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 01:05:06 -0700 (PDT)
X-Gm-Message-State: AOAM533ZmyKhq0vT2CRvh0P6M+lZFvbI/uBobqhGS/IlxoLD99ehsfz9
 mxDohdOEN9HL6lFMIQNN4vF0Mizi0zYyn7Q69ic=
X-Google-Smtp-Source: ABdhPJySz/Ot0PzvuAqwezBmRSJBPOAtDPcVcBLTIDgzgzX8BI0wuMQUhTWcJdx8cpQqmQVarwqfYRNaT9Sfb7D43/8=
X-Received: by 2002:aa7:946b:0:b029:24c:57ea:99bf with SMTP id
 t11-20020aa7946b0000b029024c57ea99bfmr2063757pfq.63.1618473905663; Thu, 15
 Apr 2021 01:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210415072700.147125-1-masahiroy@kernel.org>
 <20210415072700.147125-2-masahiroy@kernel.org>
 <9d33ee98-9de3-2215-0c0b-cc856cec1b69@redhat.com>
In-Reply-To: <9d33ee98-9de3-2215-0c0b-cc856cec1b69@redhat.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 15 Apr 2021 17:04:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQupbmeEVR0njSciv0X9FD+MofeB2Xm=wprEdNaO4TQKQ@mail.gmail.com>
Message-ID: <CAK7LNAQupbmeEVR0njSciv0X9FD+MofeB2Xm=wprEdNaO4TQKQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] tools: do not include scripts/Kbuild.include
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: Song Liu <songliubraving@fb.com>, kvm@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, Paul Mackerras <paulus@samba.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, Janosch Frank <frankja@linux.ibm.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Harish <harish@linux.ibm.com>,
 Yonghong Song <yhs@fb.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 KP Singh <kpsingh@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Networking <netdev@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 15, 2021 at 4:40 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 15/04/21 09:27, Masahiro Yamada wrote:
> > Since commit d9f4ff50d2aa ("kbuild: spilt cc-option and friends to
> > scripts/Makefile.compiler"), some kselftests fail to build.
> >
> > The tools/ directory opted out Kbuild, and went in a different
> > direction. They copy any kind of files to the tools/ directory
> > in order to do whatever they want to do in their world.
> >
> > tools/build/Build.include mimics scripts/Kbuild.include, but some
> > tool Makefiles included the Kbuild one to import a feature that is
> > missing in tools/build/Build.include:
> >
> >   - Commit ec04aa3ae87b ("tools/thermal: tmon: use "-fstack-protector"
> >     only if supported") included scripts/Kbuild.include from
> >     tools/thermal/tmon/Makefile to import the cc-option macro.
> >
> >   - Commit c2390f16fc5b ("selftests: kvm: fix for compilers that do
> >     not support -no-pie") included scripts/Kbuild.include from
> >     tools/testing/selftests/kvm/Makefile to import the try-run macro.
> >
> >   - Commit 9cae4ace80ef ("selftests/bpf: do not ignore clang
> >     failures") included scripts/Kbuild.include from
> >     tools/testing/selftests/bpf/Makefile to import the .DELETE_ON_ERROR
> >     target.
> >
> >   - Commit 0695f8bca93e ("selftests/powerpc: Handle Makefile for
> >     unrecognized option") included scripts/Kbuild.include from
> >     tools/testing/selftests/powerpc/pmu/ebb/Makefile to import the
> >     try-run macro.
> >
> > Copy what they want there, and stop including scripts/Kbuild.include
> > from the tool Makefiles.
>
> I think it would make sense to add try-run, cc-option and
> .DELETE_ON_ERROR to tools/build/Build.include?


To be safe, I just copy-pasted what the makefiles need.
If someone wants to refactor the tool build system, that is fine,
but, to me, I do not see consistent rules or policy under tools/.

-- 
Best Regards
Masahiro Yamada
