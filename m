Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1064120B7BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 19:57:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tl350ZlCzDqnn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 03:57:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f44;
 helo=mail-qv1-xf44.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kEMYkxYn; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tl1C4s20zDqMp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 03:55:58 +1000 (AEST)
Received: by mail-qv1-xf44.google.com with SMTP id m8so669229qvk.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 10:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=vbJSwJZjtdDURxHhSOHbJ4FVNNa89m/NxVA+tcIHMV4=;
 b=kEMYkxYnXu8l1k19YvYaordAe8ggm/SuTS8JBm/x5iX5HWzGdK9fKk4gnlqxGoolGT
 sEL6K/HPhTKZSFpmfEnTOSsbFLEJkWdDdBq3Rwok22rTzkxD1wpjg6nvTNgy/Hnl7z6c
 m1ukLvcxCMpKyxZCj4OjNKqjBJb8aMRNUBY5z2xAtCWh9bRKCbRm2kmIK6MloUgLy5/l
 tjde7eS2aGpHYzVo8fqWuoHd9QuYRbY3IVXu5SWRP8/ZTmFRyzsuiESUdD2fU8J4W3ZV
 FVZn1qX9tqFb9TotveOIXPYFQi4LBKjtkzlpCMeeGDMy1JrG0Qf5c7U6ePpzcPDWs3M/
 AbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=vbJSwJZjtdDURxHhSOHbJ4FVNNa89m/NxVA+tcIHMV4=;
 b=IoBu3mIVwRXtKR9AUSwo2YNffMMTEMWXYKmrsdOae7r6PW3xC3GgBMkpSLVCIYzriJ
 94u5V8IIp+zwscdWhGQBy7lxEEgzTKy143q3PfHpAePX46jN3hoFlD5MNUIwTUtzo427
 yTNIhT45aDMUETwix4ALVlKb4vdbd5qBe3yjMmXrWrWTe5u49m9k5h/Oeb60q0uZLkrH
 piMdj44BGFNMNg8ACYGYN4gGZNLniY6/xBsaFYXvh530JOnP7bo0j/apP+6cvKBmVgcf
 tM/nY/Ub5yjyHFckda7KN1iXH9a9KEagtXiPpfCZkP7GbptcdLl5b73jGaoclUg8qebn
 A6hw==
X-Gm-Message-State: AOAM530G/Eysd2m0Fz8nYeZJ0h7Ai46QRuD3KiV0UZ3mwP7GL++LC6St
 3ZsQDAHEkSTAeSPU9igJ5hA=
X-Google-Smtp-Source: ABdhPJyuyzA1nnZI8Q1DLNU6cc/82r+MSHrV/ixGeAuexUDpSqk05oz0uxYHO/xkNGqqIRlq0puLfg==
X-Received: by 2002:a0c:ba0e:: with SMTP id w14mr4357491qvf.222.1593194154665; 
 Fri, 26 Jun 2020 10:55:54 -0700 (PDT)
Received: from LeoBras (200-236-242-115.dynamic.desktop.com.br.
 [200.236.242.115])
 by smtp.gmail.com with ESMTPSA id g145sm9046493qke.17.2020.06.26.10.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 10:55:53 -0700 (PDT)
Message-ID: <d58faed1e9e35becb80f2737ed4be3d422507d6e.camel@gmail.com>
Subject: Re: [PATCH v2 5/6] powerpc/pseries/iommu: Make use of DDW even if
 it does not map the partition
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Alexey
 Kardashevskiy
 <aik@ozlabs.ru>, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>
Date: Fri, 26 Jun 2020 14:55:41 -0300
In-Reply-To: <14da928d1cae8779a93228455c4873c127eeffa6.camel@gmail.com>
References: <20200624062411.367796-1-leobras.c@gmail.com>
 <20200624062411.367796-6-leobras.c@gmail.com>
 <14da928d1cae8779a93228455c4873c127eeffa6.camel@gmail.com>
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

On Fri, 2020-06-26 at 12:23 -0300, Leonardo Bras wrote:
> On Wed, 2020-06-24 at 03:24 -0300, Leonardo Bras wrote:
> > As of today, if a DDW is created and can't map the whole partition, it's
> > removed and the default DMA window "ibm,dma-window" is used instead.
> > 
> > Usually this DDW is bigger than the default DMA window, so it would be
> > better to make use of it instead.
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> 
> I tested this change with a 256GB DDW which did not map the whole
> partition, with a MT27700 Family [ConnectX-4 Virtual Function].
> 
> I noticed the performance improvement is about the same as using DDW
> with IOMMU bypass.
> 
> 64 thread write throughput: +203.0%
> 64 thread read throughput: +17.5%
> 1 thread write throughput: +20.5%
> 1 thread read throughput: +3.43%
> Average write latency: -23.0%
> Average read latency:  -2.26%

The above improvements are based on the default DMA window, which is
currently used if DDW can't map the whole partition.

Those values are an average of 20 tests for each environment, 30
seconds each test.

I also did some intense testing, for 5 hour each:
64 thread write throughput 
64 thread read throughput

The throughput values are stable in the whole test, and I noticed no
error on dmesg / journalctl.

