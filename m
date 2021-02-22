Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F5A321E56
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 18:42:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkqJY08zjz3cQm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 04:42:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ESuLuDMj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ESuLuDMj; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DkqJ723hrz30Q7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 04:42:15 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FD4564E3F
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 17:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614015729;
 bh=ucpe8l1xlT3KE7H9NkJLSoHHuTstbkJCkhSCSRIJhcA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ESuLuDMj05PhMn89mmnvnN5D7nx95cA8aPpEXmEx2ZxqaVvyqLP7wQ+/b/yC2xKww
 IV8w8seoshTPFqoKNvWscwxeHk7BKF+3pRm8eQNfrykduRSYQh8NF/9sLeP084HRWH
 lIPvxkAG1h7XpusBmK4UwJ98+uQtWUk8Pz16eW40M4oVN/oZV/JprALs0hVZlrhgOa
 EdI+FDZ8Tb1MgI5yHrFGftIWMZoF6VVhITr42i8lh6xfAMoKvQmPxrQa+4nKq3C84M
 5EXVvcftHsB3VRty66ynYI5hxuVnosGlGSFVtzKOTC+F/X0ulHJkYgNNtzjkSrn/89
 HB4hHurGM9lKA==
Received: by mail-ej1-f47.google.com with SMTP id w1so30621080ejf.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 09:42:09 -0800 (PST)
X-Gm-Message-State: AOAM531iThMXoT7lXXBSlm6O+PO5vgJPs9V0bc5BVeMs6zKob7+f/Ngr
 AoGJzBh9RKQKwIpvWTLekqpb9ALFHGCSW6LZcw==
X-Google-Smtp-Source: ABdhPJxcxlLyPpKY6MYnrSiYr8NsChy16rB0Il78JdQMP/GVF5nkhd3gweoflXSc3KklV47o5XMqFI2tLVklQ/VZfuI=
X-Received: by 2002:a17:906:f85:: with SMTP id
 q5mr21544446ejj.108.1614015727967; 
 Mon, 22 Feb 2021 09:42:07 -0800 (PST)
MIME-Version: 1.0
References: <87o8gctii6.fsf@mpe.ellerman.id.au>
In-Reply-To: <87o8gctii6.fsf@mpe.ellerman.id.au>
From: Rob Herring <robh@kernel.org>
Date: Mon, 22 Feb 2021 11:41:56 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+5u82rS+izM2Ds0jdsQKc9C_MCFLmmRvrxhD_6ofNiJQ@mail.gmail.com>
Message-ID: <CAL_Jsq+5u82rS+izM2Ds0jdsQKc9C_MCFLmmRvrxhD_6ofNiJQ@mail.gmail.com>
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
Cc: ananth@linux.ibm.com, Alexey Kardashevskiy <aik@ozlabs.ru>,
 kernelfans@gmail.com, cmr@codefail.de, zhengyongjun3@huawei.com,
 Oliver O'Halloran <oohall@gmail.com>, sandipan@linux.ibm.com,
 cy.fan@huawei.com, SF Markus Elfring <elfring@users.sourceforge.net>,
 jiapeng.chong@linux.alibaba.com, skirmisher@protonmail.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>, eerykitty@gmail.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Haren Myneni <haren@linux.ibm.com>, ganeshgr@linux.ibm.com,
 Michal Suchanek <msuchanek@suse.de>, nathanl@linux.ibm.com,
 kjain@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>,
 Mark Brown <broonie@kernel.org>, Qian Cai <cai@lca.pw>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Hari Bathini <hbathini@linux.ibm.com>, atrajeev@linux.vnet.ibm.com,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 fbarrat@linux.ibm.com, po-hsu.lin@canonical.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 22, 2021 at 6:05 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
> Hi Linus,
>
> Please pull powerpc updates for 5.12.
>
> There will be a conflict with the devicetree tree. It's OK to just take their
> side of the conflict, we'll fix up the minor behaviour change that causes in a
> follow-up patch.

The issues turned out to be worse than just this, so I've dropped the
conflicting change for 5.12.

Rob
