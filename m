Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9008D7D08
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 10:07:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NURlsjLB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vt5tT11bJz3cVs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 18:07:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NURlsjLB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vt5sh73Gwz30Vg
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2024 18:06:47 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-70245b22365so2106554b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2024 01:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717402004; x=1718006804; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+YI0NLfFFhJ1Ir8e+Xv+54jNSfB0DM2jKBTzfdKYSc=;
        b=NURlsjLBs9Ui3fcH29nM02as5i7E+eeNuJFvk+Z1t55FV2YIOYDRkvq2ukOpmhKYq/
         NOoEaVuGQ5wNcNvIpeOPaIEkWEslgJB307QPXhEIkRV0ZlUu9vqPipiwdcxcAOHr46Bf
         9ULPaXGu7bazRpgiJAEeZtkVSevYXuHMrBfe4wqp08pKz3Ni814gQdgPhJuEy2e+Njdl
         1duCYtOKv/lpvGo7m7AMPs5hZJ6KYkh18vW12nwskyjFcblr9SgOGdd9doV1FkAPqYTY
         mpgKP4nIED2+9l1QYSkLZtZq7nNhJxH1ISjaNgOPKHu8Zg6HfgKpgkjokps7poWyeb6I
         LnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717402004; x=1718006804;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7+YI0NLfFFhJ1Ir8e+Xv+54jNSfB0DM2jKBTzfdKYSc=;
        b=meIXdK0S5HUwZJWqrrS/gpKHHEbtJccFMa1HUSU48fkstyRTnupU7FcSzevWD+q0cp
         onHLr8ZmKJzY945b8GJLQ99BnpvJW6ZHhM2JrPlf7rOH4jnmeUEaWXi+w8oS3mDPRHmy
         Tu8+TxHP/6Wrr+gK8UK9fi8JsJVOroVNPSy6vpHA2OdGfWgaP3h6KKxBvfiCVWKMyzMM
         8GWq2ZOqyZenDu+jJfuokmVEnSEIxMW9DfqJkC17+uVyzMjeoBmk5i5eJohobnkeryZz
         lEe/+paAaSTdkqBLiZ4o7y6jG5W5YsEUyxrBWuD7xiX4+m9xIDD+/z2WkZ+tNLasvTqE
         nNmA==
X-Forwarded-Encrypted: i=1; AJvYcCWJHf5Eyh+f9BVNC3i//hOPQMmMowp6cLh+5GBngv6tZxmGy108hPTrkaikgPfxGemlh8au7czzJuYxu/7S0TZAjEtv5aHLj7tOIX8m3A==
X-Gm-Message-State: AOJu0YyDvuZKYKv2NraR6WpSUbrYf979Gx5oNby/mClQk++CrG+7TyKa
	CT7J/B7XpopYGo0TFnPO6JoD/ufHp1B0txp7T0NomBRV98wawQIo
X-Google-Smtp-Source: AGHT+IFaSCiBLUqxuj94VGdEbKH32ndbrZ5lhrXNp1WeqlQIk5zQGJLCHuJbczmyaB3iwXX3V10u8g==
X-Received: by 2002:a05:6a20:1585:b0:1b2:5674:2225 with SMTP id adf61e73a8af0-1b26f205176mr8935937637.28.1717402003835;
        Mon, 03 Jun 2024 01:06:43 -0700 (PDT)
