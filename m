Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E384F22A8E4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 08:24:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC2P76L97zDr5T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 16:24:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC2KB5Km2zDq94
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 16:21:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=STIApXPn; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4BC2KB2xDyz9sRk; Thu, 23 Jul 2020 16:21:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1595485278; bh=Hng+7vJtSFdsdAyaoYogZg96Z3E9Fp8ldUBgLr4JUIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=STIApXPneoXxhoQFSZ5MpmTejJzmzvfiGr7sM25Fw/5Ah0M8s79IeWSWT50pKiez2
 T+j+LtWnMeW1BQ6qgMw/KEcAjJXnLsA9cIBjJhbF/BL06+nGKNDSJcCNUhdu/8vgIW
 41TYg/WTi7/xYRdmwjDuIQHjIRqzAlE8lApfCbAoHFUdoOBvYlBbf0b4cov2oMrVAf
 08ukd8vtqfod2plDsam++HO/TSJUNYOGy/XPNguJtKXaKiTWsDphjC5+FrY3tqHF82
 +fzwPE90goyF6i8sMym9vvD0llr/fbVTO4dHVY6UZAK2qawBQECDrmCTPzc15wK60B
 2Y7KW4Sv+Fnrw==
Date: Thu, 23 Jul 2020 16:19:42 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] KVM: PPC: Protect kvm_vcpu_read_guest with srcu
 locks
Message-ID: <20200723061942.GD213782@thinks.paulus.ozlabs.org>
References: <20200609021230.103494-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609021230.103494-1-aik@ozlabs.ru>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 09, 2020 at 12:12:29PM +1000, Alexey Kardashevskiy wrote:
> The kvm_vcpu_read_guest/kvm_vcpu_write_guest used for nested guests
> eventually call srcu_dereference_check to dereference a memslot and
> lockdep produces a warning as neither kvm->slots_lock nor
> kvm->srcu lock is held and kvm->users_count is above zero (>100 in fact).
> 
> This wraps mentioned VCPU read/write helpers in srcu read lock/unlock as
> it is done in other places. This uses vcpu->srcu_idx when possible.
> 
> These helpers are only used for nested KVM so this may explain why
> we did not see these before.
> 
> Here is an example of a warning:
> 
> =============================
> WARNING: suspicious RCU usage
> 5.7.0-rc3-le_dma-bypass.3.2_a+fstn1 #897 Not tainted
> -----------------------------
> include/linux/kvm_host.h:633 suspicious rcu_dereference_check() usage!
> 
> other info that might help us debug this:
> 
> rcu_scheduler_active = 2, debug_locks = 1
> 1 lock held by qemu-system-ppc/2752:
>  #0: c000200359016be0 (&vcpu->mutex){+.+.}-{3:3}, at: kvm_vcpu_ioctl+0x144/0xd80 [kvm]
> 
> stack backtrace:
> CPU: 80 PID: 2752 Comm: qemu-system-ppc Not tainted 5.7.0-rc3-le_dma-bypass.3.2_a+fstn1 #897
> Call Trace:
> [c0002003591ab240] [c000000000b23ab4] dump_stack+0x190/0x25c (unreliable)
> [c0002003591ab2b0] [c00000000023f954] lockdep_rcu_suspicious+0x140/0x164
> [c0002003591ab330] [c008000004a445f8] kvm_vcpu_gfn_to_memslot+0x4c0/0x510 [kvm]
> [c0002003591ab3a0] [c008000004a44c18] kvm_vcpu_read_guest+0xa0/0x180 [kvm]
> [c0002003591ab410] [c008000004ff9bd8] kvmhv_enter_nested_guest+0x90/0xb80 [kvm_hv]
> [c0002003591ab980] [c008000004fe07bc] kvmppc_pseries_do_hcall+0x7b4/0x1c30 [kvm_hv]
> [c0002003591aba10] [c008000004fe5d30] kvmppc_vcpu_run_hv+0x10a8/0x1a30 [kvm_hv]
> [c0002003591abae0] [c008000004a5d954] kvmppc_vcpu_run+0x4c/0x70 [kvm]
> [c0002003591abb10] [c008000004a56e54] kvm_arch_vcpu_ioctl_run+0x56c/0x7c0 [kvm]
> [c0002003591abba0] [c008000004a3ddc4] kvm_vcpu_ioctl+0x4ac/0xd80 [kvm]
> [c0002003591abd20] [c0000000006ebb58] ksys_ioctl+0x188/0x210
> [c0002003591abd70] [c0000000006ebc28] sys_ioctl+0x48/0xb0
> [c0002003591abdb0] [c000000000042764] system_call_exception+0x1d4/0x2e0
> [c0002003591abe20] [c00000000000cce8] system_call_common+0xe8/0x214
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Thanks, patch applied to my kvm-ppc-next branch.

Paul.
