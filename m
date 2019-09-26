Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93523BFA2F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 21:38:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fQFQ070ZzDqvN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 05:38:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=aford173@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lFVH4DJZ"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fQCH09K0zDqth
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 05:36:09 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id a1so9673981ioc.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 12:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uv8sypDhr4ui+8J14AcrUpiwkTC+Ius1tZ05+vuLNHk=;
 b=lFVH4DJZInfXaRXpqmiMEK9WpeSM/1iq4W9bn5uziJHuNnpDS5uJfwrrSMkKUYaoWu
 tjIzRew236DgZA4ISwubGuuzdkMEJIbQ8yLo4Gw4blLNNqTUJXJQc2T8EmFOMMaE/MZN
 TWI21uIOpWZV0B6kiTUPUzXP+86XUqzfSXBes1IbztoB6sCaCe2+0vHVrK7I1YSyHTRf
 vUusvWxQUo6svZWbb5qWyg1vE5i/0/5lEgToMxkxJ7QF/bNuxlBlDbD6OXf3ku60x8mI
 qYDnylEQgvdyDcRtg2M6u1XUP8jT9lELn92+Mho67HMmT8OkOdOtqWogr7E2TIwC5RUe
 rt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uv8sypDhr4ui+8J14AcrUpiwkTC+Ius1tZ05+vuLNHk=;
 b=qvwCphuXdHx0AiAGchYVJRl/fvJ3go1AEi4LE9Wr/WM2ON9GwWU0gKnbTTVFuoZmyE
 Yz7zk3vFxZR/qkC+Zmd3WXJbBKCPsuAUKO+eYkSTFEV7Iw/ePEac+cu9JjS1j6mA3NcR
 651/56ETwN8xPYDkcsgT69WLml8SR7opKaeHpwJ/i2IoVHKf4H+znl+BR79uww8iTCaa
 SSMcYLQwtQQL4qsQ+FszC1hXC4Z+6MNe9hwvSLNKdqb3yt8rnYKMXJOchudJ0rT0NU9L
 m1cio/q2iaS7u6lF5895c1TXmHqWxFTVfYH8/kIM2IGdiGkFKnuubcqMBAKlko0SnS//
 nzOg==
X-Gm-Message-State: APjAAAWoIHQMj93n7DYZTS1ye86CjgZRq4wlt8L+URdjQqPSWmcpkn7S
 vrSbgbMHV9pB1P2m8YtsnBP/mrTJUJJlm9+02yY=
X-Google-Smtp-Source: APXvYqz6Gzzz4fph8SDTgwR3nXuuRIG8y0wd6XvcO9/S+doLjWzArUyv9IHucQgjs6f3GvWFnHs+ZCUo69B6L3/gML4=
X-Received: by 2002:a92:9912:: with SMTP id p18mr378753ili.78.1569526565531;
 Thu, 26 Sep 2019 12:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
 <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
 <CAOMZO5D2uzR6Sz1QnX3G-Ce_juxU-0PO_vBZX+nR1mpQB8s8-w@mail.gmail.com>
 <CAHCN7xJ32BYZu-DVTVLSzv222U50JDb8F0A_tLDERbb8kPdRxg@mail.gmail.com>
 <20190926160433.GD32311@linux.ibm.com>
In-Reply-To: <20190926160433.GD32311@linux.ibm.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 26 Sep 2019 14:35:53 -0500
Message-ID: <CAHCN7xL1sFXDhKUpj04d3eDZNgLA1yGAOqwEeCxedy1Qm-JOfQ@mail.gmail.com>
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

On Thu, Sep 26, 2019 at 11:04 AM Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> Hi,
>
> On Thu, Sep 26, 2019 at 08:09:52AM -0500, Adam Ford wrote:
> > On Wed, Sep 25, 2019 at 10:17 AM Fabio Estevam <festevam@gmail.com> wrote:
> > >
> > > On Wed, Sep 25, 2019 at 9:17 AM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > > I tried cma=256M and noticed the cma dump at the beginning didn't
> > > > change.  Do we need to setup a reserved-memory node like
> > > > imx6ul-ccimx6ulsom.dtsi did?
> > >
> > > I don't think so.
> > >
> > > Were you able to identify what was the exact commit that caused such regression?
> >
> > I was able to narrow it down the 92d12f9544b7 ("memblock: refactor
> > internal allocation functions") that caused the regression with
> > Etnaviv.
>
>
> Can you please test with this change:
>

That appears to have fixed my issue.  I am not sure what the impact
is, but is this a safe option?


adam

> diff --git a/mm/memblock.c b/mm/memblock.c
> index 7d4f61a..1f5a0eb 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -1356,9 +1356,6 @@ static phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
>                 align = SMP_CACHE_BYTES;
>         }
>
> -       if (end > memblock.current_limit)
> -               end = memblock.current_limit;
> -
>  again:
>         found = memblock_find_in_range_node(size, align, start, end, nid,
>                                             flags);
>
> > I also noticed that if I create a reserved memory node as was done one
> > imx6ul-ccimx6ulsom.dtsi the 3D seems to work again, but without it, I
> > was getting errors regardless of the 'cma=256M' or not.
> > I don't have a problem using the reserved memory, but I guess I am not
> > sure what the amount should be.  I know for the video decoding 1080p,
> > I have historically used cma=128M, but with the 3D also needing some
> > memory allocation, is that enough or should I use 256M?
> >
> > adam
>
> --
> Sincerely yours,
> Mike.
>
