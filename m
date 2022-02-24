Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 527564C26D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 10:00:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K46M64tjYz3dwg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 20:00:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K46FH5md0z3bmf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:55:46 +1100 (AEDT)
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MQgtC-1nYfBh2PfK-00NhNa for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb
 2022 09:55:43 +0100
Received: by mail-wr1-f41.google.com with SMTP id b5so873061wrr.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 00:55:43 -0800 (PST)
X-Gm-Message-State: AOAM533aM+l5IpNUtBR6bwllH2mRdGaZT1DymAnMBI2rzDOPBnETDRzP
 dJ/2KzcNYlJq38+bQF1cu9AP9pGGVKpqd78xGgs=
X-Google-Smtp-Source: ABdhPJzVx8NxhnRplqn7UOCa0h4W/Ep2FJpa492JuQvGufCpx+inyOvUlatvGWKDK96MHihZg0ncKPY6m8F54x2XjXI=
X-Received: by 2002:adf:a446:0:b0:1ed:c41b:cf13 with SMTP id
 e6-20020adfa446000000b001edc41bcf13mr1436356wra.407.1645692942849; Thu, 24
 Feb 2022 00:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
 <20220223135820.2252470-2-anders.roxell@linaro.org>
 <1645670923.t0z533n7uu.astroid@bobo.none>
 <1645678884.dsm10mudmp.astroid@bobo.none>
In-Reply-To: <1645678884.dsm10mudmp.astroid@bobo.none>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 24 Feb 2022 09:55:26 +0100
X-Gmail-Original-Message-ID: <CAK8P3a28XEN7aH-WdR=doBQKGskiTAeNsjbfvaD5YqEZNM=v0g@mail.gmail.com>
Message-ID: <CAK8P3a28XEN7aH-WdR=doBQKGskiTAeNsjbfvaD5YqEZNM=v0g@mail.gmail.com>
Subject: Re: [PATCH 2/3] powerpc: fix build errors
To: Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xbfMtoA1cBc8OVIGKkf3FniVITbFbOEBVYTG9+IjxzRh+hvuBtc
 oDS1jxdOFAwacqiZ1gUR5ILLWghhFPEy6F5ft/olBJs0ri7PbgGBwzRn26+MoBGnSKzRP1g
 DVFTNJ05q3VZkkjn+5sRWHHpN1K+DI1Sd7x3fmGl1eGU0orMoPDdRsx/SKmt5U3EWEAaVS/
 Y115Nl7B1NHWiTDb/MjqA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+hOFVvJg/Gk=:Uw2GNDEpcRyYFOxxSUzyE0
 3yCA+r71BzXU/vYiNDoknmbkJocglOb6uYFHH3Tz1dsReTIgsq0UKgSDlDkIiYbck7F8EtB2J
 LVSC7x0f6sLBh4yhy7yoGWwce4QftIZ1O/eZnfZHycPvk3xwW9NqPLRzg6hIgz2C59/CDACFt
 JWar6micreRhPBRqO6z87J9iNqYAXt007p0WGKn13hnnr8pal+jCIg3DJ7ulo9L0tDILTvqvN
 Rbzqxn8pJZpJzIiJ7rgrsuNaiM7f1DikVhKeeRSwAs5W1czicFaNtcpKe8ELD42+751OKFC/G
 lMsI7HmHOAx9mKc3uttqNhkvBYEK74poKOmQsSWF2JusZ4Milj8ranZea807HMj8p34oqjizp
 3kZmiwwGvR0UQ13CDJpcATGRRN6C0AXkPOWDownFHxkY38dUcSNt46BwjpHYwaxL1NcaZJ2bD
 e3XqDiToVibpqLT/kO8lvaAP+Rb83BXTmJI0Yva0DCj2cF8aHFn/JhwVKV3XpP3qALFr1QTjv
 C8twO+cut3BSU0j/+lLtkQsD7Z/zphUeYqup6GAc63ZUCPiOYz82ooMV1pQH3mzYgvNjEtSTF
 srZsOmBJ3q24/JiFz6jUiScSN9zKNjKQc75IZMf7T625/MjioUgPEcAQ9Wip9jhL7F8KeYGHC
 vqme7mbG3AaCiiGS5nFtBpQuaxdPBrEUL/FIpVtZm+N0OUgpBOhFJwkUGbACANp6TJMRsWQ5V
 9S8PxKeNIr/brAPe6vKYI1a1WXa+y8kogxaapjaKFMJejCV1aHDWIL//DReAODaipx/A21JOa
 vVewaoFA8pNLOAs/NEouLKdcRa8ybL/tGedKBlxxILLblZHeTE=
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
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "# 3.4.x" <stable@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 24, 2022 at 6:05 AM Nicholas Piggin <npiggin@gmail.com> wrote:
> Excerpts from Nicholas Piggin's message of February 24, 2022 12:54 pm:
> >
> > Not sure on the outlook for GCC fix. Either way unfortunately we have
> > toolchains in the wild now that will explode, so we might have to take
> > your patches for the time being.
>
> Perhaps not... Here's a hack that seems to work around the problem.
>
> The issue of removing -many from the kernel and replacing it with
> appropriate architecture versions is an orthogonal one (that we
> should do). Either way this hack should be able to allow us to do
> that as well, on these problem toolchains.
>
> But for now it just uses -many as the trivial regression fix to get
> back to previous behaviour.

I don't think the previous behavior is what you want to be honest.

We had the same thing on Arm a few years ago when binutils
started enforcing this more strictly, and it does catch actual
bugs. I think annotating individual inline asm statements is
the best choice here, as that documents what the intention is.

There is one more bug in this series that I looked at with Anders, but
he did not send a patch for that so far:

static void dummy_perf(struct pt_regs *regs)
{
#if defined(CONFIG_FSL_EMB_PERFMON)
        mtpmr(PMRN_PMGC0, mfpmr(PMRN_PMGC0) & ~PMGC0_PMIE);
#elif defined(CONFIG_PPC64) || defined(CONFIG_PPC_BOOK3S_32)
        if (cur_cpu_spec->pmc_type == PPC_PMC_IBM)
                mtspr(SPRN_MMCR0, mfspr(SPRN_MMCR0) & ~(MMCR0_PMXE|MMCR0_PMAO));
#else
        mtspr(SPRN_MMCR0, mfspr(SPRN_MMCR0) & ~MMCR0_PMXE);
#endif
}

Here, the assembler correctly flags the mtpmr/mfpmr as an invalid
instruction for a combined 6xx kernel: As far as I can tell, these are
only available on e300 but not the others, and instead of the compile-time
check for CONFIG_FSL_EMB_PERFMON, there needs to be some
runtime check to use the first method on 83xx but the #elif one on
the other 6xx machines.

       Arnd
