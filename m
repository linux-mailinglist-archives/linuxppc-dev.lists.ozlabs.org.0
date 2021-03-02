Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F7E32959A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 03:09:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqLDF2kKVz3cmw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 13:09:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HpZ+Oh2i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HpZ+Oh2i; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqLCs18Qcz3cGV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 13:09:11 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DqLCl0gdqz9s1l;
 Tue,  2 Mar 2021 13:09:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1614650947;
 bh=43rR5Zp4k5I4zGrVf/+RiKC5vErMo3wYmtY4bmcRmsA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HpZ+Oh2iNxKicmC1PzodQXqkyHpjRTYDNBRIJMEmpSjqqcp/CRqCahnUFZ4qMV7nu
 CdY9REoh5BBo15+ot1ixnH3s/uIPcX3e1qLi9ZB1bgpIIEILc1JQ/1Boue0nYfV5ET
 IGZC61B8sHEsrSFswrLhjNvDaNeRqCBfhpMtRp7PRFRSqQf3lDlHsagyz73snTg18/
 6N4nYjAspa4DML1rw2Q9xm0xCWN/E/vSbEMPrmWCrBGKdc7l2b8w3+umg83e2ixVGd
 NAszUP8NPrPNzwRGVuZg0+EK/TJEUe8JataAJin7GaInqTqkGF6fQwUl/ZjA19s7ht
 eyYp85nTV0fiA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build failure after merge of the powerpc-fixes tree
In-Reply-To: <20210302112131.5bb7b08b@canb.auug.org.au>
References: <20210302112131.5bb7b08b@canb.auug.org.au>
Date: Tue, 02 Mar 2021 13:09:03 +1100
Message-ID: <87pn0is3wg.fsf@mpe.ellerman.id.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> After merging the powerpc-fixes tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> drivers/net/ethernet/ibm/ibmvnic.c:5399:13: error: conflicting types for 'ibmvnic_remove'
>  5399 | static void ibmvnic_remove(struct vio_dev *dev)
>       |             ^~~~~~~~~~~~~~
> drivers/net/ethernet/ibm/ibmvnic.c:81:12: note: previous declaration of 'ibmvnic_remove' was here
>    81 | static int ibmvnic_remove(struct vio_dev *);
>       |            ^~~~~~~~~~~~~~
>
> Caused by commit
>
>   1bdd1e6f9320 ("vio: make remove callback return void")

Gah, is IBMVNIC in any of our defconfigs?! ... no it's not.

> I have applied the following patch for today:

Thanks, I'll squash it in.

cheers

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 2 Mar 2021 11:06:37 +1100
> Subject: [PATCH] vio: fix for make remove callback return void
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/net/ethernet/ibm/ibmvnic.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> index eb39318766f6..fe3201ba2034 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -78,7 +78,6 @@ MODULE_LICENSE("GPL");
>  MODULE_VERSION(IBMVNIC_DRIVER_VERSION);
>  
>  static int ibmvnic_version = IBMVNIC_INITIAL_VERSION;
> -static int ibmvnic_remove(struct vio_dev *);
>  static void release_sub_crqs(struct ibmvnic_adapter *, bool);
>  static int ibmvnic_reset_crq(struct ibmvnic_adapter *);
>  static int ibmvnic_send_crq_init(struct ibmvnic_adapter *);
> -- 
> 2.30.0
>
> -- 
> Cheers,
> Stephen Rothwell
