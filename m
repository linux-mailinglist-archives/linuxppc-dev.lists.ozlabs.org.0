Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E9E5F6276
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 10:20:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjkrc4WKKz3cfV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 19:20:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aIaOm5sL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aIaOm5sL;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjkqc4l7qz3bhh
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 19:19:06 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so3676783pjq.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 01:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=LlxyuphwXCY+3W7j/0LjjYtvDbnmSlB5M0XDW7cwBX4=;
        b=aIaOm5sLdQq6uMuxTIkr5nQmvr1/9T8zQ2ME1QtEpeCuc0Fm1F+W35/mCVQMcAwkWj
         +tNVWiXSMkjxWoguzmf2so7pgOssZp5LF55VHBVPJlnlrB6NF/J/cJ1TVY9n5mwEs2u8
         hxeHa71g5r8sIpst3TwGYykuwFgDxZA7ZJScwKZn1SVM/on35lAekwBJ1I0LKSG3OhvY
         H2marPQRVTLggac2EXblxHPJjxkJl4COznb61Mu9QOic/pk8NO38d9jp1V/AP9MXIHFk
         z/lK4nFD6iqra2OUgDQo+N4WsI2tu5/s8rGoeop1q6KVNDrgyIoQ1sxnBcioh8Iqo4dF
         fMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=LlxyuphwXCY+3W7j/0LjjYtvDbnmSlB5M0XDW7cwBX4=;
        b=HhMariJPNthkAhuIWPeeBn4XPalHMCOJGQI+pbCMVnwGeJclDmVKe84MCQ+g35JY7q
         avj0v+TKtPnM8ZIsgmFh6tHeUcB2ryUhTauGfhuSakUknRwOIwgy5BdHv5w0RZsqXXo4
         CZIeTp/OgCY65cNvthr01RTf58XFcs/dYZxjz6tnpKYosmXvHs74ptHwetrncFdwmYUZ
         Lud/oSRj6d3PiDyWKrBpq11pVcmklxz3+JNuUI10Y/avEDqo6+7sUbseq15tU1ADGAtT
         fzMapavgoIDsSz4E0X8+2ksYGqnXONxYl7RlR5Q955R5DsG1KfPdSfMiiUashl4aSgWy
         a82w==
X-Gm-Message-State: ACrzQf0rgyRbvhjPd1IhcKCkavDtMGDIwGpNPIBaot57bNvcndUT0MfA
	bEEpqEElmkfzPWr6JmNcixI=
X-Google-Smtp-Source: AMsMyM5Rj8H0JpsHlpjXxMFXqCDAN4v7+HqmJk7CliJHSe0f09nc3bUCqdZY1E5upr4SfwEnrwM2Dg==
X-Received: by 2002:a17:903:24e:b0:179:b755:b82f with SMTP id j14-20020a170903024e00b00179b755b82fmr3560553plh.34.1665044344272;
        Thu, 06 Oct 2022 01:19:04 -0700 (PDT)
Received: from localhost ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id 128-20020a620686000000b00561b02e3118sm5196307pfg.106.2022.10.06.01.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 01:19:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Oct 2022 18:18:58 +1000
Message-Id: <CNEOYHJB9944.30NHOBGFOZMJ5@bobo>
Subject: Re: [RFC PATCH 0/3] powerpc/32: nohz full support
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20221004063306.511154-1-npiggin@gmail.com>
 <f728293c-7176-e564-7db9-4c8d30edfcfd@csgroup.eu>
In-Reply-To: <f728293c-7176-e564-7db9-4c8d30edfcfd@csgroup.eu>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Oct 4, 2022 at 9:58 PM AEST, Christophe Leroy wrote:
>
>
> Le 04/10/2022 =C3=A0 08:33, Nicholas Piggin a =C3=A9crit=C2=A0:
> > Doesn't seem to be much more involved in adding context tracking and
> > generic virt cpu accounting support for 32-bit, which is all that's
> > left to support NO_HZ_FULL.
> >=20
> > I tested this with e5500 SMP kernel with isolated and nohz CPU, and
> > it seems to be doing the right thing -- periodic tick is stopped on
> > the nohz CPUs when they are running in userspace.
> >=20
> > Context tracking warnings should catch quite quickly if we got
> > something wrong there (with the force context tracking option). I
> > don't have a 32-bit KVM environment to test so that might have some
> > issues but it should be quite easy to fix if it can be tested.
> >=20
> > I assume the virt cpu accounting gen option removal is okay, but not
> > exactly sure what to look for in terms of possible problems, so we'll
> > see what comments that gets back.
>
> I'm having hard time finding the link between patch 1 and patch 2/3.

Oh, it's just that NO_HZ_FULL needs both context tracking and
VIRT_CPU_ACCOUNTING_GEN. The patches aren't logically related
at all (and enabling the latter requires no more than removing
the 'if PPC64' clause in our arch support so it doesn't depend
on making these arch changes either -- I'll submit that as the
patch if 2 and 3 have not been picked up before then.

Thanks,
Nick
