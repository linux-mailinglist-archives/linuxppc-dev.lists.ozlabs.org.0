Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BF4713896
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 May 2023 09:57:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QTWH75KQZz3fG6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 May 2023 17:57:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FRpKjehm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FRpKjehm;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QTWGF5Gn3z3bVP
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 May 2023 17:57:08 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A477860AB8;
	Sun, 28 May 2023 07:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F2AC433D2;
	Sun, 28 May 2023 07:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685260625;
	bh=UuZyK9hXvbOMSMv0+Ol5EZmZ0bFahKWss3TY5SSSesA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRpKjehmsVXpYGmBZOZRLP/dPWa+8wCRiRgFhGTtxssDaIJMUy2AOVsM98yFKX5W0
	 n8MW0Dout/vGg5N2xvbBMhJJ90LfPZHrplvxUPWc5koDT4fvwX3ynJ7LxY+U9jcvbJ
	 SmXOcP2eh4Ca3S5p3TazXa8XJoyPfB7/aw1Q6g58=
Date: Sun, 28 May 2023 08:57:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: mirimmad@outlook.com
Subject: Re: [PATCH] powerpc: fix debugfs_create_dir error checking
Message-ID: <2023052835-oxidant-doily-404f@gregkh>
References: <CY5PR12MB64553EE96EBB3927311DB598C6459@CY5PR12MB6455.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY5PR12MB64553EE96EBB3927311DB598C6459@CY5PR12MB6455.namprd12.prod.outlook.com>
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
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Immad Mir <mirimmad17@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 28, 2023 at 01:16:44PM +0530, mirimmad@outlook.com wrote:
> From: Immad Mir <mirimmad17@gmail.com>
> 
> The debugfs_create_dir returns ERR_PTR incase of an error and the
> correct way of checking it by using the IS_ERR inline function, and
> not the simple null comparision. This patch fixes this.
> 
> Suggested-By: Ivan Orlov <ivan.orlov0322@gmail.com>
> Signed-off-by: Immad Mir <mirimmad17@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/opal-xscom.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/opal-xscom.c b/arch/powerpc/platforms/powernv/opal-xscom.c
> index 6b4eed2ef..262cd6fac 100644
> --- a/arch/powerpc/platforms/powernv/opal-xscom.c
> +++ b/arch/powerpc/platforms/powernv/opal-xscom.c
> @@ -168,7 +168,7 @@ static int scom_debug_init_one(struct dentry *root, struct device_node *dn,
>  	ent->path.size = strlen((char *)ent->path.data);
> 
>  	dir = debugfs_create_dir(ent->name, root);
> -	if (!dir) {
> +	if (IS_ERR(dir)) {
>  		kfree(ent->path.data);
>  		kfree(ent);
>  		return -1;

Why is this driver caring if debugfs is working or not at all?  It
should just ignore the error and keep moving forward.

And -1 is not a valid error number :(

Have you hit this error on this driver?

thanks,

greg k-h