Received: from localhost ([1.128.198.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323dd824sm59986955ad.128.2024.06.03.01.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 01:06:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Jun 2024 18:06:34 +1000
Message-Id: <D1Q874JKY23A.3LB0GHUQQEEAW@gmail.com>
Subject: Re: [PATCH v1 RESEND] arch/powerpc/kvm: Fix doorbell emulation by
 adding DPDES support
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Gautam Menghani" <gautam@linux.ibm.com>
X-Mailer: aerc 0.17.0
References: <20240522084949.123148-1-gautam@linux.ibm.com>
 <D1Q54PY40E3B.22QS5DMQRA58N@gmail.com>
 <r74chlv6bgs5csvuf4nxxtylmgartvibftp3xuztyfuynqetp5@ythddpzo6yfi>
In-Reply-To: <r74chlv6bgs5csvuf4nxxtylmgartvibftp3xuztyfuynqetp5@ythddpzo6yfi>
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
Cc: kvm@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, stable@vger.kernel.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jun 3, 2024 at 5:09 PM AEST, Gautam Menghani wrote:
> On Mon, Jun 03, 2024 at 03:42:22PM GMT, Nicholas Piggin wrote:
> > On Wed May 22, 2024 at 6:49 PM AEST, Gautam Menghani wrote:
> > > Doorbell emulation is broken for KVM on PowerVM guests as support for
> > > DPDES was not added in the initial patch series. Due to this, a KVM o=
n
> > > PowerVM guest cannot be booted with the XICS interrupt controller as
> > > doorbells are to be setup in the initial probe path when using XICS
> > > (pSeries_smp_probe()). Add DPDES support in the host KVM code to fix
> > > doorbell emulation.
> >=20
> > This is broken when the KVM guest has SMT > 1? Or is it broken for SMT=
=3D1
> > as well? Can you explain a bit more of what breaks if it's the latter?
>
> Yes, doorbells are only setup when we use SMT>1 and interrupt controller
> is XICS. So without this patch, L2 KOP guest with XICS IC mode and SMT>1=
=20
> does not boot. SMT 1 is fine in all cases.

Okay good. Make that clear in the changelog, ideally if you can give
a recipe the reader is able to recreate is good too, (e.g., run the
guest machine with -smp 4,threads=3D4 and xive=3Doff boot parameter).

> > > Fixes: 6ccbbc33f06a ("KVM: PPC: Add helper library for Guest State Bu=
ffers")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> > > ---
> > > v1 -> v1 resend:
> > > 1. Add the stable tag
> > >
> > >  Documentation/arch/powerpc/kvm-nested.rst     |  4 +++-
> > >  arch/powerpc/include/asm/guest-state-buffer.h |  3 ++-
> > >  arch/powerpc/include/asm/kvm_book3s.h         |  1 +
> > >  arch/powerpc/kvm/book3s_hv.c                  | 14 +++++++++++++-
> > >  arch/powerpc/kvm/book3s_hv_nestedv2.c         |  7 +++++++
> > >  arch/powerpc/kvm/test-guest-state-buffer.c    |  2 +-
> > >  6 files changed, 27 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/arch/powerpc/kvm-nested.rst b/Documentatio=
n/arch/powerpc/kvm-nested.rst
> > > index 630602a8aa00..5defd13cc6c1 100644
> > > --- a/Documentation/arch/powerpc/kvm-nested.rst
> > > +++ b/Documentation/arch/powerpc/kvm-nested.rst
> > > @@ -546,7 +546,9 @@ table information.
> > >  +--------+-------+----+--------+----------------------------------+
> > >  | 0x1052 | 0x08  | RW |   T    | CTRL                             |
> > >  +--------+-------+----+--------+----------------------------------+
> > > -| 0x1053-|       |    |        | Reserved                         |
> > > +| 0x1053 | 0x08  | RW |   T    | DPDES                            |
> > > ++--------+-------+----+--------+----------------------------------+
> > > +| 0x1054-|       |    |        | Reserved                         |
> > >  | 0x1FFF |       |    |        |                                  |
> > >  +--------+-------+----+--------+----------------------------------+
> > >  | 0x2000 | 0x04  | RW |   T    | CR                               |
> > > diff --git a/arch/powerpc/include/asm/guest-state-buffer.h b/arch/pow=
erpc/include/asm/guest-state-buffer.h
> > > index 808149f31576..d107abe1468f 100644
> > > --- a/arch/powerpc/include/asm/guest-state-buffer.h
> > > +++ b/arch/powerpc/include/asm/guest-state-buffer.h
> > > @@ -81,6 +81,7 @@
> > >  #define KVMPPC_GSID_HASHKEYR			0x1050
> > >  #define KVMPPC_GSID_HASHPKEYR			0x1051
> > >  #define KVMPPC_GSID_CTRL			0x1052
> > > +#define KVMPPC_GSID_DPDES			0x1053
> > > =20
> > >  #define KVMPPC_GSID_CR				0x2000
> > >  #define KVMPPC_GSID_PIDR			0x2001
> > > @@ -110,7 +111,7 @@
> > >  #define KVMPPC_GSE_META_COUNT (KVMPPC_GSE_META_END - KVMPPC_GSE_META=
_START + 1)
> > > =20
> > >  #define KVMPPC_GSE_DW_REGS_START KVMPPC_GSID_GPR(0)
> > > -#define KVMPPC_GSE_DW_REGS_END KVMPPC_GSID_CTRL
> > > +#define KVMPPC_GSE_DW_REGS_END KVMPPC_GSID_DPDES
> > >  #define KVMPPC_GSE_DW_REGS_COUNT \
> > >  	(KVMPPC_GSE_DW_REGS_END - KVMPPC_GSE_DW_REGS_START + 1)
> > > =20
> > > diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/inc=
lude/asm/kvm_book3s.h
> > > index 3e1e2a698c9e..10618622d7ef 100644
> > > --- a/arch/powerpc/include/asm/kvm_book3s.h
> > > +++ b/arch/powerpc/include/asm/kvm_book3s.h
> > > @@ -594,6 +594,7 @@ static inline u##size kvmppc_get_##reg(struct kvm=
_vcpu *vcpu)		\
> > > =20
> > > =20
> > >  KVMPPC_BOOK3S_VCORE_ACCESSOR(vtb, 64, KVMPPC_GSID_VTB)
> > > +KVMPPC_BOOK3S_VCORE_ACCESSOR(dpdes, 64, KVMPPC_GSID_DPDES)
> > >  KVMPPC_BOOK3S_VCORE_ACCESSOR_GET(arch_compat, 32, KVMPPC_GSID_LOGICA=
L_PVR)
> > >  KVMPPC_BOOK3S_VCORE_ACCESSOR_GET(lpcr, 64, KVMPPC_GSID_LPCR)
> > >  KVMPPC_BOOK3S_VCORE_ACCESSOR_SET(tb_offset, 64, KVMPPC_GSID_TB_OFFSE=
T)
> > > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_h=
v.c
> > > index 35cb014a0c51..cf285e5153ba 100644
> > > --- a/arch/powerpc/kvm/book3s_hv.c
> > > +++ b/arch/powerpc/kvm/book3s_hv.c
> > > @@ -4116,6 +4116,11 @@ static int kvmhv_vcpu_entry_nestedv2(struct kv=
m_vcpu *vcpu, u64 time_limit,
> > >  	int trap;
> > >  	long rc;
> > > =20
> > > +	if (vcpu->arch.doorbell_request) {
> > > +		vcpu->arch.doorbell_request =3D 0;
> > > +		kvmppc_set_dpdes(vcpu, 1);
> > > +	}
> >=20
> > This probably looks okay... hmm, is the v1 KVM emulating doorbells
> > correctly for SMT L2 guests? I wonder if doorbell emulation isn't
> > broken there too because the L1 code looks to be passing in vc->dpdes
> > but all the POWER9 emulation code uses doorbell_request.
> >=20
>
> Yes launching SMT L2 on V1 API fails with a kernel Oops, I'll see if I
> can fix that as well.

Okay then I didn't miss something. Thanks v1 fix would be good too.
I think it should look something like putting doorbell_request into
hv_guest_state->dpdes that make the H_ENTER_NESTED call with.

For v1 you will need to restore the state back from dpdes back to
doorbell_request on exit, because the L0 doesn't keep it for you.

Thanks,
Nick
