Return-Path: <linuxppc-dev+bounces-6743-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC45A501B0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 15:20:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7F855F0gz3c1w;
	Thu,  6 Mar 2025 01:20:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.54 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741184437;
	cv=pass; b=WeRR/Q29DPN58XoAGGM2VX+mnhMx6a1YsYDUOW3ENuRJuI8o6JzjPm6vVCngGtTjBFwnZM7/Q1kyI1ecniKKimYkui9UWnyF23QeLQq2/jkQnoEC2ggEJgSEHIsgH3Fm1ZfoVLdsSXZ7Uzzq7xjFaGbowMFNkP1nsXbGjhQ53SW+UoI8EY9A3ecaYoKE/g04UZyCWQoopscHEzP3BlchdJrEflgzqYUQ49Rmut6Iaulbd1LJfn579fKEsgqy9cLfruTX49TgC24WJkaU8E+fQJ3J+OalfUXRto9nO6936lX2qBn2hIMsZrrzZuNVDpakWKMrzC4asJNGsbseZ9+rwA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741184437; c=relaxed/relaxed;
	bh=XG+agOvW8ppEzopPxKXPNXl9FwqxrC3qL6otfZY6Dvg=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=okHx46iZEz1kux1pi+yenSYllYNKLJZoQdRoFlgH3G4Kc0l/VJfWiRcAIZEHP9pQnsIx3wkCsJWw1yxPslS9Y93RrxiGMFmBxkcD8A1qoTOSTczS8uqEh31hn7qEiLjxz4cjUxHRqqxHYGaVoYf6y/owytWPN4g6Wj7vOlL6+OjP1LvbKJd2Wj8tXkZcPYk/Kn823DfrW8yCnxfjXyNFpBN5ODrh2RzLbIonlC1wlx628TuZ1lF1DiTA+BldB0HPf/NhP7Pc391E19eJURRA0ibmZigwnqmloxrKbs/3aKGTNZZx5bjK07wvhwKa56LPLqBGDd7LzTjOg3tHBUCHUQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=fUhr+fZd; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=VEbEw3V/; dkim-atps=neutral; spf=pass (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=fUhr+fZd;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=VEbEw3V/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 359 seconds by postgrey-1.37 at boromir; Thu, 06 Mar 2025 01:20:33 AEDT
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7F815N14z3c1Q
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Mar 2025 01:20:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741184065; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=CWDaimXSwk1sUD60tEP0N53EtqW1F95Qgk/sD3IZShhOFHvPeXIYxB3HtC1O/ITF+B
    V5vGlTsRd8Nb60t++0cAhO7qLZhlbmllEoCYZcAzwwuYIsEojFoW9rzaFbzPdhxSPmBb
    jhJT2kQ+MT3HyP/bUME3ARa/FI5FYtmj3fyq9+S8dnmD8Mkb1/sm7nr8i0Cm6pcMryVQ
    rIHeNo/9MggU1Dduuvo6m4/P66bePfKRC+KEYO1BPq6IIUeCjJ3ea72np6nPhRpa+gGa
    kMwbXI+UhsEINWsgAMJMipg7yTMEyNJnZYuLBi4W14KqrjvAReGSCCq27gpQXWemYnd0
    p9uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1741184065;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=XG+agOvW8ppEzopPxKXPNXl9FwqxrC3qL6otfZY6Dvg=;
    b=KGgVBEjIz52vYzYAPtj1IaG+RFhJaIx6Xr8IZEgvMZ6ZyP8Ub+rsGSUusZYo+GrvOe
    PIF4ynLeSI9C5yV8nuD6i/fEf8TRWoNGV7f84X0gv3IpZFZJCfDw+WgLla/YXGc2mfUN
    YdynFpiRDuQi0MERFBCLdnRGq84MmaibU/Vehxa9QyVevVTFwO1vEINFkXy8w6O4324X
    kNv5ato72i+9vb2iIH1+IRbxPi4kpBdPLRjtvzQZcnyZQIiQdRTYO9B9ccE1qwZzLNWO
    TT8/0oQe4CYVJ+Xz08Li9Aom4utxR4fHn6153q2KSPtL4vXahQHpKsMuwugtIyyQOsHH
    6jWA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1741184065;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=XG+agOvW8ppEzopPxKXPNXl9FwqxrC3qL6otfZY6Dvg=;
    b=fUhr+fZdAUFqeeHI5Oj6gCyIZ7DKOIF0Si4KnTCNnzDVy/1E8xwUVCXQp1G26IkPBd
    cfmQGQtt8FycM9BYf5ascZy1JarpwGoYg70a3AC7yH0LvcC3ERGRm6Mw3NgBUoZQA0O3
    1pgDlE3ykIgrNB3huyq0B6wQ+MyvEES+eqen6b9lyL0ReoaQPs1ht8EpKBDL8aR3SJQh
    z/S5WgovSOd5FVK5IZtR6gHgT5r9o3tk9v0tnEk1wUDOmlhzLXb/OOwHBbhRqD3Zg9P9
    OSbPtfHXtmDdQoEJmslHtSHsujSBL18ekSj/Ci+KcRIf3gdqmFjr16MEAYf0MiB3/K97
    x+mg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1741184065;
    s=strato-dkim-0003; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=XG+agOvW8ppEzopPxKXPNXl9FwqxrC3qL6otfZY6Dvg=;
    b=VEbEw3V/vVNB/Bx0MOVubiCRR4pqIA9VSi92Emrv6RNVDNnP12qsPKxZLFuko8ZQGL
    KgfkUAqhQ14RVHRvioCA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7VZrgs3iXAXqZnhDuuhhnGfQQmpdNZeQ5Fv1TtRo="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id e2a9e4125EEO3YE
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 5 Mar 2025 15:14:24 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
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
Subject: [Kernel 6.12.17] [PowerPC e5500] KVM HV compilation error
Date: Wed, 5 Mar 2025 15:14:13 +0100
Message-Id: <DDEA8D1B-0A0F-4CF3-9A73-7762FFEFD166@xenosoft.de>
References: <20250112095527.434998-4-pbonzini@redhat.com>
Cc: Trevor Dickinson <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>
In-Reply-To: <20250112095527.434998-4-pbonzini@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, seanjc@google.com, linuxppc-dev@lists.ozlabs.org,
 regressions@lists.linux.dev, Greg KH <greg@kroah.com>
X-Mailer: iPhone Mail (22D72)
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi All,

The stable long-term kernel 6.12.17 cannot compile with KVM HV support for e=
5500 PowerPC machines anymore.

Bug report: https://github.com/chzigotzky/kernels/issues/6

Kernel config: https://github.com/chzigotzky/kernels/blob/6_12/configs/x5000=
_defconfig

Error messages:

arch/powerpc/kvm/e500_mmu_host.c: In function 'kvmppc_e500_shadow_map':
arch/powerpc/kvm/e500_mmu_host.c:447:9: error: implicit declaration of funct=
ion '__kvm_faultin_pfn' [-Werror=3Dimplicit-function-declaration]
   pfn =3D __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
         ^~~~~~~~~~~~~~~~~
  CC      kernel/notifier.o
arch/powerpc/kvm/e500_mmu_host.c:500:2: error: implicit declaration of funct=
ion 'kvm_release_faultin_page'; did you mean 'kvm_read_guest_page'? [-Werror=
=3Dimplicit-function-declaration]
  kvm_release_faultin_page(kvm, page, !!ret, writable);

After that, I compiled it without KVM HV support.

Kernel config: https://github.com/chzigotzky/kernels/blob/6_12/configs/e5500=
_defconfig

Please check the error messages.

Thanks,
Christian=


