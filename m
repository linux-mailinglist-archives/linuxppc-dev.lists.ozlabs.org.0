Return-Path: <linuxppc-dev+bounces-4425-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 669229FAAD4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 07:55:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGpg60Bnnz2yHT;
	Mon, 23 Dec 2024 17:54:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734936897;
	cv=none; b=jJDvUoF86zsiprsNsW9XWwQkJMRDnfMkbNSUqb4FIpLtqhmrF7A2scKyUlz9h84tVvY+9T4Z8tOzaWWxOTqUwbgsp2+P2YHa9utaW13iNBi5ySz5Y2m+Wevf2Vn3RrRvMC+KFIOGvz+757J+gJE6Xj6lJb/bGcABWtfdEVH21oNzPJnXh5Q0XaN5DIEza3z4sJlLf0Psafp0rq4DlioU8jly1XO8QUP7h+WjLUiEcQ1EglVOzyy8dMWsaAJPE040rmKkdlqpQ7ydOQkeENHEQgV6YauGcWdf98fnx88m6GiaPNLzCnfW+SpIMuw7lMWsFzoqhlVVjxCMdg9VWfN/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734936897; c=relaxed/relaxed;
	bh=yv/32rgFjjNuZgsAnk/iLhxS2YZw5D1QKxhI1Z9YU6o=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=ioy7x8s8hCQp61LhD8ubwz8bUQJBuTMrVXmNDZmYMWLCrb9V0ZkfDSyyCXRE1CKt7yaIbd73nBnTohl+NS8xpCUe+6qAzOHEI5v6KM/looF0oQ86cQ9uOHwUPR+PnC8FYYG3Uh0UK9Rx15mfWRKFQuRzNWvFyJd/fTH8HcRYMcqXWIielOCeS7746YGzIquwdEPVYbWwSsobQ1q9nWyI/XQIe8npLDdcgQ1Ajg07wo9xMX8HRP0OfMePkFJFbnyM01Zf34JvNNYrvqQWbFSTWHUW3Psii2UQHs5v7h7qkdN8Pi/CIYVRq3HBf3mGHHvFfutM9Foyq18ErI1OYujKWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j9aJ+1W8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j9aJ+1W8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGpg453b6z2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 17:54:56 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-216395e151bso24757515ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 22:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734936894; x=1735541694; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yv/32rgFjjNuZgsAnk/iLhxS2YZw5D1QKxhI1Z9YU6o=;
        b=j9aJ+1W8Pe/jjGHB+vIHLvrk7mVnDbOmwslfcQ0P94WVcfoTz5IPS8f7tR+mOu1Su+
         vW14EmyIyrAMap0RTK4MBI2JZP5Dl+gN3QAAYKP5/R+EcnRGHpkISo+DpGHPOrn1IiB6
         WZqFbLDBfgBjmH/OGKRdSephPWGvGsd4kxNtAf7uIDee3BHufEX+UTJU30ssPjrJxGsY
         ulmcMbaGXTH/+w5BnH2Z3iMeox8V60T1z4kplk8q5h6nkp935AQ647hfEdhQ16Gz123N
         xqopEjAM8DtxglFlGAT0RTtcRiO1fh7jZEVW5J2foe7M9PJ0qBzlYX/uTtOxQVx7b8Cx
         8z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734936894; x=1735541694;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yv/32rgFjjNuZgsAnk/iLhxS2YZw5D1QKxhI1Z9YU6o=;
        b=u0juFhWdreFXOehIoBL/xGo/+ETRRUa47abszzSZBhbJoEVshxznvhbKfZ0Op9abXn
         +ZyMt3nzkjpEj5yP+Xjc1ELKuvFuOJTl95YWcCD7xgwYZ/N3Vhbz1BhylkevftxcmuCz
         x6N/QS+3MqJkDuLvTt5EF1XblaQtH12Vexdsu35V47o9Syim8Vg+/AprdqmEwdzXMqH3
         eGrjeF7FbGk/TyxbPxW68gi5mJoA7jMKDik4Ry2ZJhg/auT0pnZbE7mjQqWbTIQHyd7g
         XnqARRAv63htVp5XV36iaL3WeUqjyHFyMz0XUVUYETdWgV9g5Tqrr7tc2xSNtfd22uYk
         EHsw==
X-Gm-Message-State: AOJu0YxukXKRCKMnQ4qnYB1oG9macG1Vc/tL+d+dkXr5C0Nni0e/25IV
	j45BNZ/fsOxjHpLZclnU4HfrFsnzpfix9i+vMro3No3EdPWw+AzG
X-Gm-Gg: ASbGncu9rAkScyX36z/h36A6yFfTb72gFZvF6HwKUgF5Tjp0oBb+zpYrnk9+tytOCGY
	eZuDIuXAZn8g6QxUMFxbYO0GaGI3SQ9c88F//YEQn0fPVgUJSfBHLZL0QID/Gl0b1CXYXeuKb0D
	PQeQdHjKE9yFNGSAk4OrvlCX7S/xI6sm2F3fSZC5u3lXPcVHXXJDH8TmK1R4JSoGLD/mEtFJ4tz
	95gQk7CxPWx2ahBN9/6kCjtndskyeOUgT6NgBjxIwVR2A8=
X-Google-Smtp-Source: AGHT+IGM7DAMlFDZJVhK/Tgz+xvwbPCNvk2YOKTXtC+n+cDA7T9aGgIQjw40Qp7VtDl1xbBWagyXGw==
X-Received: by 2002:a17:902:e808:b0:216:4fad:35d0 with SMTP id d9443c01a7336-219da5cc2c5mr246263585ad.9.1734936893638;
        Sun, 22 Dec 2024 22:54:53 -0800 (PST)
Received: from dw-tp ([129.41.58.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962cf4sm66371595ad.25.2024.12.22.22.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 22:54:52 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Hari Bathini
 <hbathini@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Thorsten
 Blum <thorsten.blum@linux.dev>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>, Baoquan He <bhe@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] powerpc: Use str_on_off() helper in check_cache_coherency()
In-Reply-To: <20241220191705.1446-2-thorsten.blum@linux.dev>
Date: Mon, 23 Dec 2024 12:24:06 +0530
Message-ID: <87o712lwj5.fsf@gmail.com>
References: <20241220191705.1446-2-thorsten.blum@linux.dev>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Thorsten Blum <thorsten.blum@linux.dev> writes:

> Remove hard-coded strings by using the str_on_off() helper function.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/powerpc/kernel/setup-common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 6fa179448c33..f7d7a93f07fc 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -834,8 +834,8 @@ static int __init check_cache_coherency(void)
>  	if (devtree_coherency != KERNEL_COHERENCY) {
>  		printk(KERN_ERR
>  			"kernel coherency:%s != device tree_coherency:%s\n",
> -			KERNEL_COHERENCY ? "on" : "off",
> -			devtree_coherency ? "on" : "off");
> +			str_on_off(KERNEL_COHERENCY),
> +			str_on_off(devtree_coherency));
>  		BUG();
>  	}


Looks good to me. Please feel free to add - 
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-ritesh

