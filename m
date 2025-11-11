Return-Path: <linuxppc-dev+bounces-14094-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43158C4D5F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 12:18:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5PDD24H7z303X;
	Tue, 11 Nov 2025 22:18:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762857007;
	cv=none; b=lQ2MLevygfJyaWOyDveey+KESKjQ3WnroWQAd+mN4L/QlfybbXsN0TbcD5WsooYi45NUfs+sqa6hK+NpKn3o7gPCKM3WvmEWB2Wbmf5AJ6DbWXfEfH/xLILDckK1KEplX430YRXLLr94DiCAHQKoacFGTeXqYhb2mhGblgQYuoj03Y3Kc9YH34Cn0lhR3fqipgkxnqvzW4bf87OzGiK3CpEgaQUaOZVhJWAR75gkw+6unfRoBaQ2Q33relyHen+QtDZereExQrtKZ1MoL0I/fjsybOyoikb3pZ7Na+B717D2XVBWiFNcD6m4YfzkMbgyfapmrYC8zD3WdHdP35eHog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762857007; c=relaxed/relaxed;
	bh=ErpvLu+msmOQH+DLoUzEraHYQEPe7HwAu5dxR8qbtAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kzTQlrQL4CCpOiZje/XD+dHnui75LBHhxzVH18KLNuxauj0VnnyrYNHTL9ELVhnS/zsFhtF5knItvjKaV9r1DYWZ7nDsvNm9mtpDQ2Q7z5Z9SC/UhEOVtoqeqXKRwJhpIvC7nZpeEh8eq4nnPLnL0BbylX2YgBNFp4EdFUJzT1DhgHz9oFguIy62Ns8R5L1qlA9iN6P+v2GFNdGYdb0MsTesLCccW8dQxieLJSupikcLfB/hDq3pTmcqdNjDrp6UUNvYse+2u532kO7Uj66AYeIzEULoDPiRZlJKA24zTVjgW5sQ8bnsOI4KrpXwYxfC5nh3Uh/x1nBagIPAL1fYng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; dkim=pass (1024-bit key; unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=gVLMlAJ9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=miklos@szeredi.hu; receiver=lists.ozlabs.org) smtp.mailfrom=szeredi.hu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=gVLMlAJ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=szeredi.hu (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=miklos@szeredi.hu; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5N8G3ZS2z309L
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 21:30:06 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4ed946ed3cdso32229281cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 02:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1762857004; x=1763461804; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ErpvLu+msmOQH+DLoUzEraHYQEPe7HwAu5dxR8qbtAo=;
        b=gVLMlAJ90BpirvYAtyxwR4ekD9t+XDgHQY2WLmUSz5Rws1XAenBrQhIELr48Z8HsZ6
         S5wxaz2zwFf8y3id17Q8GTXDt+sBmtwiwuNny2iXWCyvWoGwmBlzm6dfxLaMPeD2H8rS
         beh7yexzPr7ae4zPF+I53wrfQz0SlROa0pzdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857004; x=1763461804;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErpvLu+msmOQH+DLoUzEraHYQEPe7HwAu5dxR8qbtAo=;
        b=MD1sacu+gjXX3qRbee33s9CBmZ9G3FibbyABiHX25ORCgKdDWYRQFAqS0P+p91/CLa
         stor+rogTNgVRnf835GiM+WTb/880Eq7qmZLd7yuGUSXkRttHHPny1uSP0wBh66rM0H5
         UYlgfemcpDsOvegloHUPiBt9aIsX9+fnemiR6tREptzhv2AZbhClARRO1XeG4CJ+LjmY
         ZYjCunMnpVBgtdq8ll9yV7m++qaFwaHcqQgbgxnGVxGtiHQhqd1c7kJl86aK9AkRWdpg
         9RNy9Ol/6tjXIFvCV2hpl5gnKiarGy+va3W8uQ+hvuUDlbPqGwFO+J1/6XEwnM2tp5pF
         Athg==
X-Forwarded-Encrypted: i=1; AJvYcCXj9Wo/kQ0d41OkktN+vaeHSt1lNxQNKCZfagJYA2R7peDQ5/KBkJCPdYILbeObIGVL18F5z0DKJMy7XOA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzLcrjJLTXPBlzcNLr96sJGoGOpfAKqGxQySsg88eGLeNZ1MtLb
	nysD7pXIDFHOmi52iBDCTCARze9T4cEK5lvzYlR92xao6NBRb6+plaSJRoCiXwd1KjebwsuASPL
	Gh+n4ruYuS/0Ze/dF0V7nGAjNDB0g/+aNEqmRv0/bYw==
X-Gm-Gg: ASbGncteJocHAD/3i1MyvWRBQRCRkGrQm+GPIM8TkVBfIG30YLa7ll7pSHoJQwsuo6m
	ZbXHnRCoItSF+Gb5RkrHtYitGt01WzzuAvR4gAaB3c2g3K2wTabf+VUWELUMThA3Dud6PfESuyD
	3igT9ry7l84Bb7U8KEvOW5MPPbwGWdIp93KurSccxv1Zu6eUtXxf6nAaBrCjlLqtidSG+osi5FX
	q0xiIwLgcbOYU9uSpV0n82gSObIX5egZ2U9kJPl4g54gh5vlP7GRFG+kjZIlcaWr/ZC2g==
X-Google-Smtp-Source: AGHT+IG1vPc79jE1NxMTWUcAkMOFXJ1dO7xwNLHncVzXeQGMi6M4ZcaWG7wZ9Wn4xgn8RqaQcm4UKxcrnMz8XFw/71I=
X-Received: by 2002:ac8:7d8b:0:b0:4ed:b378:145d with SMTP id
 d75a77b69052e-4edb3781c5fmr87056701cf.45.1762857003684; Tue, 11 Nov 2025
 02:30:03 -0800 (PST)
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
References: <20251111065520.2847791-1-viro@zeniv.linux.org.uk> <20251111065520.2847791-4-viro@zeniv.linux.org.uk>
In-Reply-To: <20251111065520.2847791-4-viro@zeniv.linux.org.uk>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 11 Nov 2025 11:29:52 +0100
X-Gm-Features: AWmQ_bnbS5BGnOdlDcNli2J3_mWe2QdNv2AalQvWZZg8jjhCbQzLKZqYiVdFPQQ
Message-ID: <CAJfpegv5eZK=70GEdbofg8u-CKS7gL6Ur5PD86Ay4h3Z8D986A@mail.gmail.com>
Subject: Re: [PATCH v3 03/50] new helper: simple_remove_by_name()
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, raven@themaw.net, neil@brown.name, 
	a.hindborg@kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, paul@paul-moore.com, 
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 11 Nov 2025 at 07:55, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> simple_recursive_removal(), but instead of victim dentry it takes
> parent + name.
>
> Used to be open-coded in fs/fuse/control.c, but there's no need to expose
> the guts of that thing there and there are other potential users, so
> let's lift it into libfs...
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Acked-by: Miklos Szeredi <mszeredi@redhat.com>

