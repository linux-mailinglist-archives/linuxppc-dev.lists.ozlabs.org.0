Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 349DD63E71E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 02:35:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMzDL007bz3bgF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 12:35:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YdJk8dQ+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=robert.hu@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YdJk8dQ+;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMzCM20Pvz3bNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 12:34:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669858495; x=1701394495;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YopNAk0o4R/Gm+eGMQdhkQKi75mYgT2RAg4YlRHu29c=;
  b=YdJk8dQ+bFNpu6TynNStDvk8+cOrTPjLupAc6Q2Xic5XJWp6wT/yh0n/
   zCgAcKHz6VQuSyM2uiFzQGRNZ2gbMY/kclLqkgYuwEj7sDpmbyi33gbS/
   ljsRWKKlkjjE/KvtOtkHsheL2o5KfjzdYSPSjtwyovUBz9yCp/Qljr5Wz
   U29OAyDSbpyTvSbB+emkLAUllKf3XpFLdy0xEXgkQVOuH/T5ZgppLzXBw
   +SFqzUlNwo6IHgrOn2Rq20OdYXCwS3XVkdhPUBFjsjWg6ouRxm73QuJB/
   7r8yWnGdyZEQTo3fOwC62K+chWC+pEQx/LbvwvddP85dJKk/8WJyY32h4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="313186495"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="313186495"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 17:34:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="707875700"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="707875700"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org) ([10.239.48.212])
  by fmsmga008.fm.intel.com with ESMTP; 30 Nov 2022 17:34:38 -0800
Message-ID: <ceb3bb1e98a3933c3bf34641d731c69b67d761b4.camel@linux.intel.com>
Subject: Re: [PATCH 32/44] KVM: x86: Unify pr_fmt to use module name for all
 KVM modules
From: Robert Hoo <robert.hu@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Date: Thu, 01 Dec 2022 09:34:37 +0800
In-Reply-To: <Y4fg+MO2DusqMSZO@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-33-seanjc@google.com>
	 <ff0e8701d02ee161d064f92c8b742c2cc061bce0.camel@linux.intel.com>
	 <Y20r2NR9MaBbOGLn@google.com> <Y4fg+MO2DusqMSZO@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Yuan Yao <yuan.yao@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Chao Gao <chao.gao@intel.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, 
 linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-11-30 at 23:02 +0000, Sean Christopherson wrote:
> On Thu, Nov 10, 2022, Sean Christopherson wrote:
> > On Thu, Nov 10, 2022, Robert Hoo wrote:
> > > After this patch set, still find some printk()s left in
> > > arch/x86/kvm/*,
> > > consider clean all of them up?
> > 
> > Hmm, yeah, I suppose at this point it makes sense to tack on a
> > patch to clean
> > them up.
> 
> Actually, I'm going to pass on this for now.  The series is already
> too big.  I'll
> add this to my todo list for the future.

That's all right, thanks for update.

