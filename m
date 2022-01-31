Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A924A523E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 23:20:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnjDj2Nryz3cFh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 09:20:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnjDD0kTPz2ynt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 09:19:54 +1100 (AEDT)
Received: from mail-ot1-f46.google.com ([209.85.210.46]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MGQWr-1n0dLP1D4P-00GtvS for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan
 2022 23:19:50 +0100
Received: by mail-ot1-f46.google.com with SMTP id
 x52-20020a05683040b400b0059ea92202daso14428658ott.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 14:19:49 -0800 (PST)
X-Gm-Message-State: AOAM532yzgBDb5fRXWKFNSDhc6EegNzFSDyGY/xe0VqGeth0+Am+b1k2
 I88ZSaPlnVaSFVNEd3relMvx3ZYVREqqyGX97YU=
X-Google-Smtp-Source: ABdhPJzNvIQa/ifQ4mpIl/LfU521F5G6KLcdIXkWgKV/jA7MRG2n/k6e84fLlMfFqeGk7bXCvjxkFnVtwxdt/dBnQNc=
X-Received: by 2002:a9d:654f:: with SMTP id q15mr12902241otl.119.1643667588784; 
 Mon, 31 Jan 2022 14:19:48 -0800 (PST)
MIME-Version: 1.0
References: <20220131064933.3780271-1-hch@lst.de>
In-Reply-To: <20220131064933.3780271-1-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 31 Jan 2022 23:19:32 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1YzdC1ev0FP-Pe0YyjsY+H3dNWErPGtB=zfcs3kVmkyw@mail.gmail.com>
Message-ID: <CAK8P3a1YzdC1ev0FP-Pe0YyjsY+H3dNWErPGtB=zfcs3kVmkyw@mail.gmail.com>
Subject: Re: consolidate the compat fcntl definitions v2
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:OIJjmu5cdAAhRyPMAdMsNp5NW/3yqL2fv38wd+VoPdtznPqkhOP
 K0ZE4eLRYobJjwboUXhl9nrG3bCAC5OmL1SFBFmM6nt2uUOLKZxZOZxasQxDksyh6jsJ7lU
 TUkbaRsfMQIu5faOklmSjqZMfTXhVaUBW3+4Syrl3Ytgu3fhohq4uFsDDQQlniA5RHGx/xL
 +kGXIYVVXzzw3Uym6oxAw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aNRDaWFKBR8=:deYNy9ZQAyqbnnRXnyl6pl
 5mZRk7utEIlXRV8Obk9P4QCwXbDpvViT4cIYVEmDNLFoD+cH33t8ajl2KXOYJ/tVVbmnKq1kR
 xJ91ucwRYRTp2uXkGTTsyB2tWkuzciL51mg+OvqpwkW3+/X4xvEdCQ7lNkKvjYjbVtZwPjnBU
 wy8k8Np/SmT+Ap5pC0l6KzeM53C5SzPbuC3XXkgrxYEu9l4BsrzhPBKN2wx0CJ61a4YdAbwHv
 8vMi83JirOG3XIO2oSojNGVHDEpmO2rmois+iCxA5WYaAf0feiUJhkTDjdSHtsHfzuNJU5ilL
 IEvjDlBenzdRKwclCG2gtpXtKD85ONDRNfaIZWCQTariaBdY7gWgvlTcYsCRbXIRAPns2mtJ/
 JkA/JLOjakELzXxPNLNanymTF/e98Q3bj9cEX5UYVyOorShrk3pWSAyqQpaGph8ywUz4QPFdT
 /aBx1lu2OOpp5a7dD9TRq9kpn9y0DyEDu0hFA0LY6eVmbFNSwXiRs20HQyHvvBnMUM5zDt0bH
 W68OxdGgp4pdxD4tJdlqEBFsGep9/xPNkw3DJVWyAnnozZa6NqZrtgFAY9Zfty7fOLJqYKlPh
 YJIy4ui81FqA9MZn1e3Ptsa9XmNMHxcM51JNr6LvKlNRdYjqSbZVMxVpeUudKL3Ow0nqLnft0
 21VhiPpQf1Cf1QxOUutPMF+QtSS6ME8dG9cUBo76Am1wdZk/nek00Hy4cE6wGb3o6zR4=
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 31, 2022 at 7:49 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi all,
>
> currenty the compat fcnt definitions are duplicate for all compat
> architectures, and the native fcntl64 definitions aren't even usable
> from userspace due to a bogus CONFIG_64BIT ifdef.  This series tries
> to sort out all that.
>
> Changes since v1:
>  - only make the F*64 defines uapi visible for 32-bit architectures

Looks all good to me,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

I think it would be best to merge this through the risc-v tree along
with the coming compat support
that depends on it. Alternatively, I can put it into my asm-generic
tree for 5.18.

         Arnd
