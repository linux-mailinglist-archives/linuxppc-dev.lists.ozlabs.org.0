Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45313132D0B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 18:30:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sfXg1h15zDqSc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 04:30:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sf3Z48MXzDqLn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 04:08:42 +1100 (AEDT)
Received: from mail-qk1-f176.google.com ([209.85.222.176]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MEV7U-1ivxl91YRm-00Fzr7 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan
 2020 18:08:37 +0100
Received: by mail-qk1-f176.google.com with SMTP id z14so42030057qkg.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2020 09:08:36 -0800 (PST)
X-Gm-Message-State: APjAAAVjQGuGLh+aCGVYqzPP/KlGLDkXhQ9ifda2kOcxAKqccLoR/h7x
 dioabjLRgS6MUXhYirSxNEn16nP2ArWbq2SA9r4=
X-Google-Smtp-Source: APXvYqzRk52Ew2lmsQMfvghk3ylFHcEIR88yL70qbdC0HVK9etbYRWgu7fgyXH4+189J3IyWZY+dkJGnvq1XjVlLM+A=
X-Received: by 2002:a05:620a:a5b:: with SMTP id
 j27mr335658qka.286.1578416914895; 
 Tue, 07 Jan 2020 09:08:34 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <1578415992-24054-6-git-send-email-krzk@kernel.org>
In-Reply-To: <1578415992-24054-6-git-send-email-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jan 2020 18:08:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2eMB34Qd=U_9vGBCN3m5Zh4qDhyEpGH6M=M4e22aPQLQ@mail.gmail.com>
Message-ID: <CAK8P3a2eMB34Qd=U_9vGBCN3m5Zh4qDhyEpGH6M=M4e22aPQLQ@mail.gmail.com>
Subject: Re: [RFT 03/13] sh: Constify ioreadX() iomem argument (as in generic
 implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Pc+uNUsKJ6LpMdeclnvqWBGuzhlAGWGcKkZV+MO/UViIa/kOBuq
 BnfRR3xPxhbhgEnT4IysYvmOkwyw8jo9sFSj6NwoR9SsG8Zdc7NAo3fUfTcvBqu2wWq8f8q
 Rb32+H23/H7e4/HBANG7bgT1LtyG7NdTeGOJrB5Cutkufdkiqkvbquv5tKXVJ+X4yG/PtYQ
 Fyi1Dj/BtHT/WZSvoNgwA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mCRuz20hYAw=:sycK1h5A8tjVP3UcEj+C+/
 ZAKdzJ7jY8xNxe55RG7je/HiTYkK/BAKwEa/9WsoeNc/BlgufFBSaJnF31LWhE7H5abPpZgRw
 KDIEIC3C99kdp1wN3kJreN1NvX+FOT0IP3XxrkxnR/+BBaZNWXhXxHtd5IY+/+cPC+IDUCm+S
 fgpB2yImjiOu1M/mAykewHHF+G2veZuEs7354yAG7UaMzWNZPjcY/qfFLulHvXnT+Q3sns8km
 7GIamM0F1dUmsFnZr2/I9GYj/B9mE+AQZi5lj4fiTRo5pwhlUhxI8rDCuva7yWUCOKjuO5rJB
 Im4RgeTP94icKsKpxQWolNUTQkIYkgcJtG6adWcCUEKrX8Dg8wYvVPMYfmoXgKEp7n7Ekd2+A
 DeamrDV7ebwTID25E7WZu2i50em0Spvm8IfBaPzMsRjk1h/MQ0V4Vf53fLnOVzq3gT8MveDXe
 EiAH5Sgy9FRUWklkW3kIu94c7QgUdAKuuiQbqBhEfyd1oXL5tA7cJNWahD6pkvWaKHYb50hbj
 5eU39VvWAiENvWQ2DClvqdU7uLPOUpCrPSY1PkC54SYKULqAVLvfuSGW3LGsUymYoM8SmvWXY
 6fxHY7zuYBbYOj8WozuLoA1Sq7bBRSYK8t/EctO2ShafcniSB5Z6xh9c/axsXBpulS5TRWmy4
 Djp6oNU0d1yGOroYSNVGCHdump0KkD8GbcSveDE7jXs0wU7x+Fd2mTkbwq5jykpxs+WaDKVYY
 Ek8ahYmf4JDGh11S1G1mNSLErdHFSjM+w9hl8w8n2/MBdx63IkCixcwSjLXx1kbjxFg73I6Bk
 leTr/vLSkDBAzZ0U7ZCMgEshPVQe5L+kea2gyfw9omy0dky/86QI2Qt7EbrkfgPYcXb2ecNDG
 /0LVqhn5AayWwkgM+ePw==
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
 Jason Wang <jasowang@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Networking <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 7, 2020 at 5:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The ioreadX() helpers have inconsistent interface.  On some architectures
> void *__iomem address argument is a pointer to const, on some not.
>
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

The patch looks good, but I think this has to be done together with the powerpc
version and the header that declares the function, for bisectibility.

       Arnd
