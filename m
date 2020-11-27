Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE602C699F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 17:45:01 +0100 (CET)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjL891MWmzDrhj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 03:44:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=urezki@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=udwA9p34; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjL4R5f0RzDrfl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 03:41:38 +1100 (AEDT)
Received: by mail-lf1-x144.google.com with SMTP id a9so7873582lfh.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 08:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rgkrb035jm9NJnipoFNp6J644nVoW0SJU1WZzjzA+oA=;
 b=udwA9p34XKAzVdUynfyA3sUQIHdQlG/KghvzCRzcKIP+V6Ez0oaYWmUIVE5rTY6I/e
 CW4TCmiSwaTCiKDJXkn7LgN9+fjAGq6lrtbJ42gd4XLIk+N7/71H4pKuqh3TBy79TYvM
 1kOi7hd6b/9KCo6JhpWznw7poOjXY8a3z00zANtR8Fr+yhOvY1eHPYt8clzfeCOb4inW
 7HkL1Lx0rdIJN4uiRZH4AjcAap7qCC/+qWIn7hgSHtQ4+Vw8yB773T7eD9kntRacbjET
 xTJA12M/jwG7M8J0tS6CXBOGuRaO7dRGqyaBJ9KUdV7oMYH39dT18YhqJomNnBOHMnUk
 BAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rgkrb035jm9NJnipoFNp6J644nVoW0SJU1WZzjzA+oA=;
 b=jfyQTCXGSDqepeiO6Z/OZWSHEdWULYIhyMu1S72+kDKV8Cm4F0opJqETbIni8z4LSx
 z9EpQ5dxKmQo0blWkLAAWbTz+gZ5G/kHRZYcMlQwxPtRcj/DwvwjFQffcJjIytsSG4nW
 xdzLR4sRIH6McywfQkFy8UHIS+97IapHervSgcf/9i5QiNVDUB4AxPFXAAMZjVqsKJ7D
 /j/UMWKwaF/1m5dvJbBpjp1JAbxGQlsviy+zskNN2c0nbswLq0Hb0gLXMrYkLo2vQaRw
 1l8mRqAqy/PPY9E7m65Nk0b/zKDl1CBEgiYanJ715WlWLQzxZbm+lhBCyucJb/OvHlTV
 qSPA==
X-Gm-Message-State: AOAM5327TaFcOp/3cLm2M6QgdeIyMqCyLTXSQGCh7BYo9n0SuSrOViNf
 25XqrmFmMJ+G/E1iaJHZVnw=
X-Google-Smtp-Source: ABdhPJzRxFJh5kMK+j5klpIKR50QifbYdGTWz6/104SUlMn5MLebth9HJ3j5Q4yoeCN71TH/Be22kw==
X-Received: by 2002:a19:e46:: with SMTP id 67mr3959180lfo.108.1606495291010;
 Fri, 27 Nov 2020 08:41:31 -0800 (PST)
Received: from pc638.lan (h5ef52e3d.seluork.dyn.perspektivbredband.net.
 [94.245.46.61])
 by smtp.gmail.com with ESMTPSA id 4sm1012291ljf.96.2020.11.27.08.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 08:41:30 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc638.lan>
Date: Fri, 27 Nov 2020 17:41:28 +0100
To: Daniel Axtens <dja@axtens.net>
Subject: Re: powerpc 5.10-rcN boot failures with RCU_SCALE_TEST=m
Message-ID: <20201127164128.GA47008@pc638.lan>
References: <87eekfh80a.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eekfh80a.fsf@dja-thinkpad.axtens.net>
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
Cc: rcu@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Hi all,
> 
> I'm having some difficulty tracking down a bug.
> 
> Some configurations of the powerpc kernel since somewhere in the 5.10
> merge window fail to boot on some ppc64 systems. They hang while trying
> to bring up SMP. It seems to depend on the RCU_SCALE/PERF_TEST option.
> (It was renamed in the 5.10 merge window.)
> 
> I can reproduce it as follows with qemu tcg:
> 
> make -j64 pseries_le_defconfig
> scripts/config -m RCU_SCALE_TEST
> scripts/config -m RCU_PERF_TEST
> make -j 64 vmlinux CC="ccache gcc"
> 
> qemu-system-ppc64 -cpu power9 -M pseries -m 1G -nographic -vga none -smp 4 -kernel vmlinux
> 
> ...
> [    0.036284][    T0] Mount-cache hash table entries: 8192 (order: 0, 65536 bytes, linear)
> [    0.036481][    T0] Mountpoint-cache hash table entries: 8192 (order: 0, 65536 bytes, linear)
> [    0.148168][    T1] POWER9 performance monitor hardware support registered
> [    0.151118][    T1] rcu: Hierarchical SRCU implementation.
> [    0.186660][    T1] smp: Bringing up secondary CPUs ...
> <hangs>
>
I am not sure if that is helpful but i checked it on my x86_64 system
using the cross compiled for powerpc Linux kernel:

<snip>
urezki@pc638:~/data/coding/linux-rcu.git$ powerpc64-linux-gnu-gcc
--version
powerpc64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0
Copyright (C) 2018 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is
NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.

urezki@pc638:~/data/coding/linux-rcu.git$
<snip>

with ARCH=powerpc make -j64 pseries_defconfig configuration. I used the 5.10.0-rc1 kernel.

<snip>
urezki@pc638:~/data/coding/linux-rcu.git$ qemu-system-ppc64 --version
QEMU emulator version 3.1.0 (Debian 1:3.1+dfsg-8+deb10u8)
Copyright (c) 2003-2018 Fabrice Bellard and the QEMU Project developers
urezki@pc638:~/data/coding/linux-rcu.git$
<snip>

On my setup i can run the kernel with and without the modules which are
in question. So

qemu-system-ppc64 -cpu power9 -M pseries -m 1G -nographic -vga none -smp 4 -kernel ./vmlinux

works for both cases, with RCU_SCALE and without.

Just in case, maybe this information can be useful also.

--
Vlad Rezki
