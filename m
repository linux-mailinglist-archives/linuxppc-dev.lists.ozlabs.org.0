Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC3B779961
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 23:26:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=yp3x6i43;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMxgW448yz3c8L
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 07:26:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=yp3x6i43;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=justinstitt@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMxff3Pmbz2xdt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Aug 2023 07:25:45 +1000 (AEST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so7223269a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 14:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691789138; x=1692393938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86JGYZ3ry5mveviksjcn/qEvMtmvc4Ix/xUvNeLXEDs=;
        b=yp3x6i43BD8RlV322qJmJKCChEAV4UH5GzYm+QKTIbEfh7XUtrsq+1zAx0sNg+t1d+
         5Wdx8+yD9PcpjFm6EwHkertYyul98NZdT7eMM1xpNAGQvsovbk+87Q0wdMIbXOqYfONq
         6YuGbb337lL0MnSOZ+zkCGkXtOM0YWf5KDk6wCBq61CXXtdyV10ODW7oScEWFrfKV1Fb
         gHshtevWMATpYNZmgU73KijInvpPplIazRtamhNz+s/hZNupYZjFG3dKpshD04LAQR3b
         +hhD59qaxfiKGmC3EzhWXafo2eDdjNVkhYcLndoGmpPabWfR4zaRjXU/jERrCpyxvtNP
         At1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691789138; x=1692393938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86JGYZ3ry5mveviksjcn/qEvMtmvc4Ix/xUvNeLXEDs=;
        b=HmQpfq8iBy6zkmlseRry/SPDf2B1CG49G5HbmPGaFSqM4UhtPzuiE4UsciVrNAs6Uj
         DXRNs04T2MWjE9b0mz6RGoIjjUcEhxzenWKYH8cHEolSC4BB2+JvKwRJ/mS293dx+89e
         EonoCuN/ueioysPErDaC4axz4JZXwWoXwO3Dmdo+DKakJ4omlazABQ5RD8JQG8BkUYhc
         olzcdDOiLlCqpgznODSddMPOE7+JvFboquq0Pktlv3qQY/yXdjNf8peVdbjulZI8uiLl
         ofjCt9MRrAQZm5tajFQxABZOzyufX00MbQBoBrCidxL9ZQPBRdZfhXSooWXKZfvCGXHJ
         sxKA==
X-Gm-Message-State: AOJu0Yy1vHSN0Vx3a/B+7MiTBWqj76x2H7nFdnijMNy/uSPuDIoIEOkP
	xhBGJX+0VyOmMUS87Dp7Z8WYH/QiI46kBCTyfdT0ng==
X-Google-Smtp-Source: AGHT+IHsxCBP/w9r5NRNaDnfZRytZV75kWryG4q6b+1hs+BKKLWWPj716c7QrOT8uP1DUmE3xa+OcLdt4WGWk5ajISA=
X-Received: by 2002:a05:6402:268e:b0:523:72fe:a3c4 with SMTP id
 w14-20020a056402268e00b0052372fea3c4mr7852202edd.0.1691789138513; Fri, 11 Aug
 2023 14:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230811-strncpy-arch-powerpc-platforms-ps3-v1-0-301052a5663e@google.com>
In-Reply-To: <20230811-strncpy-arch-powerpc-platforms-ps3-v1-0-301052a5663e@google.com>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 11 Aug 2023 14:25:26 -0700
Message-ID: <CAFhGd8oZLTaFNg3pQSi=zX121HPfY9_v-H5e3_+27W3=1fXxmw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] powerpc/ps3: refactor strncpy usage
To: Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 11, 2023 at 2:19=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> Within this RFC-series I want to get some comments on two ideas that I
> have for refactoring the current `strncpy` usage in repository.c.
>
> When looking at `make_first_field` we see a u64 is being used to store
> up to 8 bytes from a literal string. This is slightly suspect to me but
> it works? In regards to `strncpy` here, it makes the code needlessly
> complex imo.
>
> Please see my two ideas to change this and let me know if any other
> approaches are more reasonable.
>
> Link: https://github.com/KSPP/linux/issues/90
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Justin Stitt (3):
>       [RFC] powerpc/ps3: refactor strncpy usage attempt 1
>       [RFC] powerpc/ps3: refactor strncpy usage attempt 2
>       [RFC] powerpc/ps3: refactor strncpy usage attempt 2.5
Errhm, It looks like the diffs after attempt 1 came out poorly and
probably won't apply cleanly because they were inter-diffed with the
first patch. Is there a way to let b4 know I wanted each patch diff'd
against the same SHA and not each other sequentially?

As it stands only attempt 1 is readable.

>
>  arch/powerpc/platforms/ps3/repository.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> ---
> base-commit: 52a93d39b17dc7eb98b6aa3edb93943248e03b2f
> change-id: 20230811-strncpy-arch-powerpc-platforms-ps3-57a1cdb2ad9b
>
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
>
