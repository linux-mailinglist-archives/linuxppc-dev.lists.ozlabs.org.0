Return-Path: <linuxppc-dev+bounces-7126-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D78A64BD8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 12:09:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGXLP694gz2ygL;
	Mon, 17 Mar 2025 22:09:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742209789;
	cv=none; b=Ac2DSNwv6LjUkF/IjoAMG5Rx4TMJRg/931ENaw7YVtVKtrXuEuV6nLIK/vA6ffUuTOE133ppn+Hzgc3lk/p9l0nJxgHp8Wnuw2kH8jq2soCgNTYSHtgcZoUSkgux/6OlzQ7gH/WQ/wMAjaq+bIdjIlJF85NmkJ+bcTdM4rTshP8lXeVL2C9uaCPKioP3UexKX/g2cnaTknMp1N7lvNpfehA6kQhyP/aMK/+O0xly/KHxqZikP9tJ4usnNz3Sp0YRdvZV79o2L8+/RXuyJqG3nrKmxGs+KhW6H0Hzj08AxwOUEGI4GfsT+q8APp/Vtt3jbQB0QI4ia5uUHxh/dP+b7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742209789; c=relaxed/relaxed;
	bh=zqbOzGR/S1NqZVeaOkKz/a3SBP5r2fF1Gtl6KlZ7yBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=njY0v/ofEmHaC5Q+7o2yiey688Ar4WYq5RSFhH+p+enp0qCrYExugL0EPOFTeON6FbqVP+/8i8pX+9ZdwlrYAYBsA6VhZpVHtG4JHABxsf2gAt31z4H1jU8e6japUgeeCfiFlWRHtR2tGGP1GUutWLkjIffn7CUo52oaxEb6UN4SpjjB4nbzbydfLPt7hgV95zr4Lr0N7gySwN28H21ZafFPJ9x4G9VRRW5y9qVeJCjWsDwFvokCxWEjyahaCYW3kOQ+JLY2aFQETN/xi46ZwG+zMJWavqLB+0ZNccAsa1hMCirVl/q6y8kpuHiAfkp7KLucPa4dWOLq2azTwc/xag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EVq82bFL; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EVq82bFL;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGXLN2YlSz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 22:09:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1742209786;
	bh=zqbOzGR/S1NqZVeaOkKz/a3SBP5r2fF1Gtl6KlZ7yBc=;
	h=From:To:Cc:Subject:Date:From;
	b=EVq82bFLVWAwnFiYN0xCZZwDgOF0En0/B6KlIlF0AL70U0X3pAwg0xxKx62byv3ge
	 aMe1twjF8tvlPeanOl4hAHlpb1/ZelXSr6SlIfwTIhCwSrKJvfv0PlLnv9+PM23D6W
	 +Uq+vA1jF/DjtjhyJZAzsBy72YdW636f4Wu+2nmdrAATaKX5g8x/5ucNOYrYkXrOzx
	 ahnp4XaUQl4zwqgyghzPmR/X4I5Z6idikh8as2ab6ioTZQdagjMs2WRXT8X0+JFr1B
	 ipffAUWJh25DmOUXvjbNHhFnIW/gFii9V9Dh1tSZ2JxW9yQd1NA7yQ/ao+sJDeckIP
	 fwNVy8VQhP65w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGXLL2Y2Pz4x1t;
	Mon, 17 Mar 2025 22:09:46 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, maddy@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Please add powerpc topic/cxl branch to linux-next
Date: Mon, 17 Mar 2025 22:09:43 +1100
Message-ID: <87y0x3dibs.fsf@mpe.ellerman.id.au>
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

Hi sfr,

Could you please add the topic/cxl branch of the powerpc tree to
linux-next for the next few weeks, it's targeted for the next merge
window.

  https://web.git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/cxl

It contains a topic branch of sorts to hold the cxl removal. It has a
few commits from the SCSI tree, up to and including the cxlflash
removal, then it merges powerpc/fixes to get a Documentation/ patch that
touches cxl, and then the cxl removal patch from Andrew.

The plan will be to send it to Linus after the powerpc and SCSI trees
have been merged, during the merge window.

cheers

