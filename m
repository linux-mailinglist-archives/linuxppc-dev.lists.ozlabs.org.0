Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F23CC46283A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 00:26:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J31gm6FWwz3cWt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 10:26:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QSCVX0qb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J31g53Kd1z2ymg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 10:25:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=QSCVX0qb; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J31g44xLHz4xQt;
 Tue, 30 Nov 2021 10:25:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1638228336;
 bh=9QqeY1I9wTb4n+iEyy59M4aOd8rLjYN+2Xd8r+rblL8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=QSCVX0qbIK6h/tJ3IEVWbmm4mAdhit+1WEBhX2IRPkEnJn4HknhlIxpF+h8h2L3/K
 nfPh81HJy34JCCvS37oWV5dXTnJInqmIGSURDvZ5LZetNhQoQC2ypa3gOQMt+GCShX
 2WZawIYSHx3EE5ycKhPAhZY9iAhYPl8FFKR3pp7Rfr1Jq4SFomNzn02P0U2aqc+QLg
 PKCGqnoE2wFFbMCNqRfMcJPDtI0NuyxDpvFCw8lvfU5ySOpMNHvjWMwMIQ4oUJSv26
 j3QdxFLzTcfMmOrSOLIyE48ax3X7j0+NrhHt3kO8VNyqBgHhiEPwLh5hojNUKAyzPt
 zotznMVdKftBw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries/vas: Don't print an error when VAS is
 unavailable
In-Reply-To: <1637922573.8ofrolskkj.astroid@bobo.none>
References: <20211126052133.1664375-1-npiggin@gmail.com>
 <43d21c1a-9122-d698-2229-e56c77a91313@kaod.org>
 <1637922573.8ofrolskkj.astroid@bobo.none>
Date: Tue, 30 Nov 2021 10:25:35 +1100
Message-ID: <87fsrepms0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Haren Myneni <haren@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from C=C3=A9dric Le Goater's message of November 26, 2021 5:13 p=
m:
>> On 11/26/21 06:21, Nicholas Piggin wrote:
>>> KVM does not support VAS so guests always print a useless error on boot
>>>=20
>>>      vas: HCALL(398) error -2, query_type 0, result buffer 0x57f2000
>>>=20
>>> Change this to only print the message if the error is not H_FUNCTION.
>>=20
>>=20
>> Just being curious, why is it even called since "ibm,compression" should
>> not be exposed in the DT ?
>
> It looks like vas does not test for it. I guess in theory there can be=20
> other functions than compression implemented as an accelerator. Maybe
> that's why?

Yeah I guess, or it's just not structured that well. The vas platform
code is a bit awkward, it's there to support drivers, but it's not
actually driver code.

I think we can probably rework it so the vas code does nothing until a
driver calls in to it.

eg. something like below.

cheers


diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/=
pseries/vas.c
index b043e3936d21..dc3491fc919d 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -454,6 +454,8 @@ static const struct vas_user_win_ops vops_pseries =3D {
 	.close_win	=3D vas_deallocate_window, /* Close window */
 };
=20
+static int pseries_vas_init(void);
+
 /*
  * Supporting only nx-gzip coprocessor type now, but this API code
  * extended to other coprocessor types later.
@@ -463,7 +465,8 @@ int vas_register_api_pseries(struct module *mod, enum v=
as_cop_type cop_type,
 {
 	int rc;
=20
-	if (!copypaste_feat)
+	rc =3D pseries_vas_init();
+	if (rc || !copypaste_feat)
 		return -ENOTSUPP;
=20
 	rc =3D vas_register_coproc_api(mod, cop_type, name, &vops_pseries);
@@ -531,7 +534,7 @@ static int get_vas_capabilities(u8 feat, enum vas_cop_f=
eat_type type,
 	return 0;
 }
=20
-static int __init pseries_vas_init(void)
+static int pseries_vas_init(void)
 {
 	struct hv_vas_cop_feat_caps *hv_cop_caps;
 	struct hv_vas_all_caps *hv_caps;
@@ -592,4 +595,3 @@ static int __init pseries_vas_init(void)
 	kfree(hv_caps);
 	return rc;
 }
-machine_device_initcall(pseries, pseries_vas_init);
