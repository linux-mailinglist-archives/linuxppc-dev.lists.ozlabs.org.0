Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E668C0B19
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 07:43:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DA6wn3eo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZgt76VyXz3cTt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 15:43:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DA6wn3eo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZgsN0hvxz3cCb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 15:43:02 +1000 (AEST)
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-36c791e9faaso2407985ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 May 2024 22:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715233374; x=1715838174; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPVPOugjACikRDkDRBDlmRlOvI7PSTQC76vgEtwmocw=;
        b=DA6wn3eo8y/DPAqfpxDAEsDScDX9FDn54cqXZ77xBE1cXbj29tSXwWDfdRBS7qEMHU
         +CmDZlnuUywySixJOk3lvaF+wFP9lR2vkBd3vX83Xl5HzGmdpp3l0UQPO/sLEP/azY+u
         /0qs8JfKQhK4/I4QdcRIqDHZIe1Dvp4lNhpqaHAxhAS9Bh+gyxYYYB2n+jIpEWP4o9Fu
         qYRp+X+ZDBtCXealEWYWCER9MtllduGzumecHu7YD+ucKZcF3gCQIeEbg1CugnFqT+et
         JF5q4IBQ3PiLHuk4qrRfjjB8lfn7Fgf4iklzhCrLl5DDIAx913arqdwnWU193NO5t3u8
         hHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715233374; x=1715838174;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YPVPOugjACikRDkDRBDlmRlOvI7PSTQC76vgEtwmocw=;
        b=Ptno8BBgi6/gJN7H1/2HUHCf9v9fTLftSzfMm/NpW4i02G8etRx8l9YdVcx0p21rHT
         wClYofaOUmUqM9qj1Fi8+HO+wBpHWDqpMU7NqACqvkDDSfrHeuDESiIvCHUA3Yd/JisP
         uny1wuRd50fvKoOrmpchxV3MCCGBJYQXPD+IgdNtrkyGH8bmmP+E8FviVLdYBB5rwEOH
         J3q20pHZNAcvQrPRPAq8LDb3EdGRsBC1T7JklDliaCr56r73AueYy8nU/r4om1IGaG4s
         ZCe8ptuQue5A9quQ13NLigRiKlHUnfSSe+qfxc8oQHLruLjmw9iYwXCYLbD3VcKX9ivJ
         LyUA==
X-Gm-Message-State: AOJu0YwUlagXuahi7KBKKuU/MdP2kB7fC//7DBXtLRnHQU4BPdVmIGal
	9D876C+OV2DkG5LzqtAKy8BRo0VjLl+zCXqIw51hExABEq0Sm8sC
X-Google-Smtp-Source: AGHT+IGaX1LBzAaXSqkJ7mPuBzhTnF/6aDKQom/GvTfcRaMg49BEJwfb5g2n1M+BUs7ywSg4q7wtsQ==
X-Received: by 2002:a05:6e02:160e:b0:36c:51c0:555e with SMTP id e9e14a558f8ab-36caecd6ea3mr54883395ab.5.1715233373672;
        Wed, 08 May 2024 22:42:53 -0700 (PDT)
Received: from localhost (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6340c99be0esm495803a12.45.2024.05.08.22.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 22:42:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 May 2024 15:42:46 +1000
Message-Id: <D14VHEQLAB3V.30DDBZFDKZVGY@gmail.com>
Subject: Re: [PATCH v6] arch/powerpc/kvm: Add support for reading VPA
 counters for pseries guests
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>, "Gautam Menghani"
 <gautam@linux.ibm.com>, <christophe.leroy@csgroup.eu>,
 <naveen.n.rao@linux.ibm.com>
X-Mailer: aerc 0.17.0
References: <20240506145605.73794-1-gautam@linux.ibm.com>
 <87o79gmqek.fsf@mail.lhotse>
In-Reply-To: <87o79gmqek.fsf@mail.lhotse>
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed May 8, 2024 at 10:36 PM AEST, Michael Ellerman wrote:
> Gautam Menghani <gautam@linux.ibm.com> writes:
> > PAPR hypervisor has introduced three new counters in the VPA area of
> > LPAR CPUs for KVM L2 guest (see [1] for terminology) observability - 2
> > for context switches from host to guest and vice versa, and 1 counter
> > for getting the total time spent inside the KVM guest. Add a tracepoint
> > that enables reading the counters for use by ftrace/perf. Note that thi=
s
> > tracepoint is only available for nestedv2 API (i.e, KVM on PowerVM).
> ...
> > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.=
c
> > index 8e86eb577eb8..ed69ad58bd02 100644
> > --- a/arch/powerpc/kvm/book3s_hv.c
> > +++ b/arch/powerpc/kvm/book3s_hv.c
> > @@ -4108,6 +4108,54 @@ static void vcpu_vpa_increment_dispatch(struct k=
vm_vcpu *vcpu)
> >  	}
> >  }
> > =20
> > +static inline int kvmhv_get_l2_counters_status(void)
> > +{
> > +	return get_lppaca()->l2_counters_enable;
> > +}
>
> This is breaking the powernv build:

[...]

All the nested KVM code should really go under CONFIG_PSERIES.
Possibly even moved out to its own file.

For now maybe you could just ifdef these few functions and
replace with noop variants for !PSERIES.

Thanks,
Nick
