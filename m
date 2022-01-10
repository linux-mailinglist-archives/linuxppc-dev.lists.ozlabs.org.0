Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A762D48A369
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 00:07:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXqGq4TTFz3bY0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 10:07:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=X/BYePGB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=X/BYePGB; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXqG72TzVz2xvv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 10:06:53 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id z3so14369336plg.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 15:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=y+VBsHBfwIdG2OzWHPdI/WIqfhyYeKNFkPIFzGKgGjs=;
 b=X/BYePGBzH1Y0U06VN7h0LTAx5XkiSMJkjX4bzEruFI1kwOUOCZ/UQD5Hz1I4ruAQl
 PKrgHenyxeASQaRZZvzIOgMnuzQdonH1VvyAbdvdjbchbZ2+uMZc22CuQapKF6//7uez
 U7SEtzQCYOhll5kuSGrRuD3424eXtMM1K2q20cLcgofjiBKZpwYAGGu/G+SgPu+Ah0Ai
 cMXFe7zrtF2HSeLvPaMRp85OO6XQzOWT5yW68a8WQ+brErvfPeLpyOXHT8jSayE1ssES
 B/xCP4larnCmFQsqFp3LTl28pqvPRHXZOcO2unNP2YugKO4xbE5RD1x5r36xyKuMboWr
 viJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y+VBsHBfwIdG2OzWHPdI/WIqfhyYeKNFkPIFzGKgGjs=;
 b=WumukuiHKepp1RTPnP0CuZyxMg+b4eUkjeHqAdKifFcWKwF/qLLq4Td1OC+2zJGfqe
 uzKZkm8yHA5vylInbJEbktQ2SXsFEys7Qkd5rqkXg2u4BTLOr5e0K1XRHnD+XvUUrmyk
 nYvUODc++P4D7jrmI6PkAllu/UyQT7R2Cd+DVjWJqigeYJKWCPIjQ4bDsRdyhat1ciVD
 NlflC09LlWJ2QNQ6NGn2LXJyXi+G3UsZsy4IuZe0uyWB471A9E/OifrZ8wsv60OkCnU7
 WUctS66dIxAkZx4yVJ59jKsrPp7CxVezi2CIzUJCds+5C+szIb69VLo5IRL6NgABdBiS
 AJBg==
X-Gm-Message-State: AOAM533eVFslHm53Sssg9IS0xNdgf0MLHgz2RiXWBQShOoJKm16oCA02
 4m63cqhv4ebsJ6YrKNS/o4sKwQ==
X-Google-Smtp-Source: ABdhPJwuqul2WTZrr6xhkm1p+58Y11+q37mOxYmOZK51ca5s/4q/F/MIfrRIm+VTh9ySZMN7V9F+qQ==
X-Received: by 2002:a17:90a:d90b:: with SMTP id
 c11mr37450pjv.211.1641856009160; 
 Mon, 10 Jan 2022 15:06:49 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id d1sm4554170pgd.66.2022.01.10.15.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 15:06:48 -0800 (PST)
Date: Mon, 10 Jan 2022 23:06:44 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Subject: Re: [PATCH 3/6] KVM: Remove opaque from
 kvm_arch_check_processor_compat
Message-ID: <Ydy8BCfE0jhJd5uE@google.com>
References: <20211227081515.2088920-1-chao.gao@intel.com>
 <20211227081515.2088920-4-chao.gao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211227081515.2088920-4-chao.gao@intel.com>
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
Cc: x86@kernel.org, Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 Marc Zyngier <maz@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, kevin.tian@intel.com,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Fabiano Rosas <farosas@linux.ibm.com>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 pbonzini@redhat.com, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 27, 2021, Chao Gao wrote:
> No arch implementation uses this opaque now.

Except for the RISC-V part, this can be a pure revert of commit b99040853738 ("KVM:
Pass kvm_init()'s opaque param to additional arch funcs").  I think it makes sense
to process it as a revert, with a short blurb in the changelog to note that RISC-V
is manually modified as RISC-V support came along in the interim.
