Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1222248C942
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 18:22:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYvWR0Hm3z3bPD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 04:22:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UOi9kIvt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=UOi9kIvt; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYvVh3Djzz30NC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jan 2022 04:21:32 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id
 a1-20020a17090a688100b001b3fd52338eso5009619pjd.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 09:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TYHRM7+kADwOp9diBRrPGp4L0N1LoYL1IUvHa0nGaUc=;
 b=UOi9kIvtR/IrJwzo5niwxDtXudsV6IxInf5Xux8zgZWocQk2IEmaYc0XSVBraMOzip
 1p6oktTDeAT0Xo0Y1Hv38DXQkmSLxGT3a21Lcwuzm9HPptZ8CwyjAsbDUolqExCQJBvI
 3/Ilf2Jr3LSRwS8m0x3JSZhofT299fDyux/e4JRm1BTZb8xRszyzcX2IlMX1MSEgYjMT
 4xhdcYSj8HE0lJizFcqyvQ1F0sIsor9GOdwCIFkIY/f5YjDSO/UpiSWU7FnrM6Aap0Ov
 XAwRUtuXNr7yYBD4h8SO2lxl+txc3ZtlyhAeUA7I20RlONuBzpovIUUx1rYk6w6DmC66
 icRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TYHRM7+kADwOp9diBRrPGp4L0N1LoYL1IUvHa0nGaUc=;
 b=DsUG/eM22hPnfg1VbMWiwzsXB392lALmSASpA8VY0g8jRdOZqLwqYdPn0JdoD5tlJu
 vHJAYmzxnagdQeys3FQy8v0qJO/7g99zJ5zBTZJwsJFj4RqLdqf6ZjrXAuo03+dYMfLe
 zdGiWwDS2FeZ15NcHns+IZpuF0VNmRlglcdnGjH9H9Vb+5ahENJ7AatSWw7BgiVzL8V8
 8kkehXop0nRcJJNyqQLHbUfdodGR6Dxohd5/Tz2hwmvHpJVJOLvXC6MHsVdFNVPJc4SM
 6p1a3T0AhGyUWTTyuw1SP+4PUKCbch3aOICRQPRAgIawDBF1MgBzsHM5Lj/UdcVqUj7f
 8tZQ==
X-Gm-Message-State: AOAM533d1NQEjjyqZjV8CEd86xWy+SzoFOcWNs20PdNFOJKJYUQCoohe
 kHVQBD2Y8ykui22/YWcuHnYDfg==
X-Google-Smtp-Source: ABdhPJzFOOljTybPaAkOSjlPQwykizLUTnzjLoFkEgLqIZkrqe/Ahlwi51dGj1hKKqsANfiIKGdNKw==
X-Received: by 2002:a63:7845:: with SMTP id t66mr576433pgc.103.1642008090029; 
 Wed, 12 Jan 2022 09:21:30 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id qe10sm7011428pjb.5.2022.01.12.09.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 09:21:29 -0800 (PST)
Date: Wed, 12 Jan 2022 17:21:25 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Subject: Re: [PATCH 3/6] KVM: Remove opaque from
 kvm_arch_check_processor_compat
Message-ID: <Yd8OFT80exMeCMVA@google.com>
References: <20211227081515.2088920-1-chao.gao@intel.com>
 <20211227081515.2088920-4-chao.gao@intel.com>
 <Ydy8BCfE0jhJd5uE@google.com> <20220111031933.GB2175@gao-cwp>
 <Yd8N7PFqZbACzh2r@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yd8N7PFqZbACzh2r@google.com>
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
Cc: x86@kernel.org, Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 Marc Zyngier <maz@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, kevin.tian@intel.com,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Fabiano Rosas <farosas@linux.ibm.com>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 pbonzini@redhat.com, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 12, 2022, Sean Christopherson wrote:
> On Tue, Jan 11, 2022, Chao Gao wrote:
> > On Mon, Jan 10, 2022 at 11:06:44PM +0000, Sean Christopherson wrote:
> > >On Mon, Dec 27, 2021, Chao Gao wrote:
> > >> No arch implementation uses this opaque now.
> > >
> > >Except for the RISC-V part, this can be a pure revert of commit b99040853738 ("KVM:
> > >Pass kvm_init()'s opaque param to additional arch funcs").  I think it makes sense
> > >to process it as a revert, with a short blurb in the changelog to note that RISC-V
> > >is manually modified as RISC-V support came along in the interim.
> > 
> > commit b99040853738 adds opaque param to kvm_arch_hardware_setup(), which isn't
> > reverted in this patch. I.e., this patch is a partial revert of b99040853738
> > plus manual changes to RISC-V. Given that, "process it as a revert" means
> > clearly say in changelog that this commit contains a partial revert of commit
> > b99040853738 ("KVM: Pass kvm_init()'s opaque param to additional arch funcs").
> > 
> > Right?
> 
> What I meant is literally do
> 
>   git revert -s b99040853738
> 
> and then manually handle RISC-V.

Doh, to be clear, "manually handle RISC-V _in the same commit_".
