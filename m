Return-Path: <linuxppc-dev+bounces-5080-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84994A0A44D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 15:50:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVhK3286Hz30Ty;
	Sun, 12 Jan 2025 01:50:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.167 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736607031;
	cv=pass; b=I7Q7DFNUHBklFb78wuHyaVQw8/Uyw1skcvjJnt7N1Se3jKaQnYQ4EL2Cihxdh0RJ3GEzKSpXX1sVdBAYEhSpuc4GeyZ1Sq37k5oO+NHdnHbfRYxYQh8z1HTO/o+l2lH/+xJ/SPLs+Y0t5vZForhPZkSCBu24sMTA7dTwlZuZimVLM1v+UxB/AO6fmiJThNvKg3tf5+WdMLw1JZCdDleEPjSYyDr+J94NKR/JLd7DXs5t9DVqzYaiRmdREhN3wo8F1H4fcJ4jUaCX5wnWENEAJKIeTvDq78JNmDuRqVnSU32ulqKKyPhPz+qpaHoUDXiwLR+1ZhTsyqbtxLnxRKjy4w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736607031; c=relaxed/relaxed;
	bh=/S7RsMxdj1ne5QxEiHyZk2JZuHApikcEL56Y6qd2g7o=;
	h=Content-Type:From:Mime-Version:Subject:Message-Id:Date:Cc:To; b=aB53MoeKCkIgmRDGvJ20JrK3Xtu/krvE3PfXh0ceZsazeHsvU/jItwcfxIKih/0YVoG3ZKnDhwnUPKGlfHqwlXDfB+lc3lAl7v2dyhmXFVcOxwbNjlxR0UOEezBgSXlX0mbkqzhkoTORz/Ag/VY9LQd0IFfHetEcInWkoDpDQVMaP0kAumzGDUZLjv7Nw6tRUin9rA/iVRz1fNj/Z692z6cCBZoP1CEnIrXlqlVqW1TP9abB8L1R9wd510TJazu3nnDgJ5gx+0vQOjSUrTq/W5/hdzo7aRLFMpyIoUSfdDIYwa+WLocnbJ+Tmi6zcJUSdkLh/EUuLvINndE4pCNzXQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=RKqrya7d; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=zVLeKOdJ; dkim-atps=neutral; spf=pass (client-ip=81.169.146.167; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=RKqrya7d;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=zVLeKOdJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.167; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVhK16n4lz306J
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 01:50:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1736607000; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=lRkvNHqyK5XlAuh6r6jERbRFWgRju6SpO5pl7k9amkYTo4xl4mdc7vmBJpGfaWcmag
    vsSn0B0tVezSp0ALVD5vRiiPAuiW/+UYT0sLETpS3upBH6T1w54gOgQuZa/BxEHM9ZiZ
    J8R54nh76kEG/N40KasJONAauicgoaoMjZalzfVI9kl918TKbiVNMDs6DaxWwThFp1Lp
    XdlFqtdLP8Nev3BygDZSKa3/tgHAUqoY9bDDk5WTQAxFoglRYjbf1Y9XbUHDFRghokZt
    sAwaQ1HcW1dXkQ2TbLLa7DiF3kD5daJwljpEGFwAM+zchYQi57ZukaRpwDFKtP5rCUe6
    niyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1736607000;
    s=strato-dkim-0002; d=strato.com;
    h=To:Cc:Date:Message-Id:Subject:From:Cc:Date:From:Subject:Sender;
    bh=/S7RsMxdj1ne5QxEiHyZk2JZuHApikcEL56Y6qd2g7o=;
    b=Ou5WaLEckLFyXU81Vzs5gC4Pkmu7+70nXMXwTeY7ItOz4OnZD+iYFn9DYkRHMqIB/y
    +seDmwmeQyqi1wC7vbDPTsWPManxhWoXzFR1UGQhD/cHGLWX7gHYf+jN7kYId/wOca2g
    pH0gFD5DQ7nWDWqpJvx7Ex052aPs93zhgdPvxQalAvlnHQkgtURe7rY7xuhGlKJ/SKrM
    tsTuEivngZmA8b6icJDbVvGQ63SplcTerxo6yoDd7tv7FYyqXzyAZe3/jhQJAysvKA+B
    tYfKj6vJZCCrOQS68GjXvnZV8pssACeyqMj0ATSDyu+x4e9xxW5S8QtArnh2vh1ZstC0
    tI3Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1736607000;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:Cc:Date:Message-Id:Subject:From:Cc:Date:From:Subject:Sender;
    bh=/S7RsMxdj1ne5QxEiHyZk2JZuHApikcEL56Y6qd2g7o=;
    b=RKqrya7dtMMHzvNn0jdXw35N2hBWMwbq9SGzB2/IBrpwxb6rOLtVwyZ5sNWaVYunY3
    A8dPjC/+X/8qiq4sIAVVjrhqvgZLB+o4dPEkJ46E4dKBBtCycysdZ6gkwlNDJzjKPGhJ
    8GAdNNsYaL00Z574rjL2MBq+k4NqHZ+3dNJj7LURFcbi8dSxZR7V2eqThQKMro3lcEFw
    hI2Vg9CXOboisxvEwS3l889HLtcruzFknlj/znABBAf5OV0/Ti7I3DCp/ZZodXp3OmdA
    4SeWpfIXc4Fs06La8CKzrloHynCri+S8G/v9qNo/inCctIZHIWR5+83M+pQKLbs9/muN
    Hdbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1736607000;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:Cc:Date:Message-Id:Subject:From:Cc:Date:From:Subject:Sender;
    bh=/S7RsMxdj1ne5QxEiHyZk2JZuHApikcEL56Y6qd2g7o=;
    b=zVLeKOdJfaID0ByuekF5FZelS+RSwf4wEMLCgD/pLvWoBUUyYpwHhhN2D+fCi9muen
    kP9wsx0DYYwCHlUQ6kBQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaMrvdtcX133EipGzhGnb3rrLiUtW3TtSfq8MBVvg=="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.16 AUTH)
    with ESMTPSA id ebe9c910BEo0ocG
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 11 Jan 2025 15:50:00 +0100 (CET)
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
Message-Id: <B5B8A435-B985-47CB-8240-AFDAB3692B6A@xenosoft.de>
Date: Sat, 11 Jan 2025 15:49:50 +0100
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 regressions@lists.linux.dev, Trevor Dickinson <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 Christian Zigotzky <info@xenosoft.de>
To: Sean Christopherson <seanjc@google.com>
X-Mailer: iPhone Mail (22C152)
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

=EF=BB=BF

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
>   if (likely(!pfnmap)) {
>       tsize_pages =3D 1UL << (tsize + 10 - PAGE_SHIFT);
> -        pfn =3D __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
> +        pfn =3D kvm_faultin_writable_pfn(slot, gfn, &page);
>       if (is_error_noslot_pfn(pfn)) {
>           if (printk_ratelimit())
>               pr_err("%s: real page not found for gfn %lx\n",
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 893366e53732..7012b583f2e8 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -6800,7 +6800,6 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *=
vcpu)
>   struct page *refcounted_page;
>   unsigned long mmu_seq;
>   kvm_pfn_t pfn;
> -    bool writable;
>=20
>   /* Defer reload until vmcs01 is the current VMCS. */
>   if (is_guest_mode(vcpu)) {
> @@ -6836,7 +6835,7 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *=
vcpu)
>    * controls the APIC-access page memslot, and only deletes the memslot
>    * if APICv is permanently inhibited, i.e. the memslot won't reappear.
>    */
> -    pfn =3D __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, &refcount=
ed_page);
> +    pfn =3D kvm_faultin_writable_pfn(slot, gfn, &refcounted_page);
>   if (is_error_noslot_pfn(pfn))
>       return;
>=20
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index c788d0bd952a..b0af7c7f99da 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1287,6 +1287,14 @@ static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_=
vcpu *vcpu, gfn_t gfn,
>                write ? FOLL_WRITE : 0, writable, refcounted_page);
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
>           int len);
> int kvm_read_guest(struct kvm *kvm, gpa_t gpa, void *data, unsigned long l=
en);
>=20
> base-commit: 2c3412e999738bfd60859c493ff47f5c268814a3
> --

This patch works. Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>

Thanks=


