Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id B4B1B8D3470
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 12:21:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZdFEj7Og;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq4xK3b7Qz899T
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 20:14:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZdFEj7Og;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=osalvador@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq4wd0yHpz8922
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 20:13:52 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-35b6467754cso1109646f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 03:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716977629; x=1717582429; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DWva4iesfpIM/la1EwXKKVb8Cdii/+9H2sXG1XsGOhg=;
        b=ZdFEj7Og5H6q+Z9eUCTmir/j5mrccJgLnT3cLQoihvh0JC4NA5YXu3y3uAjYAwHScr
         xjodVWMBYpkQkVxbD1UVR3lB4RNmc3DLGuCuqCxTKBbmwfMfdMcib9MWdUH4n0VOpyZM
         Lxvtj46ficcys57JNg0s1yUiTpMk0uUVNtDma8DhZJl7dGQOcz8T+jyqx94psFjYK+nw
         k/BbJ4TSP5/EkwflFF82R2HOhMKU/Zf/3j5p+Fe0cLqj0g12lZOToNXojKSgKNqL/xVZ
         GZzEl8KZ1LQKuZsUVGljOjXndLZdnQWXshCKlxG+sboaa7Y0fH9ZafQcqJT7PS7RJB5K
         Wh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716977629; x=1717582429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWva4iesfpIM/la1EwXKKVb8Cdii/+9H2sXG1XsGOhg=;
        b=u8Y++cvd+GZdSVsNSsyuxIkAMkjcGuQRY9tp7Nwf67ftGc+JUUyCFlNENtEVd7SULZ
         qeuKaR/XVuePxwgVh9Jl/OvE4490K0kQpJWLwnGwVrJfpVbU6MUlQifPIcLcXSH+ZIvL
         XSXzeIr8+9msTrp0zt1CMtedBOjhSTKjCn7oapSmy7leIrJ43IAJwRjn0T7YnzB78i0H
         RuU8sY1NbZl+uR2Wc6dCOu3DI7NE/Lvg1u4DoPfjmy4YlB9Bk+NH0i78wTexITNweHF4
         UTiLYHlxYENhTP64/AsmV0I36PO0MeT/7EBsj5Z62Z3rpxyRhg4MhrJzTr39gyHF5aHz
         1QcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXisLvI7wSCXsSRkhAwcHfRcFQ02qkVlPl9S2oEHMQJfMs7X1uuprb/lHavlbrYz3sztpeysftR5iWGNwU2mr4wPZOvvN+qMB48tIE/FA==
X-Gm-Message-State: AOJu0YySYXms5xEtWaAGw9x3cWbYfWfN8TG83CZ+Z8ZFdK78jbcgqrmF
	n0bBqwYZlMVaDd2xkKQHCB0k5VdN8kQqWoxiwZx3PCHDZ9oKthHsvTsTVTw+40I=
X-Google-Smtp-Source: AGHT+IHt9Ba6L+0f+m26haQIjzUpLMjXASE+7cuXYPhAXHN7krwAJUlx5hJ8S9Vd/bRx1rHfXxW0sg==
X-Received: by 2002:adf:b350:0:b0:354:f82c:78b0 with SMTP id ffacd0b85a97d-3552fdf968fmr11329720f8f.70.1716977629174;
        Wed, 29 May 2024 03:13:49 -0700 (PDT)
Received: from localhost.localdomain (62.83.84.125.dyn.user.ono.com. [62.83.84.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3574c7017d1sm11775623f8f.76.2024.05.29.03.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 03:13:48 -0700 (PDT)
From: Oscar Salvador <osalvador@suse.com>
X-Google-Original-From: Oscar Salvador <osalvador@suse.de>
Date: Wed, 29 May 2024 12:13:47 +0200
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v4 16/16] mm: Remove CONFIG_ARCH_HAS_HUGEPD
Message-ID: <Zlb_243CPcPiN7Q-@localhost.localdomain>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
 <98d6ff5bc9395785e268b9f8eff08fb742c045c6.1716815901.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98d6ff5bc9395785e268b9f8eff08fb742c045c6.1716815901.git.christophe.leroy@csgroup.eu>
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

On Mon, May 27, 2024 at 03:30:14PM +0200, Christophe Leroy wrote:
> powerpc was the only user of CONFIG_ARCH_HAS_HUGEPD and doesn't
> use it anymore, so remove all related code.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs
