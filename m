Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E69C21E1AED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 08:01:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WNcn0XK9zDqNP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 16:01:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WNZp2Jx7zDqLD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 15:59:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=dr7/DCW1; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 49WNZn11tSz9sRY; Tue, 26 May 2020 15:59:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1590472769; bh=UvsMjZEYjC+bU7cDuBcQ49xsO8s4tc7S4Vm5YquVl3s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dr7/DCW1ueRx4rYAQYErFOviGddLWKlo5BpU5HFciy9CJet5sWJEf2BjRFaWIfdr8
 exnM7o9NB/Edk/VdBss9/EVVuN4f8bDfV11zfFBbmNSYetArbeqDrPhOe9n7g0jy2w
 jPlaaGtU/Bys9q0B1FhwBdGuQzbxpZlMef7Omzw1nQCaKfe0sUl0HzmqRRaLXCiNsq
 9mwubjD8MVwaThkdXmLYOSbANn8EQAl66FmLO02dquKK/12GEHaZ8qqqsY5MwEIHvQ
 CTVrP2oC3cIqV5tanqXHRykuANp24K+isJl9f5Ks+0pA8PSIeFjFgqi3fPTEglfkPk
 PJf2vvuHBAlag==
Date: Tue, 26 May 2020 15:49:50 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: Re: [PATCH v4 4/7] KVM: PPC: clean up redundant 'kvm_run' parameters
Message-ID: <20200526054950.GC282305@thinks.paulus.ozlabs.org>
References: <20200427043514.16144-1-tianjia.zhang@linux.alibaba.com>
 <20200427043514.16144-5-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427043514.16144-5-tianjia.zhang@linux.alibaba.com>
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
Cc: wanpengli@tencent.com, kvm@vger.kernel.org, david@redhat.com,
 heiko.carstens@de.ibm.com, peterx@redhat.com, linux-mips@vger.kernel.org,
 hpa@zytor.com, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 frankja@linux.ibm.com, chenhuacai@gmail.com, maz@kernel.org, joro@8bytes.org,
 x86@kernel.org, borntraeger@de.ibm.com, mingo@redhat.com,
 julien.thierry.kdev@gmail.com, thuth@redhat.com, gor@linux.ibm.com,
 suzuki.poulose@arm.com, kvm-ppc@vger.kernel.org, bp@alien8.de,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, jmattson@google.com,
 tsbogend@alpha.franken.de, cohuck@redhat.com, christoffer.dall@arm.com,
 sean.j.christopherson@intel.com, linux-kernel@vger.kernel.org,
 james.morse@arm.com, pbonzini@redhat.com, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 27, 2020 at 12:35:11PM +0800, Tianjia Zhang wrote:
> In the current kvm version, 'kvm_run' has been included in the 'kvm_vcpu'
> structure. For historical reasons, many kvm-related function parameters
> retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time. This
> patch does a unified cleanup of these remaining redundant parameters.
> 
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>

This looks OK, though possibly a little larger than it needs to be
because of variable name changes (kvm_run -> run) that aren't strictly
necessary.

Reviewed-by: Paul Mackerras <paulus@ozlabs.org>
