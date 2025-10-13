Return-Path: <linuxppc-dev+bounces-12803-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4E7BD5368
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 18:49:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cljxt67v8z30V1;
	Tue, 14 Oct 2025 03:49:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760374194;
	cv=none; b=NWKGZWVpHisrQVMuUGwEcIJF7tzRDpnyRwEcnphk/C0YYGTuZ7ovlR17ftIevsPmmiu8BR8bNJWiMN7YwsxOwuY+tUGSiIA2RzShB3zE4ypMAmR6CSRMycSMB5U+9FM+spFCzyJid+pbZBFYBvbb/G5R2Cwv4+4OE5aN97LH+LivZA0fI8dCTRSrw8iVdjn2bGaBIcRE9u4EwS1AR3de5xcOeE+Dc1mgBIi58/eFrAorHDMAUhn3RTHlUuiJ60rjur/TsqZbAmJJp4HoT9nREtpqS6891o56QZ+3DFVwG8E3c0BxDB6ooZgT1sT1Dakd+PZGzCnAzLqLGGY8m6V/YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760374194; c=relaxed/relaxed;
	bh=kx5RY7oeloUuI7eYO+d6SROp0dR5EAAxdn5zrmZ7DwI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:Date:References; b=gB6Lgktcy31XGFyum2VwIT52JEIWZxsT54XEmVXxJ2TFufb7nCb6MaLKa3wb2EB9yUet77j3/E7wCQEk1bulVRup7EOSmXAAmMN6ghaHBSLuEmIQjb+9hz4oPaQgPe5KHuYu+LuZUfeDSVfweu5KsNdyQGhimpS1qycBi18hcaTvpgk/GjksN9/LFAB752Ks2Kd5N5BSLWbaWWK5A/Fx1aeibhd1+j3ZO4BpmAF5MwjzHvXou3lhXWYCjTYx1nLhWBFnukLNJhCkOp7A9QriQDma6aGSO4IhZMO66mynVmX5Co4uAutvDStoT9r3uiVmSdlsIBycZhitrGc7q/OVzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nOuks921; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nOuks921;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cljxs2j8yz302l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 03:49:52 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3306eb96da1so3479801a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 09:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760374190; x=1760978990; darn=lists.ozlabs.org;
        h=references:date:in-reply-to:subject:cc:to:from:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kx5RY7oeloUuI7eYO+d6SROp0dR5EAAxdn5zrmZ7DwI=;
        b=nOuks921Wc86p0NHIaHuPs9EAhIEhxwA+BPc0r/knNpNeAtMsCQBjCkHPxtkga7otG
         q04nhIfnSOUayCCmrTH1fnzf71SpWSMalqQ30WdPuzfuFxlY+imzcopYmfYGcm1Mn+ne
         8crs1gk8TZY4WMZSOonwOzgAUKJ2dgcz+dTXCGuZBEl6oXbFeP1Vla5/q+KrmqeS1+DC
         3kc9Fv1rhYSYEC4fsFJSpf5sBWNCEDKLBwxLDlO/5eP1ELzNLZ8pHC0l0e0mNanQa2e0
         Kr9247D7rmIBpzFEIDDH3OG+n4sYtmM2i+iuCEdOCLYU+EFoz6+HJE0I0/K1DBTNHs1a
         d2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760374190; x=1760978990;
        h=references:date:in-reply-to:subject:cc:to:from:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kx5RY7oeloUuI7eYO+d6SROp0dR5EAAxdn5zrmZ7DwI=;
        b=LE9x/H7i+Gj/olZkzmzaw6Xp8NV8NZl4K5cNBKGM27mlI95mnlzWo8dF+VDHGlwLC8
         9JZSG844G0mJLsDsSzzWRHMqmInRoBg8HHONF2zg4prAnJcq6T5LdQEAaI7mPypkA7bm
         9LyXmiIrRvvxQcl829f14sqs+QK3dXHGafnFBpnW9s2JgJi12VC8DFX4ow68I1gDKT4Y
         bOWydY2X3zJvHWztgkrFqt99HlCR7SSw05yCe9xn/IjCX4v7xMQjC7YKeFokgVizLJSr
         GO4Ss2OTG7Mlk4UF4R0c/SiOwvy9fQDNorj7SvnPmXv+6a83yYjOgNwGxBYXJmkA7Xg6
         Mx0w==
