Return-Path: <linuxppc-dev+bounces-13122-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB14BF7CB9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 18:56:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crdjj0S1rz304H;
	Wed, 22 Oct 2025 03:56:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761065784;
	cv=none; b=XG6c42aj+XHauC3X7sp92XEqn9aBCBWd9cYyKVq4Aq/KlrIjUJQ4zpe3QNJgFx83cIVGaWzMLU6Pb7I6gh/EPXHAUe/lo5y/l5eFp7XNMhays7Yt8bSZsfIscbJi1wwJjqlpBNZPagZewWN6Rdt6YIj+tyVWr9qZ6HgBob2B+A2AUGBvrSiFmWGOL+f0OScck17WJHlif+YMj3NyjkeApMHc7JrVVAyZd0uQtn+2TxKPGIkadvo1mi8lPxF7nTA/Taa9hEXlJipwFUNuNhy9K4xvgUEZCnlNd8gueEXv+ZVMlRZHvySnkxdBatrOsaymQ34j+Y/L8utKBBLmth3KqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761065784; c=relaxed/relaxed;
	bh=QUj6Jzqtl7pAwgzbknudC50aTFamgZNMeXgKkiBAGZE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eRGUE+vmr0CIrys8ZBQAp4+i5UCOcZGqD2IOHeh+CXQGLEMDvQpjmLDgMsrJNqxEeE+ThCCuwaOFcuERA515xS58IfrNUUbbyRDM9efXY/fWeoY5PKhEuax0LV44vQOodsDsInIiQ8iJoCuF1zAbcK0Ug2tmNjhh+Qe3x8p1Vgb5rZpQbt0lrx7cL88z4NikHYC0re/cBue8JFlVSyeI4Uj2Le+mcVzOc2//W5P0BhXy0pSK6cYyvB1rfG4FN+YbTX2JHXSYvQCKpSgTjIywqkQfC+mEuODHUcfBpf6a24n/4ygPpvYCKlGqbeRzBNifcSEYNuHXQoISIaJkT8mMlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=iY4QfrXF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3nlv3aaykdncl73gc59hh9e7.5hfebgnqii5-67oeblml.hse34l.hk9@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=iY4QfrXF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3nlv3aaykdncl73gc59hh9e7.5hfebgnqii5-67oeblml.hse34l.hk9@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crdjh08H3z2yqf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 03:56:23 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-290e4fade70so43549805ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 09:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761065781; x=1761670581; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QUj6Jzqtl7pAwgzbknudC50aTFamgZNMeXgKkiBAGZE=;
        b=iY4QfrXFtDCiIL+wkGnRbE92JttPezLmTsaXGAvL3x3csNQkWY08PUSua0GC1cCmxo
         agIwEqwGv0POIZZ9dm4ZVC/0JdXZTbGAy6i8Y1P8Jhr8Vw6q2QF3dOa30NRQhp+FG/Lc
         xdgBOo3Lix7H07RI9v5N9WZfJPIkSTVjzL6KdSx0ELlCvIIUR7L4X7/EwFfbygWymzAV
         bK3aZzxVtGcbFUjwbPFEcy94oRgQnUekqQntcfcDiuOEwdAo7zSJdRsvDkmgDPwfaSSn
         23P8S/77+cuqNf1eQNGwGPKJFp4JYx3BDwsQCaqFw9uNRcsmHT9uSNuLCu3JEpcHESLm
         w/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761065781; x=1761670581;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUj6Jzqtl7pAwgzbknudC50aTFamgZNMeXgKkiBAGZE=;
        b=GA/WJEN4UhHGJW78at0e6ofJhnJwQlSYHKROy0A3iEMT+wUpsA5WsMR1MgCQBMM32H
         Dl5I1cYCwxV5imFDszSryFkCaTujbW4U4cXTQ7prU14slv16kv+KBX3miILSogipkscZ
         4WJJmeTCgW1sZptEjBGMG1ne/TPjXUA4WP4ib2X9HHXDL2y2SjhLWcZPnuIcXDsJdRbJ
         vlTLHe/ICSxlKMm4A5M/M5wQAr7BKAnV4Y/PRTCnkvC7obsRkbyJUuOrCB3mJi6GkMIU
         wwpBPjyaoanwpQmXOGaT2niFUDIfkeoUIdtH78McR6TXh8l+8EFIiftWXPBYCgiflMAu
         4enQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8WolL6pAxWSEY28EdL1fOh0AO/SrhKCnJelovb4RjHPz7JIvVMsuKX2MEviVysF4dZnw8Ltx7Q1T4WwI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz5EmJ0SLyuUHvR00ji0+hjJ1DXKovQSCW8ljHbKOh7F9uq4lvf
	oyA0spo3oFeUlUj3lnhsY4oPK4SrALEa+KgutIAIV1ZndFYAyvn7Q3LkHNYAwTMo6HmNrDgDptx
	XeHN5MA==
X-Google-Smtp-Source: AGHT+IGOqKmUzCbfjGYr8B2jY/C1mdIZnvxK8+ss+AVkwVotQdjiGEd+3SJ7VfMTaFoQGYSh7+8f99sR5n0=
X-Received: from pjre3.prod.google.com ([2002:a17:90a:b383:b0:33b:51fe:1a75])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e88e:b0:250:1c22:e78
 with SMTP id d9443c01a7336-290c9c89c9amr235880025ad.1.1761065780727; Tue, 21
 Oct 2025 09:56:20 -0700 (PDT)
Date: Tue, 21 Oct 2025 09:56:19 -0700
In-Reply-To: <d0b369c65e33518d57a40a70c0d13f70bd64db47.camel@intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-24-seanjc@google.com>
 <d0b369c65e33518d57a40a70c0d13f70bd64db47.camel@intel.com>
Message-ID: <aPe7M1aUPwqDmQbY@google.com>
Subject: Re: [PATCH v3 23/25] KVM: TDX: Use guard() to acquire kvm->lock in tdx_vm_ioctl()
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"kas@kernel.org" <kas@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, 
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "anup@brainfault.org" <anup@brainfault.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, "michael.roth@amd.com" <michael.roth@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	Vishal Annapurve <vannapurve@google.com>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 21, 2025, Rick P Edgecombe wrote:
> On Thu, 2025-10-16 at 17:32 -0700, Sean Christopherson wrote:
> > Use guard() in tdx_vm_ioctl() to tidy up the code a small amount, but more
> > importantly to minimize the diff of a future change, which will use
> > guard-like semantics to acquire and release multiple locks.
> > 
> > No functional change intended.
> 
> There is a tiny functional change. In the default case it no longer re-copies
> the struct back to userspace.

No?  The default case doesn't copy the struct back even before this patch, it
explicitly skips the copy_to_user().

	mutex_lock(&kvm->lock);

	switch (tdx_cmd.id) {
	case KVM_TDX_CAPABILITIES:
		r = tdx_get_capabilities(&tdx_cmd);
		break;
	case KVM_TDX_INIT_VM:
		r = tdx_td_init(kvm, &tdx_cmd);
		break;
	case KVM_TDX_FINALIZE_VM:
		r = tdx_td_finalize(kvm, &tdx_cmd);
		break;
	default:
		r = -EINVAL;
		goto out;  <====================
	}

	if (copy_to_user(argp, &tdx_cmd, sizeof(struct kvm_tdx_cmd)))
		r = -EFAULT;

out:
	mutex_unlock(&kvm->lock);
	return r;

