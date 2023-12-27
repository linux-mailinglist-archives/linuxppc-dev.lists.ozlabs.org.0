Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F4C81EDEA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 10:50:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=VluRIvoB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0Rj52Vhzz3cNY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 20:50:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=VluRIvoB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0RhJ28Bdz2yGv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 20:50:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=8D1nR3UITzFMaaHpgaZnlOViC4xKjcKkd2o3VGQDMKE=; b=VluRIvoBCels8HKlQD00D8f7R8
	iDq3t38oUw+Su+XE1t6N5eJQo3TUcuojjVokKfk5wR8emrFjt98K5oNxlOZ5XmYSKqrX5ijeSmap/
	6t46KeBh/2S8jlS4zPJP8ZvlS3lWcI7gBjq2C9nRUjuWrEexB3FY1yyLhLxp8yf1jBm2eH9qpPbpy
	wPCX/8oOCtvGg7yOARLCClgnp4J4uRXTTKNWUQhyvtlhpz61EQaDV6HIFIz/lzNnL41q1zF62EH2b
	jCx3d0NEtWLQKLLcDbPsJG1e4wL1xoYZcYD0iahZGkdAEzngkNyQLNwQ3KCrojyrhiECY/Stzv3yz
	DEw6Vmzw==;
Received: from om126253129164.31.openmobile.ne.jp ([126.253.129.164] helo=[192.168.43.165])
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rIQY7-002ZQ9-7b; Wed, 27 Dec 2023 09:50:04 +0000
Message-ID: <ddfd8c20-0bc8-4373-b7a5-27dd2d00ee69@infradead.org>
Date: Wed, 27 Dec 2023 18:50:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] powerpc/ps3: Fixes for lv1 hcall assembly
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20231227072405.63751-1-npiggin@gmail.com>
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20231227072405.63751-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 12/27/23 16:24, Nicholas Piggin wrote:
> This (hopefully) fixes the ELFv2 bug that Geoff reported, with patch
> 1. And a couple of other possible improvements I noticed.
> 
> I don't have a PS3 setup[*] so I have only compile tested these, I'm
> sorry.
> 
> [*] Is RPCS3 usable for this kind of thing?
> 
> Thanks,
> Nick
> 
> Nicholas Piggin (3):
>   powerpc/ps3: Fix lv1 hcall assembly for ELFv2 calling convention
>   powerpc/ps3: lv1 hcall code use symbolic constant for LR save offset
>   powerpc/ps3: Make real stack frames for LV1 hcalls

A big thanks for working on this.  I'll test on PS3 within the next
few days and report back.

-Geoff

