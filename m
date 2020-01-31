Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5257314EB10
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 11:42:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488DLQ38HQzDqdt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 21:42:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488DFt09hkzDqfX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 21:38:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iavBMrIp; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 488DFs4Dyhz9sPJ;
 Fri, 31 Jan 2020 21:38:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1580467089;
 bh=y8+Mpdf6iOj5fF2OCSEteQ4niuN/h0qNPMnMbL273Lc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iavBMrIp+/cYJMJus4zSmBmz5oe3qytbae7/3XfEqiYgleapkRLB9sIu2A2+EuuBd
 Knc+1zo3zqCNEQjNl1B2uOGIQxHXtsxN1UgcxRqUpiLIiJenO/QQ1BjJM1PGQ9gW1A
 qNPJzqKuMcHFdpy4wz8RHEOzftIV+qBomVGP4ec2niue784UWx9v5E0/7OsY9Trj7g
 V72EFBF/oBLMnbYqsnw4CELMAXKvnouYyTUrUtVwr6Sw+V5YGXVHmZldMV3rF05mUn
 /AFiMd02hTvcK8SWo+wwEyw+5aW8PeoqEBeBXbCIApruo0bGYOTvCf5AWhfGbX85Ej
 +siDlN8qog5+g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] pseries/vio: Remove stray #ifdef CONFIG_PPC_PSERIES
In-Reply-To: <20200130063153.19915-1-oohall@gmail.com>
References: <20200130063153.19915-1-oohall@gmail.com>
Date: Fri, 31 Jan 2020 21:38:08 +1100
Message-ID: <87pnezgbcf.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Subject: Re: [PATCH 1/2] pseries/vio: Remove stray #ifdef CONFIG_PPC_PSERIES
                         ^
                         powerpc/

Please.

I'll fix it up.

Oliver O'Halloran <oohall@gmail.com> writes:
> vio.c requires CONFIG_IBMVIO which in turn depends on PPC_PSERIES.
> In other words, this ifdef is pointless.

And all of platforms/pseries is only built if PPC_PSERIES=y.

> At a guess it's a carry-over from pre-history.

It's not pre-history. Probably should have been cleaned up in:

commit b0787660260604ba63621881851de0032279819b
Author:     Stephen Rothwell <sfr@canb.auug.org.au>
AuthorDate: Wed Mar 7 18:43:10 2012 +0000
Commit:     Benjamin Herrenschmidt <benh@kernel.crashing.org>
CommitDate: Fri Mar 9 10:35:23 2012 +1100

    powerpc: clean up vio.c
    
    This cleans up vio.c after the removal of the legacy iSeries platform.
    It also removes some no longer referenced include files.
    
    Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
    Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>


cheers

> diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
> index f682b7b..37f1f25 100644
> --- a/arch/powerpc/platforms/pseries/vio.c
> +++ b/arch/powerpc/platforms/pseries/vio.c
> @@ -1628,7 +1628,6 @@ const void *vio_get_attribute(struct vio_dev *vdev, char *which, int *length)
>  }
>  EXPORT_SYMBOL(vio_get_attribute);
>  
> -#ifdef CONFIG_PPC_PSERIES
>  /* vio_find_name() - internal because only vio.c knows how we formatted the
>   * kobject name
>   */
> @@ -1698,7 +1697,6 @@ int vio_disable_interrupts(struct vio_dev *dev)
>  	return rc;
>  }
>  EXPORT_SYMBOL(vio_disable_interrupts);
> -#endif /* CONFIG_PPC_PSERIES */
>  
>  static int __init vio_init(void)
>  {
> -- 
> 2.9.5
