Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 783E5C44D6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 02:16:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jcB36fTZzDqT8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 10:16:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=aford173@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nJtPZChL"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jc8510KkzDqSW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 10:14:28 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id w12so24665828iol.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Oct 2019 17:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qp6mpPjoJw8IpL230TwztYNGcdXtc2wRumjJPrYIsQE=;
 b=nJtPZChLaez2QyIvdw5xpQM+gY+4nNfutZP/DX1GosRihN1p8Y/jzvzU5+zZVVXLDq
 DNW5rNxAEWMfY4DML2WBa4k8L6N9BKjZt+S1WhSwJylMRWekm8bQGBEDcBvcSstJLeH7
 osBNQPoC6vhf9EY6DvGZUS8bjPCLVbggq0vpLSG6o0qgZ68mHanhcK7N3A/k0zMXrBbT
 Myz3NcGtILKbjxYen8N4nInaRBIm801lXbpfCzyfiuoGv9mi3cSKUjp9iAirGweypF7I
 T5mChO7ltGRoxOnD6pn9vRPircx8cSspNsbQ9S+cDzRYkEkb4WMfK2l7wEZANDZnvpgU
 4hTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qp6mpPjoJw8IpL230TwztYNGcdXtc2wRumjJPrYIsQE=;
 b=MgMgMGTuWceq7DQqYai+LEL9E9ibgGKRdlFxu4TunULuHFnVb11RV3ILoVGxCkzmYg
 Xz1i1Cx6PCEypZJCglnwyZYuO7+oBHbJUti4wyP8JBxTMUV3qvPK1TY1eZxd8/a8IEfs
 cuj7DrbwfAlOd37gT2opX7AR+rVMhydlLVcS1zRfifs4fYkjYvhT8fsGZc2kHcjQxb+y
 i46Uo4wNM+XbvbOv7OFidqE5Vt+ZOfWS0lt3N607SpiFKxUXVOPdc+9pqj1ySekGDr6y
 J689dyZn0ExSKshhgFYgxybDQUbvq6XRC8XINKgdV+z2C0BYfcRAyLeqGVWpt7uCXUtD
 nATQ==
X-Gm-Message-State: APjAAAUlyo3KOPWcXRvYt5oFG6Qt50FISi2tOUAkjd+6zisqeTwPuUr6
 PQQT05MdoJK5KIKgSUP959t0M0dJtxLCb/J8WcA=
X-Google-Smtp-Source: APXvYqw1icrX5CgHqYJTBX6lKVXwK6z5wdputtkAh6YFSqMaOhm8xmij6KJaNr2N6b3kx+nme5PxuCv6WXWh+UvZaMU=
X-Received: by 2002:a92:3314:: with SMTP id a20mr890351ilf.276.1569975265009; 
 Tue, 01 Oct 2019 17:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
 <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
 <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
 <CAHCN7xJ32BYZu-DVTVLSzv222U50JDb8F0A_tLDERbb8kPdRxg@mail.gmail.com>
 <20190926160433.GD32311@linux.ibm.com>
 <CAHCN7xL1sFXDhKUpj04d3eDZNgLA1yGAOqwEeCxedy1Qm-JOfQ@mail.gmail.com>
 <20190928073331.GA5269@linux.ibm.com>
 <CAHCN7xJEvS2Si=M+BYtz+kY0M4NxmqDjiX9Nwq6_3GGBh3yg=w@mail.gmail.com>
In-Reply-To: <CAHCN7xJEvS2Si=M+BYtz+kY0M4NxmqDjiX9Nwq6_3GGBh3yg=w@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 1 Oct 2019 19:14:13 -0500
Message-ID: <CAHCN7xKLhWw4P9-sZKXQcfSfh2r3J_+rLxuxACW0UVgimCzyVw@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
To: Mike Rapoport <rppt@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>,
 Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Chris Healy <cphealy@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>,
 linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 linux-m68k@lists.linux-m68k.org, Rob Herring <robh+dt@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, xen-devel@lists.xenproject.org,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, openrisc@lists.librecores.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Sep 29, 2019 at 8:33 AM Adam Ford <aford173@gmail.com> wrote:
>
> I am attaching two logs.  I now the mailing lists will be unhappy, but
>  don't want to try and spam a bunch of log through the mailing liast.
> The two logs show the differences between the working and non-working
> imx6q 3D accelerator when trying to run a simple glmark2-es2-drm demo.
>
> The only change between them is the 2 line code change you suggested.
>
> In both cases, I have cma=128M set in my bootargs.  Historically this
> has been sufficient, but cma=256M has not made a difference.
>

Mike any suggestions on how to move forward?
I was hoping to get the fixes tested and pushed before 5.4 is released
if at all possible

> adam
>
> On Sat, Sep 28, 2019 at 2:33 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
> >
> > On Thu, Sep 26, 2019 at 02:35:53PM -0500, Adam Ford wrote:
> > > On Thu, Sep 26, 2019 at 11:04 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Thu, Sep 26, 2019 at 08:09:52AM -0500, Adam Ford wrote:
> > > > > On Wed, Sep 25, 2019 at 10:17 AM Fabio Estevam <festevam@gmail.com> wrote:
> > > > > >
> > > > > > On Wed, Sep 25, 2019 at 9:17 AM Adam Ford <aford173@gmail.com> wrote:
> > > > > >
> > > > > > > I tried cma=256M and noticed the cma dump at the beginning didn't
> > > > > > > change.  Do we need to setup a reserved-memory node like
> > > > > > > imx6ul-ccimx6ulsom.dtsi did?
> > > > > >
> > > > > > I don't think so.
> > > > > >
> > > > > > Were you able to identify what was the exact commit that caused such regression?
> > > > >
> > > > > I was able to narrow it down the 92d12f9544b7 ("memblock: refactor
> > > > > internal allocation functions") that caused the regression with
> > > > > Etnaviv.
> > > >
> > > >
> > > > Can you please test with this change:
> > > >
> > >
> > > That appears to have fixed my issue.  I am not sure what the impact
> > > is, but is this a safe option?
> >
> > It's not really a fix, I just wanted to see how exactly 92d12f9544b7 ("memblock:
> > refactor internal allocation functions") broke your setup.
> >
> > Can you share the dts you are using and the full kernel log?
> >
> > > adam
> > >
> > > > diff --git a/mm/memblock.c b/mm/memblock.c
> > > > index 7d4f61a..1f5a0eb 100644
> > > > --- a/mm/memblock.c
> > > > +++ b/mm/memblock.c
> > > > @@ -1356,9 +1356,6 @@ static phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
> > > >                 align = SMP_CACHE_BYTES;
> > > >         }
> > > >
> > > > -       if (end > memblock.current_limit)
> > > > -               end = memblock.current_limit;
> > > > -
> > > >  again:
> > > >         found = memblock_find_in_range_node(size, align, start, end, nid,
> > > >                                             flags);
> > > >
> > > > > I also noticed that if I create a reserved memory node as was done one
> > > > > imx6ul-ccimx6ulsom.dtsi the 3D seems to work again, but without it, I
> > > > > was getting errors regardless of the 'cma=256M' or not.
> > > > > I don't have a problem using the reserved memory, but I guess I am not
> > > > > sure what the amount should be.  I know for the video decoding 1080p,
> > > > > I have historically used cma=128M, but with the 3D also needing some
> > > > > memory allocation, is that enough or should I use 256M?
> > > > >
> > > > > adam
> > > >
> > > > --
> > > > Sincerely yours,
> > > > Mike.
> > > >
> >
> > --
> > Sincerely yours,
> > Mike.
> >
