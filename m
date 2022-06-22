Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8795544AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 10:41:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LScLK5d9Xz3cL8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 18:41:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=LA+Upf0K;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=C9ry61oO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=LA+Upf0K;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=C9ry61oO;
	dkim-atps=neutral
X-Greylist: delayed 513 seconds by postgrey-1.36 at boromir; Wed, 22 Jun 2022 18:40:50 AEST
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LScKZ4WLRz3blF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 18:40:50 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 78E2932006F5;
	Wed, 22 Jun 2022 04:32:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 22 Jun 2022 04:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1655886730; x=
	1655973130; bh=iAGqNLqvxLqcehmdAuvFnP4Q8RBBYLJJbA7BHIYW2w4=; b=L
	A+Upf0Kyuz4TXGbKm+T8z7RKrk5HuD+LoNxXFqLUfXNX1corGhkeoosEX6QYnaza
	tHo53cuPYOscqNgbSMecRTZDHGlphevG8+kNNcX57XuVgoLhe7hcfPCBDJ0o8j7x
	OgH+IQDJIYrMNu6sNYTjKQWEmXEENy0O0UM8NUo5XPef4yzl//MNZVzgqgIfJLgH
	TZN0oJVMsTgelNNJIf6GH0U8vnhzDAsE8lp9aX/yostWqW257cCqc34X1lEmm4B+
	YUajlEOGaBGN30/s6ZCVkIMmwLcyTL8ITzPuvsRt9PANNF/lS2rmpL/4XhoQFQcK
	rgeitH/J8wa42voNkIZNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1655886730; x=1655973130; bh=i
	AGqNLqvxLqcehmdAuvFnP4Q8RBBYLJJbA7BHIYW2w4=; b=C9ry61oO/gfJFkMsH
	cL9m6sNEtovOvV0wFcNe1ezKR57sJsr5Bb5DKSl1ZkCXO29k9f9IESAE8kRmkdZI
	x6TjzhkufeZN+/HMUNIYeAyhZiOD58lGN73pyMJkzIrli8Vo5FUyH2sScE0OqSMk
	2EvdtOEelM9yF/+fGlhr28RYtfhvuB6W0R+xT0dpH6jJFPOf9kgcHpqYtPjQ36hD
	3yyjdzZH7pphZHv8+kQ7YPt8gPEzmg5FDwmCNn5qIEqUgQBvqfG+pqM+piBz8y6K
	M4yLku/uulQHR5aIitQVj9P6XSp3MljXbF0tX7tdBeDw5D5+HiNDgZPgNHEhBcf3
	ObY7Q==
X-ME-Sender: <xms:itOyYsDaHmgZBJHV839pscbX1QRzS8Jy5U5DDd5jpJNEaysT_wBgaA>
    <xme:itOyYui_oX6t7KOZevJUkl_E-JTtGx0lAKsjOWJmT93jjGH7KMU81Hhl2XFlIHTER
    2nWsMDppcqKwm2L4g>
X-ME-Received: <xmr:itOyYvl9iU4KS4Y8J_vPTHJoGiDl4cS7WpXZck47_K0udubRP74U1hau2oOpqdtFXJoZdbE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludehmdenucfjughrpefkuf
    fhvfffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
    rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpe
    evhfehieeijeeiheegueehgfffudduveeukedujeefhffggfegtdeiveeuhefgtdenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurh
    esrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:itOyYizFJ0z5v0lj3x_B3Nz-Eoo8BtcoXRY7XGjfwLXu3tZP-YHVYw>
    <xmx:itOyYhRA6FBQfe6RO-Mi9PMMpQz6X73vuzwTI0YXRqorG-NG6djYfQ>
    <xmx:itOyYtbcywdxIDMy1o5ZAfWrgFo4rEKl40sXzYqgG6qNqJ8JBlSGEg>
    <xmx:itOyYi4BQYkpPN8iijo0DDs6kq7ZpySv_0sy8DrS5q50UUFtC0DNAw>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 04:32:09 -0400 (EDT)
Message-ID: <da25a411031208310b63dd652a9ae5a2e65c037a.camel@russell.cc>
Subject: Re: [PATCH] powerc: Update asm-prototypes.h comment
From: Russell Currey <ruscur@russell.cc>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 22 Jun 2022 18:32:04 +1000
In-Reply-To: <20220617080243.2177583-1-mpe@ellerman.id.au>
References: <20220617080243.2177583-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-06-17 at 18:02 +1000, Michael Ellerman wrote:
> This header was recently cleaned up in commit 76222808fc25 ("powerpc:
> Move C prototypes out of asm-prototypes.h"), update the comment to
> reflect it's proper purpose.
>=20
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Hi Michael, subject says "powerc" instead of "powerpc".

- clippy
