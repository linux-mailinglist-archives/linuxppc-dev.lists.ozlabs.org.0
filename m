Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1213D70F9AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 17:04:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRDww6QWrz3f8Z
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 01:04:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bf7RKUqi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRDw60ddSz3cf8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 01:03:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bf7RKUqi;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QRDvz74DMz4x4X;
	Thu, 25 May 2023 01:03:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1684940609;
	bh=QzuYQR0gPXTiNpvk+XF3DiuPlqmiDTFoEMf5CPsp/LQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bf7RKUqiJYwZB6rIiKqXmpYDb9sFeIdXFk2IUeNjP7E8NNAeCOTLqymXJNOAorFjd
	 xWkU8ulUSYjTSdmKA+wMq4Ghu998sGrt51EoNi7pwkLUocpeZ1heayLdqssJP92wsZ
	 BJcX2JldrMHdKhkKSs6pkxXfxhQ1JJ1HmaZq0DTdEdtn090JmdjMzzn/zhdefc1vli
	 78BiKrDhT8CDAN3pP20RhCnQiid6BbStWe01B3C+/0BFq3vcJFi5zHEDRCIgpyp2RC
	 OZI9TQ8Q/sxnNbw8hjEbulhPfocWEjeb36x8Y2XVjEtzouoVHZylnT5v056FlXhcIj
	 nokuXbkIsUQ3w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Memory Management List
 <linux-mm@kvack.org>, Linux Regressions <regressions@lists.linux.dev>
Subject: Re: Fwd: ./include/linux/mmzone.h:1735:2: error: #error Allocator
 MAX_ORDER exceeds SECTION_SIZE (v6.4-rc3 build regression)
In-Reply-To: <5d22e1e9-0307-3664-8b4a-99caaaaa4315@gmail.com>
References: <2a1cd5e6-01f7-66f9-1f9d-c655cc3f919b@gmail.com>
 <5d22e1e9-0307-3664-8b4a-99caaaaa4315@gmail.com>
Date: Thu, 25 May 2023 01:03:22 +1000
Message-ID: <87bki9ai11.fsf@mail.lhotse>
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
Cc: doru iorgulescu <doru.iorgulescu1@gmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Fabiano Rosas <farosas@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bagas Sanjaya <bagasdotme@gmail.com> writes:
> On 5/24/23 17:58, Bagas Sanjaya wrote:
>> Anyway, I'm adding it to regzbot:
>> 
>> #regzbot introduced: 23baf831a32c04f https://bugzilla.kernel.org/show_bug.cgi?id=217477
>> #regzbot title: Allocator MAX_ORDER exceeds SECTION_SIZE caused by MAX_ORDER redefinition
>> 
>
> From bugzilla [1], the reporter had successfully tried the proposed
> kernel config fix, so:
>
> #regzbot resolve: reducing CONFIG_ARCH_FORCE_MAX_ORDER to 8 resolves the regression

Should be fixed properly by:

https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20230519113806.370635-1-mpe@ellerman.id.au/

Which is in powerpc-fixes as 358e526a1648.

cheers
