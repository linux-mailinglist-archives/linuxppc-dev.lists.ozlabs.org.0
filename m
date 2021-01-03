Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 760D22E89DC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jan 2021 02:34:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7hBK3FsPzDqv2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jan 2021 12:34:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7h8m1SjZzDqDq
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Jan 2021 12:32:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=J/2WWRuu; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4D7h8m0QsVz9sVx
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Jan 2021 12:32:56 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4D7h8l72jKz9sVv; Sun,  3 Jan 2021 12:32:55 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.41.103;
 helo=mail-41103.protonmail.ch; envelope-from=skirmisher@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=J/2WWRuu; 
 dkim-atps=neutral
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4D7h8h2gpvz9sVr
 for <linuxppc-dev@ozlabs.org>; Sun,  3 Jan 2021 12:32:51 +1100 (AEDT)
Received: from mail-02.mail-europe.com (mail-02.mail-europe.com
 [51.89.119.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 78F8720025CC
 for <linuxppc-dev@ozlabs.org>; Sun,  3 Jan 2021 01:32:48 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="J/2WWRuu"
Date: Sun, 03 Jan 2021 01:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1609637552;
 bh=iGy/bfBWKKbuV9TiOepbx4mYbR80oJFZ+lF4H8NvxZA=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=J/2WWRuu/6om8FkdwMQTHUlB3rk5m+oX/C/CqSJabkImpLoxRXmevg8WrXKvC8CwO
 zM4X+pT0boKo5U9P37JDoE7PeW7F3tEFqXIdaPoVVhEbrjvXUTWpAfo8I5daUwgpv+
 fb68JhzVg7ChWa+WJdmKZEpXWT5w45tHy9oCq8PA=
To: linuxppc-dev@ozlabs.org
From: Will Springer <skirmisher@protonmail.com>
Subject: [PATCH 0/2] powerpc: fixes for 32-bit little-endian processes
Message-ID: <2191723.ElGaqSPkdT@sheen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Will Springer <skirmisher@protonmail.com>
Cc: eerykitty@gmail.com, daniel@octaforge.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are a couple small fixes that enable 32-bit little endian ("ppcle")
processes to run on a ppc64le kernel. Currently this is of interest for
the purposes of emulating ia32 programs with native userland assistance
via box86[1] (see PR#279 for initial ppc support), but a standalone
userland is functional, and may be used to complement a future ppcle
kernel port. We (those of us working on the userland effort in the
void-ppc project[2]) hope to come up with an ABI proposal to submit to
submit to the libc projects as a new port.

Cheers to Christophe Leroy and Michael Ellerman for converting the ppc
vDSO to C, and Michael in particular for tracking down a small issue
with it on ppcle, meaning the 32-bit LE vDSO gets to be functional
instead of half-broken with the old asm. (Sorry it took a minute to push
these patches, protonmail would not cooperate with git-send-email and then
I took off for the holidays.)

Cheers,
Will Springer [she/her]

[1]: https://github.com/ptitSeb/box86
[2]: https://voidlinux-ppc.org/

Joseph J Allen (1):
  powerpc: use kernel endianness in MSR in 32-bit signal handler

Will Springer (1):
  powerpc/compat_sys: swap hi/lo parts of 64-bit syscall args in LE mode

 arch/powerpc/kernel/signal_32.c |  3 +-
 arch/powerpc/kernel/sys_ppc32.c | 49 +++++++++++++++++++--------------
 2 files changed, 30 insertions(+), 22 deletions(-)

--=20
2.29.2





