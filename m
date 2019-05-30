Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8CB30423
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 23:47:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FLlq3lDtzDqXl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 07:47:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=soleen.com
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=pasha.tatashin@soleen.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=soleen.com header.i=@soleen.com header.b="GD12fY/w"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FFdH29XzzDqVM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2019 03:56:34 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id c26so139114edt.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 10:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U+U+DBu1PHMClYLVKuULaBBhuiRxTzOsbylx088oPEM=;
 b=GD12fY/wh1lP7eqxCKSGFE/8n6zDs6KFH9zv8unLZJQb7BhgoZ/FuQoVPPF2fsQzgg
 CP4pwp8bhVoGUfB+vL51iywyr3kIDSlR8GsTfT9wemkwoZexHA7mhilI3dLovAvK8UlZ
 WmM98gh2EDsHrLbcwkANG7giHH4EZKej0EVgBX6h5mJ7w6r0J6iGdcaGoDw+BEcRtybf
 M6GmqgGBcydEf0hivdeRt3lL9nkWceqr+jmzkKokhk6f2zfqVXSepgJam/5bBWa0FlYT
 rJtpSPZaRnje0lSClB0nZBDffZQG3XQFfZWdQU+gcIX04hnMxHSn4N0EkO8cYuK714PL
 hGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U+U+DBu1PHMClYLVKuULaBBhuiRxTzOsbylx088oPEM=;
 b=cOzydRJaa8YcSMzqdy3G3htlq6A8G4Af3PIDRR/IAhluEBpJW/clE5SgS0okeheFsj
 uPJacVb7hhEwY7+OnukUT5a97N2Zw8AVZL4ePQRLtU4GlV7MSz8+wTMpMTXMPxqaruL5
 Wrd78gS261G6zoT2vnDWf87mtw1KB+/VHmJtD3+C/MhVxCOLKetDY0JocyyopT/zF3Q6
 rdJDm8cJ5x4KN8m8rxk925FXjvMLnF6yCELYQhd5g07tvQikjQOpVKFH0+9OtZbH3hSK
 8ueP0PqJYrT0sl7rKea9UWF3XThNI3ZE/9pCKqDcHtqjur3dLhpspLhzAXMvy3Y+L6wL
 Hfbg==
X-Gm-Message-State: APjAAAU5SYN0szKTzt/UuIcqGXkWj6+NAXhPVWUpWplQDkIQ6Fr2IGhj
 mFsQusSNpEBF2oDggKWJCIBmI9Lo957+qV7EcvaRFw==
X-Google-Smtp-Source: APXvYqxEwoaKu7XqFiqqTJmX9C2mj8B1AaOe+c0aGjlSaAlY2tyiFn25bumPeidujxHuV6Nv1l+FdpXKbGDDMgHtxbo=
X-Received: by 2002:a17:906:a354:: with SMTP id
 bz20mr4942089ejb.209.1559238992200; 
 Thu, 30 May 2019 10:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-7-david@redhat.com>
In-Reply-To: <20190527111152.16324-7-david@redhat.com>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 30 May 2019 13:56:21 -0400
Message-ID: <CA+CK2bBF-=+g76A19VfPdSNUJzd-X-P_6vcAiTTrf_JbPvHL+Q@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] mm/memory_hotplug: Allow arch_remove_pages()
 without CONFIG_MEMORY_HOTREMOVE
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 31 May 2019 07:45:15 +1000
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
Cc: Oscar Salvador <osalvador@suse.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Arun KS <arunks@codeaurora.org>,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm <linux-mm@kvack.org>,
 Michal Hocko <mhocko@suse.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Qian Cai <cai@lca.pw>, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 "mike.travis@hpe.com" <mike.travis@hpe.com>,
 Nicholas Piggin <npiggin@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tony Luck <tony.luck@intel.com>, Baoquan He <bhe@redhat.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Banman <andrew.banman@hpe.com>, LKML <linux-kernel@vger.kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 Wei Yang <richardw.yang@linux.intel.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 27, 2019 at 7:12 AM David Hildenbrand <david@redhat.com> wrote:
>
> We want to improve error handling while adding memory by allowing
> to use arch_remove_memory() and __remove_pages() even if
> CONFIG_MEMORY_HOTREMOVE is not set to e.g., implement something like:
>
>         arch_add_memory()
>         rc = do_something();
>         if (rc) {
>                 arch_remove_memory();
>         }
>
> We won't get rid of CONFIG_MEMORY_HOTREMOVE for now, as it will require
> quite some dependencies for memory offlining.

I like this simplification, we should really get rid of CONFIG_MEMORY_HOTREMOVE.
Reviewed-by: Pavel Tatashin <pasha.tatashin@soleen.com>
