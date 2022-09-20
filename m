Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C19195BDF64
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 10:11:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWvQb5Q1sz3c4j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 18:11:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Zn3NzSIT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Zn3NzSIT;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWvPz4kB8z2xJ0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 18:11:17 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id w2so2080652pfb.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 01:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=JfBz9k3OjwE93NF7Kt6N/1h73iEewzCLOYjKWPMBIyU=;
        b=Zn3NzSITmY96OmR2bm+cpfxLf8y/1o7tiIrXbeImAylQW2qbrIA0XTDZNyQ9nl/cSb
         dDZOX4gt1t9YecixDPPNHb3udlRRlWASezdMjaR1DbdCVTLeMwM3ByJgF80evy8DoQVt
         EsREBK56Pby4l2BBgfoOfJFBusx75xm3AeAqVsuK4klsd4Xcpzu+9sJxqsd66U1lEmBv
         k4HSU+eCbOl895B9xKMFet5McOSoM+6Lssw66PntHFsI0nCCwEzpFf26Yd7iBTkbFZlr
         Akv4X16hdcuDzCGz2eSHxscnJCndKf4H0zAi64KObLgX+cbrJ+6yfrZMTevfmIykz+ME
         +X5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=JfBz9k3OjwE93NF7Kt6N/1h73iEewzCLOYjKWPMBIyU=;
        b=GE+fPLTBbsHQeXcwIsN1/KKVYEde5QhPpqkXHymrOM+yZrwoeDhzWfOWlvvngi7vRZ
         lcYxQd93BURMAvFHhYgUmbVURhDzyvhYwRh/4SQ08TOI+0XpEJVeyMmxTUlj0p+hLPvB
         mTnYi8pD0DOYjKqPFflbIhfKfO2UyDs1fyzqPLhtcWSxruMjwBAT0N5yuehyo8R+tGrX
         VBjsa8/fw8I2XSPppK3hpPtf5rIpP5TFttbS4W7m36L+EkGoiGQtCN4wNB6i6cA+QzID
         /FgNyIg0mAwGdf4Z3kvaRXoF17dQCSf9Eyak7SRO57XmaRtaLsRX19SgVfXwjAdyneVH
         YYTw==
X-Gm-Message-State: ACrzQf1BxZsogzwVXuWtfQYhvhdNU7AgvQDzNq9x2XfuYms9aHtlKImY
	PaMzWZp/B+YuyrNi8MZs0kk=
X-Google-Smtp-Source: AMsMyM6dKaQZY/of6kUeMQGt/yyIYvuKPct11WQU5yOUPBQuBxatzNwx7Sk15B5Px1wnv2jw8uo5fg==
X-Received: by 2002:aa7:915a:0:b0:549:e8ac:c933 with SMTP id 26-20020aa7915a000000b00549e8acc933mr22298222pfi.72.1663661474353;
        Tue, 20 Sep 2022 01:11:14 -0700 (PDT)
Received: from localhost ([203.219.227.147])
        by smtp.gmail.com with ESMTPSA id mj24-20020a17090b369800b001fb53587166sm808876pjb.28.2022.09.20.01.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:11:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 18:11:08 +1000
Message-Id: <CN12RRP0O710.254G0S1RZXY2Z@bobo>
Subject: Re: [PATCH v2 1/2] powerpc/kvm: Remove unused macros from
 asm-offset
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Disha Goel" <disgoel@linux.vnet.ibm.com>, <mpe@ellerman.id.au>
X-Mailer: aerc 0.11.0
References: <20220916105736.268153-1-disgoel@linux.vnet.ibm.com>
 <20220916105736.268153-2-disgoel@linux.vnet.ibm.com>
