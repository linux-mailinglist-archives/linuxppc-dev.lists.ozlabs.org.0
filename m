Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 570B68757C8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 21:01:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EB5ihk9x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrKtP0qX0z3vY2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 07:01:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EB5ihk9x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrKsY0vSgz3brl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 07:00:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F0AC617D9;
	Thu,  7 Mar 2024 20:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6863C433C7;
	Thu,  7 Mar 2024 20:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709841614;
	bh=hHVUKE05J5hWZW3aCoiEn6Z8Rlg4XXsS0ZJFK6atvm4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=EB5ihk9xAs3LimzpDSuTx86WiERojQbp6l23Uruma8ryd5emdLC6GWdpaR/Pah6Gz
	 /nJx8NvseHYj6MPnjrjQ2vZsPXw79kBh97MIb/YkzvIP6XmALSmqwGWVizRc2ZCe92
	 z/VEbsToQl+nqJXgdl583vnahIVoUG30MGmRa3vdDd9HMPEtDPdEDlTOvDvrxYfNNm
	 alCJZBe08I1sunPYH/WVQIjuoZxJUjNC33lThq85LUus45sPfI23YzduxwNeM3c+LT
	 AKaiszpmyG7d/TIQMaCS95CjLDMFyjDR9pxg9EkaRLwrtIAUqpp7+Ai/1ADAC/b2RV
	 X5et78TkappFw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 Mar 2024 22:00:10 +0200
Message-Id: <CZNS9K4BJPQ8.2MD4WZS8YMI3W@kernel.org>
Subject: Re: [PATCH 2/2] tpm: of: If available Use linux,sml-log to get the
 log and its size
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Stefan Berger"
 <stefanb@linux.ibm.com>, <mpe@ellerman.id.au>,
 <linux-integrity@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.17.0
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
 <20240306155511.974517-3-stefanb@linux.ibm.com>
 <CZNS7FO53BHK.6NO93P0C0VY5@kernel.org>
In-Reply-To: <CZNS7FO53BHK.6NO93P0C0VY5@kernel.org>
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

On Thu Mar 7, 2024 at 9:57 PM EET, Jarkko Sakkinen wrote:
> in short summary: s/Use/use/
>
> On Wed Mar 6, 2024 at 5:55 PM EET, Stefan Berger wrote:
> > If linux,sml-log is available use it to get the TPM log rather than the
> > pointer found in linux,sml-base. This resolves an issue on PowerVM and =
KVM
> > on Power where after a kexec the memory pointed to by linux,sml-base ma=
y
> > have been corrupted. Also, linux,sml-log has replaced linux,sml-base an=
d
> > linux,sml-size on these two platforms.
> >
> > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>
> So shouldn't this have a fixed tag, or not?

In English: do we want this to be backported to stable kernel releases or n=
ot?

BR, Jarkko
