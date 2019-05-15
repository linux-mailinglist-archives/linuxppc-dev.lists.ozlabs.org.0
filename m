Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA4F1EF77
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 13:37:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453swq1TwdzDqVK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 21:37:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="0INscPJU"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453ssG6STQzDqT1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 21:34:26 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 522922053B;
 Wed, 15 May 2019 11:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557920064;
 bh=UKdAqxo5hGOoDMAl9NLSkpt4zg9p5OCAItHb4xUscto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0INscPJUwspjjab4+Ys0uyPkmH3TYHvz0F5xmbtnQ+A6D3MDwqBqNrbGh64zhPHAH
 qkrpQ3WdcqkqAIQNM97IqfuuML5BH9yZH5XjOzjncOvYvGckk/vCJnSBkG+x4QATpQ
 Te7wIAaisgKKB5rhWXwslNrfah0Qp0vHk/YHWt+4=
Date: Wed, 15 May 2019 13:30:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc: Remove double free
Message-ID: <20190515113019.GB11749@kroah.com>
References: <20190515090750.30647-1-tobin@kernel.org>
 <aa001c3b-f96e-2078-0861-315613ec33a0@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa001c3b-f96e-2078-0861-315613ec33a0@c-s.fr>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "Tobin C. Harding" <tobin@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 15, 2019 at 11:26:03AM +0200, Christophe Leroy wrote:
> kobject_put() released index_dir->kobj

Yes, but what is that kobject enclosed in?

> but who will release 'index' ?

The final kobject_put() will do that, see cacheinfo_create_index_dir()
for the details.

And please do not top-post, you lost all context.

greg k-h
