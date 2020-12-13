Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB142D9041
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Dec 2020 20:42:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvFL50lsxzDqSG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 06:42:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvFG42ws7zDqRR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 06:39:21 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id a109so13672200otc.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Dec 2020 11:39:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9CtsVDwoNbPTm3v5e+HpA6cbwiDsDEPWbKL4B1oehZc=;
 b=EueKIyLJzlW/Dep0Xkoirj0DLctrPbVZ1ZUnUfAY9NyS/HVAM9ouT4lloaLObt71yp
 OwIbbIIbyZc9/tx3A5cy8Or3NAljTw3W9fE8NRw8dP+a8apA2XVJ93vi+pIl6YRsGOYE
 j2UyOkNy/oEjJtPREp5Me3OIu6VMxKydlnYhEmk59/ZK9l19lv/NWefOC8GVJxgJyGnL
 LDjtgrUHwmil6Uwt1YDr4oALu/rAfmJTMZ49qzNWG52BmjOcXu34EWarOcXStV1J2lCQ
 dmfCpIMskCNkhMUYGQR5iDEuOMp6ubizyGwYa9U8TA+LkynNhJMr3eCuU+fjIL1zNKK6
 88IA==
X-Gm-Message-State: AOAM531ISR3PDuJObI/cgYTGOaAVrt87OVumi2Wme4XHqSuqhpfGe6zh
 +JV95BDINdRk1ZPatF1uhSzWFysSPKZKxGqr/cU=
X-Google-Smtp-Source: ABdhPJwC4wvQQzNa66xLyDbpxyVUlVclWiUrLQIUV9Yw9yMKCbEGzT4yJtkd0MM8nhOTjUfp24qRgmJ/l4peJF8rnLo=
X-Received: by 2002:a05:6830:210a:: with SMTP id
 i10mr17149997otc.145.1607888359063; 
 Sun, 13 Dec 2020 11:39:19 -0800 (PST)
MIME-Version: 1.0
References: <20201213182622.23047-1-vincent.stehle@laposte.net>
In-Reply-To: <20201213182622.23047-1-vincent.stehle@laposte.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 13 Dec 2020 20:39:07 +0100
Message-ID: <CAMuHMdXphVnZneudRR48+asCSGzXDVvBxaAQCtrZ3P-cEGHz4w@mail.gmail.com>
Subject: Re: [PATCH] powerpc/ps3: use dma_mapping_error()
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>
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
Cc: Geoff Levand <geoff@infradead.org>,
 Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Dec 13, 2020 at 8:06 PM Vincent Stehl=C3=A9
<vincent.stehle@laposte.net> wrote:
> The DMA address returned by dma_map_single() should be checked with
> dma_mapping_error(). Fix the ps3stor_setup() function accordingly.
>
> Fixes: 80071802cb9c ("[POWERPC] PS3: Storage Driver Core")
> Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@laposte.net>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
