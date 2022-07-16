Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30520576E3F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 15:37:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlTmS1CRpz3cBK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 23:37:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XobnjiTf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XobnjiTf;
	dkim-atps=neutral
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LlTlm5mWhz3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 23:36:35 +1000 (AEST)
Received: by mail-il1-x12c.google.com with SMTP id y12so3810368ilq.10
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 06:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5DwIeby9yP04RKpyJxL5PrbdIqogg6yPOhWbo7JHmTA=;
        b=XobnjiTf7v9nif7ZIlYg6CbjUFX3cB/9L3Hz5e1BulKOtPVn2M/orxn0vsUl/cpKhY
         dqFf2lJQAMgMO7d98L+pRwuR0kxrQIFhvsuMfZeYqLfiBHZYZCWTEUSA4lkLSVrdAHUr
         Ix8rI8hyA0tAOhtbM0japKKIgJGjWKbUUtZAcLwcznI3x7/TobbZkwBk11WGmJYEkEcL
         8QiDsZ6qmsKQg4OwcqnhT1EZm9n34q8SAbthTgCkexcQOgHQg2gIreI8iCBG+J/k4Urx
         m81j8/RwwDwDhpw8LGZKfNWdJQmkOT/+vxA1G3qnh3GyJA5IWNOdXvpxn5y2BkXYBdpc
         MX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5DwIeby9yP04RKpyJxL5PrbdIqogg6yPOhWbo7JHmTA=;
        b=lPp1pLVBukzW2rkcwDcHpMUfgnKWoCHIolCiJUJykAOsZMcdCsnbrk+Q2HzY4L5uWV
         u00dKUDqKvEdRGMU8w2j/thRn014iDKZB28PsYqQQxMt3wmUhm9ag7URiP9DNt6V1pM7
         N11AuM/mHxLmrPscjq/GdotOEWv8nNwQcAgAB/cJglhMPawSORXRsrXeRPTTMrdaQrt2
         X2Hx/Ax4xy0zFCGalofVTGsn1N6RV2xDyfMsVNcoStTV+znA2u/wyOjJiDowWmHU+aPg
         OzFvsiJq1Sl60sM6W0V0aGcIND5HgunlidfvqZmqIva9G36i0QN9XgKE3TgK8TyV+9aJ
         pnQg==
X-Gm-Message-State: AJIora/5CColxjegzBWrvPf1AYHvxqj78fHbxUqknW8uyjPrq0TxhkCT
	cLqCBRVFBUSq4V2dazfPjx+8OXPYRnQJ7B6mFwc=
X-Google-Smtp-Source: AGRyM1tG1YsrvjoLRvogD9K95sp2B6IZvclnFGnFqUdc0M2V7E19ryC7xwimpnUQHvy2WNgV44DytXl4VP+O6mesyIU=
X-Received: by 2002:a05:6e02:188f:b0:2dc:7291:fd02 with SMTP id
 o15-20020a056e02188f00b002dc7291fd02mr9120346ilu.321.1657978593469; Sat, 16
 Jul 2022 06:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220523020209.11810-1-ojeda@kernel.org> <20220716124214.329949-1-conor@kernel.org>
In-Reply-To: <20220716124214.329949-1-conor@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 16 Jul 2022 15:36:22 +0200
Message-ID: <CANiq72nYRkHV6N2bGpTz3td=2Vto21apvZW0igTT-mV8TZtB2g@mail.gmail.com>
Subject: Re: [PATCH v7 00/25] Rust support
To: Conor Dooley <conor@kernel.org>
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
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-um@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, live-patching@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, KUnit Development <kunit-dev@googlegroups.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Conor,

On Sat, Jul 16, 2022 at 2:42 PM Conor Dooley <conor@kernel.org> wrote:
>
> Maybe I am just missing something blatantly obvious here, but trying
> to build rust support in -next fails for me. I am using ClangBuiltLinux
> clang version 15.0.0 5b0788fef86ed7008a11f6ee19b9d86d42b6fcfa and LLD
> 15.0.0. Is it just expected that building -next with rust support is
> not a good idea?

Please see https://github.com/Rust-for-Linux/linux/issues/795 for
details about the maple tree issue.

I will update the `rust-next` branch next week with the new version of
the patches; but if you are interested in developing, please use the
development `rust` branch instead in GitHub for the moment.

Cheers,
Miguel
