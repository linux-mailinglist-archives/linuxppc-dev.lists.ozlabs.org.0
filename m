Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D763786766
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 08:21:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=M02na9u6;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=CArdl59V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWXz41hr4z3c5l
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 16:21:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=M02na9u6;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=CArdl59V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=lists.ozlabs.org)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWXy52Bw0z3bxt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 16:20:28 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 638185C0221;
	Thu, 24 Aug 2023 02:20:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 24 Aug 2023 02:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1692858021; x=1692944421; bh=bZgEwzgAaYxYBAALk+2iPFuGuMNgiE8QRkG
	FcnpHEiU=; b=M02na9u6UlBiD+d2unj80YLeQvp63zW76XvAevF7srJ/tgyjmLN
	HQ9DZKBjlvjLN6PQJ7yiABdlxqBY0ClmJUOZC5Wy4QP9miV7uQr83kf+HNnLOfUV
	TG/fW+/36PYoi7l5kg/iTPL9pIe6amGrxoDn1wJwhp4ePB7iWwB6tEgjzYBCIJb2
	1PPAXTic5ndtVzVAoOihC8mKuFonDc/CbSBgrM9BRLHR4rRCSGrrl4xrnW19AZUs
	exIRfRQ5YA0reCdZk737/hQobY4uBLDE+zUJfL+GcZXqohuRaUQYZOz2c0Z3B8zy
	dB1oVNMUw4mjLSO9MrXSKbwwLqVW55ZA82A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1692858021; x=1692944421; bh=bZgEwzgAaYxYBAALk+2iPFuGuMNgiE8QRkG
	FcnpHEiU=; b=CArdl59V8225AiI6LSrZ5YRsRMxhoskBc/3nYy0hp3Uvt266gCJ
	GoT5YAY8y0jLuhZaqdTXO+yxL9s7YnH1nzUzaIBwtJ9Qxja2nc7IGIreyUUgw17M
	PPUJUtCMuXW5fy8OMG6gQTQJ9gskPTDUACdXkxJ1XS+rG7O6keJs0HQXXVYqFadV
	tqZ3TiMdVnoUVwDM4x2Wu+66WcE9FiwNfmzKIXeIyD91pUwBVVTdgnfarUAQxCkt
	4HC83o6fHjBRwAAfnUa6NdF4UzawSJqULFq3s8qWG2NlbfhhADaU9r8PTQFSwcST
	tjV969EH+wYMjCOMeH68lt7JaofAv5t/kWQ==
X-ME-Sender: <xms:pPbmZDz5Q0kLysGWcmfaKWdllot7eVjZcisiq1Jp7-3udjkoFOAisw>
    <xme:pPbmZLQiI1fh8p1-TvpNpQJjuPnEDy9043L2_ige-ExOiaLo1hVx5HbpLdubGkqrg
    KCaTJHK2HwGvBAybw>
X-ME-Received: <xmr:pPbmZNXWc7iMqjPcxC2s7TF5yXsdBcsXwamkCpBGSOLiUWijuZQt9AQITP00EOrlYiyyimL2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddvhedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddutddmnecujfgurhepkffuhffvveffjghftgfgfgggsehtqher
    tddtreejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrh
    hushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpeejtdehtdelfefffeekffekheel
    gfdtheeludeiieetiedvhfeludettdehgefgleenucffohhmrghinhepghhithhhuhgsrd
    gtohhmpdhoiihlrggsshdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:pfbmZNhClaOgwg_Ecgaaw_5Rq8UkyTuGzkzo2wvobO4X7DbRX8H94w>
    <xmx:pfbmZFBK_-t_wxEsK5fcTiIl7FnRuoHVcr_QfAn16STT5hgEeHoU4w>
    <xmx:pfbmZGIgHTv1d1OQKbLHBIfQjVSambBZZkAThoD-NUKCzHvy7_RRFg>
    <xmx:pfbmZI68uG4bPw9S0PVdL6LHXxZnyuUiTaKKUaMsJaD4z3xNZZp80Q>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Aug 2023 02:20:18 -0400 (EDT)
Message-ID: <350d2d004cb3d250e40141a0e6f588c8a5585d90.camel@russell.cc>
Subject: Re: [PATCH RFC 2/2] powerpc/selftests: add test for papr-vpd
From: Russell Currey <ruscur@russell.cc>
To: nathanl@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Michal =?ISO-8859-1?Q?Such=E1nek?=
 <msuchanek@suse.de>
Date: Thu, 24 Aug 2023 16:20:16 +1000
In-Reply-To: <20230822-papr-sys_rtas-vs-lockdown-v1-2-932623cf3c7b@linux.ibm.com>
References: 	<20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
	 <20230822-papr-sys_rtas-vs-lockdown-v1-2-932623cf3c7b@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (by Flathub.org) 
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
Cc: tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2023-08-22 at 16:33 -0500, Nathan Lynch via B4 Relay wrote:
> From: Nathan Lynch <nathanl@linux.ibm.com>

Hi Nathan,

snowpatch has found a compiler error with this patch.


   Error: papr_vpd.c:346:33: error: passing argument 2 of 'test_harness'
   discards 'const' qualifier from pointer target type [-Werror=3Ddiscarded=
-
   qualifiers]
      if (test_harness(t->function, t->description))
                                    ^
   In file included from papr_vpd.c:11:0:
   /linux/tools/testing/selftests/powerpc/include/utils.h:35:5: note:
   expected 'char *' but argument is of type 'const char * const'
    int test_harness(int (test_function)(void), char *name);
        ^

https://github.com/linuxppc/linux-snowpatch/actions/runs/5960052721/job/161=
66735476#step:6:1337
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20230822-papr-sys_r=
tas-vs-lockdown-v1-2-932623cf3c7b@linux.ibm.com/

- Russell
