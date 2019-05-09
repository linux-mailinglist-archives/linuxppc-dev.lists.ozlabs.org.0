Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04711186D2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 10:32:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4506632gNjzDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 18:32:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=mingo.kernel.org@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="E2kz1FMl"; 
 dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45064m6Yv6zDqMb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 18:31:20 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id 198so2070857wme.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2019 01:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FzWOYssN0isWIIe9zGhm6nETA9v2GV7Jir7OO9+o9Vw=;
 b=E2kz1FMl83tN2ABjW1mJurOeaAAcQShe1pSdN0kxvumUhNTI+TqC+JXIZb1PePIKJJ
 ysk3UkyIsJU1IyF0QX1bzY9ls8u7jx8KohqfGd2WpkooA64l95qf7m/i1PXKKqW34KQF
 NNcpCM/IAQlJ5s4gyXGZ9cMqAAd7CUf1vozzxU8QOI5PMk0lgpQQKZzWT1hz9HGssOvu
 uKSWLGBKVYuEifUSTdaTScT7ZUK/rBVNeKSLxaCEgLJEzr+DuN5HYR3Wm+13avez/Z+N
 IK5ls6J3TdDfsYGUe0WoryVlVbiG8KYRYsN6OokIHADtlhOTcp6Zf1M8DSc7jpHqbyfy
 gN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=FzWOYssN0isWIIe9zGhm6nETA9v2GV7Jir7OO9+o9Vw=;
 b=VDmOuSWMbPrYpBa2jX+yioAzagYmMJKkF6BseqxLl7RlYNhhbClBQTEw7lcH/u69ff
 i88kIm55WlcTIGcCqn8Ii1b14SrP6Arog4vo4SDP1dRIXoi2FQQWjLRFUzCcl91ws4ZN
 dnmwNjvzbbuvo/ZPQd/VaL4gK42EFKpDN97G1mUUiPZN2TaCWHc28X+/XQWbHI60onpt
 qicFaj2/Gqu44LqjU4WhEsh4GXIFyoB3Nahb97REFwdDHiINbKhLQ6o3y65Xjxfr3VGw
 j1U3XlAMF4CaVXHTSAGtH6aoHowdBAL7ziJZEXvfz/+q2FPJE2tURSyQO0Nz2v2b4yac
 PLtQ==
X-Gm-Message-State: APjAAAUluZA7QpfiLC4iKE0XlBBzG0Ko8ehflXdqk+xFYrOnRM2sEWIx
 eyIjme/JmoUHW3XtCLbcp/w=
X-Google-Smtp-Source: APXvYqwbP80+SsW7YO75fRTZDEwGG81tyowfGAEzJg/Pgbxk1mNQT7/K4RNdohJEwe6Atj6WEY8WAQ==
X-Received: by 2002:a7b:c309:: with SMTP id k9mr1995617wmj.45.1557390675018;
 Thu, 09 May 2019 01:31:15 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
 by smtp.gmail.com with ESMTPSA id x17sm1474400wru.27.2019.05.09.01.31.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 01:31:14 -0700 (PDT)
Date: Thu, 9 May 2019 10:31:11 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] [v2] x86/mpx: fix recursive munmap() corruption
Message-ID: <20190509083111.GA75918@gmail.com>
References: <20190419194747.5E1AD6DC@viggo.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190419194747.5E1AD6DC@viggo.jf.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arch@vger.kernel.org, hjl.tools@gmail.com, mhocko@suse.com,
 rguenther@suse.de, richard@nod.at, gxt@pku.edu.cn, jdike@addtoit.com,
 x86@kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, luto@amacapital.net, linux-mm@kvack.org,
 paulus@samba.org, yang.shi@linux.alibaba.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, vbabka@suse.cz, anton.ivanov@cambridgegreys.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* Dave Hansen <dave.hansen@linux.intel.com> wrote:

> Reported-by: Richard Biener <rguenther@suse.de>
> Reported-by: H.J. Lu <hjl.tools@gmail.com>
> Fixes: dd2283f2605e ("mm: mmap: zap pages with read mmap_sem in munmap")
> Cc: Yang Shi <yang.shi@linux.alibaba.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Andy Lutomirski <luto@amacapital.net>
> Cc: x86@kernel.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: stable@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-um@lists.infradead.org
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linux-arch@vger.kernel.org
> Cc: Guan Xuetao <gxt@pku.edu.cn>
> Cc: Jeff Dike <jdike@addtoit.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>

I've also added your:

  Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>

Because I suppose you intended to sign off on it?

Thanks,

	Ingo
