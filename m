Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC943CC9D7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jul 2021 18:14:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSVRW0ymZz3bWd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 02:14:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ElkEONji;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ElkEONji; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSVR646yCz2xyG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 02:14:09 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id t185so14308507qkd.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jul 2021 09:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9pTKSaEiqDPuxq1mYJI/hsCyKbG+BA3UnWw1ZtFqKm0=;
 b=ElkEONjioNv3x10NwxzQZ6Al9CdjKVXOBfQv5IhYDghffSGRtUtrQeeINcJjw1Pzpk
 d53X6R8XDBoUR1FP/jYt9vTjXoycCbfn5q7Cuwb3jEPMd9YJyn2AO6fktFoyEQ4PsgnE
 mh47P6NucS+ifU2vxZYXWPg2xGvoj5UsydLb//DfgwvYK22Zvgr8llcjpRWK/D4dKXyO
 jh6F0eT8g5LdIjZR5H1f0TLJoEWo2gCvgdujgNV36+sqXSKyE/d4eGVvgTLGnWV/kF8p
 C+HDRGH0zJj8uZ4hyq5e45Eb1dw0wvI8b94FW7N+VB3bcTCIRukVN60VwD32Pe2WvkSL
 ejHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9pTKSaEiqDPuxq1mYJI/hsCyKbG+BA3UnWw1ZtFqKm0=;
 b=M85lyIGLYXpe7bt2pGRttUbX4EwZR8/29cL7hdAO8BPCjr7n8ftF5hVCixjz713A77
 QcwXcxfoNRDSing6rxJCtiHJcjF0sQ/04TAPFSXEWzg6PNb02ynKNWw7FDUrnyFYldQ2
 JXtOrvwa+HQpvvfqKBnWLvkSZ7uTiGBvnRBHsTOavUcnzNbARg8q+WV34/K4A4zTH1GK
 dUMRXcnUHfrx+16qhkOlJt5GJ1J3BHxaHBe0WB1EcKSGNX3f5f/47nGuPZQyM9SeRJuT
 2qMBA3vCCVAzJYlrnpEf3TPTRlxzC60Ag0jdwJZOrqwZxh4hFZHGFN27lDQZS0O3fzY1
 tofQ==
X-Gm-Message-State: AOAM530UGMSE+3m6LgOnkoA94xd2YMzCRNlBhs1BPI3JQ45DAlGj41pD
 G5j6EuByRtGgFkKAWP9VL7mwbWq8Yo5djNwsbqE=
X-Google-Smtp-Source: ABdhPJxiZsJIqhv1xjnG/CmFewSFHA+ZoMChKKgGSLug7kQHn/3ZDq5tc5xeMRMHtbFEdq/brCmWaddcuQcE+IuKhjU=
X-Received: by 2002:a05:620a:2289:: with SMTP id
 o9mr20410100qkh.34.1626624845818; 
 Sun, 18 Jul 2021 09:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210716221159.3587039-1-linux@roeck-us.net>
 <CAOSf1CHuLhYO1rXiAhPz6xyQ-GgrjE-dj=Af6v7CWSH6QroEtQ@mail.gmail.com>
 <20210717161438.GA3038659@roeck-us.net>
In-Reply-To: <20210717161438.GA3038659@roeck-us.net>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 19 Jul 2021 02:13:54 +1000
Message-ID: <CAOSf1CEN6022gv_=O9fwyDtJ7ibmXnH+LrpRQvGXTZ22RH-u1g@mail.gmail.com>
Subject: Re: [PATCH] powerpc/chrp: Revert "Move PHB discovery" and "Make
 hydra_init() static"
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 18, 2021 at 2:14 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Sun, Jul 18, 2021 at 01:54:23AM +1000, Oliver O'Halloran wrote:
> > On Sat, Jul 17, 2021 at 8:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > This patch reverts commit 407d418f2fd4 ("powerpc/chrp: Move PHB
> > > discovery") and commit 9634afa67bfd ("powerpc/chrp: Make hydra_init()
> > > static").
> > >
> > > Running the upstream kernel on Qemu's brand new "pegasos2" emulation
> > > results in a variety of backtraces such as
> >
> > ...and actually using it appears to require both manually enabling it
> > in the qemu config and finding a random bios blob that is no longer
> > distributed by the manufacturer. Cool.
> >
> That is absolutely wrong. vof.bin provided by qemu in the linux root
> directory works just fine, plus chrp32_defconfig minus SMP.

It looks like I forgot to actually merge the current HEAD into my
local qemu branch which was a few weeks old. VOF support was merged on
the 13th so I didn't see it. My apologies.

Oliver
