Return-Path: <linuxppc-dev+bounces-14683-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EDDCACE7B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 11:42:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dPz7y407jz2yPq;
	Mon, 08 Dec 2025 21:42:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765190542;
	cv=none; b=MRW6YiHVXctpymOHzp88Mzsn2CMuKR1yS6QhODJ0INV5XKo7GjzJ6hVPsSJJiAVMZT/Iq7/Xx6xRsqPGOdRl2w5M2i0DnUiLDJfm+8G7tLyM6I+XofQR7MGs/UNQ7Py9zfn2SOR3ujioIUSBusw0ccM5W+cCeGdPHtmMDj6Qghk+yM7cwauxYs5nUGtmhdLBay3Yn8n9OrEgAeDEd/xMSCX87GGWZ4fNFs8kflpfL8GcOTvGQ0UcssH1YYK3PmbDAA8Lk+3wyPcVnsUuQ3U+FKuyJbY2dNVgzLr0z1UnAHGWiSGOQciBJi3EKq6otSWg4TI2pc5CW0PKZWl0JBgaIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765190542; c=relaxed/relaxed;
	bh=QOY7QJ/Kpjmn+Z2zyJvs6X2kdbwgPk7DZjcU8zJNuWI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D3aCCrrTGFtAxS/GaoIzI23YNx/imN9wArW7n/IfvTndbuTGIJja5LAtO9UlKFzQLbyEutzHqcSNrWBqnPAFHa4kmsTTt0PDg2XgpAniBjWhSNEdJ2tz89BzN1b+aOk4bsWNxq4Xo6dv/vzet0MSjWJEY4eGmARxnPpCknvhW1tIsP+Sp7NVAfP7ZGnhZZI2wkYUpJ6wqUqbtLCPtPgdzcC4R85h+t4pCbp+1AQQe7NtfRcikvQ/fD1Yg48EX0564dPBkB+BtfIt/SUq03pefTcaZsOW1d7YkPJHdK+VGzMe5Eg0BgyeqaZ/x1GTA4iE4IGcJADAZzuYg6M6s83asw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X39h8sTJ; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X39h8sTJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dPz7x3Vfsz2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Dec 2025 21:42:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D39D6014D;
	Mon,  8 Dec 2025 10:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA12C4CEF1;
	Mon,  8 Dec 2025 10:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765190538;
	bh=TAnDl6sPhcy+IUlbX2x8cziKUCBVlmn2sw/09aCCSsI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X39h8sTJnWGPt8aAvzjUIiETMHFCA3RazvKyqIgwrxEc58CgplJjrACjAAoXNDu9v
	 Mf4FaQLF71Mpzddiqh8kUrRua4Tc83Ql8bVBgkYb1NwV/s948y0TBK6H1F/bs9Ola/
	 sZu+jSyI5iZIZdEKwdjRFL1iArddlpoE9LJVlY5w70w1lpY2RFr5VT3HWhCLjjqgO/
	 7UHZkgAfe6RkxZmmdW+6fR624bPxRz7mmacB9JWaHHKj3qGDASLOxRB1uz0L/yo7E6
	 bJOkeoaduri8FaD9L2jy/l1FCprmQ0KANGIOHDqKa2svuZK9Ni4EKDeVCuLiDQBGK1
	 trQavZzLM6zlg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vSYh6-0000000BGKA-1nWA;
	Mon, 08 Dec 2025 10:42:16 +0000
Date: Mon, 08 Dec 2025 10:42:15 +0000
Message-ID: <865xahp854.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Oliver Upton <oupton@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
In-Reply-To: <20251205232655.445294-1-seanjc@google.com>
References: <20251205232655.445294-1-seanjc@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
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
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: seanjc@google.com, oupton@kernel.org, zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org, maddy@linux.ibm.com, anup@brainfault.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, pbonzini@redhat.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, gustavoars@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 05 Dec 2025 23:26:55 +0000,
Sean Christopherson <seanjc@google.com> wrote:
> 
> Remove KVM's internal pseudo-overlay of kvm_stats_desc, which subtly
> aliases the flexible name[] in the uAPI definition with a fixed-size array
> of the same name.  The unusual embedded structure results in compiler
> warnings due to -Wflex-array-member-not-at-end, and also necessitates an
> extra level of dereferencing in KVM.  To avoid the "overlay", define the
> uAPI structure to have a fixed-size name when building for the kernel.
> 
> Opportunistically clean up the indentation for the stats macros, and
> replace spaces with tabs.
> 
> No functional change intended.
> 
> Reported-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Closes: https://lore.kernel.org/all/aPfNKRpLfhmhYqfP@kspp
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Acked-by: Marc Zyngier <maz@kernel.org>

	M.

-- 
Without deviation from the norm, progress is not possible.

