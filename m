Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD2A6602FE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 16:20:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NpRpm3Tc2z3fCC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 02:20:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.169; helo=mail-qt1-f169.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NpRnG4YSWz3cCF
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jan 2023 02:18:42 +1100 (AEDT)
Received: by mail-qt1-f169.google.com with SMTP id c7so2230638qtw.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Jan 2023 07:18:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLTT10Q08SvcCsbZuYubvWn2TjFc+1wP3y0ZN/T09Wc=;
        b=uhSsjEAaujbTLK1FCcGDztmVHBKGV/B93/j+1grH8C4bsZy/v69zJr0I8AaXaveD5t
         C9i3brP6m0NqZw69QBKPJJcNB3Rt3DsY7Jfdyos3iVyHi7bB0YcjcluegftP2s88EvsL
         k6/Wk84GJ2P+8cEVUKuto4Ef+HxEUils8c9WTDcSBVa0wnB4+ol6H1hEjQIxDZu4W2qM
         bpm612BV7AR9UpC7f+TqYOOZKj0q2IKxXyFDoiEk1tcje+nh4/1rPHO6xubrNRWpTH0+
         RyBLf9usUZMj2rzZT/CzhLr8wK3nITKt2IznnM89aqjxaapvW/i7PDg9eYtooyDYbHeY
         sBFA==
X-Gm-Message-State: AFqh2kot5BECttgCQ5snwnATj0rfg7rNC7CYXQ4oYNSqQXFPTLiDaEUs
	y7LvkM0euRuaxNVdB5S+lido4zCbU1StNg==
X-Google-Smtp-Source: AMrXdXuKJsssKYQZGG1a6j8CgNP5jqo01EA5oZfwNvf+zGppJqXdcfIRODn4g8mW/l7bKpcrT61YTg==
X-Received: by 2002:ac8:724d:0:b0:3a9:6fa7:8990 with SMTP id l13-20020ac8724d000000b003a96fa78990mr82158350qtp.31.1673018319640;
        Fri, 06 Jan 2023 07:18:39 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id d7-20020ac80607000000b003a7ec97c882sm629189qth.6.2023.01.06.07.18.38
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 07:18:39 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-4c15c4fc8ccso26742777b3.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Jan 2023 07:18:38 -0800 (PST)
X-Received: by 2002:a81:17ca:0:b0:46f:bd6:957d with SMTP id
 193-20020a8117ca000000b0046f0bd6957dmr4281773ywx.383.1673018318622; Fri, 06
 Jan 2023 07:18:38 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com>
 <20221227082932.798359-1-geert@linux-m68k.org> <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
 <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de> <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
In-Reply-To: <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jan 2023 16:18:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU8AKSdujbr=nwaBUy4q4z_R=MERnb5CBPPv=A63BVFXA@mail.gmail.com>
Message-ID: <CAMuHMdU8AKSdujbr=nwaBUy4q4z_R=MERnb5CBPPv=A63BVFXA@mail.gmail.com>
Subject: Re: Build regressions/improvements in v6.2-rc1
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
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
Cc: linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org, linux-wireless@vger.kernel.org, linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-f2fs-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 6, 2023 at 4:17 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi John,

Bummer, "Hi Adrian", ofc ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
