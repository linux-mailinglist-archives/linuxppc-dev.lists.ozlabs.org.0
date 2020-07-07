Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29619216641
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 08:14:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1Bwy2s3TzDqlg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 16:14:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1BvL4LFHzDqVv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 16:13:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=Gm4rVqkn; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 4B1BvK70lqz9sRW;
 Tue,  7 Jul 2020 16:13:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1594102398;
 bh=1gH43pcyNWsoB0wdNvt2CD38v3u15ULeVvXMyvy9LgU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Gm4rVqknXMLIEqt+Z1fRmvsfWlw/EJbXGoURGguTea2AxOyFvjHqYr3JtThQ0eDby
 8J6xls7FJ+wRfoTBcQMHcZRuEciC+d/Mp5P+gmN57RPqTF4/lkm6bo6WUtWa+5ay91
 vGlfkXXvU/r8MfV9szQvIi6JpOFiZe1oIdRD3L8oRI1NPy2IZG/WubjBCdAB0YaNeu
 AINqWEcbop9NpHf01QmgbkMvYXizBfQL3peoUuJvarqMERkdd1SEXbQZhzXDihzvs8
 /Muyfu3xk6lAeDk7Luu63r6WFbgORf+9R5V4cDsHK8goKmVwjohtquKl+7CURh+a+o
 dvdwa1Jyvkydw==
Received: by neuling.org (Postfix, from userid 1000)
 id D4D512C0672; Tue,  7 Jul 2020 16:13:17 +1000 (AEST)
Message-ID: <9fbd0e9bb67bd71077c46e905338561c14c1e639.camel@neuling.org>
Subject: Re: [PATCH v2 02/10] KVM: PPC: Book3S HV: Save/restore new PMU
 registers
From: Michael Neuling <mikey@neuling.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
Date: Tue, 07 Jul 2020 16:13:17 +1000
In-Reply-To: <1593595262-1433-3-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-3-git-send-email-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
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
Cc: Paul Mackerras <paulus@samba.org>, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

@@ -637,12 +637,12 @@ struct kvm_vcpu_arch {
>  	u32 ccr1;
>  	u32 dbsr;
> =20
> -	u64 mmcr[5];
> +	u64 mmcr[6];
>  	u32 pmc[8];
>  	u32 spmc[2];
>  	u64 siar;


> +	mfspr	r5, SPRN_MMCR3
> +	mfspr	r6, SPRN_SIER2
> +	mfspr	r7, SPRN_SIER3
> +	std	r5, VCPU_MMCR + 40(r9)
> +	std	r6, VCPU_SIER + 8(r9)
> +	std	r7, VCPU_SIER + 16(r9)


This is looking pretty fragile now. vcpu mmcr[6] stores (in this strict ord=
er):
   mmcr0, mmcr1, mmcra, mmcr2, mmcrs, mmmcr3.

Can we clean that up? Give mmcra and mmcrs their own entries in vcpu and th=
en
have a flat array for mmcr0-3.

Mikey
