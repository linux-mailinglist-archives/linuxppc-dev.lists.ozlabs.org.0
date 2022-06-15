Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD7954CD4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 17:42:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNV1Q2k70z3ch2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 01:42:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.17.10; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNV0x2qW2z3blm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 01:42:07 +1000 (AEST)
Received: from mail-yw1-f170.google.com ([209.85.128.170]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Ml72g-1nIDeZ2Rsy-00lSPE for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun
 2022 17:42:03 +0200
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-3137c877092so64919817b3.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 08:42:02 -0700 (PDT)
X-Gm-Message-State: AJIora/O/pC7YPxHyBIocmhlqE92cZIxiEC9/GL7TIvaYbq7pEIL/Ox2
	z6MRaoQPTRpj/s2aWu/qo25WcFtyspu3kDpql9A=
X-Google-Smtp-Source: AGRyM1tvSYqmEMcQOHNj9RHGvPD3N77JHNbv7mv6qEA4arhJQHb8/8PCIV9TGNOQcD+GB1sbS5DvpPMqr/97f5KSeYo=
X-Received: by 2002:a81:2f84:0:b0:314:2bfd:bf1f with SMTP id
 v126-20020a812f84000000b003142bfdbf1fmr292750ywv.320.1655307721907; Wed, 15
 Jun 2022 08:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <YqjQ5kso7czrmYPW@linutronix.de> <YqmC1aAm+O7RD2IH@infradead.org>
In-Reply-To: <YqmC1aAm+O7RD2IH@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Jun 2022 17:41:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1QmeAscV-Ory-Dae4RoLvDSPEjEgFGQHR9U8jUervGuA@mail.gmail.com>
Message-ID: <CAK8P3a1QmeAscV-Ory-Dae4RoLvDSPEjEgFGQHR9U8jUervGuA@mail.gmail.com>
Subject: Re: [PATCH] arch/*: Disable softirq stacks on PREEMPT_RT.
To: Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:UI07zVXfHHb+NU5Bi0E4g8IMmUBpRSDcK25MOwUK1l+U0ChhBzh
 F5Mu7VDZxZnaH5YeqeiblZJcwlSVpP0Ox4dxnYHJAGE4y3FEjWoysBFQ6oTT9T5c6NzyUlv
 2CURsKocpi9YXucJdxRsSmmIVb1CqIhQuREHxPeBc28lg0iTi1vLngfLciyG41NDYuSX1Dl
 lYaSF27nn4y4bqIT6mxvw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UHqSmZX+yWE=:K7hdAcojtrg+7HBleUhjEC
 2Aud02IWkqP5DTuQiIWSYabZ+4cImEX0x/ZdH+aNtor16TzpZu4xiWqDrGuKheb7kL7XGdODb
 UnAfWbpNFn1nSs1Y/mHu2HzwdJqiUShYmuH/BOT7xP/uE2YMvqPUjNRFjN8nzpREUkhx0gxDk
 sxplBQjgPS+Od/F1UCyJ9oAhdT1p8KY28+lR27F1ssbb0ehb6iGEG/O5LkKrj/URN4IStWG6K
 KPqUT1pohXbIXUnaAKFahKPEFg3Xq1+xqMr6Vhd9oEd5p1fnQTiH4F/fogLiJ4f+Ome8F5AKf
 xN4aGV2a7D0JrTfmWaJv/S8OXTsnZ9tHrGLv1vaIiMNYBijobZ8LVV5E3qkrXO377iIC6Ks4s
 C9IeN3Hhep4Ml9mFx+iZcnOl7gdndCqSqy14wHtTL6Rdq655u6tJdrOgs3CGjAW14EKFs2ITg
 agJiR3avR3VyjsLycdu/8haDun33QeCg/3N/UBm3Sb6VvXXyE9LIWsXcZ55fF2a8E40bL9QW0
 6pnKYkUTeBiVxaWVGufgqpBIktNyVZGe1mm8tCP0tPhEx9uzBoCqLmaaaGrgWiUHRZT5dcyQh
 Qj1KTC9np2O2fcFZeVjIJHsEF83wTZlgQkR7LXXW+qtFY+5jd/E/q8ZG5gHiqxaQ+Wqij60pi
 HBmAGwhABgpTyvOcoHH1Y1SrdfIHZh4CNLUEIg1LIakqWOKzts35Xyy1MbW+qWL5woLV8dZzw
 uThlI32FLx+EFbKZhgG6e2SHE3cMcLjMdvhhpQ==
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
Cc: Rich Felker <dalias@libc.org>, Linux-sh list <linux-sh@vger.kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Paul Mackerras <paulus@samba.org>, sparclinux <sparclinux@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-arch <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Christian Borntraeger <borntraeger@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Parisc List <linux-parisc@vger.kernel.org>, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 15, 2022 at 8:57 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, Jun 14, 2022 at 08:18:14PM +0200, Sebastian Andrzej Siewior wrote:
> > Disable the unused softirqs stacks on PREEMPT_RT to safe some memory and
>
> s/safe/save/


Applied to the asm-generic tree with the above fixup, thanks!

      Arnd
