Return-Path: <linuxppc-dev+bounces-12378-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE032B85984
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 17:29:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSKM03Vn8z2xnr;
	Fri, 19 Sep 2025 01:29:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758209388;
	cv=none; b=dIZT5vu6fOuP4QPCjfou3n3er5/1Dkhz5er1OwbrgRdr5fpmc7Wmi2Opr9dO/X6z0WE9nKPJCyQS5y+ttF5T8UxS/n4E4NQcgbbLcfAzVpiAj0pGH5UgJwnVJfx9asVq7ya+Kg/ECuczuKcBCyIz1sFSGROzp1wZC6DaI36XuCPBSigAo6QtkjPVmwlsWWLll08CovmQPi2cxwYuXoPMh+Un+/kRWxG+xU0DoHQm0AcGeNbP84Yx/5OVhj0VoQbBzoSO09tZlUngcQO3512i9JwN1VLIf/1XRT4xs0GpE14s/7TPfZCtMXQKcWw0JlP66gM7Fgx3+Dvnr7bt0/n+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758209388; c=relaxed/relaxed;
	bh=XUWQfxZZ308Qh0GEo031WQTVwmY2irHkVNeN0hT1npU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RTpy6Py1436zxfgTtF+T/xqI/MF8zLs+pAygQCO3+KVZq9rCrnbEWZb4vJ3rkMse5TJqeBDSbAzYJw2igc/46C8Y81gbXo3TXuU+0V/zy2vz2mdywxinkmEMOAkXIyBtvCIpHOIjueVnU+uKEsdKxCReLVsiHsXW2sJT4TBu+f0A7uym3kQ9m/RFzcdxLb3zFNKZDuTJuxQeujzVioFCs0J4ZTE+UAXKO08KxjcjX5XKiDXtV8tpyYlcvwRymeOkWSH++eWSrQ/L00bj5Eaa78XsRYjWkwe6UskJ0VXNPKNmWgV8f/ErJ7QO9zmKuRGTkkkfdOf4cYzE1Ctl/Cg9MQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=softfail (client-ip=2a01:e0c:1:1599::11; helo=smtp2-g21.free.fr; envelope-from=nschichan@freebox.fr; receiver=lists.ozlabs.org) smtp.mailfrom=freebox.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=freebox.fr (client-ip=2a01:e0c:1:1599::11; helo=smtp2-g21.free.fr; envelope-from=nschichan@freebox.fr; receiver=lists.ozlabs.org)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSKLz0kJnz2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 01:29:44 +1000 (AEST)
Received: from daria.iliad.local (unknown [213.36.7.13])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 179252003FC;
	Thu, 18 Sep 2025 17:28:31 +0200 (CEST)
From: Nicolas Schichan <nschichan@freebox.fr>
To: safinaskar@gmail.com
Cc: akpm@linux-foundation.org,
	andy.shevchenko@gmail.com,
	axboe@kernel.dk,
	brauner@kernel.org,
	cyphar@cyphar.com,
	devicetree@vger.kernel.org,
	ecurtin@redhat.com,
	email2tema@gmail.com,
	graf@amazon.com,
	gregkh@linuxfoundation.org,
	hca@linux.ibm.com,
	hch@lst.de,
	hsiangkao@linux.alibaba.com,
	initramfs@vger.kernel.org,
	jack@suse.cz,
	julian.stecklina@cyberus-technology.de,
	kees@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	mcgrof@kernel.org,
	mingo@redhat.com,
	monstr@monstr.eu,
	mzxreary@0pointer.de,
	patches@lists.linux.dev,
	rob@landley.net,
	sparclinux@vger.kernel.org,
	thomas.weissschuh@linutronix.de,
	thorsten.blum@linux.dev,
	torvalds@linux-foundation.org,
	tytso@mit.edu,
	viro@zeniv.linux.org.uk,
	x86@kernel.org,
	nschichan@freebox.fr
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
Date: Thu, 18 Sep 2025 17:28:30 +0200
Message-Id: <20250918152830.438554-1-nschichan@freebox.fr>
X-Mailer: git-send-email 2.34.1
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
X-Spam-Status: No, score=1.0 required=3.0 tests=RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_SOFTFAIL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

> Intro
> ====
> This patchset removes classic initrd (initial RAM disk) support,
> which was deprecated in 2020.

This serie came a bit as a surprise, because even though the message
notifying of the initrd deprecation was added in July 2020, the message
was never displayed on our kernels.

When booting with root=/dev/ram0 in the kernel commandline,
handle_initrd() where the deprecation message resides is never called,
which is rather unfortunate (init/do_mounts_initrd.c):

	if (rd_load_image("/initrd.image") && ROOT_DEV != Root_RAM0) {
		init_unlink("/initrd.image");
		handle_initrd(root_device_name); // shows the deprecation msg
		return true;
	}

It is likely we are not the alone booting with that particular
configuration, so other people are probably going to be surprised when
initrd support is removed, because they never saw the deprecation
message.

We do depend on initrd support a lot on our embedded platforms (more
than a million devices with a yearlyish upgrade to the latest
kernel). If it eventually becomes removed this is going to impact us.

We use an initrd squashfs4 image, because coming from a time where
embedded flash devices were fragile, we avoid having the root
filesystem directly mounted (even when read only) on the flash
block/mtd device, and have the bootloader load the root filesystem as
an initrd.

We use a squashfs4 because we can mount it and keep it compressed. The
kernel would decompress data on demand in the page cache, and evict it
as needed.

Regards,

-- 
Nicolas Schichan

