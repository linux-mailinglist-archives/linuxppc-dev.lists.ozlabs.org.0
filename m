Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0051BB44D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:59:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B5wX4mCVzDqjT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 12:59:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B5lM720zzDqpk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 12:51:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=I8N3xVH+; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49B5lL0BjJz9sRY;
 Tue, 28 Apr 2020 12:51:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1588042319; bh=r5Tvdog+oekyzSzSlTc7HgiNfwz4L1TcZBGr5ZE+R9Y=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=I8N3xVH+hQtt50jVi6Jl7REeiYhE+Ms2nP1zfHzGZCOaJxtALGlwrn+1EedXTMiI/
 5FhMU67SHJd2vI0nhihcCftizAnuSUxBuMXwXIKH63+aeCRDClv7C0oO3NNphbTbUw
 gO3zmC+2mDlaFpvp24+UUVBJNqeZ/w56gwe29raW3TFZq1Eq3JDGF8Q8MSs5TVl8bG
 XmjXpEADeFeBz3Zkrf9sfMtKLciDNIczRo3QZJ1LU8MHD2CIbJDfCJJn/DXu4dxxsR
 A0g8HIJXHRNy97HlStw9iDlAvS99j3d6NIz39OKFty1f5KF5FMmDorhb2CZhu2smcD
 LnhwwQ0e38M8Q==
Message-ID: <fc3b45c91e5cd50baa1fec7710f1e64cbe616f77.camel@ozlabs.org>
Subject: Re: [PATCH 1/5] powerpc/spufs: simplify spufs core dumping
From: Jeremy Kerr <jk@ozlabs.org>
To: Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>
Date: Tue, 28 Apr 2020 10:51:56 +0800
In-Reply-To: <20200427204953.GY23230@ZenIV.linux.org.uk>
References: <20200427200626.1622060-1-hch@lst.de>
 <20200427200626.1622060-2-hch@lst.de>
 <20200427204953.GY23230@ZenIV.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 "Eric W .
 Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Al & Christoph,

> Again, this really needs fixing.  Preferably - as a separate commit
> preceding this series, so that it could be
> backported.  simple_read_from_buffer() is a blocking operation.

I'll put together a patch that fixes this.

Christoph: I'll do it in a way that matches your changes to the _read
functions, so hopefully those hunks would just drop from your change,
leaving only the _dump additions. Would that work?

Cheers,


Jeremy

