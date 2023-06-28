Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 789A4741C2B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 01:08:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PkZZrge8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qry1Q2wg7z3bTf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 09:08:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PkZZrge8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qry0V6QHmz304b
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 09:07:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF3A0613E2;
	Wed, 28 Jun 2023 23:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822A4C433C0;
	Wed, 28 Jun 2023 23:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687993654;
	bh=53C7MomxKIvUQ7nkSMtiS9K6tPKxxxmP21jcwV8lafA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=PkZZrge8omk9ElyRJAkXPrd/dypCeIzKxA35G30+61WGI9WVNc4FTVep4b8rQfzzq
	 9/cYXfw1Aocj8jVoerhoXrfUPXCMQ5Pt9UAvBkD3i+3HUGDULirVleHh4rENXZlKMH
	 jwwXhbx663yjqLHg5heXfoEwkfIzpttTKiIX9iv1n9qjyNrcASMI4a72PhaghYkJxg
	 FYKhMZvsYNVKb25SbdX9fVU8LxQnOqYCJMxzByZsl305jkBtS6UPOC2k51oESJ7Mbx
	 cWHAcnmJdrxI4345xN/1hr7K5lweU6C835Wnmdk0WBAQzO4aY6QDEHvLq+dXKhebGH
	 m3twOSh7qZzKQ==
Message-ID: <b08bca2f9e7887cc4046b66bf2d8acb72c0e97e5.camel@kernel.org>
Subject: Re: [PATCH v9 2/4] tpm: of: Make of-tree specific function commonly
 available
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefan Berger <stefanb@linux.ibm.com>, Jerry Snitselaar
	 <jsnitsel@redhat.com>
Date: Thu, 29 Jun 2023 02:07:29 +0300
In-Reply-To: <4afde78d-e138-9eee-50e0-dbd32f4dcfe0@linux.ibm.com>
References: <20230418134409.177485-1-stefanb@linux.ibm.com>
	 <20230418134409.177485-3-stefanb@linux.ibm.com>
	 <e4dcxwp63uisirxwanjwrhzrnve45wqnxhijfp4oq274r4neco@v2btoy43ue5h>
	 <CT8BRJZS8RQU.9ICEA2UAFC7G@suppilovahvero>
	 <4afde78d-e138-9eee-50e0-dbd32f4dcfe0@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
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
Cc: devicetree@vger.kernel.org, Coiby Xu <coxu@redhat.com>, Frank Rowand <frowand.list@gmail.com>, Nageswara R Sastry <rnsastry@linux.ibm.com>, nayna@linux.ibm.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Rob Herring <robh+dt@kernel.org>, nasastry@in.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2023-06-09 at 14:49 -0400, Stefan Berger wrote:
>=20
> On 6/9/23 14:18, Jarkko Sakkinen wrote:
> > On Thu May 25, 2023 at 1:56 AM EEST, Jerry Snitselaar wrote:
> > > On Tue, Apr 18, 2023 at 09:44:07AM -0400, Stefan Berger wrote:
> > > > Simplify tpm_read_log_of() by moving reusable parts of the code int=
o
> > > > an inline function that makes it commonly available so it can be
> > > > used also for kexec support. Call the new of_tpm_get_sml_parameters=
()
> > > > function from the TPM Open Firmware driver.
> > > >=20
> > > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > > > Cc: Jarkko Sakkinen <jarkko@kernel.org>
> > > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > > Cc: Rob Herring <robh+dt@kernel.org>
> > > > Cc: Frank Rowand <frowand.list@gmail.com>
> > > > Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> > > > Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> > > > Tested-by: Coiby Xu <coxu@redhat.com>
> > > > Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > >=20
> > >=20
> > > Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
> >=20
> > If I just pick tpm only patches they won't apply so maybe TPM changes
> > should be better separated if that is by any means possible.
>=20
> Per the comment here I am putting this series here on hold.
> https://lore.kernel.org/linux-integrity/20230418134409.177485-1-stefanb@l=
inux.ibm.com/T/#m03745c2af2c46f19f329522fcb6ccb2bf2eaedc7

Hi, sorry for late response. The Midsummer weekend really
messed my schedules (it is a big thing Finland). This year
the timing with the kernel cycle has been conflicting.

OK cool.

BR, Jarkko
