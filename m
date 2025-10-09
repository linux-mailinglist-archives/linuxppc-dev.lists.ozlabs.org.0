Return-Path: <linuxppc-dev+bounces-12744-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EF0BC8BD5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 13:19:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cj6pm6n5mz2yr2;
	Thu,  9 Oct 2025 22:19:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760008784;
	cv=none; b=eMxUhVFcaANs5VtFv5iMQ9/1frvxKIW+dAvtkT+BsPxtO7JC26vieUXhNxYPcMRkilXp9gMW0X78Rk1kQOXdDVZAr2b8o9o0+vWH/pNmdcHOMv+ftc0lpfX/AN0oCWMkpxd+B4VbOB3uDWaVoQYlfzQvm2kwZQZCoQedX2bPInFzJNbtg9cmENDyd0eUAmPr6f97iNs4LjqXI2pkuVpx0bnsrDqXKBcpi4Ai70j31PMBlxxlYqCdT319BCSbIYMefzWLXa0tbWA67HqwLYOJa1AQ5IzUekSmHR52z26yGNuV8s047PbOB2K8y7M/7MQWEtbOUNaVnokuQr5o3V/Rrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760008784; c=relaxed/relaxed;
	bh=mzeWOdj3lBj+Ke0QviDFWI2aF1kcLsskxWN0A79AnHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ril6r2WQjsJiRL/VDzYFL4t12f8zNhQaQ0+aFo4D1Obo7D+XgKzdMEYG4L8a0lQfnWAtBDr2f92Gq+SNu7hfZq915vru4xiqLSf8/OHSBnn1j1iWluclKsD9RDCfJKnQyCYS3iFUWZLWFykZt0wP6cETKmIzOTFguD6cVHb5AQ5evxWftEivn+6YuUs2Qan9x1NNAP2J7RHcPQLw7rJqSVdOEU7zqGtKUT3KICY3Fj62GpxsyK7oIV/EcbftI24VUM3e8/aiQDPkTKgJ6TxcOBxGWOqxcAad9usBZjOmn+A2r6EtPK/l2QOXbqhXBc5wdDwE9BMLfpxPSb+92WgHRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hpnFJKYv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hpnFJKYv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cj6pl3TJRz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 22:19:42 +1100 (AEDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-77f9fb2d9c5so8835977b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Oct 2025 04:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760008779; x=1760613579; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzeWOdj3lBj+Ke0QviDFWI2aF1kcLsskxWN0A79AnHU=;
        b=hpnFJKYv7bPqYYNe5lXbvrFv+nqXpmpO3w59Sh32c9adTn69iKvB3aizbNyzRqZuL3
         fcj3PMKvvCkfSwjR+B0WwT80FPcSK8NKFMl2hs6pIqEjnhACPBvcLhP3FqtXpW83OPns
         x+AYGJCTTRpsWB4duG+dRgqbdOzwEYCpO3qfXGQo+m2xdA5GW+8BA4aNXD/S4txMGqCW
         d5ZCDlAazyRVc6ydlNPoFej2je7C1HZtINxHgvcVEQ0UudCHHT5zAGNG3SWdZbnas5Vj
         MELy7l0e+cGOxagec2K3Bcg3uXjQl+EQ9mWxC7iUNK8aoW9wUclU7svf4RCiHH8iAY7Z
         uDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760008779; x=1760613579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzeWOdj3lBj+Ke0QviDFWI2aF1kcLsskxWN0A79AnHU=;
        b=gCdRpYiBysm5EDhDfwMltXzQEU3sIZUqcWSnWc2Klzd5oIgBwRo4oJdfB9qZdNyuCX
         c4llhBoBEa1LaLaaZt34ORKtm3GJ9d4Pny9776/fgVJSGHINhyvBSWFw0rWAZD4hbHs0
         w5XPyFhlqSEiF8TsN/TEIChVlJ12WeYn6SLSjHei+6P2UnL7QlUxA6sYwd8rMzq+mi2/
         0Bw6xMWE/Z62PUrdmegrYvB+Fb1sI/PVqKz0F9UN3P4zU3iQpsb6R6pCkVYFsw3wM1KF
         1oTSarJarsracwbl5AbPMId/pQnuT/uMPexSLY+2pjXi4YnpCgx4muAi0PCQk5WQXlSf
         y+SA==
X-Forwarded-Encrypted: i=1; AJvYcCUa6znHfmIbtwumIxW135MbmDTzpY91Ti4iMFYxUJAf1iB/A7DY3ixyOp8/DHor/vNFQ7yfvGQDDyIekwM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw3VxQc0PNGXu0GcKPhJk1EHJm0QoLHjaBSpAXqHS2cJCZOSYCw
	x0aYVLYR0uKI55PKrgmf16vtNSzHPw78YfcYUsvvPhdb3Q/PdAPYbbTNTqR3YFfxwYBd83StQj8
	xQWGCR9xahvLZALx2EMrerkn7zkozwU8=
X-Gm-Gg: ASbGnctWyqFf1ZPr32fRgFwP6/pRi6sEbBnDA1rd0NnN6DOkx3FPHVXKZR9BLS6FDtZ
	z20K4KuksX056+8FkhomMx485j31i2Ix7wXOX4kVUWC6hE8S9hXvRtKyR58vyKTEFWeayEoL1+O
	FC1AgzSoFjZ3PprG1nOe43yGYRpvQKoq22mfWzpsr7pbeT/sAvDqHRtP+CCvnzrBkmreVLOoZOF
	q8PkpCb9Y6aFWhq6SbFEPeeUKX7Pho=
X-Google-Smtp-Source: AGHT+IE5U7JyGi1AmeLjDi25hUOta+sU2hpJbVTN9Ai63ARDyOdLqRjdCN3h5Wr4u+tqZlHZJ+/pg/7Xr5jCWFq4BIc=
X-Received: by 2002:a53:d048:0:10b0:63b:8e80:c017 with SMTP id
 956f58d0204a3-63ccb672a0emr6807745d50.0.1760008779377; Thu, 09 Oct 2025
 04:19:39 -0700 (PDT)
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
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-29-safinaskar@gmail.com>
 <20250913054837.GAaMUFtd4YlaPqL2Ov@fat_crate.local> <20250913055851.GBaMUIGyF8VhpUsOZg@fat_crate.local>
In-Reply-To: <20250913055851.GBaMUIGyF8VhpUsOZg@fat_crate.local>
From: Askar Safin <safinaskar@gmail.com>
Date: Thu, 9 Oct 2025 14:19:03 +0300
X-Gm-Features: AS18NWAGN6ExXhEWeXK-ERFvGpf6JdjWShiWpIPYOnPjMCR9bXVHwIY8E_1WxIc
Message-ID: <CAPnZJGBwFqNAybORpTtRfjtGwMQiBtd+rATD=mh8ZgE3owT_ow@mail.gmail.com>
Subject: Re: [PATCH RESEND 28/62] init: alpha, arc, arm, arm64, csky, m68k,
 microblaze, mips, nios2, openrisc, parisc, powerpc, s390, sh, sparc, um, x86,
 xtensa: rename initrd_{start,end} to virt_external_initramfs_{start,end}
To: Borislav Petkov <bp@alien8.de>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Graf <graf@amazon.com>, 
	Rob Landley <rob@landley.net>, Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
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

On Sat, Sep 13, 2025 at 9:00=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
> Ooh, now I see it - you have virtual and physical initramfs address thing=
s. We
> usually call those "va" and "pa". So
>
> initramfs_{va,pa}_{start,end}

Okay, I will call external_initramfs_{va,pa}_{start,end}
(after I will remove initrd, which will happen after a year)

"external" means "bootloader-supplied" as opposed to builtin initramfs.

--=20
Askar Safin

