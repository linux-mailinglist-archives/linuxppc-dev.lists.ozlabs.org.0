Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA7F719486
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 09:42:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWylz6VTFz3dxk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 17:42:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.44; helo=mail-qv1-f44.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWylS5DzJz3c3W
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 17:42:28 +1000 (AEST)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-5ed99ebe076so7133266d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 00:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685605346; x=1688197346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wC4AZRVcHnRKNLMlbDCAYeJz9LlsudAe96MnAggdWqk=;
        b=kNYcTKCulWgoLTNZ7f2zn7nGs2sXEZN2A1PLeiOiKICTtScRwLGE26PkgnWCRneJTg
         DPdYzsv2VT/wiGOqRxrAF4fy9UXMVFmZHWdpQvO2dZoutX6KItH/7aw1MgJq3JEo6Rj5
         9NtQD6ZCyK9omEjcvrIKWeCk6KasXJdn8u+LFj8d6OTRSzseG7THzU7bwFb+oSbjJShV
         GdB4l/y2GPbTdhl0qWV94eaJhVSSeiXpzh9giZgYuO4ZAxg3NAZmxj1L08dLUoHFBnEv
         t27gtY8TrSOcxUTtCMjmsWUgVLqwIMvA4l9CbiWugBmYrnapIFhGBXY8bPqBTdkOe3oq
         jH6A==
X-Gm-Message-State: AC+VfDxeceSryF33fw0eFs/dsBWOn/5AbMvKARuwLgTPPOSO/S5IJxOR
	KoLfU7EimB63W8g3xpbT/eQE+fPGUWmi8w==
X-Google-Smtp-Source: ACHHUZ5tEwjN2HwCBtR05O9dFqGCSKL+/yglkdVo9rupsXM7OrLz0D+3FrTyU9ceJDId2Jl4+ka/TQ==
X-Received: by 2002:ad4:5ca9:0:b0:626:38cc:648d with SMTP id q9-20020ad45ca9000000b0062638cc648dmr11103985qvh.40.1685605345847;
        Thu, 01 Jun 2023 00:42:25 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id e16-20020a0cf750000000b006257e64474asm4791187qvo.113.2023.06.01.00.42.25
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 00:42:25 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-75b132ad421so57348285a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 00:42:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4890:b0:75b:23a1:3603 with SMTP id
 ea16-20020a05620a489000b0075b23a13603mr8693674qkb.20.1685605345152; Thu, 01
 Jun 2023 00:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com>
 <20230531213032.25338-31-vishal.moola@gmail.com> <CAMuHMdU4t4ac_eCH0UaX9F+GQ5-9kYjB_=e+pSfTkxG=3b8DsA@mail.gmail.com>
 <025fc34a24e1a1c26b187f15dba86d382d9617eb.camel@physik.fu-berlin.de>
In-Reply-To: <025fc34a24e1a1c26b187f15dba86d382d9617eb.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Jun 2023 09:42:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVx_0Dhz1fOsCr3aYAVpk1HypoPJwbdNDj3h08x4esu0g@mail.gmail.com>
Message-ID: <CAMuHMdVx_0Dhz1fOsCr3aYAVpk1HypoPJwbdNDj3h08x4esu0g@mail.gmail.com>
Subject: Re: [PATCH v3 30/34] sh: Convert pte_free_tlb() to use ptdescs
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Adrian,

On Thu, Jun 1, 2023 at 9:28=E2=80=AFAM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Thu, 2023-06-01 at 09:20 +0200, Geert Uytterhoeven wrote:
> > On Wed, May 31, 2023 at 11:33=E2=80=AFPM Vishal Moola (Oracle)
> > <vishal.moola@gmail.com> wrote:
> > > Part of the conversions to replace pgtable constructor/destructors wi=
th
> > > ptdesc equivalents. Also cleans up some spacing issues.
> > >
> > > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> >
> > LGTM, so
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I assume this series is supposed to go through some mm tree?

I think so, so your Acked-by would be appreciated...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
