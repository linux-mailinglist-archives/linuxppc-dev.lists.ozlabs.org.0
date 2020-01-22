Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E32EF145B30
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 18:54:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482tMV3py0zDqPv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 04:54:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.a=rsa-sha256 header.s=google header.b=YqqjYCS4; 
 dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482tKD3fyzzDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 04:52:27 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id r19so10383ljg.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 09:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Kwfb980H2zFKYYbHaFvisTOICKVRfP4l7wqRW0yzW7k=;
 b=YqqjYCS469tBGefnBZCHaLOnvCEU6RwmU1Ym07beUKu4bL09uWTNZ1nt968GsPQoOq
 hbv2BR2GZt2/EJClXZnd1ehzVW5dPVI+a/fu8bRIymQ4uovVqAAAT6xartThfhLh7E7X
 6S9Zvq6eJl2OlyLkBfi1N/AcYSjc/JsxYa8N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Kwfb980H2zFKYYbHaFvisTOICKVRfP4l7wqRW0yzW7k=;
 b=OjCKkstfFJ3rqJrDJNyaKqftQU9BumX01SEthww4I+Rpc22YrPKeVDMJzmfWoi4Ckz
 6YtXo2G2oJqtiXO7Vk9EaPGzoG9KF2YrGQLxy3CMvIh5fpOSiQfkxlMGz6ZsRZPlfnYI
 Am4N5ra+LC4ZXZK8TD8T5PdYEskFfiVTtSnaM3uIW20IiltC5hHnJHD6DA2H+1q486tK
 YpsJeyEYn4yC1I2CME80fDKIc5yx6h+1OWeK0ZRNKX1SkV7zi9ZAIjR7EfX7pXXi1gsy
 8tkgE5FZIq0QvkTPEbN1YXS4Onjm2FdSYABh9ovTHFVIdrTDnc6XEXPq8enbZ5vYUv4l
 Uczg==
X-Gm-Message-State: APjAAAU2loI0m08XyWszyrGQeILGWJ1BkBXB3tfpy17kb5BlYOQxQ2Vf
 QuDsN4xN8xDQp4/9iwhQsoj1tGkMWQq0Ru9L
X-Google-Smtp-Source: APXvYqzjSckBf1b85YfqGd+aDBBQkbREIKg8UrhShurtzZaYsPKOvuFLad0ZOZ/cNOpPlfEgL2IiHg==
X-Received: by 2002:a2e:8595:: with SMTP id b21mr18485013lji.219.1579715542683; 
 Wed, 22 Jan 2020 09:52:22 -0800 (PST)
Received: from [172.16.11.50] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id f16sm20549672ljn.17.2020.01.22.09.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2020 09:52:22 -0800 (PST)
To: LKML <linux-kernel@vger.kernel.org>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: vmlinux ELF header sometimes corrupt
Message-ID: <71aa76d0-a3b8-b4f3-a7c3-766cfb75412f@rasmusvillemoes.dk>
Date: Wed, 22 Jan 2020 18:52:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I'm building for a ppc32 (mpc8309) target using Yocto, and I'm hitting a
very hard to debug problem that maybe someone else has encountered. This
doesn't happen always, perhaps 1 in 8 times or something like that.

The issue is that when the build gets to do "${CROSS}objcopy -O binary
... vmlinux", vmlinux is not (no longer) a proper ELF file, so naturally
that fails with

  powerpc-oe-linux-objcopy:vmlinux: file format not recognized

So I hacked link-vmlinux.sh to stash copies of vmlinux before and after
sortextable vmlinux. Both of those are proper ELF files, and comparing
the corrupted vmlinux to vmlinux.after_sort they are identical after the
first 52 bytes; in vmlinux, those first 52 bytes are all 0.

I also saved stat(1) info to see if vmlinux is being replaced or
modified in-place.

$ cat vmlinux.stat.after_sort
  File: 'vmlinux'
  Size: 8608456     Blocks: 16696      IO Block: 4096   regular file
Device: 811h/2065d  Inode: 21919132    Links: 1
Access: (0755/-rwxr-xr-x)  Uid: ( 1000/    user)   Gid: ( 1001/    user)
Access: 2020-01-22 10:52:38.946703081 +0000
Modify: 2020-01-22 10:52:38.954703105 +0000
Change: 2020-01-22 10:52:38.954703105 +0000

$ stat vmlinux
  File: 'vmlinux'
  Size: 8608456         Blocks: 16688      IO Block: 4096   regular file
Device: 811h/2065d      Inode: 21919132    Links: 1
Access: (0755/-rwxr-xr-x)  Uid: ( 1000/    user)   Gid: ( 1001/    user)
Access: 2020-01-22 17:20:00.650379057 +0000
Modify: 2020-01-22 10:52:38.954703105 +0000
Change: 2020-01-22 10:52:38.954703105 +0000

So the inode number and mtime/ctime are exactly the same, but for some
reason Blocks: has changed? This is on an ext4 filesystem, but I don't
suspect the filesystem to be broken, because it's always just vmlinux
that ends up corrupt, and always in exactly this way with the first 52
bytes having been wiped.

Any ideas?

Rasmus
