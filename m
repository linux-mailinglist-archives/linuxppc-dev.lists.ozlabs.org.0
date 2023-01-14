Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC9866AB30
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 12:30:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NvGKg34SDz3fCv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 22:29:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a+9Pq8xg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=sedat.dilek@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a+9Pq8xg;
	dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NvGJm3lX4z3bTK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 22:29:11 +1100 (AEDT)
Received: by mail-lj1-x22c.google.com with SMTP id q2so25011470ljp.6
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 03:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J454pkV9x088Xk1LCtd7Klprj/qr0Ti1c3F79rejMvw=;
        b=a+9Pq8xgGNN7sQ06zWv9LJoR0UbAKyfbeGHm5UwJ5hari93Mm5bs07UMpUA/dJFXKl
         b9Delo3UYvChotwZibmVoSpUpwjR0ykLPn/FZIILUxG0S/Jquv2rThKFVdB8++LYkjXL
         jmEYA2m94sFh2JOVAc2+S4aMyWK+9mMi0VkmQfcjXac7gIc27Qs6YRYBicitHqaSzDhP
         qix7FBcITeRhB1a7eDYnpZuh9OGD0Q3PaiHSyqZdOH8uzPkS3EQgsi1Ray99ud1PFhnm
         nNtQDPaHCtSJvie5MNJGGVVb22b8MpHDSWw+KrEISI9D3Rc8ra0wNmJTydpsebjE+4Ts
         tPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J454pkV9x088Xk1LCtd7Klprj/qr0Ti1c3F79rejMvw=;
        b=Uq3U4mBR/jWeUpBNj7IskDwVuvVY/2hQx8nrzWbiwqD/IPHUJVUDsEhWpGUxUEJHuk
         6led9rJ+PQU30BeOU/ynoxN3Y2sderiuryzATAXAYAeorFByOTkgZ+gtjK5KnuOEnwk6
         acwZUYHgLMswE7EO1I2VaiNW7HFntaaLPSHDD9RUPobe3SF0RlaJ+JbtmH4+nxp5lTzM
         TZKf8qUSxrwGWEqCSPcIORDccnCUJ7RQciHdwthc7P1aQrKPKHHpCm6sT3lHPlstLJGl
         YX/WmNEOmExSPBREPzUu/qHWysy58oA5F7Cs/c7ReCFg0xG2lGW+lZBCoj45XOcJXsaf
         1UxA==
X-Gm-Message-State: AFqh2krb2d+W+SrNGcTlGUmda8Vj6JPbN7e47fM74C6Kiz8hJL5uYb7V
	v/BKXRjXXxeKP8jppvx4PMHwziQ+77qNxkujUAA=
X-Google-Smtp-Source: AMrXdXt9P26wU2KaxUPQ7u+dDkaFi/gJPVRtrNjzK7YwvRjaDioXiMHSHfoocsW+UWn//GyhRRT335zTz6XSa5pIu+o=
X-Received: by 2002:a05:651c:179e:b0:27f:eef3:921d with SMTP id
 bn30-20020a05651c179e00b0027feef3921dmr4234301ljb.515.1673695747727; Sat, 14
 Jan 2023 03:29:07 -0800 (PST)
MIME-Version: 1.0
References: <CAMj1kXEqbMEcrKYzz2-huLPMnotPoxFY8adyH=Xb4Ex8o98x-w@mail.gmail.com>
 <db6937a1-e817-2d7b-0062-9aff012bb3e8@physik.fu-berlin.de>
 <CAMj1kXEtTuaNFiKWn3cJngR0J2vr0G07HR6+5PBodtr1b7vNxg@mail.gmail.com> <CA+icZUXEz7ZxmkV5bw5O2ORjF4bwDXBMyj3Wk_HST98gMPt97g@mail.gmail.com>
In-Reply-To: <CA+icZUXEz7ZxmkV5bw5O2ORjF4bwDXBMyj3Wk_HST98gMPt97g@mail.gmail.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 14 Jan 2023 12:28:30 +0100
Message-ID: <CA+icZUUhY7-F5Bpw-jxofhw4nMP3nzyfpt9huzeSWwUguguNsA@mail.gmail.com>
Subject: Re: ia64 removal (was: Re: lockref scalability on x86-64 vs cpu_relax)
To: Ard Biesheuvel <ardb@kernel.org>
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
Reply-To: sedat.dilek@gmail.com
Cc: linux-arch <linux-arch@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Luck, Tony" <tony.luck@intel.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Jan Glauber <jan.glauber@gmail.com>, "Torvalds, Linus" <torvalds@linux-foundation.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ ... ]

> Best is to ask the Debian release-team or (if there exist) maintainers
> or responsibles for the IA64 port - which is an ***unofficial*** port.
>

Here we go:

https://lists.debian.org/debian-ia64/

Posting address: debian-ia64@lists.debian.org

Found via <https://lists.debian.org/completeindex.html>

-Sedat-
