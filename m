Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E8F7393B0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 02:19:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=sOGo0b9A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qmgx85BG1z2ys4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 10:19:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=sOGo0b9A;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmgwH4TKFz2xr6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 10:19:11 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QmgwD1y3Tz4x04;
	Thu, 22 Jun 2023 10:19:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1687393151;
	bh=e1vNIrKkUVeA1lDXf5ILJ6GZss64BKmuwgfbxbz1Xec=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=sOGo0b9An8yn8yuI5B2TyY9eRC31nTORHe4NUYIqg2H624n74q4jkenwrK+2m9rdS
	 tZoID7tMMZ/2iZi6X6aZNeUIwJ5G8lFjDMJINW3WRlnkSTja/TloOAgntkmqYPbgUp
	 K1n+WNG00qiHCzHTi8oQMAr3h2AI7r53v9qy2owqTuXn3Ik0CRdGq8Ez0YKtoOAvPc
	 8FHSomDjqyv+YfvQAryM+8f1sbP0uUfk9M2nHYQWWTC1yQEWS+Vn+Bs0YNQHH87NZX
	 n2YwtxFJiYUP1a5ZoPArvdUALxX3kUigFtOUwE3dOMk50Ili7tjse1Z2DFLWz2stei
	 7sSmI8wubm9YQ==
Message-ID: <68f894d014dce50ffd2c46684593e18e4e8b4931.camel@ozlabs.org>
Subject: Re: [PATCH 02/79] spufs: switch to new ctime accessors
From: Jeremy Kerr <jk@ozlabs.org>
To: Jeff Layton <jlayton@kernel.org>, Christian Brauner
 <brauner@kernel.org>,  Arnd Bergmann <arnd@arndb.de>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Date: Thu, 22 Jun 2023 08:19:05 +0800
In-Reply-To: <20230621144735.55953-1-jlayton@kernel.org>
References: <20230621144507.55591-1-jlayton@kernel.org>
	 <20230621144735.55953-1-jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, Jan Kara <jack@suse.cz>, Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jeff,

> In later patches, we're going to change how the ctime.tv_nsec field is
> utilized. Switch to using accessor functions instead of raw accesses
> of inode->i_ctime.

s/utilized/used/ :D

All looks good on the spufs change:

Acked-by: Jeremy Kerr <jk@ozlabs.org>

(also, thanks for including the accessors patch on the wider list, made
it much easier to review in context)

Cheers,


Jeremy
