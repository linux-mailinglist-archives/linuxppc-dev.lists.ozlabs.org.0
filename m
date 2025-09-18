Return-Path: <linuxppc-dev+bounces-12437-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A137CB8BDD6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 05:13:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTDwg25C9z2yyx;
	Sat, 20 Sep 2025 13:13:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758225503;
	cv=none; b=WIEj2NxfXQRdDJc8CMAQNM6AnsnOUkIPByFX8Mak3UgDAeP8RQE5MpKCdacOArM8WMiLTYGrVAzB2uPzBr3rfpmt6vGeBMMKMeMCmvCaaJaLG4b16f5H/F9B4l+dR1j1wY7puE9POfelK7++BEAn0NhryKFJXZRoFWnRY0YTPBkiLlFzsSUzxhhghCf0Nnxy4eobxT8yXOpP3bPHBIHGsQW+dtbhFM4bKd8Wx/Cky3Y4ThrsKQ44F4KX2GZov+xh4Yd7FY3EVAZbhUko3l6lxeLDUO58BNsTJbFtNhXJeABjCAS5ixjEF6HtdWcKiKYGqniESqvwwvRcNNZAh7JphA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758225503; c=relaxed/relaxed;
	bh=9McvDjxp1cOQ8m8DQ7zr8KAOkClRv+R613f7KwPZqLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDeBgusssYRKprNgDm6vU3bzY/+1mOGgSeg00JCkBnOoEZCxcRfNV/t4c8jl8gSM6qZ94/qBrLx+C2kZLqEQlrMnMXBEa4VkhvV8ITxqYrdiGEJtDjs6gU2ohymuGvWmD7QcaxutOOhJtCDnI5A77Brgvhvp9z0Rnyp/34DBiu/WqHVTIZG6BydgezbjUxHqWQs9y3/2yxNd1mQikICwH9Q5DK+8yKMEbSrYzfsepQTCjvYWY7CUHnQ4pQNZ48Q1xjToZbNazgdB6gEM/Em1bv+MfcFeSQA+7id5bbIIT+7luHnKF7Y81JXP65fruQS6BTN54dWhPyR1tib/Vpv+sQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ng8eWGLK; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ng8eWGLK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSRJt11f6z30T8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 05:58:21 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b04ba58a84fso229632366b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 12:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758225496; x=1758830296; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9McvDjxp1cOQ8m8DQ7zr8KAOkClRv+R613f7KwPZqLk=;
        b=Ng8eWGLKRuuD1qR3GEgf8oDnF+Cg7S8Jzn/XvIEXm6IPNJnnC9J+b9s7FyYUmrR/nL
         cbpBjpXKD2qFB5GMxoSe2Z/kCkuaXDsF6FDPjGbTjzwBi4TF970qOxUqLhcd6qWjym+1
         8dEkEcVrlZRnrrXMleyIkMi/Wqn3ZHuhutHyTtbTlg7nB5h7IS/alMWj0H8IfMN7pMpv
         ypA1tx7NM7CaWMeqwrVQEmgFsHeI4oFK0B7e2CNFcOKQuMndV5ZMUFxIcL6pifGJSh0H
         jm2GV1fz4ODhBT9FD1xxffGBJYVDS/OSd+8ooqEfeAxXamgveVcs2LlUiHGKUWtY7sWd
         fsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758225496; x=1758830296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9McvDjxp1cOQ8m8DQ7zr8KAOkClRv+R613f7KwPZqLk=;
        b=QNrEwNoMAjn6ufUSXgNBmHxV6YbGigTKkW8mxj0LzHDUfSbvO8MxMUEGXBaOLUW+99
         SsU9d1WB7BPLWXrKPjDt9EaWOjiArtpVoEjPtdzCJZKKznFYZV06ALTUjlzJ5O/iat0P
         hzzSoxdiy4CS9lNhGvlXbL12dvYle2MgIcqf06YxQ1amAh4Xc65ZxosP/y//usumGt0G
         /bQiZs2vgcgzgJpsdMfa1UodUbujdN9te1p45R4m7DEi/MwsCs6DV0bx6JIBVS481x2Z
         sNZugohE8WBu/NTx8msDzQMejvsoT718HCj1ntyc8jH7mTqg+zcXRzoVqSAlo8fY8ef/
         lC8g==
X-Forwarded-Encrypted: i=1; AJvYcCWyNc3QdgqvZf2qZeFJ6A+R+41BfnLSugJIbZxR1HTr6sJmDiKPDPinvF9CHjH7EcpmwhvGi+Bbo1kx6tY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzdDtkN0+UlkFUzPGtbCMCSd8FH009ZpJh5P5wnaI1SFQTld/xF
	S5nA+Am9O/1hk4JSqdYJ3Vm2wwWPqAQiNTHPJ5pEtSRtSyFJdFyXUDWU
X-Gm-Gg: ASbGncsV0FX5bouVK7yqBt+onjfrn0ogH9oSjB841AB2I0FOH4Sif45T0gG7JlJKqhB
	9PEL6RH0s3SQXGHcxuAVCp9koAFeLGJbWRbWl1qYAWcVMMGtFZq86y3UFpseXrBQc1EM0fVLEoh
	kEBtM7BErsVl0F4QbfeEPsuq7Se6CFKem2a2KOKxwXLOGRMykLsb/zIvryW254OZaauKZSyeeF3
	p/s+UwMNRLkNUIXSG5uBEPfxHwoHUXR8sPpXZu6h9VoSv7JpIdaXV6uN/r/p/1k4A6AITafZblT
	UkBWSS+ziHwLO8Pk9wJhn8OphrVMpvctcKcxY8eHA+ykCmYxTbUTZoU/neNh2EQY8saXMPkNjWl
	iDvtiNEGa1Q/sDPUNmn+sdlro7jryDxkZuw2ktw==
X-Google-Smtp-Source: AGHT+IH2NBu6L+bASXNqg9sJUcZ42MFCB2aqzEFiqoDEW6um54A4CtHcJnO37auTgFbi6nwycKDm8A==
X-Received: by 2002:a17:907:a089:b0:b19:969a:86 with SMTP id a640c23a62f3a-b24f35aa177mr45885966b.37.1758225496090;
        Thu, 18 Sep 2025 12:58:16 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b1fd1101c44sm264530466b.82.2025.09.18.12.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 12:58:15 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: nschichan@freebox.fr
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
	safinaskar@gmail.com,
	sparclinux@vger.kernel.org,
	thomas.weissschuh@linutronix.de,
	thorsten.blum@linux.dev,
	torvalds@linux-foundation.org,
	tytso@mit.edu,
	viro@zeniv.linux.org.uk,
	x86@kernel.org
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
Date: Thu, 18 Sep 2025 22:58:06 +0300
Message-ID: <20250918195806.6337-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918152830.438554-1-nschichan@freebox.fr>
References: <20250918152830.438554-1-nschichan@freebox.fr>
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

> When booting with root=/dev/ram0 in the kernel commandline,
> handle_initrd() where the deprecation message resides is never called,
> which is rather unfortunate (init/do_mounts_initrd.c):

Yes, this is unfortunate.

I personally still think that initrd should be removed.

I suggest using workaround I described in cover letter.

Also, for unknown reasons I didn't get your letter in my inbox.
(Not even in spam folder.) I ocasionally found it on lore.kernel.org .

-- 
Askar Safin

