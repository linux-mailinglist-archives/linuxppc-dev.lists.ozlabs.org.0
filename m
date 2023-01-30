Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C524681FFB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 00:51:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5Q1K0XzMz3bT1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 10:51:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WMphTIX3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WMphTIX3;
	dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5Q0Q3vjRz2yNm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 10:50:14 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id v13so12737686eda.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 15:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sZoyIUtWAtZcpfSsfhXbBY+Vrjoh7RxNKH6U/P1EFK4=;
        b=WMphTIX3bJIP7TvChDBHbHVgj2ydL0oNpEjFumSt4MfAiyZ2tLOZZwXmp8Di+w3JWu
         pgA756dAwMWwQABjRWHWN9mT21Zc5yX5lP/AJp3ZWooXFkhmFJSX1Isxu2D9wo88TJPs
         PPlCAthzoBYPaqeOR3XGuUVXNYa79Hccz+jMdiY+PUAwqr32lCqwx+/BDc5nKHpFSJfH
         E4y/Tldk7zZzfjtQzCgT5JI37zJa/BlBQUwXx5OTzr0z12bPxLoDwcyf3PeOHtrOtBuv
         1Gil780Tm6+aih7MGH5U1/HYRKxcxnrgT3oH6XpfeE9Bkc+Cb6a7ygpwx+sYVC1rGL68
         Shyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZoyIUtWAtZcpfSsfhXbBY+Vrjoh7RxNKH6U/P1EFK4=;
        b=epbQWN1+D76Yp0K6yAv/fP2KTCd4wcyX1SHu3qrb07WDRrkPts8FW72ZkpsFGY9CkQ
         qQ/h4EDY0SRUiYS/BCgpSE0ssxfDU/Wg72uMBmbClqX0NYqazDz8STBdFCxi8vqbM6VS
         r3GLaSUu9ZKWJcJnhLiE2axYfLRfy8qCopxgEzrxjPTAqeWCaGP7sIA82D82hXS0EfRg
         LOSOpifb3VThtAaW19M98ou2+PWjZeaZXVkv/ShY9KPLaquplkhfDM4UCBISyAPn+Wn9
         YpP38Nle0LHV3ICE+Lf4XGdaZ4kA+ueGAGogx7zvIL8+356539jkBr/uPagFBx1vT7iC
         8LHA==
X-Gm-Message-State: AO0yUKWEidpjrQ4T9NqSawgdsc3aNJyPTdZATWvX/Hm8Jqv6E6X+bx3J
	m2MWnwEeljaPjleIwKoykAAevuwQibxARQ5FqrosgOx6
X-Google-Smtp-Source: AK7set+vByYtVgnIMWdAK297MVxMqlf0pnneoCvrXx5FXrE/ltnXpfV+tlS2q9tMzTCZEYl+9xyfYdZUnS8+52oxbVo=
X-Received: by 2002:a05:6402:b44:b0:4a2:5487:80 with SMTP id
 bx4-20020a0564020b4400b004a254870080mr1230446edb.72.1675122610256; Mon, 30
 Jan 2023 15:50:10 -0800 (PST)
MIME-Version: 1.0
References: <20230127135755.79929-1-mathieu.desnoyers@efficios.com>
 <560824bd-da2d-044c-4f71-578fc34a47cd@linuxfoundation.org>
 <CAADnVQLV+BERfHNUeii=sZfU+z4WF-jsWUN8aMtzv0tYxh9Rcw@mail.gmail.com> <ae22eee7-eb91-427b-a90a-a5a5e1dc4166@linuxfoundation.org>
In-Reply-To: <ae22eee7-eb91-427b-a90a-a5a5e1dc4166@linuxfoundation.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 30 Jan 2023 15:49:58 -0800
Message-ID: <CAADnVQKv40TaFDg6tDta=_WtpBdAxZ5SpZUmKjgGHPRtn3f-2Q@mail.gmail.com>
Subject: Re: [PATCH 00/34] selftests: Fix incorrect kernel headers search path
To: Shuah Khan <skhan@linuxfoundation.org>
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
Cc: Networking <netdev@vger.kernel.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, bpf <bpf@vger.kernel.org>, Shuah Khan <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 30, 2023 at 3:48 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> >>
> >> These will be applied by maintainers to their trees.
> >
> > Not in this form. They break the build.
>
> Mathieu is sending you the patches in the format you requested in
> the thread on this patch.

It's not the format, but the patch itself is incorrect.
