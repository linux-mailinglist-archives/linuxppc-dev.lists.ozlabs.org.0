Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9D413210B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 09:11:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sQ795LCPzDqK6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 19:11:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sQ4p3G2pzDqJH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 19:08:57 +1100 (AEDT)
Received: from mail-qt1-f182.google.com ([209.85.160.182]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N3suW-1joVWM45Sa-00zmbk for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan
 2020 09:08:51 +0100
Received: by mail-qt1-f182.google.com with SMTP id k40so44646367qtk.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2020 00:08:49 -0800 (PST)
X-Gm-Message-State: APjAAAWIbUfdfYLH5qVwEFib+/isPaSgIVCk0falLJgB/ZnI72PylZQh
 d4xgRIeKOhzJLb4YLGFgExEipFwmcqtMP7wK+Vc=
X-Google-Smtp-Source: APXvYqwKEIiKCB0yEFWoleSSKNKnD8FxkV92VMH6CsqWOD/uB6nKGXweURlmBCLGX81V2orjzTiBfhUxphLe4QjQbqc=
X-Received: by 2002:ac8:709a:: with SMTP id y26mr78377768qto.304.1578384528657; 
 Tue, 07 Jan 2020 00:08:48 -0800 (PST)
MIME-Version: 1.0
References: <20200102145552.1853992-1-arnd@arndb.de>
 <20200102145552.1853992-3-arnd@arndb.de>
 <87woa410nx.fsf@mpe.ellerman.id.au>
In-Reply-To: <87woa410nx.fsf@mpe.ellerman.id.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jan 2020 09:08:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a17GshP1KmCpvCkWGDGJLC_JrGUFQZTLbfe5+sSwTjyxw@mail.gmail.com>
Message-ID: <CAK8P3a17GshP1KmCpvCkWGDGJLC_JrGUFQZTLbfe5+sSwTjyxw@mail.gmail.com>
Subject: Re: [PATCH v3 02/22] compat: provide compat_ptr() on all architectures
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:GmUsmxJ9DIL1H+mxDhhxXQ1Yxcm61AklCBd7VZxPTeUkSS4wKps
 uZI0bDoK18amNXiS2b3Gi/PYBZGWVAavQSVAfXIkq9sL2xehkTCiRZtNfY57ynfByRJykvq
 UbUYiyac/u0ie+7yP7VsDn4xzyw5TcLXX/lZbuOoMXBSBiX5zmzacDIorzF0dty0pZoviqD
 jfO/F2WF4KvduuP7m87ww==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:k6l0Axt4aJw=:uhdp+/n5ibchryxnNG8gqL
 fLaHJ4GuGzf2f1Q0mYsH8z4MpWaJ3mVKxp84q/mUMsbyJII596LUrqpSMk31G1Pb7qtclL32K
 GCjF0hOvcqAZgBqoKQUPykMfc9zHsHXQ5oJKfFcJr3kAK5YoWangz3YpHNHcBWS0KgUnMAdDP
 YGyzATNgLygRIL6galw/AiMOw+PgBZqgVyLapShVgF5FkyurhmtdEwAGHf7ZIrtXDRpfpWSjF
 zlKe+sbjjrQ+HEGSd/AIiaPscza90EpgA9SuHi9XEF1gJtx7A5QDnETDEdrukkFDRDLNKu823
 fbOZ7uw1s5hj9MBzMJfBx4aA0jzltQji8GAFjeZn4V+Z5O/qVU5ykUxgnmKDpyYK41lvlrYmG
 gD0YBMLgOWV39p9v12/vMt5pjNdKA8amskgZKVCWYBF8+JPxVf5m/4esGHaf6/xlrqFfw3vok
 +2Dyt4NpkJZcb+brVE43Fm1gkH7AtgKABsUWW0WN4XkWOIlTQmBelFzPcrbkUDYjVbC39/xFZ
 r1UBGhX0McqOjC72SXc47pz1oIq+g/IyQubpoPhenQSN0MEJyQJb74q/uzzBZho7jV1cedVXm
 azLKPOgH5pwEVNexluD0+GViaxLKcwGUeF3AYOiW5vrbR9jB0IeiajI49Ui/qF7mkYeWiySry
 SYF4tOunhVDWGwZhO3/PkQeGOVC+7mT1g37Ro88I3IyvcXv+xOWmjruh1LSsMmgv/FEN5iKzu
 7i/gD4hKaHr4CFmZa1BFlsGGKMdrYrnBU1z6cQapsTZOdcvdugw3oK0ZWtG5dunRu93IG3com
 ElB5ZQY5ie5K6bDoV06YUaqNZe1NRvdVBK1J8NaIaEy+GuXPv914tgY+mCWWElX/Wq2JV8LDu
 NXxdzId8K4uysxc5PmIg==
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
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux <sparclinux@vger.kernel.org>, Will Deacon <will@kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Paul Burton <paulburton@kernel.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 oprofile-list@lists.sf.net, Catalin Marinas <catalin.marinas@arm.com>,
 James Hogan <jhogan@kernel.org>, Robert Richter <rric@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 7, 2020 at 3:05 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> Arnd Bergmann <arnd@arndb.de> writes:
> > +
> > +static inline compat_uptr_t ptr_to_compat(void __user *uptr)
> > +{
> > +     return (u32)(unsigned long)uptr;
> > +}
>
> Is there a reason we cast to u32 directly instead of using compat_uptr_t?

Probably Al found this to be more explicit at the time when he introduced
it on all the architectures in 2005. I just moved it here and kept the
definition.

       Arnd
