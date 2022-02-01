Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 726554A5B06
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 12:19:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp2WZ0KWfz3cB2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 22:19:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=lkcl.net header.i=@lkcl.net header.a=rsa-sha256 header.s=201607131 header.b=Iz4ZubIZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=lkcl.net (client-ip=2a00:1098:82:f::1;
 helo=libre-soc.org; envelope-from=prvs=0031aac83d=lkcl@lkcl.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=lkcl.net header.i=@lkcl.net
 header.a=rsa-sha256 header.s=201607131 header.b=Iz4ZubIZ; 
 dkim-atps=neutral
Received: from libre-soc.org (libre-soc.org [IPv6:2a00:1098:82:f::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp1Cm6dT0z2yJL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 21:20:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
 References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RYSWcbSxnuhmATk3UyZnKMqgWoG9gWYjy/p7NhCSqE0=; b=Iz4ZubIZ4A7ydUOKzD9BYwytR7
 ZbTW7B8kyaib05b4JPhOgQjM50UwjUVKMmdzDv8Vqodr3tU6zIm+MFpVbS8DuRnd/qkU1MqciI55Y
 i3YAWgOgjxtsvtupKXfIDm0tKjmSJUysQdzH1s1Fi1Kp2lbR2QsJiAHprvi5/rcEu1wI=;
Received: from mail-qv1-f51.google.com ([209.85.219.51])
 by libre-soc.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <lkcl@lkcl.net>) id 1nEqGv-00045N-Sh
 for linuxppc-dev@lists.ozlabs.org; Tue, 01 Feb 2022 10:20:25 +0000
Received: by mail-qv1-f51.google.com with SMTP id s6so15490266qvv.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Feb 2022 02:20:25 -0800 (PST)
X-Gm-Message-State: AOAM530z90dm5+9/tV29l4bsXKXAoptncOAFkRcZnDJe6Huz1SVsYemd
 nkCTjRNEQVJZQlN8KhtEiuMHVI1wnYvE8hiNyGw=
X-Google-Smtp-Source: ABdhPJx2xn1odYe22wQxPXxAfAgL97npFZ0KdorC1K9D6+yB1qQMbCVd2jgQPzwodl3Ao/oj7tcl7NDHfszDv60frhs=
X-Received: by 2002:a05:6122:c83:: with SMTP id
 ba3mr9409387vkb.27.1643709185072; 
 Tue, 01 Feb 2022 01:53:05 -0800 (PST)
MIME-Version: 1.0
References: <CAPweEDw710zFK8KLZY5gsQxEkQKrDiFkNRgABY9HJZ1rxpeVCg@mail.gmail.com>
 <1643598916.2hjoqtw60c.astroid@bobo.none>
 <994E627C-0194-4634-8DBC-0845493E6744@gmail.com>
 <1643696448.f3llnvzeyb.astroid@bobo.none>
In-Reply-To: <1643696448.f3llnvzeyb.astroid@bobo.none>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Tue, 1 Feb 2022 09:52:53 +0000
X-Gmail-Original-Message-ID: <CAPweEDzwFK6zRxu5dXMDd_bqX=WTRQ97s9GHjJPW5Uu=Hc0qLQ@mail.gmail.com>
Message-ID: <CAPweEDzwFK6zRxu5dXMDd_bqX=WTRQ97s9GHjJPW5Uu=Hc0qLQ@mail.gmail.com>
Subject: Re: microwatt booting linux-5.7 under verilator
To: Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 01 Feb 2022 22:18:49 +1100
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
Cc: openpower-hdl-cores
 <openpower-hdl-cores@mailinglist.openpowerfoundation.org>,
 Libre-Soc General Development <libre-soc-dev@lists.libre-soc.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 1, 2022 at 6:27 AM Nicholas Piggin <npiggin@gmail.com> wrote:

> Not sure of the details on that. Is it memcpy()ing out of ROM or RAM to
> RAM? Is this in the arch boot code? (I don't know very well).

RAM to RAM.  arch/powerpc/boot/main.c:

    if (uncompressed_image) {
        memcpy(addr, vmlinuz_addr + ei.elfoffset, ei.loadsize);
        printf("0x%lx bytes of uncompressed data copied\n\r",
               ei.loadsize);
        goto out;
    }

in some systems those would be two different types of RAM,
(one would be on-board SRAM, the target would be DRAM
which had previously been initialised by the previous chain-boot
loader e.g. u-boot)

[in other circumstances, the source location might be addressable
SPI NOR flash, which would be slower, expensive, and therefore
compression is plain common sense, in which case it's out of
scope for this discussion.]

in the case of the simulation - and also in the case of the
WinCE Smartphone hand-held reverse-engineering using
GNUHARET.EXE (similar to LOADLIN.EXE if anyone remembers
that) - the uncompressed initramfs are both in the same
RAM, so the memcpy is completely redundant.

the only good reason for the memcpy would be to ensure
that the start location is at a known-fixed offset, and of course
that can be arranged in advance by the simulator.  even if
it has to be at 0x0000_0000_0000_0000 that can be arranged
by moving the cold-boot loader to an alternative hard-reset
start address and telling the simulated-core to start from there.

> >
> > other areas are the memset before VM is set up, followed by memset *again* on.individual pages once created.  those are an hour each
>
> Seems like we could should avoid the duplication and maybe be able to
> add an option to skip zeroing (I thought there was one, maybe thinking
> of something else).

it makes sense for security reasons (on real hardware) - a simulation
not so much, it's guaranteed to be all-zeros at startup.

> Are you using optimize for size? That can result in much slower code in
> some places. In skiboot we compile some of the string.h library code
> with -O2 for example.

interesting - no, this is default options.  have to be careful not to
introduce any VSX instructions (the core doesn't have them).

   CROSS_COMPILE="ccache powerpc64le-linux-gnu-" \
   ARCH=powerpc \
   make -j16 O=microwatt

l.
