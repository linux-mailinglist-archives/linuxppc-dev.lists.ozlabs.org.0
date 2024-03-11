Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EE887894F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 21:10:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oEkPviPq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ttnv667Xfz3fQH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 07:10:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oEkPviPq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtntN11Tzz3c9r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 07:09:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A797460DF0;
	Mon, 11 Mar 2024 20:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA00DC433F1;
	Mon, 11 Mar 2024 20:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710187768;
	bh=rMv/IEo93hGWvO+dcxdINAvp+DT2JdcLL0XiT32U3XE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=oEkPviPqTzS0MunoGUWYVZ4vNTCu9OZn6+yQ1mTPisR8i+2LVEnHGkJ8TZkbgn7Zb
	 7JZ/hYVCI3Iss4qIBT+JLDCW0nzRCZoNDBo4GKlMW/tYU9IYwHvro4tXG957uFrMNc
	 zi2/P4NhcmV8UvStv1rPWyUMfGT1mG9G2L938J+GTZxCxs0FXNFY0r3p45mEw9sbDN
	 0uqSh+T6tl7twl6OL8hFZjvzezmtwgBH8lfT6PAiNu6Fc+1cK92LguzVJlXwbBazRV
	 86e6wFIqK2vA4t5An5p1twwadYfL0qrNZVYsWNKpc2VloMt7kABcwSTWZ0pXuN/6gD
	 vl7JhDb4yjh6w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 Mar 2024 22:09:24 +0200
Message-Id: <CZR6YT6T2RS0.KKPTUAAVXMXF@kernel.org>
Subject: Re: [PATCH 2/2] tpm: of: If available Use linux,sml-log to get the
 log and its size
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Stefan Berger" <stefanb@linux.ibm.com>, <mpe@ellerman.id.au>,
 <linux-integrity@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.17.0
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
 <20240306155511.974517-3-stefanb@linux.ibm.com>
 <CZNS7FO53BHK.6NO93P0C0VY5@kernel.org>
 <CZNS9K4BJPQ8.2MD4WZS8YMI3W@kernel.org>
 <663a3834-056e-4dda-99dd-16ee8734100e@linux.ibm.com>
In-Reply-To: <663a3834-056e-4dda-99dd-16ee8734100e@linux.ibm.com>
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

On Fri Mar 8, 2024 at 2:17 PM EET, Stefan Berger wrote:
>
>
> On 3/7/24 15:00, Jarkko Sakkinen wrote:
> > On Thu Mar 7, 2024 at 9:57 PM EET, Jarkko Sakkinen wrote:
> >> in short summary: s/Use/use/
> >>
> >> On Wed Mar 6, 2024 at 5:55 PM EET, Stefan Berger wrote:
> >>> If linux,sml-log is available use it to get the TPM log rather than t=
he
> >>> pointer found in linux,sml-base. This resolves an issue on PowerVM an=
d KVM
> >>> on Power where after a kexec the memory pointed to by linux,sml-base =
may
> >>> have been corrupted. Also, linux,sml-log has replaced linux,sml-base =
and
> >>> linux,sml-size on these two platforms.
> >>>
> >>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> >>
> >> So shouldn't this have a fixed tag, or not?
> >=20
> > In English: do we want this to be backported to stable kernel releases =
or not?
>
> Ideally, yes. v3 will have 3 patches and all 3 of them will have to be=20
> backported *together* and not applied otherwise if any one of them=20
> fails. Can this be 'guaranteed'?

All of them will end up to stable if the following conditions hold:

- All have a fixes tag.
- All have "Cc: stable@vger.kernel.org".
- We agree in the review process that they are all legit fixes.

BR, Jarkko
