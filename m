Return-Path: <linuxppc-dev+bounces-358-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1BF95B848
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 16:24:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqQSQ6x83z2xks;
	Fri, 23 Aug 2024 00:24:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724336662;
	cv=none; b=ST1T648dV2vWA+lgSsSbZ+EUXxbPs/O44iCnQM7qUgXqeorhs5ql+Oz3+MP0BO7jJIZEQlppoXtUYfvcLUf+zay/Hd07+Ib+2Rcsis37KOq2tofDDQe6ptICZSBHRMHFHB4uEOGBtHRHj+tP4pflw0zpozmufGE1Sv1cZtOchndoNrPBdL2HZMeTKn9FRe42ZoHfUciW0prv80J9Jgz7OnXUbYE0VfSzospcl9ELxtKSCbtuQ9mNBP7dP+NdsryI/qupOJbtImePu0HaxAwtRqYltEJxY+/GjTGPn+Hfx1di2ZYac6ucRB3POf3hK4E2TYfsLa1pKrs29IkaDBiG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724336662; c=relaxed/relaxed;
	bh=4tv33PCHex6oIZnbxySFzBbHzmY4h6bGZxaDtgt05T4=;
	h=Received:Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-SA-Exim-Connect-IP:
	 X-SA-Exim-Rcpt-To:X-SA-Exim-Mail-From:X-SA-Exim-Scanned; b=i2m9e1M0X8JfOB24MxXYf0QcNN6xOi/MxVksQRIqoNVwSK46FP+lUDiuoMetZj0vRzfIEyZXxUCurBiFwDSMJNyIH8cOgrSqMpFnQhSh6M9ybQGPqKndRdnYTfmuVhDuJljChBhJHK7M2H4nrNy4fbiB60piCkQuT427n+3YnYlmhUXV6HMfyNICPvkokdMcF6agLECM9U6NgKzgx1WMcOUDxXtZ6/ayzXCZoUDQSSdDtqUOVPmrLTX7eygPZJXWlScvqsOlryz2yLxINTbRP5tsYgFjpvtXpNWdrJmbbAcoYNDLbWEETd7fewJkm/Aw51rx4+Z7HwU6HAD/lScEnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ozyO7lH5; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ozyO7lH5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqQSQ4Z90z2xWb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 00:24:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90E096119B;
	Thu, 22 Aug 2024 14:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3890DC32782;
	Thu, 22 Aug 2024 14:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724336659;
	bh=0qohOtlUlbQ+S7qqgBywKvuqNp39ChdhI74mz8dd2Dw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ozyO7lH51LENj0pz8yJ9fFnASqP4aSjXxFuKZyH76eEZfApci5B9okfoLmHxgZvRl
	 kmY9knEHycx303qDiMZFMJsfJpqn6tVYWhMcbpsPdtqyR08wW7dGyBdAsKT/SPSplB
	 fsLLGJh7rF1T+sOm5wl9+C8L1ISbJpzVAWk59zSHzqRq0uD/9uvelRrd7eTZKAPmsX
	 EE6ZTNoCRSU4stcONEEC1E2/aGmZZLiutDtV3jSzJnNIXTcN7FHtjLNHbi+zf06rbl
	 jcQwthABEVYJa5D5/i7LiPEJzJe88IgPhkFgJFPF1dhSGtFvraxCKRnGO8MM55oKVU
	 JebJWUwYL2VmA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1sh8jY-005yPd-K8;
	Thu, 22 Aug 2024 15:24:16 +0100
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Matlack <dmatlack@google.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: (subset) [PATCH v12 01/84] KVM: arm64: Release pfn, i.e. put page, if copying MTE tags hits ZONE_DEVICE
Date: Thu, 22 Aug 2024 15:24:11 +0100
Message-Id: <172433664067.3702537.13271681605926473288.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240726235234.228822-2-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-2-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, oliver.upton@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, seanjc@google.com, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, dmatlack@google.com, stevensd@chromium.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Fri, 26 Jul 2024 16:51:10 -0700, Sean Christopherson wrote:
> Put the page reference acquired by gfn_to_pfn_prot() if
> kvm_vm_ioctl_mte_copy_tags() runs into ZONE_DEVICE memory.  KVM's less-
> than-stellar heuristics for dealing with pfn-mapped memory means that KVM
> can get a page reference to ZONE_DEVICE memory.
> 
> 

Applied to next, thanks!

[01/84] KVM: arm64: Release pfn, i.e. put page, if copying MTE tags hits ZONE_DEVICE
        commit: ae41d7dbaeb4f79134136cd65ad7015cf9ccf78a

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



