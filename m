Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6177F4E797B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 17:56:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQ7X92WsLz3071
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 03:56:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=U5ErH/Ei;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::636;
 helo=mail-ej1-x636.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=U5ErH/Ei; 
 dkim-atps=neutral
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQ7WX0KvVz2ymb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Mar 2022 03:55:33 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id a8so16511364ejc.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 09:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K0UQKC4XvJrnNZ34RKfPyoVwW+Xt8hmyBlbU2fjx7Uo=;
 b=U5ErH/Ei9vW9Ct/h0mTTdFrb7CaghHjJJS5OTfWSWdJTV3Ot+ASAdDbdpM/EcdR4Ag
 J5CRH0gZcoZKlIuqUrJJoAw/UeW3+K+sWS6e8wI7OIXUnABHH0beilnzIVpeEWyBQ0Fb
 c8/+tq4frvVfZxsERqLsqIIJs9l9bzJ71+pyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K0UQKC4XvJrnNZ34RKfPyoVwW+Xt8hmyBlbU2fjx7Uo=;
 b=FVlQqEQCQ+w+fnboWc/V8eiO+uxbpoPN7QBqW2pr1BFb5MU3APIYbcxjays0rDvQ67
 +t/SPBIp4YMO4RKmpvEZpbQ6E4RG9US85sjTz3xEMtKVyN2ShG1AfVWVnTLDdQ0uGt37
 mF7+NXBGl7WLT3sEmRrSamLx7l+e/B2m4MdV4lyWGjdRulkmoJy1uaYcwkCZJBq5wM7f
 AgHG3sAgXN4eoRaIVz2fdc75AzCFY+D96ejsBmhxO+CLFYLdKfmPSaGohAGRIrNpv+mE
 iU+1L5ihvuhMzNokcVDp/nKEvX/RPNEX+hBM+L9zOJjwNtqFpsLdrMXXh+9883MJXTJp
 32Hw==
X-Gm-Message-State: AOAM5336QW637l/3f1bYjSuHrtTH2UMSICs19qNIgMzp/aCZ3bhBWk1V
 AjGkqFPswDbBko23FGCo5IH6oEAi7OhJThSOyDk=
X-Google-Smtp-Source: ABdhPJwoh9QUj3pJ5u1BroLhidL5/K0ajwcmCZxb1qgeqxRdMJGXRmcX2S1AxzUFXURyH8bwH3Dmvg==
X-Received: by 2002:a17:907:7f04:b0:6e0:39a2:79a6 with SMTP id
 qf4-20020a1709077f0400b006e039a279a6mr12429297ejc.243.1648227326868; 
 Fri, 25 Mar 2022 09:55:26 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 d2-20020a1709067a0200b006df8c996b36sm2513194ejo.26.2022.03.25.09.55.26
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 09:55:26 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a8so16511265ejc.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 09:55:26 -0700 (PDT)
X-Received: by 2002:ac2:4f92:0:b0:448:7eab:c004 with SMTP id
 z18-20020ac24f92000000b004487eabc004mr8597932lfs.27.1648226962360; Fri, 25
 Mar 2022 09:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <87zglefhxd.fsf@mpe.ellerman.id.au>
In-Reply-To: <87zglefhxd.fsf@mpe.ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 25 Mar 2022 09:49:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=whk4jihDM+zkhZPYRyNO0-YA1_-K9_NyC3EDsX+gkxC-w@mail.gmail.com>
Message-ID: <CAHk-=whk4jihDM+zkhZPYRyNO0-YA1_-K9_NyC3EDsX+gkxC-w@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.18-1 tag
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
Cc: wangborong@cdjrlc.com, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Wedson Almeida Filho <wedsonaf@google.com>, Petr Mladek <pmladek@suse.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, jniethe5@gmail.com,
 psampat@linux.ibm.com, Miroslav Benes <mbenes@suse.cz>, hbh25y@gmail.com,
 mikey@neuling.org, Joe Lawrence <joe.lawrence@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 danielhb413@gmail.com, haren@linux.ibm.com,
 Thierry Reding <treding@nvidia.com>, ganeshgr@linux.ibm.com,
 Corentin Labbe <clabbe@baylibre.com>, mamatha4@linux.vnet.ibm.com,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>, kernel.noureddine@gmail.com,
 nathanl@linux.ibm.com, Paul Menzel <pmenzel@molgen.mpg.de>,
 YueHaibing <yuehaibing@huawei.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, guozhengkui@vivo.com, kjain@linux.ibm.com,
 chenjingwen6@huawei.com, Nick Piggin <npiggin@gmail.com>, oss@buserror.net,
 rmclure@linux.ibm.com, maddy@linux.ibm.com,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, sachinp@linux.ibm.com,
 bigunclemax@gmail.com, ldufour@linux.ibm.com, hbathini@linux.ibm.com,
 Athira Jajeev <atrajeev@linux.vnet.ibm.com>, farosas@linux.ibm.com,
 Geoff Levand <geoff@infradead.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 sourabhjain@linux.ibm.com, Julia Lawall <Julia.Lawall@inria.fr>,
 Ritesh Harjani <riteshh@linux.ibm.com>, cgel.zte@gmail.com,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, tobias@waldekranz.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 25, 2022 at 3:25 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Livepatch support for 32-bit is probably the standout new feature, otherwise mostly just
> lots of bits and pieces all over the board.

Heh. I would have expected 32-bit ppc to be entirely legacy by now, so
it's a bit surprising to see that being a standout feature.

That said:

> There's a series of commits cleaning up function descriptor handling,

For some reason I also thought that powerpc had actually moved away
from function descriptors, so I'm clearly not keeping up with the
times.

Anyway, unification in that odd area is all good. Pulled,

               Linus
