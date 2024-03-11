Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2853C87896D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 21:26:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ts5HPB10;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtpFg6mdFz3dVh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 07:26:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ts5HPB10;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtpDw28kkz3c9r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 07:25:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 24FBFCE0B01;
	Mon, 11 Mar 2024 20:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E112C433C7;
	Mon, 11 Mar 2024 20:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710188733;
	bh=g7a7Yd9Z2FNA7ZNNxwAmkonp9MHBpjW9SwXw2aB1x7Y=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ts5HPB10Yzocx5ksgB6BXT+IQ91RE0lxy/Cn2rVAmOfCBeg1JKO5qMbDb59q2M/d6
	 7lOpz73M9iD2r7KBDgSDjbZocgUADPNWhV9Z6CVLLZewE/zuSv91vYPvxcnRgL1XTC
	 rrGy4QHmapS9zrOo6HwBcHMdbP7c0HefCb50lcU5OZQUVqM/PlXmppxU1eGSwZSUbb
	 rKZTD2wjH1vbWvjtiwxSYxMJNnOokgfaqny1AZPdP1ddomWqh1pzICw7ZmOYTZHQwG
	 9+FG36fiYbDDofOFM4Q/j7GYyLLoTFBxlP3CFjPOZV0a5wAoABPzGegBxJzO8T/6ap
	 nXVQlxNEktOrQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 Mar 2024 22:25:29 +0200
Message-Id: <CZR7B45P71XS.53XNZD9FWZSL@kernel.org>
Subject: Re: [RFC PATCH v2 3/3] tpm: of: If available use linux,sml-log to
 get the log and its size
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Stefan Berger" <stefanb@linux.ibm.com>, <mpe@ellerman.id.au>,
 <linux-integrity@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.17.0
References: <20240311132030.1103122-1-stefanb@linux.ibm.com>
 <20240311132030.1103122-4-stefanb@linux.ibm.com>
In-Reply-To: <20240311132030.1103122-4-stefanb@linux.ibm.com>
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

On Mon Mar 11, 2024 at 3:20 PM EET, Stefan Berger wrote:
> If linux,sml-log is available use it to get the TPM log rather than the
> pointer found in linux,sml-base. This resolves an issue on PowerVM and KV=
M
> on Power where after a kexec the memory pointed to by linux,sml-base may
> have become inaccessible or corrupted. Also, linux,sml-log has replaced
> linux,sml-base and linux,sml-size on these two platforms.
>
> Keep the handling of linux,sml-base/sml-size for powernv platforms that
> provide the two properties via skiboot.
>
> Fixes: c5df39262dd5 ("drivers/char/tpm: Add securityfs support for event =
log")
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

I'm worried about not being up to date and instead using "cached" values
when verifying anything from a security chip. Does this guarantee that
TPM log is corrupted and will not get updated somehow?

BR, Jarkko
