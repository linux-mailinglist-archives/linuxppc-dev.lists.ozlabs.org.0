Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2137879860
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 16:53:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K3hLq7tm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvJ8g55Hmz3dlY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 02:53:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K3hLq7tm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvJ801PBqz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 02:53:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 78E4161232;
	Tue, 12 Mar 2024 15:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6BDC433C7;
	Tue, 12 Mar 2024 15:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710258782;
	bh=W4547WbRCvwF1NrgSJ+HFYlSmHPmUaJuvTwISWCX+Wc=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=K3hLq7tm12VIejaWDEb1c1SwckRzmCYiZ5DlLewh1U7oMxp4qzIaEhNcxYQYWRn8r
	 w3gqYmmj1fkc+9x4C9LfZZQhg6Xloe3+lwxkvWtaJiM7CD4L7KPt9qK5bMbJ+/4wd+
	 BTPlyedZQujtvNcyCBos9NfbjXzKlj4sEDTxHb27Sfpf+VYG61nV0L0DkZlEoJW7hX
	 buCoo5iSBN7dDsqIMrdRQtgTI6kWYuGpVu1YVMs0tKMk69NnNC5D2jy2S+Dz1fTZ6V
	 a/9OEBl1VqjgdZVUKCwvcUTertBjR+kGijsKdj7PQXSplB7tYYY5pQsEXJuEv6t8QP
	 /YUu0KE74buHw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Mar 2024 17:52:57 +0200
Message-Id: <CZRW4ZZEH3BK.80W6O7YT5HH5@kernel.org>
Subject: Re: [RFC PATCH v2 2/3] dt-bindings: tpm: Add linux,sml-log to
 ibm,vtpm.yaml
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lukas Wunner" <lukas@wunner.de>, "Stefan Berger"
 <stefanb@linux.ibm.com>
X-Mailer: aerc 0.17.0
References: <20240311132030.1103122-1-stefanb@linux.ibm.com>
 <20240311132030.1103122-3-stefanb@linux.ibm.com>
 <ZfA4TZspY7oOQ4vz@wunner.de>
In-Reply-To: <ZfA4TZspY7oOQ4vz@wunner.de>
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
Cc: devicetree@vger.kernel.org, rnsastry@linux.ibm.com, Nayna Jain <nayna@linux.ibm.com>, jsnitsel@redhat.com, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, viparash@in.ibm.com, linuxppc-dev@lists.ozlabs.org, peterhuewe@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Mar 12, 2024 at 1:11 PM EET, Lukas Wunner wrote:
> On Mon, Mar 11, 2024 at 09:20:29AM -0400, Stefan Berger wrote:
> > Add linux,sml-log, which carries the firmware TPM log in a uint8-array,=
 to
> > the properties. Either this property is required or both linux,sml-base=
 and
> > linux,sml-size are required. Add a test case for verification.
> >=20
> > Fixes: 82003e0487fb ("Documentation: tpm: add the IBM Virtual TPM devic=
e tree binding documentation")
>
> The Fixes tag is confusing.  The patch won't even apply cleanly to the
> v4.10 commit referenced here as the conversion to yaml happened only
> recently with v6.8.
>
> Why is the Fixes tag necessary in the first place?  Same question for
> the other patches in the series.  This looks like feature work rather
> than a fix.  Not sure whether it satisfies the "obviously correct"
> rule per Documentation/process/stable-kernel-rules.rst.

I'm not yet sure whether these are bug fixes and or improvements because
I did not fully understand the scenario where TPM corrupts the event log
so that part reminds to be seen.

Probably once I fully understand what is going on, it is possible to
argue on that.

BR, Jarkko
