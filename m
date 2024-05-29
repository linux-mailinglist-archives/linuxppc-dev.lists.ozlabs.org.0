Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 56F5B8D36F3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 15:01:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=XTueE6Eb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq8Vd6dCJz79WX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 22:55:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=XTueE6Eb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3fcvxzgykdf0n95ie7bjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq8Tv1wb2z3gL3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 22:54:25 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-6658175f9d4so2000417a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 05:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716987260; x=1717592060; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1KVQFhVFh80Fdd96OAcePaAYKBvjrIO3JB8q5MbeFQU=;
        b=XTueE6EbKl4g8JQP3wK464wJsNTD2EolTD4cTuFi297ULHCBcXq6sqju7lAtnE3Jt6
         53fslLQNzUxSlqB6+uEfX2bWHAyffLLFPyQj1SCn9M7Ha2Wm/n6M3vA3Pvfqqi5U4aGT
         gRHrODxefRJir8rqeRmc9EZMa+zm2cC4MiOzlhv1rSIiwGvp6de18ILJ6rA4k9qwDK0r
         tjwVE36D5t9r4bjsMFyaUPhFoEnJmA5Be2xR1gInv6NaMFBIOI/SrTozuVTQx48TEvRD
         JkPQZZyH40ctm+N20F9iQdmmaHSCP+1+WgRlVkHl5jhWXzK3Qy72izUpSJ5K9wxAfk9o
         XuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716987260; x=1717592060;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1KVQFhVFh80Fdd96OAcePaAYKBvjrIO3JB8q5MbeFQU=;
        b=KuFsWEQEpV6+kPEBuRbNBpSalUbuD2Por0GnIVnthIZMuoekhwHCnrpO0Xll5bGLZK
         2gLe7MgAiOUr2LysMMfJ1owSFy9kviQZzs7RY2flL07aMJ6tIeTuj2XErizaV2Ap9Jcz
         TJ4zLpHcJRSaCQo2l8jP/n23QFlYRsd+x3iwTbW5JhJ/ppLwtDIWqRaZVexb5RSMFimv
         sTX6SRam7rA0rmZC3zl69fyJWrwM81y1fQx+tLQ7RMcW3Bu+Gr+/vn42ed9Pr3Nnkkn7
         W9Pb+7UjYLmP4XLkWbEOHnLkvTouxgCcXQOMeVCh5YWUGPR4VVUltOy2ZMD7Ssg7RML1
         vy+A==
X-Forwarded-Encrypted: i=1; AJvYcCVDg2FnZXw1gXnaz+Aah4iIHNDF9XC2yBrUfI5DRNhnfv1EkuxjeTD72PLDclH9YWRys69EYlk83O5NW6/lKScHKB9sRH6FaJBf+3cMCw==
X-Gm-Message-State: AOJu0YzJFeyOvuY1dxZIVlNNvnaF84+6ymRxzz1Baj0utkvEAnreH28o
	BQn6MguVNZ4JIKkgKm2LTdRJvv9DpRdPwKCqtEwJDc+6u380OIcXZW2fR3rY0M5IUVJPNwzbB17
	tPw==
X-Google-Smtp-Source: AGHT+IHBbZP8iE9LJoz88cSwyGPtf4IYoLcqAZBm04Syis1dHtNGwvMpLLvLxNB1S+GJVlzsrbdgQQ4xG0k=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:1421:0:b0:680:1ce8:ba9a with SMTP id
 41be03b00d2f7-681aea7d0ecmr40830a12.11.1716987260030; Wed, 29 May 2024
 05:54:20 -0700 (PDT)
Date: Wed, 29 May 2024 05:54:18 -0700
In-Reply-To: <2a221116a03f57dca8274b6bc2da7541b21d86bb.camel@intel.com>
Mime-Version: 1.0
References: <20240522014013.1672962-1-seanjc@google.com> <20240522014013.1672962-4-seanjc@google.com>
 <c77f3931-31b2-4695-bd74-c69cba9b96c1@intel.com> <ZlYte16cvQpPGHkx@google.com>
 <2a221116a03f57dca8274b6bc2da7541b21d86bb.camel@intel.com>
Message-ID: <ZlclevRvntUMYG6O@google.com>
Subject: Re: [PATCH v2 3/6] KVM: x86: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "anup@brainfault.org" 
 <anup@brainfault.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 29, 2024, Kai Huang wrote:
> I am not familiar with SVM, but it seems the relevant parts are:
> 
> 	control->pause_filter_count;
> 	vmcb_mark_dirty(svm->vmcb, VMCB_INTERCEPTS);
> 
> And it seems they are directly related to programming the hardware, i.e.,
> they got automatically loaded to hardware during VMRUN.

"control" is the control area of the VMCB, i.e. the above pause_filter_count is
equivalent to a VMCS field.

> They need to be updated in the SVM specific code when @ple_window_dirty is
> true in the relevant code path.
> 
> Anyway, even it is feasible and worth to do, we should do in a separate
> patchset.

Ya.
