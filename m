Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB93540A1D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 02:20:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7kWw1GBMz2ymb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 10:20:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=SclZiWrk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=SclZiWrk; 
 dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7kWH4mfXz2yHb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 10:19:53 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id c8so24781677lfi.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 17:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OJCOVeO589IX0eZ2k9PI4XmEqC+ha+gDBXVAR0aVS3A=;
 b=SclZiWrkT5KucTv1KidhHP6yMCpKWMNqoOiS1UgRHORAfJuSSMf+xaeagNjetAELs6
 Bh2TOhuIaWLPnM+/W2Yzq/TD4x6e1lZqhBUlLoChPi52C7bRjop+4ZM3lAIpZzJOEVn9
 lcHuoBjFShp/uD8fDDM5+JSs5YrWYKB9IWsGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OJCOVeO589IX0eZ2k9PI4XmEqC+ha+gDBXVAR0aVS3A=;
 b=7pznX5m+A1WYH+rnhjt/ZANFUV0C4xx0UoKcxyQi9VTCZMgGUYpLs7tjTd0y57MHkP
 hn2iwldZgB1kmF+QzUr6TkDu5COzDmUx9ntouS1fk4SnFM7aK69dQCmDghkVL7V5cp6+
 fAHf7crrcIIlq0ETN+VOYRRIhkHfEGoEBX3MZuKbayxtdm9eHrbRrvV+EDmK0hFy0Tn/
 eR9MaLbRlddcaU7st+thzRsUaCUojoqpY4j5Jj2eSguzscQMJlnhj2t2GWkL3LGaH7/I
 pFjtFgPll6LR1/dlCfhhbx88JvMq0T8MUue7xxs/7/DgCq45/Dtr+hHsStMSJi/xzCM7
 gGiQ==
X-Gm-Message-State: AOAM531/+iyBKZRumya3krOimidXNZAoZtlMhUEDvihisL2KHA24MCMw
 M4H9jfeaBgZW6RveOwqgdMaWFjInXWYW6d9DMKA=
X-Google-Smtp-Source: ABdhPJxdgwkhxQJ01yTWNiysKnpG30HLa8qr6HvpC1nnREDCRWeh4geAxirmpBQEVsVuBX6yWVb5lA==
X-Received: by 2002:a05:6512:2202:: with SMTP id
 h2mr10871464lfu.494.1631578785609; 
 Mon, 13 Sep 2021 17:19:45 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180])
 by smtp.gmail.com with ESMTPSA id q26sm965607lfb.271.2021.09.13.17.19.44
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 17:19:45 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id o11so12877585ljp.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 17:19:44 -0700 (PDT)
X-Received: by 2002:a2e:b53a:: with SMTP id z26mr12192430ljm.95.1631578784223; 
 Mon, 13 Sep 2021 17:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210914100853.3f502bc9@canb.auug.org.au>
In-Reply-To: <20210914100853.3f502bc9@canb.auug.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 13 Sep 2021 17:19:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
Message-ID: <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the origin tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 13, 2021 at 5:09 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>   gcc -Wp,-MD,arch/powerpc/boot/.crt0.o.d

Ok, so it's not the funky "clang reports gcc-4" that caused tool breakage.

What version of gcc is this? Are you maybe on gcc-4.9 and we just
didn't check that properly?

              Linus
