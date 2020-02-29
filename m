Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6E41749C9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 23:39:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VLtK2ZCVzDrBd
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 09:39:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=OsiUhUD4; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VLrn6tqwzDqlf
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Mar 2020 09:37:45 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id p125so6626422oif.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 14:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vMgdrB1ihQCYAIbfFMzkiv3JHJetoGVM7PTi0q5ALmo=;
 b=OsiUhUD4bT1O7upbHwDuinmveawahmkCK+8PabYGyG4OgCvzVO2Y9gPARZOt8Q/czD
 +gKk4PjNad9Cr3uGC/89VvuVJcnJzMxJ6ySwmoXkUgS4Qbmfer8kAdJCtymsZ4N4Kisj
 xhsW4Trq+pLWIg+nu+GHlVmCRXyn51E/QSA0Axc54CrRDbWXQQuvdO5+eE5LbwM4gEdp
 uF4zuIbpl+wi5BquzuZ+DBrW3+oz59DM54WqcTU+Q4EjA/hE6ZkxGgQBfjmJzKNErQrc
 d4M1+ejrtFxlmMb9QI6A2Bvzid6CQiM91vKcAXrSOKEwClT+jdHfQPTQ7XCWj2cSd8Cg
 EVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vMgdrB1ihQCYAIbfFMzkiv3JHJetoGVM7PTi0q5ALmo=;
 b=aEIBYucPhTp5TQ+smRdDRL1aYGLPc5Yr+2LWWuEEL/5iR9fC2JizOKHke9g0yvN1WE
 dsvDZ5tbn6pPsqD9E5ALZeKr0QGubp31Nd85M7yZMNKiT75svJa+1iLzxtpw9mYB626s
 ah16NPw7obF9uiDvsT5auRSpisXIu+XicTHh8+DK10yIv+l6WTKxYAI6cf263ZIIiYHl
 OIbEWjPblTcpgHu+WfzrESdaKHDEPXRrJWeHiLhIdA/jXjuPVLtINdQwgqZscYuVdyqe
 kckqjp7N405X3M49hs1H13ESL/Oa1wczRTbr2u0ATEc2axAgdM+By5c8DFK3HtoFEgVv
 R7FA==
X-Gm-Message-State: APjAAAXXgPJwI2BUqMI92nvVGoiFybWW0NB8c5fNWfXdR3BTFt+luqT4
 5sVnTvLjBMXNNUC0Sqgh/3N8O8lfKbIF0ymDMrhkvA==
X-Google-Smtp-Source: APXvYqzG75KD/D3fDhylY7WK/HGO2n1t1MkOMUt0WzVJixm4DCk6JJ0g5eYvnxnmvSeOxw028BqGSEKkK+YHNuO1FGI=
X-Received: by 2002:a54:4098:: with SMTP id i24mr5511480oii.149.1583015862617; 
 Sat, 29 Feb 2020 14:37:42 -0800 (PST)
MIME-Version: 1.0
References: <20200221182503.28317-1-logang@deltatee.com>
 <20200221182503.28317-4-logang@deltatee.com>
In-Reply-To: <20200221182503.28317-4-logang@deltatee.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sat, 29 Feb 2020 14:37:31 -0800
Message-ID: <CAPcyv4ici3h_C_c+9eapcehq+Lg3cabkq3n3XXvbSg=qUrJLgQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] x86/mm: Thread pgprot_t through
 init_memory_mapping()
To: Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: X86 ML <x86@kernel.org>, linux-ia64@vger.kernel.org,
 Linux-sh <linux-sh@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 Linux MM <linux-mm@kvack.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-s390 <linux-s390@vger.kernel.org>, David Hildenbrand <david@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Michal Hocko <mhocko@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Eric Badger <ebadger@gigaio.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 21, 2020 at 10:25 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
> In prepartion to support a pgprot_t argument for arch_add_memory().
>
> It's required to move the prototype of init_memory_mapping() seeing
> the original location came before the definition of pgprot_t.
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: x86@kernel.org
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>

Looks good, checked for argument confusion, passes the nvdimm unit tests.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
