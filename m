Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EF1764456
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 05:28:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QYwp38ru;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBGSN3x17z3cBh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 13:28:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QYwp38ru;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=yilun.xu@intel.com; receiver=lists.ozlabs.org)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBGRR1M3lz2yLV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 13:27:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690428451; x=1721964451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zZw7shzyeqWcwUz/3pXk4wTr0ManqzTTZSighI1zgHU=;
  b=QYwp38ru5vaEnfOf8iHpXcpOwAz80YSBO+ViO+VbXRm6wx7OUDG07Ly/
   7gDKoKvC9WCflij9CRdjvxYfjj8h9xJrZFAkIunVX9VzcbExzHruAl6rd
   pjExVdgR9x1EKfy1KtlvhEmEDKgQra2VbPR+0FlkB6fAHj9nboeuWkYaA
   u50Jbq9LqVEcqosMhF/6ymaAPqnFpvW9N4t07FK0luGbUF6ttB5rr8whN
   tkzviKCNc9CUmy8wMf4tnbpM+HDMDlFixCh7ripZzQbr1g0I9Wrra7eRX
   OSe/qBBiVkPcSWIXm+xiDW6bnBDfPPhZNfxojIS4ucR6JC4PwKyHxB5c0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="347799017"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; 
   d="scan'208";a="347799017"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 20:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="870179046"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2023 20:26:15 -0700
Date: Thu, 27 Jul 2023 11:24:22 +0800
From: Xu Yilun <yilun.xu@intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [RFC PATCH v11 08/29] KVM: Introduce per-page memory attributes
Message-ID: <ZMHjZvcmzxMhTyM3@yilunxu-OptiPlex-7050>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-9-seanjc@google.com>
 <ZL4BiQWihfrD0TOJ@yilunxu-OptiPlex-7050>
 <ZMFC+V6Llv1JWLEt@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMFC+V6Llv1JWLEt@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Paul Moore <paul@paul-moore.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver
  Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-07-26 at 08:59:53 -0700, Sean Christopherson wrote:
> On Mon, Jul 24, 2023, Xu Yilun wrote:
> > On 2023-07-18 at 16:44:51 -0700, Sean Christopherson wrote:
> > > +	if (WARN_ON_ONCE(start == end))
> > > +		return -EINVAL;
> > 
> > Also, is this check possible to be hit? Maybe remove it?
> 
> It should be impossible to, hence the WARN.  I added the check for two reasons:
> (1) to help document that end is exclusive, and (2) to guard against future bugs.

Understood. I'm good to it.
