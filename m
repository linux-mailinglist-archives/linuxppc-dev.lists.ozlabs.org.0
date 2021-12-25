Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE99647F2E8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 11:17:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLfxW5qDGz305W
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 21:17:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fAYdn9Py;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fAYdn9Py; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLfwq5H7Yz2x9B
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 21:16:41 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id u20so9518288pfi.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 02:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=AiLBuSRxPrOC9G+ecpzrT+nfcX/wNK5T9ujCVDlu8KE=;
 b=fAYdn9PyWyIqj3OH+YtDuI5yLgQDLK6FnMg/THs8eW5a8LhrRGBb0YUcyyVvfueX32
 nVJ4TdBQZ9ADwrsnHLIKxKuSs7ptFCh+XGBdwOSk0LmlIwwHfExQwSKth6WONvqi+ia6
 MYvzE9t9qoy88gqb6SoqifFV7esV++Th6xqgnm2Eyw4nttdgIq/5MwgzgDPcCQodN0Xk
 rEGV74fj/frefWqUP0g1mV1LW7acsaQpP1luQ88Vg49JvnuS7cQzA4fJuu4Fy6h+jcqW
 vSigyoARse5m+7LtOdyaPXp8F7BqfPKwoO2N++nBqwDC9MwCp0Ex81nwqqYx74J3ZHJe
 wqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=AiLBuSRxPrOC9G+ecpzrT+nfcX/wNK5T9ujCVDlu8KE=;
 b=sOD5vPe0hbv1y8MKrtRXP4m6oH9x8GIcHqIC1uwOpsPUz1GcFjn/uSj06IBmmHv5yx
 g/yne2PGNgKVM4qFPea9I9eLF4/6s5nQBOO31pqGu0bXDRBO+zG9RwSgp9rNLD50qabH
 kRsiJ97MXqjdVdQoxY0joW7erDkfptVimAwqTpHVs8V3uYD3O6hE6/k8GIm4tLVmM9ye
 mO+tIwSrxIg9y//pk59v/l3YjyakLTtymF5Pc7ky6YGsFQ3/f+t5TqcEwPZ6R61nJVAm
 ObcxEGGDa7BI4YzczyRtKQy7dpymPfx9tIR1SuO1z4tL1Z5/69HM1gREKO09jV40BAze
 TbYg==
X-Gm-Message-State: AOAM531mjZ3L23MLCQtOwpBaqIm+cXOtVnZ84jRNVzuweSaXdXIoi1FX
 /dV60kTdpLDBDawwDp2j7BSuwt70mHs=
X-Google-Smtp-Source: ABdhPJyFPV+d6OnL1RxRjtWxEAE4KAyN3wF7hUCLdGI3gvZZYJ07qiGz65Cg+e/tXdpt9iWtc/ZSYg==
X-Received: by 2002:a63:6c03:: with SMTP id h3mr8943567pgc.458.1640427398948; 
 Sat, 25 Dec 2021 02:16:38 -0800 (PST)
Received: from localhost (121-44-67-22.tpgi.com.au. [121.44.67.22])
 by smtp.gmail.com with ESMTPSA id c9sm11372447pfb.126.2021.12.25.02.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 02:16:38 -0800 (PST)
Date: Sat, 25 Dec 2021 20:16:34 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/3] KVM: PPC: Fix mmio length message
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20211223211528.3560711-1-farosas@linux.ibm.com>
 <20211223211528.3560711-4-farosas@linux.ibm.com>
In-Reply-To: <20211223211528.3560711-4-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1640427230.38pm5r9iop.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of December 24, 2021 7:15 am:
> We check against 'bytes' but print 'run->mmio.len' which at that point
> has an old value.
>=20
> e.g. 16-byte load:
>=20
> before:
> __kvmppc_handle_load: bad MMIO length: 8
>=20
> now:
> __kvmppc_handle_load: bad MMIO length: 16
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

This patch fine, but in the case of overflow we continue anyway here.
Can that overwrite some other memory in the kvm_run struct?

This is familiar, maybe something Alexey has noticed in the past too?
What was the consensus on fixing it? (at least it should have a comment
if it's not a problem IMO)

Thanks,
Nick

> ---
>  arch/powerpc/kvm/powerpc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 793d42bd6c8f..7823207eb8f1 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -1246,7 +1246,7 @@ static int __kvmppc_handle_load(struct kvm_vcpu *vc=
pu,
> =20
>  	if (bytes > sizeof(run->mmio.data)) {
>  		printk(KERN_ERR "%s: bad MMIO length: %d\n", __func__,
> -		       run->mmio.len);
> +		       bytes);
>  	}
> =20
>  	run->mmio.phys_addr =3D vcpu->arch.paddr_accessed;
> @@ -1335,7 +1335,7 @@ int kvmppc_handle_store(struct kvm_vcpu *vcpu,
> =20
>  	if (bytes > sizeof(run->mmio.data)) {
>  		printk(KERN_ERR "%s: bad MMIO length: %d\n", __func__,
> -		       run->mmio.len);
> +		       bytes);
>  	}
> =20
>  	run->mmio.phys_addr =3D vcpu->arch.paddr_accessed;
> --=20
> 2.33.1
>=20
>=20
