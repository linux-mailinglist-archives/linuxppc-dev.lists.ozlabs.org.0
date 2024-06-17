Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE67590BF4C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 00:52:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=cvjhYuw0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W34rp46sMz3gHJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 08:52:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=cvjhYuw0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net (client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 389 seconds by postgrey-1.37 at boromir; Tue, 18 Jun 2024 08:51:26 AEST
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W34qy45KJz3gDj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 08:51:26 +1000 (AEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 927BB45E08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1718664289; bh=tgZ5hgb9Gf21KDYdEib2nJBRoH1w2xOfXPJe310ZmBc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cvjhYuw077bLfEWVkm9B5y5MkRFtnN2/7arlWOO7bad+/c5EIZSmmsxUsPbBOEYjQ
	 ufEy35QWt09ug5fQPilU7spMPSYU1isz3ea/kkmCxABk/Dr+6aeJW7szpbPsNAa4po
	 tEWUN7mUfw1nB0rMxivttg0ZW0+SiU+wjuj7+aJ0vfMqUbHU6GjcKOWI6yW/5JtqJt
	 rZCuSOHc9XvpOyZWgd22iPaKNr/S8gbJP4Ej666iYP0pCsR2IpxXy1t5DLFeW5CQqt
	 euVA6wNmKKeDQpqt0mTD/FuDevW/lBoZgpFBa1kVyhH6JZ7tE+3uXxvmP5dvQL3zGJ
	 RiqX95vwBmMOQ==
Received: from localhost (c-24-9-249-71.hsd1.co.comcast.net [24.9.249.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 927BB45E08;
	Mon, 17 Jun 2024 22:44:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thomas Huth <thuth@redhat.com>, linux-doc@vger.kernel.org, Nathan Lynch
 <nathanl@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] Documentation: Remove the unused "topology_updates"
 from kernel-parameters.txt
In-Reply-To: <20240617060848.38937-1-thuth@redhat.com>
References: <20240617060848.38937-1-thuth@redhat.com>
Date: Mon, 17 Jun 2024 16:44:48 -0600
Message-ID: <87zfrjfau7.fsf@trenco.lwn.net>
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Huth <thuth@redhat.com> writes:

> The "topology_updates" switch has been removed four years ago in commit
> c30f931e891e ("powerpc/numa: remove ability to enable topology updates"),
> so let's remove this from the documentation, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index f58001338860..b75852f1a789 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6600,12 +6600,6 @@
>  			e.g. base its process migration decisions on it.
>  			Default is on.
>  
> -	topology_updates= [KNL, PPC, NUMA]
> -			Format: {off}
> -			Specify if the kernel should ignore (off)
> -			topology updates sent by the hypervisor to this
> -			LPAR.
> -
>  	torture.disable_onoff_at_boot= [KNL]

Applied, thanks.

jon
