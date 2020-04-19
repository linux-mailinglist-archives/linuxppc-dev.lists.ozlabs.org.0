Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E6B1AF8C8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 10:36:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494jpX2GJdzDrMQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 18:36:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=xiaoyao.li@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 494jZZ6Kb8zDqZw
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 18:25:42 +1000 (AEST)
IronPort-SDR: 9ljG5qcgSn/2W0x7FM4mUMkqVteJDoOpNWBJOZ8y0y6NpNJQWTkANfmPVhi1VKvoKo8vX9iIEL
 7okiDFO81tnw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2020 01:24:28 -0700
IronPort-SDR: 5bTV3PMh/h/IpB7kLfIrzCg8Fo/mJzhnyaMGYARomkIW7rvbXCWMjVwZD/fKzDk1jnTpAU1Qxz
 1DLl94MlS5Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,402,1580803200"; d="scan'208";a="456070012"
Received: from xiaoyaol-mobl.ccr.corp.intel.com (HELO [10.255.30.120])
 ([10.255.30.120])
 by fmsmga006.fm.intel.com with ESMTP; 19 Apr 2020 01:24:20 -0700
Subject: Re: [PATCH] KVM: X86: Fix compile error in svm/sev.c
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, pbonzini@redhat.com,
 tsbogend@alpha.franken.de, paulus@ozlabs.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 david@redhat.com, cohuck@redhat.com, heiko.carstens@de.ibm.com,
 gor@linux.ibm.com, sean.j.christopherson@intel.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, maz@kernel.org, james.morse@arm.com,
 julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
 christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com
References: <20200419073047.14413-1-tianjia.zhang@linux.alibaba.com>
From: Xiaoyao Li <xiaoyao.li@intel.com>
Message-ID: <82ce1798-1dab-d271-d084-e9a89bb44e71@intel.com>
Date: Sun, 19 Apr 2020 16:24:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200419073047.14413-1-tianjia.zhang@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 19 Apr 2020 18:34:09 +1000
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/19/2020 3:30 PM, Tianjia Zhang wrote:
> The compiler reported the following compilation errors:
> 
> arch/x86/kvm/svm/sev.c: In function ‘sev_pin_memory’:
> arch/x86/kvm/svm/sev.c:361:3: error: implicit declaration of function
> ‘release_pages’ [-Werror=implicit-function-declaration]
>     release_pages(pages, npinned);
>     ^~~~~~~~~~~~~
> 
> The reason is that the 'pagemap.h' header file is not included.
> 

FYI.

Boris has sent the Patch:
https://lkml.kernel.org/r/20200411160927.27954-1-bp@alien8.de

and it's already in kvm master/queue branch



