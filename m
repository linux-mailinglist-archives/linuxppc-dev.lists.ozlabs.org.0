Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC1772A205
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 20:19:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qd8Vs366Sz3f7x
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 04:19:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VHEpsPG3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VHEpsPG3;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qd8Tx1SnNz3dvv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 04:18:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F53361C47;
	Fri,  9 Jun 2023 18:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4399CC433EF;
	Fri,  9 Jun 2023 18:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686334720;
	bh=OkmOjAVxbADsnonDXUvbpbOYXcARtzlVbMXpej3Goow=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=VHEpsPG36fQdX2HQ9TT0HQ9jlHnjzogNa/lG/M/U4MsI+8OH1QctOr/lFeVxpv00H
	 H3jciWKo96iS5xmSem0O6kK3DoFkad3DOfv/TkT9nJy6t2lxdaCnZlucGLT7x8kX43
	 amZotwt2agJT2CpLoo5KlM9Wx/DaMAyIHZPO+BSpNd/7kn0D5ew8j6JNG50t6OIHqm
	 VDSbFNl74YwT6PRF1zZY++oGKfuI2VVhgKwiaY8HtlKNHlgrqVVxiTfv0TQNgAKzPy
	 uIIsouM91WugRN7xVTMIjD7syzE/iggxPvHdbbogiXfIizohEOprbInhYH+re8OGfr
	 o8WrwnGESMgYg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jun 2023 21:18:32 +0300
Message-Id: <CT8BRJZS8RQU.9ICEA2UAFC7G@suppilovahvero>
Subject: Re: [PATCH v9 2/4] tpm: of: Make of-tree specific function commonly
 available
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jerry Snitselaar" <jsnitsel@redhat.com>, "Stefan Berger"
 <stefanb@linux.ibm.com>
X-Mailer: aerc 0.14.0
References: <20230418134409.177485-1-stefanb@linux.ibm.com>
 <20230418134409.177485-3-stefanb@linux.ibm.com>
 <e4dcxwp63uisirxwanjwrhzrnve45wqnxhijfp4oq274r4neco@v2btoy43ue5h>
In-Reply-To: <e4dcxwp63uisirxwanjwrhzrnve45wqnxhijfp4oq274r4neco@v2btoy43ue5h>
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
Cc: devicetree@vger.kernel.org, Coiby Xu <coxu@redhat.com>, Frank Rowand <frowand.list@gmail.com>, Nageswara R
 Sastry <rnsastry@linux.ibm.com>, nayna@linux.ibm.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Rob Herring <robh+dt@kernel.org>, nasastry@in.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu May 25, 2023 at 1:56 AM EEST, Jerry Snitselaar wrote:
> On Tue, Apr 18, 2023 at 09:44:07AM -0400, Stefan Berger wrote:
> > Simplify tpm_read_log_of() by moving reusable parts of the code into
> > an inline function that makes it commonly available so it can be
> > used also for kexec support. Call the new of_tpm_get_sml_parameters()
> > function from the TPM Open Firmware driver.
> >=20
> > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > Cc: Jarkko Sakkinen <jarkko@kernel.org>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> > Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> > Tested-by: Coiby Xu <coxu@redhat.com>
> > Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
> >=20
>
> Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

If I just pick tpm only patches they won't apply so maybe TPM changes
should be better separated if that is by any means possible.

Open for counter proposals. Just my thoughts...

I.e. I'm mainly wondering why TPM patches depend on IMA patches?

BR, Jarkko

