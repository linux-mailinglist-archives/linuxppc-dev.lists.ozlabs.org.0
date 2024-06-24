Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55703915275
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 17:33:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BZDmtJp9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7Bmr6CqZz3dLS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 01:33:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BZDmtJp9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3g5f5zgykdmy4qmzvos00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7Bm70QvDz3dH2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 01:32:21 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2c8066074b5so2847267a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 08:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719243140; x=1719847940; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WawAVsLJ2wrVp06E1yLAnPzm2a05JueYQ9ExxNigc3k=;
        b=BZDmtJp9WZqlMith2ZS1v7BhPdDq89R+36lXS0Zil975Iz4FJmEF4RF8YZ6R8pQM8J
         sMP+9hRn/KKhaPvy0UY+ILIYJONQa2QMh0GNa8QVMT8Bci7pzykkAJP9AELwqFPJezF7
         s7JPJyTYZg4nmoZsVh/hVCuws3i94bDD0j3BdgqS1B0sSgkF98GPit4hkqM/xTJlR43q
         4+lMGOyGYV/aJ9mDMsir94pNKkj3bBaHL3yUxCZAjqqepypqOiD72PCdjMjI2AmhMTz4
         wtuEQn9EcDrmj6+kEWsMczvLGtj7mHJ88Gwcl6cCtHf696kvF0GHWFUq1ovptTevYQrF
         Ne+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719243140; x=1719847940;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WawAVsLJ2wrVp06E1yLAnPzm2a05JueYQ9ExxNigc3k=;
        b=TUkyS6bJOyKP0U0FcjzmhyqM3OLwVTNsYh7Xh2qJrFaW/Uuic6/Pm2GRqGSwA/Zp0F
         rBjyo1aUC0geYZ0Gbtm5BNXQXVDYrKmU8APSDiQHgPlNf8vEDuoX7n6YBBLamkYyNF9K
         R5MwB80l1rNXBPR5SMkOoWpwJtPXqxC6HRv1hHujUMD6rfrsEl9gIELs2QGVABFdvZY1
         Z9Ci8czoi8AOMOVkyyGPhMIv7jwopnaTz5yUPph5Y5lMjiYRpE1xdCqh2MSlDTs3vpZC
         zHQMamqHH3T3IxsobZWt3yUZXWAUs0QRNCxMMyFk8kW/Q2mPNc/OsNV2Y36txtFaLd7y
         up5g==
X-Forwarded-Encrypted: i=1; AJvYcCXeWyyZR2dZfbTcPH8s7h9ystuLX0a1+aG7VbDeTDb+LqYinGQt+J5+Ptw10u0NqO1YgafgTPgB97yvzvIdNZfF2bXe7158y6caYTTJ1A==
X-Gm-Message-State: AOJu0Yyq6GK2rL3cDI8cnzsoqnUnLiBSoG41oCifjXgu/I82no7MyvJZ
	f7irf3rBkyxT5NAB6C063E9nmhcEOF2WltkIkWxee9iyYDxfmpY4Q6j/WPIxlP0pxEvczLXOEtO
	Lpw==
X-Google-Smtp-Source: AGHT+IEtazAEW7Z9YwGGcKXL++Dckd0kAEwC6pBQKn1v/nxqOqzOdwWoLb56caKLmrQdFmUesETPkh89cIs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:2ecc:b0:2c6:d13f:3f9e with SMTP id
 98e67ed59e1d1-2c8489b9ed7mr123696a91.1.1719243139430; Mon, 24 Jun 2024
 08:32:19 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:32:18 -0700
In-Reply-To: <504fa0a7264d4762afda2f13c3525ce5@huawei.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com> <504fa0a7264d4762afda2f13c3525ce5@huawei.com>
Message-ID: <ZnmRgqD6FmXNNzzI@google.com>
Subject: Re: [PATCH 00/26] KVM: vfio: Hide KVM internals from others
From: Sean Christopherson <seanjc@google.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "x86@kernel.org" <x86@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>, Andrew Thornton <andrewth@google.com>, Ingo Molnar <mingo@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Venkatesh Srinivas <venkateshs@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tony Krowiak <akrowiak@linux.ibm.com>, Anish Ghulati <aghulati@google.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Oliver Upton <oliver.upton@linux.dev>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 20, 2024, Shameerali Kolothum Thodi wrote:
> > This is a borderline RFC series to hide KVM's internals from the rest o=
f
> > the kernel, where "internals" means data structures, enums, #defines,
> > APIs, etc. that are intended to be KVM-only, but are exposed everywhere
> > due to kvm_host.h (and other headers) living in the global include path=
s.
>
> Hi Sean,
>=20
> Just thought of checking with you on this series. Do you have plans to re=
vive this
> series?

Yep!

> The reason I am asking is, on ARM64/KVM side we do have a requirement
> to share the KVM VMID with SMMUV3. Please see the RFC I sent out earlier =
this
> year[1]. The series basically provides a way for KVM to pin a VMID and al=
so
> associates an iommufd ctx with a struct kvm * to retrieve that VMID.=20
>=20
> As mentioned above, some of the patches in this series(especially 1-4 & 6=
) that
> does the VFIO cleanups and dropping CONFIG_KVM_VFIO looks very straightfo=
rward
> and useful. I am thinking of including those when I re-spin my RFC series=
, if
> that=E2=80=99s ok.

Please don't include them, as the patch they build towards (patch 5) is bug=
gy[*],
and I am fairly certain that at least some of the patches will change signi=
ficantly.

I expect to re-start working on the series in ~2 weeks, and am planning on =
actively
pushing the series (i.e. not ignoring it for months on end).

[*] https://lore.kernel.org/all/ZWp_q1w01NCZi8KX@google.com

> Please let me know your thoughts.
>
> [1]. https://lore.kernel.org/linux-iommu/20240209115824.GA2922446@myrica=
=20
