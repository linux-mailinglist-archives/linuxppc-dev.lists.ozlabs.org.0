Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C0478D590
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 13:35:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UFbSR3+T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbMfj44Mkz3c3x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 21:35:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UFbSR3+T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbMdp46XQz2yVh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 21:34:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2195A62A44
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 11:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5BAC433CC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 11:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693395273;
	bh=8PWPyT185nAtNOY9ZfIuQmYypEHvEnAKXob/fzJFzmU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UFbSR3+TrzjNWYwzynS+zz3AR+ROQkYYb8Jc1Y3bhCI9RN14hL/dH0F7/VtbK/2sd
	 nHJ9bzuvjxVaFEPH82m7v9FlnhBCfRob3tlO07d2X5eK1wQqxLxTmbenus8BSKxe5v
	 lXi8V++xXhIAW0v381yj8wDgiMu2o9AuQE/wMwXFmMLIo4N0Shf2xyriNS3mquojQ4
	 hivIeh4RBAP7sSL1+gU4F6vURm+zhixSZcW22i3G9LgKv6XQ4asQvHmVgX8v6BLL+z
	 hGTeSQXJGbLUViQ2bW6BbibUcjPyz/jd+ylMS/csxK6gsPw0x9Aos8OP4tosjJFP7x
	 OZAFbwz2RLmtg==
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a9b41ffe12so3296955b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 04:34:32 -0700 (PDT)
X-Gm-Message-State: AOJu0YyHDTVcTisLFE8gG99UnJBUygxRz9HdKki/cUTghQweqUKoCA+L
	+M7ZW+rjeDgRFKfGmq+TUCwPmYQQY+IMAbPRXcI=
X-Google-Smtp-Source: AGHT+IGGq5Rqco8PApfnoN6MY05uD7oJkUFoXYsw6ftS35VEXOIjGOHW2RlK6KWUSGFFkiYpsLeyv5+GV14iOu/km8A=
X-Received: by 2002:a05:6808:a09:b0:3a8:1012:89d6 with SMTP id
 n9-20020a0568080a0900b003a8101289d6mr1682501oij.34.1693395272281; Wed, 30 Aug
 2023 04:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230829113531.4004730-1-masahiroy@kernel.org> <ZO3d7DrfKfsDXqa5@bergen.fjasle.eu>
In-Reply-To: <ZO3d7DrfKfsDXqa5@bergen.fjasle.eu>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 30 Aug 2023 20:33:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNATvUo7gKFG9NjtJarTBM508ntf2v6yo5tXsmDoMcUrJVA@mail.gmail.com>
Message-ID: <CAK7LNATvUo7gKFG9NjtJarTBM508ntf2v6yo5tXsmDoMcUrJVA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: single-quote the format string of printf
To: Nicolas Schier <nicolas@fjasle.eu>
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
Cc: linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 30, 2023 at 10:00=E2=80=AFAM Nicolas Schier <nicolas@fjasle.eu>=
 wrote:
>
> On Tue 29 Aug 2023 20:35:31 GMT, Masahiro Yamada wrote:
> > Use single-quotes to avoid escape sequences (\\n).
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
>
> Is this really necessary?  Testing w/ GNU Make 4.3, bash 5.2.15 or
> dash 0.5.12-6 and a stupid Makefile snippet I cannot see any difference
> between these three:
>
> print:
>         @printf "hello med single-backslash and double quotes\n"
>         @printf 'hello med single-backslash and single quotes\n'
>         @printf "hello med double-backslash and double quotes\\n"
>
> Only double-backslash+n in single-quotes does not work, for obvious
> reasons.


You are right.

I was misunderstanding the backslash-escaping in double-quotes.

I always used single-quotes when I wanted to avoid
escape sequences.

The following POSIX spec applies here:


  2.2.3 Double-Quotes

  The <backslash> shall retain its special meaning as an escape character
  (see Escape Character (Backslash)) only when followed by one of the
  following characters when considered special:

  $   `   "   \   <newline>




https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html


All of "\\n", "\n", '\n' are the same.



--=20
Best Regards
Masahiro Yamada
