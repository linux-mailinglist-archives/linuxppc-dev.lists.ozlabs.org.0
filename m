Return-Path: <linuxppc-dev+bounces-1693-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 886AF98A570
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2024 15:39:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHMc2348pz2yNR;
	Mon, 30 Sep 2024 23:38:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1032"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727702836;
	cv=none; b=XXRHq8yluVWWWP966Gly2W0bkqMC7VQYVtMjrDz65epBESLFLkUwl/Iq4aQiK+lDy+MqlbkTkP+piDb5NOab4+TWMA8vcQt24U39N5sNDOSfj5/k70w2sBy7ysoCDNKKLsffdzrUqCCC6o7coJDcKVlGzLtLgTsX2s5tLkW8b5IWpANI6ddTxq55w7nXbPJYTkwo+65rR/g4c/3QePZKfDmmb0B58KZe+UdWWCnS7VQj8V7MK/uOhyMD04CRfVJxIIPy6IX2RX4wwJorxqwkuSIHUdOr/4Xj67/0yPqmD/I1QnAD8s7MAPUnF3AijPhBeoW7vP+lPLDfDdvsnsZAFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727702836; c=relaxed/relaxed;
	bh=TIo2EVmaU3JV8w7AaTi/2KQOMC+Cl9QGe3PeB8CxDUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OUhgpV510g02iCQPUFI6JlSvi/fZ1BVbFbAU3VKhApHiYNxjKmnV4VqJRKK0DlD53jZXaTSwijp0PcYk25HxqI3I6mbkPp1F+fYYJou36INYBSebgP0x9ljiOu0xFYAP6AlCPWYBJo8rFWghzUcptn9AeTJ92ClVBQe4gxzC7+ot4xyhn4IsTsOIw+ukdFC9AzuxcJ+p29nYVh5oyWHNbxRSE4nmLqFFZ2tCCsbNKnozRJnKVX6eXfrfqZaZkGTVqJevcJmCnDhRvgU8OnFVUivh8+w/B78kQEQ56BcaI2HyFn93vodQGlYcDIRShBYnLYymi5dUIGlkhB6nEw47aQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XY3y4apq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=alexdeucher@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XY3y4apq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=alexdeucher@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHMLW5jcqz2yNP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 23:27:13 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2e0b02ed295so568385a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 06:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727702831; x=1728307631; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIo2EVmaU3JV8w7AaTi/2KQOMC+Cl9QGe3PeB8CxDUM=;
        b=XY3y4apqQdKknWy/u665OH6Z9PKyZJy+/Hq+cJBsr6pCWXKXYND1eRjxnV8CvmA8mM
         RIGKIhdoH1XmUuZMx2f3kxZatx1qRAvpnT6iUcCnrXpyzUWTmjjJIqVBp7IqpOQm2U6Q
         VOWohlJ1uMu/NRe2LsrHFW8iUT7muPFudQhcUsfCq3weKT3yem/Mf0hBtZ7fAnre7F42
         4TB6l7b5g8QuV9W3bY/Xz/UDwQt6I1y7EDQKup6bi9sr8iYyAEJ2KNS0v9LHGjM27hEm
         Xdq3qBQ1NE+DGmNTyvz4CJ9gXIJr3+hs+uokwJ3p7iQHWqcBq1WKk4oFLPLkyPuAFTGl
         ZF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727702831; x=1728307631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIo2EVmaU3JV8w7AaTi/2KQOMC+Cl9QGe3PeB8CxDUM=;
        b=XrgLhM3soDnNRC7sG1iom4IvX9fJEqpoz2afcWNLjf1JTixlTmQ4G7c+kR37lZfLTu
         j1C3BT9NbJibACA4m9rIjtAuHVcavvjGjsBiTZrJdOQ146WGHtVrT+G3B+HJGKBH8Bxp
         G5jZPHFpI8A+REwfQ7WylYyJB4eVihKbihTkjaN23bt25/ML8ZRw6K0FpCSk5g3ANV7Y
         OugMG1ja+goJNdVJCYeGolyHF5i90FYIf0kyIUZDUlk6hGxQwgDzrNMbYxcw4uqSA0uR
         d6D0N3AwKCKRCzELaQgtSZRO30rkC3qwQ6b4OxnJLU2KSMzAywWEXfLHpRGHuYP/gpAm
         xFCA==
X-Forwarded-Encrypted: i=1; AJvYcCXHgcKoYiudzq9oXbQe+yGOMJTN6Z+c25lUJ4dIGQqcLmiJg26BRRqk49cq+tFdrj9hWMiUtaSygkCZJ+8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzY0y9ScangsPmeklKXJN9jP5MhTQP8PODpNsE1bYEWZOpcS1bZ
	wNbPDqANeELjAKuEf7xPtka8Zx8SfYYUGStS3IzjQPQNWZhmBWJYx1IUcydu3wxwobZHJJdD/7J
	4RqDPtP+71FTu+97B1yi9inbUXPw=
X-Google-Smtp-Source: AGHT+IETAvZExG+ZPhYX1kIVzzMlQnafA3k2Y/saw7HytqtbGnbbr73zHZVCDZ5DCA3CFTqgB0AkONsC72G4WnUZmrg=
X-Received: by 2002:a17:90b:1d0d:b0:2e0:8305:5c53 with SMTP id
 98e67ed59e1d1-2e0e70dc9f9mr4338072a91.7.1727702831302; Mon, 30 Sep 2024
 06:27:11 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <14b64e90-2e3b-4bee-a8c9-2f8d6eed5d68@csgroup.eu> <37D93804-DC55-4B2D-A82F-85BD45D9E131@xenosoft.de>
In-Reply-To: <37D93804-DC55-4B2D-A82F-85BD45D9E131@xenosoft.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Sep 2024 09:26:59 -0400
Message-ID: <CADnq5_PB8zUfCN-NcNpgHqzAv8A55o2hsYHAdnSBhEy525NLfA@mail.gmail.com>
Subject: Re: FSL P5040 board doesn't boot after DRM updates (drm-next-2024-09-19)
To: Christian Zigotzky <chzigotzky@xenosoft.de>, Wu Hoi Pok <wuhoipok@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Alex Deucher <alexander.deucher@amd.com>, 
	developers DRI <dri-devel@lists.freedesktop.org>, mad skateman <madskateman@gmail.com>, 
	"R.T.Dickinson" <rtd2@xtra.co.nz>, Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

+ Wu Hoi Pok

This is likely related to the drm device rework.

Alex

On Sun, Sep 29, 2024 at 11:33=E2=80=AFAM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> Hello,
>
> I tested the latest Git kernel with my VAPOR-X Radeon HD5870 1GB GDDR5 PC=
I-E DUAL DVI-I/HDMI/DP on my PASEMI Nemo board today.
> Unfortunately it has the same issue like my FSL P5040 board.
>
> I think it depends on which graphics card is used.
>
> It could be, that FSL P5020 boards are also affected.
>
> dmesg (via null modem RS-232 serial cable): https://www.xenosoft.de/PuTTY=
_P5040_U-Boot.log
>
> Please check the drm-next-2024-09-19 updates: https://git.kernel.org/pub/=
scm/linux/kernel/git/torvalds/linux.git/commit/?id=3Dde848da12f752170c2ebe1=
14804a985314fd5a6a
>
> Thanks,
> Christian

