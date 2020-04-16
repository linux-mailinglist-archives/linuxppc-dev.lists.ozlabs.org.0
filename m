Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7831ABC50
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 11:12:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492tmP6ysNzDqnG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 19:12:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=NAw/DPQ2; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492tSB62XZzDqhS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 18:58:50 +1000 (AEST)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 84BF220784;
 Thu, 16 Apr 2020 08:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587027527;
 bh=dVAp91Tj6hWWtUY7tL+aLgKkZ276mvf5MWRT7goV5sk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NAw/DPQ2vN2rzJzmUreAA38rnfxIXX3BUID+0uehW0Z9v4f/Ntd1a7JWQHTF+uDMv
 4tUi3XdV3gd/0EuPpoon9MJXibqbgTfuDttD3xyfrTBNZAOlFyJ4cRJ6Z+sHqArQUT
 PeqbbpCCaPZTxxeljv/xMr+adoczGliqtOh0MmEk=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jP0M9-003lwb-Tr; Thu, 16 Apr 2020 09:58:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Thu, 16 Apr 2020 09:58:45 +0100
From: Marc Zyngier <maz@kernel.org>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: Re: [PATCH v2] KVM: Optimize kvm_arch_vcpu_ioctl_run function
In-Reply-To: <8b92fb5b-5138-0695-fb90-6c36b8dfad00@linux.alibaba.com>
References: <20200416051057.26526-1-tianjia.zhang@linux.alibaba.com>
 <878sivx67g.fsf@vitty.brq.redhat.com>
 <1000159f971a6fa3b5bd9e5871ce4d82@kernel.org>
 <8b92fb5b-5138-0695-fb90-6c36b8dfad00@linux.alibaba.com>
Message-ID: <b700f9bde1218b217ca4e571b1d29c1e@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.10
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: tianjia.zhang@linux.alibaba.com, vkuznets@redhat.com,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com,
 tsbogend@alpha.franken.de, paulus@ozlabs.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 david@redhat.com, cohuck@redhat.com, heiko.carstens@de.ibm.com,
 gor@linux.ibm.com, sean.j.christopherson@intel.com, wanpengli@tencent.com,
 jmattson@google.com, joro@8bytes.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, x86@kernel.org, hpa@zytor.com, james.morse@arm.com,
 julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
 christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: christoffer.dall@arm.com, wanpengli@tencent.com, kvm@vger.kernel.org,
 david@redhat.com, heiko.carstens@de.ibm.com, peterx@redhat.com,
 linux-kernel@vger.kernel.org, hpa@zytor.com, kvmarm@lists.cs.columbia.edu,
 linux-s390@vger.kernel.org, frankja@linux.ibm.com, joro@8bytes.org,
 x86@kernel.org, borntraeger@de.ibm.com, mingo@redhat.com,
 julien.thierry.kdev@gmail.com, thuth@redhat.com, gor@linux.ibm.com,
 suzuki.poulose@arm.com, kvm-ppc@vger.kernel.org, bp@alien8.de,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, jmattson@google.com,
 tsbogend@alpha.franken.de, cohuck@redhat.com, linux-mips@vger.kernel.org,
 sean.j.christopherson@intel.com, james.morse@arm.com, pbonzini@redhat.com,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-04-16 09:45, Tianjia Zhang wrote:
> On 2020/4/16 16:28, Marc Zyngier wrote:

[...]

>> Overall, there is a large set of cleanups to be done when both the 
>> vcpu and the run
>> structures are passed as parameters at the same time. Just grepping 
>> the tree for
>> kvm_run is pretty instructive.
>> 
>>          M.
> 
> Sorry, it's my mistake, I only compiled the x86 platform, I will
> submit patch again.

Not a mistake. All I'm saying is that there is an opportunity for a 
larger
series that cleans up the code base, rather than just doing a couple of
localized changes.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
