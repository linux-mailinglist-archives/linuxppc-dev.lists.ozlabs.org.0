Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BBB587B39
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 13:02:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxsX50KKWz3dsT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 21:02:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxsWL343mz2xtw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 21:01:50 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LxsWJ26Ddz4x1N;
	Tue,  2 Aug 2022 21:01:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20220711223617.63625-1-muriloo@linux.ibm.com>
References: <20220711223617.63625-1-muriloo@linux.ibm.com>
Subject: Re: [PATCH 0/2] KVM: PPC: Book3s HV: Cleanup unused function and declarations
Message-Id: <165943809123.1060517.15281363723578421276.b4-ty@ellerman.id.au>
Date: Tue, 02 Aug 2022 21:01:31 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Juergen Gross <jgross@suse.com>, Fabiano Rosas <farosas@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Nicholas Piggin <npiggin@gmail.com>, mopsfelder@gmail.com, Paul Mackerras <paulus@samba.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 11 Jul 2022 19:36:15 -0300, Murilo Opsfelder Araujo wrote:
> Minor cleanup to remove unused function and declarations.
> 
> Murilo Opsfelder Araujo (2):
>   KVM: PPC: Book3S HV: Remove kvmhv_p9_[set,restore]_lpcr declarations
>   KVM: PPC: Book3s HV: Remove unused function kvmppc_bad_interrupt
> 
> arch/powerpc/include/asm/kvm_book3s.h |  3 ---
>  arch/powerpc/kvm/book3s_hv_builtin.c  | 18 ------------------
>  2 files changed, 21 deletions(-)
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/2] KVM: PPC: Book3S HV: Remove kvmhv_p9_[set,restore]_lpcr declarations
      https://git.kernel.org/powerpc/c/4c9da83011c455c0791b1f5e4e84d454d4f4ae3c
[2/2] KVM: PPC: Book3s HV: Remove unused function kvmppc_bad_interrupt
      https://git.kernel.org/powerpc/c/b8c7ee79b1a37442a910b8a313045fb9aa639911

cheers
