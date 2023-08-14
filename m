Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F2F77B390
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 10:13:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=e5Qk7OKn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPRwb0MWjz30Ng
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 18:13:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=e5Qk7OKn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPRvj0fdpz2xP6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 18:12:16 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68783b2e40bso2788287b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 01:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692000734; x=1692605534;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UotDdyQGTC4EoLCNaaGpiOUYo68Nb+c5bWned835Hco=;
        b=e5Qk7OKnnqWrYRCniPWElagFd0f1rj6Qxp5kyXXK+J7ooWeRbaCyWiCzdSvYuSl/9Y
         6KLN0C+GupvzLyOS0mLfSfhkqJR+9T+4QfDauCILtY/WmOk/f7cWakw7MJ28UBrPY2Mm
         5OAQtJT6AmdN2dqZWaQkR6uHvq2Uhhbuu8tFd0IS0jTIOsygempZpxPAnYVlzZ8IAdH0
         WVmKxgbzZjW7LB+u92YfLNu5c15P5Tetmr/IYbYAZlW+FicnxFMv75ZT1dJVjPSqOQoi
         xDImXI82JWvd/nYPhDM4L73OHyGUrROue6J9FBOyQT+q9x6ecfMTEBn3MmAd31RT00+E
         9OPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692000734; x=1692605534;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UotDdyQGTC4EoLCNaaGpiOUYo68Nb+c5bWned835Hco=;
        b=PSWWC7/Z3C2loRytvPiGJBVwmgZnyXWJXeHlLgozkCedNOqZZfGGfNHYvByQw6JDou
         iJqGSlU5drNKBzf+yQaRp37E2m+ECItm7na1KcZkboWnCF4c9R9bp8V243O6c2VcOg34
         QDO3xaSTDR5bH0MnW+onHewLm8rVTGbaTXyiS0Jj6YJNApkuJ3s/TmxHUmjL0HIC1rcw
         wsuHxrbBlLYXshxzUd/hINUctLEYGTZcjIeEdbPoRwdd9D7/RBpcgNtIec/HBjNNxwmW
         g5J+2HgGmGo9LY1ZAljs/Brcax0d75Ys1+EShpaxMJi9HkhoGpib9+wBjYt2zASEhtxD
         mCAg==
X-Gm-Message-State: AOJu0YzIkBFE8Vc2671qBAXT4vzc863l/vITdMmkpBKWOopeORGE6NUK
	A4VFmIpG6g7WXIllm5Rds7M=
X-Google-Smtp-Source: AGHT+IFowllIVae+ymsdb38SvbxhHy8lJiRHiio7ZFnqr6A9sNLRAO2Rqy+t8W5i0UhOEg4eMXj+1w==
X-Received: by 2002:a05:6a00:1a50:b0:668:73f5:dce0 with SMTP id h16-20020a056a001a5000b0066873f5dce0mr8770313pfv.29.1692000734120;
        Mon, 14 Aug 2023 01:12:14 -0700 (PDT)
Received: from localhost ([61.68.161.249])
        by smtp.gmail.com with ESMTPSA id j20-20020aa783d4000000b00682c864f35bsm7656159pfn.140.2023.08.14.01.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 01:12:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Aug 2023 18:12:07 +1000
Message-Id: <CUS477NDPEQI.27SBUCRNYD0XG@wheely>
Subject: Re: [PATCH v3 4/6] KVM: PPC: Book3s HV: Hold LPIDs in an unsigned
 long
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jniethe5@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.15.2
References: <20230807014553.1168699-1-jniethe5@gmail.com>
 <20230807014553.1168699-5-jniethe5@gmail.com>
In-Reply-To: <20230807014553.1168699-5-jniethe5@gmail.com>
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
Cc: mikey@neuling.org, kvm@vger.kernel.org, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, gautam@linux.ibm.com, kvm-ppc@vger.kernel.org, kconsul@linux.vnet.ibm.com, vaibhav@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Aug 7, 2023 at 11:45 AM AEST, Jordan Niethe wrote:
> The LPID register is 32 bits long. The host keeps the lpids for each
> guest in an unsigned word struct kvm_arch. Currently, LPIDs are already
> limited by mmu_lpid_bits and KVM_MAX_NESTED_GUESTS_SHIFT.
>
> The nestedv2 API returns a 64 bit "Guest ID" to be used be the L1 host
> for each L2 guest. This value is used as an lpid, e.g. it is the
> parameter used by H_RPT_INVALIDATE. To minimize needless special casing
> it makes sense to keep this "Guest ID" in struct kvm_arch::lpid.
>
> This means that struct kvm_arch::lpid is too small so prepare for this
> and make it an unsigned long. This is not a problem for the KVM-HV and
> nestedv1 cases as their lpid values are already limited to valid ranges
> so in those contexts the lpid can be used as an unsigned word safely as
> needed.
>
> In the PAPR, the H_RPT_INVALIDATE pid/lpid parameter is already
> specified as an unsigned long so change pseries_rpt_invalidate() to
> match that.  Update the callers of pseries_rpt_invalidate() to also take
> an unsigned long if they take an lpid value.

I don't suppose it would be worth having an lpid_t.

> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xiv=
e.c
> index 4adff4f1896d..229f0a1ffdd4 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -886,10 +886,10 @@ int kvmppc_xive_attach_escalation(struct kvm_vcpu *=
vcpu, u8 prio,
> =20
>  	if (single_escalation)
>  		name =3D kasprintf(GFP_KERNEL, "kvm-%d-%d",
> -				 vcpu->kvm->arch.lpid, xc->server_num);
> +				 (unsigned int)vcpu->kvm->arch.lpid, xc->server_num);
>  	else
>  		name =3D kasprintf(GFP_KERNEL, "kvm-%d-%d-%d",
> -				 vcpu->kvm->arch.lpid, xc->server_num, prio);
> +				 (unsigned int)vcpu->kvm->arch.lpid, xc->server_num, prio);
>  	if (!name) {
>  		pr_err("Failed to allocate escalation irq name for queue %d of VCPU %d=
\n",
>  		       prio, xc->server_num);

I would have thought you'd keep the type and change the format.

Otherwise seems okay too.

Thanks,
Nick
