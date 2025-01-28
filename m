Return-Path: <linuxppc-dev+bounces-5632-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD40A20D46
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 16:43:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj8hH0yCJz2ydW;
	Wed, 29 Jan 2025 02:43:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b2a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738079007;
	cv=none; b=eAgw33DXtrYSkzu4GKDmcuEQZG+SdJTZFZ0LM+aYe/XDYmtbre2QSMOv04K3VWeSnzP+vfDt/ZO2QwJLTJ+TH7n5Dx5Gwo1Ua6fXzgECldY8wkzQmHmFlEnZ0Z4QznzcXRGQpM5hRwq0BHudgFY4tPrv05pwLMKo8xly2mD9HO1YS61L0K3PKsVL9/Jz0494SSl5yQSV3zeTTfSnW+45s8sEx/ttGM8+QpfvLEbfy4HMIBGY/poZJo79kPAUOOthVoNzv5FA+mQyKH/5rhy0nhOMWWiMQQd93hwWHWMvV3LxqEdQLB7pmJ5BPx2rZ9o6K1Bb2+NIVudjN+h5tEqxwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738079007; c=relaxed/relaxed;
	bh=4CM+Y34LzyqTPbJa964bMKTZoegb6ZCbeVLJYvxkr2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DKXojDrKquH8+qlOv/vv85TQ77ufv1+BvT5N6sQnIpcEpG7s348ijJHp7DT2fdWo72NafTE6yhQlDrzhiNLst4OR2RZjBBoM24xGAv/wDNiXY50lV5oMSxOA2ZL32j2xns+lVvhIQB081nVhjxmEtmX3xJErs+56UZS1w7xzl/AZTQl16jWEXu4PvjdEw0GgylFQq96W4n8I4c4iIpZHoaE02Okt8WrKz1p5IQkzYlyqjun8GSj6SpTOyZLMAfiXnzyp6WfnlO06cbeWh0hYXwfq4rcABNGEqIpuMNvjeNTPGiB4feFHvVnkWNwdxwSFZPvBgkGelnd5tZh/PC0UUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=Wk5sDBp2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org) smtp.mailfrom=paul-moore.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=Wk5sDBp2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yj8hF39cRz2yXY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 02:43:24 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e5447fae695so10101578276.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 07:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1738079001; x=1738683801; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CM+Y34LzyqTPbJa964bMKTZoegb6ZCbeVLJYvxkr2Y=;
        b=Wk5sDBp2p7dLPokFCkjXD9AgdRFJNOmQFwX362AyAtTdMxbCpLYquE683Yi+51pDT8
         itqrVm5YNafZym0jOceGKO6MUgtUqV0BRSJdtt/Gdl0kJdTsnVJgMK5SrAieFNjPh3WL
         Y1vBkpdDMxeomNxWA+kD1M5bh5l8EeVPI7J21OCG9f0ZpSfQ5FD3U2dXXYn3hOxvwvCD
         1ramK9zzbKy6T+lHHsJXMFxLOmyHRAoEUzUrS6HG5+SMnzl7GhhQtEfCwdtJ6ir8M1xo
         2l1/XWRfAgkITAAzjyBPu7PLa8B0iGMBQaZXKF2QPuSW1VW++G+mzD3OW6M9KYMHPTxF
         s5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738079001; x=1738683801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CM+Y34LzyqTPbJa964bMKTZoegb6ZCbeVLJYvxkr2Y=;
        b=jlmn1b7SROFiv8CzUI9kwfGKTToldVUmpAFWmduf1rdWWM/GM+8udI1Gig3IqJJO9i
         t79XYhkyRMvN/JKvta4FcTnTsDkkOdhewy2YH/S6dnGcSzl0vsrricQtgUp1YFsqHUlO
         oKH9P+0dPwFPo570u8kLc407gtDp+yxZ+nN2zWH1keDUUtBTjOH101bcxwOa9VXqy7dr
         OSNfUU6EDEDd67Js6A96TP81mHdS+2Jnl370+K27o1pCkSLNJnwoG6FpZOJW+W/IdI85
         nIE9W/D2GqRfitD1FA620zooCgc3kXIKGwaLL3rVuiVn6KxSDHkPQLykEH41GUDmBjbA
         x49g==