X-Forwarded-Encrypted: i=1; AJvYcCXXdGpGaz1a09960sR81JZjeQ9I9pJIKqdjBNEzBn4rl6v6H60BVfKQSmWa5hkup0F/pJmdcGC5aSWRi6U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxTdgM2KZsEaxZ5kxAfUKFci/Aw1lerlXf0vrlxfLuv8cibwfk6
	iNr9m7/lvu6HxcBZS20wnamB/gY4G8pfY8MlF3rIDWuSgHt/bv5qRcxY
X-Gm-Gg: ASbGncs2UYyM/brFEq96z1uVfigdhb4kg17yEMLnCRWxe12ZnAKzR6WKTSEmlf/GTBo
	c56kaRkZa/cslB23tbB34AW0/mi0mKXeoTQ7aAKOpaBEVq2QGwPPtwwWDXLE5CF7AA0RjI7zCMK
	4DwdcnskEcUbtNrdE6pGzVRYJrviEhYuXxBgasizMbJns0QbNXucOBnPTFau2QR87SQ1IzJjTq4
	aPBpGdmIvrc7o7KA01pmaHOCdcOrZZB3pFiuMflXh9eVF+9Olkn/yZVkh+/3O9Y+nrugm/q6WQL
	LXkqeygiEAUzWTuhGD4zhzJdtUbwrGNHYaYm+PUHGnfbgcRhHOx6EpDdccGm17odRzSOSAYomQN
	8OkVlIg/nMiRktLgLg0hgnD5EZvX/gmM9
X-Google-Smtp-Source: AGHT+IHevJcBjt8mHUt/pyY93x641rdKkka0MNqxiQeyFCWUh9FBFG0xSjkzcIivii+OZab9HkGH1Q==
X-Received: by 2002:a17:90b:3909:b0:336:bfcf:c50b with SMTP id 98e67ed59e1d1-33b513865a2mr29845894a91.20.1760374189866;
        Mon, 13 Oct 2025 09:49:49 -0700 (PDT)
Received: from dw-tp ([171.76.87.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b7411fcf0sm6811568a91.4.2025.10.13.09.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 09:49:49 -0700 (PDT)
Message-ID: <68ed2dad.170a0220.37a345.0a48@mx.google.com>
X-Google-Original-Message-ID: <87wm4ylpge.fsf@ritesh.list@gmail.com>
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Nam Cao <namcao@linutronix.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nam Cao <namcao@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc, ocxl: Fix extraction of struct xive_irq_data
In-Reply-To: <20251008081359.1382699-1-namcao@linutronix.de>
Date: Mon, 13 Oct 2025 22:16:25 +0530
References: <20251008081359.1382699-1-namcao@linutronix.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

Nam Cao <namcao@linutronix.de> writes:

> Commit cc0cc23babc9 ("powerpc/xive: Untangle xive from child interrupt
> controller drivers") changed xive_irq_data to be stashed to chip_data
> instead of handler_data. However, multiple places are still attempting to
> read xive_irq_data from handler_data and get a NULL pointer deference bug.
>
> Update them to read xive_irq_data from chip_data.
>
> Non-XIVE files which touch xive_irq_data seem quite strange to me,
> especially the ocxl driver. I think there ought to be an alternative
> platform-independent solution, instead of touching XIVE's data directly.
> Therefore, I think this whole thing should be cleaned up. But perhaps I
> just misunderstand something. In any case, this cleanup would not be
> trivial; for now, just get things working again.
>
> Fixes: cc0cc23babc9 ("powerpc/xive: Untangle xive from child interrupt controller drivers")
> Reported-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Closes: https://lore.kernel.org/linuxppc-dev/68e48df8.170a0220.4b4b0.217d@mx.google.com/
> Signed-off-by: Nam Cao <namcao@linutronix.de>


Thanks Nam for the fix. I validated this with KVM on my POWER9 hardware and
this patch fixes the previosly reported problem at my end.

Feel free to add:
Tested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> # KVM

-ritesh

