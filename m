Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 260EC7160E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 15:00:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVsv55lkMz3fCH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 23:00:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OmrsvIF7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OmrsvIF7;
	dkim-atps=neutral
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVst96B2zz3c8r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 22:59:29 +1000 (AEST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-568ba7abc11so15485727b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 05:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685451566; x=1688043566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUns/AgpqXLAWkbT9nsAikv8VufNiDnQgvXLGdGlTyQ=;
        b=OmrsvIF7hVLwpUuwLixBRJ6u4vsZnI03aBYhM18P6OCXa/SkjvHSiOjWX6yU2Q+gVi
         hZSYPF3eITVKkYItFYr40i+B779YjeABUR1SkuuWHeOyReu71Ytc8ggaIRkhc0xEM/if
         4VJTLo1GjdIk59fADOfd1uFtp0DXUobZ2kIb1rsy+zJyeHL48aoL2Dy+fG3jFt9R0ldN
         gGySuiRHmb2P+Bx+5K/TX2xeZ4KYSiIdtYy3pIyxAJoOuZwR1vFnfswavB3CyexFxUMO
         CyvNnOx/Od3r2WXffSaYZum9hThqDE6T/s2Pvq0DSbvGqtj9N+4juL1VKBfGT3Tq++hv
         89oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685451566; x=1688043566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUns/AgpqXLAWkbT9nsAikv8VufNiDnQgvXLGdGlTyQ=;
        b=IEg4WCmAXM9DVwZ7aRIrUr8HsIvvBb0tFqu1jkT7TXBaoNvNJCPZ0JcA4OnqHflyzt
         O93fQZok0z1H3JnBYIEig8VoWCt4Nj8iun8a4EyTUa7pG6etRhGPsfGvdUgbZ3sWWSsM
         IM8cYxTC2L6aOOzUSafrZ4KYCn2944vG8/HKqHVRVEFMWjPVnRJ+Nv8KPCDB3ZH/pohB
         blo7UVHj4Sf7+PUPHNLzWzCx0MP+swjlCQqeLSdQHWwWS0FYv08164m9fEiB9TAnpZWZ
         R94V+5XTJQirQKR7aQxY07FYXctpTpsJaS7R9EO+tILAjNyemRaoCM3sCpfK4RC1NxoE
         LIsw==
X-Gm-Message-State: AC+VfDy0TVQ7QSCxa7BAcWqQZ76ePvkS+oHzm28vYGNkI0Xa3nNXAw3w
	o2Mf67yCaRKbS4wGDi3gpqvR4AnZ0NFT368Nla0=
X-Google-Smtp-Source: ACHHUZ6l4t9i22MSzrt5nsSF4hfAMZMoK5+1PsXBAafqc9KsjE9oyqW1VOx7h4r+3WcISyPpe5m4/tw+5ClF2mWU1os=
X-Received: by 2002:a0d:d413:0:b0:565:97ee:dd78 with SMTP id
 w19-20020a0dd413000000b0056597eedd78mr2289332ywd.28.1685451566435; Tue, 30
 May 2023 05:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230529111350epcas5p46a1fa16ffb2a39008c26d03c5c63f109@epcas5p4.samsung.com>
 <20230529111337.352990-1-maninder1.s@samsung.com>
In-Reply-To: <20230529111337.352990-1-maninder1.s@samsung.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 May 2023 14:59:15 +0200
Message-ID: <CANiq72nTqbof=SThq-PRhz=ks2WRvdUXBzJoesyXUmB2KB5pmA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hexagon/traps.c: use KSYM_NAME_LEN in array size
To: Maninder Singh <maninder1.s@samsung.com>
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
Cc: nathanl@linux.ibm.com, bcain@quicinc.com, keescook@chromium.org, gary@garyguo.net, pmladek@suse.com, ustavoars@kernel.org, linux-kernel@vger.kernel.org, Onkarnath <onkarnath.1@samsung.com>, wedsonaf@google.com, npiggin@gmail.com, alex.gaynor@gmail.com, linux-hexagon@vger.kernel.org, ojeda@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 29, 2023 at 1:14=E2=80=AFPM Maninder Singh <maninder1.s@samsung=
.com> wrote:
>
> kallsyms_lookup which in turn calls for kallsyms_lookup_buildid()
> writes on index "KSYM_NAME_LEN - 1".
>
> Thus array size should be KSYM_NAME_LEN.
>
> for hexagon it was defined as "128" directly.
> and commit '61968dbc2d5d' changed define value to 512,
> So both were missed to update with new size.
>
> Fixes: 61968dbc2d5d ("kallsyms: increase maximum kernel symbol length to =
512")
>
> Co-developed-by: Onkarnath <onkarnath.1@samsung.com>
> Signed-off-by: Onkarnath <onkarnath.1@samsung.com>
> Signed-off-by: Maninder Singh <maninder1.s@samsung.com>

With the updated commit hash:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
