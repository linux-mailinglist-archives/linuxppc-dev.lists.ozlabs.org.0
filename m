Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id C105E8D3472
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 12:22:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eSfkHhXS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq4w81Yshz890B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 20:13:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eSfkHhXS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=osalvador@suse.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq4vP0Ks3z87y4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 20:12:48 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-52b03d66861so495693e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 03:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716977565; x=1717582365; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ctNrspieiQoHluKdsHIbyD9cWeGF6Jk4+Rj4NeYPNs=;
        b=eSfkHhXS9s0FGnb5vzRdi1jcFn7moanf2UFdqtl07KBW5LL0pwze0XBKyiv36MSUXr
         dGWhpIUbH3EC5baUxUwzJzhuJiKKYGYnXmyv0fdbMbji9l2QLpXhKRH7aQSgjeNjbJCN
         +gczPWyFTNpT4N7YLQHBybSHgdv+cgxKp4y8xaiL9F6tvstQ7gN3QMo0zwL2S3XuY6X/
         0MxZO9LEG/x9CYnwSvXUbaT8GFvQj3RPD2gmqO4rXhsjkl0LsiOxNer+PsIhSflDeCP1
         5oa2ZX/rE/fPWg4dRo/SuyvywjfIf0cM7aXlc3lDezi9RTdDrvy3Vh0NbRI26reRNY4x
         ij9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716977565; x=1717582365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ctNrspieiQoHluKdsHIbyD9cWeGF6Jk4+Rj4NeYPNs=;
        b=F2RWc/LzNKBnnKXSjg3EJH0yjs0MwLP5svtXZuBi039SbT/V4ahrXu8ZO2gnceKqNk
         ELy/JWyz3UxRWZY1AHuoQLAv9FLsYxDz7ZLjYR9gqD32Kfag3vc6YfvTBSZwrDz6KdTt
         cN0N6V+jLO8ZE3SZyfcPGtd/ng+pnNLdbgJwClcvofYx4XOboUqqq6zPrCPGZIDVt0Zv
         qX5SMjq7UKf3nepi8NaRtiAqp3Y3OaY5KSTBov3CIpTxDXMwqqBJc9gr73qoe//lnaYk
         ZOjLvZWS2c3oZtPEyJOCfgTmVqlesVLal0VwgKSEzLkyG1ZjkFdSjzdktqJ2FXW65WZp
         jStw==
X-Forwarded-Encrypted: i=1; AJvYcCWSlsrBoZfYFyve0W5cMAHy4HbT8tQzl+AIW1iYnd/zDzJ7s/ay+daPp6JKzFs/c1U2ab5JbzVJzlJaLsDFBlO6rdQQMOPUiV2u9abqkw==
X-Gm-Message-State: AOJu0YwUsIsHMFubAsOWSnKVXL0VREwOl96tF6iBGzlV0fl1sDg0cPwD
	H47Zv3fl3EIGLwAKRDjDxuqyUgIrCPQD6dSY6xgGsw3++ElGTVMJQfU1VjcVcs4=
X-Google-Smtp-Source: AGHT+IGMk0vn/X5VQrBubZddEMNfpVeJx8QNyGLLnT5DYmMOhKzLD2kj/BeGWaaQiorP21ksgpDtOg==
X-Received: by 2002:ac2:5559:0:b0:524:6cb:586b with SMTP id 2adb3069b0e04-52a13a9392emr905202e87.23.1716977563098;
        Wed, 29 May 2024 03:12:43 -0700 (PDT)
Received: from localhost.localdomain (62.83.84.125.dyn.user.ono.com. [62.83.84.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421089b0410sm173580755e9.29.2024.05.29.03.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 03:12:42 -0700 (PDT)
From: Oscar Salvador <osalvador@suse.com>
X-Google-Original-From: Oscar Salvador <osalvador@suse.de>
Date: Wed, 29 May 2024 12:12:40 +0200
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v4 15/16] powerpc/mm: Remove hugepd leftovers
Message-ID: <Zlb_mJ4GsJ76dV39@localhost.localdomain>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
 <90a9c00eeb25305aa555fa5ac4f934dc2ba5ba14.1716815901.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90a9c00eeb25305aa555fa5ac4f934dc2ba5ba14.1716815901.git.christophe.leroy@csgroup.eu>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 27, 2024 at 03:30:13PM +0200, Christophe Leroy wrote:
> All targets have now opted out of CONFIG_ARCH_HAS_HUGEPD so
> remove left over code.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
