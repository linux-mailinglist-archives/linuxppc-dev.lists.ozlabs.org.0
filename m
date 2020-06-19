Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4670C200864
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 14:10:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pHg91zhyzDrP3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 22:09:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pHd12s8BzDrJf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 22:08:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49pHd05H1Jz8tVv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 22:08:04 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49pHd04GMrz9sSJ; Fri, 19 Jun 2020 22:08:04 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49pHcz18DSz9sRf;
 Fri, 19 Jun 2020 22:08:02 +1000 (AEST)
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MbRXj-1jAzBN06lF-00bwGR; Fri, 19 Jun 2020 14:07:56 +0200
Received: by mail-qk1-f172.google.com with SMTP id l17so8610537qki.9;
 Fri, 19 Jun 2020 05:07:54 -0700 (PDT)
X-Gm-Message-State: AOAM531n75hrGZpX7TotLJTrus0CDAqxwASk+33GWOm6PBYK7Pkrrid4
 eYbhzgh4Y3dYBTYNgjKVvO+cHr0iHSjgCY1w01I=
X-Google-Smtp-Source: ABdhPJwHx2uaIMhEGlEMDgOdw7u23u0WTOydTXFPEmc56fSEQqUwklU3gb9vWno9ShiFPoxSOoPySMVl5vIdoNyR1Y8=
X-Received: by 2002:a37:8384:: with SMTP id f126mr565913qkd.471.1592568473970; 
 Fri, 19 Jun 2020 05:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200616135617.2937252-1-mpe@ellerman.id.au>
 <20200616135617.2937252-2-mpe@ellerman.id.au>
In-Reply-To: <20200616135617.2937252-2-mpe@ellerman.id.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 19 Jun 2020 14:07:38 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0+PBCg=TJXgwbuA02841M3NgQyoxfrua0XpovFz0K98A@mail.gmail.com>
Message-ID: <CAK8P3a0+PBCg=TJXgwbuA02841M3NgQyoxfrua0XpovFz0K98A@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/syscalls: Split SPU-ness out of ABI
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ant4sIVEHhPhzTuqRKdC1ml5YXcCFP53RwMKk9bpMKTmU5XhJpB
 wEYsxbZEu2K9x3FjoJhZjzMuOBTX9FzKpRi+xCKxwlbWikVH2vCQfU8k/6iVOy4R/ROFVLm
 f7J8Uz4xh7XilCa1X6XrKE5DPaoiD89gNZy9XguHCbXKmBPo/agcCBD+SB6N/MlN8eZmZhP
 +eE7QGhJQXM644xOLqJPQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DzsZr5pCBOQ=:VDGuKAEUn4G/TkeX6jSx1g
 1HW1lvEplP5bA+vI5kBTNx4wEZZmI/OeY5A0UUYzW0azNfxhTQZSacsy92UR9wbhK9YJIGTz8
 /vO6EpDCfjlVDzOxHoedwEByLZUESpF9DgmOhBTEuPzGrQjMVWMh67UpX0gePgo7XkiHQ3k8s
 aWze0OLetTpTZAhD/HB6ipRbsOyBjs1Ekp/ttr+e79Sd2kHZ65hlb+kzzw57aW0mNi3LExSxs
 Z7py9FHDqRRqmD2RTJoF3XFwWhe/R7CeZmYLmQtibGimAns1Z63DLXXBKU9/a/zhmz8S6LKib
 8BDNbADtULl3PP7DjFHBo6WjTo1P+zBXDF71IZJm8I9mXd8/O27cZxhFPsY6ypm21rMDULM7O
 yx4yJ7gBVj3Tn9RRw+XRCkpihgyzFpZZihZDlLvc/+ug8HGo1h03VAS6d1UERj/e5GEfrfl6j
 RGVgJwbYk1gs+0SH2sZRCQkxtozsNE+K9rFoLdccmr5B1Z6MqdK9DRXH73APm4SqSRJOuRYfC
 MhqmWVUQqRAwsu2153oNVImQwjlwVc5L3yDxnfd0ab3EeMV/EK2dTimRoGtynn4y/mhe/d3NP
 dWlBQDvhe/dACIDPmfvt3RiKWXDXVghHb6QZTZjCmB8Og8agZ/X34MUh5Q5AGVzvAMflozAD9
 j/r0vlayOZ56cJgW/p1wcxMNESnQXiOxn2o3MdkHhr4Oj8A902R0WF1czQEDl4tyrzY4RiY8L
 LvWMvNow+I0FSkrZW1z6NAwwcNdFSzdlTxg2yj3gkEfxrfhlTyKkiU23aZOngpZGSGmO8xk8I
 XZQTsCrVnuTf7GxEDtYYamIKjPpyYZHWpF9RFqlN366M/r8dNI=
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
Cc: linuxppc-dev@ozlabs.org, linux-arch@ozlabs.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 16, 2020 at 3:56 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Using the ABI field to encode whether a syscall is usable by SPU
> programs or not is a bit of kludge.
>
> The ABI of the syscall doesn't change depending on the SPU-ness, but
> in order to make the syscall generation work we have to pretend that
> it does.

The idea of the ABI field is not to identify which ABI a syscall follows
but which ABIs do or do not implement it. This is the same with e.g.
the x32 ABI on x86.

> It also means we have more duplicated syscall lines than we need to,
> and the SPU logic is not well contained, instead all of the syscall
> generation targets need to know if they are spu or nospu.
>
> So instead add a separate file which contains the information on which
> syscalls are available for SPU programs. It's just a list of syscall
> numbers with a single "spu" field. If the field has the value "spu"
> then the syscall is available to SPU programs, any other value or no
> entry entirely means the syscall is not available to SPU programs.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

I have a patch series originally from Firoz that was never quite finished
to unify the scripts across all architectures. I think making the format of
the table format more powerpc specific like you do here takes it a step
backwards and makes it harder to do that eventually.

>  4 files changed, 523 insertions(+), 128 deletions(-)
>  create mode 100644 arch/powerpc/kernel/syscalls/spu.tbl
>
>
> I'm inclined to put this in next and ask Linus to pull it before rc2, that seems
> like the least disruptive way to get this in, unless anyone objects?

I still hope we can get a better solution.

> diff --git a/arch/powerpc/kernel/syscalls/spu.tbl b/arch/powerpc/kernel/syscalls/spu.tbl
> new file mode 100644
> index 000000000000..5eac04919303
> --- /dev/null
> +++ b/arch/powerpc/kernel/syscalls/spu.tbl
> @@ -0,0 +1,430 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# The format is:
> +# <number> <name> <spu>
> +#
> +# To indicate a syscall can be used by SPU programs use "spu" for the spu column.
> +#
> +# Syscalls that are not to be used by SPU programs can be left out of the file
> +# entirely, or an entry with a value other than "spu" can be added.
> +0      restart_syscall                 -
> +1      exit                            -
> +2      fork                            -
> +3      read                            spu
> +4      write                           spu
> +5      open                            spu

Having a new table format here also makes it harder for others to add
a new system call, both because it doesn't follow the syscall*.tbl naming
and because one has to first understand what the format is.

If you absolutely want to split it out, could you at least make the format
compatible with the existing scripts and avoid the change to
the syscalltbl.sh file?

       Arnd
