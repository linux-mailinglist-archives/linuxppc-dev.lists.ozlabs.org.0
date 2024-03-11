Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9192F87895F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 21:22:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fRZCIsUw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ttp992stmz3vXV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 07:22:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fRZCIsUw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ttp8S6gJpz3cgJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 07:21:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 80FE0CE1269;
	Mon, 11 Mar 2024 20:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D49C433C7;
	Mon, 11 Mar 2024 20:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710188502;
	bh=m0g91sXKYJS/kIzIdqTu2G6HaWEmgoKbDue6b3HELzA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=fRZCIsUw+ltmZpj7Ioa6QyF4bBXq0ClTyx5UbpaGj0BwwmhEKNap0i2kmsFvMTfYH
	 uAF252gxfBFsafjM9Yuk4LafJYv3Me+15/ThPDqUT/zg6IVy0kX5DdZAEfIwHN5CJa
	 kaWzEkGHE7xv/n1Re/hQ6Xh2eldHCz0IXefPxRAdP4TN6IF7a3sTG3G7rzjwPKzjFm
	 9x7SzQmlcJu6w9SEwD1WoiYIV/WJ86JSJ9WMmBIwMVMwH/b8Ox9dwWhkJV1+UUAUt4
	 SeFUzsKgAL8hqx2FabponQ8JhErgPZBo8wt5HWubHhzrwi+E8LQSEkDhXyw5hd4fY/
	 Ptdw0KX8aKSVg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 Mar 2024 22:21:38 +0200
Message-Id: <CZR7866WNY28.3KDPSXW81I82N@kernel.org>
Subject: Re: [RFC PATCH v2 1/3] powerpc/prom_init: Replace
 linux,sml-base/sml-size with linux,sml-log
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Stefan Berger" <stefanb@linux.ibm.com>, <mpe@ellerman.id.au>,
 <linux-integrity@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.17.0
References: <20240311132030.1103122-1-stefanb@linux.ibm.com>
 <20240311132030.1103122-2-stefanb@linux.ibm.com>
In-Reply-To: <20240311132030.1103122-2-stefanb@linux.ibm.com>
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
> linux,sml-base holds the address of a buffer with the TPM log. This
> buffer may become invalid after a kexec. To avoid accessing an invalid
> address or corrupted buffer, embed the whole TPM log in the device tree
> property linux,sml-log. This helps to protect the log since it is
> properly carried across a kexec soft reboot with both of the kexec
> syscalls.

- Describe the environment where TPM log gets corrupted.
- Describe why TPM log gets corrupted on kexec.

>
> Avoid having the firmware ingest the whole TPM log when calling
> prom_setprop but only create the linux,sml-log property as a place holder=
.
> Insert the actual TPM log during the tree flattening phase.

This commit message should shed some light about reasons of the
corruption in order to conclude that it should be fixed up like
this. I.e. why the "post-state" is a legit state where can be
continued despite a log being corrupted. Especially in security
features this is pretty essential information.

BR, Jarkko
