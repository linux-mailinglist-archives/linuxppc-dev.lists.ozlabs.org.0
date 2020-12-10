Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFAC2D4F48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 01:21:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Crvjv1SQvzDqv1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 11:21:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrvgR1sywzDqCl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 11:19:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aFrvJQjw; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CrvgQ2qq8z9sWC;
 Thu, 10 Dec 2020 11:19:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607559586;
 bh=2Nou4BXsnpzOz5P0S3H1qxqKUObLSPTluDR33OT2IDM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aFrvJQjwFt1M/PUMiDv7LLx1+QJwBMvHd7m8m9oMIMJl3AVyUg1VHHl8hvczCS3zc
 WSUwd2N+LsH2O0+xzcHVHBSm9E/aWjwxjuvt6O3wgTcReinTodWQSGrpWZhcfDyURQ
 qCr6Tx2c1SXkgVPDe8B+nrZDFDm7rYoB+W9P50yJEllX97Czg5z8HxNWE63UcpqtdS
 t2k7+f0neFz6m8bNykh/1tkDWB7iCrERZ+aVjPtMNc9Rf1Iyz8qBfxLi/j/V4JKdtx
 pvFQ7CK4riOAPdoZFO7/sIVTTUG+yrul1f/crQe//R4W9E9Hc3ydFAfQnmctCSCyBo
 +Zi6NW0aQt3jg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the akpm tree
In-Reply-To: <20201209180703.404eb4cb@canb.auug.org.au>
References: <20201204210000.660293c6@canb.auug.org.au>
 <20201208230157.42c42789@canb.auug.org.au>
 <87r1nzsi4s.fsf@mpe.ellerman.id.au>
 <20201209180703.404eb4cb@canb.auug.org.au>
Date: Thu, 10 Dec 2020 11:19:45 +1100
Message-ID: <87im9aseam.fsf@mpe.ellerman.id.au>
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
Cc: Kees Cook <keescook@chromium.org>, Mathieu Malaterre <malat@debian.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi Michael,
>
> On Wed, 09 Dec 2020 15:44:35 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> They should really be in DATA_DATA or similar shouldn't they?
>
> No other architecture appears t need them ...

Any arch with orphan-handling=warn should see them I thought?

cheers
