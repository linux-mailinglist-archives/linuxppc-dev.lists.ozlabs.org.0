Return-Path: <linuxppc-dev+bounces-12438-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7FFB8BEB7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 06:06:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTG5H528zz30RJ;
	Sat, 20 Sep 2025 14:06:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b32"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758340540;
	cv=none; b=EGrRV6sxgpx8lJODDmn+z/K+Ns/raGTOoBfreF87Ss6orNq3laMdMrBjbRwBPdZRDcrrnl5E5TMWdPA5dXHQzolBquvdDqU2OoqpJuO/qNoLAaUChcwQokokst9+p9wwdnnIsvt55My+I3PU2+sav7jF4TbSmUHxjPOg26P+GJ0V3Fem4OAVLAkL3+00+xteqfUMSEC984Pc+RN527Vob1dEhjCdP+zD2DnAAHrzihhCiKaM+drh7hsWq3yYy0uS30YfENnewe7lx4Df0DDBsEiCqG9ioJK/5YqvO09TnMu77BYZWPqsy52ip8hv89E6EHICwf0bXCQP30FC8RqTIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758340540; c=relaxed/relaxed;
	bh=wLR5A4WVJygISPHG42IIvYb+LPD25B9I3WH7jC2e5xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSJVwmza/e4vf1KxY9JbtLReVC0ctE0HkQIrKgnwYem1nkoFelwu++pMlq6HYi8JbB/glVicy63Tc2sPJ7LyYO0O3cAbzOTbdsm7TTMjSQ+8DLOGmYay1/B+rP/XfA1+xfP2H7FeII5YgEWb3NaZXlQGP2EC+RsWYKT9+C67v8+o+prYGfZ3r5AJ6MjQyDTghLpIzxIyfMb9rfLfMGWhs90sDfTt9TGtQo8vEmnel9Qg445s6YK6dCqlgtzO+UPxug4CHd2HcYZenz0bKAnci2dZJhBGgXfcVDvRJzuloa9sliEVQm4wvMbNCmG1S6sOxlU1+uccU+a1HT3JDtk7qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hj+KK0iF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hj+KK0iF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTFs651JCz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 13:55:37 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-ea63e86b79aso1890048276.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 20:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758340534; x=1758945334; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLR5A4WVJygISPHG42IIvYb+LPD25B9I3WH7jC2e5xU=;
        b=hj+KK0iFIbXfruY5ZrqxsUWH2bFeFyJnszTLFNoj0heAM9WYMtj0AyRm03zXEJxpT7
         4dcAG+k1sBg0j2C7wRkHhn8d1l70UQqLqUPir8uupuuzwMgjvD/vHqjAra26oVgDG45A
         qN91c1k7iz2TVCgNZQDaCfv74+xJbjxyTCnkA0iW2FavMAtbn8CAMHJT8FToiDVxHBuE
         eH8iNTWnPz3qlUVUPaguTu9SsPcvlCwvCbz3S7VtDpUKR4NgtjDkOyDPTsAg82xFREeH
         3nSU+ALI4CIaOOEtkA6FttzHxdW9J5/3wsnrgWSfpBX5jXUhHiyqD2EhTLwOAYmgMXoH
         5xSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758340534; x=1758945334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLR5A4WVJygISPHG42IIvYb+LPD25B9I3WH7jC2e5xU=;
        b=WczpLq9JtOxVhhOzmf3zQ9nxPWcBsRf3lw2aACr3WylcwFmMH2knT5uuXjwXzosbg9
         ihWVa1McjM9QSYpqj6izQu0nP11mC7pITT/ADCgsHMl7AgnI0Q7raHQQlCbPsw/dFRMr
         Q3FhF5QYdI3LISOCeScNsvW+DnAukPU8WcpbdzlP5zJGXVbO1/Fc9Zivn1LuQv6KENmv
         QNvmtnsz9ccgPIQNB33IRkgkpLIhZF/hjCvlhv6erYxGsYaWr/2X/1izQrYta2X/ydHt
         G+ERdkfFlv2cob72GO+W0t88U+UA5VBGu/nLvK+yA39hjmaH+IaLiFbNHZHTcUctsOtC
         8+Bg==
X-Forwarded-Encrypted: i=1; AJvYcCV3+O86dNTwEn1ppf2edxkKrW436jk9+ULIzA7lFnPFxk3j++IIKmqP3Wp1/jdsDTm8OySDvnQUd0cdzrY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx3pMtoX0dO7Uh8L64leQFW/BFSriwi7gpkINOIJscGoVhsYrNA
	CxBbS/3wvUXo/GWnStRgJ/RdDt9e6KSL2e6hL+mI4z4T+hdkDTdXbNg/2LnO+eLIpjFKLfq2/6v
	jTKCr/QYhtH9s911+Z1160frGjRqTXMQ=
X-Gm-Gg: ASbGncugGB62BMUDP1rBy2vLGC8q1rHRieFiEz6j4OalR2jB+RYVhXzSGomk3xiJdBE
	XJrfmPvXShsq28PbnPdyL0OSj/RiWLStt3TFwCIjKxqPmw/x1rcUcxe0RvEWOEH0WIf/actNHKT
	5rzaMbKU27nbpdLlpiMQbo6GkZT4xjSIbTNIAWTLJkmj8R05OEv+1+d7q0zb/K9hmLCgttMBYM+
	Dy1Fnc=
X-Google-Smtp-Source: AGHT+IH7cxRQcDAWrx6iopGK0fgAvvotX/SwRt/T/KElvH4XQULrd96czgOrVv1CSvA0vDpbRNCMKcVlhfdowxEBryU=
X-Received: by 2002:a53:b3c5:0:b0:622:4818:ce38 with SMTP id
 956f58d0204a3-6347f610c7emr3546092d50.37.1758340534336; Fri, 19 Sep 2025
 20:55:34 -0700 (PDT)
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
 <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com>
In-Reply-To: <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Sat, 20 Sep 2025 06:54:58 +0300
X-Gm-Features: AS18NWCqg0xtU5KiNe17DWjmiPCEbBI_FSj5NCOyDGZFj_7oFaRqSu7O_vUKCrA
Message-ID: <CAPnZJGDwETQVVURezSRxZB8ZAwBETQ5fwbXyeMpfDLuLW4rVdg@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Nicolas Schichan <nschichan@freebox.fr>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 19, 2025 at 6:25=E2=80=AFPM Nicolas Schichan <nschichan@freebox=
.fr> wrote:
> Considering that the deprecation message didn't get displayed in some
> configurations, maybe it's a bit early at the very least.

I changed my opinion.
Breaking users, who did not see a deprecation message at all,
is unfair.
I will send a patchset soon, which will remove initrd codepath,
which currently contains deprecation notice. And I will put
deprecation notice to
other codepath.

Then in September 2026 I will fully remove initrd.

> SMTP server I used wasn't authenticated to google, so all gmail
> recipients were dropped. Hopefully this work better today.

Yes, this time I got your email

--=20
Askar Safin

