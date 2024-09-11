Return-Path: <linuxppc-dev+bounces-1224-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AB797474A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 02:21:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3Lq434Bfz2yNR;
	Wed, 11 Sep 2024 10:21:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726014112;
	cv=none; b=XelAnwWAMcqAkNxE9OdJ5POVXI5eBAqiTd2/Uq8tsISSx3xvdBIVB8iLn2yXa3ZgKketKdvtwbGkPdD2h2oA79Y5de2/IrMVJbVFsFT/XADaLfaVrSWlX98O6Iow1xWdbwI6o1ohhSqeZ/DO1v4jn/AvYCtCxzdrWSx3BLktWZuZASGyWNW9qITDSIECchO4HeRjLRX1gnqsca66d/tgc7oGdLA+bj7PENzQiGz/tOzfgSOb9S2nQP+FZ4wgFVPWBCfxmuDP51SUM7ZY82WE2BwjICwXqwd9A+a6BaNdQNu7v9DXhKDAbp3S7pmmXW8HfRNhfhqAeq04nEAE8CGxMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726014112; c=relaxed/relaxed;
	bh=JeW4Y0h7gL1bTrw9BgVO7v31cFSL53BgLr+Fcn1Qzkw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Ejhx0pMG2nJADAaWbuyVN2Dx0jbPNmygCx/Gbu7F+wEJtyEPLyZwap2kOCoTPiSy5/oHrY/7kIJmzigFe9h9cOtalSZF1LiDyCcPHpmed2gtsV8DgGSlB7IC1u2clrMCSsATdm6MpLvJLkdiNdz8YEpuj8w8fcYf9AgrTPvI62gKZZXUtbb7RQ/LuYTwNW5sZgZ9Sn8m9qjtTEebRzeWoSeL5PVhl3IJE3npV0gSsG/5JBS0b4tW7j9a863tnuXS4peIlP3GGNj/iG1nmcCAqoWTlHy8QY1jlDybLs0Rl5QzYrym/ea0D5+XDgoiNmXALKA6zpnYCnutBAyU47dWIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zb2UwKQ4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zb2UwKQ4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3Lq36xQsz2xsH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 10:21:51 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2055a3f80a4so44736825ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 17:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726014108; x=1726618908; darn=lists.ozlabs.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JeW4Y0h7gL1bTrw9BgVO7v31cFSL53BgLr+Fcn1Qzkw=;
        b=Zb2UwKQ4nOaXQHs5FHpGELh1vUYrPSMlG+nL2XwkWXWCHRMMScmPgcvmu7HXLXdwWV
         xAOoTQCyfUIVJzVk+jK9KWFens6vM0btKFOGhHXgaPXxfWypnacA/BvE6R1muV6eiala
         +I6h+EHBLuY6a+AUA8OTcQUPI4uZr647sdC5pvPwobFB9pwmmGEOaZlOuOZcTtITj0Qw
         xIvc3XVhksR9KnFImWvbp6At+kSEzbZI/PLRQckzDQJ6PUKx20BenvgNvrESQsmAKGKF
         Iha6Wv+azJoZ3F8WSux9Cjxm4D+wpKYwYnYNsb6JsYY03QtFlSSf0NoHyQPxiQozi6K1
         UxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726014108; x=1726618908;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JeW4Y0h7gL1bTrw9BgVO7v31cFSL53BgLr+Fcn1Qzkw=;
        b=PmfqjGatqNjX16Ah5j1uVSAz5XEIVzYMuGyrCjeXMSxSQT8Z1dFmKqLLHKe/S09OIM
         UEV5tpF9s7sOyiZAlfJ6NCGQTLHKAMzG9eoTAL0XIH8LdEJ/7hJzgT4CpsHjNUy/7OHn
         ne2UjuiBCuzHeeN5StTmRFMO8oeg3UGDLHfJNQWkMHxVHBNd0nhwzt4dvBg0uRT95lK6
         F1J2HY9F341v2R6ydTJmvE/8bwG6ZEJSghC4omuO9e/VPqPUb1uCwVjnn3GMfcBq1lKe
         qt+GsvpLFQ22RnmqndYnDzydUNI5lZmKp5P+pMiEwub+7/heio+cPUCVzDgmYwcb+hml
         7BEw==
X-Forwarded-Encrypted: i=1; AJvYcCXJFBBc3YH81GYr//xNFv3r69qs+2Lc9Sv4bkqtl+QyUfZRKGe+4mrZHS+YU9NVoQl6rBKu2f+ZhbvwZnA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwAqRS7HBKibfqGJlMe33hi0PmXy5oXS65OYxfzhYabUTKAMEYu
	zYxi8J0JJDb/oKZr1IC9/uQYllcAZOQXYC9Zmo4RoRt/dhp6YEuHOiKyIg==
X-Google-Smtp-Source: AGHT+IGpFgBeviIk7STqAhQZktkyXQGuxb0SJW7P1uto6lzV5ThtJVUyImgUcmDFmHHJeJktFhH2hA==
X-Received: by 2002:a17:903:2447:b0:206:c75a:29d4 with SMTP id d9443c01a7336-2074c6ed1dfmr36845375ad.50.1726014108401;
        Tue, 10 Sep 2024 17:21:48 -0700 (PDT)
Received: from localhost ([1.146.47.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e3365asm53646465ad.97.2024.09.10.17.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 17:21:48 -0700 (PDT)
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
Date: Wed, 11 Sep 2024 10:21:39 +1000
Message-Id: <D430XMRU4FZD.1FFPMW6WVWRSD@gmail.com>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Jones" <andrew.jones@linux.dev>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-s390@vger.kernel.org>
Cc: <pbonzini@redhat.com>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <frankja@linux.ibm.com>, <imbrenda@linux.ibm.com>, <nrb@linux.ibm.com>,
 <atishp@rivosinc.com>, <cade.richard@berkeley.edu>, <jamestiotio@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v2 2/4] Makefile: Prepare for clang EFI
 builds
X-Mailer: aerc 0.18.2
References: <20240904105020.1179006-6-andrew.jones@linux.dev>
 <20240904105020.1179006-8-andrew.jones@linux.dev>
In-Reply-To: <20240904105020.1179006-8-andrew.jones@linux.dev>

On Wed Sep 4, 2024 at 8:50 PM AEST, Andrew Jones wrote:
> clang complains about GNU extensions such as variable sized types not
> being at the end of structs unless -Wno-gnu is used. We may
> eventually want -Wno-gnu, but for now let's just handle the warnings
> as they come. Add -Wno-gnu-variable-sized-type-not-at-end to avoid
> the warning issued for the initrd_dev_path struct.

You could also make a variant of struct efi_vendor_dev_path with no
vendordata just for initrd_dev_path?

It's taken from Linux or some efi upstream though so maybe it's annoying
to make such changes here. Okay in that case since it's limited to EFI.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>


>
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 3d51cb726120..7471f7285b78 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -50,6 +50,8 @@ EFI_CFLAGS +=3D -fshort-wchar
>  # EFI applications use PIC as they are loaded to dynamic addresses, not =
a fixed
>  # starting address
>  EFI_CFLAGS +=3D -fPIC
> +# Avoid error with the initrd_dev_path struct
> +EFI_CFLAGS +=3D -Wno-gnu-variable-sized-type-not-at-end
>  # Create shared library
>  EFI_LDFLAGS :=3D -Bsymbolic -shared -nostdlib
>  endif


