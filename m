Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D088797DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 16:43:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TemBDO3n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvHxG1Jhmz3dWF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 02:43:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TemBDO3n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvHwY64j7z2xTm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 02:43:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7A5CBCE17B3;
	Tue, 12 Mar 2024 15:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F2CC433C7;
	Tue, 12 Mar 2024 15:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710258185;
	bh=saSsJLPGKVqRyifWAvITNA+MsAjtts2uqCkZdCGrjgs=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=TemBDO3nAYXN5PjNextlJQDVn+cFCmHn/AifJjXH6yecbnsdNN8Ous1QY12Ws6cGx
	 2eRXf8mSyuVI3HwcyjjVcIk91kh534i8hyGyDbalN1eZXfkQs8Pu56OJvudVLCWp2N
	 fPdsDzwUn+99Jh8zVJwhktzAUB1IG0habTa2gU7ksuArwToqzBSa4vmVRZNSsKrp1s
	 fjKckEktCEAjODpf8UymIbvTGSTv1tpJyXHGaFaWJSsUinXKYRGwerCLQ2p5D3yzM8
	 QsDbA09IbM0jG5La0Z+u23T/tBCKlpI3Xg4/J7AIfG6p9yk0veQNhXzNbAmvlykzNi
	 iWrLDRvuUxmAw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Mar 2024 17:43:01 +0200
Message-Id: <CZRVXE96ZZA8.33VFES8S07YS9@kernel.org>
Subject: Re: [RFC PATCH v2 3/3] tpm: of: If available use linux,sml-log to
 get the log and its size
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Stefan Berger" <stefanb@linux.ibm.com>, <mpe@ellerman.id.au>,
 <linux-integrity@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.17.0
References: <20240311132030.1103122-1-stefanb@linux.ibm.com>
 <20240311132030.1103122-4-stefanb@linux.ibm.com>
 <CZR7B45P71XS.53XNZD9FWZSL@kernel.org>
 <916fb19b-daf8-4c1b-bc25-f071d2b3ae33@linux.ibm.com>
In-Reply-To: <916fb19b-daf8-4c1b-bc25-f071d2b3ae33@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, rnsastry@linux.ibm.com, jsnitsel@redhat.com, linux-kernel@vger.kernel.org, peterhuewe@gmx.de, viparash@in.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Mar 11, 2024 at 10:33 PM EET, Stefan Berger wrote:
>
>
> On 3/11/24 16:25, Jarkko Sakkinen wrote:
> > On Mon Mar 11, 2024 at 3:20 PM EET, Stefan Berger wrote:
> >> If linux,sml-log is available use it to get the TPM log rather than th=
e
> >> pointer found in linux,sml-base. This resolves an issue on PowerVM and=
 KVM
> >> on Power where after a kexec the memory pointed to by linux,sml-base m=
ay
> >> have become inaccessible or corrupted. Also, linux,sml-log has replace=
d
> >> linux,sml-base and linux,sml-size on these two platforms.
> >>
> >> Keep the handling of linux,sml-base/sml-size for powernv platforms tha=
t
> >> provide the two properties via skiboot.
> >>
> >> Fixes: c5df39262dd5 ("drivers/char/tpm: Add securityfs support for eve=
nt log")
> >> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> >=20
> > I'm worried about not being up to date and instead using "cached" value=
s
> > when verifying anything from a security chip. Does this guarantee that
> > TPM log is corrupted and will not get updated somehow?
>
>
> What do you mean 'guarantee that TPM log is corrupted'?

I presume that this is for power architecture but I have no idea what
leads log being corrupted, and is the scope all of that that arch or
some subset of CPUs.

The commit message is not very detailed on kexec scenario. It more like
assumes that reader knows all the detail beforehand. So probably this
will start to make sense once the backing story is improved, that's
all.

> The TPM was handed over from the firmware to Linux and the firmware then=
=20
> freed all memory associated with the log and will then not create a new=
=20
> log or touch the TPM or do anything that would require an update to the=
=20
> handed-over log. Linux also does not append to the firmware log. So=20
> whatever we now find in linux,sml-log would be the latest firmware log=20
> and the state of the 'firmware PCRs' computed from it should correspond=
=20
> to the current state of the 'firmware PCRs'.

So on what CPU this happens and is there any bigger picture for that
design choice in the firmware?

If it is a firmware bug, this should emit FW_BUG log message. If not,
then this commit message should provide the necessary context.

BR, Jarkko
