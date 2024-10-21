Return-Path: <linuxppc-dev+bounces-2463-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A3A9A6C72
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 16:44:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXJ3f1Dh7z2y8n;
	Tue, 22 Oct 2024 01:44:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729521854;
	cv=none; b=FTIf1IWg0ln6hcFoc3Sli5mjjUzE9JITmXBDHrX4uukzSRjRku+aCkk8J3kEeTL8gVhgD83hlAaTR6juqTGjLRkObuSAm7Seg9wzyTwNIa8+oWrvf04QWWm3N8gXljfU46CgVH3RnkgGRdbZCcfg3N5gmbJQJtxdb0n4aZ/eTL9fUcpes8a6D0bSiCFpIOXeRXDzVb60LQQk/ItmVOLPrcS/E9ffwmjnScv95/VTe374yMF+EXQapvPI6ITVTso1MB9najnT+/rPwm6warNa6cFcxlJI0DGqW4KjYZFOotevc6F3hLKoNy4/VSeKzUOaTtHd78HeQxp2r3Eoz3ZzFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729521854; c=relaxed/relaxed;
	bh=reV47rYAjrNyFoF36Jo4UW9f7ZYQ6WAZwmYx78Gwlrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oZ+ac3D3h5CwM7T5YvYk+zxeM319I3stUXd3lmE/RCyDy+9JnStgMWZTeZtJAwT2G1F1xNvPQ5nFMhxVaVFBq+3wOIyuUPWeIc8p9EHwZEV9kRXfuMF/reLDGAgpcX0O6Ve11jf4zciPHLfkpVFGC2/pvG4bDnrp67RjpwkIQ1MkDUEFF20QCN/9x8/4DpGGp9PyUqPaghsTcmqx8PFeTJ8sq/HSEfB5g0lNJovML9vc26GWmXuoHJELnznW7jec66jEpoCaRB54SkDB4GMliq+GmUpVLE5a78Dy8KDjMO+V/AlwfuxzN12C6oql9+vc8DGli1Ps49pMMBlgwDlDxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fwl1Q331; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=ryotkkr98@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fwl1Q331;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=ryotkkr98@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXJ3c3ST9z2xqc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 01:44:11 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7ea8c4ce232so3875837a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 07:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729521849; x=1730126649; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reV47rYAjrNyFoF36Jo4UW9f7ZYQ6WAZwmYx78Gwlrw=;
        b=fwl1Q3317mgBD6ItEsTMGd3dnqYrJKsZXrWUSYfWyEQUHNo8vpQ7zor5Y3sSs6B5mr
         cKcwr45WaLAgTPnvPckGM6p6F47pQdZLEbR7birkAJIUo1qJgWBnsSRlmIUKXxSXDXOA
         wyBun+WlXi5qxlTQpiketSNFO2a/6L/eiTjOyXf9fC2jDLWnKugVVqNLZuBB30RHG8eS
         WcGZDWU+G50BZajG6WM8Kooa9nwp3U+v9TvBnFzG+tvibTfdXDDULXM0YkhP5d5eXzcN
         u0dJt3gSBH3s533PXWQp9KBJPemPYhFUYkS9yADJ7bODaHYieS7MIByzz5p29yNPxdTh
         dBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729521849; x=1730126649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=reV47rYAjrNyFoF36Jo4UW9f7ZYQ6WAZwmYx78Gwlrw=;
        b=plhXLgsrFEU2s7dB95QAv/GzoCf6gxJIyQcRDqGZRvbYvJrR3iLfPuvurCB9Ay1CxR
         yEU4mGuQ9ub0/KSbiILgDwxh/Kwls9dT+C+k+k8hNVrqeax9z/AQD8XeI/Z3vyR/AlzV
         nGoPzkYZPzn8kiilW7kH5EC9BB6WYJPSo3kWTZqV1x1fuoQp61U/I6iQMZumTwx1BSCW
         CTLvHjCYesaKamyp9WEZe6jogLsPcoVYaofbuVGesZgc61ZqKUxlfnRJhgUNkQ3iV2KM
         jLVTqs0jSy5go94Gc7miIw6Regpdvy1+GQGCeqXuRNtKdA8ggJ0GgP/Ze9hKWT6IpeV4
         m1nw==
X-Forwarded-Encrypted: i=1; AJvYcCWa24gIerhIuArKOzwR06a6XFCXdkcZMtj5DF5+UHYpnGAhyg724pU1W0mFiKYDP5/1qZ3iF4oUnavcOHU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxMQdwmP7QnyAypHjOwor//ZwOUoj+hWTVt764oTZdesoSVOhL2
	z4WFU1ITQLXQfKspqYVVz8fOfSDgs+rDJWW9nV6ICOxpXZCHXXuI
X-Google-Smtp-Source: AGHT+IFoaZNDK2MzY/VD04GfIRSMBfYKAt6NZct3Izdn2L8iegNDZRJUFr80fLeQu6aKBOvr613lRw==
X-Received: by 2002:a05:6a21:6e41:b0:1d9:2954:5817 with SMTP id adf61e73a8af0-1d92c50fef3mr18520413637.23.1729521848597;
        Mon, 21 Oct 2024 07:44:08 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:a0e1:7d00:529e:8ad4:796c:105b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab583d9sm3162960a12.49.2024.10.21.07.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 07:44:08 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: john.ogness@linutronix.de
Cc: christophe.leroy@csgroup.eu,
	hbathini@linux.ibm.com,
	leobras.c@gmail.com,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	naveen@kernel.org,
	npiggin@gmail.com,
	pmladek@suse.com,
	ryotkkr98@gmail.com,
	sourabhjain@linux.ibm.com
Subject: Re: [PATCH] powerpc/crash: Allow direct printing on kexec
Date: Mon, 21 Oct 2024 14:44:03 +0000
Message-ID: <20241021144403.8429-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <847ca1fxod.fsf@jogness.linutronix.de>
References: <847ca1fxod.fsf@jogness.linutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024-10-21, John Ogness <john.ogness@linutronix.de> wrote:
>On 2024-10-21, Ryo Takakura <ryotkkr98@gmail.com> wrote:
>>> Rather than removing the deferring, it would be better to convert the
>>> console you are using to the new NBCON API. Then it would be able to
>>> print direct and safe during panic. (printk_deferred does not affect
>>> NBCON consoles.) What console driver are you using that you want to
>>> see the messages on?
>>
>> I was working on qemu ppc64 this time but I am usually working on 
>> Raspberry Pi 4 (mostly for fun and study) which uses either of 
>> bcm2835-aux-uart or amba-pl011. It would be really nice to see them 
>> working as nbcon!
>> I am thinking of taking a look at [0] but If there were any other 
>> references, I would really like to look into as well.
>>
>> [0] https://lore.kernel.org/lkml/87wn3zsz5x.fsf@jogness.linutronix.de/
>
>The lastest version of the series is here [1]. The series is still
>undergoing revisions, however the changes are 8250-specific. The API for
>nbcon consoles is already available since 6.12-rc1. You are certainly
>welcome to try to convert one of those Raspi 4 drivers to the nbcon
>interface. I would be happy to review it.

Thanks for sharing!
I will take a look at it and definitley give a try!

>John Ogness

Sincerely,
Ryo Takakura

