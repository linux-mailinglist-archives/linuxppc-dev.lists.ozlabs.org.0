Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9F78CE629
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 15:26:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dLnPoeXf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vm5H50MY5z884q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 23:19:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dLnPoeXf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=alexdeucher@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vm5GM0Jdbz87Lj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 23:18:50 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-681907aebebso649940a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 06:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716556728; x=1717161528; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZD5jP0xz4NBhWN8Zgsp2iFPrsWGp03cRwKrWdar1DE=;
        b=dLnPoeXfZUbjmAlLw3Ra/BDU+LlTTjuEF8xIH78HumpkmRyN8f/6nkNRh47IuR9r48
         IvgiS2sRrr46OVO7yE2nLsYulHTfO5tRCj0sTO5a8n2N9wWc9Ut+3WSxt7LfrdpWG/aV
         DRpib7xr+tE7z396dqdfX8V3dCr1vDOQfqgadh0QRAGval7WKFT8EDo3Ry7Zg3HB0dxj
         1vGwmDcbo2BEUm9pPpZ4H47R6+9NTnupWAqmRnHR+Gwl+wYwrA7MQFHq6KtQwdm/Aj1X
         d9w4tUQJI5qxmKp1VOGL52OA7NvnhY7DYPwP5A34pKItXgPQuJGCHP4mz9krkBjIjNgZ
         DtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716556728; x=1717161528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZD5jP0xz4NBhWN8Zgsp2iFPrsWGp03cRwKrWdar1DE=;
        b=bw28STJhEld9i39o9V5ZQuBGT/Vc9xBcpp0IEGAl22dDmmPQYVhFXBnUyaQPIafBTY
         XeGG8qzjyTRvR0pOnWhvpHZvvv1O0P1uCAy2RLAPGRBRgzZRQFM/XF/TOtyf8S2F74pZ
         4/BxDGy7b7bkCCy26NePTvjGKdV4ix3XSDlSNzsFHKVoVgltpo7ZeAdTyLG3WaGBWXy9
         bbIV5z5CRU4taIGcOjUVKgqaYnQTY33tkkvWotfvd/0GA1h0ht0Pi2ynCYUFrptQ6TUE
         8TI6M7QqtFPUTEtR4I0E0NSw1fyFtM8gVlFLU9iznY5zUS73EV+26JaQ3/GvAfmixIfS
         +02Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWioczrn1RqDiLhNQFZMj4HoU3i3nSta5D0TmoYkYIrAOPkqsU2vK8NldhS+5pR+J9MlADMdGZEt19cZSPcHyXnxmvREZ5FYt7O+eZTg==
X-Gm-Message-State: AOJu0YxsDG+XL3jzPHOaLNC8fv3D0FDgxvUxH49UYlKuYAgbPAaoMgsQ
	kk/C4OMY50lxQ402vOfNi2QP6mZGMqp5bP0X1PLObK0r/n03XaECwlox/yMZO3ajRId/+09kGcZ
	YFCEIttJ80E8sfHYJBsXlFJGbqMM=
X-Google-Smtp-Source: AGHT+IE8pCp8W5E13VNHTBajd1iiFRN6k3JoN7VIxHp3GdM/LrEcuL4DsERnr62fGGcgTS9Bh/R3Y3m/qNihJWl6krM=
X-Received: by 2002:a17:90a:c394:b0:2ae:346d:47cc with SMTP id
 98e67ed59e1d1-2bf5f715486mr2416381a91.38.1716556727885; Fri, 24 May 2024
 06:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com> <eeffaec3-df63-4e55-ab7a-064a65c00efa@roeck-us.net>
 <CADnq5_NmKyTBbE6=V+XdEKStnjcyYSHyHqdkgBen4UhPnVKimQ@mail.gmail.com>
In-Reply-To: <CADnq5_NmKyTBbE6=V+XdEKStnjcyYSHyHqdkgBen4UhPnVKimQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 May 2024 09:18:36 -0400
Message-ID: <CADnq5_Ndzw5Gre=yyPKyFNX5yFWjTCMg2xqrn6tEj6h8t-nAYg@mail.gmail.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>, Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 24, 2024 at 9:17=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Fri, May 24, 2024 at 5:16=E2=80=AFAM Guenter Roeck <linux@roeck-us.net=
> wrote:
> >
> > Hi,
> >
> > On Fri, Mar 29, 2024 at 12:18:28AM -0700, Samuel Holland wrote:
> > > Now that all previously-supported architectures select
> > > ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol inst=
ead
> > > of the existing list of architectures. It can also take advantage of =
the
> > > common kernel-mode FPU API and method of adjusting CFLAGS.
> > >
> > > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> >
> > With this patch in the mainline kernel, I get the following build error
> > when trying to build powerpc:ppc32_allmodconfig.
> >
> > powerpc64-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/displa=
y_mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_=
dm/amdgpu_dm_helpers.o uses soft float
> > powerpc64-linux-ld: failed to merge target specific data of file driver=
s/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
> >
> > [ repeated many times ]
> >
> > The problem is no longer seen after reverting this patch.
>
> Should be fixed with this patch:
> https://gitlab.freedesktop.org/agd5f/linux/-/commit/5f56be33f33dd1d50b943=
3f842c879a20dc00f5b
> Will pull it into my -fixes branch.
>

Nevermind, this is something else.

Alex


> Alex
>
> >
> > Guenter
