Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C0820B480
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 17:28:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tglJ6j0BzDqQF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 01:28:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j1AhPU9q; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tgdQ4VjzzDqrj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 01:23:37 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id j80so9115173qke.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 08:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=AcfGMzYp7QqfA2+kE0gyDBm3KnBHvfAWT9HgF7mZJ8Y=;
 b=j1AhPU9qp6hE6bSHig7NwWJXhfyzdEkDs3C7God/Eh4gBV6HCsFAOUEJDrlfxb3XG2
 w3jie5LDsUHP5ks9naDcnHuDFpIiZ+Y0zAUT0iEGl5xrdwD6Aez4kNtfRPYMB+SkuWuL
 D4mCU2q7wcTS6tDaouTps7GUhbjlgIH31NV+Sfnvcbvzd380gdV9KMDFDNsSTLyApAl3
 MIEjT7fA+gG9dKIBf4GLSHvcLtZWVDR7rF/93pBUQqvNDsaRkG7lLAr8rnqz/UqkLSD1
 ALJqPF8k6omIKdzsQ89y4oLUjmhUi+AiuF89DOKEuBb6JAj1UOQE/6GWYyO1Z/dhi7cu
 JbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=AcfGMzYp7QqfA2+kE0gyDBm3KnBHvfAWT9HgF7mZJ8Y=;
 b=Z7xqBKGp8mSI9CgKblSEh31GRH1l/Jq+TcOy+Ez+ro5sG89f+An0cucB5EwRDfYZIo
 mrljXNcbNIwwVVIixLil1/jEN2gaEMfKHFjYofhtsIQIgBUDy4S8v+YuAEATvhInrqpA
 wxbULq0FYQB7zR05WwS9b8Bfg3DLfKAlu/tLxF7XsLAbaRfxjUyqWL7u1uiAsUSSubPY
 OpFgzYF1rSIBIyTeV52AaEbeXaPmh5XFHy2h3zJI9k/pLToHHBGwmWm+tPX3R1JnVAuC
 C+RsY5B5KA2n4TUxy1lDHpyHExGkHzqFYJuQCb8ZagizydLpox2wtpCrlRbbNjlwxd6Y
 L2Bg==
X-Gm-Message-State: AOAM530tDJbCDYS1CyXTWEfjI3jc8yFl5p5yXh03KOjRphJ20zXMwg+N
 9RhfZQZFznNJ1gOvCW7tVfc=
X-Google-Smtp-Source: ABdhPJyYqRHXlQ9Y8424iFw4ajWlqOYStgwldP/zJe3QQZ1Kbeq+GnV0kcw5Wo5sotNmovMyH3yqDg==
X-Received: by 2002:a37:c50:: with SMTP id 77mr933027qkm.445.1593185013732;
 Fri, 26 Jun 2020 08:23:33 -0700 (PDT)
Received: from LeoBras (200-236-242-115.dynamic.desktop.com.br.
 [200.236.242.115])
 by smtp.gmail.com with ESMTPSA id q47sm9765744qta.16.2020.06.26.08.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 08:23:33 -0700 (PDT)
Message-ID: <14da928d1cae8779a93228455c4873c127eeffa6.camel@gmail.com>
Subject: Re: [PATCH v2 5/6] powerpc/pseries/iommu: Make use of DDW even if
 it does not map the partition
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Alexey
 Kardashevskiy
 <aik@ozlabs.ru>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>
Date: Fri, 26 Jun 2020 12:23:28 -0300
In-Reply-To: <20200624062411.367796-6-leobras.c@gmail.com>
References: <20200624062411.367796-1-leobras.c@gmail.com>
 <20200624062411.367796-6-leobras.c@gmail.com>
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
> As of today, if a DDW is created and can't map the whole partition, it's
> removed and the default DMA window "ibm,dma-window" is used instead.
> 
> Usually this DDW is bigger than the default DMA window, so it would be
> better to make use of it instead.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---

I tested this change with a 256GB DDW which did not map the whole
partition, with a MT27700 Family [ConnectX-4 Virtual Function].

I noticed the performance improvement is about the same as using DDW
with IOMMU bypass.

64 thread write throughput: +203.0%
64 thread read throughput: +17.5%
1 thread write throughput: +20.5%
1 thread read throughput: +3.43%
Averag
e write latency: -23.0%
Average read latency:  -2.26%


