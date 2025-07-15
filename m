Return-Path: <linuxppc-dev+bounces-10255-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AF8B0678A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jul 2025 22:11:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhVgm0DpBz2xfR;
	Wed, 16 Jul 2025 06:11:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752610275;
	cv=none; b=YLOa0Pjw1dtEkVPolxe2ZT10u3v9WFu25KsqhyYu4v4fN1sWKx1JT1du8PFUHwyOlPxW2A9Ct7L4qEFSjVUYzoU8+iy/Y9tBHB9VuZ1jiSLXBb7qFDFXg7I4TdDcr6QixDa7B3Ki2HttchVwOXjBvQsOPbuQyhtlHJG0GqL71uOKUkb8CWotQPSfgXJJu1Z/c7jIWPXUnUBKLq48E2wyhHLrCnyBYhmLPfW3+SW4RMOimzE4k3wVzjgnGV7IKTT3QkW0SHlJY7lLXhU73jXv3ITn0yEBlmopQw2ldxnQHeZlJzy94JVISoOsTVO1KedCCRi+wMfe1e7Gs6qlBL2TBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752610275; c=relaxed/relaxed;
	bh=5kPEQacK23+5d9HZEBwKwlf08U1WgpD16N1/izqmHtU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Bc6rky/OSu4QEBBrBNXqnOjQMU+rLnuxWHtTymcb837HFkCnD9kupob7bkr3DPhQUa8Xl7/ByA9iOIj76Gn3WrznAHrylkLXgZrgGxLV6O/GvnEIHK0NWuRR0Jg6y+qFoeemH3/jRlB3mb1WFSyG5nQ25LZzgkpfCI23WXGKNHQsH1R8rIdKc7ipxFkqO7YMRAtRLc0zd6Y6bCci26d7QFx2as+sxOLK4EFNuxZQLi4Kb+6Hdid3hj86HOMOLeGAIt8PHgOACCsr1j/gZOUPNX5JxLx2ligZX0HckwGk2Yow+IkuRS5RWFannFXX1nbvlnD/7cTHErUS4Fy0H3kA7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lwn.net; dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=pLbFDViD; dkim-atps=neutral; spf=pass (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=lists.ozlabs.org) smtp.mailfrom=lwn.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=pLbFDViD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 447 seconds by postgrey-1.37 at boromir; Wed, 16 Jul 2025 06:11:11 AEST
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhVgg3tmvz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jul 2025 06:11:10 +1000 (AEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9F8524040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1752609816; bh=5kPEQacK23+5d9HZEBwKwlf08U1WgpD16N1/izqmHtU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pLbFDViDIrgJL8ZQateU2gyMeDQgIUGqckKBl894fT8zEhfferjsoQNUJfu/F2kmi
	 bHgqmunluMg8/CrAP+1xeAzeyBkwb9k/D8gjRgUcLUtOue7x0CQjovVXSpittsvf8z
	 QHuolRJl87REBezg0rRnN0jj+EqXpjmuFqUtc9a8Js+uKkCDBjoD5CsAi7GwFpawto
	 N97D86OaxcchGHK0hiv4wr35SrKHUfZUNx1UUfyju4YWpNfSs3xE8Z4miAkT0VNoil
	 DaHSRLO19jjiyqSuJMJn7MDoLLiQh2Yx9AB8i0FtGQmhUrD1RtCeNjc96fpMMNIzN4
	 7g8TuYdwWsqRg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9F8524040B;
	Tue, 15 Jul 2025 20:03:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, Linux PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Networking <netdev@vger.kernel.org>
Cc: Richard Cochran <richardcochran@gmail.com>, Haren Myneni
 <haren@linux.ibm.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch
 <nathanl@linux.ibm.com>
Subject: Re: [PATCH v2 0/3] ioctl numbers list cleanup for
 papr-physical-attestation.h
In-Reply-To: <20250714015711.14525-1-bagasdotme@gmail.com>
References: <20250714015711.14525-1-bagasdotme@gmail.com>
Date: Tue, 15 Jul 2025 14:03:35 -0600
Message-ID: <878qkpfch4.fsf@trenco.lwn.net>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> Hi,
>
> This is the cleanup series following up from 03c9d1a5a30d93 ("Documentation:
> Fix description format for powerpc RTAS ioctls"). It is based on docs-next
> tree. The end result should be the same as my previous fixup patch [1].
>
> Enjoy!
>
> Changes since v1 (RESEND) [2]:
>
>   * Add Fixes: and Reviewed-by: trailers (Haren)
>   * Expand tabs for uapi/misc/amd-apml.h to match other entries
>
> Jon: Would you like to apply this series on docs-next or should powerpc
> folks handle it?

I've applied it.  I took out the vast pile of Fixes tags, though; I
don't think all that was justified for these tweaks.

Thanks,

jon

