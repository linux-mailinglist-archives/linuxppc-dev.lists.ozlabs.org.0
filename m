Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B10245637B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 20:25:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hw8rg2cl8z3c5J
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 06:25:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=WoRuVORo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=desiato.srs.infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=batv+5c91a5198af509282c03+6661+infradead.org+dwmw2@desiato.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=WoRuVORo; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hw8qy2Xk9z2ynk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 06:24:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=dY7Tt+ADu2oQp52XUsO3VZxqjQj7MzSBRXMcpbCbafM=; b=WoRuVORo9B/4wm/C+f4RvGG6R5
 aSUlxt0MYkOWLrvIgcfDvIr6UXShHu6loY5lSDBiU4FXuXgp3uspwRzYskh1Vs0x+Y53tK7p3vn/+
 ZjMS5DvaH8e0oC/2BcGEHKvjs+1WptAZ4FhRVASSjAXe0I60rDRJ6dyyjWPnh9cgyFCuKyilaytvL
 pJluZNiT0bwovPzhRdqmRPs1ZauvCLfEzEFBRXf3uCL1xUUDMSI+n0zj7a52oRJa//NNrrLSKe5bX
 qlCpX75DD9121jX1HXfgGNlPWl6zYrgFS/RdDFdi+eoCK7Q6hIhil60eqnxdT/fcHrzlvDtVCn6sx
 ikJ6CUsQ==;
Received: from [2a01:4c8:1087:8341:4271:4cd3:119b:a847] (helo=[IPv6:::1])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnn08-00GkGi-FB; Thu, 18 Nov 2021 19:23:16 +0000
Date: Thu, 18 Nov 2021 19:23:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_08/12=5D_KVM=3A_Propagate_vcpu?=
 =?US-ASCII?Q?_explicitly_to_mark=5Fpage=5Fdirty=5Fin=5Fslot=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <YZagjzYUsixbFre9@google.com>
References: <20211117174003.297096-1-dwmw2@infradead.org>
 <20211117174003.297096-9-dwmw2@infradead.org>
 <85d9fec17f32c3eb9e100e56b91af050.squirrel@twosheds.infradead.org>
 <4c48546b-eb4a-dff7-cc38-5df54f73f5d4@redhat.com>
 <20b5952e76c54a3a5dfe5a898e3b835404ac6fb1.camel@infradead.org>
 <YZaeL5YztL3p1nLM@google.com> <YZagjzYUsixbFre9@google.com>
Message-ID: <35AEC3FD-B46A-451D-B7D5-4B1BDD5407BD@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Anup Patel <anup.patel@wdc.com>,
 "wanpengli @ tencent . com" <wanpengli@tencent.com>, kvm <kvm@vger.kernel.org>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 "joro @ 8bytes . org" <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, karahmed@amazon.com,
 Catalin Marinas <catalin.marinas@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "jmattson @ google . com" <jmattson@google.com>,
 "mtosatti @ redhat . com" <mtosatti@redhat.com>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "vkuznets @ redhat . com" <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 18 November 2021 18:50:55 GMT, Sean Christopherson <seanjc@google=2Ecom=
> wrote:
>On Thu, Nov 18, 2021, Sean Christopherson wrote:
>> On Thu, Nov 18, 2021, David Woodhouse wrote:
>> > That leaves the one in TDP MMU handle_changed_spte_dirty_log() which
>> > AFAICT can trigger the same crash seen by butt3rflyh4ck =E2=80=94 can=
't that
>> > happen from a thread where kvm_get_running_vcpu() is NULL too? For th=
at
>> > one I'm not sure=2E
>>=20
>> I think could be trigger in the TDP MMU via kvm_mmu_notifier_release()
>> -> kvm_mmu_zap_all(), e=2Eg=2E if the userspace VMM exits while dirty l=
ogging is
>> enabled=2E  That should be easy to (dis)prove via a selftest=2E
>
>Scratch that, the dirty log update is guarded by the new_spte being prese=
nt, so
>zapping of any kind won't trigger it=2E
>
>Currently, I believe the only path that would create a present SPTE witho=
ut an
>active vCPU is mmu_notifer=2Echange_pte, but that squeaks by because its =
required
>to be wrapped with invalidate_range_{start,end}(MMU_NOTIFY_CLEAR), and KV=
M zaps
>in that situation=2E

Is it sufficient to have *an* active vCPU?  What if a VMM has threads for =
active vCPUs but is doing mmap/munmap on a *different* thread? Does that no=
t suffer the same crash?


--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
