Return-Path: <linuxppc-dev+bounces-13475-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C38C1776D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 01:05:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cx6tz4Qdbz30MY;
	Wed, 29 Oct 2025 11:04:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761696299;
	cv=none; b=VCcZHxUAYnyoUUnSXfm9DKhAaxfyd6JFvfo2OCY5WjpVH3ySkynHvCZsV7YEvW+rE1rSEoc6x1hTmMytGOyvIaORdyrv8ckKiyYhq/hSXt48VRpey5Z/5a2OubTaDyqL4F0F8LzGX6HbMMjpQCF4G9ECxV8pIy2ok/SXfbsDxkvCvC1APPwPJU/fJoYgHyQnu2YOs3hcSTj9mWPst95w9sEL8PWjQqgTaioFiK2d/ftCThxFyf3FvBeRGps0FB4Aubo+L56OI5ei9jLQAVyQ3Ri+5watszLm/fqoeDBjEQn5cQeJ08yUShwBPDVDR7rdxaqANFqSkAHloLVJFoSZ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761696299; c=relaxed/relaxed;
	bh=BerLOcBoWrV1cLwn2WvSsreg5PxA+PLtgWK6veAyVuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7WzM2rcw/B92bndAV59aJ4mGmB05GwHr+MIS9ekpiIXgca7wXXpPq9NTFvtM8PtyRDqZDvp9SHZgYfXInOqZ56ty3shGnl50UGWzAStyjfT4uEGJyFoHNkpYLMnwsGVXwpNnIq3vBVSnfOEaxLQAh26qozmiAgHc5hR0WjZukzoBc2TGK2WsZaHX5iH5QUfQQ4+o0ImvpyI/3aAzK3SiG1WHCU6qukj0cEpFITo9OU3Ebs0qNUeRIVosYMlwGcZG0jMBwdpmgW/geT0pFrZdk7cZesBWLyyll7erMoi+R/43aKlba0SmmXPFfIW7cXVnZtgb3tWbtQetBD+mWWPVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=d9paSOkU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org) smtp.mailfrom=paul-moore.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=d9paSOkU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cx6ty5npFz303y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 11:04:58 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-33e27a3b153so6483027a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 17:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1761696296; x=1762301096; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BerLOcBoWrV1cLwn2WvSsreg5PxA+PLtgWK6veAyVuE=;
        b=d9paSOkUIHg9SZ0jF3/3RgevdKyTc2X/FjGDY1ygit7Zh6YfR8bx+rhbUQ+NnEfU2Y
         2lu8h3jGtElVgVxlku5UwIYiO8HW2iEUE2hc1x1P9p9z3o7SuNdaFVHepdQfF/lwep5f
         6SQA0jMinCZi7VSsoBi/FfkASPyC79aUIfxGpGjKzPk1QhFKs9ZanlJc1pGVGEuAdAY3
         8x5mfYB11WCVvgsLSxVP/S9OZAjRdURlprBdVMCgGCZikXMwg7UKLOzQpCjz3anYpmnO
         z9G6DAxGSUD4KBYz4/LkqmCH4jaVNO0Gq/qnxkbaLmEnpOZjux/rw6TT/jaJOI1fZ53P
         NjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761696296; x=1762301096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BerLOcBoWrV1cLwn2WvSsreg5PxA+PLtgWK6veAyVuE=;
        b=LrhD7SIHCVzVMx8fbOhXs940AG35qvnVixStDNFurGfrr1CXobT0rTpnfkOZt3Byhw
         Idu+FcOG6/+AYnebwwtrIqebZS0QW1i3Q3WekxFRQX45ZMJYhCEI8s3kco8gs96MDamb
         qRAOepEhgFcNzZrtO4BGKM0YNFXy54fTvXVCb6ayEF6jsm1mRoWUuXC6zh6oB74puMeL
         EUw57xuNA9HPygZJH/YgmR3R0o79ZDGdmtdmmDHrO7Fmlom6s9/Qj8ETGGaA29WDpyES
         /RjQABPkYMeol60Q3pqKw78up1TKaRnYTkTe7CqqIJwuuFYkfda6ghyu84a6jV1gZAtF
         qtiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhGEBPX8wr7xM2VO1Giu7lJjjbGLGDJO9bl9ELwb5Q11AG1FZBXRfhDFXXDuI2kFVu/T8/I8N4bvtxLVM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyjb6YDyIOBdxW3SUWj3d99KstxoMVh6iwOJn5u5xhlRfhGl/OW
	K+uUb8tbFj5mwhGDmJ5HB9Bc1olfn1Og3+7kBdAwWpxXEh14Yjn8Mvyg+SGMnCQ7zUThQCaPgLa
	/lOuya8lfLa+17J/UF3RVkVNo9DZlXhl4ydsF9Ahk
X-Gm-Gg: ASbGncvl6JdESDfTq9YOfY5XTTa53vlAozrnBU3ErFPdbyPPGK4y3GlCCKLfpq4kPW8
	m4ZW//gYl2yfe4SF+X8QFebduS46/OsoOfv1YBjJwoyaeCzQhLJ4cElBHZLY7E+vrPDCj3+QcCK
	Zai/WEFx22sFjJVil7opbsh4E61FSNjZvERtt9znFN3CPSliZN2AG3aJiP2Dv+c/d7ZW6+vEpkJ
	P7Ku8utN9+/IZCnTQ97kkuQaCU8TZIBf6+O4DqZ98l0Ov8UxOX2esfoDsMW7Y7aCpDWdqI=
X-Google-Smtp-Source: AGHT+IF9Sg8XTJhY1XF+gNJzXx33YCPJNPvD397jHY3K37ysFCuyvsRKOtkLfk2UKLtdow89RUSTsoGqlzXNXJIH+YE=
X-Received: by 2002:a17:90b:3147:b0:33e:1ae2:a4a7 with SMTP id
 98e67ed59e1d1-3403a2604b4mr1039988a91.12.1761696296385; Tue, 28 Oct 2025
 17:04:56 -0700 (PDT)
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
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk> <20251028004614.393374-50-viro@zeniv.linux.org.uk>
In-Reply-To: <20251028004614.393374-50-viro@zeniv.linux.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Oct 2025 20:04:44 -0400
X-Gm-Features: AWmQ_blrbvCvNMESns84vcg9Bs91_mExO5kolf7cbCdCoz5ngCaqmvIG7Oeo_oM
Message-ID: <CAHC9VhQH--uP=fWo0MsH5=BojV2qG=qy7A9tHTVOnLYOxKbV5Q@mail.gmail.com>
Subject: Re: [PATCH v2 49/50] kill securityfs_recursive_remove()
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, raven@themaw.net, miklos@szeredi.hu, 
	neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org, 
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, kees@kernel.org, 
	rostedt@goodmis.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 27, 2025 at 8:46=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> it's an unused alias for securityfs_remove()
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  include/linux/security.h | 2 --
>  1 file changed, 2 deletions(-)

That's annoying.  Another case of
let-me-know-if-this-patchset-dies-so-I-can-take-this-patch-regardless.

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com

