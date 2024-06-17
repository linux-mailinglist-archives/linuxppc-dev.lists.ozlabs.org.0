Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BCF90AE14
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 14:36:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm1 header.b=fXAxbDmH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=JDZyf9zI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2qBp26FKz3fw6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 22:36:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm1 header.b=fXAxbDmH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=JDZyf9zI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kroah.com (client-ip=103.168.172.144; helo=fout1-smtp.messagingengine.com; envelope-from=greg@kroah.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 469 seconds by postgrey-1.37 at boromir; Mon, 17 Jun 2024 22:36:10 AEST
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2qB22dy1z3ftj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 22:36:10 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id CBB991380293;
	Mon, 17 Jun 2024 08:28:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 17 Jun 2024 08:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1718627297; x=1718713697; bh=UZ5o3jqx9C
	riZhvR5DdY+AJpqF7Ix3G5yRFHi2wSlnI=; b=fXAxbDmH+8Ptt6hj5HTbwoxXTG
	47zANe9drycRjwo5QfBSBebhxahzfmBZInXBAJ73FBvLr/yzrdxZdWeuZOLVSiu+
	FplqWFRBZq+OwA4ml/T3oloOkq6Rwn2DzRAUBol6kG86l1tlm0nRz+1WEG5g51pj
	OYJwHHm5E2mEeO19K3E9qkngmAOi5hkszmJIJ3VhVq+75AW2NInlRC/IUB9J0Br6
	l4EDRHr9DnW/BHXDwEo0zrI3fgEU0IGJf/3ZgEcX/qCJGR3sxGifpobQpngUoQXa
	wqNleOj/hvqJ2Ht2yO3w7Ufr4al82pWorFGD5I7hvFm8zyLtnRJQ0GgVqtjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718627297; x=1718713697; bh=UZ5o3jqx9CriZhvR5DdY+AJpqF7I
	x3G5yRFHi2wSlnI=; b=JDZyf9zI6PsCMDsJN4mfa4A8WH9qH1fJ0dtt7UWe9FAm
	/utRTXJQoGD+5ox+4oL4noFSaFU5BcFDXTHFeWfr2k2g5hHduDYRSvWN2MGA+X4i
	WRwJG9QDO3yNK0A82538O6xETZLPvDaIB/R+oR6dxFjAAwE7b2DfmYfycxUj2Hfx
	PLDA4zprmjYOAuUryuH0eYuoBY8thVVUbGuwnYsRRGJHg/pQoqi4Q+120fPyoPzz
	/ycqzkNRinu1/xFkD90rKlzuSc+wdi8Z+/rw4uBPEIdL3FTGdSsDTHHIk+zd7QDJ
	lpmQQwniwpLuq46AYwH04o0aa8kS/DVR5w3qxJRIWg==
X-ME-Sender: <xms:4StwZrpRueeAjuIIMisbDkDqcc5g7X1hEFv6fdi5YNSTHG02J4eDjw>
    <xme:4StwZloEwxTR_kfZlFPMKGDOra5wK9dsJRHKtJcBdiFS-UuVFuBB3YI2LKQP6cQ0c
    c8vvOvXyyHXLg>
X-ME-Received: <xmr:4StwZoMOShPllUDYHfGW13Vo8hvAKXr2BKqApX9Hb92efkr4_u3ai7dfRfsdRjB4x4BbOs_SKXiTQ7OLQiVruMvrThQsdHR4N-BjPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvhedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucggtffrrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekje
    euhfdtueefhffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:4StwZu5LOf8qaAEyFQJJ6uT8EwPU9byioEcibyDepwJWYqhRVwNNWg>
    <xmx:4StwZq7sSMVq7gD-hwxSaI9iU-bGDg0fQQqEnTvnx1Y07etB_A-PwQ>
    <xmx:4StwZmi2_xlvxCtltmUqgoxiisgNjdzJFb34AnUPnxYwe3eCvdB26g>
    <xmx:4StwZs6rP5p3iz_KpWJ3CPb1JUgOqxGCaC1bHe5e3oV8UUKdWxtJTw>
    <xmx:4StwZnuZZrz5BSF9aRYYNR-4JjYaK-F1kpYw5XZnwq24lPEkcMqQhejC>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jun 2024 08:28:17 -0400 (EDT)
Date: Mon, 17 Jun 2024 14:28:14 +0200
From: Greg KH <greg@kroah.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5.10] powerpc/uaccess: Fix build errors seen with GCC
 13/14
Message-ID: <2024061706-dingy-constant-fd27@gregkh>
References: <20240614112714.3482739-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614112714.3482739-1-mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 14, 2024 at 09:27:14PM +1000, Michael Ellerman wrote:
> commit 2d43cc701b96f910f50915ac4c2a0cae5deb734c upstream.
> 
> Building ppc64le_defconfig with GCC 14 fails with assembler errors:
> 

All backports now queued up,t hanks!

greg k-h
