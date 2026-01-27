Return-Path: <linuxppc-dev+bounces-16327-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHIQD2wGeWk3ugEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16327-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 19:39:40 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4212B993DB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 19:39:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0vMW1ddbz309N;
	Wed, 28 Jan 2026 05:39:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769539175;
	cv=none; b=VVRu9Kh6KcpaZ1cxOBAWk1Tcg4Q7svvfw/ntzAGhc9cLp5az/gREzULPuFlb4PqEOv8yqe6mSLBTJy1c2eueC0B4B/JziCStSnEajZflxDgsr0p0O0iQPI5cy34nJOsnH3yyFypdR880GJBvKiw1OWbQBjrB9PxcloZ7w9kMYO9Vy10bFl8kzVDh1aoS5Mc62LRSzQYjOBMsqvPstPME+fHVruCZEeAQIbYDx6pPdjbIxxr5XUwl+9wnJFnIrjPw8CXPO6QAI7GRjotvN74EgCdkA2AHpTKYrVTDpMPS2XsobgXC7OA7LybmuDcm03KD7jRus+6vOYx3cAWET9HPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769539175; c=relaxed/relaxed;
	bh=IB3BhFyIjodZhUGQQ41xIA4/U0Zmh362p3tEBCm/trs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+XoMszkzO9C9PXCRkl89RHPh+ts8KIfB2eIce2+V0wWzwbojTwJCEYEqUSyOgF6hAUM2sigylUDC+k7l6IlgqAqi+VuIXcwsPiXOulpzLRRnyy6OJnBVGf+s44c59Uz3V9wEtSnZc9iuYRfsEPaSUNPVXLnU9JyRpI6H21q91LNS4dghce7AGTVc+vvQyV+w4retpW+a//tFnn37c/FONDE0KXonokwbhyG7eXdyD4wQX5eG46kYznGIxqZGzFmmcsFAJouXqN6OqMzHH7m9f10V1vxbtF/+cbb+JEoudUySvyKBVOoipk1Da3aG8VMIA/vajpt5HbwgG+IZKOfJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=AL2hoUTq; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=AL2hoUTq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0vMT275Bz2xc8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 05:39:32 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b8863db032dso726657866b.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 10:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1769539164; x=1770143964; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IB3BhFyIjodZhUGQQ41xIA4/U0Zmh362p3tEBCm/trs=;
        b=AL2hoUTqbU45YXIFn4fplqIUGLUbSTWrdFMDd0ERJSnFXGHDFwN48nCorMl5EZpIh7
         hNYN26715tmzEfNVm8xTDw0ZZQHeI1u3dJy3L6+YC0KYB1nOabL6HglzMqGFAYQq0pYf
         kqjAmzBFzE0E6/OnvTT8BskGqiyrEkzO7wtEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769539164; x=1770143964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IB3BhFyIjodZhUGQQ41xIA4/U0Zmh362p3tEBCm/trs=;
        b=Ng9TqXVc568XQEcxbIv6/6CpX7rNLcQG3KJcqFNd+olgPf8LugxpSzyJVKI322PaET
         2NvrL7AubwhM3K4v9/Yah/HQPYshmfvlzZu+bof7IqcThssxpQWVDHbWdIOMLUPgrhsn
         WT25gT9ZhAl5ajZHnlGvm5jF24ukvd9+Z3AHgHAXzdGgSbbo/OPk6rqsQq1Il9a73reJ
         DjGFjoSU13n+uHaFPLGzHVCVW7F12hsphguJsrW90tw6HA8oBbwy0y91jhGxequPJS+e
         wZmVzkRlwQkbsCA8gMuz16eP4OBOyWvh7K4919Ii6vVeY6LlP7p/E0P2YXsdDJm+jBLn
         BxwA==
X-Forwarded-Encrypted: i=1; AJvYcCU3OKay/3EvxDmKRcfGEhmHp3GCJb2hUB7+1JVFveEpLJnkLLM5Z/FW8+eREX9tnOtdaA61VUe2HNN0Nf0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyq7K03Y+JAuDNXf9JiCiFb3vvkQj8kY5kI2ZGk9P7X1+BOctqE
	AAvDqWnMNkxaGBzof5klo4+oy5gULjOt7zKtiSDwUlrEJDkzcmkHk+vqitxeMxAluiJQUHECEpM
	a3/9AiRM=
