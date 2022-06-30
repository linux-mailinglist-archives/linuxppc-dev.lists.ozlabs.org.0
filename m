Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E545D562D2D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 09:55:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZ6vT5tT4z3dtb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 17:55:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google header.b=nELrPTLQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cloudflare.com (client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com; envelope-from=ignat@cloudflare.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google header.b=nELrPTLQ;
	dkim-atps=neutral
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYnTC4yb7z3c8p
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 04:50:22 +1000 (AEST)
Received: by mail-il1-x134.google.com with SMTP id h20so12962570ilj.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 11:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DU7Hgm+nVp1BIUlqpLH6JlGDiG0q5vZbfayRIvYvF6M=;
        b=nELrPTLQzZF251wnx3QqCqNgm0XR67sAmWCe8DzYq5q7MUKYvJX7dj+ezgLS7Qv83u
         4hrLL5SUmfy6W6Pl8x0j0sp5wU7aoRXC1W5j+JI+r0xbbQXNbxrX7hepRx10dKEaHUdd
         kvBZ8JddQB1nLzkheFHDDLfeOGrKgVjjogp94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DU7Hgm+nVp1BIUlqpLH6JlGDiG0q5vZbfayRIvYvF6M=;
        b=lQkTEZHt3tW9IHByvKFagt8fvHWmw8WW3dNvB0xZ0KcQLCM9XviUEKIwhJQaK4jXVZ
         obJjHjFHqj7S9HgAvukLUTeQfnogZphiHA+zl90BRVtSh7yI1Js8os9hVwPmKITbjD7+
         IQ0ZxzEGLP6JLpLTerItsZ6Omj4yl9TxEdrONJNj/PxwS45b1y/rkUm9u2D20n8iyano
         Lt+A6U1a+rXdrEI+z+SnuFMVA1clwbmdFRXgo0v4SsNGMrreFA7gio8dSp5OnuasXbFG
         2JYfwaiTVBjlB/40bqGzBULxJ9kfbpOh2rzPu00zATnE8JeYul8m7ydeOBzF+fEoIQ65
         oXuA==
X-Gm-Message-State: AJIora+wwv8VqQFlnbPzQ6ldLIC+KJgUPzpkHR8EcYSkfZWPJsWxX8gA
	AGZJCXGq1LZdfuCQycmQAyg4dlZ3mrJdzif3UiAKcQ==
X-Google-Smtp-Source: AGRyM1sg9w7X+FfJWoUYVR7lEmVXNrNLuIAr2Vcc3V5z4leUNdkyv5LtdsqVd9s7Dh5lzHmXkb3sL7+rq9RLqZZ2Yws=
X-Received: by 2002:a05:6e02:1a29:b0:2da:9310:a5fa with SMTP id
 g9-20020a056e021a2900b002da9310a5famr5833873ile.179.1656615019325; Thu, 30
 Jun 2022 11:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <74179C93-0D19-4A8A-81EB-07BD836A3BD3@linux.ibm.com>
In-Reply-To: <74179C93-0D19-4A8A-81EB-07BD836A3BD3@linux.ibm.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Thu, 30 Jun 2022 19:50:08 +0100
Message-ID: <CALrw=nF6EBFQCc8bn9A_Q0nz2O3TSJKsj=ErZUH37-EzLy-qmQ@mail.gmail.com>
Subject: Re: WARN at crypto/testmgr.c:5774 (next)
To: Sachin Sant <sachinp@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 01 Jul 2022 17:55:19 +1000
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-crypto <linux-crypto@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 30, 2022 at 7:11 PM Sachin Sant <sachinp@linux.ibm.com> wrote:
>
> Following warning is seen while booting recent -next kernel on IBM Power =
server.
>
> [    1.544420] ------------[ cut here ]------------
> [    1.544422] alg: self-tests for rsa-generic (rsa) failed (rc=3D-22)
> [    1.544429] WARNING: CPU: 18 PID: 512 at crypto/testmgr.c:5774 alg_tes=
t+0x42c/0x850
> [    1.544437] Modules linked in:
> [    1.544441] CPU: 18 PID: 512 Comm: cryptomgr_test Not tainted 5.19.0-r=
c4-next-20220627 #2
> [    1.544446] NIP:  c0000000006fa76c LR: c0000000006fa768 CTR: c00000000=
08552e0
> [    1.544448] REGS: c000000008a27980 TRAP: 0700   Not tainted  (5.19.0-r=
c4-next-20220627)
> [    1.544451] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 2800882=
2  XER: 20040005
> [    1.544458] CFAR: c000000000154114 IRQMASK: 0
> [    1.544458] GPR00: c0000000006fa768 c000000008a27c20 c000000002a8ff00 =
0000000000000035
> [    1.544458] GPR04: 00000000ffff7fff c000000008a279e0 c000000008a279d8 =
0000000000000000
> [    1.544458] GPR08: 00000000ffff7fff 0000000000000000 c0000000025c6ff8 =
c000000002947160
> [    1.544458] GPR12: 0000000000008000 c0000009afff3f00 c00000000018c6f8 =
c0000000070c5180
> [    1.544458] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [    1.544458] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
c000000000f1c230
> [    1.544458] GPR24: 0000000000000000 c00000000e679080 0000000000000400 =
ffffffffffffffff
> [    1.544458] GPR28: c00000000e679000 000000000000000d c000000002d814a8 =
ffffffffffffffea
> [    1.544491] NIP [c0000000006fa76c] alg_test+0x42c/0x850
> [    1.544495] LR [c0000000006fa768] alg_test+0x428/0x850
> [    1.544499] Call Trace:
> [    1.544500] [c000000008a27c20] [c0000000006fa768] alg_test+0x428/0x850=
 (unreliable)
> [    1.544505] [c000000008a27d90] [c0000000006f8df0] cryptomgr_test+0x40/=
0x70
> [    1.544510] [c000000008a27dc0] [c00000000018c814] kthread+0x124/0x130
> [    1.544514] [c000000008a27e10] [c00000000000cdf4] ret_from_kernel_thre=
ad+0x5c/0x64
> [    1.544518] Instruction dump:
> [    1.544520] 409e02e0 3d22002f 892915d1 2f890000 409e02d0 3c62fe77 7f25=
cb78 7f84e378
> [    1.544526] 7fe6fb78 3863ac78 4ba59949 60000000 <0fe00000> fa2100f8 fa=
410100 fa610108
> [    1.544532] ---[ end trace 0000000000000000 ]=E2=80=94
>
> Git bisect points to the following patch.
>
> # git bisect bad
> f145d411a67efacc0731fc3f9c7b2d89fb62523a is the first bad commit
> commit f145d411a67efacc0731fc3f9c7b2d89fb62523a
>     crypto: rsa - implement Chinese Remainder Theorem for faster private =
key operations
>
> Reverting the patch helps avoid this boot time warning.
>
> - Sachin

Thanks for the report. I've already submitted a follow up patch:
https://patchwork.kernel.org/project/linux-crypto/patch/20220630140506.904-=
1-ignat@cloudflare.com/

Ignat
