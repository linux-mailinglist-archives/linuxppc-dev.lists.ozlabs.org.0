Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B101BDD75
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 15:23:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BzjW6KMvzDqQF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 23:23:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BydJ3nYKzDqDW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 22:34:43 +1000 (AEST)
Received: from mail-lf1-f45.google.com ([209.85.167.45]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MLAAs-1jlr0G1Sr4-00ICOG for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr
 2020 14:34:38 +0200
Received: by mail-lf1-f45.google.com with SMTP id t11so1506291lfe.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 05:34:37 -0700 (PDT)
X-Gm-Message-State: AGi0PuaSX9rVJV276Eo8fwe7neoiFHJFD3ePyWpagoQBWwR9IlHprkJM
 XGAPxWpaztdj1g2U4FRjcj4tzn7zhdLD8pCOiwg=
X-Google-Smtp-Source: APiQypJXpncjiHqtF8AXXyPOV1A1AQ0fvHy1iXzeMwNoTg6D5f//C9XrVCZn/K+TfKDZQ9HhN0uOyITz7H5G2DWPENU=
X-Received: by 2002:a19:3850:: with SMTP id d16mr2697623lfj.161.1588163677296; 
 Wed, 29 Apr 2020 05:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200428074827.GA19846@lst.de>
 <20200428195645.1365019-1-arnd@arndb.de>
 <20200429115316.GA7886@lst.de>
In-Reply-To: <20200429115316.GA7886@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Apr 2020 14:34:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3sh9cCbdVYPaWVrOZiMuZcnw7-nsa0qgaQWPDBufqsYQ@mail.gmail.com>
Message-ID: <CAK8P3a3sh9cCbdVYPaWVrOZiMuZcnw7-nsa0qgaQWPDBufqsYQ@mail.gmail.com>
Subject: Re: [PATCH] fixup! signal: factor copy_siginfo_to_external32 from
 copy_siginfo_to_user32
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:M++aIPO7SmJqMMC0hHySM8BveNcD8ZL8ogdhPttIJ29lBuss+HO
 U7Nc8WE3slwXD7XFimSZMC8PItFHtmFVMLei39siN35Nt6FoPJqYIWV+BTJlS4ecfTGtc6Z
 kb6QtBFygYhzhYV5sc9yUM+787HYyFIq8aas8fykx9MtH8nYEV4r/kb6omVmZL1j4vFxgWQ
 tDr7fwZcgNIw3YUlPBc6g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:246coG3BSkM=:1vGOx+xkU/h+CoEobmKL/S
 FDPtAgyHRWgcfnEcC9m3R1f31oYQi1S7PGr8ngmNGFIBFer5CXVYaTspcRqDg0dcxy3AZive/
 /G9OGFarb4BgXN9VkPjuAxwdYnETjGMqfZCzY2kguR2U3Enexj0uoWKO/NQKdecqzJBrWapcq
 Qm3AzeqzQ+AUFuAPUHQ5xFPtde5f+yLe0waJ9WRL3TIuTyeLxPfrzhdy5yzsMHDMx8W5vvyC/
 IXuZJ4KW4wmhKUoGMFlFc5Q3HUD+ZcIxeusUcG0b0nmaa5liDD2mtHSblpgVy1QLiuKE152L2
 POUo/QcL62u9/rs3wu5IsMFRfhwuHm1yhbCUDL/PJYFYWDI0oqsJMn9fhKF3hZheT4fOrL5l3
 VqzF6gnSuclAy8mE9Q/2zhqMOA+U3U8tTkp5GtwwQdEeqY4Qa9JMWegcTWJHbrD7lh2rNOQUv
 AkZvVpytW1w9GbQf8zwh15FzNYUhhGPWJQng8B2EzpMc8FEL9ZL4i3a2N7wZttAJjGPPbza4z
 Q+KdzrwnUu4JV6l1cbHYtbKO/HgdSU7j8EHrrFfQKNGmRU5yHkwE5/UbClVECbK5gxThOcE/u
 cm7tNL4RMyK4DgvtmQZG/SQn5Qjooo+spbordN33a44IW6mN1jSHPVy+zlbY8KrgUzRxQ6O6F
 i7NEQbS8Bcl4OVYt90Ke800s788ObNKYSg6Un8Wi9kIeqa7ApSeby7f+FtsaWEBifbAgUmosS
 E4ogH29oyIsowIx18AkIgDOOIvl4F0tlXeiMzG8KwbDNtj4Egk39c2cIMujPkR+DS8U2YEZbp
 rEIJ/NLGSx3ybdeLNoyCgFr2vVcf7J6Gjdp/fP2KPAKJaCAwNk=
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

On Wed, Apr 29, 2020 at 1:53 PM Christoph Hellwig <hch@lst.de> wrote:
>
> I did another pass at this, reducing the overhead of the x32 magic
> in common code down to renaming copy_siginfo_to_user32 to
> copy_siginfo_to_user32 and having a conditional #define to give it
> the old name back:

Nice! I guess this is about as good as it gets, so we can stop
spending more time on it now ;-)

       Arnd
