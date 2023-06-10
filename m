Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC81272AAA9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 11:26:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdXd83Cc4z3fbj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 19:26:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bfG0JuaY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bfG0JuaY;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdXcH0RQxz3dx1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 19:25:35 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 84228601CE;
	Sat, 10 Jun 2023 09:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78196C433D2;
	Sat, 10 Jun 2023 09:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686389131;
	bh=5ObCuzkHbQXY0iZOA2ZfL1NpOhXO7BEV89T0/ACabBA=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=bfG0JuaY7zTdbEpyw8U1wbFyeaeHptIrAWxa/VzFvUUkqO7LySZr9nSSFgXsVaE31
	 8vBKlFFXCuUQNcKzRqCQwYSw7sjzNL/WEdX0NXGy5yrHTkVTN2cIfMzQFRHfdbqpqX
	 oDoP3YtVXVaIHTQE50BUEN9tx8nVUgEsH5w4o4gKTM36LE0/6MTyXJnARRjKXLHIzU
	 4XOM7EFlBwi4flM8B2iSjgH0mKTxv6tetRXanPPgqsaBjzowpLtqkNeo7J118dZg+B
	 DwLD5jtNY/c0YL5uCnkcSQRrr9N4WaOEMDqucNSVIWerTeCL9RXmefNcbekTjcm4ef
	 GI5X8v5rPOHew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Jun 2023 12:25:25 +0300
Message-Id: <CT8V1XE69DQ3.2JLQ9S20PK9OW@suppilovahvero>
Subject: Re: [PATCH v9 2/4] tpm: of: Make of-tree specific function commonly
 available
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Stefan Berger" <stefanb@linux.ibm.com>, "Jerry Snitselaar"
 <jsnitsel@redhat.com>
X-Mailer: aerc 0.14.0
References: <20230418134409.177485-1-stefanb@linux.ibm.com>
 <20230418134409.177485-3-stefanb@linux.ibm.com>
 <e4dcxwp63uisirxwanjwrhzrnve45wqnxhijfp4oq274r4neco@v2btoy43ue5h>
 <CT8BRJZS8RQU.9ICEA2UAFC7G@suppilovahvero>
 <4afde78d-e138-9eee-50e0-dbd32f4dcfe0@linux.ibm.com>
In-Reply-To: <4afde78d-e138-9eee-50e0-dbd32f4dcfe0@linux.ibm.com>
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

On Fri Jun 9, 2023 at 9:49 PM EEST, Stefan Berger wrote:
>
>
> On 6/9/23 14:18, Jarkko Sakkinen wrote:
> > On Thu May 25, 2023 at 1:56 AM EEST, Jerry Snitselaar wrote:
> >> On Tue, Apr 18, 2023 at 09:44:07AM -0400, Stefan Berger wrote:
> >>> Simplify tpm_read_log_of() by moving reusable parts of the code into
> >>> an inline function that makes it commonly available so it can be
> >>> used also for kexec support. Call the new of_tpm_get_sml_parameters()
> >>> function from the TPM Open Firmware driver.
> >>>
> >>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> >>> Cc: Jarkko Sakkinen <jarkko@kernel.org>
> >>> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> >>> Cc: Rob Herring <robh+dt@kernel.org>
> >>> Cc: Frank Rowand <frowand.list@gmail.com>
> >>> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> >>> Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> >>> Tested-by: Coiby Xu <coxu@redhat.com>
> >>> Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
> >>>
> >>
> >> Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
> >=20
> > If I just pick tpm only patches they won't apply so maybe TPM changes
> > should be better separated if that is by any means possible.
>
> Per the comment here I am putting this series here on hold.
> https://lore.kernel.org/linux-integrity/20230418134409.177485-1-stefanb@l=
inux.ibm.com/T/#m03745c2af2c46f19f329522fcb6ccb2bf2eaedc7

OK, cool.

I've mentioned this in few other emails but say this here too:
I was relocating for last couple of weeks, and thus some latency.
If you choose to repost the series, I'm happy to review it, thanks
:-)

BR, Jarkko
