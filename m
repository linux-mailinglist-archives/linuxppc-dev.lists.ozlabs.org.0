Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEE3591D59
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 02:47:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M4zK83r3hz3c6b
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 10:47:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=P41/CsUx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=P41/CsUx;
	dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M4zJT44BYz2xGR
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Aug 2022 10:47:03 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id i14so7913212ejg.6
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Aug 2022 17:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=x2TJWb9VPxfS4WbEMgi+9muxipCHahNie+FBh69toFk=;
        b=P41/CsUxUsIATZkpcMv7hdU0X8HMf8UCtVaJc7H8Q8F2QNKlOWLaIFBPC6yPc3vg1i
         a7Uk1CF19oMNKx3AYrY2X8JAB2w5R3MtuWbQzl3X+6aEhHMXM1ZVZ0UOwc/mpV4JX1jb
         YmsL38vP2Ozuut9ebAJlYTOg4L4aWsVdFPa1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=x2TJWb9VPxfS4WbEMgi+9muxipCHahNie+FBh69toFk=;
        b=h3/gWprJdU0Q1KEtauXmIFWqXnrD+KKTOKGZaZey3d4NmtmfEatUrAokArKE2qShkh
         aoG7N4oVenWdwUTVIYMfPnZAzLksnPYcBt38Tc0+aMX2JK2Br+XjfCltWrjcHW3kbc/9
         0StiOGQQ4WpinNKE2ArnUn9N+DyBEKX42Lzp1UNQX32dQ+cahDrAxU2AuxyKNmQHpVCt
         38lme6YvB9gv0LfXRI/q+bkpsBobMzCc8jxHovdRGhspR1vvGZOtHtdOSyui6y32DS5N
         a+invXF0RJu75e7wd7LL4vwde+Q8eIrRl9r6kEbAWvUpw71W5cp1XpbgWels5ubN5Ssq
         ZnlQ==
X-Gm-Message-State: ACgBeo2jNn8g1N9JG/EpZHkniHig+pM/sTTHnTM7T+7CGmN8dLIA5a0f
	szE4aiyj0PA9C1N6kgnPomOE7LPyd9VeqqnC
X-Google-Smtp-Source: AA6agR69G7VsYCqKZNPdt74bsQpk9cS+X8wU4EBjRtiCh52cvEgA6Sd3PBKk5I8gpM/3j3xeRmzWVQ==
X-Received: by 2002:a17:906:4fd6:b0:70c:9284:cc01 with SMTP id i22-20020a1709064fd600b0070c9284cc01mr6631767ejw.553.1660438014274;
        Sat, 13 Aug 2022 17:46:54 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709060ec900b0072ed9efc9dfsm2436837eji.48.2022.08.13.17.46.53
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Aug 2022 17:46:53 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id e27so363268wra.11
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Aug 2022 17:46:53 -0700 (PDT)
X-Received: by 2002:a5d:638b:0:b0:220:6e1a:8794 with SMTP id
 p11-20020a5d638b000000b002206e1a8794mr5340552wru.193.1660438013290; Sat, 13
 Aug 2022 17:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <87czd3d8ra.fsf@mpe.ellerman.id.au>
In-Reply-To: <87czd3d8ra.fsf@mpe.ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 13 Aug 2022 17:46:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiLWWteYdVgXuLv9TA3aGsUaKV8gS3WxBo+NHHn5ZHkPw@mail.gmail.com>
Message-ID: <CAHk-=wiLWWteYdVgXuLv9TA3aGsUaKV8gS3WxBo+NHHn5ZHkPw@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.0-2 tag
To: mpe@ellerman.id.au
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
Cc: ndesaulniers@google.com, linux-kernel@vger.kernel.org, naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 13, 2022 at 4:27 PM <mpe@ellerman.id.au> wrote:
> [..]

Btw, could you please fix whatever your email setup is, so that you
have a proper name?

Seeing that 'mpe' as a source in my inbox just makes me think it's
spam and not real mail.

My search for "git pull" will find it, so it's not a huge problem in
practice, it's more of a "what is that garbage in my inbox - ooh, it's
Michael Ellerman's badly configured email again"

               Linus
