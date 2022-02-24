Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE034C25B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 09:15:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K45Lh2Jnfz3bZy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 19:15:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K45L63qp4z3c9d
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:14:53 +1100 (AEDT)
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MjjSt-1o6b2p28VP-00lGii for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb
 2022 08:07:36 +0100
Received: by mail-wr1-f41.google.com with SMTP id b5so503805wrr.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 23:07:35 -0800 (PST)
X-Gm-Message-State: AOAM5305vqvJEvIPMXHSLInEWm2huX391q1qtX6u+YxMcZEidGkckzPC
 EXNJuM4B87fPW71ZVncYa1debLtJziWvAvE01iY=
X-Google-Smtp-Source: ABdhPJwEtLpX8E/vTN5J2WTCdVQZctqam7R0+5lnIigKmPPrPVDBdQ8fk8Xp/V3xYVy+7XSB18aLEhGa4luiP7dRyR0=
X-Received: by 2002:adf:a446:0:b0:1ed:c41b:cf13 with SMTP id
 e6-20020adfa446000000b001edc41bcf13mr1081355wra.407.1645686455629; Wed, 23
 Feb 2022 23:07:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
 <YhXmQwvjMFPQFPUr@infradead.org>
 <ddf6010e-417d-8da7-8e11-1b4a55f92fff@wanadoo.fr>
 <YhckzJp5/x9zW4uQ@infradead.org>
In-Reply-To: <YhckzJp5/x9zW4uQ@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 24 Feb 2022 08:07:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a23Pjm1Btc=mXX=vU4hkNiPqz3+o4=j0FuYKHB7KuMtPg@mail.gmail.com>
Message-ID: <CAK8P3a23Pjm1Btc=mXX=vU4hkNiPqz3+o4=j0FuYKHB7KuMtPg@mail.gmail.com>
Subject: Re: [PATCH 00/16] Remove usage of the deprecated "pci-dma-compat.h"
 API
To: Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Du8/vGj2l8mh6luUyLZm0xnh6FY+YUrdZSPefdrDlbhJvr2WN4E
 4ikRJYUvWPcHW8pcnJ44G3F9VAOC/wquhk9mMvl4S78P+SDtzl2Q+X0AF9s9col5KGBQlbw
 GUDCt9lY3sxy9leVN9/IQTwWhIhQbbFBnLnpBhZ03NGm9ot1hXnlj2q8lTie2D6EY7h2wRk
 ShoG/O8SWekHPLa4edo7w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xNgKq3/zL0g=:8vfNmTSrvA5e9nqvAb+w6I
 Sz4MDAUs+jCU4+mwEcXH8VbqK7Ri6nXB67xLCrMuIbAPqHPnsBLsAk8KSZpJonlvvJ3LVyxYF
 PmwO8S557/FBOvoNFI8uordJboK5hCgJZS9DphFYxEGZhzlGwKpg/HPUw2I/MZSOYW8MItMej
 TPVtL6uMDy0S/dqjx50f6SS9UPezBn7sPaOz8wf9BtrAQ34XlHDd/jGerSsXpwRs4WkxlPw7I
 9Cebuj3fxB6Yo1HJeCwcAYbDnBjRR+7TpydtPu5Wq/c7Y/yvnJNtBDR9GOhbGGr453LzMk/8Z
 E9o5rW77gRVzTAUpuF65cb2tSgsB0cToOiK3J6gmN4LVNDGjMIorf1vgngbc99nrhqkog3kG1
 hjhE3jtuS2iHbBhs47CqBisZ5JWooX85cjEvTs7oGy4SW2NbOVWAxoQC9eZsoThZN+VZcZ0Bo
 iLwXoahiC4jo2b6OPJ3Wa2/e+eBdjH9P8JmWD5V69kHVwpROQuFPfZli26CtfZFffz1v3QpmK
 6xuuhIRBLRKIySEa67gVqhqc24rYqBTuOWaZEaJ6KyTaxEyrtIyLbamEUTHNjFldv0SJ7maSe
 1vbjjINXdf+/sYpET0tmAgs5wCsagjOSqAsc7GcwFr4w+kBzJzS/u8nLoMblPUfsGOu68oQq7
 cLGQOUGzshuh+qjtBt0ZeB6vFtrAtAYevkSpXu6GEWO3jec1OmLnet0QdluXkhYxyYNG3gUsT
 jQ/ztXPnU7fWWHYMVvwxizwvc0vvOOt9Nev63vbBNCF4GGiK2ntjwblGyVNext7nhQ/Pt5244
 Yj58hXY6qTBaXGwkW5SFsdjmmXrKsexNNsCgYwqCjJvadJV9CI=
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
Cc: David Airlie <airlied@linux.ie>, Tom Rix <trix@redhat.com>,
 linux-fpga@vger.kernel.org, linux-pci <linux-pci@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 MPT-FusionLinux.pdl@broadcom.com, hao.wu@intel.com,
 Arnd Bergmann <arnd@arndb.de>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 sreekanth.reddy@broadcom.com, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matt Turner <mattst88@gmail.com>,
 awalls@md.metrocast.net, David Miller <davem@davemloft.net>,
 Alex Bounine <alex.bou9@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 alpha <linux-alpha@vger.kernel.org>, dmaengine@vger.kernel.org,
 Moritz Fischer <mdf@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Xu Yilun <yilun.xu@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 24, 2022 at 7:25 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Feb 23, 2022 at 09:26:56PM +0100, Christophe JAILLET wrote:
> > Patch 01, 04, 05, 06, 08, 09 have not reached -next yet.
> > They all still apply cleanly.
> >
> > 04 has been picked it up for inclusion in the media subsystem for 5.18.
> > The other ones all have 1 or more Reviewed-by:/Acked-by: tags.
> >
> > Patch 16 must be resubmitted to add "#include <linux/dma-mapping.h>" in
> > order not to break builds.
>
> So how about this:  I'll pick up 1, 5,6,8 and 9 for the dma-mapping
> tree.  After -rc1 when presumably all other patches have reached
> mainline your resubmit one with the added include and we finish this
> off?

Sounds good to me as well.

       Arnd
