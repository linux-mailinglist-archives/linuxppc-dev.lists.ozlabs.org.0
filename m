Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86039365127
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 05:57:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPVJh3sbqz30Bk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 13:57:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hC0I0Ggm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hC0I0Ggm; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPVJJ39CCz2xZR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 13:57:36 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FPVJH5FLhz9vDw;
 Tue, 20 Apr 2021 13:57:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618891055;
 bh=Mm7azyGwSu+QPaCGF+C9AeL9WEx/cUbRkwVin3txMN8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hC0I0GgmEBLOXikSZ5kyUwk4yPS7RZ9Q+qEbU9rjqn9iBKrxZXMoAks6AiJ8b8doZ
 Dvsx+LtLtOrAk1dyKCd2Ia8aibWJKmbD0hMhF8wRwFP3a/tPy9sYVFjUMcZUcyz+ia
 UimuKBRw4qCnKPcJWST+Dy/JjW3Bm1LhXZJgHOCbqYZSTzaVNgebOH9zz815/SRd/q
 H/Tf69zCuxV77ulAx/UnQn+napAba5AFmrUSf1U2FgrnrZh86EOTNiIi1cYJtrim1C
 UMutPCFWhaUD4aU5pyHsXiSZjT0y1DnWUT0uNLQ9W3kc9xJHcocWTQsweXWRrbZoin
 I4cqYFmLA31gw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] hotplug-cpu.c: set UNISOLATE on dlpar_cpu_remove()
 failure
In-Reply-To: <f4d65cf6-08d1-0bcc-cba2-845099a82aa4@gmail.com>
References: <20210416210216.380291-1-danielhb413@gmail.com>
 <20210416210216.380291-3-danielhb413@gmail.com>
 <87v98icuek.fsf@mpe.ellerman.id.au>
 <f4d65cf6-08d1-0bcc-cba2-845099a82aa4@gmail.com>
Date: Tue, 20 Apr 2021 13:57:34 +1000
Message-ID: <878s5dd2vl.fsf@mpe.ellerman.id.au>
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
Cc: david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> On 4/19/21 9:48 AM, Michael Ellerman wrote:
>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>>> The RTAS set-indicator call, when attempting to UNISOLATE a DRC that is
>>> already UNISOLATED or CONFIGURED, returns RTAS_OK and does nothing else
>>> for both QEMU and phyp. This gives us an opportunity to use this
>>> behavior to signal the hypervisor layer when an error during device
>>> removal happens, allowing it to do a proper error handling, while not
>>> breaking QEMU/phyp implementations that don't have this support.
>>>
>>> This patch introduces this idea by unisolating all CPU DRCs that failed
>>> to be removed by dlpar_cpu_remove_by_index(), when handling the
>>> PSERIES_HP_ELOG_ID_DRC_INDEX event. This is being done for this event
>>> only because its the only CPU removal event QEMU uses, and there's no
>>> need at this moment to add this mechanism for phyp only code.
>> 
>> Have you also confirmed that phyp is not bothered by it? ie. everything
>> seems to continue working when you trigger this path on phyp.
>
> Yes. Daniel Bueso (dbuesom@us.ibm.com) from the partition firmware team
> helped me with that. We confirmed that phyp returns RTAS_OK under these
> conditions (Unisolating an unisolated/configured DRC).

Thanks.

cheers
