Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3FF64859
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 16:29:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kM5n5jH2zDqfY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 00:29:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=stackframe.org
 (client-ip=2001:470:70c5:1111::170; helo=smtp.duncanthrax.net;
 envelope-from=svens@stackframe.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=stackframe.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=duncanthrax.net header.i=@duncanthrax.net
 header.b="bkZVcuul"; dkim-atps=neutral
Received: from smtp.duncanthrax.net (smtp.duncanthrax.net
 [IPv6:2001:470:70c5:1111::170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kM0b2sC5zDq75
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 00:25:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date;
 bh=AF9TbuWmrW1CqKM/1yWsmA/ovj9LMicONWkNU/F2Xb8=; b=bkZVcuulQ9ra/XYBykfCSpCnRz
 ScftP6j7275ilEmMjM11dHEXGYLMIP7gmTnqtyIpLuKQmAC/Zy37Ntsl9r64/T7SV3KmeoSnsTdlY
 e/fV+jwwE1KQdaaHWrdpDdhWGoegFiVHUBJC1ubJyq059QRR0D76MF6/EFaHQxbcAvmI=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
 by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.86_2) (envelope-from <svens@stackframe.org>)
 id 1hlDWn-0004O1-5C; Wed, 10 Jul 2019 16:25:01 +0200
Date: Wed, 10 Jul 2019 16:24:59 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2 1/7] kexec: add KEXEC_ELF
Message-ID: <20190710142459.GA31679@t470p.stackframe.org>
References: <20190709194328.16991-1-svens@stackframe.org>
 <20190709194328.16991-2-svens@stackframe.org>
 <64306f6c-0a0d-a6ea-537c-5e72deaba1c0@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64306f6c-0a0d-a6ea-537c-5e72deaba1c0@c-s.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linuxppc-dev@lists.ozlabs.org, deller@gmx.de, kexec@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Wed, Jul 10, 2019 at 01:19:13PM +0000, Christophe Leroy wrote:
> Hi Sven,
> 
> On 07/09/2019 07:43 PM, Sven Schnelle wrote:
> > Right now powerpc provides an implementation to read elf files
> > with the kexec_file() syscall. Make that available as a public
> > kexec interface so it can be re-used on other architectures.
> > 
> > Signed-off-by: Sven Schnelle <svens@stackframe.org>
> > ---
> >   arch/Kconfig                       |   3 +
> >   arch/powerpc/Kconfig               |   1 +
> >   arch/powerpc/kernel/kexec_elf_64.c | 551 +----------------------------
> >   include/linux/kexec.h              |  24 ++
> >   kernel/Makefile                    |   1 +
> >   kernel/kexec_elf.c                 | 537 ++++++++++++++++++++++++++++
> >   6 files changed, 576 insertions(+), 541 deletions(-)
> >   create mode 100644 kernel/kexec_elf.c
> 
> Why are you persisting at not using -C when creating your patch ? Do you
> want to hide the changes you did while copying
> arch/powerpc/kernel/kexec_elf_64.c to kernel/kexec_elf.c ?
> Or you want to make life harder for the reviewers ?

Sorry, never used -C before. I used:

git send-email --annotate -v2 -7 --to kexec@lists.infradead.org --cc deller@gmx.de,linuxppc-dev@lists.ozlabs.org -v --format-patch -C -M

However, it looks like it only works when started this way:

git send-email --format-patch -M -C --annotate -v2 -7 --to kexec@lists.infradead.org --cc deller@gmx.de,linuxppc-dev@lists.ozlabs.org -v

I'll resend v2.

Best Regards,
Sven
