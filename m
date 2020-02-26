Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B0617032E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 16:54:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SL2G5cfVzDqlF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 02:53:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=PEkBC2gG; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SL074ycbzDqXf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 02:52:07 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id 11so3093950qkd.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 07:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4GYwlf0Xa2QHt1cHVU8f4uTPVQEe66S6tW8iKIjB1EY=;
 b=PEkBC2gGo9Wp0CTNFzcX/uGLGqh45la2h+234pEbgb0JKCTWiVwR5CK2qWd8o7GV9+
 vZ0V3mJmWDxwpkokIiWuE2AK5D0JvSuKri12uT1Y5ZmnM2+2x1lk6TfjQrITZNEH8kqT
 OpLenMqGsrmR+s2Jh+PZTctbpw7UkSpOJj3m46DAs7sTe9V+A8PrxIZxTU0Jx2ozkU+h
 l2FfR5Vf/ZZGO7KqofRi3aS6TzSV2SHQoTpS42nUl+B16nz+oN/qYJaqXNzKW0WQZswg
 b+O0gHwTc4Y9Ju+CjJy1uD3JRDYV9kySWYvBERLoM4RJvQwJnkBJANxBmrBhZlFtAjqz
 NmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4GYwlf0Xa2QHt1cHVU8f4uTPVQEe66S6tW8iKIjB1EY=;
 b=qg98C7wyvRlZqh12Maf5QveVVrdnoeAvKTDGHRMBXZ5POx66oU1dF4R4yLKJAHngN2
 HQkP24afhLca5nSGYKd+Z3ozR/AKgSgyvRHcTuJGB3I0gdZBxsyrJM7S+QExwDSU2vSl
 S+ehgXlJRPKlV7kbadvgXVDeAjuDZ0O1aKWykx7sTunHBTCnSIJVHWefnyEx4TTr3GnM
 m5C+8bLmRSkOHt2k0DdrfIaAGYfILHG/Ldebm56ikB6dm/eOVU+9XkBbcq2cqKm2FsY5
 xf05Xolnv/lf19rUIAuDxdN4mWL2NWH4RdbsYjwGZ/+Um3zifXCPuFy0G+LDvZbR88XE
 eOtA==
X-Gm-Message-State: APjAAAWtOpHx1Dgqya7lQrg8A2LuOxcogmNdTkhrnV4iXdnoLEkvx0cE
 4gQdfscWoDQFFsY8Gd0AfgpwFw==
X-Google-Smtp-Source: APXvYqxycYwltSMF6mRZHm7TjXsCzQqI/GC2y1t3waZQf56agLdqkPAjaYu5yvSrjxUQYf0tQtgA0w==
X-Received: by 2002:a37:64cb:: with SMTP id y194mr5808427qkb.364.1582732321799; 
 Wed, 26 Feb 2020 07:52:01 -0800 (PST)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id 3sm1332599qte.59.2020.02.26.07.51.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Feb 2020 07:52:01 -0800 (PST)
Message-ID: <1582732318.7365.129.camel@lca.pw>
Subject: Re: [PATCH V14] mm/debug: Add tests validating architecture page
 table helpers
From: Qian Cai <cai@lca.pw>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Anshuman Khandual
 <anshuman.khandual@arm.com>, linux-mm@kvack.org
Date: Wed, 26 Feb 2020 10:51:58 -0500
In-Reply-To: <7c707b7f-ce3d-993b-8042-44fdc1ed28bf@c-s.fr>
References: <1581909460-19148-1-git-send-email-anshuman.khandual@arm.com>
 <1582726182.7365.123.camel@lca.pw>
 <7c707b7f-ce3d-993b-8042-44fdc1ed28bf@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, x86@kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, Vasily Gorbik <gor@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-02-26 at 15:45 +0100, Christophe Leroy wrote:
> 
> Le 26/02/2020 à 15:09, Qian Cai a écrit :
> > On Mon, 2020-02-17 at 08:47 +0530, Anshuman Khandual wrote:
> > > This adds tests which will validate architecture page table helpers and
> > > other accessors in their compliance with expected generic MM semantics.
> > > This will help various architectures in validating changes to existing
> > > page table helpers or addition of new ones.
> > > 
> > > This test covers basic page table entry transformations including but not
> > > limited to old, young, dirty, clean, write, write protect etc at various
> > > level along with populating intermediate entries with next page table page
> > > and validating them.
> > > 
> > > Test page table pages are allocated from system memory with required size
> > > and alignments. The mapped pfns at page table levels are derived from a
> > > real pfn representing a valid kernel text symbol. This test gets called
> > > inside kernel_init() right after async_synchronize_full().
> > > 
> > > This test gets built and run when CONFIG_DEBUG_VM_PGTABLE is selected. Any
> > > architecture, which is willing to subscribe this test will need to select
> > > ARCH_HAS_DEBUG_VM_PGTABLE. For now this is limited to arc, arm64, x86, s390
> > > and ppc32 platforms where the test is known to build and run successfully.
> > > Going forward, other architectures too can subscribe the test after fixing
> > > any build or runtime problems with their page table helpers. Meanwhile for
> > > better platform coverage, the test can also be enabled with CONFIG_EXPERT
> > > even without ARCH_HAS_DEBUG_VM_PGTABLE.
> > > 
> > > Folks interested in making sure that a given platform's page table helpers
> > > conform to expected generic MM semantics should enable the above config
> > > which will just trigger this test during boot. Any non conformity here will
> > > be reported as an warning which would need to be fixed. This test will help
> > > catch any changes to the agreed upon semantics expected from generic MM and
> > > enable platforms to accommodate it thereafter.
> > 
> > How useful is this that straightly crash the powerpc?
> > 
> > [   23.263425][    T1] debug_vm_pgtable: debug_vm_pgtable: Validating
> > architecture page table helpers
> > [   23.263625][    T1] ------------[ cut here ]------------
> > [   23.263649][    T1] kernel BUG at arch/powerpc/mm/pgtable.c:274!
> 
> The problem on PPC64 is known and has to be investigated and fixed.

It might be interesting to hear what powerpc64 maintainers would say about it
and if it is actually worth "fixing" in the arch code, but that BUG_ON() was
there since 2009 and had not been exposed until this patch comes alone?
