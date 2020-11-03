Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF1B2A46A1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 14:33:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQW203zTlzDqcm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 00:33:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=shutemov.name
 (client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=kirill@shutemov.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=shutemov-name.20150623.gappssmtp.com
 header.i=@shutemov-name.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=izMTq7qx; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQRz44StmzDqLT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 22:15:28 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id d24so18555542ljg.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Nov 2020 03:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ncuj71puAub1y9k++6jjBlDK0kArgOgR8TXfNbxvsd8=;
 b=izMTq7qxXBvApfWEFsxvjdUJPgrZuhTimURmEAxHbNo4gFnz/aLq2b7VWGISw5z4df
 T4qAkIJ/wVC4TwenAjvns/G4eV3KtASB7SoA8G7okZ0DlaEStNAMb73QDSEutPwz7Cxr
 9dwIgPWHz7UWHdA9P9qEfMywjEVY/N8zUXbSYG6q36rmSFiE581fBMYfvokjD/8gAh06
 qYdTpEzw9QcJY1be9GP/o6iEFZwXPue/WXhcJtWuRvtKWCdMX7XpnZXp5E2hc11zR/K7
 2suAPN+eebeKUXh9rBamFs3h05hvuWg15bi4K5NGwazMJ1rOL7mta6TyCdehAzblBry8
 3fFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ncuj71puAub1y9k++6jjBlDK0kArgOgR8TXfNbxvsd8=;
 b=Gu872IwYiZbUQBOrCWJTYuk30WyxalWdSbL0rENwlhKDJBefWZvtjN7kWcKffQtf3n
 otk0Lu6JujdL1q7Yy6/QvPtKohuzeNPo6bFgy2PLNKrIbJam0P5Rk6tEDcERlJZbskXG
 nTKASVPcWYMII7FMXSrfa2Bcezngv5IOMKTlaluBZ6D05yWwvBCKsDNN+r7Gl/7VZkaG
 cedi0WUS5ZdBs0R1/nbwL0Wb8vIyO3SOcz2TK1KaX+t58GufwAraDJl4KZP2gYA4uk0/
 XrzkYeA4VDMhHEyALM3X3eUuT5fuHYYnk2pBiOnYuj91cEDyBTEHI0+vpsfs6CBohy/g
 Whmw==
X-Gm-Message-State: AOAM530sHo38U53yuzeXaXnV6AT0YaD4jAMhpLYxEaGbBadByeI4bvZW
 9h4mWQpgpEmeykRAywWtWgf2/g==
X-Google-Smtp-Source: ABdhPJxjF5BnQdEHGsyL0gaT34gDeSETHtrYJVXOHHeYBc231eIiqfI8v+rYFTL2Y/vLhKT27dJQgw==
X-Received: by 2002:a2e:b60e:: with SMTP id r14mr8731933ljn.77.1604402123506; 
 Tue, 03 Nov 2020 03:15:23 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id q22sm3657427lfj.145.2020.11.03.03.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 03:15:22 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
 id D700710231C; Tue,  3 Nov 2020 14:15:23 +0300 (+03)
Date: Tue, 3 Nov 2020 14:15:23 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v3 0/4] arch, mm: improve robustness of direct map
 manipulation
Message-ID: <20201103111523.zt5q5ypnnccdlque@box>
References: <20201101170815.9795-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201101170815.9795-1-rppt@kernel.org>
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 01, 2020 at 07:08:11PM +0200, Mike Rapoport wrote:
> Mike Rapoport (4):
>   mm: introduce debug_pagealloc_map_pages() helper
>   PM: hibernate: make direct map manipulations more explicit
>   arch, mm: restore dependency of __kernel_map_pages() of DEBUG_PAGEALLOC
>   arch, mm: make kernel_page_present() always available

The series looks good to me (apart from the minor nit):

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov
