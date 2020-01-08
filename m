Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1BC133D89
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 09:47:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47t2tB1tPWzDqQm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 19:46:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47t2qy4BsbzDqBH
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 19:45:01 +1100 (AEDT)
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MD9Ox-1ixfgH2Sun-0098G3 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan
 2020 09:44:56 +0100
Received: by mail-qk1-f173.google.com with SMTP id t129so1914545qke.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 00:44:55 -0800 (PST)
X-Gm-Message-State: APjAAAWjrX5rKmXcadroYf2TyEkX4Qdvr0WfBauWAOZ8dRkvMGBI1Yej
 Zd6vClxLS7qA1Gp7b7NgItvBWcY8UKip3acffrA=
X-Google-Smtp-Source: APXvYqwBkJ8QmnIL+nEzdyW4cVb2dCgT1+bxTVHrv/QXRUdjO9mWLnIecKxCrEVE9XkgL278ZPmA2bqFRRwBDXNH4F8=
X-Received: by 2002:a05:620a:a5b:: with SMTP id
 j27mr3333439qka.286.1578473093254; 
 Wed, 08 Jan 2020 00:44:53 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
 <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
 <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
In-Reply-To: <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jan 2020 09:44:36 +0100
X-Gmail-Original-Message-ID: <CAK8P3a21yPrmp4ik3Ei1BZfeqZNf0wL5NZNF3uXqb4FLRDyUPw@mail.gmail.com>
Message-ID: <CAK8P3a21yPrmp4ik3Ei1BZfeqZNf0wL5NZNF3uXqb4FLRDyUPw@mail.gmail.com>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:81Na4M35yO740ZhhUErPDsc2LM+R2NYfxOj6rxf+sU4HGYVoYv3
 EJQFoROlZFh8DU7mEFUABANG/MMx8xMJkEnXqBzIrMDBtA1ECjB/L27nkAILbCClBeg5sQ6
 zKKG7sQZhVFyi6rkOKmIcg/IMpLgM3onB94vL71pcOwnlm1djOW+NOnURzq8i+HGbn27pj1
 Zsrld21YvILLe9PKX1xRw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lViDLeAou0c=:PyBhAhWsffCBntzyZug736
 AXqx/pciMszto/rzYG91FotNTSbaaj9d+owmOI7SjpSHPVEsyzXpNq1pgV36ni3ZsAoFX83kU
 KzGdVwN0eTmTLzj0iloaW/sHTAgEvAnqNnWxLzgiaT6cAlOy9jDDi771N8neFWR2jdm4YFW1K
 sFz/UZ/K2z2MtJ1QrlxwRyoOgE0fQeDkWx7GboO8j4CvRg5ICU7fwqNmlV12W5qlafHHeAwf3
 znGmjdr23w1smHbcdfUMo9/tm41oeYVjIBwtYxZcwj1i1yNXkboDYN3j5IE7SlmXVLKcSDG7v
 q5lboipzPDuvqDl1nOYimIO2qvD0jSJn9IfCIh8yaAzW/MEbX41cCf2Y5xASeJqP7ElhqwA0+
 9CcgCGpbygQNfzQLwTfH+UJPhsu0jWuLJqhE8u3XjXIwfeDhyA/aTf5j+OWvQluw1f1H17Cgc
 fsfUCyJdRYJxEQBC/2QI2OiaULbkQpTTTNyEdido0TFZ4VdQRDFVpGH/7VS3DxIfOS8iD07FA
 t6BGRmOxhpbl2T8oS9N6BlSqMaubgH9GSUmdudlz7JmjgIgRM9yiKjf+u1thDY12/fUbR2Fqa
 ST4eJDzJT6ttQwRm3QPwakgaTZcxibWDzFPy9evw2wf3Ay6vEKyCCy8zd79uHtopDuAdZBItA
 wOsuJCsiRgXgoRldPLEBNStmPPZYksXVQ7MPzRHNQiEbiCDUrrLrxGXszpzZJkaIa1aLTanGX
 dRkepCd4zaFcAsICb892v+x2MqCriaNCP/2F8LEdyEy+9YyrYIR8yL2sTNXKt/AOjOutv0Jpy
 HUqYR1W0RdMhgdEY6FWk6fw3POHeFF98y3GWHrHnbQiMT4ds4nstKr+DdLczE5TJZFFWzvDey
 r5Xlub6hhKFjFLGo8FQA==
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 ML nouveau <nouveau@lists.freedesktop.org>, Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Jon Mason <jdmason@kudzu.us>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Daniel Vetter <daniel@ffwll.ch>, alpha <linux-alpha@vger.kernel.org>,
 linux-ntb@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 8, 2020 at 9:36 AM Christophe Leroy <christophe.leroy@c-s.fr> w=
rote:
> Le 08/01/2020 =C3=A0 09:18, Krzysztof Kozlowski a =C3=A9crit :
> > On Wed, 8 Jan 2020 at 09:13, Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
> > I'll add to this one also changes to ioreadX_rep() and add another
> > patch for volatile for reads and writes. I guess your review will be
> > appreciated once more because of ioreadX_rep()
> >
>
> volatile should really only be used where deemed necessary:
>
> https://www.kernel.org/doc/html/latest/process/volatile-considered-harmfu=
l.html
>
> It is said: " ...  accessor functions might use volatile on
> architectures where direct I/O memory access does work. Essentially,
> each accessor call becomes a little critical section on its own and
> ensures that the access happens as expected by the programmer."

The I/O accessors are one of the few places in which 'volatile' generally
makes sense, at least for the implementations that do a plain pointer
dereference (probably none of the ones in question here).

In case of readl/writel, this is what we do in asm-generic:

static inline u32 __raw_readl(const volatile void __iomem *addr)
{
        return *(const volatile u32 __force *)addr;
}

The __force-cast that removes the __iomem here also means that
the 'volatile' keyword could be dropped from the argument list,
as it has no real effect any more, but then there are a few drivers
that mark their iomem pointers as either 'volatile void __iomem*' or
(worse) 'volatile void *', so we keep it in the argument list to not
add warnings for those drivers.

It may be time to change these drivers to not use volatile for __iomem
pointers, but that seems out of scope for what Krzysztof is trying
to do. Ideally we would be consistent here though, either using volatile
all the time or never.

        Arnd
