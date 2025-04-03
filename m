Return-Path: <linuxppc-dev+bounces-7429-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CFCA799F9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Apr 2025 04:32:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZSm4418Zmz2ySK;
	Thu,  3 Apr 2025 13:32:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743647572;
	cv=none; b=GP6/43GzttPPMM4Y+7hbBMKCOBhay2k+/KWYMkL4+AJiHomtML6aWA4YeIw7vDWIcdiKL2bmrTijQJaX1wV17GJU6NUO3iZ0IYv12xf0Uz1FG1e5M2gka/xVkzng7fnVjcVoblSjDsMc1aOiiGedOO/3HgrcXK0ClzFp8Y67WQsGZz0LURJAzsHihMhsNmY3sD785WnZbZ/ub394Ybqyw0iahx7hYvOKSdFE/+ABeO+xg5ay5WXWsgbIrYigPutRO3D1adrp07JgyUk53llbRZfewHnU+PEDGnaCpzssLT0glDsQKqO770se/dj91lTSait+XoAt5ktsVJ0nZHZo+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743647572; c=relaxed/relaxed;
	bh=ynb5BhuQRh4vl3YVJhfU7TwuPIKyQ2B+xfaX/Mr1I2U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eoD8OsZjGKh+td23sw9TtooM1FR6PGWT9CeohmY6r9Ijze8e2ztixDX9HemJSHmKwbY6NGeVyW0LPYM6sMiPUYBaXDcqCHi6yT8mUN/RGFwIQJrJdejdHmpJXat/HN9wC/vCa7y8hyEHlCbV7yUI/b5mr8GE+vqiAWyvgwGzY3SL26UvrdO6atQyCJsClMi5Uhdwv8GlCSxeiOKWFvuSIMFKUeKKQUF1oARLV+FWxBxMfxoqRCjtLeZfmhAgEDAEylY087GPNIt8ALioaag5kPZQp0wPFfd9CJxM5aIMFpjYlUvflQFXBDODQFQKyyxSrSTs+kBXcLuaJR54t4WLfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TaFx3f1S; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TaFx3f1S;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZSm411NZbz2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Apr 2025 13:32:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1743647566;
	bh=ynb5BhuQRh4vl3YVJhfU7TwuPIKyQ2B+xfaX/Mr1I2U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TaFx3f1S645VC/xB4PAkYNSiiJFN2jct+wJzZwbBRqm/LzMbVWnUNPHBuPITt0AdM
	 VK9rPwy5XpVfe4NypuArLPsYrzoQzmV5DczWdzpZN/Ho7qsVjrllG8ST2XzwhCVSx/
	 6RWO3wys3qvBz6t/Hzvs7NDR4UA9AwmHCTFv9P/U4ka3uCrRwreaRghQXCf+ZeE4SX
	 I6OqhXVI/N6ZPOaUUPMZAi8hGaMCMWfsO8iSHJSz2KqBOkBa6m+oJHaUdKCt7tAar3
	 rDlNR0qqT3YaUdhO+2r0n1MWOkJbWxUHgFCNCLpoW/qwP4mp5HO3Qwv9I5R2Xu921H
	 wzc3sKiVwd0fg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZSm3y2v9Mz4x8S;
	Thu,  3 Apr 2025 13:32:46 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Linux Next Mailing
 List <linux-next@vger.kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: Please add powerpc topic/cxl branch to linux-next
In-Reply-To: <20250318002643.71ef29f1@canb.auug.org.au>
References: <87y0x3dibs.fsf@mpe.ellerman.id.au>
 <20250318002643.71ef29f1@canb.auug.org.au>
Date: Thu, 03 Apr 2025 13:32:43 +1100
Message-ID: <878qoiht4k.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> On Mon, 17 Mar 2025 22:09:43 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Could you please add the topic/cxl branch of the powerpc tree to
>> linux-next for the next few weeks, it's targeted for the next merge
>> window.
>> 
>>   https://web.git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/cxl
>
> Translated to git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git#topic/cxl
>
> :-)
>
>> It contains a topic branch of sorts to hold the cxl removal. It has a
>> few commits from the SCSI tree, up to and including the cxlflash
>> removal, then it merges powerpc/fixes to get a Documentation/ patch that
>> touches cxl, and then the cxl removal patch from Andrew.
>> 
>> The plan will be to send it to Linus after the powerpc and SCSI trees
>> have been merged, during the merge window.
>
> OK, added from later today.  I have added it late in the merges.  Let me
> know when you are finished with it.
 
This branch has been merged intoo mainline, you can drop it from
linux-next. Thanks.

cheers

