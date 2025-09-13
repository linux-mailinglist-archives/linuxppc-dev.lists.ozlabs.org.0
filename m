Return-Path: <linuxppc-dev+bounces-12117-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B74C2B55DFE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:16:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxKQ3dhkz3ccV;
	Sat, 13 Sep 2025 13:16:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757725317;
	cv=none; b=aZat+p1di0l4m/NQDZUt2s5BcrqWHKB86daydp+mxWfJzAOZ5tUxZX4E5exeLZKbd+MaMT4IWVAgygPVGRK8NMs3rlGc5xlU0c245nuNzDUPZUAyJaTUgiwg1Iyzk+jGz68vJQsMqdJVH/GbGeQ7vML3dd78M6TI2kFJwwhDceSIHf23fQCzQHIY1X2ojcnn0pfhTGcnwC7lojQMzqpk4XuNHAVxHOkPZfuzpePYVSh7FyCAS1WmTNvh+wWqOxpKJnZcwiXewvS+oaqfFRK2/TsBcNiSc/MRLSZQuDACkD857LSBWejMl11z9nwQ7f2IuZdVshKqDqAJqb7C4wf10w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757725317; c=relaxed/relaxed;
	bh=XZEc0E3RkrtT53PvUmeExPdZ+yV/ZVWq9ufU5BOWTEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpbd8u3BatgqIwBX09ojn4iu86xn6hVkbtzT3Nlr4MRwp377srEXXYrBL4aIW/HCWqMVWzuwZNlXzVNRjNibW4b0H2ta1AfE3N5SgH8xrkHTj7lezQE/GoXhFk8dB3CuQc9JLr8z/nqUuoqhxG6tQmJSHmjhznhJ/U7lYfj5oo5dqIC3kcNxEVCf6jaoV4Sj/7CQuOtbezwBKkjg0OkW6nTevqMxo0Xw9ltViLg/vswMbV/IstZqFOaWlfpss8GDKs/YIPfAldaSvLyNHwQTZcd55zWPW50meFvMJyHNkGQRVzXJappi9KrS3m6yQPAYSnM3iSA8rF2TqhwcT4nToQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gT8/JGI6; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gT8/JGI6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNtKv4v9lz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 11:01:54 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b04770a25f2so357854566b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 18:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725311; x=1758330111; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZEc0E3RkrtT53PvUmeExPdZ+yV/ZVWq9ufU5BOWTEg=;
        b=gT8/JGI62qmdjShHbUWSIN6geSgyhV8aIspHcivVD43iLsPp+AMCKL2oEIERXrHKDK
         qybHoP9KeVUcruwUm3jWUFVoxgEOlS9TODMgLBbbXdL5Loes4kmL2uERSAfeR6/2HXVA
         XlRyNKvL9qVXRYleY5/5sAVGK9KfeI3HigJUQwLem787e8n9RfkZ36k3TofKnZ8FLwTx
         TS2zoAlR15tYidrwRNRsiTZQw+faxkyN7idsJg7efnnfTO3y58tyHmsgbPPet6VJchC2
         8uHpr0gd3n6bi45Gg5vYJ5IBCw5she5LlA79hy0N6BQ5gbUBstApv0Dn/DGj7vd4fEZq
         PEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725311; x=1758330111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZEc0E3RkrtT53PvUmeExPdZ+yV/ZVWq9ufU5BOWTEg=;
        b=d6YNlGASPCMuj7JmwNkkm1YUcP3cbNRgmsepUItQvfz1+MBp3YFoiuauytpJvFtf5Y
         ry9z+2xeG0DpcemKFAqBYZ/ZaIRNCNLNuTiDR8/HcRxnp/MZCHqkYN0NyaZghqfuR62E
         aljTjNutUlzyekwjpnA8B9ek1oeBpD6EA24W+0AbpG3lIAG5yicYWBr3hwWbENK6qIQb
         xWXqEbzi9EtvfL8yl8tMLtaqqVsl/OMWC/o+pMaEDORiKL+p2Ie+7cEdoWS4elPbnq5i
         jJmgF1yKDjVa9XPxIMaTdl0gxbBF6nRkNvHO4L/8B2YSc9MqHfPIqmHfK92+HjJK8dat
         Q1CA==
X-Forwarded-Encrypted: i=1; AJvYcCVGKtE4Yq2DFQ99HBH5xQPy5iV1SvtvP2S74EWmskn0jedZNdB3/PSM+gqJhPQeImGqcXGq/flgHX94JWk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyKSVwT5oEXAij0pIVwhlfrg6097HZEJwiV+DPI5zkfX+5yIK4Q
	JfHBjMEeQ/feF3RcGCbXfqRaHfebo/iXM1YrJZhanQifvUCwvfYOtjEW