X-Gm-Gg: AZuq6aLMitpgZXlwzuxdSpNyZiGbdkuK78cAEBUKxOodiGofg2KamIoKY7ppsnmcGtj
	g73jnMf4BdSJQ+cXeR+nVfdcLVGE5QtAsIuxDWbhqs7YQ3XYBrLHxVeM1wF/KdyUJhftDtqovqN
	DQkcC6xpYpIxQsyiT4R9ViLxQEL+9QVnsQSdk0nIEsD91znDt8CSZad25QfQcu+Hzg89mGgRbkw
	OAoGZyYCielkPhsZzbFD0Tyc70YhaGP8RByZnSoDEja9NoT7Z0MU0M//hGGOU++pyyshONXKMOk
	Rm12Z2DDsq+YYHQsB1BrzQBgbIpJ/ePwMpOYRBpL+nPmJLrsNf1yg9Loma4Z/IUIG9xe+5dq1Fr
	2QaXuaXCj/iHiO/DmOv+I4UjAINgD2RaDIcXFUnEZWCpmhq9P0rojpcd1nwPWiaSZMEZ97zb0fE
	Dhu+7SkwGD7Mh4JozwtKYgquDoUTzzP8iVyuKF4i8h3o1uNZuDcSPW8cEZBAe1qX0BZxG974s=
X-Received: by 2002:a17:907:9714:b0:b87:63a8:880c with SMTP id a640c23a62f3a-b8dab1b52fcmr196448166b.19.1769539163794;
        Tue, 27 Jan 2026 10:39:23 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46ae22fsm214553a12.35.2026.01.27.10.39.21
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 10:39:22 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65815ec51d3so10893058a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 10:39:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWnU52x9Taqsv1NtiJoR6kzCsg72p1cjblHUgpmTZeWZLuOrSKxC3LXK7f6d7U2csBXfAIfFJf8JXco5T4=@lists.ozlabs.org
X-Received: by 2002:a05:6402:27c6:b0:64b:9d9b:f0f7 with SMTP id
 4fb4d7f45d1cf-658a60c5513mr1939607a12.33.1769539160812; Tue, 27 Jan 2026
 10:39:20 -0800 (PST)
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
References: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
 <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com> <2026012715-mantra-pope-9431@gregkh>
In-Reply-To: <2026012715-mantra-pope-9431@gregkh>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 27 Jan 2026 10:39:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=whME4fu2Gn+W7MPiFHqwn51VByhpttf-wHdhAqQAQXpqw@mail.gmail.com>
X-Gm-Features: AZwV_QjTvEFSmpHcnOP1NJLVZBe5xlcj-dD5ZtjcNC__rjqudIVF0E_rBxSpQA4
Message-ID: <CAHk-=whME4fu2Gn+W7MPiFHqwn51VByhpttf-wHdhAqQAQXpqw@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Samuel Wu <wusamuel@google.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-fsdevel@vger.kernel.org, brauner@kernel.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org, clm@meta.com, 
	android-kernel-team <android-kernel-team@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:wusamuel@google.com,m:viro@zeniv.linux.org.uk,m:linux-fsdevel@vger.kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:raven@themaw.net,m:miklos@szeredi.hu,m:neil@brown.name,m:a.hindborg@kernel.org,m:linux-mm@kvack.org,m:linux-efi@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:kees@kernel.org,m:rostedt@goodmis.org,m:linux-usb@vger.kernel.org,m:paul@paul-moore.com,m:casey@schaufler-ca.com,m:linuxppc-dev@lists.ozlabs.org,m:john.johansen@canonical.com,m:selinux@vger.kernel.org,m:borntraeger@linux.ibm.com,m:bpf@vger.kernel.org,m:clm@meta.com,m:android-kernel-team@google.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER(0.00)[torvalds@linux-foundation.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-16327-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 4212B993DB
X-Rspamd-Action: no action

On Mon, 26 Jan 2026 at 23:42, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> Note that I had to revert commit e5bf5ee26663 ("functionfs: fix the
> open/removal races") from the stable backports, as it was causing issues
> on the pixel devices it got backported to.  So perhaps look there?

Hmm. That commit is obviously still upstream, do we understand why it
caused problems in the backports?

                 Linus

