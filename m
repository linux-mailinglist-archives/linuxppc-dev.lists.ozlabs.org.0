Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE7720782C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 17:59:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sSWK2T2wzDqcR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 01:59:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pmQEDJ+e; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sSQ775jvzDqLZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 01:54:38 +1000 (AEST)
Received: by mail-qv1-xf41.google.com with SMTP id h18so1266666qvl.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 08:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=lmNn6SOg+iGo/AZoFdJRg2LN4pLoxSmdOUox+oISJgI=;
 b=pmQEDJ+evGmXzq1+gJkbVL1QfKvG/jhYeTJnUDByq4d3dSEiR+GIzjvMRHY0QO1TzM
 Fic33wfWhRKKoCkOP6ef+MJH3IVc8GwIh9x9K6kSYXPl6fuHKT/2MGj957huw2sDoY5+
 c10g11WvbRegXG3+mlIJhcxU6k3FEhnRVdYBJbaEv6kINwZJgi0lh71mh1c6dMnm7vGN
 ajF9QmMxJeLwuT44jSfHdyZRQTRC4ug8XQvwJDGN1y5XmUXWHHCYN1KyBgWfr6ZlGZUC
 NZhWDmJ5xkZ4LG5vatUfzkN3l6KYUz4kRyoYv8tpt6JMZSkOUz8PUelWNcysK+Sy6gSq
 aXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=lmNn6SOg+iGo/AZoFdJRg2LN4pLoxSmdOUox+oISJgI=;
 b=POdvduUwkJhIw0R8mPRe/3e8sclQJfkrOx5c+Nl/GDFrzaDAd8euIe7aoo06kjGS+G
 qeQXWRgAiJsJ1m14SWs3r4qNcCJhJDBcAeboo5Lv06Wh/8PiRhwscwKV/GG9Z04W+kK7
 S19gOUO3UgQU0y2m6hEbGOjTmQ4HfrIRAPZ08xJC6+6wGulrjBhaNDDbcrmHyHvuNVUI
 YkYUYq0G9jX6J8B+BgEtsu9TaFbmDzHku7UhDG3M+9Sgi1mMmDa6bKmVq6nnV5CTesBc
 ZTVBeJyTh4zHdeEPrvAj01uDp+HvSurOWFkB7N91BAvPeyc9XOJXXXlTuOeOIUXCtmUb
 8MVg==
X-Gm-Message-State: AOAM532kox5SkO/CleYpKEeXcrJ2qIbuvl3I87tR0vwc1+iP3giKESaR
 kacG2cQhrykik/hsO1Vt1mE=
X-Google-Smtp-Source: ABdhPJxloKYFmRNGH+D28ZTAD7Xjz77cZ2kdySGmmSCoWbHRrbHgLzdbfPq8C1HSE2qYw1m/UqaW2Q==
X-Received: by 2002:a0c:a9db:: with SMTP id c27mr20043813qvb.204.1593014073765; 
 Wed, 24 Jun 2020 08:54:33 -0700 (PDT)
Received: from LeoBras (200-236-242-115.dynamic.desktop.com.br.
 [200.236.242.115])
 by smtp.gmail.com with ESMTPSA id 16sm3427740qkv.48.2020.06.24.08.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 08:54:33 -0700 (PDT)
Message-ID: <3d821b4d2a348519e212f44108662da39a9fbdbb.camel@gmail.com>
Subject: Re: [PATCH v2 0/6] Remove default DMA window before creating DDW
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Alexey
 Kardashevskiy
 <aik@ozlabs.ru>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>
Date: Wed, 24 Jun 2020 12:54:27 -0300
In-Reply-To: <20200624062411.367796-1-leobras.c@gmail.com>
References: <20200624062411.367796-1-leobras.c@gmail.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-06-24 at 03:24 -0300, Leonardo Bras wrote:
> Patch #5:
> Instead of destroying the created DDW if it doesn't map the whole
> partition, make use of it instead of the default DMA window.
> 
> Patch #6:
> Changes the way iommu_bypass_supported_pSeriesLP() check for 
> iommu_bypass: instead of checking the address returned by enable_ddw(),
> it checks a new output value that reflects if the DDW created maps
> the whole partition.

Patches #5 and #6 were sent more as a RFC, but since they depend on the
series, I decided adding them here. 

