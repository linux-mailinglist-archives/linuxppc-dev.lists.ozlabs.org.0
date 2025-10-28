Return-Path: <linuxppc-dev+bounces-13473-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2181FC17704
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 00:59:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cx6m42jY3z303y;
	Wed, 29 Oct 2025 10:59:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761695940;
	cv=none; b=KscW39SNjyn1PAKMi6KYqno3gjUT1N0wmhyMhUKAh6DvtsEWIOEn38SakeEd9ufN1HV2FHwky6GEUjMLAqN2tSJxt3FX6H3fQR5Mbr1kYEW6UxmLNmlyL3MXjM3ufKFOWV6hq6/bhj+W+9iND7Qfc4ULEweY/y9xfl9M/vjzT8ojIFIHQ9azO91EFOw5HliR6lBnlAwN1Xt59NqrYZAAnOiMrdPHj6CR/iKkLiDX5aYMJWd3zIL0NuyIyZaT2nrgZVj9C+Xg9uKSTU0HF9WG1pcFRHQM/oV6egGba4yPaY22aYE5L31P4cz74Q9VdWTBnGIAARogekYi+LN9U9CTFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761695940; c=relaxed/relaxed;
	bh=/WE4n4TCb18hPsMXmSS/+ET4xqQfmAur/mQUYq6ibGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qguh0PtphY4OCf9WZp4F5AzUHGfPKQwv7MnfJr2xtxc92SHU4Ufgdd7DElyGFr7QaN38iZYGgTPWWGs5MCDIRtowlWBVt70olJbBYyPCpEhtvGaQc/zZS2dJ54DU8n0e4dqc0H0+57P5JYvoL8E9BaIvPCKyaCgY/7vrvESPVZ7UgLQ5M1E4nie3KA6dPzlSILoTa+rSZnjuYE89U2uUYflizplREcSPdK+AdY5iMzoobgYcUo4t4I99dLGoXn04MimCoq11Qs1NevQnX5WRPRqCtVzvy+HkEiYFMbpXUnI47MHZP44xGxgpLFihTIxtRqeMsn4Hx91/k01+dRUJ4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=WVaY5hzc; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org) smtp.mailfrom=paul-moore.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=WVaY5hzc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cx6m31W1Vz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 10:58:58 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-63c31c20b64so10359792a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 16:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1761695933; x=1762300733; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WE4n4TCb18hPsMXmSS/+ET4xqQfmAur/mQUYq6ibGY=;
        b=WVaY5hzcPS0GbcK288sR/UnVfNz/KyzmExcnCNLCpRAdbcA1VGiNS9BWaCS+IdtGZi
         tCB0DLuFRST3rg1ZjlOzU57qAYlv3YMBKTkWSTYlyZYmVeFXci7yiVoP2FPZnWeHK2Hh
         Tp2SyozkHVzGkPtl7RtAAgZI0VvDRA0uKx/IoMZsk2/tpTyTRTXb00ZsODcT5HF/vcwl
         IUigrjPuBC+gJKEy/d1zZ7D75Y6VpF7QzSoyD/02uVS/t1iP/VpTRG2x2QaK0DrlT5QY
         pun38anZCSeoPdCTqQsj22GEAJLLDzLIgb/M4Tp6xnBRaVG7UY/7XB1SRw870uX+yQ37
         XzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761695933; x=1762300733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WE4n4TCb18hPsMXmSS/+ET4xqQfmAur/mQUYq6ibGY=;
        b=XsZCxSmi9hASNAnQL4lIZ/CJXhNY3r9qIX9ZtuEtJHs8RZCJ/5FLIorOOsWjeYEZbg
         YLxDOcUq38Gt2zZlj4xikL8M+acmrfEIjagvYdQaOYnmuppE/2bIjo/4nPnvvhHj2Ze1
         Vc34uLv3ji6xe4t18rxPwTnXUCcmbSlrzxmnJV7wqFYhKZHfEul/M5xyKMh+NCRhjiz8
         fbFAVU4x4dOTdz5Rbcs7rnlVT7v4/LD1MIwNYJ/+GIvvnPedDgq6YTF3MoJ4P8hCPhSh
         O13STEw0oJ+u4bSh6ao/h+Vw7Ycz3myZS4lgFipYz0lcyNhZPSkaJSrCQTJznAhOGPsI
         FJ9w==
X-Forwarded-Encrypted: i=1; AJvYcCWtM4snbyM+xmfH8mxz9fvdA3pFn5L5lHo7o99ByCH5m0UDoEOFxSwySOsk1k7bWxSHi2ugoZFi2lWYKh4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxc8mXALiJZtZcTGyD7L8JpoKQ6wUD5CoqvZP/P0yFg6SkncBKb
	R9KmrDhN3sRUQKjCywOMCj6+Ftn9yWlUcjBLEPyS3Xj1iDgaaW42tCmLScuFrRoG9tzA5C4hVmO
	zAWz4tS2lP4sQcD3DHlJ3VgVa1EFbFezrhNjsoF4z
X-Gm-Gg: ASbGncsLtrPO0n1HXnjS8Qm8vAN7J34S1MxVDIiNTXOHvwlweZX+06g9upIEz1gx+Ip
	fByU1thgVZ3QUJLur6mWXpKaFyJmTmfugsFr7Vl13Nr+cyji1pLWGhI4/O8yos7qInO91MEpfGh
	BhUi4obVGTxjWxG3yMH6JIs8aUJ6sMYdx7QGxsvmuGO93KmG4eTH/+8bVmFAcTBwzyQBZ+7SBY6
	GRWa0U7/SSguOTJBjAnin17Ugta6KLzmDJVvbv2fi6fAb4+ysQz5+tgQEEA
X-Google-Smtp-Source: AGHT+IHvIzFCAVsIe9KLnMzhe7HeHw161tWjaGF8dq9LK8mHTJ5LNBNsg03z1RN2kv4hUoIzYntUB79AzDiL37F2WAo=
X-Received: by 2002:a05:6402:50d0:b0:638:74dc:cf78 with SMTP id
 4fb4d7f45d1cf-64044380bd9mr816143a12.34.1761695932545; Tue, 28 Oct 2025
 16:58:52 -0700 (PDT)
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
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk> <20251028004614.393374-11-viro@zeniv.linux.org.uk>
In-Reply-To: <20251028004614.393374-11-viro@zeniv.linux.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Oct 2025 19:58:33 -0400
X-Gm-Features: AWmQ_bnbOFuYYw7q6A3vKx1W9tiGVviHbdGsSFCW7Z6eJ8jFBd6mwoz2mbQdJG4
Message-ID: <CAHC9VhR4nO+TanWwz4R-RQijy9h5B2h6HuBDXxBNp0+kAE4Asw@mail.gmail.com>
Subject: Re: [PATCH v2 10/50] configfs, securityfs: kill_litter_super() not needed
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
> These are guaranteed to be empty by the time they are shut down;
> both are single-instance and there is an internal mount maintained
> for as long as there is any contents.
>
> Both have that internal mount pinned by every object in root.
>
> In other words, kill_litter_super() boils down to kill_anon_super()
> for those.
>
> Reviewed-by: Joel Becker <jlbec@evilplan.org>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  fs/configfs/mount.c | 2 +-
>  security/inode.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Paul Moore <paul@paul-moore> (LSM)

--=20
paul-moore.com

