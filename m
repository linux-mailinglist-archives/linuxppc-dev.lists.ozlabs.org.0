Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 342EE3B9278
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:48:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GG00x0jMGz3by2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 23:48:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GG00W4pldz2xjX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 23:48:10 +1000 (AEST)
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MHVWT-1m37um2rA1-00DZM0 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jul
 2021 15:48:05 +0200
Received: by mail-wr1-f43.google.com with SMTP id i8so8406438wrc.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jul 2021 06:48:05 -0700 (PDT)
X-Gm-Message-State: AOAM532SCmDt8lHYePIHZrjxek0usiGK4X0lsi4rytKYapcdKFPSnKEk
 l/G5jK6hhdTRHnkoa6t3jfR3TBvrYroXespcP5Q=
X-Google-Smtp-Source: ABdhPJzw3b2b6fsuurCJEeRsDZyU1MbYpbtSwPK/S0lgAFQS5IXx8aFUcX77Mwd+CzPYFTD4zgr5CUIjZ6Kjx7vWSlc=
X-Received: by 2002:adf:ee10:: with SMTP id y16mr8597924wrn.99.1625147284809; 
 Thu, 01 Jul 2021 06:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210701125046.43018-1-wangborong@cdjrlc.com>
 <f72d43b9-88a1-19f0-c6ca-87fd7a01f379@csgroup.eu>
In-Reply-To: <f72d43b9-88a1-19f0-c6ca-87fd7a01f379@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 1 Jul 2021 15:47:48 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2LA_MzP=mZ7_QODx5c7qq-r5t-5pZCiThjD_jX_KPXPA@mail.gmail.com>
Message-ID: <CAK8P3a2LA_MzP=mZ7_QODx5c7qq-r5t-5pZCiThjD_jX_KPXPA@mail.gmail.com>
Subject: Re: [PATCH] sched: Use WARN_ON
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+FJDC3uNpgnc8B4k2jhQmi14swdEu09A/1vivplVjsNRSbwJiBq
 oBpOaQpjJ0OCJpi1d1slCfn+g+Nm5SWYn+7ntwO3zndy57QW4NHjFdLTQ1TxjVDpHOmFIgm
 rZgT7fVLm51oPSGxFxlbpf3k2mWFJvZJtz1PQgvpcUeBVOUOUACOyCbJxlIR0v9wE3Sn+md
 pl2g6Eq3FqJdjq2pGxijQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:roe5Yt7j2Lw=:E8uB/oAeB8+9j8o6jM9u3p
 RoJEBfP+c4uxp9WjY1mP8seA+ewUtNuTSjKii6BIT6xG1jf4XqvZfiCzm3Wxer2bED0MYGYRe
 /46mzjbjnemFQcVAhbeMYCtK0IY/SxGd3hx4Iyy1NbpignrTsC3+VABGHpRij06HI6WXVnoT1
 1dTxhkZwE87wtHt4viV+o65CJlUI2pWhpr05QVWAXWMJp97dYqoSGnm5GHYIC5f3ssL6vZG1w
 fVhu69smAwUdq/KT5PsW85lqtAz3t1aBcgJ/2OzhSXPkmBgJuzKvjPzKjlvE1HVhQjcvTSIez
 7R1lqS67rL8TvGaqaKFtyk9w8g6fKH9fTSjp0CcLr7yDsibYvzhzJsPP+dPgzulLR3wHwfxVk
 0PhhAu0ktSamxc0LFYYvkpDc8BV5K16RqdWaPxGZr/JB4vYwBqMQhtWWIi0aj3VLWYc2ks+aF
 cglKMYrL4PHfX0IXBPDVbEdtrkad/EnTZw94iMb3kv4jkA498w11C6czL8i7NvoEHostnoVu1
 +MctCR0b88JONYKYT5/lxT7zdPJTp+8bSeLPe/mF5zCP6U6eJ4IBPLORdAxefc+47PgSO2BaJ
 hyIpfJmhUOYVy/y7Lv797w+FbFfdbLoH6PWSS2hNxCguBRWJpPAQeFITN73hGo/Agz2Nb7SBx
 I8MmISM7baW0mKQYbh5Vzo4fUkNbiEMe7P9wiLNZT1JDhKYq4k6JuRIWBjLIZriKx+2phAGef
 4RyRUitt6kO9Ub+Kn673EuQCRZTp7SGUnM9WmNdfKTf0tojKkaBvtcH+uxdyXe9sXd+7gIii9
 ySYjJLDH+IG8nYwfEDKeMHhQGLsa/HxxCJ17p4BAqg7S9J9jpgRwSH/ojl9M9BFvt3tU4jY
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Jason Wang <wangborong@cdjrlc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 1, 2021 at 2:57 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 01/07/2021 =C3=A0 14:50, Jason Wang a =C3=A9crit :
> > The BUG_ON macro simplifies the if condition followed by BUG, but it
> > will lead to the kernel crashing. Therefore, we can try using WARN_ON
> > instead of if condition followed by BUG.
>
> But are you sure it is ok to continue if spu_acquire(ctx) returned false =
?
> Shouldn't there be at least for fallback handling ?
>
> Something like:
>
>         if (WARN_ON(spu_acquire(ctx)))
>                 return;

I think you get a crash in either case:

- with the existing BUG_ON() there is an immediate backtrace and it stops t=
here
- with WARN_ON() and continuing, you operate on a context that is not
  valid
- with the 'return', you get an endless loop, as it keeps calling
spusched_tick()
  without sleeping.

Out of those options, the existing BUG_ON() seems best.

       Arnd
