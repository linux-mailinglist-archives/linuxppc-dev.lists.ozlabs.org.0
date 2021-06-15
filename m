Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9680D3A78F7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 10:20:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G41V52D6Vz3bwH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 18:20:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G41Tf64tMz307c
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 18:20:21 +1000 (AEST)
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N8GdE-1lFWQg1cDw-014Blb for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun
 2021 10:20:14 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso1118325wmi.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 01:20:13 -0700 (PDT)
X-Gm-Message-State: AOAM531bhAJJ2MOmwxInYo4KuMcq2cAJbX3qZ8MWTIL2b4O3nDGvkens
 5B0TT6ZgY4U/4VBYIzVp/iRJ0+dwVUr4gYPSeRU=
X-Google-Smtp-Source: ABdhPJzknn/wAJB2XqaT3EVDJsrn6Qqah7F4ZEXQeGy3QtlhDK7hDwIGPQwgesZTjjCaBAU6WLgbMpnOXihkPAGPoi8=
X-Received: by 2002:a1c:7210:: with SMTP id n16mr3675673wmc.75.1623745213164; 
 Tue, 15 Jun 2021 01:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210601085319.140461-1-libaokun1@huawei.com>
In-Reply-To: <20210601085319.140461-1-libaokun1@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 15 Jun 2021 10:18:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2eAcyATVtzo7djRkkuTuS_b3gshCTyboV6oUzoqHnt-A@mail.gmail.com>
Message-ID: <CAK8P3a2eAcyATVtzo7djRkkuTuS_b3gshCTyboV6oUzoqHnt-A@mail.gmail.com>
Subject: Re: [PATCH -next] powerpc/spider-pci: Remove set but not used
 variable 'val'
To: Baokun Li <libaokun1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZfE3ArziLpyOK9PsoT3vmk9AOiMc4jBMibURgeEo3qTJ4anHMSw
 k8qFB4m4PBiptScNAmpSMRc10MKl74g9EwnUKvBCnKoB3mDtnNcPwz2cPMwJUprq3+/2mZ9
 AqN9fYSOB4NYuWbngbZi1lZCi3AZeT/pRVvUvUrc7ei6EOzFt46OJ4dlqGrRthqWjXnNK6o
 MseelBgZ1xh+gkERwWvaA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Eyh4wmrmHgA=:McnXYHmqpPxaLiyXzb1ssF
 bjUcyYDSMit8pDxghxT4Ch4NAPg1K3ZX+ckLfhk9Gxmm3FHQO/Ldm5wCHFqrAxpMThxyQCB8Y
 n5RURv4Nrt1ucoe6906yS/Kh3KaN9yrgPGMtZM6PVe+aRtmNUzsP4di1gyYK6ozmnhMm7ueF8
 BRdMLidFmdmUJtThg8E0vQird6w3lxJt65AWXcjmL5namfIJbDkGT0+pS0FhyeaSAiwhw1xyR
 lbM98vzx1FYSfXyvBh33qJPu3vIR61BtK8ub+csvuUFTfnyfprN0Id085sfoEV+f2nVNe7Wqo
 n6nqMsRpM6lc6wPZC009T0p2tpuqQOEcis/XvgZSa84FKmzlwYhBW68IVraZGIzvliL4nk8Ir
 4Xx4Im90UexplURcf28gYthuEhpVPKNNdd0c3nn+oKuMgDFZmuBhkRWDGJJIUNEk8kKZhHWTX
 QXU65bi51cLvFCipAHMYxKCFlQvoKKUGbr1KZNlciFCDqWggRUs0Vy3tiqbmokxaXiHoskQYP
 ScxwbHCcssc82NUSCl8MXc=
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
Cc: YueHaibing <yuehaibing@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 yangjihong1@huawei.com, Wei Yongjun <weiyongjun1@huawei.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Yu Kuai <yukuai3@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 1, 2021 at 10:53 AM Baokun Li <libaokun1@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> arch/powerpc/platforms/cell/spider-pci.c: In function 'spiderpci_io_flush=
':
> arch/powerpc/platforms/cell/spider-pci.c:28:6: warning:
> variable =E2=80=98val=E2=80=99 set but not used [-Wunused-but-set-variabl=
e]
>
> It never used since introduction.
>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>

LGTM

Acked-by: Arnd Bergmann <arnd@arndb.de>
