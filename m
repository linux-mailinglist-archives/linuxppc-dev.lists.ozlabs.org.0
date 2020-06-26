Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC8020B789
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 19:48:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tkrc4GkRzDqmh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 03:48:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mASX7545; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tkpx4RxNzDqKH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 03:47:04 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id f18so9569385qkh.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 10:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=fkFi+jmw2zi2Bpb13lGdSVxVK1RDggY+07lZfXdmWkw=;
 b=mASX7545832fQHYswKaLcmSKvWG5sESxf8V/lKsnex7qxLNKrW8ChdM8EzbqHrMlzJ
 CZVhYF5Xm5uH7Ltj6RnzV+tAdkYpjTZ0wjvgtQ9aiSeP5EtObCl4mP0+UojhavKQFHPD
 0qDzZXnQ7iFoeUQJV+aPX9aEnx+jRrHjJbeh8MxIf0XqkdQJgTKab9jA0cQ1p2uPc3Eo
 Z/XxvYy3pmPmreCjt0eucNJQJ+MwtnSPKSZQg53Ella+BGjUXW4TMXQPvL85q+OQbzDR
 s+jFiL5cmZzL41LWRGuDtVX0B1q7DdTqoUeBRtcinH3WPAcL4OTX4u66uZP14vcUc5nd
 5G5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=fkFi+jmw2zi2Bpb13lGdSVxVK1RDggY+07lZfXdmWkw=;
 b=Y8nrR/n5K1VSV2hS2E8YLepaLQTpK2NVd3u4TPw4Y4WwSqWTWDtEH+ryDR9N4PWPjv
 MvCkPJDIYFfq1aa5PuEuWUbsdYFJLU3ktlIqMdqH5lnxqIgLnMj5ZKStoViRp9x+jjMU
 ziafWE4eYA+p4kaNs5g86fpYzLGhEkqrbfYSlwzdQr14kLyx5ls3tE/anSHYtBxfK0rW
 WAO+M63O5G7jYDom20bEe/NYL95A6ohPQO8HmCW07YwQh3lZmILKmxs46CE7gjYCHApY
 wezpoZG1r0aZRd08IzzwzfGCUd5tQ448OfIzh8ZYx6tYGTxrSM98VTrChDfCgT8mwByD
 6GkA==
X-Gm-Message-State: AOAM531wWG8KrRf1fKF7QEPvT85uYL99cGOGy7xTaeR6ZhVOfM707IjS
 /ViTsZvbZMs9NWk/RWXhVJU=
X-Google-Smtp-Source: ABdhPJzcWnNjR5+QzFD4mqwuojguwT3Xh2XT9wLDkREZn6Pv2pYj8gK8Nj52Eq9rql3WnO3X5yPBpw==
X-Received: by 2002:a37:3d4:: with SMTP id 203mr3705422qkd.420.1593193619293; 
 Fri, 26 Jun 2020 10:46:59 -0700 (PDT)
Received: from LeoBras (200-236-242-115.dynamic.desktop.com.br.
 [200.236.242.115])
 by smtp.gmail.com with ESMTPSA id h185sm8257482qkf.85.2020.06.26.10.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 10:46:58 -0700 (PDT)
Message-ID: <1069466fa3a373e92d9db18957674b1d9c6e9cf2.camel@gmail.com>
Subject: Re: [PATCH v2 6/6] powerpc/pseries/iommu: Avoid errors when DDW
 starts at 0x00
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Alexey
 Kardashevskiy
 <aik@ozlabs.ru>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>
Date: Fri, 26 Jun 2020 14:46:46 -0300
In-Reply-To: <20200624062411.367796-7-leobras.c@gmail.com>
References: <20200624062411.367796-1-leobras.c@gmail.com>
 <20200624062411.367796-7-leobras.c@gmail.com>
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
> As of today, enable_ddw() will return a non-null DMA address if the
> created DDW maps the whole partition. If the address is valid,
> iommu_bypass_supported_pSeriesLP() will consider iommu bypass enabled.
> 
> This can cause some trouble if the DDW happens to start at 0x00.
> 
> Instead if checking if the address is non-null, check directly if
> the DDW maps the whole partition, so it can bypass iommu.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

This patch has a bug in it. I will rework it soon.
Please keep reviewing patches 1-5.

Best regards,
Leonardo

