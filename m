Return-Path: <linuxppc-dev+bounces-2613-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ACD9B1271
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2024 00:16:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZxvS37G9z301w;
	Sat, 26 Oct 2024 09:16:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729894580;
	cv=none; b=I1SFUuLeIc0TyaTNiOLIvfGO6kK42NOv3P9HaJE+bkxnOG3LLMZ0W1BDW/vVQgJUn8+PCCgdjOOVQw9E2NeiaH/8BpUKwV03bmz/4bsh3cKjLTKGNv+6M5PxUCnk8d6aUliDEOm2W6cca1ZQjcSwMv2lrN7KeWb2umDSi7wY43nvTveBVv9y7Wz/69Dx19Mzbz2st5a+eLjVTAU0S8vYX7AHdUG8lGr/xfwcBMzl0eTPO9b74ExAd+yQbqEiMkrIgLAMO7mVo0ijMlMqxvsek3l3iOVX1oHwoKqowzazeFfsFUj1M1oy+bdAe9q6yE8XB6o2HFsTBNeC9krr+zNyZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729894580; c=relaxed/relaxed;
	bh=i0gN4lzQDHYSJ5VLFJlwQdonngrbWjkk6VPysWjKkhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VE9UPgbCutX5chKh1GJ304RZfSqETqTnmt4ySZRVDfU8faA3DlZWsBVUCLfz+sZ6Ku6RRmoKX//eqoZaSoqFqsXG5wxdNXWv2/DOdPbqOBdcImfz2h7arusyAW/KPYsUmvh+98AuLZaqQy3oCy0L88eVms47YlmZ7xE3wFGNAluZmLc4BDgeAcGoLoeBjLaJ2j+0vsq8cRYb0GlM4s9I0k9IkQCb1/mkTUu7MJ1EG4Freq2vf9F6PPSUoZQI1Y7McQGzeQdmhUfjAtMV+x6gNTR4mVWT+ZjKMLQgORm3fk8FI3oCfoUUon0cahFJoNtts7wp934izkkT9I2QpXueIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nnsUCoKs; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nnsUCoKs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZxvR1z7Qz2yF7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 09:16:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F9C65C00CE
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 22:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39E7C4CEE7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 22:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729894576;
	bh=uJTuxxbpUOhYgzs5WgqjZ9oJKXZ+IXXPP0S1EvdK364=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nnsUCoKsPy331Chn2UUcsngk6k5T9x6sJ5x/vQCqmf50lgps9XEwpgmo4ieWnMh2v
	 hKKhwmyShVPTqg/aa8W1r73marKoLDlVeVlofleUY/xPKgT1+9Mj3gW7tRebb1/J0Z
	 0Nb8Myml3Mh8xhW6GxZCRVqJQI9a0IlZxwhIb/FFLjWW7zb3vS5IAOKR5P46cuH1bX
	 6HIe2Fv9Hy8qoXg6BWAQLe1RwZxXCtspPILf7Beo+xbCY0Zov9G0Zr+tfys0Y9cjmm
	 B8TBd0ZUpDH1lyus/5Zn/fUtOn0w957/BJ7tJ0vN45wzDau2TLxE75xt0/m5uLMVPd
	 35fr3Z21N4TFw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e63c8678so2708779e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 15:16:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4td/nRaBuvXHqkDvqiTa6WfHpA8A6GByb7YikE1bGYpH/4TFwsHGh2cAoskHUAf5rs6f2pRENdZTqzzg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzsWpJwo5A85gcmX0Q7cwUew990P/xH6PNv6LuxAGyEcvwRbPxv
	Qy8NG8f23Nvn6+jFno4SvwXHSK0npBHAqMS2Gufa9t8nI/5+1CqjB8juRo6+meU5eBK/9ziMDYq
	jlo12hfeDDy7FIElDM9Q6om4g+Q==
X-Google-Smtp-Source: AGHT+IFDzz30e4eepxmp8y9NIgcU0ohK45V4obAXv/vuq7kDznzhS/1RZo0KUZFB2KLhRb/lyUfqMvvtY4COXI6AOVA=
X-Received: by 2002:a05:6512:3d8b:b0:539:d0ef:b3f9 with SMTP id
 2adb3069b0e04-53b3491dfc0mr415910e87.40.1729894575274; Fri, 25 Oct 2024
 15:16:15 -0700 (PDT)
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
MIME-Version: 1.0
References: <20241023171426.452688-1-usamaarif642@gmail.com>
In-Reply-To: <20241023171426.452688-1-usamaarif642@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 25 Oct 2024 17:15:53 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLBuzRYgnYHCdbdO4wneFNPe5_iEfbehvKK5M7bBuiyfA@mail.gmail.com>
Message-ID: <CAL_JsqLBuzRYgnYHCdbdO4wneFNPe5_iEfbehvKK5M7bBuiyfA@mail.gmail.com>
Subject: Re: [PATCH v2] of/fdt: add dt_phys arg to early_init_dt_scan and early_init_dt_verify
To: Usama Arif <usamaarif642@gmail.com>
Cc: mark.rutland@arm.com, will@kernel.org, leitao@debian.org, 
	catalin.marinas@arm.com, tglx@linutronix.de, chris@zankel.net, 
	saravanak@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-openrisc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 23, 2024 at 12:14=E2=80=AFPM Usama Arif <usamaarif642@gmail.com=
> wrote:
>
>  __pa() is only intended to be used for linear map addresses and using
> it for initial_boot_params which is in fixmap for arm64 will give an
> incorrect value. Hence save the physical address when it is known at
> boot time when calling early_init_dt_scan for arm64 and use it at kexec
> time instead of converting the virtual address using __pa().
>
> Reported-by: Breno Leitao <leitao@debian.org>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_fdt()")

This looks fine, but what is the symptom without this compared to
before the above change? The original code in the referenced commit
above didn't remove the reservation at all. Unless the current code
does something worse, this is new functionality more than a fix (for
stable).

Rob

