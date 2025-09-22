Return-Path: <linuxppc-dev+bounces-12507-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B24CB91B4E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 16:29:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVlqG1Fpxz2yxN;
	Tue, 23 Sep 2025 00:29:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::130"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758551354;
	cv=none; b=D7MH1lRLgRWD8oYDvZG5KIZS3qlIdbeiYSi6JOSULB+wkjB/vL7f7oDY6b6Y0noj4cENgtH3oSXqPIIFPg79ksARXNArmWON2sDVZg+kZIIa+BriMtHcT/t5x7sgrc2d29UnCzV7abhTK+d8RDY6p4DR6Xa74JmGC+RTIR3/xOupyBQl2KM2cshqsqUQU5tFPaj1o40c690Yr1z9JkuM0J/isSH8sJDbvy6/X94FDlCMJKt/s8MvKBkzFQEMzNZN5ZVHZO3rftfdLqtQHWOQMgVk/hErYqNKWYZuOi3WR+S+u20lNRsUlayjVxHFQt53TLV3ID7dmv8Dujeho64Ikg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758551354; c=relaxed/relaxed;
	bh=zds9c11i5EPuC+LW5E2qVk5slu7nHVv1cCYASY1uK64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7scUW3rE6rRVTZP9BrrdsrIfLoi3gIM+CSKKOyu9JeufPW2YsCBhSbwgBD6YgRvJLSD5P2GvNn6TUyJezZGRS5rZRP3qIpkAjanWCWQDXNhbCj9KiRYMJQEUBLMJ3e+xUt7BFT33xCMjK9sLUBiudOiKf2Lbz4ZnKwsTTLHXW77cVH6bKhhTX2H+bpzbX45oKIqQL2IrM6XBllKIbT2xGHvi8xMAn+XbFtIU68sHVeFjF30+6BmrQZJfAlNjU6dpu+4Ze0muaLgwoAGa6lkWoVq17xOw3+TxfZ5I1hjfLx/yF6rT3xMWjlpjfVNZsqhQsVx6NHubjb0ddYG2/VyyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=freebox.fr; dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=bZq7SThz; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=nschichan@freebox.fr; receiver=lists.ozlabs.org) smtp.mailfrom=freebox.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=bZq7SThz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=freebox.fr (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=nschichan@freebox.fr; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVlqC5bGWz2xQ1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 00:29:09 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so3950518e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 07:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1758551345; x=1759156145; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zds9c11i5EPuC+LW5E2qVk5slu7nHVv1cCYASY1uK64=;
        b=bZq7SThzphwHPcdjhz0nYiBs6fZW4Q6F6+tkX6KDcnrXwBE7fIu8XTH06bxgyHaeFz
         9e8q67S+eIrm1CgJ6MxOtEzOPG8iUOIKbbjar5y6ntA3+x0XmukG8aIYsVwRqqbladpN
         QaF/QOPixWKw22nzz/V8ja9JFJNYHNdl+aRIGVeX1desjQGwLF7693My4u8jqJ//KVJ9
         VGMqF2muAVhCODn0mglDao9yOq2zkd2VTvzKLJP1V0Qq/NvwwZKWGoceCyUkr3phmXlv
         SV59diR929+SJ0Zr+wnLOlmcQuAMXK/4EUKW2qNVDD4L8Z16nPXn7m9dOnpP7+sDRA63
         +tvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758551345; x=1759156145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zds9c11i5EPuC+LW5E2qVk5slu7nHVv1cCYASY1uK64=;
        b=YrdIUTOarDLUHypGLd93MAfXJfHDUCaFacK+3/szRm/yZLqDZ6BI0fhO7Qu4AgLArZ
         Ol9HrZoJeLCT/vHSrt+3cz41PMQdYlkB6cyCDVIssMb+t7fUF07tCZeuhE1XMLC8lHsh
         H3yRm+9L5JxcS6VPb125pskSls/X1toCqpYlQQR+alrjLOUZMUkDoblI1f+2zFvUVUsC
         mh/f5Kx8aeMPWukZu921X+6PUAly80o0fCDir32+blXE1opnzpU+Ky2Mw0LhM1bKXLVZ
         M69tyP8qxmjguwAUvWeVx+4nhfQeW5NPrB4jgO85tpdlW65g5Vqs/egEito2R7EUTq8x
         kbgw==
X-Forwarded-Encrypted: i=1; AJvYcCUcKVL6VCEnIWznYhGjNm9c6Kb3Fmu106IgyWHiWbfW0RG8p+iRx6MO2Rjk7BeUmyfTxJZXlXkAi+bEg/8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzRE/oFyf0y1Sau8EG2r4lvO2O8mw0wT+9xOrjCBquKtuG6QjhI
	EPNowvdJndSe0gIMrsr5a5BvPsitfbZJKdHu/HZX0h34/LX/69AS6H6O29IAJMLFfylbgLLgiEF
	a7kH115d8sbPt1ovAvuyo1f4UaQBKSGoGjqqgYBFqlA==
X-Gm-Gg: ASbGnct9IdiLadHV9dlmWPPjqG/OVlEH20G2oukgWdtEjM2/QDUDyXBlIWfthw9Xetb
	JpoqLmUbtxbhceb8WzSlh7Oi0LhjF5xUw8Yg9cK5vInvsMWKmvzBEx86KzpDZ3qNp6yFqITeK/g
	HdV0PQRnQInfWpTk4LfwxTq0ueydF8Ty3KBmhpoOBK71v+kNvRuB4iDPDxEnAclwqBcOBBO6MLU
	mr560OZsHY1g1M=
X-Google-Smtp-Source: AGHT+IF9Kx0YHTgWZximr8IphichwJGTQ/wmiFKfxBKU7xEPIwY53K1eZ5EsUZqb+vcW1xAllqgOcQU2VEEacURTmEE=
X-Received: by 2002:a05:6512:4389:b0:57b:478b:d8a6 with SMTP id
 2adb3069b0e04-57b478be162mr3313173e87.35.1758551344116; Mon, 22 Sep 2025
 07:29:04 -0700 (PDT)
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
References: <20250918152830.438554-1-nschichan@freebox.fr> <20250918195806.6337-1-safinaskar@gmail.com>
 <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com> <CAPnZJGDwETQVVURezSRxZB8ZAwBETQ5fwbXyeMpfDLuLW4rVdg@mail.gmail.com>
In-Reply-To: <CAPnZJGDwETQVVURezSRxZB8ZAwBETQ5fwbXyeMpfDLuLW4rVdg@mail.gmail.com>
From: Nicolas Schichan <nschichan@freebox.fr>
Date: Mon, 22 Sep 2025 16:28:52 +0200
X-Gm-Features: AS18NWBjmNA3KBj8cPrgwDAVm5OX9a5odWP7LbRlHvhoE96nP3yo2_PGoZ1JbG8
Message-ID: <CAHNNwZC7gC7zaZGiSBhobSAb4m2O1BuoZ4r=SQBF-tCQyuAPvw@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Askar Safin <safinaskar@gmail.com>
Cc: akpm@linux-foundation.org, andy.shevchenko@gmail.com, axboe@kernel.dk, 
	brauner@kernel.org, cyphar@cyphar.com, devicetree@vger.kernel.org, 
	ecurtin@redhat.com, email2tema@gmail.com, graf@amazon.com, 
	gregkh@linuxfoundation.org, hca@linux.ibm.com, hch@lst.de, 
	hsiangkao@linux.alibaba.com, initramfs@vger.kernel.org, jack@suse.cz, 
	julian.stecklina@cyberus-technology.de, kees@kernel.org, 
	linux-acpi@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, mcgrof@kernel.org, 
	mingo@redhat.com, monstr@monstr.eu, mzxreary@0pointer.de, 
	patches@lists.linux.dev, rob@landley.net, sparclinux@vger.kernel.org, 
	thomas.weissschuh@linutronix.de, thorsten.blum@linux.dev, 
	torvalds@linux-foundation.org, tytso@mit.edu, viro@zeniv.linux.org.uk, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

[resending to the lists and Cc, sorry I initially replied only to Askar]

On Sat, Sep 20, 2025 at 5:55=E2=80=AFAM Askar Safin <safinaskar@gmail.com> =
wrote:
> On Fri, Sep 19, 2025 at 6:25=E2=80=AFPM Nicolas Schichan <nschichan@freeb=
ox.fr> wrote:
> > Considering that the deprecation message didn't get displayed in some
> > configurations, maybe it's a bit early at the very least.
>
> I changed my opinion.
> Breaking users, who did not see a deprecation message at all,
> is unfair.
> I will send a patchset soon, which will remove initrd codepath,
> which currently contains deprecation notice. And I will put
> deprecation notice to
> other codepath.

Thanks

> Then in September 2026 I will fully remove initrd.

Is there a way to find some kind of middle ground here ?

I'm lead to believe that the main issue with the current code is that
it needs to parse the superblocks of the ramdisk image in order to get
the amount to data to copy into /dev/ram0.

It looks like it is partly because of the ramdisk_start=3D kernel
command line parameter which looks to be a remnant of the time it was
possible to boot on floppy disk on x86.

This kernel command line allows to look for a rootfs image at an
offset into the initrd data.

If we assume now that the rootfs image data starts at the beginning of
the initrd image and is the only part of the initrd image this would
indeed remove a lot of complexity.

Maybe it would be possible to remove the identify_ramdisk_image()
function and just copy the actual size of /initrd.image into
/dev/ram0. This would allow any file system to be used in an initrd
image (no just romfs, cramfs, minixfs, ext2fs and squashfs), and this
would simplify the code in init/do_mounts_rd.c greatly, with just the
function rd_load_image() and nr_blocks() remaining in this file.

I can send a patch for that but first I need to sort out my SMTP
issues from the other day.

Regards,

--=20
Nicolas Schichan