X-Forwarded-Encrypted: i=1; AJvYcCVv1mMoLR9VzEq9JJ21TNFQCN/kihtTOecrU23Q+cYe+nnlcoi+T0LPxJ9DWjiTDhsMbu1zl6CCYAxb4jA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxhOZcMRXNQMcgts9CNSxWom76THRwdposrjgNo3MUrymryZpzy
	Yqpo6x8bGqW//plrSi5ss+K9MQT7oPPRoM2fg/FTc5Zr1rDzgkA4jhtavGTRPi6vNmKiqASNF9e
	XxDX+FJ4xFYkzrHBVSso68/3CHgM8C78Qb1tt
X-Gm-Gg: ASbGnctVqLmPh8NthqwS6H17+hJrN65OT10ZigHhztw4CNqQN+pOD8yT8nKYMP7Dc1E
	AXiXmyxX4K5eDmWtmpDeGJBfQ1tm0OrNj2cj3McAd8OuHDISygB87N7gbbdimUy+P+619ULI=
X-Google-Smtp-Source: AGHT+IGuLqrmdoXiE8apV7tzhOJZ5Xm1OF/NxWm8Kjkh7RMoG05FR1MdO9WMx2ebniwyt0o5rEC0Jv+xP432BtVJDY0=
X-Received: by 2002:a05:690c:4d02:b0:6ef:6646:b50a with SMTP id
 00721157ae682-6f6eb6b2881mr361409457b3.20.1738079001445; Tue, 28 Jan 2025
 07:43:21 -0800 (PST)
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
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
 <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
 <f4lfo2fb7ajogucsvisfd5sg2avykavmkizr6ycsllcrco4mo3@qt2zx4zp57zh>
 <87jzag9ugx.fsf@intel.com> <Z5epb86xkHQ3BLhp@casper.infradead.org> <u2fwibsnbfvulxj6adigla6geiafh2vuve4hcyo4vmeytwjl7p@oz6xonrq5225>
In-Reply-To: <u2fwibsnbfvulxj6adigla6geiafh2vuve4hcyo4vmeytwjl7p@oz6xonrq5225>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Jan 2025 10:43:10 -0500
X-Gm-Features: AWEUYZkHRaUuCTQsu1U9C5jhigmIE9c2_8OmkE_i2Qv7ILXtAaTfDLC5EcLBZNk
Message-ID: <CAHC9VhQnB_bsQaezBfAcA0bE7Zoc99QXrvO1qjpHA-J8+_doYg@mail.gmail.com>
Subject: Re: Re: Re: Re: [PATCH v2] treewide: const qualify ctl_tables where applicable
To: Joel Granados <joel.granados@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Jani Nikula <jani.nikula@intel.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev, 
	codalist@coda.cs.cmu.edu, linux-mm@kvack.org, linux-nfs@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev, 
	linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org, 
	kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org, 
	Song Liu <song@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 28, 2025 at 6:22=E2=80=AFAM Joel Granados <joel.granados@kernel=
.org> wrote:
> On Mon, Jan 27, 2025 at 03:42:39PM +0000, Matthew Wilcox wrote:
> > On Mon, Jan 27, 2025 at 04:55:58PM +0200, Jani Nikula wrote:
> > > You could have static const within functions too. You get the rodata
> > > protection and function local scope, best of both worlds?
> >
> > timer_active is on the stack, so it can't be static const.
> >
> > Does this really need to be cc'd to such a wide distribution list?
> That is a very good question. I removed 160 people from the original
> e-mail and left the ones that where previously involved with this patch
> and left all the lists for good measure. But it seems I can reduce it
> even more.
>
> How about this: For these treewide efforts I just leave the people that
> are/were involved in the series and add two lists: linux-kernel and
> linux-hardening.
>
> Unless someone screams, I'll try this out on my next treewide.

I'm not screaming about it :) but anything that touches the LSM,
SELinux, or audit code (or matches the regex in MAINTAINERS) I would
prefer to see on the associated mailing list.

--=20
paul-moore.com

