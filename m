Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3476C8985
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 01:16:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pk0410nrjz3fSc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 11:16:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pEIcaB2i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pk0332p9wz3fG3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 11:15:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pEIcaB2i;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pk02y25fHz4x7x;
	Sat, 25 Mar 2023 11:15:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1679703322;
	bh=w0K471ob1PKvPyBG5sRwgYplsvQOQMCjUSp20cySzEw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pEIcaB2i63v6VAZvd8QS9Avo2WmI3Yc4NjqjsdJkgVpscX4Dbz6vticu+AhMtQ0QY
	 29ryB5pX2Pf+nWqv1iCICFwczj4NcyrruwVEO1k9RXYjGw/ziHD2xdghz9rGBjGc4+
	 70s7SvWQuhkYo6GXA71TkLs6p/PBpF8wAPnx8mfQLr9aSPVETOtcX5K43jH1NYtNth
	 Y3l7E+NXxCaVqAqAuYRxJjYzpyf0RDVlNT/JMCU40P8cXTOmNlJ/ixZiXZwb2TPmdw
	 UHVW8rZmkdl7wjjs/yoaNoQSOL6zbFsW5StZdQLfpfIuH4R7j/a5Lr2zA0vfd+2FVw
	 OiWbfO0GNg2KQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jens Axboe <axboe@kernel.dk>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Memory coherency issue with IO thread offloading?
In-Reply-To: <5fa06524-7170-aeb4-4b5c-2be2ffad696b@kernel.dk>
References: <2b015a34-220e-674e-7301-2cf17ef45ed9@kernel.dk>
 <272cda99-3b1a-95cd-ce03-bc3d17d572ec@csgroup.eu>
 <5fa06524-7170-aeb4-4b5c-2be2ffad696b@kernel.dk>
Date: Sat, 25 Mar 2023 11:15:16 +1100
Message-ID: <87jzz5u1nv.fsf@mpe.ellerman.id.au>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jens Axboe <axboe@kernel.dk> writes:
> On 3/24/23 1:27?AM, Christophe Leroy wrote:
>> Le 23/03/2023 ? 19:54, Jens Axboe a ?crit :
>>> I got a report sent to me from mariadb, in where 5.10.158 works fine and
>>> 5.10.162 is broken. And in fact, current 6.3-rc also fails the test
>>> case. Beware that this email is long, as I'm trying to include
>>> everything that may be relevant...
>> 
>> Which variant of powerpc ? 32 or 64 bits ? Book3S or BookE ?
>
> I knew I'd forget something important... It's power9:
>
> processor	: 0
> cpu		: POWER9 (architected), altivec supported
> clock		: 2200.000000MHz
> revision	: 2.2 (pvr 004e 1202)

Believe it or not there's still more variables in play, Power9 has two
different MMUs, and Linux can run on two different hypervisors as well
as on bare metal P9 :)

Can you paste the last ~10 lines of /proc/cpuinfo, with the "machine",
"firmware" and "MMU" lines, that should tell us everything we need to
know.

cheers
