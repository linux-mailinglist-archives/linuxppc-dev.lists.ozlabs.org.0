Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7A745EF81
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 15:00:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0xG73G5Yz3cRG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 01:00:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0xFh4R9Cz2yR8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 00:59:51 +1100 (AEDT)
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mkn8B-1mCYzl2LtP-00mMvr for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov
 2021 14:59:46 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so10831041wme.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 05:59:45 -0800 (PST)
X-Gm-Message-State: AOAM533hNsvxAhAA1aogxyVhS92bXidhNiwBK/RFIWNIEbXeo2BiKt6x
 lPUobI8oNl4O3h5q+jXmuYEya5//SDdeQ/O/Mbk=
X-Google-Smtp-Source: ABdhPJwLo2gvIaV7a7BIVtCOjM0MfS2JQcBHF9YHLbK8BZai46KYcznJM7hhcadb89FUv1DDYSJlNeq22biIjPHaGvA=
X-Received: by 2002:a05:600c:6d2:: with SMTP id
 b18mr15934623wmn.98.1637935185632; 
 Fri, 26 Nov 2021 05:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20211125154406.470082-1-anders.roxell@linaro.org>
 <6b1e51a8-2f4d-2024-df90-a35c926d7a30@csgroup.eu>
In-Reply-To: <6b1e51a8-2f4d-2024-df90-a35c926d7a30@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 26 Nov 2021 14:59:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0n_n+PnfYmAdS9923yheLqYXRp8=65hKf9abLCRAX8ig@mail.gmail.com>
Message-ID: <CAK8P3a0n_n+PnfYmAdS9923yheLqYXRp8=65hKf9abLCRAX8ig@mail.gmail.com>
Subject: Re: [PATCH] powerpc: mm: radix_tlb: rearrange the if-else block
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:d9x59jnr+9YoG0cc7lhKY70r1PDhYWi+y1cBgTflaDkJLrM0fFG
 JgQjmmlBjAZ4/rzuwLbQdmRlNMaaQpBigLIMDqIhSo4F7SkGQ6uRTCPWeeXuFDxjGsNRmWx
 EM7ZGbIoQjVqOteACfyFzwI8A6F5oSf2YG7IrREox9ClyMrxiCO8Nhsd32QYsV+RJrs4TD9
 GjmeRljITPZLokxszielw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qVJ+Ijuzkxs=:nu+ZUGtKcZNSdNhe5mOYoT
 f1Z9x9Ux++ORnm3SKzvDtcHfwwgHbuARzebDNeyvhMjcOb8cCrspH1qZZ1mjG/1sczI9GoaEI
 PWvqfKcYoCajl8o8QP8D2pZ2Y3nmjvFTipJMBp5JbGUmZ1Jc7hGgD8xgskcWbVUj+xG317enD
 xtxDU7LwcGrkW1GQBbanQ6gWPseNC9+1dXsi4oE+qzUFq0pQ/iMrmcP76ZU17Z436nIO9voVy
 ZDrQxO9o1/7daO5ZaxZb+6mv4+d5YQ8PHiy+AykPnLP7UuGHWNAUJd0nR6U7uU8O7g2TbCXU8
 TjRdDM/USVJUw4YTNNNmaTpzIM8bBadMDbhsLuzPg2UNrF/bDyM2N7KMJWtD3JQP1go1sauf0
 WnbujaIRjIO3vFZGvuiyjPtukMenJMVi5W6s2v0PexOKs3/Gv4AI9EjPkHVD8pHkMFrQoafg0
 mUlx4RosY4xF5OhdylWujPR/4nZhfODglPV9GitEes9Zxmy72HGGdMsggzEhdOVfQTtyoY6SM
 Qc7YvNj5vOZNV0idBiJwuH8QlGKH33R8pxmmvuC6eNflfM8OuN6RSal158quTDMoHWm7puEDM
 RSs5S+0JoNPUKuYs/hNxuPbeZCqUvy/LVxxNyuvViMHiVbC24DwaVlmU1VhUDeOT8PSg9ylRn
 nclnGl1nJtsQQO9KV3nMK330omb1F9kSaxYN9WXADypBTPp7p9nn97L1rqENdyxt8HpsT9haP
 lPdOoAzh9F1nWGhLnmDG41dREfghfFv7qfYj5nBXW8Sqc0oQ6Nj2mnxGfLMVjPmOuXVXGojF+
 1GAqr1ViBclTvvOaJKH7jHcWRW/SzSN5KUOV9q2nfGsv3TDevw=
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
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 26, 2021 at 2:43 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 25/11/2021 =C3=A0 16:44, Anders Roxell a =C3=A9crit :
> Can't you fix CLANG instead :) ?
>
> Or just add an else to the IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) that
> sets hstart and hend to 0 ?

That doesn't sound any less risky than duplicating the code, it can lead to
incorrect changes just as easily if a patch ends up actually flushing at th=
e
wrong address, and the compiler fails to complain because of the bogus
initialization.

> Or just put hstart and hend calculation outside the IS_ENABLED() ? After
> all GCC should drop the calculation when not used.

I like this one. I'm still unsure how clang can get so confused about wheth=
er
the variables are initialized or not, usually it handles this much better t=
han
gcc. My best guess is that one of the memory clobbers makes it conclude
that 'hflush' can be true when it gets written to by an inline asm.

        Arnd
