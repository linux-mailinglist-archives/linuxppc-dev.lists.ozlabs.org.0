Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D4234F814
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 06:42:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9DFY6PjYz3cL6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 15:42:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=DgEdJAZ7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=DgEdJAZ7; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9DDk6hnqz3bqt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 15:41:58 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4F9DDk40Drz9sVq; Wed, 31 Mar 2021 15:41:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1617165718; bh=2EYgyDCXlPOxHbkHJwFitlOfJjafknXZrz2SFyNR4O0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DgEdJAZ7aHWX3BMKfNCiMb/YeXrWTVjoB+7ASYXew2dzJw7aFwLcoMuIIHQuWbHnr
 Z+bOEq8Lclj4J+/l5SYg2r2SSqbS8YaLptHYlrD8TTGVy3ZdIWCy78K1JZZfuI5Ykp
 4lcfte07Xi68uXE9lyylmfygOy5oSDGakIm9fBqMl6K9ILxXwBKA2HspE+c8aaPfBq
 jpOomj4CK+vZKUhSBu9/yLwsGknDrEA1PC/LfFIZKCehonis4SDY5ZXossTI2KVP5+
 jqPI7sl04aXi6Ik7fpIthIG1pHnFoTo3xACGi6jiKnAYPE3VzX8Ly7UmuIoLViTKp6
 VW5wSvBgpQ7Zg==
Date: Wed, 31 Mar 2021 15:41:54 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 08/46] powerpc/64s: Remove KVM handler support from
 CBE_RAS interrupts
Message-ID: <YGP9koHi/bLNYdOp@thinks.paulus.ozlabs.org>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-9-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323010305.1045293-9-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 23, 2021 at 11:02:27AM +1000, Nicholas Piggin wrote:
> Cell does not support KVM.
> 
> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Acked-by: Paul Mackerras <paulus@ozlabs.org>
