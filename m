Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1C38CE62B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 15:26:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mF/Rqa0o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vm5G727nGz87qB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 23:18:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mF/Rqa0o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=alexdeucher@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vm5FN507mz87Lj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 23:17:58 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2bf5797973fso903161a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 06:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716556671; x=1717161471; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlXCQc3o/MB52ttkYbUWNblq+v3TZ5Rf15VGTVZLLpk=;
        b=mF/Rqa0ozMA9AuKRChioA4ycvDkIW98IaTOLvRzIb6P99Ci7HoxQQVfsnd0s80w4LW
         DVBtGQ55Xh26xFvxXdiI2sCG2fb/8KOTjbwLoNZITB8KYxe0Sl0DlY/E8JQFLRjFqycn
         waN1wePE98M4mXlzJAM9dZvjdoP9ZY2odeyeBYUMi7wfBREPeFPDwyBySA9dc/AZDGmY
         zwLHYHTcmCksAnsNG2gzjBW2uORMgan51aExZkB+Bpdrh1cFRGF1YeJbpn+2cfcZ6/tl
         2qnAEw/JwLRxkBQPyMCW7fireppmpUzwHPH7RKrTVRM3qpaiWl1PBpWdOqkx8/Xo1WyW
         Z+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716556671; x=1717161471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlXCQc3o/MB52ttkYbUWNblq+v3TZ5Rf15VGTVZLLpk=;
        b=cSe6Bvl9lHnpc6j8xQXgieG9OX/noUIJD3yCHb3JEXrG/P7QjojBXOunhTKDHpRvTA
         wxB0dLMCLSOJPmzhM8hJrx7QmqR/YeskEmGe7Wjchba9KFCxSma5dkPaxutYlerPPGVu
         5D4mWVLzMy5RiH86hFJIxrr2yTtxnIEb1G41Dsxx3iabWww63ipAXTvaQ32TBwXerxNz
         ae6urpibjBi/Ss/4eumMXewm0+ZM3seBbVHODNz4Qtvvxll6HLU2iEG4OirW/dzY8Nc4
         SrjyASjp8Byt8B5822Y32ILxeiKhIzP7Bb+HgJ+AnmeRCgIUS6EIV6XnbG3FLEydg7Mr
         1xeA==
X-Forwarded-Encrypted: i=1; AJvYcCU9hkfG5B0fEyqmo3uOXymeoqcpm8huD3gfjQRHKELgx1eQgRTT8f4SNaEllnbGNvPbGSwPkZdvA2Qg6GhtxGQusWRKntyxb840oWkcsw==
X-Gm-Message-State: AOJu0YxHFsz3rN3PqaZkm715S4OYMHPUY3E8dcqELeuTi5MrPcOJkWef
	0JsaK1u5BeD/mSVrFxmT9/t65gQyVMCw4VvF8+4ZUtwN9/WPLLN3Xg4vuDHUCyXMYruZXkKPmaI
	3hW2UPmC+vKlb3PlDbhb+xUwiUIU=
X-Google-Smtp-Source: AGHT+IEwoe8jd0oZgn4cZUVcBCDA8tK4CYreDWY9kJHQp57IWOrilIahqDCBhTgwJSyB8G7rI/D9MAOMBfFiB7nWxpM=
X-Received: by 2002:a17:90b:1888:b0:2ac:5d2d:12ac with SMTP id
 98e67ed59e1d1-2bf5e84abfdmr2678646a91.5.1716556671509; Fri, 24 May 2024
 06:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com> <eeffaec3-df63-4e55-ab7a-064a65c00efa@roeck-us.net>
In-Reply-To: <eeffaec3-df63-4e55-ab7a-064a65c00efa@roeck-us.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 May 2024 09:17:40 -0400
Message-ID: <CADnq5_NmKyTBbE6=V+XdEKStnjcyYSHyHqdkgBen4UhPnVKimQ@mail.gmail.com>
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

On Fri, May 24, 2024 at 5:16=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> Hi,
>
> On Fri, Mar 29, 2024 at 12:18:28AM -0700, Samuel Holland wrote:
> > Now that all previously-supported architectures select
> > ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instea=
d
> > of the existing list of architectures. It can also take advantage of th=
e
> > common kernel-mode FPU API and method of adjusting CFLAGS.
> >
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>
> With this patch in the mainline kernel, I get the following build error
> when trying to build powerpc:ppc32_allmodconfig.
>
> powerpc64-linux-ld: drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_=
mode_lib.o uses hard float, drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm=
/amdgpu_dm_helpers.o uses soft float
> powerpc64-linux-ld: failed to merge target specific data of file drivers/=
gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o
>
> [ repeated many times ]
>
> The problem is no longer seen after reverting this patch.

Should be fixed with this patch:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/5f56be33f33dd1d50b9433f=
842c879a20dc00f5b
Will pull it into my -fixes branch.

Alex

>
> Guenter
