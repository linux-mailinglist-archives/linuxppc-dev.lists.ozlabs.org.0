Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 062D21010B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 02:27:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47H7VD1wFWzDqVs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 12:27:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47H7SK5SbfzDqBg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 12:25:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="KzKyJmP3"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 47H7SK4ftXz9sPV; Tue, 19 Nov 2019 12:25:53 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47H7SK3KqXz9sPL;
 Tue, 19 Nov 2019 12:25:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1574126753;
 bh=NZ8qGC6/6aodqG+MaWv/C0hTYe0EAx7mOuwW7JFMbe0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KzKyJmP37ZtmSeTWOr14jDsCEgrpyPyxPKqlc1ZcDBgmyWxqMRq/6hbrYSu6JiKga
 2IP9j0JrO0J8EqBqoESLpMI2Bgpzks1BHZVZStXDbxEPjiMUSxJb9TBi9ok7dl+nMr
 2llUd6r0C5uazwae8j9AO+5Z7AO4kq4J+2wltM9l3MVSS7EPGAMWY4D3adOEmEBgrH
 nsHerFwVQKC+zCDrVZKHcfiCjXLVZ1FfjaOOagd6a4X7w7/w2eHQcnFH6lPpYnSh9Z
 e7inC6FRAhYrRU/KMvRVBGiJu4iE02OXrodYvhBQzaGzsFjx7+snwzN8mNwGBcdUcf
 9DjM5aMMlwbqg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] of: unittest: fix memory leak in attach_node_and_children
In-Reply-To: <20191114184334.2866770-1-erhard_f@mailbox.org>
References: <20191114184334.2866770-1-erhard_f@mailbox.org>
Date: Tue, 19 Nov 2019 12:25:52 +1100
Message-ID: <87eey4d5cv.fsf@mpe.ellerman.id.au>
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
Cc: Erhard Furtner <erhard_f@mailbox.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Erhard Furtner <erhard_f@mailbox.org> writes:
> In attach_node_and_children memory is allocated for full_name via
> kasprintf. If the condition of the 1st if is not met the function
> returns early without freeing the memory. Add a kfree() to fix that.

It would be good to mention that this was detected with kmemleak.

It looks like the leak was introduced by this commit:

Fixes: 5babefb7f7ab ("of: unittest: allow base devicetree to have symbol metadata")

> Signed-off-by: Erhard Furtner <erhard_f@mailbox.org>
> ---
>  drivers/of/unittest.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>


Because this patch is to drivers/of, you need to send it to the right
folks. You can work out who with:

  $ ./scripts/get_maintainer.pl -f drivers/of/unittest.c
  robh+dt@kernel.org
  frowand.list@gmail.com
  devicetree@vger.kernel.org
  linux-kernel@vger.kernel.org


So to get it merged you should send a v2 (ie. with "PATCH v2" in the
subject), and Cc those people above as well as linuxppc-dev.

You should include the Fixes and Reviewed-by tags I've posted above in
your v2.

cheers

> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 92e895d86458..ca7823eef2b4 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -1146,8 +1146,10 @@ static void attach_node_and_children(struct device_node *np)
>  	full_name = kasprintf(GFP_KERNEL, "%pOF", np);
>  
>  	if (!strcmp(full_name, "/__local_fixups__") ||
> -	    !strcmp(full_name, "/__fixups__"))
> +	    !strcmp(full_name, "/__fixups__")) {
> +		kfree(full_name);
>  		return;
> +	}
>  
>  	dup = of_find_node_by_path(full_name);
>  	kfree(full_name);
> -- 
> 2.23.0
