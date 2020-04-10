Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D1F1A4B78
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 23:01:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zVmj19gyzDrHY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 07:01:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ut1qaZ/3; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zVkd0J36zDr9y
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Apr 2020 06:59:36 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id l23so3032988otf.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 13:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=CXatplF2gFGhsFXtR5R2cbW0avLQtJfes43JimQqH74=;
 b=ut1qaZ/3JRMO+4HVhVkz/1RzYg4syfBlYujJdsulPRlFyO7HyTtctPFXyR+ZoSHsvy
 1K3V/yQnGWsXKVzNIPXSKCAQKgpnT/zs+5TbD4oTkxOIR+VkPc5CceTq+H5QS2JkPAnw
 4Ew5SRz6ORJ4MdZWD2PvOty59z3GLWyz/d1Vt+mWWTxR7CvzVBXREsvk3ipZ1mpY/eNY
 RJoLQt/z7CYme3XeCf8H0mgzGPOSom70Z0pDK3zoEQ5l5hHxs2XUFXaKqurXPXgFQ1LY
 4zCYQI4lHbFauljXr3+IwZI9GtMsXHy5lkI5AGUKnjXisul13QT9UrjDryCG1bBHz7gM
 /Efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=CXatplF2gFGhsFXtR5R2cbW0avLQtJfes43JimQqH74=;
 b=Ng2chr7e3U61Y9TVV2vsUw3aqeelmoohgcCoY/12ITo810ji/uTN+MaInj+nN5RjKp
 1LdvrpRwqP3S2xgXgnHmVQPOZe05TXIGW8llVTnjjcYgY2zIRGSAUj8Td7Hzn2NOqy/f
 UAjbe+p5sUHgmybuJbaY3y4pt6OraW6Chy1czvAWBSXxAQXVTKSMQ/aEZsgXBYVA/sRP
 52oQ/maqw6g3bCR7yBqjNi6u2T58KffUaU9GXp37B07O8BMDZCXUkmUl+r+ZO7Z23InB
 +9S35jADc/QsCzdpQQfYQdKvl6RQJMjaw5z9Ahxm+oLsjMk6h/dsM6hlPHjqicSSPrPn
 bBIQ==
X-Gm-Message-State: AGi0PuZhOSl39WfH3BbRk5ED6EApSvHAAbI8ptFmeJHt65De8K6TaZnY
 7WWHF7w9JXr1ltGx/b9QlqZ7BM9T
X-Google-Smtp-Source: APiQypJqobTccExpR87LR3IVZfg1gFHO6FKE6aYbxl41VETXzxF/A16Uf44J4uto0YayKPO3g+wh2A==
X-Received: by 2002:a9d:6e02:: with SMTP id e2mr5461988otr.366.1586552374539; 
 Fri, 10 Apr 2020 13:59:34 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::3])
 by smtp.gmail.com with ESMTPSA id t23sm1554112ooq.20.2020.04.10.13.59.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 Apr 2020 13:59:34 -0700 (PDT)
Date: Fri, 10 Apr 2020 13:59:32 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: linuxppc-dev@lists.ozlabs.org, clang-built-linux@googlegroups.com
Subject: Boot flakiness with QEMU 3.1.0 and Clang built kernels
Message-ID: <20200410205932.GA880@ubuntu-s3-xlarge-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

Recently, our CI started running into several hangs when running the
spinlock torture tests during a boot with QEMU 3.1.0 on
powernv_defconfig and pseries_defconfig when compiled with Clang.

I initially bisected Linux and came down to commit 3282a3da25bd
("powerpc/64: Implement soft interrupt replay in C") [1], which seems to
make sense. However, I realized I could not reproduce this in my local
environment no matter how hard I tried, only in our Docker image. I then
realized my environment's QEMU version was 4.2.0; I compiled 3.1.0 and
was able to reproduce it then.

I bisected QEMU down to two commits: powernv_defconfig was fixed by [2]
and pseries_defconfig was fixed by [3].

I ran 100 boots with our boot-qemu.sh script [4] and QEMU 3.1.0 failed
approximately 80% of the time but 4.2.0 and 5.0.0-rc1 only failed 1% of
the time [5]. GCC 9.3.0 built kernels failed approximately 3% of time
[6].

Without access to real hardware, I cannot really say if there is a
problem here. We are going to upgrade to QEMU 4.2.0 to fix it. This is
more of an FYI so that there is some record of it outside of our issue
tracker and so people can be aware of it in case it comes up somewhere
else.

[1]: https://git.kernel.org/linus/3282a3da25bd63fdb7240bc35dbdefa4b1947005
[2]: https://git.qemu.org/?p=qemu.git;a=commit;h=f30c843ced5055fde71d28d10beb15af97fdfe39
[3]: https://git.qemu.org/?p=qemu.git;a=commit;h=34a6b015a98733a4b32881777dafd70156c5a322.
[4]: https://github.com/ClangBuiltLinux/boot-utils/blob/5f49a87e272fbe967a8d26cf405cec15b024702c/boot-qemu.sh
[5]: https://user-images.githubusercontent.com/11478138/78957618-b1842080-7a9a-11ea-8856-279c3dcc6c19.png
[6]: https://user-images.githubusercontent.com/11478138/78955535-62d38800-7a94-11ea-9e61-9e3d8c068ace.png

Cheers,
Nathan