X-Gm-Gg: ASbGncu539wHx/kjne9mlHLRSDq4QRqEvPE7+28VPPbnOkq+NdaRdW8dey/5IjHkLFr
	XoadzaHLKYAkWNLUrnZmZ97glT6vJECWIeOdtq5gXR0fLatdbunT+kvK30/Tj6dskQ4rVZeGZA4
	1BroB8vKv9vSjEr9WsiZCQcKBMxkY4MRParNI8fM7bKQUKaG7c+Mz2HIJmk2RemuHv5F5gkxrw1
	1zS4dWAmlK9tHRqnmxKO5GKCqCbMJ+B6AODqqfIy5n2NJw5OnJRwJghnkyDjGMguGXk3yIQkxgg
	x+wuHSBH8ERIcqNWaR2pnZpRLMW4gsN6w3m77EMA5hf6WUr4zbbAr5Rw+EeJ84UAF1Z9Se3FS/Z
	rEz6aZDxnfhpE3kbZcDd89WZ/92seeg==
X-Google-Smtp-Source: AGHT+IEAi4xtonmhCaT33K2Hzh7yyRfMcFV0HvMSUAxXUtkPqhwfRFML0tJIQIoV7OGJ/h1kr7fV7w==
X-Received: by 2002:a17:907:3d0c:b0:b04:7880:3e8c with SMTP id a640c23a62f3a-b07c3820252mr475574166b.38.1757725311044;
        Fri, 12 Sep 2025 18:01:51 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b317124esm476784166b.46.2025.09.12.18.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:01:50 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 20/62] doc: remove Documentation/power/swsusp-dmcrypt.rst
Date: Sat, 13 Sep 2025 00:37:59 +0000
Message-ID: <20250913003842.41944-21-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
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
X-Spam-Status: No, score=2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

It contains obsolete initrd and lilo based instructions

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/power/index.rst                 |   1 -
 Documentation/power/swsusp-dmcrypt.rst        | 140 ------------------
 .../translations/zh_CN/power/index.rst        |   1 -
 3 files changed, 142 deletions(-)
 delete mode 100644 Documentation/power/swsusp-dmcrypt.rst

diff --git a/Documentation/power/index.rst b/Documentation/power/index.rst
index a0f5244fb427..9f1758c92e48 100644
--- a/Documentation/power/index.rst
+++ b/Documentation/power/index.rst
@@ -22,7 +22,6 @@ Power Management
     suspend-and-cpuhotplug
     suspend-and-interrupts
     swsusp-and-swap-files
-    swsusp-dmcrypt
     swsusp
     video
     tricks
