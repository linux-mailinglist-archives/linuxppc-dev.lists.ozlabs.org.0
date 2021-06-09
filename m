Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E46D3A1321
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 13:45:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0QKb3nbyz3by8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 21:45:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.13; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 465 seconds by postgrey-1.36 at boromir;
 Wed, 09 Jun 2021 21:45:35 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0QKC0gZHz301N
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 21:45:33 +1000 (AEST)
Received: from mail-wm1-f50.google.com ([209.85.128.50]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MeTwY-1lIhYi1RLA-00aXjz for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Jun
 2021 13:32:32 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso3965476wms.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Jun 2021 04:32:31 -0700 (PDT)
X-Gm-Message-State: AOAM531+NHZKi4hZiGaI3sHMcEEX+AXhxrmQStaDaORxCdCfPXlBsxbE
 saw95TzWtYnzLQQQ8G4CP1qierClaQ/02dSoX2w=
X-Google-Smtp-Source: ABdhPJzoAPnjJWGlDyxsxVrxhheEMZ1P753dKM++est77A1JSiUJC5TRRvOf+sTRALv47GHRkLWv+YzLbHb9Ukp7IwY=
X-Received: by 2002:a1c:7d15:: with SMTP id y21mr9135927wmc.120.1623238351528; 
 Wed, 09 Jun 2021 04:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210604064916.26580-1-rppt@kernel.org>
In-Reply-To: <20210604064916.26580-1-rppt@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 9 Jun 2021 13:30:39 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2tZDJDqgr9-1vJrnbDhd_36eKq8LMEznDkU7rvuAnAag@mail.gmail.com>
Message-ID: <CAK8P3a2tZDJDqgr9-1vJrnbDhd_36eKq8LMEznDkU7rvuAnAag@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] Remove DISCINTIGMEM memory model
To: Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dxOffA9PnHx8KgMGtsB1jHYCU9DMOp3nRjiAvz3ilJDg4onaIBc
 wwQIS2fNmdyvl/+93s/JMh8EKDwZI1tSBkLcIRuAo09SLBRL1pt+8RvpDmPfoWn1vfSq2Nn
 he+ZbM1LCFvA8d2stn2uclkFndIKDlPPf9Ais8x5pNahj8WJxbxRn3r+nTUCl48f+ANFav3
 W+7CaDZDgeLg5byc5Czhg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Rqnfc6IiJTA=:FereB4Ebfecdvt+2Y+n8T6
 21NRFM4KUwE7gjF+Om+BAlHPUqSedaYTgJdh6Vu0GEFzLvlgSUeSkvJQSrsUGSy9Gh8UiyAfq
 +p1vc/I+aTD+TuL+KWxCstFCmfPtNeWC4kuXb5eVnccQDnxBvdY+1w0n+fHAlD6ETdl0Jq7ym
 7GXPYTHLzZE+ElbyT4esZ6bKgZFoynRTFA3btMPmmUNG0CDARXG89SWSiBy72pMMEVzp3/a3c
 6lXxbnTkItZy8Z8VkIkmzuOdajG9YMID8L/24gF+Bo+23/ukLroD08xPDi+cCQ7Uwd+mNCL+8
 BLk72nUlqy7CpHgzd9vxz7cP2Z2+7d4m7ZtAWQdYd66nvEu+EWm6uWInOxd0CGqhIUCIlT06/
 B8LrUR2wq8cZzhZ94x6+dFfsNjTtWJje6pJm3zoaH5eBmtNl7ldx5MJ1gOs+rOFRHA7VdXshN
 2VLH334nuoIJ0ITUzmuUcKooq0w5zOAr8gVU7lTh8MZ6IUfO2YD2g9KEVXK/z0p2xOfe8X/uj
 MiASkPdUeMi24BEpA+76aVXHDyZvnlCV80KF9HItZ5yF4+2UV2H2VaSdkhcjgAbqyEkm9gTyl
 KhbIGoqXoPJwt3E6u1G0/uehVTGae/MlOxsBQ3EILcK8zxlH+DPCwCxCyVe6Xz7646pojDMSi
 Kb0I=
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Matt Turner <mattst88@gmail.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Vineet Gupta <vgupta@synopsys.com>,
 kexec@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 4, 2021 at 8:49 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> Hi,
>
> SPARSEMEM memory model was supposed to entirely replace DISCONTIGMEM a
> (long) while ago. The last architectures that used DISCONTIGMEM were
> updated to use other memory models in v5.11 and it is about the time to
> entirely remove DISCONTIGMEM from the kernel.
>
> This set removes DISCONTIGMEM from alpha, arc and m68k, simplifies memory
> model selection in mm/Kconfig and replaces usage of redundant
> CONFIG_NEED_MULTIPLE_NODES and CONFIG_FLAT_NODE_MEM_MAP with CONFIG_NUMA
> and CONFIG_FLATMEM respectively.
>
> I've also removed NUMA support on alpha that was BROKEN for more than 15
> years.
>
> There were also minor updates all over arch/ to remove mentions of
> DISCONTIGMEM in comments and #ifdefs.

Hi Mike and Andrew,

It looks like everyone is happy with this version so far. How should we merge it
for linux-next? I'm happy to take it through the asm-generic tree, but linux-mm
would fit at least as well. In case we go for linux-mm, feel free to add

Acked-by: Arnd Bergmann <arnd@arndb.de>

for the whole series.
