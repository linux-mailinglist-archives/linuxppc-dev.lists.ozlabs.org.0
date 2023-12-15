Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FD881446A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 10:28:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ar+MEkcH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ss3n41Wwzz3dRf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 20:28:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ar+MEkcH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ss3mC5BvVz30jT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 20:27:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EB562CE25C0;
	Fri, 15 Dec 2023 09:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAC5C433C8;
	Fri, 15 Dec 2023 09:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702632470;
	bh=hYPAQIWLk8khuqHUwuIA1MRsSUVYCv86odQdWoEDCdQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ar+MEkcHFnCt8QuVaWalo6GF4nkAsmr/DHYeBxF91ZpTgeXcVGBksxuMerTBnaFDH
	 ZRdk76FjXNnbx7AbOQozWTTgTbsj8wshiazXMDSX6yMaVVL6ExJFNI3d+YfyCacVfl
	 v/eXaDIDy+AuWmcaTcUilH77G/FNtLp5d3UXvEaVQnc2pTJOv3iM1K1E05abawHxZR
	 xAt4TdZiQHncAO1/PISkvu0/dVfCI6pSFIQllHDW10IU7kiUeCVMYoygENiamJ94P3
	 8EdSpVNeGX09ZHMbMl7Ra0JB7w/4SCWRp7uZvxInPYmQK2VY+vy0QlhvJeUDPSw+fr
	 FVCsIox21GUIQ==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, glider@google.com,
	elver@google.com, dvyukov@google.com, akpm@linux-foundation.org,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 10/13] powerpc: Define KMSAN metadata address ranges for
 vmalloc and ioremap
In-Reply-To: <20231214055539.9420-11-nicholas@linux.ibm.com>
References: <20231214055539.9420-1-nicholas@linux.ibm.com>
 <20231214055539.9420-11-nicholas@linux.ibm.com>
Date: Fri, 15 Dec 2023 14:57:42 +0530
Message-ID: <87ttoju86p.fsf@kernel.org>
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
Cc: iii@linux.ibm.com, linux-kernel@vger.kernel.org, Nicholas Miehlbradt <nicholas@linux.ibm.com>, linux-mm@kvack.org, kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Miehlbradt <nicholas@linux.ibm.com> writes:

> Splits the vmalloc region into four. The first quarter is the new
> vmalloc region, the second is used to store shadow metadata and the
> third is used to store origin metadata. The fourth quarter is unused.
>

Do we support KMSAN for both hash and radix? If hash is not supported
can we then using radix.h for these changes?

> Do the same for the ioremap region.
>
> Module data is stored in the vmalloc region so alias the modules
> metadata addresses to the respective vmalloc metadata addresses. Define
> MODULES_VADDR and MODULES_END to the start and end of the vmalloc
> region.
>
> Since MODULES_VADDR was previously only defined on ppc32 targets checks
> for if this macro is defined need to be updated to include
> defined(CONFIG_PPC32).

-aneesh
