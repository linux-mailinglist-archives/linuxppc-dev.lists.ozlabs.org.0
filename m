Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8E910546F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 15:31:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JhnF5G4czDr8H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 01:30:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Jhdg3NwdzDqtm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 01:24:21 +1100 (AEDT)
Received: from mail-qt1-f179.google.com ([209.85.160.179]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MPGJf-1iDDBz38ov-00Pey0 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov
 2019 15:24:14 +0100
Received: by mail-qt1-f179.google.com with SMTP id 30so3821499qtz.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 06:24:14 -0800 (PST)
X-Gm-Message-State: APjAAAUyVMwAKdtHNvF47AZN+3FMc95sCKXifaXEdE0aUnBvzJv2FzWp
 OIZLQnX+qNdMLC/TgmithCz0iKp9IKq+vnlHe9Y=
X-Google-Smtp-Source: APXvYqxFuJH0j+fTO645LFq3XWUle+OVKIIWeKTMT9rd4eBnk7TfSc6qphGLOOeNOrVmq3kG2kK5oJwj2Q5qEsXSZb8=
X-Received: by 2002:ac8:2e57:: with SMTP id s23mr8721925qta.204.1574346253447; 
 Thu, 21 Nov 2019 06:24:13 -0800 (PST)
MIME-Version: 1.0
References: <20191108210236.1296047-1-arnd@arndb.de>
 <20191108210824.1534248-7-arnd@arndb.de>
 <4faa78cd0a86cf5d0aea9bb16d03145c5745450b.camel@codethink.co.uk>
In-Reply-To: <4faa78cd0a86cf5d0aea9bb16d03145c5745450b.camel@codethink.co.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Nov 2019 15:23:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1nRq98ngfKnR2Du+7_vOxSRFD9AyjHyUCsAtk_gLR_Uw@mail.gmail.com>
Message-ID: <CAK8P3a1nRq98ngfKnR2Du+7_vOxSRFD9AyjHyUCsAtk_gLR_Uw@mail.gmail.com>
Subject: Re: [Y2038] [PATCH 07/23] y2038: vdso: powerpc: avoid timespec
 references
To: Ben Hutchings <ben.hutchings@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:QoJrWJprhvExK0WFSRd+Hv5i6b5gvqLstE2nxwUwSzW9XXQ6QPZ
 V1EvahCL/b8uRfuSF0aW87ZYrpDlWPcU3xnDbddjf7d/j/1+vYExYa1sey2iX2FIJhmT1nW
 YTcT2Ihv89Ge63QxH9UYyScwxXaeNTBu1qtTFkT73nS0W43qcEAD7spT8M1ZBFfkH05aynM
 ZG/coIIX4McMRJ39chlrg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VU1OhlNzHpg=:XeOH5nd5SQMnFvSZzCDzYT
 Jx7FtxdtTAq/s3IKiJn52RI0tAMjww5k2nTJ6tTzoFaJ9lUBZaRMe1uD6+lP97sPfpSM8WljO
 Tjmf1KL+Sw37Wmc97OKcCs7xfwGqZNsmvelPFs/oLFSUAe8NYVDpQYnCuKlTuPNh3jQNyYM/I
 +yZSK0GQMRokyZsIQsifqx+gz2nAGbBbfo+YfPtU+58blxTrPZapy/ghPrtBI3Kb97agSwZpj
 rJTFaHpUUz8DpRQbxpus/s9zdCJszcXRbWgtyWLtc9UV7gBpZT8HxqlrEKfcKS0DrP04xwf8L
 QCFkR8cU1eScclDq7ma4MDeMu1LarNeSRG1oUKG9mkhBdbMxPls09qZl+FYBtCud8JbX+azvA
 Q/roXEG+1uc56T2UoXnyKGkyOhvTC9dCr4W0OhS3XHIzxtBNkOZXagtB+w/Ih4ua4GqVythaP
 VHUnMOh4QJbVhgxb/ba8fpVFfoE0gDiPZBtIZUNA8MgerDkp4jgJTjE4KrtVPd0xK85gqVwJX
 Vpf4juM8dOZkkUx3gmEpAuELkBziOOUq9VAm70tmCb+uql8Kwac3zM4NAqEV3cG47XdN40z9e
 AN5XVyUR87Pzyv2Jn+9lpa9ILcyAoeZndXK35uDLBWMtoBg1ILLUFmc9wLG28nMRO1it9I5vS
 NcpEMx8Ni1cR/wJormkoXc1T6bAFYdi6ZqGuEXZ8TLVNzoHfJUq/nt3MnIZg9dxMd/pW+GB4f
 GW38XrxzGyu4LWHVvmX68kPa5f86t2B080PPmiG43Ag1FxPTOKUjWmDZ8+Z2jA3vaVPDfo11I
 qcLGVNlPVKBV8+ktXwn3f8/YFC1mLYG7TXb6pqcR0Om/G6SIBNr19H8iTZd72f7fSkxHNs5mP
 Euwhr4bF6bXFo/n5Q+WQ==
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
Cc: y2038 Mailman List <y2038@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 20, 2019 at 11:43 PM Ben Hutchings
<ben.hutchings@codethink.co.uk> wrote:
>
> On Fri, 2019-11-08 at 22:07 +0100, Arnd Bergmann wrote:
> [...]
> > --- a/arch/powerpc/kernel/vdso32/gettimeofday.S
> > +++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
> > @@ -15,10 +15,8 @@
> >  /* Offset for the low 32-bit part of a field of long type */
> >  #if defined(CONFIG_PPC64) && defined(CONFIG_CPU_BIG_ENDIAN)
> >  #define LOPART       4
> > -#define TSPEC_TV_SEC TSPC64_TV_SEC+LOPART
> >  #else
> >  #define LOPART       0
> > -#define TSPEC_TV_SEC TSPC32_TV_SEC
> >  #endif
> >
> >       .text
> > @@ -192,7 +190,7 @@ V_FUNCTION_BEGIN(__kernel_time)
> >       bl      __get_datapage@local
> >       mr      r9, r3                  /* datapage ptr in r9 */
> >
> > -     lwz     r3,STAMP_XTIME+TSPEC_TV_SEC(r9)
> > +     lwz     r3,STAMP_XTIME_SEC+LOWPART(r9)
>
> "LOWPART" should be "LOPART".
>

Thanks, fixed both instances in a patch on top now. I considered folding
it into the original patch, but as it's close to the merge window I'd
rather not rebase it, and this way I also give you credit for finding the bug.

I'm surprised that the 0-day bot did not report this already.

Thanks fro the careful review!

        Arnd

commit 1c11ca7a0584ddede5b8c93057b40d31e8a96d3d (HEAD)
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Thu Nov 21 15:19:49 2019 +0100

    y2038: fix typo in powerpc vdso "LOPART"

    The earlier patch introduced a typo, change LOWPART back to
    LOPART.

    Fixes: 176ed98c8a76 ("y2038: vdso: powerpc: avoid timespec references")
    Reported-by: Ben Hutchings <ben.hutchings@codethink.co.uk>
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S
b/arch/powerpc/kernel/vdso32/gettimeofday.S
index a7180b0f4aa1..c8e6902cb01b 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -190,7 +190,7 @@ V_FUNCTION_BEGIN(__kernel_time)
        bl      __get_datapage@local
        mr      r9, r3                  /* datapage ptr in r9 */

-       lwz     r3,STAMP_XTIME_SEC+LOWPART(r9)
+       lwz     r3,STAMP_XTIME_SEC+LOPART(r9)

        cmplwi  r11,0                   /* check if t is NULL */
        beq     2f
@@ -266,7 +266,7 @@ __do_get_tspec:
         * as a 32.32 fixed-point number in r3 and r4.
         * Load & add the xtime stamp.
         */
-       lwz     r5,STAMP_XTIME_SEC+LOWPART(r9)
+       lwz     r5,STAMP_XTIME_SEC+LOPART(r9)

        lwz     r6,STAMP_SEC_FRAC(r9)
        addc    r4,r4,r6
        adde    r3,r3,r5
