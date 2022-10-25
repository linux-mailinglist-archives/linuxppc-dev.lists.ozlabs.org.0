Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A179760D1C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 18:43:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mxd6H3nfGz3c78
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 03:43:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=EzResYwi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=EzResYwi;
	dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mxd5J5XY5z2xgG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Oct 2022 03:42:11 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id l9so5928969qkk.11
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Oct 2022 09:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DMH1L5/T9IU73tpTkKcPO6rFkqbZT1XT8yCS4sITmQA=;
        b=EzResYwicxkSJRV84ydhuhny5KiwmpPZnp/STCsw2WFYoRYHzJZriwWB2/PnaxE32f
         zu34f+Z6LXgUFKe31aNAY+prKNFRp3HMSGuZ6pt2EkUieZo+c/4jdGPbLqcnSfvWk4ef
         T/VXX3cLM2ySxPrFrf9qx81AqBXAPHCydGo7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMH1L5/T9IU73tpTkKcPO6rFkqbZT1XT8yCS4sITmQA=;
        b=y8sKusc0BtAT8vUtIRlt3pLVKl62YzYdefElV9Yo4M8NYDHFwpjAP8XPZkLqbMJHnQ
         I+iSEouzs1oueTJfBK+ZKoxiXqA0SNU71RUAxpQ0M6oCkl4obSU/5KTRqjtVHj9Qzou0
         jGrskRG35q7dLrHOWvpkwjlZtIpjh/NeqkOpGmcvzK9VBOb0oE8zZz0IvgUaYiOZB+Q0
         wUJMJRSvt213LPJeJIm00thWJcxKFfVOyhrPsbdd3+N5y1TGgfMJNucWCizAVQmJz1Nz
         1Nzeh/RLjd+HWRMBYt+DizCTrHph3Kb4QlLPhXd3wIUl6F2LQXMf1ZjyM5eRRNevO6gC
         0tWQ==
X-Gm-Message-State: ACrzQf0Ea4SnR0Dhu9OF2I8TGJDNiJERuzN0LK2/a2jq9nzmuLTRImW0
	p3xLNFIgogp9ePaZVEZR7Txm7Bc1A7emQw==
X-Google-Smtp-Source: AMsMyM5U/5YUQNBQU0T1KWRYDlXjHRd05Ye9XvjVBvF0Ezg5gmHd5dYLyH3nK+RAKlTcyzyd75E5mA==
X-Received: by 2002:a05:620a:404d:b0:6da:4b51:2a8f with SMTP id i13-20020a05620a404d00b006da4b512a8fmr27380827qko.421.1666716127697;
        Tue, 25 Oct 2022 09:42:07 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id l4-20020a05620a28c400b006ecf030ef15sm2339860qkp.65.2022.10.25.09.42.06
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 09:42:06 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-3691e040abaso119456097b3.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Oct 2022 09:42:06 -0700 (PDT)
X-Received: by 2002:a81:114e:0:b0:36a:fc80:fa62 with SMTP id
 75-20020a81114e000000b0036afc80fa62mr17449740ywr.58.1666716126263; Tue, 25
 Oct 2022 09:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wgLV1tNP0EYz7qWK-xeKzO6bh5Kogbpn2wxKLPPpOit3w@mail.gmail.com>
 <20221025162441.GA1128834@roeck-us.net>
In-Reply-To: <20221025162441.GA1128834@roeck-us.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Oct 2022 09:41:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wivKoK4VgfKB8ykQUHKhNSUYA2=m4X7k8QKaizSMvzgZg@mail.gmail.com>
Message-ID: <CAHk-=wivKoK4VgfKB8ykQUHKhNSUYA2=m4X7k8QKaizSMvzgZg@mail.gmail.com>
Subject: Re: Linux 6.1-rc2
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 25, 2022 at 9:24 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Build results:
>         total: 152 pass: 152 fail: 0
> Qemu test results:
>         total: 499 pass: 499 fail: 0

Woo-hoo!

That was quick, for once.

> Runtime warnings

Oh.

Well, close enough, and those fixes are presumably pending too.

              Linus
