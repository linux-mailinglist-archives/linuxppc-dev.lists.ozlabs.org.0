Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B95167D6644
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Oct 2023 11:09:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=MUWn8dN1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SFjmg4kYVz3cTj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Oct 2023 20:09:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=MUWn8dN1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFjlq1f82z2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Oct 2023 20:08:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 573A6CE34FD;
	Wed, 25 Oct 2023 09:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7E0C433C7;
	Wed, 25 Oct 2023 09:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698224930;
	bh=itIf9cOabqYGAHuSf2wNhn6UlBjXi9zaPiiD1oZbPaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUWn8dN1sC+I65NJ5aEhqi/Wy3FJKGK+ODGEgsDFteP1mgyriQetIJhHJpXKFKRf5
	 Ll+PVJd9iaDiHDDIpft5kaplhA7xlzt8JRCsd7qVzQ0/+FlKLNGz5sfHcA7Uc3RNFi
	 UzCjeD5IAbdrztBh0kkzl9lT8/UCnLm6WmtuUqNY=
Date: Wed, 25 Oct 2023 11:08:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Subject: Re: [PATCH] cxl: make cxl_class constant
Message-ID: <2023102533-anyway-bullish-75be@gregkh>
References: <2023102434-haiku-uphill-0c11@gregkh>
 <9573ec63-a8d6-4c69-a70b-9095838d521d@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9573ec63-a8d6-4c69-a70b-9095838d521d@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 25, 2023 at 10:16:55AM +0200, Frederic Barrat wrote:
> 
> 
> On 24/10/2023 13:48, Greg Kroah-Hartman wrote:
> > Now that the driver core allows for struct class to be in read-only
> > memory, we should make all 'class' structures declared at build time
> > placing them into read-only memory, instead of having to be dynamically
> > allocated at runtime.
> > 
> > Cc: Frederic Barrat <fbarrat@linux.ibm.com>
> > Cc: Andrew Donnellan <ajd@linux.ibm.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> 
> Thanks!
> Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>

Thanks for the review of these, I'll take them through my char/misc tree
now.

greg k-h
