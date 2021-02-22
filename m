Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E12A8322254
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 23:46:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dky3Q5Fyvz3cLg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 09:46:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=d9XI9NKA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=d9XI9NKA; 
 dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dky2z50jkz30Ky
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 09:46:17 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id z11so8315771lfb.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 14:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r7EOmcELM54UmBvApMBLdEmUEKDMh6qMssHdlFfkwGs=;
 b=d9XI9NKAdnQUgNlRYZBN0ZMIIfpSm1OKH1zyzI/Vkm8Org+COfvN9rrWRSaY0OwMtj
 0MSoqlsN/JtQLNk7i3pGVbZ8w+EBUMGSh5ktQZz7JRYQ4XKzTp810rS1z4q9D8IqBu6M
 mztM40DrDDZEkydB2ejwi0K1qqZ/Ec4RHWtec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r7EOmcELM54UmBvApMBLdEmUEKDMh6qMssHdlFfkwGs=;
 b=Lwi9aMtf4NR3ogh1TaEVM7jIoi5RDDLg82Kfm4wHlkWfHLQMKcrDNi6QNYytJe1zRk
 3RDwuFkyrD415sijQToLIIUKRiqXBOwPUTmJ446WsiqXHlUYjab6CyhML1iPbF9yERvl
 fbiGgApighb2nf+r0bhw6+9Un1BMvAa87Lm8oNYIngPZ9OqSKyo1/qh1BQo1QKQFdf2y
 5Wu11N8NWPfmwEqZTlIkhrbDFqc7CmzovIfjRtJ6DYqGjCy7A8/VQHzXeswSQe787wcG
 uzh+qS3dNyRENDeOXkQXFjT2GBx9+HGKShJbBZvgE/Y5pymIz7D1KN0SaQ563jzvqwlF
 EIrQ==
X-Gm-Message-State: AOAM5306cm6B+VOqzZ3gCfoZiAFtqMuNw00Ce3zOui4H/YCxpxrNR9/r
 yRO0qIe5arjj7yzF+mffljkNiUtj+Jah4Q==
X-Google-Smtp-Source: ABdhPJxLvx/KeR9K81kSbHBQk1dOivIXv9rkwSQcZWTgPQbPEGQtJJc7mjmm4t79pbZ2VNcTI6rurw==
X-Received: by 2002:a05:6512:39c2:: with SMTP id
 k2mr13979622lfu.69.1614033968085; 
 Mon, 22 Feb 2021 14:46:08 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id b11sm2161805lfd.306.2021.02.22.14.46.07
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 14:46:07 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id r23so60981705ljh.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 14:46:07 -0800 (PST)
X-Received: by 2002:a19:7f44:: with SMTP id a65mr14452663lfd.41.1614033479451; 
 Mon, 22 Feb 2021 14:37:59 -0800 (PST)
MIME-Version: 1.0
References: <87o8gctii6.fsf@mpe.ellerman.id.au>
In-Reply-To: <87o8gctii6.fsf@mpe.ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 22 Feb 2021 14:37:43 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9nZYEZnTYMpHwVT6B6P+zFXW_P-PWH_bRR5bp-cWbOQ@mail.gmail.com>
Message-ID: <CAHk-=wj9nZYEZnTYMpHwVT6B6P+zFXW_P-PWH_bRR5bp-cWbOQ@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.12-1 tag
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: ananth@linux.ibm.com, aik@ozlabs.ru, kernelfans@gmail.com, cmr@codefail.de,
 Zheng Yongjun <zhengyongjun3@huawei.com>, Oliver O'Halloran <oohall@gmail.com>,
 sandipan@linux.ibm.com, cy.fan@huawei.com,
 Markus Elfring <elfring@users.sourceforge.net>,
 jiapeng.chong@linux.alibaba.com, skirmisher@protonmail.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>, eerykitty@gmail.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, haren@linux.ibm.com,
 ganeshgr@linux.ibm.com, msuchanek@suse.de, nathanl@linux.ibm.com,
 Rob Herring <robh@kernel.org>, kjain@linux.ibm.com,
 Nick Piggin <npiggin@gmail.com>, Mark Brown <broonie@kernel.org>,
 Qian Cai <cai@lca.pw>, clg@kaod.org, hbathini@linux.ibm.com,
 Athira Jajeev <atrajeev@linux.vnet.ibm.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 fbarrat@linux.ibm.com, Po-Hsu Lin <po-hsu.lin@canonical.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 22, 2021 at 4:06 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Please pull powerpc updates for 5.12.

Pulled. However:

>  mode change 100755 => 100644 tools/testing/selftests/powerpc/eeh/eeh-functions.sh
>  create mode 100755 tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh
>  create mode 100755 tools/testing/selftests/powerpc/eeh/eeh-vf-unaware.sh

Somebody is being confused.

Why create two new shell scripts with the proper executable bit, and
then remove the executable bit from an existing one?

That just seems very inconsistent.

             Linus
