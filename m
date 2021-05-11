Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AE0379BEC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 03:16:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfKkp4VRMz309K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 11:16:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GvhRElQp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=GvhRElQp; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfKkL6K01z2yWx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 11:16:10 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FfKkH06Vyz9sWq;
 Tue, 11 May 2021 11:16:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1620695769;
 bh=ZlOYJ/K88RGErXDxsltfMc0YfqZAWgaqHSNl1cnZGC0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=GvhRElQp8+mOHrM1yCGl+p/QoTgqHIp+fRT04XMKu+ylifnof4/W2aVacKpoHGQnH
 PZdJPfAf3YAXTCa+MmMwsuSGMEeq8+gZmj/wiLhBT16WNuMltL75QwWn1PgK4zo3dO
 MDRYji2n9cwHYVKGOz/gdIxtYcDPOCmACjl5jrxlEwxwcsNovIh6mEXztay4XdqqiE
 XjtacZfXZnqsRVkv5gCZl7GShh3zWyXm6hQA4aIEDtb8fB/bTFqefopvLngdZVlj9V
 /OBfvTVtcLb1cSaFgPniCoiv4HjUtg20M4nzItxIu0PEcm4AKjladm65f257uEAeZ1
 X1rCEaV399XCQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/legacy_serial: Fix UBSAN:
 array-index-out-of-bounds
In-Reply-To: <20210510211444.GE10366@gate.crashing.org>
References: <d5e3c8e66bad3725d7d48d0e45c4b7eb7c02631d.1620455671.git.christophe.leroy@csgroup.eu>
 <20210510211444.GE10366@gate.crashing.org>
Date: Tue, 11 May 2021 11:16:02 +1000
Message-ID: <87sg2uxe7h.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, pmenzel@molgen.mpg.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:

> On Sat, May 08, 2021 at 06:36:21AM +0000, Christophe Leroy wrote:
>> UBSAN complains when a pointer is calculated with invalid
>> 'legacy_serial_console' index, allthough the index is verified
>> before dereferencing the pointer.
>
> Addressing like this is UB already.
>
> You could just move this:
>
>> -	if (legacy_serial_console < 0)
>> -		return 0;
>
> to before
>
>> -	struct legacy_serial_info *info = &legacy_serial_infos[legacy_serial_console];
>> -	struct plat_serial8250_port *port = &legacy_serial_ports[legacy_serial_console];
>
> and no other change is necessary.

Yeah I sent a v2 doing that, thanks.

cheers
