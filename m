Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B01CA14B0BC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 09:14:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486KBx4YDXzDqG0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 19:14:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.a=rsa-sha256 header.s=google header.b=YsPuHSyJ; 
 dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486K8t43rtzDqDx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 19:12:13 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id n25so8398631lfl.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 00:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YtcRS1L5k8wBwwPdgRKCV0zDBNlxax9vadneAgBCrDM=;
 b=YsPuHSyJhbIqoeJPTniUj3/nc9kroQ5qUmdrzSLMXulbuST72e/qK6II+7d2ypcXnL
 WQoSVOv4y9f3Ov9svBNHmkQ16+V+HhE5ezmG18N673upe2+lor6gIHHtJd3a7p1v4qA+
 Fsxg2JFNAHVGCkVHzFvd7NiYxfQgKUd9XmN1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YtcRS1L5k8wBwwPdgRKCV0zDBNlxax9vadneAgBCrDM=;
 b=ZMNKxuNPhz0C/4dbV3IDAg40zjHN4AWZgfwiP5KBPpVTqDrRZSr7S20hwDbtYlK6cf
 0gfBIm2pFIKL4xjEsqND0xL50KdeZdSpokn7ADW/aeR0G/bZwfgMGH1GnEHEjMDq3SYl
 gotCyPFyQ+kjJAVRymhaHY9TkV91DS9DShNORkRp7M+5jorOZHs1/FEPrA7lykTOY7aA
 cRgiPNbwg62cVFZTZCgZMvQ89dB6m3M/FTECUWTlZbfWdBz/7nnrErq9l/BuItNvmzX/
 WX+Y+/DtVVnp5wpdAe5YbbUPwunlz3DoTApmEvSPqcvNuhco1tHCqlaEo7R8KsPKjLA0
 BaHQ==
X-Gm-Message-State: APjAAAUH4bE7mXg3z261+TMQ+HkZqKh2+cYJ9YBPlUAx5LD2GpS35+DQ
 z88D1oBenlPhC+bvLdPnsNhZMw==
X-Google-Smtp-Source: APXvYqxHAUbMIrGBLdv8Yti7EDHcHua1MWBUehPXejuLPYcnKyCX57FpmTzajDy4Sg/aAffBMQXHgA==
X-Received: by 2002:ac2:5964:: with SMTP id h4mr1665454lfp.213.1580199127298; 
 Tue, 28 Jan 2020 00:12:07 -0800 (PST)
Received: from [172.16.11.50] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id i13sm9246212ljg.89.2020.01.28.00.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 00:12:06 -0800 (PST)
Subject: Re: vmlinux ELF header sometimes corrupt
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: LKML <linux-kernel@vger.kernel.org>
References: <71aa76d0-a3b8-b4f3-a7c3-766cfb75412f@rasmusvillemoes.dk>
Message-ID: <5997e9b6-95fd-405b-05f8-16f9e34d9d87@rasmusvillemoes.dk>
Date: Tue, 28 Jan 2020 09:12:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <71aa76d0-a3b8-b4f3-a7c3-766cfb75412f@rasmusvillemoes.dk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
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
Cc: linux-ext4@vger.kernel.org,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22/01/2020 18.52, Rasmus Villemoes wrote:
> I'm building for a ppc32 (mpc8309) target using Yocto, and I'm hitting a
> very hard to debug problem that maybe someone else has encountered. This
> doesn't happen always, perhaps 1 in 8 times or something like that.
> 
> The issue is that when the build gets to do "${CROSS}objcopy -O binary
> ... vmlinux", vmlinux is not (no longer) a proper ELF file, so naturally
> that fails with
> 
>   powerpc-oe-linux-objcopy:vmlinux: file format not recognized
> 
> So I hacked link-vmlinux.sh to stash copies of vmlinux before and after
> sortextable vmlinux. Both of those are proper ELF files, and comparing
> the corrupted vmlinux to vmlinux.after_sort they are identical after the
> first 52 bytes; in vmlinux, those first 52 bytes are all 0.
> 
> I also saved stat(1) info to see if vmlinux is being replaced or
> modified in-place.
> 
> $ cat vmlinux.stat.after_sort
>   File: 'vmlinux'
>   Size: 8608456     Blocks: 16696      IO Block: 4096   regular file
> Device: 811h/2065d  Inode: 21919132    Links: 1
> Access: (0755/-rwxr-xr-x)  Uid: ( 1000/    user)   Gid: ( 1001/    user)
> Access: 2020-01-22 10:52:38.946703081 +0000
> Modify: 2020-01-22 10:52:38.954703105 +0000
> Change: 2020-01-22 10:52:38.954703105 +0000
> 
> $ stat vmlinux
>   File: 'vmlinux'
>   Size: 8608456         Blocks: 16688      IO Block: 4096   regular file
> Device: 811h/2065d      Inode: 21919132    Links: 1
> Access: (0755/-rwxr-xr-x)  Uid: ( 1000/    user)   Gid: ( 1001/    user)
> Access: 2020-01-22 17:20:00.650379057 +0000
> Modify: 2020-01-22 10:52:38.954703105 +0000
> Change: 2020-01-22 10:52:38.954703105 +0000
> 
> So the inode number and mtime/ctime are exactly the same, but for some
> reason Blocks: has changed? This is on an ext4 filesystem, but I don't
> suspect the filesystem to be broken, because it's always just vmlinux
> that ends up corrupt, and always in exactly this way with the first 52
> bytes having been wiped.

So, I think I take that last part back. I just hit a case where I built
the kernel manually, made a copy of vmlinux to vmlinux.copy, and file(1)
said both were fine (and cmp(1) agreed they were identical). Then I went
off and did work elsewhere with a lot of I/O. When I came back to the
linux build dir, vmlinux was broken, exactly as before. So I now suspect
it to be some kind of "while the file is in the pagecache, everything is
fine, but when it's read back from disk it's broken".

My ext4 fs does have inline_data enabled, which could explain why the
corruption happens in the beginning. It's just very odd that it only
ever seems to trigger for vmlinux and not other files, but perhaps the
I/O patterns that ld and/or sortextable does are exactly what are needed
to trigger the bug.

I've done a long overdue kernel update, and there are quite a few
fs/ext4/ -stable patches in there, so now I'll see if it still happens.
And if anything more comes of this, I'll remove the kbuild and ppc lists
from cc, sorry for the noise.

Rasmus
