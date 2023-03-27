Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3676C9AE5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 07:38:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlM7G03fVz3fTZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 16:38:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WU8U3lYr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WU8U3lYr;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlM6306DWz3f53
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 16:37:46 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso10706810pjb.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 22:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679895465;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frRkG9EFesbSFyKUiG2SU+/T/4pUUQR9yjunJGxY6E0=;
        b=WU8U3lYrmz7ghd1rtctKxA3h2tqXDIpBzJquQZEslXwxa/Td5JGikQWfuAfwYx/7EX
         0/BOQ1ZXqaTNF0/2P1oRn9VGLY9iLHXKUpgn8enR9GR1Iys6STXJRUKSX0pYjMzStK4Z
         izpnPvYJ+uoeuTfmF6EXDiX7XMjOI7cPCGhjDSM/jE6srq4PMQDZX2FrCqJMvT+YLzBe
         dxybcc0qAReRcQbV8Cbi/1uT5ZDU1GQUBQ77fmtiRMfbTE2+0jQhbpchUMEF9tZW8gAG
         NZE1cbS7b0nXt3Gp9PaRxGwVr9Y2OuAiQTeZSaJxZVL2C23XEf+hXbYz9Q1M8h8s9/VL
         Z4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679895465;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=frRkG9EFesbSFyKUiG2SU+/T/4pUUQR9yjunJGxY6E0=;
        b=ruE7wxGzHIQP5KZUP2IrekqARQX8Oh3SZynNSYYrLYotiwrPCzXw+BSqmDTQ68x3aq
         uhlAE3YkzYWIUuqf75ny88qI7skDBOOfo6uFij58Zr90qSOO3XLT2BQXgUXEy8jz9oai
         /50ikLcxfwZ5RyWwNQIQ8QPuIno/qAI8IrhPiIJodVysnw6c2REeh9vXyapK8YhU0pgm
         hoRAVxwH6RP6RAVSzhwZT94ZQcGhxoLTT9i2wD0XstBz37zDU9y9vps9Q+atrsGzOOL1
         UiPNFtjWekyvC4jJBLh4CwAVhk7xhOwymVOniAhIMGcNN+o/Xu4709jyCicets3dAyEY
         GOYw==
X-Gm-Message-State: AAQBX9fYQVxN50S7QZ6R3N0YDRk8xMhDJjDhlQ1UFxgT5dxcSGSRpTI8
	vnKoXdLpqsCuRzZQYrXhItQqszJKWvY=
X-Google-Smtp-Source: AKy350agVAxGLjxtTnt3fT3/DmwRJBtRvGn4UVdOQKXTpC2UznZv2xx7al60pDlkUuMe2s7MXpCu7A==
X-Received: by 2002:a17:90b:3a83:b0:23b:569d:fe41 with SMTP id om3-20020a17090b3a8300b0023b569dfe41mr11855601pjb.7.1679895464770;
        Sun, 26 Mar 2023 22:37:44 -0700 (PDT)
Received: from localhost ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id d7-20020a17090a498700b002340d317f3esm6552442pjh.52.2023.03.26.22.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 22:37:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Mar 2023 15:37:40 +1000
Message-Id: <CRGX8OIDBRI5.1J3X5ZHZUIQE6@bobo>
Subject: Re: [kvm-unit-tests v2 02/10] powerpc: add local variant of SPR
 test
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>, <kvm@vger.kernel.org>
X-Mailer: aerc 0.13.0
References: <20230320070339.915172-1-npiggin@gmail.com>
 <20230320070339.915172-3-npiggin@gmail.com>
 <ec852041-dc53-f50c-534c-a0f5c1dd153b@redhat.com>
In-Reply-To: <ec852041-dc53-f50c-534c-a0f5c1dd153b@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Mar 23, 2023 at 9:26 PM AEST, Thomas Huth wrote:
> On 20/03/2023 08.03, Nicholas Piggin wrote:
> > This adds the non-migration variant of the SPR test to the matrix,
> > which can be simpler to run and debug.
> >=20
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   powerpc/unittests.cfg | 4 ++++
> >   1 file changed, 4 insertions(+)
> >=20
> > diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
> > index 1e74948..3e41598 100644
> > --- a/powerpc/unittests.cfg
> > +++ b/powerpc/unittests.cfg
> > @@ -68,5 +68,9 @@ groups =3D h_cede_tm
> >  =20
> >   [sprs]
> >   file =3D sprs.elf
> > +groups =3D sprs
>
> Looking at this again, I think you don't really need a "groups =3D" entry=
 here=20
> ... I'd suggest to drop that line.

Okay, will do.

Thanks,
Nick
