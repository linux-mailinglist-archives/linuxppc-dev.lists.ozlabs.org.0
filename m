Return-Path: <linuxppc-dev+bounces-12761-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB476BCB7B3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Oct 2025 05:18:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjX4t2x5hz2xPw;
	Fri, 10 Oct 2025 14:18:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b131"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760066302;
	cv=none; b=BR6akUHWrfAafM8BKzHePzS/kXIGM9Tz+Wcx622IFDMgKi4AO+JM5h49cD0WofeOKtunLlzY5O1g+bJK4AsBIsWB89qv5J3R0joIsERa09nR2jjtS8sxFNlPPVqFWKA4+ujN9WCwsu7UqM0T99Tfw+qjJunSR0spSjp0oo8Na0wI/qBYjGzgbf+yc58ylRSBuU6C9Z5DAIrzgzI3bTIFawGcQgJWX61oS14q0htOZFRDvBuKyh0TU0Y8jIHMqF6U8e+R+l4OGglJ/dVE8r1J3qWUeuX7VEtz0YNh0wdyUrjP4zuT1DqiYeVnrkciSNc5LIoJn7iFYyawhOeiwrcygg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760066302; c=relaxed/relaxed;
	bh=Pa2OhCNI6n3Mf2P8BAMZLHp7akXwtALOTxVawJZtfK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y54VeKrMoEKMehG2puI5DL46LPny4C/cMjpgAHlOgX4vYBVlODFp2q8EQ+DWb+zMAwYDVsZwFl/88ZzB177YgtHgRIjq/OXaL9dX0hO/o0sPwgn1AQsoNHjTiVSyw2rqLQQ7LpNJY5GKkPmodugHwjUc1Ftz2Jc31Iq9LwQggxJVnU0DUoYR6cwDZ9DIgOFe/Y0UL8JWNIhDQSbRm7qq1x7v/D9EXsUrWtoE/JZyx7EWgoIYn0Pl+e4OXsHYOyg6keHbuBHnaTWPzSfgc6+PxhRoa6WyUbnL1OERVD3BTFA11wNNIK/NVUE7bOOD0Hex9s4uXq+RjMo1cuq8IsTnaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b68v8DZa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b131; helo=mail-yx1-xb131.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b68v8DZa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b131; helo=mail-yx1-xb131.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb131.google.com (mail-yx1-xb131.google.com [IPv6:2607:f8b0:4864:20::b131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cjX4s1GNhz2xK5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Oct 2025 14:18:19 +1100 (AEDT)
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-63605f6f64eso1444150d50.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Oct 2025 20:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760066297; x=1760671097; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pa2OhCNI6n3Mf2P8BAMZLHp7akXwtALOTxVawJZtfK8=;
        b=b68v8DZaqIRlbS5LfpHA/k9WYz44/mYqhJV9S0bXgRn7AzoWUkbnKk6gl/uHzLV3rq
         3UOTLKxJAnZuOcz24shm6QwNgYAAiDqU4sCAoBQXcbY6nBpHgIRUmxKSSiveTsNI7FDt
         /i4dw71nl+CbAXwbHlAM7WJ/h9RrRibIHRvMwuzzV7dmWe2ulnnIPCy3jreDPrU0VvmK
         WpZeYVn+IRJY5zBt32fN14L7HpxBR/s7wn19p6rgQn5ZFjVKgCzYLTToRgTmoqKlCbNF
         Frfx9t0aM+Sp4f1HZDCWEyY/rXdl8ucTmStwqOvHFWDmvfnVmZ1BFF4+EaPuN4h3AngU
         aK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760066297; x=1760671097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pa2OhCNI6n3Mf2P8BAMZLHp7akXwtALOTxVawJZtfK8=;
        b=t7/GHSxWRFUzxe/otqoF/lHMfdsC0bDEnGJEwZoZhgTRsMpuZK2FVlltPtb7XqTu1m
         H3S2lco8WK3KX/nbCaJ/Pw9D1O4L1jeZyW4OBPg1C7VI+WFDYZIUNMV2das7JSkWtD4y
         bdPTjfJ51jUBQM6hppAPPPDcH791yeZRPX2yBhlbGGmkvaQOGllgw5MIKTLgYZ+oTA58
         A2LAUdcsMuGF+D7md4aa9PDWqt4br0Gxiw12w0F4ML8hkwiv6VEZE+oRBmELpOVpcCVS
         OOe4q24xn2E/vnOtAt/OA6P0BTmGlyIr5BNTF0Ahz542slwCWvTVeNuFG4oXloYLfFkJ
         eB1A==
X-Forwarded-Encrypted: i=1; AJvYcCUEfLs+jypAY+DAsAQP6VGe8l0wizUbXySW578PSl6UzId5wVxKNGMqtWRGu86rOD4O0jgm6hldL7sDMak=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yybckk5gjDhH5mwHFJaKwjReYZv03cGAWRU6C37VuuXH/hyvjca
	UoV5aE5JV9zDQjF7PTsl4eOQVmncKz9akwagdLPqkPHjZiVQxWSKcm4voxzSI9sRfABHgUM1q8t
	P7pezLdjcpqbICxFfNCC6c19WrJYtFyo=
X-Gm-Gg: ASbGncuE7v96ANqkLfQNZK0dv3zCs+4cg50XFNJGOapnukxBqnPkOTcLK4U2UavWMlp
	1WPsfTPYC3Za0uYnZmW+3D6QGEUNKvWC+u6ZY1QBRB35q0DensR25gMSu2MmivVog9VkLm5+iaY
	N/L4abjh9AWredlDpjQSDYlhqpIeaH2UN4Rwlh327dCqoJJwcTaV3Fi91IpvDfBTt2gLXQqcNCQ
	jG5XdlHi02JoEH1DI8n8lmq2g==
X-Google-Smtp-Source: AGHT+IFTQdXvlZxDoBIwCyChBgf2ijvKjPOXu3xyloDy3VewP6H31eXx2tdJ5Y2sZs04pWqa6kN09Zh4TAMeP3pYKTk=
X-Received: by 2002:a05:690e:1587:10b0:63c:e90c:a6d8 with SMTP id
 956f58d0204a3-63ce90cac96mr2654086d50.44.1760066297220; Thu, 09 Oct 2025
 20:18:17 -0700 (PDT)
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
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-3-safinaskar@gmail.com>
 <053f39a9-06dc-4fbd-ad1b-325f9d3f3f66@csgroup.eu>
In-Reply-To: <053f39a9-06dc-4fbd-ad1b-325f9d3f3f66@csgroup.eu>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 06:17:41 +0300
X-Gm-Features: AS18NWCm5nh3vfq5EIpD-J_OKHQvi_8uVbgLjcXTz6TnQl9pdn9vqNDRLNkppRk
Message-ID: <CAPnZJGC9avy1s=xFS5Tg6obS+RB3zw4yWsUBw9g=Vt09S6j88w@mail.gmail.com>
Subject: Re: [PATCH RESEND 02/62] init: remove deprecated "prompt_ramdisk"
 command line parameter, which does nothing
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 15, 2025 at 2:16=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Squash patch 1 and patch 2 together and say this is cleanup of two
> options deprecated by commit c8376994c86c ("initrd: remove support for
> multiple floppies") with the documentation by commit 6b99e6e6aa62
> ("Documentation/admin-guide: blockdev/ramdisk: remove use of "rdev"")

Will do in v2.

--=20
Askar Safin

