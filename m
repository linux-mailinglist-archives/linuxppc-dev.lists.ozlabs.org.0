Return-Path: <linuxppc-dev+bounces-4452-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE9E9FB03F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 15:42:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YH11x0ntlz300g;
	Tue, 24 Dec 2024 01:41:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.165 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734964917;
	cv=pass; b=C7HUKBNXYeFKvQzi84yTWuEDIIVKGU3NVzVILDr0L5HdFH4A5HEdFjdXHl1s+qvfswVfHntHpw37/G+gDDYb6yGAV3Efo4xzXmJk/8dIhz9ju8n/+XyhLZnmbK9hFKcSJGnxw7kHIViEMbThgS1Vstd7IQnXWxTvYKZt20ofAYySo81jry72gUTyiKJdb/sNiKSf2B6seimJiUd1o4T+CEDlo8bemYWZetfwxv2lZJftaxL5Fywoaq+HYc97dseMizt9D8aRu8/vVMEhkiKswEcKAlX7F45xiwVXKxELHzLC1LHLkJmfLWjva3sxqchypRN5bJKfYRT6S8NOjegP8A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734964917; c=relaxed/relaxed;
	bh=zXzAKpYtn9aAxbB7F7kn1Shm52PdvCkDcfQgN1nF5YQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Vp1M0/bSgHLQaGrTqo6iRMlwKZQ6+LGQ79PQFRRdgXYmqPPUhPPqhPI6xCXQ5LbNHUqHrcArV4t3K8iTt+wzjGQAFeBxCXfhLyvP3EA0Rqm40gsmuSRa6aXdbAw99ImDun7NkPUlsJtb8qUY9tUNSYg+7E1sdDZzbSAqedRcNRxO6t/FIKQmpNGhLikBOW4SzSEswZH5vg0ULehoPwlumtokWcLkPXhk3TkG0LH9U1gk5BzH/8URy4umSt/VZdccBQVPkzlqtMI9/SdadrpPNfUKzZovuDjuzlGtaGZn7URaiHfYOT2Lmmeg3UyS5Xi/gb2VDr+S0kk3JXpNHgXWHQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Mts8OwPS; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Uir0HyxA; dkim-atps=neutral; spf=pass (client-ip=81.169.146.165; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Mts8OwPS;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=Uir0HyxA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.165; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YH11r5GjQz2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2024 01:41:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1734964902; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=EfzHzJ9mh/jdhTkCLzUEQLtnOcPtSXqLwXJqxCTz97Uiv6zXCYG1AOs8Zip4B391BB
    fKcfBqG2CgPqsfSmgOAozqKRoO4e1J5RYp3XVQYjefZTmNT41fnbCAPeiOJQFuHO/xhQ
    J7qFlWAcvfgTAXW0+d8/baq1pQAwAmakX1aGQfi1YInNzhGC1V7MTRmgs31ZRqXdmmKp
    cez0RM6XjLAUSN+J5XF7VXaVle0UPKrISQzuLCo7T9P7gEQxyDTHCdAJsL1KPE1k5MNX
    wnWW9AIH1/xZSp7Sj4LuDuRB6UaQMw1KKxp17H4YXKvIIlqEs7OIGlkiiSnS5ZrPw3f/
    v72A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1734964902;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=zXzAKpYtn9aAxbB7F7kn1Shm52PdvCkDcfQgN1nF5YQ=;
    b=tVTHuFzYrCawkGnsJCKlGhbIct2+adjb6LPbrbkpzzVhKb12Ge89jhTL+MbK7/Ln/t
    zlDEYNmi1LMgcjgPR2NO2j17ryMOH7vd8qHUwM7OJBw70fG+fBG6lO5MLR3RMnjXMJnI
    dXHsTQWFzEvvSfHYN3KfpP1Ke5Y5ojr+L3h+dgpI/lG6kC6ra4bYlmdogcd8SHJ/F4ag
    bfEmues2aO/uP+Og3YRFwwhlmNyEwwPj8NUFZVYZFP2KLnhLD8h8RBqGUba5Kzx+sMAw
    +RAQr1mayBGIBVSIhtMT1YvqwnWGDw+3yLsK37F7aOrNYFTyEYeKVLwQgvy8Qv/cefIM
    efDg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1734964902;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=zXzAKpYtn9aAxbB7F7kn1Shm52PdvCkDcfQgN1nF5YQ=;
    b=Mts8OwPSbOQ1hW/BdGz3H17S78cLUNePVVWKRU6HrgtcN1+/Sv+QonbjNK8KbeYgV0
    Xn/6nteD2wQbp4OSIK+1PO1GjlDJmQXtjs6/nWoODIfAjLzET7WAJ33RbPuNhN/PKHcp
    3/0bpkO7bGeuTcZ2ExRS5K3xRgUqMH0ATNRSlD7Y5AFHxxXstCdW34O1j2pvusikEFE9
    rriMyNr0DgveKvgX9cNfe/y8U5tKpPN1nHE3diqilTOlzXz5s2xDsQBD+yVPn00uvvz7
    NtQMYGCsOQaBG+d7TxBfewkgwRn3pZmP41cIqFMHDiSiqjhjSO4Nw7MFKATH+AKRDmhM
    sKWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1734964902;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=zXzAKpYtn9aAxbB7F7kn1Shm52PdvCkDcfQgN1nF5YQ=;
    b=Uir0HyxA1BRVS9eslEn4xp16uHC368oVlhqPPs5Uct7Cwn5eqGHgIzsP1pyhvIwW1F
    Vsj2PnIFpER9GL8Z1MCw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaMrvdtcX133EisT29BnYJMBKrhBYBGwL4fUrhbbg=="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 51.2.16 AUTH)
    with ESMTPSA id ebe9c90BNEfgBMu
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 23 Dec 2024 15:41:42 +0100 (CET)
Subject: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, Darren Stevens <darren@stevens-zone.net>,
 Pat Wall <pjwall@mac.com>, Pat Wall <pjwall@me.com>,
 Christian Zigotzky <info@xenosoft.de>, madskateman@gmail.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <6CC404E2-2442-47FE-877C-252B1F2872C2@xenosoft.de>
 <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
 <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de>
 <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
 <e6672ce2-2bf9-4a1e-b4b8-e1396ccbb56a@xenosoft.de>
 <1539b4dd-9a52-4f87-882d-cb605018d1f4@xenosoft.de>
 <0769459a-10ee-4573-a3ce-541c01429948@redhat.com>
 <fdd0528d-96f2-bc8d-783c-30600b0c15d8@xenosoft.de>
 <CABgObfa6ei-=dSRaPgj7OP07Y4nKAbTt3cRgMSCGRHUmkguOdQ@mail.gmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <7d8b5b78-b20c-d915-4a94-7082d7e01600@xenosoft.de>
Date: Mon, 23 Dec 2024 15:41:33 +0100
X-Mailer: BrassMonkey/33.4.0
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
MIME-Version: 1.0
In-Reply-To: <CABgObfa6ei-=dSRaPgj7OP07Y4nKAbTt3cRgMSCGRHUmkguOdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 22/12/24 18:49, Paolo Bonzini wrote:
 >
 > Go on with
 > git checkout -b bisection-rebase b467ab82a9fde4b46c0cd2c299220857afb0e0d4
 > git rebase v6.12
 > # check that it boots. if it fails to boot, please report this. if it 
succeds, continue:
 > git bisect start
 > git bisect bad bisection-rebase
 > git bisect good v6.12
 >
 > Proceed to bisect. If you never find a kernel that fails to boot, report.
 >
 > If you find a kernel that fails to boot, start another bisection 
between v6.12 and bisection-rebase, looking for the first patch that 
fails to boot.

Hi Bonzini,

Thank you for your answer.

On 22/12/24 18:49, Paolo Bonzini wrote:

     Thanks. Please try this

     git bisect start
     git checkout c9be85dabb376299504e0d391d15662c0edf8273

---

HEAD is now at c9be85dabb37 KVM: PPC: e500: Mark "struct page" dirty in 
kvmppc_e500_shadow_map()

On 22/12/24 18:49, Paolo Bonzini wrote:

     check that it does not boot

---

Yes, it doesn't boot

On 22/12/24 18:49, Paolo Bonzini wrote:

     git bisect bad
     git checkout adc218676eef25575469234709c2d87185ca223a

---

Previous HEAD position was c9be85dabb37 KVM: PPC: e500: Mark "struct 
page" dirty in kvmppc_e500_shadow_map() HEAD is now at adc218676eef 
Linux 6.12

On 22/12/24 18:49, Paolo Bonzini wrote:

     check that it boots

---

The host system boots and the guest kernel 6.13-rc3 boots in a KVM HV VM 
too.

git bisect good

Bisecting: a merge base must be tested
[e9001a382fa2c256229adc68d55212028b01d515] Merge tag 
'kvmarm-fixes-6.12-3' of 
git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD

On 22/12/24 18:49, Paolo Bonzini wrote:

     There are two possibilities.
     If e9001a382fa2c256229adc68d55212028b01d515 succeeds to boot

     Then git bisect good and bisect to the patch that causes the host 
to fail to boot. What's left seems to be all non-PPC KVM patches, which 
is a bit weird but you never know. Once you have the result, we'll try 
to fix that, and provide you with a fixed branch to bisect the actual 
KVM-PPC failure.

---

The host system doesn't boot.

On 22/12/24 18:49, Paolo Bonzini wrote:

     A potential candidate, based on your skips, is commit eec1e5db464e 
("KVM: Annotate that all paths in hva_to_pfn() might sleep").

     Please also provide a log of the boot failure (I haven't seen it 
but I might be missing it).
     If e9001a382fa2c256229adc68d55212028b01d515 fails to boot

---

Unfortunately, there isn't a guest kernel boot log via serial log.

On 22/12/24 18:49, Paolo Bonzini wrote:

     Go on with

     git checkout -b bisection-rebase 
b467ab82a9fde4b46c0cd2c299220857afb0e0d4
     git rebase v6.12

---

Applying: Documentation: kvm: fix a few mistakes Applying: 
Documentation: kvm: replace section numbers with links
Applying: Documentation: kvm: reorganize introduction Applying: 
Documentation: KVM: fix malformed table
Applying: x86: KVM: Advertise CPUIDs for new instructions in Clearwater 
Forest
Applying: KVM: x86: expose MSR_PLATFORM_INFO as a feature MSR

On 22/12/24 18:49, Paolo Bonzini wrote:

     check that it boots. if it fails to boot, please report this.

---

The host kernel boots but the guest kernel doesn't boot so KVM HV 
doesn't work.

On 22/12/24 18:49, Paolo Bonzini wrote:

     git bisect start
     git bisect bad bisection-rebase
     git bisect good v6.12

---

Bisecting: 99 revisions left to test after this (roughly 7 steps) 
[e7f7cfdd90c5a8bff38e059ca885a668efd2311f] RISC-V: KVM: Save trap CSRs 
in kvm_riscv_vcpu_enter_exit()

git bisect bad (Host boots and guest doesn't boot)

Output:

Bisecting: 49 revisions left to test after this (roughly 6 steps) 
[4f126962ea9b0d267c4a46f6be0e12698e723210] KVM: Move x86's API to 
release a faultin page to common KVM

git bisect good (Host and guest boot)

Output:

Bisecting: 24 revisions left to test after this (roughly 5 steps) 
[2c56ca43bac9f741b9d1c45d292fd512cf22ce98] KVM: PPC: Use kvm_vcpu_map() 
to map guest memory to patch dcbz instructions

git bisect bad (Host boots and guest doesn't boot)

Output:

Bisecting: 12 revisions left to test after this (roughly 4 steps) 
[a585688ac3ca4a91f80179ffcadb33575d9539a9] KVM: PPC: Use 
__kvm_faultin_pfn() to handle page faults on Book3s Radix

git bisect bad (Host boots and guest doesn't boot)

Bisecting: 5 revisions left to test after this (roughly 3 steps) 
[9f9bae39c20dc83e9c6b0de0ab20260b37f1f48e] KVM: arm64: Mark "struct 
page" pfns accessed/dirty before dropping mmu_lock

git bisect bad (Host boots and guest doesn't boot)

Bisecting: 2 revisions left to test after this (roughly 2 steps) 
[16dd33b96e8c0fb5dc335efaf5ebc7f92feef1ae] KVM: PPC: e500: Mark "struct 
page" dirty in kvmppc_e500_shadow_map()

git bisect good (Host and guest boot)

Output:

Bisecting: 0 revisions left to test after this (roughly 1 step) 
[edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4] KVM: PPC: e500: Use 
__kvm_faultin_pfn() to handle page faults

git bisect bad (Host boots and guest doesn't boot)

Bisecting: 0 revisions left to test after this (roughly 0 steps) 
[a5608a81925937a230816652bc7b953880606e7c] KVM: PPC: e500: Mark "struct 
page" pfn accessed before dropping mmu_lock

git bisect good (Host and guest boot)

`edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4 is the first bad commit
commit edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4
Author: Sean Christopherson seanjc@google.com
Date: Thu Oct 10 11:23:56 2024 -0700

KVM: PPC: e500: Use __kvm_faultin_pfn() to handle page faults

Convert PPC e500 to use __kvm_faultin_pfn()+kvm_release_faultin_page(),
and continue the inexorable march towards the demise of
kvm_pfn_to_refcounted_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20241010182427.1434605-55-seanjc@google.com>

arch/powerpc/kvm/e500_mmu_host.c | 8 +++-----
1 file changed, 3 insertions(+), 5 deletions(-)`

Cheers,
Christian

-- 
Sent with BrassMonkey 33.4.0 (https://github.com/wicknix/brass-monkey/releases/tag/33.4.0)


