Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAE633F224
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 15:04:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0sMl6htmz3brS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 01:04:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=i2DpCpQM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b31;
 helo=mail-yb1-xb31.google.com; envelope-from=matorola@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i2DpCpQM; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0sMH4DnVz2yyF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 01:03:38 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id p193so40628808yba.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 07:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6OaFjyFWgg4m3b9LuLpqb/rP6tn5J4G93CnXJEjgfLQ=;
 b=i2DpCpQM7JeSSiS/pjMxgtMmRWaqyEUnqOkpir3k6hjfU9Oor7nDorySG4w47CoCGd
 HaiLgTyqU0kC8zA/M2kZQM1sH1E1LbWud/WbA8om7HWvSV+BUakqiOwPUeTLcoqCLPGf
 JedwFXQpUMM2xc1N014Ahaw2YTMoAf2cj3FsgDsCKv3ZOzvpAcW8c+eMj3EENF375f8x
 11rayPkdrSyY5YcS7+D3f2mNmy0iI8qzZ8PRIa+NRFehp669D1SyF0qYVVKeD+gzVYK8
 LIsktzMZcnA20N+P0QIhTw/wSHTpN81axxWdN3YKq6VrI5qwWqPf0cj92aOsspj4iCYa
 aQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6OaFjyFWgg4m3b9LuLpqb/rP6tn5J4G93CnXJEjgfLQ=;
 b=ZB4WFuci89LHfwsxT3I3GNz/NlK9ZfjXNrQgTZZz8r42v3t5yq6sA993N6hoFXWpXa
 7hnkNE9utyoiQQtHhu4Q3n9QHCzfKwpqgSK9vP+jCO9ninY5sIVLnJ/lYlM00VV05pak
 S1CW0jhdlmtnHcHEKScGTBpc7x1UDRJCfxHDcvJcd/QAOhT4a74TRQrTCfJ3//0QghfL
 ++3qtlE8YX92jkRBR9anopBw1oBjErCunba/NfXW5Nt68LMfgybEI6vvr6ex0gUsKCUL
 GnN/54OlAtEuDz+kjQ51jfgTlJ3SIwqX9McfiVEAqUc00pp89LXLn1Q2w9nKzOeVT5Y2
 bJnw==
X-Gm-Message-State: AOAM531iGwXl2f/KLqg//HZbGyUs5WW1K+TU2uT7AmHzAyTzOpmSK49t
 lFBiZ0KJ1pcSMB62IScoGurK5rzVqvXFjSe4JzI=
X-Google-Smtp-Source: ABdhPJxYwg2QBX1owqFPtrq2F/9pLRU/hzhKTzIOR3dpydN55snYMjquLkj00WQN+8aJP9sdN02xLmqhMTlZQxWC8Dc=
X-Received: by 2002:a25:dad4:: with SMTP id n203mr4746316ybf.233.1615989813490; 
 Wed, 17 Mar 2021 07:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <4d488195-7281-9238-b30d-9f89a6100fb9@csgroup.eu>
 <20210317015210.33641-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20210317015210.33641-1-wangkefeng.wang@huawei.com>
From: Anatoly Pugachev <matorola@gmail.com>
Date: Wed, 17 Mar 2021 17:03:22 +0300
Message-ID: <CADxRZqwFokuZrhA6GFr=whM3s7BqZpzo8yq=TW6YEr=eeEUH0A@mail.gmail.com>
Subject: Re: [PATCH v2] mm: Move mem_init_print_info() into mm_init()
To: Kefeng Wang <wangkefeng.wang@huawei.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, Guo Ren <guoren@kernel.org>,
 Sparc kernel list <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>, linux-parisc@vger.kernel.org,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 17, 2021 at 4:51 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> mem_init_print_info() is called in mem_init() on each architecture,
> and pass NULL argument, so using void argument and move it into mm_init().
>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> v2:
> - Cleanup 'str' line suggested by Christophe and ACK

applied patch (5.12.0-rc3-00020-g1df27313f50a-dirty) over linus.git
and tested boot on a sparc64 virtual machine (ldom) - boots.
