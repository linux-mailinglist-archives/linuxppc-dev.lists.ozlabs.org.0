Return-Path: <linuxppc-dev+bounces-5079-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BCAA0A44B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 15:48:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVhGk2RL3z30DX;
	Sun, 12 Jan 2025 01:48:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.165 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736606910;
	cv=pass; b=l4K3gDEFpAOFonIB+EiGlDLu+WcVeG97J5DYrQA8i5B4icVReJz5CA2+yT5hciUVZtsTMegUIx+fecuT2E2BdNpQYQ9kJWwt8V8GP3XDCH1WAVRuZpJpGO1qjdbcl61IZEZ5gk0zGE2gwJDeCNPzgEywrskHwW41BhZBx3AeVq//TtlCw/oabca6R6Kbkd2ij3KUqmFng+AJqkz3jiGDUC9oZDaLvl1UoP1dMeY9/GwgwELi0BzIRISRBe87der0nGeeQMbhlCM4UR0MqDzX2RnAWaPnfpSdVxtobGv/Y9t9Oelb9qFHQp4Ew6h67szrO6ZkTvYavcwOBVnRPk4N/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736606910; c=relaxed/relaxed;
	bh=B8Z4pHbqoRqk3L39a4j21vmLxDvw20WM3wKz6CMTLd4=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=ND/4Wg9/nOCqbt8gxwZjJvfk0/lnb/lw7TyP9e77keWzEePZqt8YLEdNFl+QlJK1A/uHAaK/MMX1efyQCjGjnegHif5pn8GiHTRLtVT06VZqQIm40E3GcmtAjGP6awyBD98EMoefXDYYLlo/8oUk6e+KXa5OaSVefBWckhBrhNGhbwuToEuhDdYnGE667MWJ3d2EvjycQ7hK93U5RseW6MiaP6BKATsChuNr8+yzPFYnsJHDjIXaz8o7z/bYMwmRo7TtPh4pz524iNoHgWfWVzg6jxuf0V1OxSo+YLGMnHfP6BrlwqqgUoR3oOxJeBhO/JC1NojpSx3RuM8bUSjh7g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=IbJasbds; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=QfQSnP0z; dkim-atps=neutral; spf=pass (client-ip=81.169.146.165; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=IbJasbds;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=QfQSnP0z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.165; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVhGd17TLz306J
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 01:48:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1736606868; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=om/vED0/Sahl5HNXMWabjBxkbojeojay8ryan9mYjl3xth6lgMuxqAVXy1ueh8q3/4
    pJI93WWe1FCDVkhpLsYHpmhdwQ56/11zfRZ7vQDdy+KQ/RKBn8w+FLKeZ1ILtFebT8sh
    AsCR9aDEvEwsEorZWisTuK0/5KMmHHCHLIql6C/HXAy6cdrTNkXQcvf/FP4kHYLESqt0
    OyfqljjTwvEHQCbt7SH0oU4+x7mfef5Iy+ctnz8IgzylRtARoSvusGLpj89tUeMFPIBD
    S4HmicOvshQQluDL8ywkjNAKmY07+1oPqQOL4Zt618kw+MD6TTUHnl1bdUyq8XlwWmno
    ZXIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1736606868;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=B8Z4pHbqoRqk3L39a4j21vmLxDvw20WM3wKz6CMTLd4=;
    b=rKhK3hPpV+VJsLxTdx94FdAf783/3czbCHA3s+73OZRxfz1OwZd5x8RYkrbsFsFuLI
    WA0am9KkIddV3aKuO5I1KUxwIGlBBHm+o0NwQN2B4ZAohQchXYOJzKh/mW1MyZJc3s+Y
    Vc6eapfv3krgDAEw71aEuID8oEuc33x6KACHApjiyDoJEsfmUM//6a76xI8ercnwFVNE
    qrk+nW80WYFDF6TrEWa6BVmiai3JRQuPLs0I9JpFanXh8StVx+Rhe1TO/ne9z9/hmww0
    ilfmlrkZ4Xv8H2g51DcZTYfHp1rRip4cab/KvkUFXHGqjri5vZfvXKtcvG/3oO0pCsPF
    hsPA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1736606868;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=B8Z4pHbqoRqk3L39a4j21vmLxDvw20WM3wKz6CMTLd4=;
    b=IbJasbdsd4Tk/yX5RFbEZL0rLMzn7bhqMP1hkDBhpodmz5v2mheTsWIcOttXba4eum
    gO3PfbGhni9PCA7iOEkBdJFRGRQRBkWQEgRtd1qRjZ3fuJz0UaVrkhAh9Cr86J2Yte9X
    gffFYbSd+pwRwYy+ArF1U9bVbZD2PcuSha48RE+suzcp5w90TXelWBP9r+vqjFyytpvG
    pVBlTgTc1+FcSJzpL/pR4HFRItSv2atGltawLN+JXQo+XlfP1LM664Ka+DtpcRfMj5lY
    RkMovrGcNvm7wmBo0RJI+DogAdUbizA85cq0fSuo5s2y0P6q5zrauASe3s41neGp9sKF
    tPvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1736606868;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=B8Z4pHbqoRqk3L39a4j21vmLxDvw20WM3wKz6CMTLd4=;
    b=QfQSnP0z3Ok54I5Vi70PB3VZelgWffKaILeBOAdC4dKe6Up/xBk/vuClXCFrIP66Ro
    fsRJO8DlaePnsFzyAOBQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaMrvdtcX133EipGzhGnb3rrLiUtW3TtSfq8MBVvg=="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.16 AUTH)
    with ESMTPSA id ebe9c910BElmocD
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 11 Jan 2025 15:47:48 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Mime-Version: 1.0 (1.0)
Subject: [PATCH] KVM: allow NULL writable argument to __kvm_faultin_pfn
Date: Sat, 11 Jan 2025 15:47:37 +0100
Message-Id: <4C777C7B-4DC0-4428-BB70-34BECAC4828F@xenosoft.de>
References: <Z3wnsQQ67GBf1Vsb@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 regressions@lists.linux.dev, Trevor Dickinson <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <Z3wnsQQ67GBf1Vsb@google.com>
To: Sean Christopherson <seanjc@google.com>
X-Mailer: iPhone Mail (22C152)
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 06 January 2025 at 07:57 pm, Sean Christopherson <seanjc@google.com> wr=
ote:
>=20
> =EF=BB=BFOn Wed, Jan 01, 2025, Paolo Bonzini wrote:
>> kvm_follow_pfn() is able to work with NULL in the .map_writable field
>> of the homonymous struct.  But __kvm_faultin_pfn() rejects the combo
>> despite KVM for e500 trying to use it.  Indeed .map_writable is not
>> particularly useful if the flags include FOLL_WRITE and readonly
>> guest memory is not supported, so add support to __kvm_faultin_pfn()
>> for this case.
>=20
> I would prefer to keep the sanity check to minimize the risk of a page fau=
lt
> handler not supporting opportunistic write mappings.  e500 is definitely t=
he
> odd one out here.
>=20
> What about adding a dedicated wrapper for getting a writable PFN?  E.g. (u=
ntested)
>=20
> ---
> arch/powerpc/kvm/e500_mmu_host.c | 2 +-
> arch/x86/kvm/vmx/vmx.c           | 3 +--
> include/linux/kvm_host.h         | 8 ++++++++
> 3 files changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_=
host.c
> index e5a145b578a4..2251bb30b8ec 100644
> --- a/arch/powerpc/kvm/e500_mmu_host.c
> +++ b/arch/powerpc/kvm/e500_mmu_host.c
> @@ -444,7 +444,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc=
_vcpu_e500 *vcpu_e500,
>=20
>    if (likely(!pfnmap)) {
>        tsize_pages =3D 1UL << (tsize + 10 - PAGE_SHIFT);
> -        pfn =3D __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
> +        pfn =3D kvm_faultin_writable_pfn(slot, gfn, &page);
>        if (is_error_noslot_pfn(pfn)) {
>            if (printk_ratelimit())
>                pr_err("%s: real page not found for gfn %lx\n",
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 893366e53732..7012b583f2e8 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -6800,7 +6800,6 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *=
vcpu)
>    struct page *refcounted_page;
>    unsigned long mmu_seq;
>    kvm_pfn_t pfn;
> -    bool writable;
>=20
>    /* Defer reload until vmcs01 is the current VMCS. */
>    if (is_guest_mode(vcpu)) {
> @@ -6836,7 +6835,7 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *=
vcpu)
>     * controls the APIC-access page memslot, and only deletes the memslot
>     * if APICv is permanently inhibited, i.e. the memslot won't reappear.
>     */
> -    pfn =3D __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, &refcount=
ed_page);
> +    pfn =3D kvm_faultin_writable_pfn(slot, gfn, &refcounted_page);
>    if (is_error_noslot_pfn(pfn))
>        return;
>=20
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index c788d0bd952a..b0af7c7f99da 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1287,6 +1287,14 @@ static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_=
vcpu *vcpu, gfn_t gfn,
>                 write ? FOLL_WRITE : 0, writable, refcounted_page);
> }
>=20
> +static inline kvm_pfn_t kvm_faultin_writable_pfn(const struct kvm_memory_=
slot *slot,
> +                         gfn_t gfn, struct page **refcounted_page)
> +{
> +    bool writable;
> +
> +    return __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, refcounted=
_page);
> +}
> +
> int kvm_read_guest_page(struct kvm *kvm, gfn_t gfn, void *data, int offset=
,
>            int len);
> int kvm_read_guest(struct kvm *kvm, gpa_t gpa, void *data, unsigned long l=
en);
>=20
> base-commit: 2c3412e999738bfd60859c493ff47f5c268814a3
> --

This patch works. Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>

Thanks=


