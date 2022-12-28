Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 752236575E2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Dec 2022 12:23:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NhpzX2thxz3c23
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Dec 2022 22:23:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bkySoNrE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bkySoNrE;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nhpyd5CSDz3bYW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Dec 2022 22:22:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1D2C46136E;
	Wed, 28 Dec 2022 11:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C988C433EF;
	Wed, 28 Dec 2022 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672226533;
	bh=g/ko60RCUy62mgwJX+BHqh4+FybNochgcGqfnbFgn1s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bkySoNrEPygYgl5QF2mbRvdQP90/TfV81MHuS96aaZXlQcngUJ3MnPH6eA7QDx4Th
	 9qys9DmCGwyeY+hU2x+2CaIsq4ffMaWs2Andkc5MUnCRyhe2gJL1UT52VEPs78jq5D
	 4F1Tuo0nQj1sMGDBh/MID5iNoErPu3cmtJOLrAi9mragNuaOC3UExlhvrMtXFgnRzt
	 wrjQrwIdzHmXG2C/xHTzuK1MlUOE4h7gPaZmWOD7ADqmpxfpX3FjjQu/1lKSa6NQ2/
	 OpnrZhXA+oWI8B3m33i+IQsklsKqkL22FNLezHwLuMeZmbP3lDV+wqKLg9C8uYzdJ+
	 KTTyjywJXPOvw==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1pAUVf-00FXTE-4f;
	Wed, 28 Dec 2022 11:22:11 +0000
MIME-Version: 1.0
Date: Wed, 28 Dec 2022 11:22:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 00/50] KVM: Rework kvm_init() and hardware enabling
In-Reply-To: <20221227130249.1650197-1-pbonzini@redhat.com>
References: <20221227130249.1650197-1-pbonzini@redhat.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9acea262dec3511e9cf63081506f0bd7@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, seanjc@google.com, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, mjrosato@linux.ibm.com, farman@linux.ibm.com, vkuznets@redhat.com, dwmw2@infradead.org, paul@xen.org, james.morse@arm.com, alexandru.elisei@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, atishp@atishpatra.org, david@redhat.com, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, yuan.yao@intel.com, cohuck@redhat.com, isaku.yamahata@intel.com, philmd@linaro.org, farosas@linux.ibm.com, mpe@ellerman.id.au, kai.huang@intel.com, chao.gao@intel.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>, Yuan Yao <yuan.yao@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Kai Huang <kai.huang@intel.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.i
 nfradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-12-27 13:02, Paolo Bonzini wrote:
> Queued, thanks.  I will leave this in kvm/queue after testing 
> everything
> else and moving it to kvm/next; this way, we can wait for test results
> on other architectures.

Can you please make this a topic branch, and if possible based
on a released -rc? It would make it a lot easier for everyone.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