In-Reply-To: <20220916105736.268153-2-disgoel@linux.vnet.ibm.com>
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Sep 16, 2022 at 8:57 PM AEST, Disha Goel wrote:
> The kvm code was refactored to convert some of kvm assembly routines to C=
.
> This includes commits which moved code path for the kvm guest entry/exit
> for p7/8 from aseembly to C. As part of the code changes, usage of some o=
f
> the macros were removed. But definitions still exist in the assembly file=
s.
> Commits are listed below:
>
> Commit 2e1ae9cd56f8 ("KVM: PPC: Book3S HV: Implement radix prefetch worka=
round by disabling MMU")
> Commit 9769a7fd79b6 ("KVM: PPC: Book3S HV: Remove radix guest support fro=
m P7/8 path")
> Commit fae5c9f3664b ("KVM: PPC: Book3S HV: remove ISA v3.0 and v3.1 suppo=
rt from P7/8 path")
> Commit 57dc0eed73ca ("KVM: PPC: Book3S HV P9: Implement PMU save/restore =
in C")
>
> Many of the asm-offset macro definitions were missed to remove. Patch
> fixes by removing the unused macros.
>
> Signed-off-by: Disha Goel <disgoel@linux.vnet.ibm.com>

Thanks, good cleanup.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/kernel/asm-offsets.c | 25 -------------------------
>  1 file changed, 25 deletions(-)
>
> diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-=
offsets.c
> index 8c10f536e478..95744e7c056d 100644
> --- a/arch/powerpc/kernel/asm-offsets.c
> +++ b/arch/powerpc/kernel/asm-offsets.c
> @@ -418,21 +418,18 @@ int main(void)
> =20
>  	/* book3s */
>  #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> -	OFFSET(KVM_TLB_SETS, kvm, arch.tlb_sets);
>  	OFFSET(KVM_SDR1, kvm, arch.sdr1);
>  	OFFSET(KVM_HOST_LPID, kvm, arch.host_lpid);
>  	OFFSET(KVM_HOST_LPCR, kvm, arch.host_lpcr);
>  	OFFSET(KVM_HOST_SDR1, kvm, arch.host_sdr1);
>  	OFFSET(KVM_ENABLED_HCALLS, kvm, arch.enabled_hcalls);
>  	OFFSET(KVM_VRMA_SLB_V, kvm, arch.vrma_slb_v);
> -	OFFSET(KVM_RADIX, kvm, arch.radix);
>  	OFFSET(KVM_SECURE_GUEST, kvm, arch.secure_guest);
>  	OFFSET(VCPU_DSISR, kvm_vcpu, arch.shregs.dsisr);
>  	OFFSET(VCPU_DAR, kvm_vcpu, arch.shregs.dar);
>  	OFFSET(VCPU_VPA, kvm_vcpu, arch.vpa.pinned_addr);
>  	OFFSET(VCPU_VPA_DIRTY, kvm_vcpu, arch.vpa.dirty);
>  	OFFSET(VCPU_HEIR, kvm_vcpu, arch.emul_inst);
> -	OFFSET(VCPU_NESTED, kvm_vcpu, arch.nested);
>  	OFFSET(VCPU_CPU, kvm_vcpu, cpu);
>  	OFFSET(VCPU_THREAD_CPU, kvm_vcpu, arch.thread_cpu);
>  #endif
> @@ -449,16 +446,12 @@ int main(void)
>  	OFFSET(VCPU_DABRX, kvm_vcpu, arch.dabrx);
>  	OFFSET(VCPU_DAWR0, kvm_vcpu, arch.dawr0);
>  	OFFSET(VCPU_DAWRX0, kvm_vcpu, arch.dawrx0);
> -	OFFSET(VCPU_DAWR1, kvm_vcpu, arch.dawr1);
> -	OFFSET(VCPU_DAWRX1, kvm_vcpu, arch.dawrx1);
>  	OFFSET(VCPU_CIABR, kvm_vcpu, arch.ciabr);
>  	OFFSET(VCPU_HFLAGS, kvm_vcpu, arch.hflags);
>  	OFFSET(VCPU_DEC_EXPIRES, kvm_vcpu, arch.dec_expires);
>  	OFFSET(VCPU_PENDING_EXC, kvm_vcpu, arch.pending_exceptions);
>  	OFFSET(VCPU_CEDED, kvm_vcpu, arch.ceded);
>  	OFFSET(VCPU_PRODDED, kvm_vcpu, arch.prodded);
> -	OFFSET(VCPU_IRQ_PENDING, kvm_vcpu, arch.irq_pending);
> -	OFFSET(VCPU_DBELL_REQ, kvm_vcpu, arch.doorbell_request);
>  	OFFSET(VCPU_MMCR, kvm_vcpu, arch.mmcr);
>  	OFFSET(VCPU_MMCRA, kvm_vcpu, arch.mmcra);
>  	OFFSET(VCPU_MMCRS, kvm_vcpu, arch.mmcrs);
> @@ -486,8 +479,6 @@ int main(void)
>  	OFFSET(VCPU_TCSCR, kvm_vcpu, arch.tcscr);
>  	OFFSET(VCPU_ACOP, kvm_vcpu, arch.acop);
>  	OFFSET(VCPU_WORT, kvm_vcpu, arch.wort);
> -	OFFSET(VCPU_TID, kvm_vcpu, arch.tid);
> -	OFFSET(VCPU_PSSCR, kvm_vcpu, arch.psscr);
>  	OFFSET(VCPU_HFSCR, kvm_vcpu, arch.hfscr);
>  	OFFSET(VCORE_ENTRY_EXIT, kvmppc_vcore, entry_exit_map);
>  	OFFSET(VCORE_IN_GUEST, kvmppc_vcore, in_guest);
> @@ -582,8 +573,6 @@ int main(void)
>  	HSTATE_FIELD(HSTATE_HWTHREAD_STATE, hwthread_state);
>  	HSTATE_FIELD(HSTATE_KVM_VCPU, kvm_vcpu);
>  	HSTATE_FIELD(HSTATE_KVM_VCORE, kvm_vcore);
> -	HSTATE_FIELD(HSTATE_XIVE_TIMA_PHYS, xive_tima_phys);
> -	HSTATE_FIELD(HSTATE_XIVE_TIMA_VIRT, xive_tima_virt);
>  	HSTATE_FIELD(HSTATE_HOST_IPI, host_ipi);
>  	HSTATE_FIELD(HSTATE_PTID, ptid);
>  	HSTATE_FIELD(HSTATE_FAKE_SUSPEND, fake_suspend);
> @@ -594,9 +583,6 @@ int main(void)
>  	HSTATE_FIELD(HSTATE_SDAR, host_mmcr[4]);
>  	HSTATE_FIELD(HSTATE_MMCR2, host_mmcr[5]);
>  	HSTATE_FIELD(HSTATE_SIER, host_mmcr[6]);
> -	HSTATE_FIELD(HSTATE_MMCR3, host_mmcr[7]);
> -	HSTATE_FIELD(HSTATE_SIER2, host_mmcr[8]);
> -	HSTATE_FIELD(HSTATE_SIER3, host_mmcr[9]);
>  	HSTATE_FIELD(HSTATE_PMC1, host_pmc[0]);
>  	HSTATE_FIELD(HSTATE_PMC2, host_pmc[1]);
>  	HSTATE_FIELD(HSTATE_PMC3, host_pmc[2]);
> @@ -672,17 +658,6 @@ int main(void)
>  	OFFSET(VCPU_HOST_MAS6, kvm_vcpu, arch.host_mas6);
>  #endif
> =20
> -#ifdef CONFIG_KVM_XICS
> -	DEFINE(VCPU_XIVE_SAVED_STATE, offsetof(struct kvm_vcpu,
> -					       arch.xive_saved_state));
> -	DEFINE(VCPU_XIVE_CAM_WORD, offsetof(struct kvm_vcpu,
> -					    arch.xive_cam_word));
> -	DEFINE(VCPU_XIVE_PUSHED, offsetof(struct kvm_vcpu, arch.xive_pushed));
> -	DEFINE(VCPU_XIVE_ESC_ON, offsetof(struct kvm_vcpu, arch.xive_esc_on));
> -	DEFINE(VCPU_XIVE_ESC_RADDR, offsetof(struct kvm_vcpu, arch.xive_esc_rad=
dr));
> -	DEFINE(VCPU_XIVE_ESC_VADDR, offsetof(struct kvm_vcpu, arch.xive_esc_vad=
dr));
> -#endif
> -
>  #ifdef CONFIG_KVM_EXIT_TIMING
>  	OFFSET(VCPU_TIMING_EXIT_TBU, kvm_vcpu, arch.timing_exit.tv32.tbu);
>  	OFFSET(VCPU_TIMING_EXIT_TBL, kvm_vcpu, arch.timing_exit.tv32.tbl);
> --=20
> 2.31.1

