Return-Path: <linuxppc-dev+bounces-516-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8C895EAB7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 09:42:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsjMF5Fh7z2yPd;
	Mon, 26 Aug 2024 17:42:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724658169;
	cv=none; b=JC98JurVcA2CitZhrG7K5dzAaOU5s8tfK4fYe/EIu+VIDuek+US+I7KSlpBcYN7Yh12MuWg7YTNgXo7CWCiBGMVjO+FBj3LXYiR6GyPI4xOFOvfSKxxfY7F62jpG2ZAE48+LNFh0iyPnqhu6nBf929dkpxCTMgk5hs/cwJyKnHoXv8WgRxerTjoinS8Blu7EO7XOhhXEZSKnGY/WmZL1mPfKTeF9X3UmNwKd8DzOGxi2kcCA0IscOrjvJm6rJoKzoqTL7Vc0nqDQOGLGga6MCjYiJj2KEdH5+USMpIyxcW1fcNhBM123M21ujr3+MKA11Q6XXJMS8nH/hKuh/WdHTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724658169; c=relaxed/relaxed;
	bh=Q8r11L3gA7W1DQC1zgQUSI+mUJHSNIyLCjbXmmaIRvc=;
	h=Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Google-Smtp-Source:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding; b=EkNIIBEwJtYqKbTWmzGptQ8e4v0xeBnpKoB16Hmr/iU2Ug2BE+tEOb0ZvW933vmEEnESLn9uVF+tJtas4/V9hDkas7ELpaBF+cAFJLQLFGuyaFRCPuy7iZHedGN0O/P2XvENG5OVGiVstBSk6fBKLCdRs1r0bg1DswzBlnL8vWRnqGEwaAkuuN7uGld6ST8Oqt0LaNayC2SYCCK48rrD5XRSRi16k4bD3bcALz3zZwMiOrxsiUr0i5uZM5HbDhtrZLJF7ZWJhdDWjx6USh2LxJ9UVTphmJekrUuk1lYfAEhFMKrDXH6fUlohAOAvSBnAh0k6krja5OcwMZ+vhAVV4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.128.180; helo=mail-yw1-f180.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.180; helo=mail-yw1-f180.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsjMD2j96z2yNn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 17:42:47 +1000 (AEST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6b47ff8a59aso32988977b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 00:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724658164; x=1725262964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8r11L3gA7W1DQC1zgQUSI+mUJHSNIyLCjbXmmaIRvc=;
        b=vCtbk0JNWU0Mv4Ji3rVCnfxHXa0yvM/MXNz2QiXxqtjurVgGzT6zPnWZtw+iPFycmh
         Mie0W9lrxx7VRsuF0/vIirCKQKGhWFh9JCJIIGBaR/DCGz5MYg7s9HINfEVcSiR46GdB
         ETOt7CxiEVFJgln+bBv8x9+ZoCYqzUBFcjEh1z9z77BqAIEZSA2fzptRcoVDqjfRutsJ
         faytMq8rw18pdpwhu22uk4EBbpsPf9tK7Ehmuzpb85UTQSZRyZW8jTF9UmV4DE5d6a/t
         OzT8XS6pTB1rkYFECbIT3p6sRpLU7IxgCyEAnAK3NhgXKR1VAapBLrIRdxyFiFG9gSoE
         ZmVg==
X-Gm-Message-State: AOJu0Yyznz1q43SB0M6jggC6YhnC2RsVhKug8J4Tu/nsr/UVe8Y/SZT9
	/52TDDDu84CRsL0PuPFSm6m11nzKulp8KquVxCMf5BPlNuT0mwkVGYp34pXK
X-Google-Smtp-Source: AGHT+IFAmU5xeAbwYxJ3d2/z8nIX6GpPFNCHhLIZhFxOrx0N9bd557jfW+MX3hiykAxni5YOOQ/PbQ==
X-Received: by 2002:a05:690c:fd0:b0:65f:a0e5:8324 with SMTP id 00721157ae682-6c6244190f1mr97645487b3.4.1724658164180;
        Mon, 26 Aug 2024 00:42:44 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39df360dbsm14414787b3.112.2024.08.26.00.42.44
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 00:42:44 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e05f25fb96eso4063535276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 00:42:44 -0700 (PDT)
X-Received: by 2002:a05:690c:605:b0:62c:c684:b1e1 with SMTP id
 00721157ae682-6ce868cb3b2mr15209867b3.29.1724658163749; Mon, 26 Aug 2024
 00:42:43 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240821082101.877438-1-mpe@ellerman.id.au>
In-Reply-To: <20240821082101.877438-1-mpe@ellerman.id.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 09:42:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRmEewx3XrwJT=5yPRskJpup5Qxu0U7336r_6pJYsMvA@mail.gmail.com>
Message-ID: <CAMuHMdWRmEewx3XrwJT=5yPRskJpup5Qxu0U7336r_6pJYsMvA@mail.gmail.com>
Subject: Re: [PATCH] macintosh/via-pmu: register_pmu_pm_ops() can be __init
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 10:21=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.=
au> wrote:
> register_pmu_pm_ops() is only called at init time, via
> device_initcall(), so can be marked __init. The driver can't be built as
> a module.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

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

