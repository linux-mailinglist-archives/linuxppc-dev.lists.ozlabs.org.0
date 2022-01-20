Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0360494AB5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 10:27:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfcbY5vJ3z3cBx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 20:27:05 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jfcb65xgnz2xs7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 20:26:41 +1100 (AEDT)
Received: from mail-oi1-f178.google.com ([209.85.167.178]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MIxmm-1mrHrq1xUY-00KSwN for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan
 2022 10:26:36 +0100
Received: by mail-oi1-f178.google.com with SMTP id bb37so8524889oib.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 01:26:35 -0800 (PST)
X-Gm-Message-State: AOAM5330gSzdNPsmvaqmKMKMaODNEJeZKlAlxWlAtW+c5FDmNgLPvAIC
 NRKsKnpf+c6zpHdxFLE5esggHmLQ5oZQ8G5bAEQ=
X-Google-Smtp-Source: ABdhPJwUHTIEKGF9B/deLoD+NLX/BPhPwhEAEkpKqsuu70hdzaWxQnSHkYBLqgySPz6euydrj/73VVU+G7+wmpaPV1k=
X-Received: by 2002:a05:6808:2206:: with SMTP id
 bd6mr6829962oib.11.1642670794688; 
 Thu, 20 Jan 2022 01:26:34 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-5-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-5-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 10:26:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3ixShQBKmdXWxf8QdB_aLeWr7TQB+7MqQBSgh0-shSSQ@mail.gmail.com>
Message-ID: <CAK8P3a3ixShQBKmdXWxf8QdB_aLeWr7TQB+7MqQBSgh0-shSSQ@mail.gmail.com>
Subject: Re: [PATCH V3 04/17] syscalls: compat: Fix the missing part for
 __SYSCALL_COMPAT
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:PRSOyINzLVaEVJkjHlabpyH5wT0/mDa0PfvFUfhf4HvHynMCn04
 si6zWk1jfKnu1iHl6IrdmnOuIo449ivYk4DU+cuWhvFipwFqFlTXCgCGrxVyMRNYKHC3196
 3HFAwxUSUahsdbspVu2Ic50+meyZCYv7MDDl36XN7GdkFz3nYaDtfjcnvRFVhZshCeUnV9U
 huMm+AP3E2tPkCwwrT4UQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xwLtRYkItOE=:6zrRaZsifNdy1Ql2oRizow
 /oVU1Hx8leI0ujOWz9iNcAVAFURWZeHQaHW7SOiUQ8w21VMwD0tW+rEeYnPZve6iHzsOQZE/X
 Nrs7aHMzlv9ePH5yoS0Ni5tOLEMr7uzj1WShILZyP2iS+q0+86ingCZwzHWa5DeOFbSy9f5/9
 WAht49+eRadhasR4RmL85Z0eq6hzksnWGnK1lUPbz7kH85vIVb2c6SO8gxexvuIZEvYrsHTFp
 f/TulXfooX8ysNHRXFZYFW+p9smPtiR4jubgfsgeeZEUGQEN/6sQnRAM0jDE/NGnbrJxZ8Aez
 kH33oQFoyMGRYLZBpn/ha4VJZst9HzhWFdKlhOxg9DM/Dt3yT6LXjyrHxMHLtWS/gkOi+1lBS
 fsfwYpUYMFryzwccZ9KNidI3UQqec3mnRH+M6pROdU+NVWiLqsOwd0lAbZnGWfH5A17mnv27S
 xuMbItWCTwOnDwyh/tRL49gHuvR1V3PPm+gRMi6Ttdq29bPTSxvPLfQzik4gCUNlq9lmZxo9E
 ipOBcAObBYztHDUEP15FAvMHc4sWzH4cVAyFLzCbvnrknlcMup4YjhTi4Q2olwtzgC2y3XvIH
 mYvmvDK8rjqIum43m0zDpoM1MSbrL2wFiGX+XTdRDK4Yh3x1BcBXSDAr4vOVcXoXlQOeOLrBb
 RAXlc1hSiBG1GzdekcTZ8saTydY7vUauF6UIu/z2t3GRb4DbVCYMqglQoKU6vECS7mBZWgUip
 Y7o9K8h5q09H4n7uiGH+n4TCAGTE/r5iztPIJ9n7j8pAvy1pKAiUg/htfdkSYw+j9rJ5T/Cjh
 mABtW57y8n3E5z/TCSAoFsnp5YvXlsrZl65Xf9LDoHgobXDPzw=
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, gregkh <gregkh@linuxfoundation.org>,
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup@brainfault.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, inux-parisc@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 liush <liush@allwinnertech.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 20, 2022 at 8:38 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Make "uapi asm unistd.h" could be used for architectures' COMPAT
> mode. The __SYSCALL_COMPAT is first used in riscv.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
