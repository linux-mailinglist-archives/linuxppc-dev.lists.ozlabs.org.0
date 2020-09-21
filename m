Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B0A27320B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 20:37:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwCpW0tX7zDqvt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 04:37:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=N5VnRGG3; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwCmD2QrczDqml
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 04:35:05 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id t14so9777337pgl.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 11:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=/2Z8IartBkPtffqIjRI7bDn8ReaBQI4yKoJOHK76NzU=;
 b=N5VnRGG3UinLkmKATCgG20q65Ejs+/qK8kOdK6WTtEAzuq6GtOBWcP/A2Xc/L2DDHl
 FeAQ+dJzzzWSZdUZNBEZxz9MGUqoadPHzHPfiTRTiKBmt2Vaybqt9XMVQC7cfNbyYrSB
 O7M5aTKfIdUWnCmCeHADhfe+R49GLTvWguPCFVpXr/3TNR8DgmbgYLHfwjzn4z+/btRx
 KTy8zA2w2qPGp/0zzljIPNGTM/ZLFgjOBu2Crv1L+mux1usIFczRz+CMyyM3QkRAzs+w
 Cz43LvV9wOy7f6nRW6lDZiRkU0DLOdk9ODdcjB1I1fTu0alTg3vphjgLHXBhb2ChEa7S
 uKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=/2Z8IartBkPtffqIjRI7bDn8ReaBQI4yKoJOHK76NzU=;
 b=Z4/P7ak+cL8DsNY0WXw+58UIGaZEV/mLTt0f0S16QXzKhdJKJNf8mGNyJ4Z1j+prGL
 ywNxs0aFvEccuiR1Qdv3g+7Cs06ILEF5kabuWHEFCw26qjneMlJgwRXsdmDripSeG+NI
 MQyw3PP+vvGjtRv4x68Q7MhB4juL683qKYGKWGfZj66FhkrszA3L5ZXNjQPN3Ae5eWAl
 6hBCXBg8MJUUkyr7y4ulBrsxFgCBWd7xUG9LH+I+C8sNeO2E4chC0k+aTiDKhrSdEi8G
 2jkKg2No5Hf3xGr/bOX9WmAw9UbiUJCQpTA1v/ikIpap6aBsMGKnLTrF+W6PoT11AG5H
 BIxQ==
X-Gm-Message-State: AOAM532S2rIGr3kgQDcgzB5yw4fijOayq8XHuODUmvzNaYybRFD9D78a
 Nt+QKUQRfOM9GumRqZ3FsimDWep7lLedMDPVOxS7tQ==
X-Google-Smtp-Source: ABdhPJwzOLY3JOyQMdXQlvGgHxA7es13k1t0ixfOKnHwmIn512BrNKuuEDqN2QxAEj7fYfAaMxDEPoHbj71Ti5BiV3o=
X-Received: by 2002:a63:7882:: with SMTP id t124mr685123pgc.381.1600713302134; 
 Mon, 21 Sep 2020 11:35:02 -0700 (PDT)
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 21 Sep 2020 11:34:51 -0700
Message-ID: <CAKwvOdkGd6mPw_OKHwmpVs_xxFW2oqAoXyr7M8hu3PCCwkqCEQ@mail.gmail.com>
Subject: =?UTF-8?B?ZXJyb3I6IHJlZGVmaW5pdGlvbiBvZiDigJhkYXhfc3VwcG9ydGVk4oCZ?=
To: Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, dave.jiang@intel.com
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
Cc: "kernelci.org bot" <bot@kernelci.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello DAX maintainers,
I noticed our PPC64LE builds failing last night:
https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/388047043
https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/388047056
https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/388047099
and looking on lore, I see a fresh report from KernelCI against arm:
https://lore.kernel.org/linux-next/?q=dax_supported

Can you all please take a look?  More concerning is that I see this
failure on mainline.  It may be interesting to consider how this was
not spotted on -next.
-- 
Thanks,
~Nick Desaulniers
