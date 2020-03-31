Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2551E199C1A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 18:51:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sFhv1lqhzDqyY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 03:51:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sDmf5Hm3zDqbl
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 03:09:38 +1100 (AEDT)
Received: from mail-qt1-f179.google.com ([209.85.160.179]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MfYc4-1iqrNh2ymO-00g101 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar
 2020 18:04:25 +0200
Received: by mail-qt1-f179.google.com with SMTP id t17so18730657qtn.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 09:04:24 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2U5oZP44AV8WQOuCxcsIarqqijP2ApHkOmTGVYWXvFKOyXKqfJ
 yDc2sQ0ljiZSLd3ca+YsHCbtMpOGtrTr5rfb8Wg=
X-Google-Smtp-Source: ADFU+vsV7OUw/yG7jiZrXNFRLm1eXbesdhE6Gt+5x4dwrPNxojl+8IV+jXHl3G0MV03Bhz5TSjaj1rNqxNpqeElwkyI=
X-Received: by 2002:aed:20e3:: with SMTP id 90mr5691505qtb.142.1585670663815; 
 Tue, 31 Mar 2020 09:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <698e9a42a06eb856eef4501c3c0a182c034a5d8c.1585640941.git.christophe.leroy@c-s.fr>
 <50d0ce1a96fa978cd0dfabde30cf75d23691622a.1585640942.git.christophe.leroy@c-s.fr>
 <CAK8P3a3u4y7Zm8w43QScqUk6macBL1wO3S0qPisf9+d9FqSHfw@mail.gmail.com>
 <833d63fe-3b94-a3be-1abb-a629386aa0dd@c-s.fr>
In-Reply-To: <833d63fe-3b94-a3be-1abb-a629386aa0dd@c-s.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 31 Mar 2020 18:04:07 +0200
X-Gmail-Original-Message-ID: <CAK8P3a244P38c+JCRnf1EscQOSzaQQNZc6b5F=LFE2a_im8AqQ@mail.gmail.com>
Message-ID: <CAK8P3a244P38c+JCRnf1EscQOSzaQQNZc6b5F=LFE2a_im8AqQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] powerpc/platforms: Move files from 4xx to 44x
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CGPwPNOP9ZmN5k4MM84CNVDFUJlA8Wol42BulRxMeTFWDiRerGV
 G5T3dZCzFKV4oOtVABniJd8nyZrhEYsC2j5lvMfMSxyHosUHHFv87bZvNzDbIKtaSQf/1uj
 wtniDclxhpF8z/1VG/W/wwZ5D3EfdFKJQiQzDeh0BHakT9ADrDl378keG80bjdCHtBw2nnb
 ZgvG7ZywddCaVqg+0rPag==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tW0f4dIaJKg=:Mpw6aecSkt9DGAOQDJGRwr
 6wYh++vLj6oe2qvx5KdB8Vyl0Q+vfJDs3WxocoVgKn7iKuhDJWVrk/o5cyxBz/nPcG7coM7Em
 Hmx3pE0OXPyER5aT6TgkQNuwgv/iGdnpvxiP8rWStE3NV57d+qR8SYC9RnLIutuuLVbFp2RcS
 3xLSX97pHN2DrYiO2VDDL3kB8p5QW0soNuqEr3xmiZ2dysbSm/wlRdiuF1yZwfCOHrieYUbL0
 Wn0sGFMcpGYPASnWv+yTXLN6dLuHx4znMGD4lHituTO3V9lI2ysOb1B1F4igYmu+WMMfl+DGX
 7+Zk67yzhZcxv+u8NZzWOzJxyP3ODPb/mvC/wUukpCnTyERno/How9mkKj1qdY2XOgrpE5/PS
 saHQ75a7NqOY+emVDLzgk7d2tAnwGWocZwRF3woYmOoD9YUl0DauMUodOiP5QjcMg3+wntFyP
 2odIpbCfP4RSclTHnzPypLSegFTnyxWOxUZce+bCt4nuI6t31wVpkIFueJemnQZPQoagPNZhQ
 Hvr4r7iBvEBcXBsbJNDwuzzxJnguWZMtzsBt6DOSCAtbuO0O/gGejRgKeo4v1NDLF61rTc3qJ
 V5rCqVlDAJl1Vw080LaRor7IPTXM2Q8sxxQPAQkhtYakXRSNskAKZHX2BcdUSO+/4BNlXFnwX
 7Jw4sKuf7AVcxIooXmeGEMsXLXBx5Kp0SiociOE2euiJH1nmx267RBC0ZzxCq2++4gyF9ziSK
 I3GqfZwcK0Q0i9y/13qwGLWbSGGpPQAmgSjARL8FelVbvQhdzx1LowfKpYOQBFsjmWHAp7pnr
 k03Zmh6caFfkFhrzZKNWqyQnmr/twhWATD+h0wm4RHq9l9XQtM=
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
Cc: Michal Simek <michal.simek@xilinx.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 31, 2020 at 5:26 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
> Le 31/03/2020 =C3=A0 17:14, Arnd Bergmann a =C3=A9crit :
> > On Tue, Mar 31, 2020 at 9:49 AM Christophe Leroy
> > <christophe.leroy@c-s.fr> wrote:
> >>
> >> Only 44x uses 4xx now, so only keep one directory.
> >>
> >> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> >> ---
> >>   arch/powerpc/platforms/44x/Makefile           |  9 +++++++-
> >>   arch/powerpc/platforms/{4xx =3D> 44x}/cpm.c     |  0
> >
> > No objections to moving everything into one place, but I wonder if the
> > combined name should be 4xx instead of 44x, given that 44x currently
> > include 46x and 47x. OTOH your approach has the advantage of
> > moving fewer files.
> >
>
> In that case, should we also rename CONFIG_44x to CONFIG_4xx ?

That has the risk of breaking user's defconfig files, but given the
small number of users, it may be nicer for consistency. In either
case, the two symbols should probably hang around as synonyms,
the question is just which one is user visible.

       Arnd
