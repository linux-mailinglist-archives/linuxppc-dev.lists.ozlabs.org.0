Return-Path: <linuxppc-dev+bounces-13046-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 708FDBEDEC1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Oct 2025 08:09:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cq7Rr5cg5z2xS9;
	Sun, 19 Oct 2025 17:09:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760854152;
	cv=none; b=ekGX3FdYcZEMcZQdk3K2a/orvA9NLQoU1id5kL3VXq89zXCVtXmh/5cY1WerhWx6zRcKOV1g1KDXvq892k/X3+up4j7ibY6SAVraeeWgTzEW2d7De42TzwJaYsQa7DIRBE5Mze97PKlTF3xbramq+fXtcfJ0sXOJpnRK1HPMvNOwsymzT0r9ZQvgaSD5QPBBjApoXnJxTS5oJgR+F2VveFwXwxkulZzCCpgMr2n0+siVLY/8ra1kx6e9Odi+9EXqKU7BrpoOUKXZP3i2oJtDG1nByo1WJSlts7WPfMlCtqsy6LY0O+d433ju5XlG4tBFyRCTyTsgVkiFlXWcBcc/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760854152; c=relaxed/relaxed;
	bh=GYC/hQuGeMEF947/LuK3VJRiyEjbNIGm04998G60uow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j+7x/1y/RQSmFG2UBn0RGKvw0LbKz54UeHg2Z9xQ5EnbWLoiPHfTroNhFrFoOdAEJpWc3F9gHb8vHppzy2iY4crKTfA89hT4gR/ghRow9JeVXtK5bQcQ0rbagOwVddOfnn/T9L2BJLi0TORIOpn2OgCVAJJrShBsazF8y9QcN0VvCrI6uHCOEa31LYXVGgRQJfkU+qfk5kylvd5AbaShrSPPOIx0tNoZVgIVG1Id6awDOOu9wEFsl3HEgCDS+PjDj248fkBc/XHpjgDwORRwnYphi+fKzCp9bxL/Y5xNnq0B63MCRxzJO6i8Wvv9AB9vy22oV5eNVU9Oq5RC6Liv/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X4aV34Xs; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X4aV34Xs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cq7Rn6Z1Pz2xR4
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Oct 2025 17:09:08 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47114a40161so35176335e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Oct 2025 23:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760854143; x=1761458943; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYC/hQuGeMEF947/LuK3VJRiyEjbNIGm04998G60uow=;
        b=X4aV34Xs5qyUPi8pQFGwJkmwrRHbvBNiwGyuOsYmcUVR2VE3h+w3P0yX+lcbOWEpi2
         kGdDNqexh3IsguI5lQoyo9q0PGkYPoGBydbnMg6+ouiMMiiSDbSBQlZm5chvl03SPeMV
         MvGaxk++1IRPFR+xQmBkMDxMBLCKhCykIl0IaWKaIdY+E9Hg7irf4OOVE06Sf4HoeKP+
         W7yE3+9GPvjf+jqC65AowJDA5T3vDhu6TvZp7cXPE6ThgLz1h64bjuLk200fYEn8rMUE
         Q4FISIy5LBhAmDBUSga/vn2iTQDqcrGcFLg0I454tgrSW4its71mLARqUm7XBvkJrM0x
         huXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760854143; x=1761458943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYC/hQuGeMEF947/LuK3VJRiyEjbNIGm04998G60uow=;
        b=NOwaCX+GyQ3uR+th5zDFzKf23eCZE3jRMYIWbhmtVlwf0RD7i0wN5cJ2J57Rq09+8P
         /9fBzGq/MFFU574vFUpX2ogIhMlOBLW4Q7B0/y1sEkgklIQAx9eS7Kigu8X4WOyzyv+g
         MjNnBkEezH9tMk9Y2K6Lc/aAMKyp2xGrN7W2dBQalcL7SdJXISJGGJCdTzMfRZ/Wm4oj
         En0QoM4iszs7mbHx+aF57u+R+hUeYA2Yw8Kx3iVXyf5FBK3h7myvzcQO9s9XKxeFuJBT
         yPEO73lMKuejXOMWg2aLdbhfg9wFl1NTFXS86J165cSeE38RYSY8oiD6YF71e2qeM+8E
         EHJw==
X-Forwarded-Encrypted: i=1; AJvYcCWHFoAxJfpRpdLXGxAUXyvixpxVvknIEXExRN0RdZx/SeIVBb88qeirbeNx3n7KxzIqVev/pcSsNm9JZR0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxbPtdOqJKNo9NqQQNdOEJ6mVpu0oqts11X37X4xVLnrXV+7jP2
	25yf3dmgYfI3HpGyucEfE3NGgBEO6/uBXDkupkp2KSORXTp2FeiqEGHE
