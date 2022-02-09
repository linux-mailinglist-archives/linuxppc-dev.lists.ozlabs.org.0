Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 806DF4AFDBF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 20:53:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jv9Y810Zzz3cNk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 06:53:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kMS+/VC4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=kMS+/VC4; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jv9XP4MPCz3bPT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 06:52:51 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id r19so6120921pfh.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Feb 2022 11:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nFEbKA8UOj2F0aYmafhYdx9MoDnLhZL6FzGdA3foG6Y=;
 b=kMS+/VC4xCdhdLklBPMZrl1DDgsPdemkNlQ+9xJdsF7MXhYOau3XWTVe4FOrwEqNCE
 AtJl33LpEFo6tfuoyyjy0zXo24YUgl2rkRpZDMF8C8XU1aeb1hng1SUX4zjzRKukMAQ9
 27hgmz8ku+LmTHBmD6JLUcxGm2ViDLqKuaJNEonZsgpd0HlXbksTP9GkQqwkK3nofxzk
 9N3WOhuOj7Zmr/5Cp7EeaMz/pprsSKTROefT+5wZO27PB8CVnklUVAkPBIVMBiLCrHCw
 jl9lkCtgzT6We8ITi8RRxUdBU2p3bPtKzg04MIXkdCVNZOh+d/Fln2r4rSPfvBbdqxfm
 cNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nFEbKA8UOj2F0aYmafhYdx9MoDnLhZL6FzGdA3foG6Y=;
 b=5qNo3t7ORWJ5qV4zF4mCdek+0TPpPQ4DFFzCHZfWFVbP40hcvnhmKBL3ntHzE6rGSe
 zTXqBlmiL2Xp1oG6XeHm1wGT6x3B8jz4aN2a8ocbLBnEZMeQ3zxKJSoDqo+EVrvQaIad
 6L70BMBiTl1Gyze7DdLQD5nGxnn3ZuLZ45uwt1HN5yCAooOGOjfsPCcCcbr/432TFDuh
 md34L3wt2B9Jc4cfxTUk4ffRDdzIy2SMQv6MwKb9gv7m9DX8B5eIRhfJttGluZomIUH/
 fm4+iy0GlIwIHqmQCR0nul+Zl2447xB3Fu4MrWAnQIDSwzFGt+6isZIXCacZWFoKPQ+U
 K9Wg==
X-Gm-Message-State: AOAM533lIH4ov3/o55a/xKy+UnsNanlGlg2F6aX8Y+uOsvnquJFNpTnw
 O3Xa4tr3cfNhK8Jj98gaOGMYdw==
X-Google-Smtp-Source: ABdhPJxEijFR2ADtO2dJpv7+eOnsj3GAeQVvJQZsu/Pn1kY2yGlTgcOn0LgYSwuqCOLhd8P+Pi4JPg==
X-Received: by 2002:a05:6a00:23d0:: with SMTP id
 g16mr3889078pfc.19.1644436367723; 
 Wed, 09 Feb 2022 11:52:47 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id pi9sm7744343pjb.46.2022.02.09.11.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 11:52:47 -0800 (PST)
Date: Wed, 9 Feb 2022 19:52:43 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Subject: Re: [PATCH v3 2/5] Partially revert "KVM: Pass kvm_init()'s opaque
 param to additional arch funcs"
Message-ID: <YgQbi1VcxA5OTo77@google.com>
References: <20220209074109.453116-1-chao.gao@intel.com>
 <20220209074109.453116-3-chao.gao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220209074109.453116-3-chao.gao@intel.com>
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
 David Hildenbrand <david@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 Marc Zyngier <maz@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, Dave Hansen <dave.hansen@linux.intel.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, kevin.tian@intel.com,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Atish Patra <atishp@atishpatra.org>,
 tglx@linutronix.de, Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, James Morse <james.morse@arm.com>,
 kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>,
 pbonzini@redhat.com, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 09, 2022, Chao Gao wrote:
> This partially reverts commit b99040853738 ("KVM: Pass kvm_init()'s opaque
> param to additional arch funcs") remove opaque from
> kvm_arch_check_processor_compat because no one uses this opaque now.
> Address conflicts for ARM (due to file movement) and manually handle RISC-V
> which comes after the commit.
> 
> And changes about kvm_arch_hardware_setup() in original commit are still
> needed so they are not reverted.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>
