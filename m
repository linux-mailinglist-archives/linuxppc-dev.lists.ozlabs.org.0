Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B37966EF78E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 17:12:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q62Rd4kyvz3cd5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Apr 2023 01:12:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=bwX4miFR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=bwX4miFR;
	dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q62Qn5Q4Pz3cJn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Apr 2023 01:11:59 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-50685f1b6e0so13308731a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 08:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1682521914; x=1685113914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmC9nRWhCF4aaeCIyz66s4SOgTxfjI81zZTS4rdYWbY=;
        b=bwX4miFRRprB+mJzIfVaJpTIH38OZzi9g/R51mJL4cAXkaHB4QMP5njOkchWUA7kcb
         rTFbQdId0oqOhRilY0pc+3KT5LKUqFiI61kATr/w1D7/qhlyeiPxrQu6EKMx+esgLkkQ
         Q8DR3XoKbQ4CzuSdbNcJ8VLqAq3I4RWK+24Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682521914; x=1685113914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmC9nRWhCF4aaeCIyz66s4SOgTxfjI81zZTS4rdYWbY=;
        b=JJaFtUvJOAdA1hF2o13TkCdrOmo7cSzXV5RkMlYQTKCX+hNOk6KL7bTBo30yoY1EuQ
         AG+u3gnZEmrgEcEEx5BPPKUBYzzvCcZo6tk3viHuBuDmX0PaQ/1VCniRBBkPMzCD3u7b
         5oxTj9iaVHliPypwYUPQ+zoX3esfi02d5zW3HG+e41ot8UUrZdR1uLOBysrb+T/dFTem
         cTBCTOVedqw20VZu2Z++ipK5hKuHZ0sEgFgvUeXtPo6//F8jM8tsa23nB700ce0E4OQf
         edMkRuz8JEq/0olG/aQ5fO4ofkbr90i5435sdIrzgFs+45mZMDb43oPpxVIfbgZWIDH4
         Qanw==
X-Gm-Message-State: AC+VfDxh6es31iRg+brr1KpUp2eSqooWzbFQdPc6mFSppPwhzomiuiI0
	i0jXryIZd+0IKdCmFFc4ze8hKNg2cHyYgg09EMIyeg==
X-Google-Smtp-Source: ACHHUZ5P6rM3ZmrfLz7UDtuKxroriY8TKkGeNhO/f9JTFfGIa/PGimBvwU+69kOga5UD8eAOMQBBkA==
X-Received: by 2002:a17:906:94a:b0:95e:d448:477 with SMTP id j10-20020a170906094a00b0095ed4480477mr3432009ejd.33.1682521914312;
        Wed, 26 Apr 2023 08:11:54 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id gx22-20020a1709068a5600b0094f4b7e2dc5sm8448058ejc.142.2023.04.26.08.11.53
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 08:11:53 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-508418b6d59so13304025a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 08:11:53 -0700 (PDT)
X-Received: by 2002:a17:906:38c9:b0:906:3373:cfe9 with SMTP id
 r9-20020a17090638c900b009063373cfe9mr17150061ejd.10.1682521913403; Wed, 26
 Apr 2023 08:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230426055848.402993-1-npiggin@gmail.com> <20230426055848.402993-6-npiggin@gmail.com>
In-Reply-To: <20230426055848.402993-6-npiggin@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Apr 2023 08:11:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjdYKfVrv_r1BNee+GvtaF0aRqbsv3Dw9SM5-+rUf8dpw@mail.gmail.com>
Message-ID: <CAHk-=wjdYKfVrv_r1BNee+GvtaF0aRqbsv3Dw9SM5-+rUf8dpw@mail.gmail.com>
Subject: Re: [PATCH 5/9] powerpc/boot: Separate BOOTCFLAGS from BOOTASFLAGS
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 25, 2023 at 10:59=E2=80=AFPM Nicholas Piggin <npiggin@gmail.com=
> wrote:
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>

I was all "what is Nick talking about", and had to follow the link to
remember that old discussion at all.

Patch obviously looks fine to me, I'll presumably be getting it at
some future point as part of a ppc pull request.

              Linus