X-Gm-Gg: ASbGncupkJYTs3k1iffPn+eG49WLOdFafo9eakXF8IjDfOeoVqLHgcseD8nKvlnEZdZ
	HY38M/veMjQ1qGvLXCDEGtu18xB0K9NG8f5Km2d+SvGcN3ClwFz5Qul/SvJfGEEngVJdVXa+Bfd
	IRjBdAES4+rd1Jjg8pJbuGoZMo36ggTX4Zvh6xSOGcY3PZI1bWbiXmf0OJ7MxF8Q6J3ToUv8fp5
	l16VixJXA0giTCTnFk6rm6eKGDAs/90IROnP9A8/fHyDG76woFijEERMGQKGYaeagCOts4wDv7i
	hZZUNv+k3IDOJFdTMw2liAFCXTF67Ukjeq35i96F33kedhsx5lBbUGFqFj+oOCKyIJZdtmG/gfU
	eo1c6hjbK7c1vJs7AP2IokzXuFZ33QoUfmxcYlGg2BkwT+Q//4w6vY/waqmyLPDDVfqqdnJtzhz
	qz
X-Google-Smtp-Source: AGHT+IEZ5upR5rvq2pYeoFEK0g1VqqLoHFsnsUnK8lryUbaHf4IrN1h8fWBgNccm4eIUhXw2FJ5z5w==
X-Received: by 2002:a05:600c:820f:b0:471:176d:bf8a with SMTP id 5b1f17b1804b1-4711791cd3dmr68834905e9.35.1760854143309;
        Sat, 18 Oct 2025 23:09:03 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4710cdb9d4dsm83976805e9.5.2025.10.18.23.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Oct 2025 23:09:02 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: ebiggers@kernel.org
Cc: ardb@kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 15/19] lib/crc32: make crc32c() go directly to lib
Date: Sun, 19 Oct 2025 09:08:45 +0300
Message-ID: <20251019060845.553414-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20241202010844.144356-16-ebiggers@kernel.org>
References: <20241202010844.144356-16-ebiggers@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Eric Biggers <ebiggers@kernel.org>:
> Now that the lower level __crc32c_le() library function is optimized for

This patch (i. e. 38a9a5121c3b ("lib/crc32: make crc32c() go directly to lib"))
solves actual bug I found in practice. So, please, backport it
to stable kernels.

I did bisect.

It is possible to apply this patch on top of v6.12.48 without conflicts.

The bug actually prevents me for using my system (more details below).

Here is steps to reproduce bug I noticed.

Build kernel so:

$ cat /tmp/mini
CONFIG_64BIT=y
CONFIG_PRINTK=y
CONFIG_SERIAL_8250=y
CONFIG_TTY=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_RD_GZIP=y
CONFIG_BINFMT_ELF=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_PROC_FS=y
CONFIG_SYSFS=y
CONFIG_DEVTMPFS=y
CONFIG_MODULES=y
CONFIG_BTRFS_FS=m
CONFIG_MODULE_COMPRESS=y
CONFIG_MODULE_COMPRESS_XZ=y
CONFIG_MODULE_COMPRESS_ALL=y
CONFIG_MODULE_DECOMPRESS=y
CONFIG_PRINTK_TIME=y
$ make allnoconfig KCONFIG_ALLCONFIG=/tmp/mini
$ make

Then create initramfs, which contains statically built busybox
(I used busybox v1.37.0 (Debian 1:1.37.0-6+b3)) and modules we just created.

Then run Qemu using command line similar to this:

qemu-system-x86_64 -kernel arch/x86/boot/bzImage -initrd i.gz -append 'console=ttyS0 panic=1 rdinit=/bin/busybox sh' -m 256 -no-reboot -enable-kvm -serial stdio -display none

Then in busybox shell type this:

# mkdir /proc
# busybox mount -t proc proc /proc
# modprobe btrfs

On buggy kernels I get this output:

# modprobe btrfs
[   19.614228] raid6: skipped pq benchmark and selected sse2x4
[   19.614638] raid6: using intx1 recovery algorithm
[   19.616569] xor: measuring software checksum speed
[   19.616937]    prefetch64-sse  : 42616 MB/sec
[   19.617270]    generic_sse     : 41320 MB/sec
[   19.617531] xor: using function: prefetch64-sse (42616 MB/sec)
[   19.619731] Invalid ELF header magic: != ELF
modprobe: can't load module libcrc32c (kernel/lib/libcrc32c.ko.xz): unknown symbol in module, or unknown parameter

The bug is reproducible on all kernels from v6.12 until this commit.
And it is not reproducible on all kernels, which contain this commit.
I found this using bisect.

This bug actually breaks my workflow. I have btrfs as root filesystem.
Initramfs, generated by Debian, doesn't suit my needs. So I'm going
to create my own initramfs from scratch. (Note that I use Debian Trixie,
which has v6.12.48 kernel.) During testing this initramfs in Qemu
I noticed that command "modprobe btrfs" fails with error given above.
(I not yet tried to test this initramfs on real hardware.)

So, this bug actually breaks my workflow.

So, please backport this patch (i. e. 38a9a5121c3b ("lib/crc32: make crc32c() go directly to lib"))
to stable kernels.

I tested that this patch can be applied without conflicts on top of v6.12.48,
and this patch indeed fixes the bug for v6.12.48.

If you want, I can give more info.

It is possible that this is in fact bug in busybox, not in Linux.
But still I think that backporting this patch is good idea.

This busybox thread my be related:
https://lists.busybox.net/pipermail/busybox/2023-May/090309.html

-- 
Askar Safin

