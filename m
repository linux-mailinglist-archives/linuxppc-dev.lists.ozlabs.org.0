Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E8DE77F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 18:59:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4722XR5QnpzDrpp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 04:59:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=alexdeucher@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lsYd+IrB"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4722Ts5QcSzDqWR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 04:56:45 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id e11so10882644wrv.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 10:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yAgZMtf/VMvYmjG/BeZrCrg9OryuwBnaN7WoS0QCndo=;
 b=lsYd+IrBzjmG3qfteumSThkMdXzznfqx5E28vX8HNjBNCvlLPm2zTiCTD9/dTnIovI
 GzciN/1SNDxwcb3dI4c7inPDt3Hn1zePT9aEjzauaWC4X4XHzeI3iOssBTzebbmSBYbK
 iw9dq7cMOa+QfqT6oq7EeynrMbkg0UTIa0UaHj8aoHhyrOud3GUr+5wKjq+B52SUinmq
 rU2NppWWK8r0eepPXqrNWMhh2Byfl47OLXgNpnkgEHVaX8DxEXdrD26CeeGKb+5UpCaz
 +79sOdQIF+WoGFbd5JS8021/3NKCotJ6B/r3XblTC5bxhsVGT8XqxqSRJP6Tz2mgeWMp
 jECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yAgZMtf/VMvYmjG/BeZrCrg9OryuwBnaN7WoS0QCndo=;
 b=Hvm61vmbL+eeUb6KAHpEgOBMtWePUfbpvblheyMdhKbRlGGUeK07Rwjxx60RjNA1qs
 hXw3Ju5l5gBXGLRcL/GmwEv7XjOEz0CHXNAafaHrmZ0kkH/QZIsjRMF9wOKmw0RXAbS3
 nWM/VPc3Vj8GrP8mi7menV0IeBiCQ+qGGEhNxtHVbqO/q6hzeTD+F3ATCtakiEqurkU0
 l3UgmWbvDp9OSyJJ2wwjuFNBpnrb0gze8SqIwNVbUsQqbCAdaeG7Dko8wNlKjytu9Lpe
 4sS5LCdYYJYTScg3/V2fsRMvZFks8Hy6ZybM4C/pfd78lh7jC95Kub5dTh8gVadCen8Q
 IudQ==
X-Gm-Message-State: APjAAAW2DRjdnCiY8H4Cz6YxnClsf1uhlddN4q79lR89ezgMHhogh6Lk
 3g0LfIH/ZdrE/2PCrURnftmXdNL+nARnsWAck1Y=
X-Google-Smtp-Source: APXvYqxnORJpDwc4s1jCy3Q5X+6OC0fEfKMsIR8ZweCFnT0Pjd7LJxMWaOSFSH1x4BZ/57s6J/Kd17r2Xg5+gEdaz8Q=
X-Received: by 2002:adf:ed02:: with SMTP id a2mr15784221wro.11.1572285399932; 
 Mon, 28 Oct 2019 10:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191021145149.31657-1-geert+renesas@glider.be>
 <20191021145149.31657-4-geert+renesas@glider.be>
In-Reply-To: <20191021145149.31657-4-geert+renesas@glider.be>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Oct 2019 13:56:26 -0400
Message-ID: <CADnq5_Mcs1EzvETV=+XjWZcbJff-bfLycYZ3N+SVE9-KA7U-Sw@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/amdgpu: Remove superfluous void * cast in
 debugfs_create_file() call
To: Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nishanth Menon <nm@ti.com>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 =?UTF-8?Q?Breno_Leit=C3=A3o?= <leitao@debian.org>, David@rox.of.borg,
 Herbert Xu <herbert@gondor.apana.org.au>, Kevin Hilman <khilman@kernel.org>,
 Nayna Jain <nayna@linux.ibm.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Casey Leedom <leedom@chelsio.com>, Linux PM <linux-pm@vger.kernel.org>,
 Pensando Drivers <drivers@pensando.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>,
 linux-crypto@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Network Development <netdev@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Paul Mackerras <paulus@samba.org>,
 Shannon Nelson <snelson@pensando.io>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 21, 2019 at 6:23 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> There is no need to cast a typed pointer to a void pointer when calling
> a function that accepts the latter.  Remove it, as the cast prevents
> further compiler checks.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index 5652cc72ed3a9b3a..b97a38b1e089b3d6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -1090,8 +1090,8 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)
>  {
>         adev->debugfs_preempt =
>                 debugfs_create_file("amdgpu_preempt_ib", 0600,
> -                                   adev->ddev->primary->debugfs_root,
> -                                   (void *)adev, &fops_ib_preempt);
> +                                   adev->ddev->primary->debugfs_root, adev,
> +                                   &fops_ib_preempt);
>         if (!(adev->debugfs_preempt)) {
>                 DRM_ERROR("unable to create amdgpu_preempt_ib debugsfs file\n");
>                 return -EIO;
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
