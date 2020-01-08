Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D869134148
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 12:58:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47t7762xkLzDqSt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 22:58:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47t74P56HFzDqSH
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 22:56:04 +1100 (AEDT)
Received: from mail-lj1-f173.google.com ([209.85.208.173]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MVaQW-1jEQZ83xhc-00RYPp for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan
 2020 12:55:59 +0100
Received: by mail-lj1-f173.google.com with SMTP id j26so2975785ljc.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 03:55:57 -0800 (PST)
X-Gm-Message-State: APjAAAXmrH7V/KQd8p263tereDOlcmKc3MyzDoxu9yJ8us0iubM2X4ML
 0Z4ZuAgyYw5DE5ePuzB+DWbzDvRdv3OhNZmWciA=
X-Google-Smtp-Source: APXvYqx76A/E4Ch8oNBJvonZ2jianfqelDGhZdcoyIiElnwI+5tX58xf2+wQq15Hqyr3lM5AXUWKqh7e7QV64xZG5mc=
X-Received: by 2002:a2e:9095:: with SMTP id l21mr2608508ljg.175.1578484556968; 
 Wed, 08 Jan 2020 03:55:56 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
 <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
 <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
 <CAK8P3a21yPrmp4ik3Ei1BZfeqZNf0wL5NZNF3uXqb4FLRDyUPw@mail.gmail.com>
 <20200108091549.GB10145@pi3>
In-Reply-To: <20200108091549.GB10145@pi3>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jan 2020 12:55:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a19ZgLhKJ016Mt_FyZrqnKaWwJyiaauMiUDAHV=DB9_2w@mail.gmail.com>
Message-ID: <CAK8P3a19ZgLhKJ016Mt_FyZrqnKaWwJyiaauMiUDAHV=DB9_2w@mail.gmail.com>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:GpGVg+roauqG0RyfNc514djQLSC2VLz2E2flCE+th94Xc2dLOU2
 +kJrCLMVXF09x93x0ywocIZfRaCkaiC8qUe1fgbfDQP+wsqmrimTn+tm8nK4aRLla8jGzN1
 iGJvRZw4NPX76cwQx9RTVfsEvoVl/j/b1YGqIfcOQcgp6C6Ih+l9QVtk3hPC0hBN5Hqrlu+
 qTtm3VnfNcwFEKx4vUtGQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gL7BxHEkJkY=:R09LEnffKwDG4Y3xA9oGwi
 6eBttfLn2vI/Dk/1W/pqNupnRuuhd+T+mk0hAHMO0EnGEgnMEDRVdBZK8Dt4teF+xOfLALmaI
 dnvcTCO1I/ejn5UofsKF7re0fDwxTcEX4cbaD9mVCGLBfzXDavUs4M3TxduZbCImDqPjETerN
 8GKYWw1jBVlc8WPlqUL3Wgvy05iE8bCcC+3AethADCbP6jmjWLICdTmBYQ3sC7/6h8gSqmxrU
 gDeVCyjdkAkycaW5AI9ZyUUGi2aXAuZxADD5dknsM3PA9NpEX9QBjVQiowOCf5Gt1+mKaFjSi
 w3wRrl0MywrcMbBi1VSG4sB8fu2NLlOGNP3aZvprL9g7QJw9KRZwlW1gk9q+uhMhDkIlVwwAA
 bfQyd9qw7CCkwwTLDQGq9B8YVWntFlBbF9V8ptdUydvzXIukhTm4zejwwGz9VlesmU/ZU78Zl
 pRWamMfPrwRLBlOAB+sbREZb0LrqynrjPc7dcNKNh49QCgW64R7tnkPF/sXm0x3ytAjdyCaIM
 IM433WyWdNqiNmUYXsj4OEOSZW8nYWUKH6w+Mjh4sWK07HW/HNtMaxcsEWokRyoZZjWJRY3Fl
 006U430v2Ik8RBxuTQ8K5wWMN6gpWtcIhckjSZhYbz+oeOm+P2eVH5VCsyy6FIL8CMKerC3FB
 /RX9522iBzabpG1Bo7LzK44ShhK5kHSConUir2amDqY/gsj+DW58XnVviT09QWsv0PeDRIzRI
 gf5EvdUfoYN4lCDo3RW2KbSiFnBOSvPHbl8GQSOhaKSI/LX7dGuBEJqp+Zy5mqfh7nO4UPJDM
 Uq+k5RkBNjIaPmYfGudvOD4xR9Oq1FhdGKl2jZcRReb9zX0EMelzwltr57IMBT/oxTNqhWt26
 bsmDYnpYwNagHDMrF5fw==
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
 Alexey Brodkin <abrodkin@synopsys.com>,
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

On Wed, Jan 8, 2020 at 10:15 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> > The __force-cast that removes the __iomem here also means that
> > the 'volatile' keyword could be dropped from the argument list,
> > as it has no real effect any more, but then there are a few drivers
> > that mark their iomem pointers as either 'volatile void __iomem*' or
> > (worse) 'volatile void *', so we keep it in the argument list to not
> > add warnings for those drivers.
> >
> > It may be time to change these drivers to not use volatile for __iomem
> > pointers, but that seems out of scope for what Krzysztof is trying
> > to do. Ideally we would be consistent here though, either using volatile
> > all the time or never.
>
> Indeed. I guess there are no objections around const so let me send v2
> for const only.

Ok, sounds good. Maybe mention in the changelog then that the
'volatile' in the interface is intentionally left out, and that only users
of readl/writel still have it to deal with existing drivers.

    Arnd
