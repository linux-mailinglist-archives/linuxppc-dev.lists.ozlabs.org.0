Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5436487985A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 16:51:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I9FnK3zr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvJ6N15tbz3dk2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 02:51:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I9FnK3zr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvJ5g72hjz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 02:51:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 900AD604AD;
	Tue, 12 Mar 2024 15:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A9AC433F1;
	Tue, 12 Mar 2024 15:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710258661;
	bh=kntAY869wNjBhGqs4WVgCSk3Kuy6c3FLEZCqfnnjbPI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=I9FnK3zrII1xwFK/Fiw8498wJ2DZRNOF1Pjf/F6wirop9Q2YvgEX+VJ8wty50fav+
	 Ad9cY5qKToHlp99zxRnXZtRZMz3mJMf1NnaESuAYbgH8r5pQhpc9Ydk1vDaiVDj4dU
	 aLndCxdr47j9qH26XVlolYbHItTaRxEBRJ92aPxUtUrDZ7tL1W4IWVU8RHOlKxbfa6
	 PRo13SA1SRkzv2L55A4MERIQYxaCNkciyKGyiXAgo1rM9KC8m8cxtVyTdvFPxno6h5
	 nOG3SntuP6/Z8D89avNSUv/y6VKk/dSU+8bBgcUzeAZtToyvY2+N0eKbsVeqwBY1U9
	 D0aZDtfpQqDjA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Mar 2024 17:50:57 +0200
Message-Id: <CZRW3GY5O5C0.R5HY5SOFCFJA@kernel.org>
Subject: Re: [PATCH 2/2] tpm: of: If available Use linux,sml-log to get the
 log and its size
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Michael Ellerman" <mpe@ellerman.id.au>, "Stefan Berger"
 <stefanb@linux.ibm.com>, <linux-integrity@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.17.0
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
 <20240306155511.974517-3-stefanb@linux.ibm.com>
 <CZNS7FO53BHK.6NO93P0C0VY5@kernel.org>
 <CZNS9K4BJPQ8.2MD4WZS8YMI3W@kernel.org>
 <663a3834-056e-4dda-99dd-16ee8734100e@linux.ibm.com>
 <877ci74u0w.fsf@mail.lhotse>
In-Reply-To: <877ci74u0w.fsf@mail.lhotse>
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
Cc: peterhuewe@gmx.de, viparash@in.ibm.com, linux-kernel@vger.kernel.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Mar 12, 2024 at 12:35 PM EET, Michael Ellerman wrote:
> Stefan Berger <stefanb@linux.ibm.com> writes:
> > On 3/7/24 15:00, Jarkko Sakkinen wrote:
> >> On Thu Mar 7, 2024 at 9:57 PM EET, Jarkko Sakkinen wrote:
> >>> in short summary: s/Use/use/
> >>>
> >>> On Wed Mar 6, 2024 at 5:55 PM EET, Stefan Berger wrote:
> >>>> If linux,sml-log is available use it to get the TPM log rather than =
the
> >>>> pointer found in linux,sml-base. This resolves an issue on PowerVM a=
nd KVM
> >>>> on Power where after a kexec the memory pointed to by linux,sml-base=
 may
> >>>> have been corrupted. Also, linux,sml-log has replaced linux,sml-base=
 and
> >>>> linux,sml-size on these two platforms.
> >>>>
> >>>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> >>>
> >>> So shouldn't this have a fixed tag, or not?
> >>=20
> >> In English: do we want this to be backported to stable kernel releases=
 or not?
> >
> > Ideally, yes. v3 will have 3 patches and all 3 of them will have to be=
=20
> > backported *together* and not applied otherwise if any one of them=20
> > fails. Can this be 'guaranteed'?
>
> You can use Depends-on: <previous commit SHA> to indicate the relationshi=
p.
>
> cheers

Thanks, I've missed depends-on tag.

Stefan, please add also "Cc: stable@vger.kernel.org" just to make sure
that I don't forget to add it.

Right, and since these are so small scoped commits, and bug fixes in
particular, it is also possible to do PR during the release cycle.

BR, Jarkko
