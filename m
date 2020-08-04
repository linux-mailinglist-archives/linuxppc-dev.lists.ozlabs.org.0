Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD7923B294
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 04:09:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLJ9117tJzDqTF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 12:09:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=K/XFKNlv; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLJ703BM6zDqSp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 12:07:40 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id di22so21483691edb.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 19:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RAFQEd0EIpFHdsqX56iEfltSZ1JpaftqYRaTJ5eVNi4=;
 b=K/XFKNlvgwZ5ldcNRe/a8w4gynjCmCAn7k+RxcTDwPAM2NKEtafAsFbc0tpdlmLoQ0
 vX0zo0V1i18a1jMaov977FiZZgtpz6M222f7saL5nLP18If6hDcmBCA/Lx4+jJUOBVUs
 sWjnA5+iLNyFkL74uWjOu1TLYLTJelQm8a+Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RAFQEd0EIpFHdsqX56iEfltSZ1JpaftqYRaTJ5eVNi4=;
 b=g/si29oh+7NU7H9LWLHLe9GUb4omTiRTYGZHmKT5gs8jbIiLKwxnZPuHOEkl3Xsb1A
 kDUrv2UZ5veTzVaqYA4eHOJpjeuXYFu3lbwDCyP8t2Y35sW3zBr3Mrq4FOEzWmum1sTF
 gdP/h47qMgnIMdNM4B3tow0ZPDJyIgfUB8KiTa3+8jWZr7gKJE8vcPE89uDEkv14FE9z
 ltyPJ42DsrlK3nCV/HlpJXdrwXFFmNZUGP4sDz2ubddG3tQPSclAv9qiECGX3A5C/RWW
 sNZLa89U3ntVLw9QuJLIGcssjs1Pr/Rsjgk7DJX3GBPP4yRl0oAfmP3n8F7NC6D1kFFC
 8nTA==
X-Gm-Message-State: AOAM530yl79RK5EGFigIqyczVfPeJdjZejkja+0OjfSpiFCnSu6geltt
 3Y6VzrRwhgyRYKtAnLFa1JjiLTdLX1vyapwURYk=
X-Google-Smtp-Source: ABdhPJww21q0tXu8Sqza+TTlZnKNgygTWH8iVAy/4RzaKslPnqVvBsqaZh9YYIS7fwVxy1+uTrQcT1MHne4RLZh6na4=
X-Received: by 2002:a50:d78f:: with SMTP id w15mr18104458edi.260.1596506854744; 
 Mon, 03 Aug 2020 19:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200804005410.146094-1-oohall@gmail.com>
 <20200804005410.146094-2-oohall@gmail.com>
In-Reply-To: <20200804005410.146094-2-oohall@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 Aug 2020 02:07:22 +0000
Message-ID: <CACPK8XfoZ8+SUG6cuWuEJqdTfmxePsBGFGgqyrPvmn1WyRVyjA@mail.gmail.com>
Subject: Re: [PATCH 1/6] powerpc/powernv/smp: Fix spurious DBG() warning
To: "Oliver O'Halloran" <oohall@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 Aug 2020 at 00:57, Oliver O'Halloran <oohall@gmail.com> wrote:
>
> When building with W=3D1 we get the following warning:
>
>  arch/powerpc/platforms/powernv/smp.c: In function =E2=80=98pnv_smp_cpu_k=
ill_self=E2=80=99:
>  arch/powerpc/platforms/powernv/smp.c:276:16: error: suggest braces aroun=
d
>         empty body in an =E2=80=98if=E2=80=99 statement [-Werror=3Dempty-=
body]
>    276 |      cpu, srr1);
>        |                ^
>  cc1: all warnings being treated as errors
>
> The full context is this block:
>
>  if (srr1 && !generic_check_cpu_restart(cpu))
>         DBG("CPU%d Unexpected exit while offline srr1=3D%lx!\n",
>                         cpu, srr1);
>
> When building with DEBUG undefined DBG() expands to nothing and GCC emits
> the warning due to the lack of braces around an empty statement.
>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
> We could add the braces too. That might even be better since it's a multi=
-line
> if block even though it's only a single statement.

Or you could put it all on one line, now that our 120 line overlords
have taken over.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Messy:

$ git grep "define DBG(" arch/powerpc/ |grep -v print
arch/powerpc/kernel/crash_dump.c:#define DBG(fmt...)
arch/powerpc/kernel/iommu.c:#define DBG(...)
arch/powerpc/kernel/legacy_serial.c:#define DBG(fmt...) do { } while(0)
arch/powerpc/kernel/prom.c:#define DBG(fmt...)
arch/powerpc/kernel/setup-common.c:#define DBG(fmt...)
arch/powerpc/kernel/setup_32.c:#define DBG(fmt...)
arch/powerpc/kernel/smp.c:#define DBG(fmt...)
arch/powerpc/kernel/vdso.c:#define DBG(fmt...)
arch/powerpc/kvm/book3s_hv_rm_xive.c:#define DBG(fmt...) do { } while(0)
arch/powerpc/mm/book3s64/hash_utils.c:#define DBG(fmt...)
arch/powerpc/platforms/83xx/mpc832x_mds.c:#define DBG(fmt...)
arch/powerpc/platforms/83xx/mpc832x_rdb.c:#define DBG(fmt...)
arch/powerpc/platforms/83xx/mpc836x_mds.c:#define DBG(fmt...)
arch/powerpc/platforms/85xx/mpc85xx_ds.c:#define DBG(fmt, args...)
arch/powerpc/platforms/85xx/mpc85xx_mds.c:#define DBG(fmt...)
arch/powerpc/platforms/85xx/mpc85xx_rdb.c:#define DBG(fmt, args...)
arch/powerpc/platforms/86xx/mpc86xx_hpcn.c:#define DBG(fmt...) do { } while=
(0)
arch/powerpc/platforms/cell/setup.c:#define DBG(fmt...)
arch/powerpc/platforms/cell/smp.c:#define DBG(fmt...)
arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c:#define DBG(fmt...)
do { } while(0)
arch/powerpc/platforms/maple/pci.c:#define DBG(x...)
arch/powerpc/platforms/maple/setup.c:#define DBG(fmt...)
arch/powerpc/platforms/maple/time.c:#define DBG(x...)
arch/powerpc/platforms/powermac/bootx_init.c:#define DBG(fmt...) do { } whi=
le(0)
arch/powerpc/platforms/powermac/feature.c:#define DBG(fmt...)
arch/powerpc/platforms/powermac/low_i2c.c:#define DBG(x...) do {\
arch/powerpc/platforms/powermac/low_i2c.c:#define DBG(x...)
arch/powerpc/platforms/powermac/nvram.c:#define DBG(x...)
arch/powerpc/platforms/powermac/pci.c:#define DBG(x...)
arch/powerpc/platforms/powermac/pfunc_base.c:#define DBG(fmt...)
arch/powerpc/platforms/powermac/pfunc_core.c:#define DBG(fmt...)
arch/powerpc/platforms/powermac/smp.c:#define DBG(fmt...)
arch/powerpc/platforms/powermac/time.c:#define DBG(x...)
arch/powerpc/platforms/powernv/smp.c:#define DBG(fmt...)
arch/powerpc/sysdev/dart_iommu.c:#define DBG(...)
arch/powerpc/sysdev/ge/ge_pic.c:#define DBG(fmt...) do { } while (0)
arch/powerpc/sysdev/mpic.c:#define DBG(fmt...)
arch/powerpc/sysdev/tsi108_dev.c:#define DBG(fmt...) do { } while(0)
arch/powerpc/sysdev/tsi108_pci.c:#define DBG(x...)


> ---
>  arch/powerpc/platforms/powernv/smp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platform=
s/powernv/smp.c
> index b2ba3e95bda7..bbf361f23ae8 100644
> --- a/arch/powerpc/platforms/powernv/smp.c
> +++ b/arch/powerpc/platforms/powernv/smp.c
> @@ -43,7 +43,7 @@
>  #include <asm/udbg.h>
>  #define DBG(fmt...) udbg_printf(fmt)
>  #else
> -#define DBG(fmt...)
> +#define DBG(fmt...) do { } while (0)
>  #endif
>
>  static void pnv_smp_setup_cpu(int cpu)
> --
> 2.26.2
>