diff --git a/Documentation/power/swsusp-dmcrypt.rst b/Documentation/power/swsusp-dmcrypt.rst
deleted file mode 100644
index afb29a58fdf8..000000000000
--- a/Documentation/power/swsusp-dmcrypt.rst
+++ /dev/null
@@ -1,140 +0,0 @@
-=======================================
-How to use dm-crypt and swsusp together
-=======================================
-
-Author: Andreas Steinmetz <ast@domdv.de>
-
-
-
-Some prerequisites:
-You know how dm-crypt works. If not, visit the following web page:
-http://www.saout.de/misc/dm-crypt/
-You have read Documentation/power/swsusp.rst and understand it.
-You did read Documentation/filesystems/ramfs-rootfs-initramfs.rst and know how an initrd works.
-You know how to create or how to modify an initrd.
-
-Now your system is properly set up, your disk is encrypted except for
-the swap device(s) and the boot partition which may contain a mini
-system for crypto setup and/or rescue purposes. You may even have
-an initrd that does your current crypto setup already.
-
-At this point you want to encrypt your swap, too. Still you want to
-be able to suspend using swsusp. This, however, means that you
-have to be able to either enter a passphrase or that you read
-the key(s) from an external device like a pcmcia flash disk
-or an usb stick prior to resume. So you need an initrd, that sets
-up dm-crypt and then asks swsusp to resume from the encrypted
-swap device.
-
-The most important thing is that you set up dm-crypt in such
-a way that the swap device you suspend to/resume from has
-always the same major/minor within the initrd as well as
-within your running system. The easiest way to achieve this is
-to always set up this swap device first with dmsetup, so that
-it will always look like the following::
-
-  brw-------  1 root root 254, 0 Jul 28 13:37 /dev/mapper/swap0
-
-Now set up your kernel to use /dev/mapper/swap0 as the default
-resume partition, so your kernel .config contains::
-
-  CONFIG_PM_STD_PARTITION="/dev/mapper/swap0"
-
-Prepare your boot loader to use the initrd you will create or
-modify. For lilo the simplest setup looks like the following
-lines::
-
-  image=/boot/vmlinuz
-  initrd=/boot/initrd.gz
-  label=linux
-  append="root=/dev/ram0 init=/linuxrc rw"
-
-Finally you need to create or modify your initrd. Lets assume
-you create an initrd that reads the required dm-crypt setup
-from a pcmcia flash disk card. The card is formatted with an ext2
-fs which resides on /dev/hde1 when the card is inserted. The
-card contains at least the encrypted swap setup in a file
-named "swapkey". /etc/fstab of your initrd contains something
-like the following::
-
-  /dev/hda1   /mnt    ext3      ro                            0 0
-  none        /proc   proc      defaults,noatime,nodiratime   0 0
-  none        /sys    sysfs     defaults,noatime,nodiratime   0 0
-
-/dev/hda1 contains an unencrypted mini system that sets up all
-of your crypto devices, again by reading the setup from the
-pcmcia flash disk. What follows now is a /linuxrc for your
-initrd that allows you to resume from encrypted swap and that
-continues boot with your mini system on /dev/hda1 if resume
-does not happen::
-
-  #!/bin/sh
-  PATH=/sbin:/bin:/usr/sbin:/usr/bin
-  mount /proc
-  mount /sys
-  mapped=0
-  noresume=`grep -c noresume /proc/cmdline`
-  if [ "$*" != "" ]
-  then
-    noresume=1
-  fi
-  dmesg -n 1
-  /sbin/cardmgr -q
-  for i in 1 2 3 4 5 6 7 8 9 0
-  do
-    if [ -f /proc/ide/hde/media ]
-    then
-      usleep 500000
-      mount -t ext2 -o ro /dev/hde1 /mnt
-      if [ -f /mnt/swapkey ]
-      then
-        dmsetup create swap0 /mnt/swapkey > /dev/null 2>&1 && mapped=1
-      fi
-      umount /mnt
-      break
-    fi
-    usleep 500000
-  done
-  killproc /sbin/cardmgr
-  dmesg -n 6
-  if [ $mapped = 1 ]
-  then
-    if [ $noresume != 0 ]
-    then
-      mkswap /dev/mapper/swap0 > /dev/null 2>&1
-    fi
-    echo 254:0 > /sys/power/resume
-    dmsetup remove swap0
-  fi
-  umount /sys
-  mount /mnt
-  umount /proc
-  cd /mnt
-  pivot_root . mnt
-  mount /proc
-  umount -l /mnt
-  umount /proc
-  exec chroot . /sbin/init $* < dev/console > dev/console 2>&1
-
-Please don't mind the weird loop above, busybox's msh doesn't know
-the let statement. Now, what is happening in the script?
-First we have to decide if we want to try to resume, or not.
-We will not resume if booting with "noresume" or any parameters
-for init like "single" or "emergency" as boot parameters.
-
-Then we need to set up dmcrypt with the setup data from the
-pcmcia flash disk. If this succeeds we need to reset the swap
-device if we don't want to resume. The line "echo 254:0 > /sys/power/resume"
-then attempts to resume from the first device mapper device.
-Note that it is important to set the device in /sys/power/resume,
-regardless if resuming or not, otherwise later suspend will fail.
-If resume starts, script execution terminates here.
-
-Otherwise we just remove the encrypted swap device and leave it to the
-mini system on /dev/hda1 to set the whole crypto up (it is up to
-you to modify this to your taste).
-
-What then follows is the well known process to change the root
-file system and continue booting from there. I prefer to unmount
-the initrd prior to continue booting but it is up to you to modify
-this.
diff --git a/Documentation/translations/zh_CN/power/index.rst b/Documentation/translations/zh_CN/power/index.rst
index bc54983ba515..4ee880e65107 100644
--- a/Documentation/translations/zh_CN/power/index.rst
+++ b/Documentation/translations/zh_CN/power/index.rst
@@ -32,7 +32,6 @@ TODOList:
     * suspend-and-cpuhotplug
     * suspend-and-interrupts
     * swsusp-and-swap-files
-    * swsusp-dmcrypt
     * swsusp
     * video
     * tricks
-- 
2.47.2


