Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF5B58814E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 19:47:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ly2Vw5dnXz308b
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 03:47:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G1ZC9vkF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G1ZC9vkF;
	dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ly2VL4N0Hz2yjC
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Aug 2022 03:46:32 +1000 (AEST)
Received: by mail-io1-xd30.google.com with SMTP id v185so11166516ioe.11
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Aug 2022 10:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KjAZA+RBJyFCRVs3/+3jiKse67/26F8E/TlaG4k7TyI=;
        b=G1ZC9vkFJ4/eIUWgdyFRStYtBBwbb1Zif38+6Kd6XjFeJpq0EDYF5HEYZANxccxOAb
         HmDVHGEm41eETriohYDDkKfsfhiS1kgVPFbEY4rtweJ1QJ1w8sFeRIN71ItWO6BPmvwR
         8ySNPXjJA7WIgGsGRmXgKwdyXVub6MJulx221Nk9d5iPBQyqj6nT41qN3sjBcMtODkzh
         YVggKsNuk881EIvL8fVF0dABkRzDdp+uzsz7L1RfHwhrgeGxg09GhCRL77vLtcefM4Z1
         g8BDmDPc0IdBGSMtP/pcTI7F8/Li326UqJekszusX2sd2U1KdEOWLdx+003Nps6DRXrj
         M3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KjAZA+RBJyFCRVs3/+3jiKse67/26F8E/TlaG4k7TyI=;
        b=iZo26fxVacujZgNby0SLJU45VAN5T3PfIm3s8r7au1HNJYQDNPQ2zZPT7c8xcsPAzS
         lifeckcATSsS7PFgltgNX4pL7SBVQ6eSVSyBupWkZD+6+iWZ32snxBkf5/TLpy6hPh7M
         HHWUndLdaenp4I8T5QNgIknHRgnUcBGzKFzlv5yj8gb3i+z3+WpIr4b5r2KdmfEDCtEx
         LxxVULJr2mjy5DN+iXpc4AYtouaO9xsBuwoojv5M/sFM+rDN69GxeA26z2muM/zKxehr
         OptavWGN5S+6YFZeDbhoouwHSN7nFisZZPBJbuI3yIBe8+6o3XwAYU3WfAOZ7nP0/4la
         7Qmw==
X-Gm-Message-State: AJIora+OV3TbKNgHA71tFBu+14pUROFzgVcxHDaM4LD+rgmwzVrsAyM1
	+SvW1B/2laOER4b+uABw2yXeHsG0a0xLp1AnJ8Q=
X-Google-Smtp-Source: AGRyM1sTchBu9DJxxSaHL1GJ3B7rxsIGwFJokjusWYxkrpam9ZondCiC/NMBhmRLcxl3wlnfbZ37BaFnTFAFjGKVsvA=
X-Received: by 2002:a05:6638:25cb:b0:341:6546:1534 with SMTP id
 u11-20020a05663825cb00b0034165461534mr8585003jat.308.1659462388257; Tue, 02
 Aug 2022 10:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <YukYByl76DKqa+iD@casper.infradead.org>
 <CANiq72k7JKqq5-8Nqf3Q2r2t_sAffC8g86A+v8yBc=W-1--_Tg@mail.gmail.com>
 <YukuUtuXm/xPUuoP@casper.infradead.org> <CANiq72kgwssTSE7F+4xkRrXBGVgHeWxCyjeZ-NHLUXWnFjMyTg@mail.gmail.com>
In-Reply-To: <CANiq72kgwssTSE7F+4xkRrXBGVgHeWxCyjeZ-NHLUXWnFjMyTg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Aug 2022 19:46:17 +0200
Message-ID: <CANiq72=551t+CeiuCZz-SSx+uDaz238xjDFMRmkTwRuSFNcqmw@mail.gmail.com>
Subject: Re: [PATCH v8 00/31] Rust support
To: Matthew Wilcox <willy@infradead.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kbuild@vger.kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-gpio@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, live-patching@vger.kernel.org, linux-riscv@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 2, 2022 at 5:09 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Yeah, patch 17, exactly (patch 11 is the `alloc` import). I have asked
> Konstantin privately about them.

The patches are showing up now in lore -- not sure if it was just a
delay (which would be consistent with the lack of bounce) or somebody
did something (thank you if so!).

Cheers,
Miguel
