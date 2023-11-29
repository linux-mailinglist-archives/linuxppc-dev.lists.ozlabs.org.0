Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A907FDF59
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 19:32:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=eIbAU6S9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgSbM4jkxz3dRZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 05:31:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=eIbAU6S9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3ainnzqykdd8tfbokdhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgSZQ4JPPz3cmw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 05:31:08 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5d1b431fa7bso1079587b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 10:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701282665; x=1701887465; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c1rLIdwfJP37garEzWHrWFHBXDQvp3tQ1Ff7Pa+0bvQ=;
        b=eIbAU6S90EqlCKoTBjdeejiManA+bdgwwnHKtfU/IzNA6VqzlYKYs6oqJLCQ0ayDtX
         +p+sG0uVg6dgXUoECGeZZJSBPkIm6LesvdEYED82IdHY9KOmYdNWBnNsoz94664ISSQy
         4yJao3hsgzDX7x9qCxYoWjxYmzqSVWxGTsvY7b1HThUN9Xdhz/KeBxc1Iwp++SXsQatQ
         DKpBwp+SkWn2uaro4L6mOB5Wr/DupsK34Zo0nXV1ECDMBQp9kyrihm/qEVmbX7+yhjcH
         bJWpZBr6f1JG0zkGwZg1xY28Q0c2O8Mjme89eCjDX4GKfEQAyBL0oMkwdQCNjLAWrkCZ
         Jk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701282665; x=1701887465;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1rLIdwfJP37garEzWHrWFHBXDQvp3tQ1Ff7Pa+0bvQ=;
        b=vGtPfiPEZ3R0ATTYm+TEvt4s6xXDYdT4fBzNjEhKwG2o1mzc88CkGDoffooUuOAmuT
         4cV1jHwJgpZrJmFT0KdRg32iD/1Khh5CxEnXH8UET/KSI0yIIzATcXZTPvVNFIfU2xAZ
         gmlv8G08ppmgrEdOw0gvZ9yAPPwDwI+ggu156Ph6UTed3p1Quwybnl5jovXsmYoQgU0o
         yWKqFfTI18ZRluov7WdP9etMgx24WSJOmgIAbIEzux19uAmdxpvBlFUNS93C4cxRuRs6
         JMXiuQ87WWiV9zB6A72El57tEUjucYz1gcNBqyNjqb3GLs2Xzm+l6qTk3yeCEeCb8eld
         Llxw==
X-Gm-Message-State: AOJu0YyZr3XHzyOa8kwr8xVSl9lcCi0ntl796a1hrMHZCo18s00lU931
	aESVjsZ9/hS7BhUSOADauN9WChL3TMU=
X-Google-Smtp-Source: AGHT+IHxpKv+Onni3jsljSwKzH8uXIhuxnoTBESUxuFhb+PRCSSwYQqIrFh/Htrp8TEW9pXbXT6mJDicqaY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:480d:b0:5ce:a88:8436 with SMTP id
 hc13-20020a05690c480d00b005ce0a888436mr522497ywb.10.1701282664859; Wed, 29
 Nov 2023 10:31:04 -0800 (PST)
Date: Wed, 29 Nov 2023 10:31:03 -0800
In-Reply-To: <20231129124821.GU436702@nvidia.com>
Mime-Version: 1.0
References: <0-v1-08396538817d+13c5-vfio_kvm_kconfig_jgg@nvidia.com>
 <87edgy87ig.fsf@mail.lhotse> <ZWagNsu1XQIqk5z9@google.com> <20231129124821.GU436702@nvidia.com>
Message-ID: <ZWeDZ76VkRMbHEGl@google.com>
Subject: Re: Ping? Re: [PATCH rc] kvm: Prevent compiling virt/kvm/vfio.c
 unless VFIO is selected
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Sven Schnelle <svens@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 29, 2023, Jason Gunthorpe wrote:
> On Tue, Nov 28, 2023 at 06:21:42PM -0800, Sean Christopherson wrote:
> > diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> > index 454e9295970c..a65b2513f8cd 100644
> > --- a/include/linux/vfio.h
> > +++ b/include/linux/vfio.h
> > @@ -289,16 +289,12 @@ void vfio_combine_iova_ranges(struct rb_root_cached *root, u32 cur_nodes,
> >  /*
> >   * External user API
> >   */
> > -#if IS_ENABLED(CONFIG_VFIO_GROUP)
> >  struct iommu_group *vfio_file_iommu_group(struct file *file);
> > +
> > +#if IS_ENABLED(CONFIG_VFIO_GROUP)
> >  bool vfio_file_is_group(struct file *file);
> >  bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
> >  #else
> > -static inline struct iommu_group *vfio_file_iommu_group(struct file *file)
> > -{
> > -       return NULL;
> > -}
> > -
> >  static inline bool vfio_file_is_group(struct file *file)
> >  {
> >         return false;
> > 
> 
> So you symbol get on a symbol that can never be defined? Still says to
> me the kconfig needs fixing :|

Yeah, I completely agree, and if KVM didn't already rely on this horrific
behavior and there wasn't a more complete overhaul in-flight, I wouldn't suggest
this.

I'll send the KVM Kconfig/Makefile cleanups from my "Hide KVM internals from others"
series separately (which is still the bulk of the series) so as to prioritize
getting the cleanups landed.
