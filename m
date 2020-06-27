Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A2220C45A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 23:25:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vRcX4007zDr9S
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 07:25:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=shorne@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KrOHe2Al; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49vRZV1FZpzDr9C
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 07:23:43 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id e9so6555724pgo.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 14:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mizxgkzS/h5RAiTRnXHHAMYgNZSKy87tz0psMUuXu0c=;
 b=KrOHe2AlaGQ7tV28Vl9qyOQ0elfd8r//wq4xzvB5xDb5jWlg6mXfsKxabi0zi9yPbE
 a3CGp38U8cqw2mebqkt6TnvwzPA6E6KEcgpIj8HCQ1rHyHT3QVxyrownujSHvkYTCVSa
 Gy95rzA2weVyQoDCaBGwSARvG5wXI2h42LYwK1iUZUWKUYeZG14+sFo/aPCYLw2NwZJj
 nBqydL7WFvWCAVkBuzJ2gva+wATslrp9imqMIKL3E0H/YMoAyiaNhBbjIsjfeCv51DOd
 WRdGRRQ8YZYlJSkPBIPY8Mf5k8q0bkdsr138mWgQL9YfzyKrJwEngJSJT/C0ZJyP38ue
 p6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mizxgkzS/h5RAiTRnXHHAMYgNZSKy87tz0psMUuXu0c=;
 b=mEmCWv8bxZSqV792kRRaB3HlfZhl4k48izUxFH2+2CUsk86Dl88fWRWtz9Fq6ZZu4H
 0S/wfHxYPQEy2v6YpQfOghwSFwMyG4vfyt1Jw6ff0MBEMrdJUEA643WtnZIfH2ZCXEx7
 f8HXRonOOTIOu3yFItvb9HCa5caJDT0C/dRbwc3/3jR0QV9aFt+zOLN+hkk7RBx2dC3d
 dYRVSrInPff8mYwD/xVsbboI4Y3VJMUI+VtIpsXKtO+o3eeaYs55DcDQvju1BOkm0p7G
 mH9mP/I4XB7udfDWLoxj4KLpLr5xC9qe5P15mQsNF4Nqq4u5Kob46QCfsJa1lEsRf3wE
 tLsg==
X-Gm-Message-State: AOAM532cnCp9TUpa2nQ39pnjQOsynCH9VO0qCrCC5fhY4VLKqmTVI94e
 SaCPvXW+9s+qTNv7Jx4WkPA=
X-Google-Smtp-Source: ABdhPJyLzAtm2TextcgHnw6pDE2t7RidtLOm1t9FNzgTafND17DEExqOaKhxKo2F07v49LSV9JtDbQ==
X-Received: by 2002:a62:e305:: with SMTP id g5mr8523544pfh.115.1593293018476; 
 Sat, 27 Jun 2020 14:23:38 -0700 (PDT)
Received: from localhost (g2.222-224-226.ppp.wakwak.ne.jp. [222.224.226.2])
 by smtp.gmail.com with ESMTPSA id mw5sm15217406pjb.27.2020.06.27.14.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2020 14:23:37 -0700 (PDT)
Date: Sun, 28 Jun 2020 06:23:35 +0900
From: Stafford Horne <shorne@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 2/8] opeinrisc: switch to generic version of pte allocation
Message-ID: <20200627212335.GJ1401039@lianli.shorne-pla.net>
References: <20200627143453.31835-1-rppt@kernel.org>
 <20200627143453.31835-3-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200627143453.31835-3-rppt@kernel.org>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 27, 2020 at 05:34:47PM +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Replace pte_alloc_one(), pte_free() and pte_free_kernel() with the generic
> implementation. The only actual functional change is the addition of
> __GFP_ACCOUT for the allocation of the user page tables.
> 
> The pte_alloc_one_kernel() is kept back because its implementation on
> openrisc is different than the generic one.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Thank's for this.

Acked-by: Stafford Horne <shorne@gmail.com>
