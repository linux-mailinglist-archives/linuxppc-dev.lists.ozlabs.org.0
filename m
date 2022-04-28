Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B98A512B04
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 07:37:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpkss0rrmz3bpW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 15:37:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=landley-net.20210112.gappssmtp.com header.i=@landley-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=uYP6FXAa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=landley.net
 (client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com;
 envelope-from=rob@landley.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=landley-net.20210112.gappssmtp.com
 header.i=@landley-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=uYP6FXAa; dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kpks955VFz2xss
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 15:37:15 +1000 (AEST)
Received: by mail-oi1-x22d.google.com with SMTP id v65so4285436oig.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 22:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ekTMYfKN4Uc3BCAaUC6PjjI1eropAXAKK6yzSfYoPZQ=;
 b=uYP6FXAa44WowIDHRUVfNIip0AGy6zCpsETHHjhF7Zl/yOdujbUUprivnkMotrLtXx
 oUMpa9a79sR7bDBbs6YL1S751j9eWFFqdhFeXpj77xYJBge/qTpGHR4LVTO9sBBy/3xm
 lc13C94YlKOP+EtQIfuBQtSzV4vk606ndP0KD7RE8icCOl5WFkPrci1uSpYeBIsi3vbc
 DhKsVdj9jqW27dOdTAg6FeBam/lHr6+HCRD8A93MjAOmM/gOqOeGhswnHzIgWU3qwZVn
 d27Rmw9Oduv6eBq5T8BQj3zZsGcHjZTqEFSzfKgZEZ4mhNA/MWG+r7wim/fD8Mlk+TYh
 2Qlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ekTMYfKN4Uc3BCAaUC6PjjI1eropAXAKK6yzSfYoPZQ=;
 b=gKWqedykPYthqyonHSvkLp+JRpdQdovAeOWpXXOI/7eO2o3dgZkCrKS8mqsgq1cd1W
 JcLbzkwsD5eDiFE7c84mzuweCyi0nfOJc0jPbz6T8V6gTtBFGSbYAQMv2q9tgxS6SfEd
 6iNVjx/a6nbg0kUwz+uULsfRchtAAh0SU/icKO0t9PFGsm9SV9WKVi4beWYyYHO4KNE/
 iQvxz1COEIiDLzRpUhKYaf4f6fLPIOMOS+qiUukf2oCPEanbbi5ozDMI4vG/G2SCdUnE
 iElZB1m1enCWLoBaKLBtGxDsTWOkxttMilM2Ec942bzXeUHAgarFlTuzLJ4+pOLllyvJ
 /TiQ==
X-Gm-Message-State: AOAM531Wthtpf+5HOYNeKMuxOAhyP2JsREMu2jZGoRQ4f11oR6DX/nDH
 4K9TYVWbhPDoOA4iDZ5oaJN3Zg==
X-Google-Smtp-Source: ABdhPJxFA8mZVt+UhH4U9JDki2YUe5sdvuzeejBQJeXjkM3bpQHKXZBSTWGAQ5iAkLb4sGLxTrsG1A==
X-Received: by 2002:a05:6808:1886:b0:322:f55c:133d with SMTP id
 bi6-20020a056808188600b00322f55c133dmr14724917oib.217.1651124231505; 
 Wed, 27 Apr 2022 22:37:11 -0700 (PDT)
Received: from [192.168.86.188] ([136.62.4.88])
 by smtp.gmail.com with ESMTPSA id
 bp17-20020a056808239100b00322c34c4afbsm6948218oib.25.2022.04.27.22.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 22:37:10 -0700 (PDT)
Message-ID: <ba41f9ab-bce4-b377-e99c-caa0d8240308@landley.net>
Date: Thu, 28 Apr 2022 00:41:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: serial hang in qemu-system-ppc64 -M pseries
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <74b9755a-4b5d-56b1-86f5-0c5c7688845a@landley.net>
 <8558c117-75a0-dc73-9b1a-be128e04056c@redhat.com>
From: Rob Landley <rob@landley.net>
In-Reply-To: <8558c117-75a0-dc73-9b1a-be128e04056c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: qemu-ppc@nongnu.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/27/22 10:27, Thomas Huth wrote:
> On 26/04/2022 12.26, Rob Landley wrote:
>> When I cut and paste 80-ish characters of text into the Linux serial console, it
>> reads 16 characters and stops. When I hit space, it reads another 16 characters,
>> and if I keep at it will eventually catch up without losing data. If I type,
>> every character shows up immediately.
> 
> That "16" certainly comes from VTERM_BUFSIZE in hw/char/spapr_vty.c in the 
> QEMU sources, I think.
> 
>> (On other qemu targets and kernels I can cut and paste an entire uuencoded
>> binary and it goes through just fine in one go, but this target hangs with big
>> pastes until I hit keys.)
>> 
>> Is this a qemu-side bug, or a kernel-side bug?
>> 
>> Kernel config attached (linux 5.18-rc3 or thereabouts), qemu invocation is:
>> 
>> qemu-system-ppc64 -M pseries -vga none -nographic -no-reboot -m 256 -kernel
>> vmlinux -initrd powerpc64leroot.cpio.gz -append "panic=1 HOST=powerpc64le
>> console=hvc0"
> 
> Which version of QEMU are you using?

$ qemu-system-ppc64 --version
QEMU emulator version 6.2.92 (v6.2.0-rc2)
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

From november. I can pull and rebuild but it'll take a bit. (Hopefully
rebuilding would fix the need to echo -e '\e[?7h' afterwards to undo the "bash
command line history marches up the screen because qemu's x86 bios disabled line
wrap and then left it that way" issue...)

> Which frontend (GTK or terminal?) ... 

The above command line has -nographic, forcing terminal. Running ldd on the
binary doesn't pull up anything gtk. (It pulls up libncursesw though.)

If you want to reproduce my test locally:

wget https://landley.net/toybox/downloads/binaries/mkroot/0.8.5/powerpc64le.tgz
tar xvzf powerpc64le.tgz
cd powerpc64le
./qemu-*.sh

Then paste something longer than 16 characters at the eventual command prompt
once the kernel finishes booting.

If you want to reproduce it all from source:

git clone https://github.com/landley/toybox
cd toybox && mkdir ccc && cd ccc
wget
https://landley.net/toybox/downloads/binaries/toolchains/latest/powerpc64le-linux-musl-cross.tar.xz
-O - | tar xv
cd ..
CROSS=powerpc64le LINUX=~/linux scripts/mkroot.sh
cd root/powerpc64le
./qemu-*.sh

This assumes your linux kernel source directory is in ~/linux of course, and
that qemu-system-ppc64 is in the $PATH...

> this rings a distant bell, but I thought we had fixed these issues long ago 
> in the past... e.g.:
>
> https://yhbt.net/lore/all/1380113886-16845-10-git-send-email-mdroth@linux.vnet.ibm.com/
> 
> https://git.qemu.org/?p=qemu.git;a=commitdiff;h=8a273cbe53221d28

The qemu I'm running is newer than 2016. :)

Most targets are fine with this: I cut and paste entire uuencoded binaries into
the serial console as an easy way to insert a file into an initramfs. It can
usually take multiple megabytes without dropping a character, so you just
"uudecode" enter, and then paste.

Even my 32 bit powerpc target works fine with this. (Although -M g3beige is a
very different machine from -M pseries...)

Alas this target (and sh4 -m r2d) stop at 16 chars. (On sh4 the extra is
discarded, not delivered progressively as more interrupts are generated.)

> ... but maybe my memory also just fails and this has never been properly fixed.
> 
>   Thomas

Rob
