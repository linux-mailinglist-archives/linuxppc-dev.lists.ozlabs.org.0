Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5E6221B9D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 06:56:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6hm60NfgzDqqY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 14:56:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6hjj4jhjzDqYd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 14:54:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Q+fZUiVG; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4B6hjh38P2z9sRW; Thu, 16 Jul 2020 14:54:00 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B6hjh1m8Dz9sR4;
 Thu, 16 Jul 2020 14:54:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594875240;
 bh=FmAkXsd5ylVmoGslmFobuHuO65vIrkIORrej0EwX2ts=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Q+fZUiVGUkVTM4eSFCMtRkFtxovdTo6nBtySqfDlb2q7ySoyuEWGLA49Ses8+LwNR
 qFckoQe3HjNIeOH2Up5nOdYzMZYqnjsk/FuCP+ohYJWUX/P3q43aAyVpEZzOmOM7a4
 RpYIb9Flr0ucpju+Xv17yhKosh8FdDoW9+qB8oByVMEjSufhJpXvc/gQOV2fzukiMb
 NiqsBike/HalTrjb42Wlr3chaRn7SEt8m2HGAQaR0vk9475WQ2wK7sL1EtrQm9i/7y
 fNT5fwDvdfoYGbT56wKLSb6ats077QovgkrWuhmvrKLdS57csz/P7LmBneL1md1yWR
 VuWDQ7hY0B9ug==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, Nayna Jain <nayna@linux.ibm.com>,
 linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v3] powerpc/pseries: detect secure and trusted boot state
 of the system.
In-Reply-To: <87v9iothc1.fsf@dja-thinkpad.axtens.net>
References: <1594813921-12425-1-git-send-email-nayna@linux.ibm.com>
 <87v9iothc1.fsf@dja-thinkpad.axtens.net>
Date: Thu, 16 Jul 2020 14:53:51 +1000
Message-ID: <87sgdst600.fsf@mpe.ellerman.id.au>
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
Cc: Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> Hi Nayna,
>
> Looks good to me.
>
> Sorry for not noticing this before, but I think
>> +#include <asm/machdep.h>

> is now superfluous (I think it's leftover from the machine_is
> version?). Maybe mpe will take pity on you and remove it when he picks
> up your patch.

Yeah I did that.

cheers
