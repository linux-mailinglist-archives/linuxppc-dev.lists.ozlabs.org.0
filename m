Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C20D926FF4B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 15:58:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtFm81bTszDqth
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 23:58:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 313 seconds by postgrey-1.36 at bilbo;
 Fri, 18 Sep 2020 23:54:15 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtFgW1BvSzDqf6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 23:54:14 +1000 (AEST)
Received: from mail-qt1-f177.google.com ([209.85.160.177]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MNLVU-1k8rPy3rly-00Oo60 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep
 2020 15:48:53 +0200
Received: by mail-qt1-f177.google.com with SMTP id e7so4942110qtj.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 06:48:51 -0700 (PDT)
X-Gm-Message-State: AOAM530imZB+komk5Yk+nsSG5Y2CtHoWP4SzGF2cCLqrC5Ffp/Ae0U2D
 sFdLi4lM5En+UR4TvbyHFRZAcDuimsF4JOcKuno=
X-Google-Smtp-Source: ABdhPJwdeFcN0FjnibbBFg2qZA4+ButX9r5NAMFGHqmQR0795JOFdGKPWzC17cLOf78yKvN1tKg1lyeC+rdsG229l2M=
X-Received: by 2002:aed:31e5:: with SMTP id 92mr24508630qth.18.1600436930879; 
 Fri, 18 Sep 2020 06:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200918124533.3487701-1-hch@lst.de>
 <20200918124533.3487701-9-hch@lst.de>
In-Reply-To: <20200918124533.3487701-9-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 18 Sep 2020 15:48:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a07PbzpGfnVew7VAq2=iD418V-ryvOC94qAQzW0nQAbAA@mail.gmail.com>
Message-ID: <CAK8P3a07PbzpGfnVew7VAq2=iD418V-ryvOC94qAQzW0nQAbAA@mail.gmail.com>
Subject: Re: [PATCH 8/9] mm: remove compat_process_vm_{readv,writev}
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ndnpcPCH+Gi7oFcUu3L9gKgyBk+KXETp5o+01qeMPu84/1IDiEP
 8gKg867YzZTQTGbrUKMVhD0a2a0iNc8xAP3MICAuzT0E7JlQ+J/X3+ZY5DFBgv5qr1SB6Ay
 MVzeB3mSgj0qeHwXsSyZWESi9B1Yiiqwbll0O7fxd02Ozc50ESeYJFvPR1rSBYG/jpkKyz5
 H0uUxo8nH0khb8MOIlVuw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aACjz8OKVRg=:ewZH4cFr5pQxryCFUKOUfh
 1g2ut/AYsE5aMMtuTIrAbaTMCz0xqjDyAEUrTlvXU7kVB6jyfOMJ+lwvTbQwgPAnAI7h0ntZZ
 qANgI7OgaTrq+nCAalHn6AoCmwzNryGpgwKmHcWs6gArlnL8tn12Nt/Y3qZwT7YvocY8dHq7O
 F/1QO5SSb5FQJ/4ikGHsbZ+bRV6ZJ4i5KOxNNXKXmmeFbLh0sWalrC5z2WC+HAy2xkbsziVhk
 2dZJzDWr0CDOaBsYCh3DWxSKz+RMd+Z5542JB5gu2524H2SzySFHbTGrMD92LB/ML6Vpf2T+B
 DAFNWXTUeF7VytsiHHluxTxG81PLK2N6uatSL5pVBa8eCip61uLuZ4ug0hocJUaLYazQYQCrD
 kxMm40pNvEcVPFfWKB78FTccSaMoyRJIH2s6GPCaMzLLblWxITV0B4v9WHmvo//WWdhF3Hj9q
 LAYrxydxcNmtwpwTrCsD1ephibwsYZRP2ABUbZY0iQMDnsnQwG6mi5/81oJ2h9pTRdgsi6Ub0
 cqr2/TfXi3OKGnqLWrapYVldQccvuxiUVJmNrKvQn/9In4OIn389vy6Czcbdp3oXskeCnx/vK
 Fltqm94qCgjxo1HybAh2I7nzumav2UG4Dw6e6gEMK087m/RSdbSxw4WSE+dw5bz7d7BnSIhUe
 h8tJLMSgYDXZtvtlAhn4W7dMwYnieYWo15V4W6/Un/NVbsh76aC2RB1PvBjah2N9PkyxgS6zF
 AHVtUWucNOHYzGM2qLhiXlCpT3/DpFtrUM1fXRtus42tefMfYVd0YuG80gV7u75g/TpwjacUn
 GP9txxwOVrfEQSHQ5UdNi1fxvbxw471btk98s1Usy/ErYbd4vFc9VM1yQiXstPcUNSPue5P
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
Cc: linux-aio <linux-aio@kvack.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 keyrings@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 linux-block <linux-block@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 18, 2020 at 2:45 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Now that import_iovec handles compat iovecs, the native syscalls
> can be used for the compat case as well.
>
> diff --git a/arch/x86/entry/syscall_x32.c b/arch/x86/entry/syscall_x32.c
> index a4840b9d50ad14..f2fe0a33bcfdd5 100644
> --- a/arch/x86/entry/syscall_x32.c
> +++ b/arch/x86/entry/syscall_x32.c
> @@ -17,6 +17,8 @@
>  #define __x32_sys_getsockopt   __x64_sys_getsockopt
>  #define __x32_sys_setsockopt   __x64_sys_setsockopt
>  #define __x32_sys_vmsplice     __x64_sys_vmsplice
> +#define __x32_sys_process_vm_readv     __x64_sys_process_vm_readv
> +#define __x32_sys_process_vm_writev    __x64_sys_process_vm_writev
>
>  #define __SYSCALL_64(nr, sym)
>

I forgot this hack existed, and just sent a patch with subject "x86: add
__X32_COND_SYSCALL() macro" instead.

If I understand this right, the macros above should no longer be needed
once my patch gets merged.

        Arnd
