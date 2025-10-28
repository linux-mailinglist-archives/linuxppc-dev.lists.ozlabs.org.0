Return-Path: <linuxppc-dev+bounces-13471-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 473B9C17663
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 00:51:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cx6bF0lGMz303y;
	Wed, 29 Oct 2025 10:51:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761695480;
	cv=none; b=iKp977JgNIJybvz+XvKOeL/ENwlpdwB2ArMWo6noNDM1yQG63Ghi1NsQ0Dh1UeTM9fF0Z2gWFKi7/T+B+h9wxo1ccjsFcltZeWGaXKaBQBVDsB2JnG9Bq7zxcTe/S+dfj6ewBt8l6ADS1ZH6BpSWzzGbh0Qms5tTl8y9bZa8n5ECp1GlexpiBiCXs7kxiNVVIdwUd06HibVZKeQv0FmusGvuDiOhiQEAGY5ziNFKnOmSCTTg3ULHG64o9ntO0XJN4r95nmcu/Doo9qEwjrjOB4MLjDI8HZvD8D94QwfYlZ8OpAyh8x+rG6N2LreqTWbu2Ikld0RWGKI0lUwuyjvnGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761695480; c=relaxed/relaxed;
	bh=Ss0xsZDTL1rwOqKY2yzsfuodL2zhm4Ktw8Z3rrAQsGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIyHvo6c8wFY46+i99Ze7KKzB1hFgt38t19fdGeeaiqfXTwr+8Ws4E9zW7Q75rSbx54D9W4gooMB/WJFQtHRkgGf3rhtbc8jR7RlJfZ+PdjND0OasL4dYN6XqkUhEM9XKXoSWm7PPT1dijYglMEfAPuh6XEA2K6eKEVEs54G5n0dnaG1TdsDcSUt3KPO5/7B+f2cdaxz81vspHZYNkKh/HVgWfymGT1L3Dwg9+/FPdNXTG4HCLw5IA4K/VwPExlOvjqFn7I5NZ9HGg6vuJpkT8h+VmzC7PcqmGNU/m41GJMZjyf4L0AmJa3KhVzB1nWqgPXP3tdbOOQm9AJNTw9e8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=B52Qs2LA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org) smtp.mailfrom=paul-moore.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=B52Qs2LA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cx6bC4G34z2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 10:51:18 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b6271ea3a6fso4511648a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 16:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1761695475; x=1762300275; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ss0xsZDTL1rwOqKY2yzsfuodL2zhm4Ktw8Z3rrAQsGY=;
        b=B52Qs2LAFygrGGKnYGgiupZPwTTlzzY94Ojx1d/d5Yv7v0FncYgMnyJ+mkNJj8mFcd
         6bUG/p1Rr8TMK1D7UOFLTUmYKNRVVPO/2jxl7dfVsWosC0ushb0y8P/0NlWq62T67Vex
         B2Pk+LKAnJupYAwD0pGlptWuQ4EFvYMygIOrYqrsdxrLQoF851Q4Sj+bai0xxGihvyJO
         SgO2cnI3sr2/2x0Wy6FerK4dsgQKx+L3zHri88JIk2I7q1mZJnW4vMuUHsUXOPm1uIY1
         OwMO8M1b+QWpeL07MRI1XGcSs1CceQpzGwnAZLb0LeO2b+/Wg3aNwPH+vhWhOzayCOC6
         y9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761695475; x=1762300275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ss0xsZDTL1rwOqKY2yzsfuodL2zhm4Ktw8Z3rrAQsGY=;
        b=rqn2JMuiUSEmwHrYHTWXl8WwrSPYT2KdkBOzfFaX5WxaHai9DV0PDodsae7K9hxpCy
         GudrokAzARt8Bkps2x5mqH+AZIauHgAHiKvzsARyLkZMYVb83IBkzWxegce8gDU28lz1
         mIb1L1+VlO4MLLOmNGvcLp+tn3VZNQCtsJlTCyTk0SWkwuSxhnHi3YoCaKUyDnPn+W7B
         LNIsBzuOnTSw2F9J6oedNGv1mPYkPhZ3QEThNQ6cQlhQw+JKdknONBaaTpm6C0qs378j
         2FL1ex4L80jgkfbmC945AoFk7uTsWYMPgJ0ItckYvdly0KikusDXFFW2l0a/DXb+Vll7
         c9dA==
X-Forwarded-Encrypted: i=1; AJvYcCXIflD04jmdP8IiM8aRkO4120PeDCB3aIDqWFIijS8dOp0rKELgLYUaUk/OlJCniHkmElnKbiHHzC36Vg8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzs1mjYc+Q/u1awYvuiI8aanpg9WcjV/HS+wM7fekLvP12Awigh
	qyicEsZYZ/zwt85BGOGAH0D3oYgpY0CSrMY3E/TuLXzANDEs6+w6kMd9Ek1PiuxNPhp+4Qt7ona
	sUzp+KpDCCdJ1lTD9+vxIG/MJ5Z5FxiHanuOkOS5i
X-Gm-Gg: ASbGncsjDEiJEzKASgeI1NbDSG788uqPOiuSOy+w4/HXEMHRaD0N9Og2e8u9xFMG35F
	xsGvg90Iy7y6LPG2uOStIroklDpWYkBuGN4yewVicRICxs/+JKvMw1WDkWH/vSJI49B2yNx17UV
	Cm8Mh0iMfaUCqIHbRORkyN2eWS+pOH1AQSierF7OPVx6gQfp5ULHWT0UQRQZea7E3EPWFG3K/xG
	4+MnnMTHayCM2TeEKozF7c6KJZzJD81+yB/ti5QC87sQ0HQXSgoNbWhQBz6
X-Google-Smtp-Source: AGHT+IEQNyH4/UIhryBKstXm8OFaWiuLlbUq8UQcH5+4F6rsLQi06Pj91sWwNLFBJTsNKL1LL+PFGKuePdALOMKBWdA=
X-Received: by 2002:a17:903:32c1:b0:267:99bf:6724 with SMTP id
 d9443c01a7336-294deebc1a4mr13124835ad.31.1761695475463; Tue, 28 Oct 2025
 16:51:15 -0700 (PDT)
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
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk> <20251028004614.393374-35-viro@zeniv.linux.org.uk>
In-Reply-To: <20251028004614.393374-35-viro@zeniv.linux.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Oct 2025 19:51:04 -0400
X-Gm-Features: AWmQ_bn3uluZWrDfxLWehWBukesK9g25bn5Thq9tyHBU2hJYs5NTI3fvunVput8
Message-ID: <CAHC9VhRa011jL86779TBk8FK-pcWinLkSkQ1MoxGyyfJg5SMgA@mail.gmail.com>
Subject: Re: [PATCH v2 34/50] selinuxfs: new helper for attaching files to tree
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
> allocating dentry after the inode has been set up reduces the amount
> of boilerplate - "attach this inode under that name and this parent
> or drop inode in case of failure" simplifies quite a few places.
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  security/selinux/selinuxfs.c | 160 +++++++++++++++--------------------
>  1 file changed, 66 insertions(+), 94 deletions(-)

Looks fine to me, thanks Al.  If for some reason the rest of the
patchset doesn't go anywhere, let me know and I can take this patch;
it seems like a nice improvement independent of the rest.

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com

