Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A22278D72DB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2024 01:54:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XOsu+Nzj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VsGzj6W5tz3cGb
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2024 09:54:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XOsu+Nzj;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VsGyx1S8Cz3bZN
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jun 2024 09:53:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1717286009;
	bh=S0HZKZXPDUjdP/Zns/yrz/j18B42GMOAvW6WjeLGr9Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XOsu+NzjKw6hkPSAxzYY5P1qryMR9uKglPbB5M7Z8yb1/eq9Hw7GDE7IajTVj1VLi
	 /1IZ8aZWg7YEeVtZF9eskihotOlDgftU/A4xjwE9jLSsOUQfTtp8qFy6tJ6RDaBs3V
	 LG8kwlPnlWWG5RR892O9hR8YNTPd7B/8Lwr90bmZWK6qRoUYm3ECheG0s/9uLEcJEm
	 Dc7dFlqGIg4fgf0exWQK571xzZtFW4jgtBoXdqER45aW5hJ4tqFBD8dfFXE9ZVCuCc
	 6uu1AZM55ZzfcG9mLG3hlq23q2Bpr33bTBAgrvT3CFnZgBAF4aSvuAuyE3aKwHaqxz
	 +YWV2cszZ89/w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VsGyw5Pl2z4x32;
	Sun,  2 Jun 2024 09:53:28 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please add powerpc topic/kdump-hotplug branch to linux-next
In-Reply-To: <20240424074023.43932cca@canb.auug.org.au>
References: <87bk60ji79.fsf@mail.lhotse>
 <20240424074023.43932cca@canb.auug.org.au>
Date: Sun, 02 Jun 2024 09:53:27 +1000
Message-ID: <87mso42pag.fsf@mail.lhotse>
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
Cc: kexec@lists.infradead.org, Linux Next Mailing List <linux-next@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bhe@redhat.com, sourabhjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi Michael,
>
> On Tue, 23 Apr 2024 23:56:42 +1000 Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
> \> Can you please add the topic/kdump-hotplug branch of the powerpc tree to
>> linux-next. It contains a series that touches generic kexec code as well
>> as x86 and powerpc code.
>> 
>> The hope is to have to get it merged for v6.10, so it should go along
>> with the powerpc next branch in the merge order.
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/kdump-hotplug
>
> Added from today.

This branch has now been merged and can be dropped from linux-next,
thanks.

cheers
