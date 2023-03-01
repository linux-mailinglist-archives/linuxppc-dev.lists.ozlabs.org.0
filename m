Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F049F6A770B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 23:47:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRqB55Rpwz3cMN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 09:47:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=RacUjtkK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=debug@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=RacUjtkK;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRdkr1cKtz3bgj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 02:41:38 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id m3-20020a17090ade0300b00229eec90a7fso1525660pjv.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Mar 2023 07:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677685296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T04RMfKzSUFRrZ3CYc3+bErGU8vpxkP2QVI3mwlpG78=;
        b=RacUjtkKVhkSdFUBywOGho+8dt8NsK+GHdxWXdQ69WX2yCf/yYWl7r6icMXBWT/ShM
         KzbzJEeKqlnWntlEh4Hu5sno9Ak81pDzhFum2pY94j4Sv2hldxTUvXOesOtDXjR8r6gc
         qTgIZDS9fRsSDLNbTTTqAFsgPsTJ/DQ+0jjGE9ek1g+5UBhUcmjFAxCNoVki1FxJorhz
         1mqoDsTuoBLwUNz+cTKmWUvmBN0WlvjuL/8NCCPe/UsZ69pgJ+6lNteW1mdicJGes/KY
         sz2TvcyHAjAaMaJRH5/VJiCFama3PVa+Xs98E38Ow6CsZfQ4ni3p2/e/LUrMvV5jGCLw
         yEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677685296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T04RMfKzSUFRrZ3CYc3+bErGU8vpxkP2QVI3mwlpG78=;
        b=7jRAx1U8jFDFJYx/uvCF9ntqE1DUgYa3n6LduCXERvqcIwCwFC5WDe5o2aDQ9nSg1L
         5IqTVFh+56IONXcGrGJlZvPviVIy4oboh3ioXifRo5pCMI/KfjmUaBBLkudBSCn8o7Ib
         ZOg6WICKj7xz01YpWVvSy1ZexhBxLZcHa+tgYl0S02sOzebw1brXUiMls2DAyu2u46rX
         8IESkfWT774LaQEX1leigZi0lWe9EDb304ww6FZrYbD325Hyj7+H49F7qCPqdG7wcZXr
         B5khWar8HX2Ujt6KhBehO0hw9ImoYDqSIstLI0toTyCZrShsf1AT9w0letLSYbsfxL9J
         Z2TA==
X-Gm-Message-State: AO0yUKXMSIoBLnTOPH01XImEp92kKukWsNT33G8ynSpAOjjUF06t5nES
	k6a4wogDynvy9VElGuNSG48j8Q==
X-Google-Smtp-Source: AK7set89u8u7K351sr+Ck6r7PKKsfq0NxjZus48TDBYC9SmTqwP5jGqb0tSf18Db2RC/D0Tp3KOSQg==
X-Received: by 2002:a05:6a20:2444:b0:cc:ac05:88f7 with SMTP id t4-20020a056a20244400b000ccac0588f7mr8304959pzc.34.1677685295782;
        Wed, 01 Mar 2023 07:41:35 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id l12-20020a62be0c000000b005821c109cebsm8058970pff.199.2023.03.01.07.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 07:41:35 -0800 (PST)
Date: Wed, 1 Mar 2023 07:41:30 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v6 13/41] mm: Make pte_mkwrite() take a VMA
Message-ID: <20230301154130.GB3505369@debug.ba.rivosinc.com>
References: <20230218211433.26859-1-rick.p.edgecombe@intel.com>
 <20230218211433.26859-14-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230218211433.26859-14-rick.p.edgecombe@intel.com>
X-Mailman-Approved-At: Thu, 02 Mar 2023 09:45:46 +1100
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
Cc: kcc@google.com, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, david@redhat.com, eranian@google.com, Oleg Nesterov <oleg@redhat.com>, linux-mm@kvack.org, linux-csky@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, dethoma@microsoft.com, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Eugene Syromiatnikov <esyr@redhat.com>, jamorris@linux.microsoft.com, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, linux-snps-arc@lists.infradead.org, "H . J . Lu" <hjl.tools@gmail.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, linux-alpha@vger.kernel.org, linux-um@lists.inf
 radead.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Florian Weimer <fweimer@redhat.com>, Michal Simek <monstr@monstr.eu>, John Allen <john.allen@amd.com>, linux-parisc@vger.kernel.org, Weijiang Yang <weijiang.yang@intel.com>, linux-api@vger.kernel.org, christina.schimpe@intel.com, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Cyrill Gorcunov <gorcunov@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, rppt@kernel.org, Andrew.Cooper3@citrix.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 18, 2023 at 01:14:05PM -0800, Rick Edgecombe wrote:
>The x86 Control-flow Enforcement Technology (CET) feature includes a new
>type of memory called shadow stack. This shadow stack memory has some
>unusual properties, which requires some core mm changes to function
>properly.
>
>One of these unusual properties is that shadow stack memory is writable,
>but only in limited ways. These limits are applied via a specific PTE
>bit combination. Nevertheless, the memory is writable, and core mm code
>will need to apply the writable permissions in the typical paths that
>call pte_mkwrite().
>
>In addition to VM_WRITE, the shadow stack VMA's will have a flag denoting
>that they are special shadow stack flavor of writable memory. So make
>pte_mkwrite() take a VMA, so that the x86 implementation of it can know to
>create regular writable memory or shadow stack memory.
>
>Apply the same changes for pmd_mkwrite() and huge_pte_mkwrite().
>
>No functional change.
>
>Cc: linux-doc@vger.kernel.org
>Cc: linux-kernel@vger.kernel.org
>Cc: linux-alpha@vger.kernel.org
>Cc: linux-snps-arc@lists.infradead.org
>Cc: linux-arm-kernel@lists.infradead.org
>Cc: linux-csky@vger.kernel.org
>Cc: linux-hexagon@vger.kernel.org
>Cc: linux-ia64@vger.kernel.org
>Cc: loongarch@lists.linux.dev
>Cc: linux-m68k@lists.linux-m68k.org
>Cc: Michal Simek <monstr@monstr.eu>
>Cc: Dinh Nguyen <dinguyen@kernel.org>
>Cc: linux-mips@vger.kernel.org
>Cc: openrisc@lists.librecores.org
>Cc: linux-parisc@vger.kernel.org
>Cc: linuxppc-dev@lists.ozlabs.org
>Cc: linux-riscv@lists.infradead.org
>Cc: linux-s390@vger.kernel.org
>Cc: linux-sh@vger.kernel.org
>Cc: sparclinux@vger.kernel.org
>Cc: linux-um@lists.infradead.org
>Cc: xen-devel@lists.xenproject.org
>Cc: linux-arch@vger.kernel.org
>Cc: linux-mm@kvack.org
>Tested-by: Pengfei Xu <pengfei.xu@intel.com>
>Suggested-by: David Hildenbrand <david@redhat.com>
>Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
>

Acked-by: Deepak Gupta <debug@rivosinc.com>
