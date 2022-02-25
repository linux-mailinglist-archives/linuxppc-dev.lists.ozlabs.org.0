Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D914C402F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 09:34:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4jkQ3SWSz3bVx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 19:34:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.24; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4jjw6XLmz3bP9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 19:34:10 +1100 (AEDT)
Received: from mail-wm1-f52.google.com ([209.85.128.52]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MUokB-1noIEJ0ZO5-00QmUr for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb
 2022 09:34:06 +0100
Received: by mail-wm1-f52.google.com with SMTP id i20so1196174wmc.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 00:34:05 -0800 (PST)
X-Gm-Message-State: AOAM533RrMABHK4214rs0DthCLEg/VUjh7MnsQJFw4/s3CriRjnS6sgo
 8B5TFktnF7+TPzbCi5S6jqYl4kHZry4TsqvMzMk=
X-Google-Smtp-Source: ABdhPJxlT0ZeeZN0sp/wnlDP9vqKjX5249QxVFT0x3B4UnYiAZsJdwfn3z3PfGHyveoi2R5x9P4PLXraCF/IwsdQHuA=
X-Received: by 2002:a05:600c:4ecb:b0:37c:9125:ac03 with SMTP id
 g11-20020a05600c4ecb00b0037c9125ac03mr1654188wmq.98.1645778045094; Fri, 25
 Feb 2022 00:34:05 -0800 (PST)
MIME-Version: 1.0
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
 <20220223135820.2252470-2-anders.roxell@linaro.org>
 <1645670923.t0z533n7uu.astroid@bobo.none>
 <1645678884.dsm10mudmp.astroid@bobo.none>
 <20220224171207.GM614@gate.crashing.org>
 <1645748601.idp48wexp9.astroid@bobo.none>
In-Reply-To: <1645748601.idp48wexp9.astroid@bobo.none>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 25 Feb 2022 09:33:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0feJOsKMNP0zCdPho5XdD+NXFceUTTe1X6dA9OdWQntQ@mail.gmail.com>
Message-ID: <CAK8P3a0feJOsKMNP0zCdPho5XdD+NXFceUTTe1X6dA9OdWQntQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] powerpc: fix build errors
To: Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Ocy95cVhnodtpR+oyad7cb3K4alCIZcR3cqUKFdEROS0ggaVn0k
 Ec+KSmxmh5gGQhu9/0CoDW/K6FdcrEpmlA7yFOgMTxYmmqF7dRSvwn14P9kVtR58KbFwS2w
 KknyX3M318jF4TtqFCEA38oI4vHYTzgMvyBKOIZR5eni2sdoJDn5vR7JNOHBvMlGm2etM0D
 wZ4XiExxs6WrRJZxw/CaA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FMxO9a3EPeo=:NrLRuobFCbTYaI5hV963yB
 g2hvQg8o3Z23eLiMUe3dZruo/QNSY5+vYkRrpc+JvMwoxuCEGPbMevS7BuyduWBEumn3nbHeW
 rnHs7wmFeR1gySU7iqp/xp+84PdtIvb+z7V9IZKuM5SOcIT3FT/dKg8/KrzRQlWlTnw4Ybe2t
 83XQWSpjMhU1sCI0u0Fr43kxOTnyziCIzqRQMnFTDY3/lGguegSeaTj9eXktdzh3V+ovLIAs1
 KJhaYATB79Ys3XimoxoqzJ4GZb0Tiw0x6AK/ubFP2WOnDBuefJA+7ga/FIdDiMarhg4N2D1Cj
 D/oCh6RrSTX0f+9e/Hg25L/6eDYRIcfbTm5m8jtLVz7akeyOkzJXjtw8MG7UmA1T8KxRXPI3s
 n24RoZ2uusLKisw//3cINTO7V6SZ3/o5J7X5ZUGKd0iDprQ581UO+p8l6f6S9tYGVr+Ki4GlE
 yeTxSSfFciKi4+Iqy2dFQ9AaC/qp6lK6LJvFdHyOLyfhvoVfKjJhJQymvHMLuMxuzR/kz2sga
 g5IKgz1JUq8cR+mp66F7lOcBLXbaFdQ5UMInO8/ggKj6MK+vKYGgF236SUZQC7AmAQA8kbIxd
 XOYnUChx98h8AcsnK+NFCMrq1DhXD+i/TmuLU5X2Xvo9jUrCJrlPMp2WYBbYN0tBe4vm1icba
 MR+m3AA42jHMtnMgi0sRylujBdhjHi06cP0x2fmkbVqQfLsa9FoPQSVcUwWi4KO/tiQg=
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "# 3.4.x" <stable@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 25, 2022 at 1:32 AM Nicholas Piggin <npiggin@gmail.com> wrote:
> Excerpts from Segher Boessenkool's message of February 25, 2022 3:12 am:
> >> +#ifdef CONFIG_CC_IS_GCC
> >> +#if (GCC_VERSION >= 100000)
> >> +#if (CONFIG_AS_VERSION == 23800)
> >> +asm(".machine any");
> >> +#endif
> >> +#endif
> >> +#endif
> >> +#endif /* __ASSEMBLY__ */
> >
> > Abusing toplevel asm like this is broken and you *will* end up with
> > unhappiness all around.
>
> It actually unbreaks things and reduces my unhappiness. It's only done
> for broken compiler versions and only where as does not have the
> workaround for the breakage.

It doesn't work with clang, which always passes explicit .machine
statements around each inline asm, and it's also fundamentally
incompatible with LTO builds. Generally speaking, you can't expect
a top-level asm statement to have any effect inside of another
function.

        Arnd
