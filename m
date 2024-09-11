Return-Path: <linuxppc-dev+bounces-1223-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B091974721
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 02:08:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3LWm6gBYz2yN4;
	Wed, 11 Sep 2024 10:08:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726013316;
	cv=none; b=mbV9KzZ7awpEMii4rcI/2NT7RKD2NkoVnu0ABWbeoEe1L3ZaHxkzxBFUN9kbR+yCWGAlVu9uzcDykpDIdd+h0lMSfmR6NAqeFPk989kPspzTk7wEkmF+f0BZYu5NooX8JOcuUCZ5Nj9T1zOc+SJcYxQzZmWb7XYc1tui5BpG9MkocAnj+i+iau4wOJtRh5EJ9DRSjRN/bi6O8SmmTo9Viqy7alZzB7pMPcouWHbFQpNleTCJM2nvs1VyW64WcHoWX5/B9OXAMie5QpRPX+HvUUUIobS24IYC0IZ0LwRMdsakEONzVdlWHARPWhGve1LvcJH3emeq+owne9asBAlCjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726013316; c=relaxed/relaxed;
	bh=GIVoTa7DbVK9Xb7rHJOwqIqIQbFvLn1afRy41hXZ318=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=e/RWTdtO5+1DGEmXN2zW4XiGrkbwzQ5enAzQYuh6ls8ImSVQHWzmrDRnCHAYwQNoutmht6KfLI/79CABRzstUHM1G7ZKorPfoWtR+mbezP5KnyfULC+KJxL1THvNOJkG15QgqP6pOj5tSEoWHZpXoAmU11rDpG79I/DviHmKWWSlxbdqr4c++dxtcfI27LEtUPZG6UYE//8myEV/MBAFGjo+IDu92ObFrWMrIA7mugz5b7nKTUo5ShT76IeRxs1Q/tPabTDhrb9PVDZByICRXCO5YpiwpMMVyRc11wyZIJssTSc/fxerKM22pok4sZiaELPUvLyPvTqcs45Rc1eiMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IIkeMJ1k; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IIkeMJ1k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3LWm0W99z2xfC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 10:08:35 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20543fdb7acso41947855ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 17:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726013313; x=1726618113; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIVoTa7DbVK9Xb7rHJOwqIqIQbFvLn1afRy41hXZ318=;
        b=IIkeMJ1kJ0VeAaKrKSzg6oY9rDgIg7wZAe9xRzqIiCKVv9D1uAZNgt6sFbVID2r38Z
         hMpKC8tQkkBS740qyxQQbyOXx5JL9ff7C+MFNAyICXvt7BzcLyjAC/iCAkfLh5cf4zp2
         OwX1VwD8+XRkdt4RvMknwHV7n5x8tp6lG73oi0ZYGWbQVZkTKZEdo5wJSdn+9bNQn2ds
         8+eiASnmfG7v3VcBZE0TyFw9GGbU6PXgvuyZjU3a9cBRPk8G337vJ8NWc1wuwhSOAOn1
         MzazrWEavk5EmKPWgPFEuxTt6qm2r72uzJMeiUYF9eJ9TRlEiQhTA+hDWfQ4S7zUop1f
         2aQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726013313; x=1726618113;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GIVoTa7DbVK9Xb7rHJOwqIqIQbFvLn1afRy41hXZ318=;
        b=f/sFNbjhOAgpfHa+onzhfVhbMbAqa/g29VcXKdYrc6iVDm0fF+BpNWCibfrgyi2doB
         si3VNvYyN2mz6y6xmGO5GsWM6vc9ABfFmsnwKYcfo1uZH1bi0ENLFG8DrGh0txgOfYxe
         duMBvvs8j5r02s2WxHm9LN7kx26CizLkyqSvmpSvGgQnUuOGP2ZXiuvoE8exTs+FinFi
         Fb4ii0WUql7u67PvTM+Eqqb659GX8WwP1RGqkp6wxtJ9rH/q5OI5hGpCUNJ+98c9edyz
         mikJgSZxQV19f1VOFyOhFH9MffHtW3ofSQ3sUZ4yp951qyLeu8Qt4lqI4vdqLi/OIfRG
         YajA==
X-Forwarded-Encrypted: i=1; AJvYcCXzSp8JXXqvrMCUUtwxuahxN3RMGLqvFzYZ9aCY5gxlHxfa/01vtQrPuUyXf5ZpgMboAy560JoYHVJBnp8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwGY/3gO7B6aCjgWbnMWL34EY22aX+4lvnzetoWHwWaiIQBnoCF
	97mz0ps7f4wBHPK4q2d2pOpGXsNIqOL8Dgrjhp4B5QYgx0r6yw+Y
X-Google-Smtp-Source: AGHT+IFI8//EbE/gHR4iY1Po7jEcpiXzm01F+imeNjISSHpDyxl/I7se1YOfHzreK/iUzyqJTQp1qg==
X-Received: by 2002:a17:903:32c1:b0:206:fd9d:b87f with SMTP id d9443c01a7336-2074c5eb15fmr26527005ad.17.1726013312836;
        Tue, 10 Sep 2024 17:08:32 -0700 (PDT)
Received: from localhost ([1.146.47.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710eea8e3sm53480125ad.174.2024.09.10.17.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 17:08:32 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Sep 2024 10:08:23 +1000
Message-Id: <D430NH4TXH15.KR19KPMT2APE@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v2 1/4] riscv: Drop mstrict-align
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Jones" <andrew.jones@linux.dev>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-s390@vger.kernel.org>
Cc: <pbonzini@redhat.com>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <frankja@linux.ibm.com>, <imbrenda@linux.ibm.com>, <nrb@linux.ibm.com>,
 <atishp@rivosinc.com>, <cade.richard@berkeley.edu>, <jamestiotio@gmail.com>
X-Mailer: aerc 0.18.2
References: <20240904105020.1179006-6-andrew.jones@linux.dev>
 <20240904105020.1179006-7-andrew.jones@linux.dev>
In-Reply-To: <20240904105020.1179006-7-andrew.jones@linux.dev>

On Wed Sep 4, 2024 at 8:50 PM AEST, Andrew Jones wrote:
> The spec says unaligned accesses are supported, so this isn't required
> and clang doesn't support it. A platform might have slow unaligned
> accesses, but kvm-unit-tests isn't about speed anyway.
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  riscv/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/riscv/Makefile b/riscv/Makefile
> index 179a373dbacf..2ee7c5bb5ad8 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -76,7 +76,7 @@ LDFLAGS +=3D -melf32lriscv
>  endif
>  CFLAGS +=3D -DCONFIG_RELOC
>  CFLAGS +=3D -mcmodel=3Dmedany
> -CFLAGS +=3D -mstrict-align
> +#CFLAGS +=3D -mstrict-align

Just remove the line?

Or put a comment there instead to explain.

Thanks,
Nick

