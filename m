Return-Path: <linuxppc-dev+bounces-6478-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82538A4516F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 01:27:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2b0C3Nw6z30Vl;
	Wed, 26 Feb 2025 11:27:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740529659;
	cv=none; b=VHo+YhMCECAUPfFFAtzz2zua7+eAe8Wc9dXz/c6ncTf7VpYlQ2dFX0P8hjJJZylHT2nN2H4argsFx2IvvOXNe12LH0+GzS7+/HXbr3XuUx0B4Ui4XtNMjlgYOQdPToBD/Kmqvf2WnUjZjqhgq3pluVSvQu8bY+I/F2u5wOLF3iOqYyehtKwaaGJL2iDPcbpXtT1QYG+oPMX+9awYj57PcBN0BNTn6Jq4iiDiopapCRX0Tjp01/Tvrey+pulq9/g/vxiqVQM7vkrxePRdiVEskIHm0kIIB0PW3dY0aQ1DESAidF3u9mA63EjsJvnrlCfT8vPeKsNNg7jG+TjWpQPZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740529659; c=relaxed/relaxed;
	bh=HAdIv23vtdyhU1Wievr5YncZEjjI/nIoxYj3wcoEoAc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RoFM7l4eeqVUp8yDJxQ+AZt9jlY/JxxetGYWYIL5Gzf9M5G1bpTD2DfJ8O3IUKSuoxax1RC6lX+rTKRPappVvqJvwgJF28GUb5BgUqBcVqH0gHUBFKOJlBIwWhq3WeI7Hjz+leOPUUqHvWBuMn+cvqGhJsOI0O0v+6EGrlnPC3NYEOUqWRab5/xO/ij4rep1GTFQ8UEHgyoPSzehtma7QDHrRYSbP4lu3SVGMNlj4xaaYsU1N3mK6+jRhsxExyaokNhr3VC6NMHqBbvqX0kO30U3j0HFSf2OB7cZkvZSFnOpNVTlpfA9fMzDkchMRdJWh1QElqjA9f4BO+/7pAlxFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=EkIguID5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=39v--zwykdpimyuhdwaiiafy.wigfchorjjw-xypfcmnm.itfuvm.ila@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=EkIguID5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=39v--zwykdpimyuhdwaiiafy.wigfchorjjw-xypfcmnm.itfuvm.ila@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2b094vGSz2y33
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 11:27:36 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2fc1eadf5a8so13254879a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 16:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740529653; x=1741134453; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HAdIv23vtdyhU1Wievr5YncZEjjI/nIoxYj3wcoEoAc=;
        b=EkIguID5CyngDR6gwY24t2kPewqz0F5JoZY/5Z/hAk4O/8UfLMFAGjIZj5R7BY0oQA
         gVsZIcuIPTo6fj7SqWa4K4nyYd+jS4VyjxI/SDTs4N7yuDXOfvp/NmHT2ngkrpRXFXjZ
         s+yMvrM1bozkvW+BEF21iKw0M/w24drnmhjB1LRDMn6BYsx8nozXIGRzdkRtpBTd9R7+
         xSxGAHLgJcoCX6nkk09IsLRsNtR9wtckfRCgapUsp6+LdpNZXQCSfdc1I/3QTlFoCOAq
         AELQZQZrZj69jKaOlvlzWNvqpfowyrsgmo+f4abhoyF2uFXISNtKeD8HdcoqNWbWUjqh
         eS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740529653; x=1741134453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HAdIv23vtdyhU1Wievr5YncZEjjI/nIoxYj3wcoEoAc=;
        b=cFXK8tV14UUtLITfqpQHOQ1LyuP4tFGs01geUq2KpDYvJKmW7CiuNNPjIHkwbl/g8/
         NmcuDBCn8oh1un65b21OuexzCUS2PmMzkAaMEQcLCmIHqVNSAXtj8UviAjkZD3GykcDv
         G+w/JTipU7PXdsOM+g/oUYBJEAPmzp10inuwB17xeso2md0M17lWB2QQrJwdyMOMNFeS
         xMenFHe8GVlwPvjvOyoqwRTVAsAbe2Z/vc/EyI4bwQUEZEmsOr+QOXJt9V8rTjKjOHEh
         l6iM7T2SiHfX+65ZR576D3IRbUOzh95FarpbcF3YEy+Q3Tzn8k6yPFF1e4g/OOUkWZrd
         PvFw==
X-Forwarded-Encrypted: i=1; AJvYcCXHHrwriIs844man0I4XDPZwGcyq3kYa7ER6gKBtY9bN3NyGUrpBybYyVMVbceS9hTqvdf+NnBx7LunAfA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwenRh4iTqqwAxFDUlXW8HHLuEIzzwafe2WeWyeC4n+JWJqddsw
	ucu/fYXbO4+Th2HGrWbx+i5wodENMzoX9/1IRfffBLctA8ZBaKufKaDnQKV13+C89mUgtu+ruBA
	2ZA==
X-Google-Smtp-Source: AGHT+IHOUZMQJO44VDHKi6ofhJ07QZ2dZ6izn0Wyr9X1ZaSMCJ5d0/qSAVcldTsRp+dWt1bBYLTGrWWvHEg=
X-Received: from pjbsb8.prod.google.com ([2002:a17:90b:50c8:b0:2d8:8340:8e46])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5483:b0:2ee:f076:20f1
 with SMTP id 98e67ed59e1d1-2fe7e218ab9mr2765842a91.0.1740529653271; Tue, 25
 Feb 2025 16:27:33 -0800 (PST)
Date: Tue, 25 Feb 2025 16:27:32 -0800
In-Reply-To: <6475f9c7-304a-4e0b-8000-3dc5c8e718e9@redhat.com>
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
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com> <20250224235542.2562848-2-seanjc@google.com>
 <6475f9c7-304a-4e0b-8000-3dc5c8e718e9@redhat.com>
Message-ID: <Z75f9GuA9NfKo37c@google.com>
Subject: Re: [PATCH 1/7] KVM: x86: Free vCPUs before freeing VM state
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Aaron Lewis <aaronlewis@google.com>, 
	Jim Mattson <jmattson@google.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Feb 26, 2025, Paolo Bonzini wrote:
> On 2/25/25 00:55, Sean Christopherson wrote:
> > Free vCPUs before freeing any VM state, as both SVM and VMX may access
> > VM state when "freeing" a vCPU that is currently "in" L2, i.e. that needs
> > to be kicked out of nested guest mode.
> > 
> > Commit 6fcee03df6a1 ("KVM: x86: avoid loading a vCPU after .vm_destroy was
> > called") partially fixed the issue, but for unknown reasons only moved the
> > MMU unloading before VM destruction.  Complete the change, and free all
> > vCPU state prior to destroying VM state, as nVMX accesses even more state
> > than nSVM.
> 
> I applied this to kvm-coco-queue, I will place it in kvm/master too unless
> you shout.

Depends on what "this" is :-)

My plan/hope is to land patches 1 and 2 in 6.14, i.e. in kvm/master, but the
rest are firmly 6.15 IMO.  And based on Yan's feedback, I'm planning on adding a
few more cleanups (though I think they're fully additive, i.e. can go on top).

