Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7EA322279
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 00:01:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkyNV4bfdz3cQd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 10:01:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fq4R2dSQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fq4R2dSQ; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DkyN32pm9z30QT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 10:01:04 +1100 (AEDT)
Received: by mail-qk1-x72f.google.com with SMTP id z190so14443310qka.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 15:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EsKV0Pl9cBg0dGkFXYlZCn6qWyBn5vHTyFKd2EuGsKo=;
 b=fq4R2dSQQyl5znQa4yVu7EyaNlBck4uM94y1rknmYjQGUU7Cr8D4pE0iVKYbD2htIN
 pz9KVEK/iiES/PPK8aq+TVtOGkW9pEUmtwl0eMZGizs5ZzIIDnKw3iHpgQUfzxl8feMm
 Ayt/PZGOUMMaEJ/92FCotBtm7b36hJFAt8bqDJirvpeV5gty4+DQaJPkHffXrIYlGjti
 5ETYr1ncQ1qL2lYxQNBCAivx8QWkGMceq0GET3JI9QrNvpynUb6UaO+XC/pvo7VF5NOr
 k8MCAK59+93GudItyq4PKr8s2b5c+6pDXjI5V27cWHMUuc/roktuuwsMC0J+xNGZVfT3
 /zHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EsKV0Pl9cBg0dGkFXYlZCn6qWyBn5vHTyFKd2EuGsKo=;
 b=hG96SEKUfS6iP+FjduYODUoujP4OAGUuDb2EFSXpEVRo39m1HHEGHYUBv9YW8MuW15
 NqAMIWcEMS7UDYXTI9P5agCl2X+SteOleceuVwVujeYREiD+c5P1iudeVkYbalC/rbun
 jA2xUG3Hmk3HUDNxOQUaRy2AEBa0oa0WGHKXgRW9K4ixgh2z2KkLuWhxKTzHSkRtEMhh
 HCbwuoS6UFpmY4lqcCl3tXGmzwpfLs0UZlIoGdjhxIdyH+nH2qKpJiJfsC2mVlx3oNNY
 xej/f6nbQQkjDa9gza7YuWvR+Em+SdLP4UPXiVr+mGhR8oS9T6RGrUWVaYJA1tVlPu/m
 qZgQ==
X-Gm-Message-State: AOAM533AoyedJ8vueDizQn2srLhLBTKD97hbELbozyOLZMI1t6o7d8LG
 r+CXFsVBnWc2bBBUcRwVy3cvAifLXUQFrgj56tE=
X-Google-Smtp-Source: ABdhPJwWRqCJEdEzHNjaLGBSsRfe2TL5ESD7hupDlSFVSwOcNv+kd6nMpHN6ZC+Q9JkUP1C5K3eyn7pka3B8/q5HiFE=
X-Received: by 2002:a37:7245:: with SMTP id n66mr24129320qkc.374.1614034860347; 
 Mon, 22 Feb 2021 15:01:00 -0800 (PST)
MIME-Version: 1.0
References: <87o8gctii6.fsf@mpe.ellerman.id.au>
 <CAHk-=wj9nZYEZnTYMpHwVT6B6P+zFXW_P-PWH_bRR5bp-cWbOQ@mail.gmail.com>
In-Reply-To: <CAHk-=wj9nZYEZnTYMpHwVT6B6P+zFXW_P-PWH_bRR5bp-cWbOQ@mail.gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 23 Feb 2021 10:00:49 +1100
Message-ID: <CAOSf1CH67Htam33UvYhaypD7HW7q1xU4tUW0soshao2FKa+Czw@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.12-1 tag
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Pingfan Liu <kernelfans@gmail.com>,
 cmr@codefail.de, Zheng Yongjun <zhengyongjun3@huawei.com>,
 Po-Hsu Lin <po-hsu.lin@canonical.com>, sandipan@linux.ibm.com,
 cy.fan@huawei.com, Markus Elfring <elfring@users.sourceforge.net>,
 jiapeng.chong@linux.alibaba.com, skirmisher@protonmail.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>, eerykitty@gmail.com,
 Haren Myneni <haren@linux.ibm.com>, ganeshgr@linux.ibm.com,
 Michal Suchanek <msuchanek@suse.de>, Nathan Lynch <nathanl@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, kjain@linux.ibm.com,
 Nick Piggin <npiggin@gmail.com>, Mark Brown <broonie@kernel.org>,
 Qian Cai <cai@lca.pw>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Athira Jajeev <atrajeev@linux.vnet.ibm.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 23, 2021 at 9:44 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, Feb 22, 2021 at 4:06 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> > Please pull powerpc updates for 5.12.
>
> Pulled. However:
>
> >  mode change 100755 => 100644 tools/testing/selftests/powerpc/eeh/eeh-functions.sh
> >  create mode 100755 tools/testing/selftests/powerpc/eeh/eeh-vf-aware.sh
> >  create mode 100755 tools/testing/selftests/powerpc/eeh/eeh-vf-unaware.sh
>
> Somebody is being confused.
>
> Why create two new shell scripts with the proper executable bit, and
> then remove the executable bit from an existing one?
>
> That just seems very inconsistent.

eeh-function.sh just provides some helper functions for the other
scripts and doesn't do anything when executed directly. I thought
making it non-executable made sense.

>
>              Linus
