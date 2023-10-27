Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF857D94E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:13:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HsM795jW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGz5t0W6xz3vlM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:13:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HsM795jW;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGyzQ5qvhz3cCH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:08:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698401298;
	bh=SPAGDpDz2k/2kguqhl8Z+gROPqCD/5aODXVh/os0Cbc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HsM795jWPXFnOnk0M1FPzOceaIeclRS7j+TcuJss3VixbC04tSeLgjThN7oHVcDLi
	 TvW6YzJOFCT1sRaPssBNOI3ddyGhtpM0acR40OeGby66ZXLP20pDvbs86B8DCVbvaA
	 KR7r730jGpBM6AQGUts2roI91Xp56sasQmAcDC6VMRTEY2vRvtJ+R+MtZwzJKmxvkP
	 529z1y4d4/lNQt16aSpoPWpDOKd7tdlDq3mevSGWTy/zXXIaqOuyceWb24Jv13eimZ
	 BoPkuUk3LkXnYOPrPmq5X1BhthZe33jH6Yz14YkFKnvCOAJNu4JsQTGg1LewmFb2yl
	 dvaM6WSsNGgTQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGyzQ1RzFz4xWb;
	Fri, 27 Oct 2023 21:08:18 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Stephen Rothwell <sfr@canb.auug.org.au>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Minjie Du <duminjie@vivo.com>
In-Reply-To: <20230717092648.9752-1-duminjie@vivo.com>
References: <20230717092648.9752-1-duminjie@vivo.com>
Subject: Re: [PATCH v1] powerpc/pseries: use kfree_sensitive() in plpks_gen_password()
Message-Id: <169840079685.2701453.1853260380342531870.b4-ty@ellerman.id.au>
Date: Fri, 27 Oct 2023 20:59:56 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: opensource.kernel@vivo.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 17 Jul 2023 17:26:48 +0800, Minjie Du wrote:
> password might contain private information, so better use
> kfree_sensitive to free it.
> In plpks_gen_password() use kfree_sensitive().
> 
> 

Applied to powerpc/next.

[1/1] powerpc/pseries: use kfree_sensitive() in plpks_gen_password()
      https://git.kernel.org/powerpc/c/ca2b746d5f91a37f01baedff54b9315a50ee617d

cheers
