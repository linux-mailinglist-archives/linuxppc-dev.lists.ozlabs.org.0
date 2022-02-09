Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0ED4AE89C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 05:43:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtnMc4lqBz30BL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 15:43:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=X4BI56kf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtnLy5RZJz2yZ6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 15:43:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=X4BI56kf; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JtnLt20kgz4xcp;
 Wed,  9 Feb 2022 15:43:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1644381801;
 bh=h1IrtofJGjl9dOe2iPaZfbAAnbqY/viWBgGDEdVXQKk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=X4BI56kfUn4imVm/I1LyMZe7f9s76Evbv0Pjn7HGfFFK68KUGaoCPH04q/DPmVU9g
 wR4AbQ/owkq/8kQKt0JOU1uOB+WagWSG+QKJIV7XEnJTJKHhDsign/9EnXKGREu9LK
 sVbaWMzAYonS1AI1YnbRd/ekzycbGZFh2GxEaCv7HdATX0qxEWn6/9yo6zI5z+ThBf
 qQNmyglbl+FwhdR/8QyKUyZtPKN+6fK5Fi+e9xdsGsINyiETC8A4Vxoz9lcnCcyeuM
 lrxTnV9IQhCQyG7h2V2xQJmSWs+HKYmIU+sBC2hGE8wYyYkl6AWMsv2I0fSlvW1rKx
 y/TGj1iyy/dTg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal Suchanek <msuchanek@suse.de>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v5 2/6] powerpc/kexec_file: Add KEXEC_SIG support.
In-Reply-To: <d95f7c6865bcad5ee37dcbec240e79aa742f5e1d.1641900831.git.msuchanek@suse.de>
References: <cover.1641900831.git.msuchanek@suse.de>
 <d95f7c6865bcad5ee37dcbec240e79aa742f5e1d.1641900831.git.msuchanek@suse.de>
Date: Wed, 09 Feb 2022 15:43:17 +1100
Message-ID: <87sfsslkey.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Baoquan He <bhe@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Michal Suchanek <msuchanek@suse.de>, "Serge E.
 Hallyn" <serge@hallyn.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Philipp Rudo <prudo@redhat.com>, Frank van der Linden <fllinden@amazon.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
 linux-security-module@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, buendgen@de.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Suchanek <msuchanek@suse.de> writes:
> Copy the code from s390x
>
> Both powerpc and s390x use appended signature format (as opposed to EFI
> based patforms using PE format).
>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
> v3: - Philipp Rudo <prudo@redhat.com>: Update the comit message with
>       explanation why the s390 code is usable on powerpc.
>     - Include correct header for mod_check_sig
>     - Nayna <nayna@linux.vnet.ibm.com>: Mention additional IMA features
>       in kconfig text
> ---
>  arch/powerpc/Kconfig        | 16 ++++++++++++++++
>  arch/powerpc/kexec/elf_64.c | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 52 insertions(+)

I haven't tested this on powerpc, but assuming you have Michal this
looks OK to me.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
