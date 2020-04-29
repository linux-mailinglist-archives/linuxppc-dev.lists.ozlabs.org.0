Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 462771BD6F3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 10:16:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BrvM6hfCzDr0m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 18:16:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Brj54fL6zDqyg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 18:07:37 +1000 (AEST)
Received: from mail-qt1-f180.google.com ([209.85.160.180]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M6lUk-1jXXmI2zLa-008NS5 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr
 2020 10:07:28 +0200
Received: by mail-qt1-f180.google.com with SMTP id c23so1102597qtp.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 01:07:28 -0700 (PDT)
X-Gm-Message-State: AGi0PubVHeyWbc/elNZsP3KXRSR75aKZL4azAKw2jZ4HSwCMSKqb68AF
 Nw8+gNJuSQRffNkYEfYDCTZptFgv8rJCNDi9BJU=
X-Google-Smtp-Source: APiQypLfq9vA8PAqfU/YH18U09P0GJiLGEJ7pxzfmyyZ8eMnuqIgB3yzKDt07rPkw8Uw/LGU/qVDLoTi47iZXZD4HCg=
X-Received: by 2002:ac8:4c8d:: with SMTP id j13mr32077431qtv.142.1588147647641; 
 Wed, 29 Apr 2020 01:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200428074827.GA19846@lst.de>
 <20200428195645.1365019-1-arnd@arndb.de>
 <20200429064458.GA31717@lst.de>
In-Reply-To: <20200429064458.GA31717@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Apr 2020 10:07:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1YD3RitSLLRsM+e+LwAxg+NS6F071B4zokwEpiL0WvrA@mail.gmail.com>
Message-ID: <CAK8P3a1YD3RitSLLRsM+e+LwAxg+NS6F071B4zokwEpiL0WvrA@mail.gmail.com>
Subject: Re: [PATCH] fixup! signal: factor copy_siginfo_to_external32 from
 copy_siginfo_to_user32
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:N3hfkme1fS21UdqihOw5Rablu5quoME0hXs23YPOHvG8cy9/IaT
 2idgPMk7CfFQO2ZUYzZzLby+hAIUgkHS6kMhG+4rfRuhXqYQh0MUSN+Y4eGLHOPYNRZJW73
 rs9V37rOs2FQLe/6n1GZwT7TVSz/se5dTz43n2Vjji6WmvIly27FoQWQEsK5/aPD0LVjyqM
 /S38qQVbPgKianbVmRu1A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SRwpK2rT29E=:mr3/9jcnL12A1Cr9kY3xjt
 niM5lsbERhr3laVOfA2pU5Jx/fX8ryzqWqmgud2LUGXH81vS6mpwx0F56fWGWCCh3RPhUpYX2
 oE71wgf7gNCd4Uvjth/T+dzgX8I+L+kulNNzH5dnuT2mf52HOyURzLkXqmZc9AoA8LbUULyLk
 WYkCVTmJVrARQIsJZsgrAZAagdl7A9ece/nblvu7+3bkdlelJl7ky8j6y2IsmTcWSjDmwmMcm
 +erxvMZ2ndL1vCqyV626/z6TL84wXvCkrFC+3axm874ciaJy6UuvITLHycG1BVIMYZyzB5PqI
 v579KcYTfdmWSH5cSh8qoi5hogSnZvbHlqoKLCDUapiTy+PmG3xyQAp4a7KcgRhUM+1te+lag
 Ua3Rbw+jA01G8qx7yKfB+iKB1TXets9ixJvtqVWdHPhGLnWwSe6PTyiSr8Z2ISyRh1CxAepUO
 mb7Y3HJ46h7ufV+zMpCBTgZEI7tzK3ASkivxb7iCyExS3BDIExLAGfzoZS+FkJHSIaNGnjXqF
 hd13sg5ki+fHP+SSmyY69UkZYU9zckGl51p+oYeggBSs1hwAL7iNxm6HlZgoafY+HbU8JZ4sB
 krARGA1fIILsT/NtZi8gOubMeFChYVMbwGmrME2+hBWsOFcBEmI+eVWmWm7ut2Ben/tj0Zh0F
 Y+uvrt3+N0RhU906gIP+sB0VtQ7oHD2cIelmfKkG1Cz0ty7Gf61eCKrAmjV4fugZYP0Q5vijb
 vBvz5aqRWxLAENBMBlrBGz0etYfXpeMBL/0vR8phCEuLM8NDxjRaJF4i9Yjkosbq20JzFyq78
 CTMNPqVWpPqTCua1uqdfiqyer3meCABbuKn2sMUPKyz3AHDrUY=
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
Cc: Jeremy Kerr <jk@ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 29, 2020 at 8:45 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Apr 28, 2020 at 09:56:26PM +0200, Arnd Bergmann wrote:
> > I think I found a way to improve the x32 handling:
> >
> > This is a simplification over Christoph's "[PATCH 2/7] signal: factor
> > copy_siginfo_to_external32 from copy_siginfo_to_user32", reducing the
> > x32 specifics in the common code to a single #ifdef/#endif check, in
> > order to keep it more readable for everyone else.
> >
> > Christoph, if you like it, please fold into your patch.
>
> What do you think of this version?  This one always overrides
> copy_siginfo_to_user32 for the x86 compat case to keep the churn down,
> and improves the copy_siginfo_to_external32 documentation a bit.

Looks good to me. I preferred checking for X32 explicitly (so we can
find and kill off the #ifdef if we ever remove X32 for good), but there is
little difference in the end.

         Arnd
