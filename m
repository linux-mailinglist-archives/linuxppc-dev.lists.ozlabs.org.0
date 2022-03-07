Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBB14CF7B7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 10:48:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBttV5qFsz3bfH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 20:48:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.13; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBtt16c8Zz30N1
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Mar 2022 20:47:36 +1100 (AEDT)
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MUokB-1nZeQH0HGz-00QmX1 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Mar
 2022 10:47:32 +0100
Received: by mail-wr1-f47.google.com with SMTP id u1so22218926wrg.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Mar 2022 01:47:31 -0800 (PST)
X-Gm-Message-State: AOAM532s+BgACQ6PBCu+hbmvAvmwGeUU7eP17d445i7mHCR81Fr2f8pQ
 moyWhrjxQ2P/+d3zPy18pTPEUZqKXl3NFn6NHGA=
X-Google-Smtp-Source: ABdhPJzvujeXdW7p1prKOOU8a8yQhOyeVCss6MEvqtEwN6YXERPQeJhpbvFvaxt34r/1kdsTW3Zq6quU9jjULjErlQk=
X-Received: by 2002:adf:d081:0:b0:1ef:9378:b7cc with SMTP id
 y1-20020adfd081000000b001ef9378b7ccmr8006149wrh.407.1646646451110; Mon, 07
 Mar 2022 01:47:31 -0800 (PST)
MIME-Version: 1.0
References: <20220304061222.2478720-1-mpe@ellerman.id.au>
In-Reply-To: <20220304061222.2478720-1-mpe@ellerman.id.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 7 Mar 2022 10:47:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3PWfVv_4tNoeGmoxKYYrG9=ig+33GgvJoar-BMzA0L2A@mail.gmail.com>
Message-ID: <CAK8P3a3PWfVv_4tNoeGmoxKYYrG9=ig+33GgvJoar-BMzA0L2A@mail.gmail.com>
Subject: Re: [PATCH] powerpc/64e: Tie PPC_BOOK3E_64 to PPC_FSL_BOOK3E
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:tIHOc5NR/DBoDsNY9re/Y7hdqDofYcACjz2Zc7ppz9t0yy+UC9c
 q90j3W8UEnUbHZDcUOeH100ibyI5EX7G7rR8BLJAjYF2dzIV3XBuzkvfRks2JRMyexbmL1c
 39JR27JIMqQShlkSfWAqzAw+VmKMTORNXXGwfOiyVSxl5xIZkMYhA20ejazgan7Y6a55ETo
 nORlVtm9Q+qYusYr0IjTg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:swherRwH0Xo=:BOz9Lw3hjA8Ag1Nfp6DyBw
 62obxpWWK/2j/YMIjOIDZkVFgh8JkkCdpDKYcpwwj1V02+D0OTv64TpHoRkIxwwRf8oOCg/kp
 MoQgaG2/bIHR5J6AVxzTIUwiEuGCVIEtMxPDm5hslp2eWCHzG8pFW2b+K3+HIvi7pm5M1IMkb
 vH/w9Kyg0YlQb+1EWcDxVb7P8OmKfZUIIkj3xkuy4I5BMF1P3pjb80T0kkhlQXyHzKBtUcCzr
 x6HG/mkwftW0UjRH7d+vJNBLdakB+YN5QzltNM0ucB06HXh3vVAlWjMM8TKfrPBcIPgErFVsn
 NMc91gSPApfBvZtD09skttTiffle5HEuaBCB2t37BEtYD1JP7uTgCLtgpG4Ko5P2qzUktLgTz
 uBCKPPcifdqJ7bkDQ8rWqmiywB4olN/o7+iCBEchCjnfBxe8nAZsqZ2T8+Otgm+v55zLLGBcP
 oUh3qZw9mT1SpeEZlhWqa7+KxO/HXZ8k05DVL87lmo12i1x/kq7DGSLnorUk0pAIsuE7kbzXG
 ndrdok9HhFciRE5BFXzDFZrnfXsjHClrACbk2hLY5rB2aliiDPyAPe2kp+NyW2x5c2+xQLRrt
 wqtvN2t20sYWf9898KpYY3jR1r3aWVu2h/ukp9k5qsynlLW5sQG7WaEe50Q0chHxH18DlTKyL
 HXBii4ZZfMSqZBz+BuFp+R5XVRs3Na6jMTVzI1UJkyISqB33gNHrnXkYAhskgoiJpsJs=
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Scott Wood <oss@buserror.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 4, 2022 at 7:12 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Since the IBM A2 CPU support was removed, see commit
> fb5a515704d7 ("powerpc: Remove platforms/wsp and associated pieces"),
> the only 64-bit Book3E CPUs we support are Freescale (NXP) ones.
>
> However our Kconfig still allows configurating a kernel that has 64-bit
> Book3E support, but no Freescale CPU support enabled. Such a kernel
> would never boot, it doesn't know about any CPUs.
>
> It also causes build errors, as reported by lkp, because
> PPC_BARRIER_NOSPEC is not enabled in such a configuration:
>
>   powerpc64-linux-ld: arch/powerpc/net/bpf_jit_comp64.o:(.toc+0x0):
>   undefined reference to `powerpc_security_features'
>
> To fix this, force PPC_FSL_BOOK3E to be selected whenever we are
> building a 64-bit Book3E kernel.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/platforms/Kconfig.cputype | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 87bc1929ee5a..e2e1fec91c6e 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -107,6 +107,7 @@ config PPC_BOOK3S_64
>
>  config PPC_BOOK3E_64
>         bool "Embedded processors"
> +       select PPC_FSL_BOOK3E
>         select PPC_FPU # Make it a choice ?
>         select PPC_SMP_MUXED_IPI
>         select PPC_DOORBELL
> @@ -295,7 +296,7 @@ config FSL_BOOKE
>  config PPC_FSL_BOOK3E
>         bool
>         select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
> -       select FSL_EMB_PERFMON
> +       imply FSL_EMB_PERFMON
>         select PPC_SMP_MUXED_IPI
>         select PPC_DOORBELL
>         select PPC_KUEP

'Imply' is almost never what you want here, this only has an effect
on the default used in 'defconfig' builds. I think this should be
expressed using a 'default PPC_FSL_BOOK3E' in the
FSL_EMB_PERFMON option if you actually want it to be optional,
better otherwise leave it as 'select'.

        Arnd
