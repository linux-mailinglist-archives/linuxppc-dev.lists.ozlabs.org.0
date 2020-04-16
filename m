Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 835361ABCA9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 11:19:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492twW2Zy1zDrRC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 19:19:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=cohuck@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=VaUzyh2O; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=VQToPFpF; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492sSz20b0zDqb9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 18:14:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587024858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFZ203bZj9/d1HrtvH0p9KqRawPq4JxwlKVrmFjPcis=;
 b=VaUzyh2OQLQMmH7h0Yc/uQMwKk1JimZCBFKJQlzxyX7U5mIQrRU0lW/FzW7RQ/HCheXmBo
 tAwGkbRVMeLmSHvmgghEP9qf8Z/kH8SMpkHPUL3aukQ1CADMG00w5xEFcycnUM0V2ry+TS
 RStEyjMG58fwyCBv92aw38It6WnT47I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587024859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFZ203bZj9/d1HrtvH0p9KqRawPq4JxwlKVrmFjPcis=;
 b=VQToPFpFhHJLOtnybq7CQ9W0e2SJBgs1ZdXNMP4Y8UsXSmhUzSuJofoDyPBDULofGUyQqf
 JCHo10YqZe/Syw4h2JZGiqZcMahrGaKk70ackgxXSi5PA/BwssgMfB7WWRJSKvTKDlPlE2
 UwBs1I5EuZM3WxVcGlCCtdQ9VSAnhj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-tZrY3pJgMBy2TZZWxU1zqg-1; Thu, 16 Apr 2020 04:11:08 -0400
X-MC-Unique: tZrY3pJgMBy2TZZWxU1zqg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93AD81005509;
 Thu, 16 Apr 2020 08:11:03 +0000 (UTC)
Received: from gondolin (ovpn-112-234.ams2.redhat.com [10.36.112.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 734275DA7B;
 Thu, 16 Apr 2020 08:10:49 +0000 (UTC)
Date: Thu, 16 Apr 2020 10:10:47 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: Re: [PATCH v2] KVM: Optimize kvm_arch_vcpu_ioctl_run function
Message-ID: <20200416101047.1cb9693c.cohuck@redhat.com>
In-Reply-To: <20200416051057.26526-1-tianjia.zhang@linux.alibaba.com>
References: <20200416051057.26526-1-tianjia.zhang@linux.alibaba.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mailman-Approved-At: Thu, 16 Apr 2020 19:18:11 +1000
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
 frankja@linux.ibm.com, maz@kernel.org, joro@8bytes.org, x86@kernel.org,
 borntraeger@de.ibm.com, mingo@redhat.com, julien.thierry.kdev@gmail.com,
 thuth@redhat.com, gor@linux.ibm.com, suzuki.poulose@arm.com,
 kvm-ppc@vger.kernel.org, bp@alien8.de, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, jmattson@google.com,
 tsbogend@alpha.franken.de, christoffer.dall@arm.com,
 sean.j.christopherson@intel.com, linux-kernel@vger.kernel.org,
 james.morse@arm.com, pbonzini@redhat.com, vkuznets@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Apr 2020 13:10:57 +0800
Tianjia Zhang <tianjia.zhang@linux.alibaba.com> wrote:

> In earlier versions of kvm, 'kvm_run' is an independent structure
> and is not included in the vcpu structure. At present, 'kvm_run'
> is already included in the vcpu structure, so the parameter
> 'kvm_run' is redundant.
> 
> This patch simplify the function definition, removes the extra

s/simplify/simplifies/

> 'kvm_run' parameter, and extract it from the 'kvm_vcpu' structure

s/extract/extracts/

> if necessary.
> 
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> ---
> 
> v2 change:
>   remove 'kvm_run' parameter and extract it from 'kvm_vcpu'
> 
>  arch/mips/kvm/mips.c       |  3 ++-
>  arch/powerpc/kvm/powerpc.c |  3 ++-
>  arch/s390/kvm/kvm-s390.c   |  3 ++-
>  arch/x86/kvm/x86.c         | 11 ++++++-----
>  include/linux/kvm_host.h   |  2 +-
>  virt/kvm/arm/arm.c         |  6 +++---
>  virt/kvm/kvm_main.c        |  2 +-
>  7 files changed, 17 insertions(+), 13 deletions(-)
> 

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

