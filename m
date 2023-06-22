Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5444473A219
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 15:43:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iYnepOSI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iYnepOSI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qn1mn1tPkz2xHK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 23:43:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iYnepOSI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iYnepOSI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mtosatti@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qn1lv4lD6z306B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 23:43:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687441385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eFmMS1U29te7tFKtgkPWLc+o83wVHmxe900XZpUTdy8=;
	b=iYnepOSIzWr1GHxURBZ1XbaiRubfW3OlD2ocjD09goe3ONWq1mLNbXTeQDhwtk29v7UUYf
	ne+PwshjBVzR5ZVWD/FZFmIRvV2MXL6IVgtTf4bLyCvnmMGOGm6XC7gVFj8kqeMTorgsfl
	/q3W9/zju8QDM/XVmGl3h0LM2Tvp9T4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687441385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eFmMS1U29te7tFKtgkPWLc+o83wVHmxe900XZpUTdy8=;
	b=iYnepOSIzWr1GHxURBZ1XbaiRubfW3OlD2ocjD09goe3ONWq1mLNbXTeQDhwtk29v7UUYf
	ne+PwshjBVzR5ZVWD/FZFmIRvV2MXL6IVgtTf4bLyCvnmMGOGm6XC7gVFj8kqeMTorgsfl
	/q3W9/zju8QDM/XVmGl3h0LM2Tvp9T4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-gHPWKO21MFaNd35SQfD9XQ-1; Thu, 22 Jun 2023 09:41:52 -0400
X-MC-Unique: gHPWKO21MFaNd35SQfD9XQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2FA8104458A;
	Thu, 22 Jun 2023 13:41:48 +0000 (UTC)
Received: from tpad.localdomain (ovpn-112-2.gru2.redhat.com [10.97.112.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FD83112132C;
	Thu, 22 Jun 2023 13:41:47 +0000 (UTC)
Received: by tpad.localdomain (Postfix, from userid 1000)
	id 7AF94400E05F5; Thu, 22 Jun 2023 09:47:22 -0300 (-03)
Date: Thu, 22 Jun 2023 09:47:22 -0300
From: Marcelo Tosatti <mtosatti@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 0/2] send tlb_remove_table_smp_sync IPI only to
 necessary CPUs
Message-ID: <ZJRC2s4sIuJ9V3A0@tpad>
References: <20230620144618.125703-1-ypodemsk@redhat.com>
 <20230621074337.GF2046280@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621074337.GF2046280@hirez.programming.kicks-ass.net>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Cc: geert+renesas@glider.be, david@redhat.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, paulmck@kernel.org, x86@kernel.org, linux@armlinux.org.uk, ppandit@redhat.com, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, keescook@chromium.org, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, aneesh.kumar@linux.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 21, 2023 at 09:43:37AM +0200, Peter Zijlstra wrote:
> On Tue, Jun 20, 2023 at 05:46:16PM +0300, Yair Podemsky wrote:
> > Currently the tlb_remove_table_smp_sync IPI is sent to all CPUs
> > indiscriminately, this causes unnecessary work and delays notable in
> > real-time use-cases and isolated cpus.
> > By limiting the IPI to only be sent to cpus referencing the effected
> > mm.
> > a config to differentiate architectures that support mm_cpumask from
> > those that don't will allow safe usage of this feature.
> > 
> > changes from -v1:
> > - Previous version included a patch to only send the IPI to CPU's with
> > context_tracking in the kernel space, this was removed due to race 
> > condition concerns.
> > - for archs that do not maintain mm_cpumask the mask used should be
> >  cpu_online_mask (Peter Zijlstra).
> >  
> 
> Would it not be much better to fix the root cause? As per the last time,
> there's patches that cure the thp abuse of this.

The other case where the IPI can happen is:

CPU-0                                   CPU-1

tlb_remove_table
tlb_remove_table_sync_one
IPI
                                        local_irq_disable
                                        gup_fast
                                        local_irq_enable


So its not only the THP case.

