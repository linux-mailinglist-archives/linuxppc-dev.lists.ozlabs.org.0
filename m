Return-Path: <linuxppc-dev+bounces-3759-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C729E9E2E5B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 22:45:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2vNC4tBgz2yFP;
	Wed,  4 Dec 2024 08:45:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733262347;
	cv=none; b=PR48E5nOXDMKPApES79dkwHv/tUDnfJ//v5p6kgJpPon+neSXFKQ8SVr+6Vz2T3vRkAVL8Sbv4yaRFjkdpkOhNaf/OizqaSXlMwV+YiOs/xVOHLK4CnPkTeaynNZRufcSaYEyfcRIYu2vfimSlVbiWYbjerYRlOb//anUz92JsW5vK29BRUrNm5CnoBY2NbNAazVXX9pkFfX+LlotZ8AUMAhuN/UstwLwtoSNrEMsurQ2ft+hDx8ARk9bhnFs1KbMbUEhpPs6xbnreWpP2UzIfyWoPx6sYoL570SwCGqEhx2SduNRpIYv40AOfMYAQLhagHK2OCnt1yGuC34Q8VQbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733262347; c=relaxed/relaxed;
	bh=qs8g8TfVrzMP3nfe0JT9vEzBGBKRI0HwFLAlhcTSKWg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+lx5z3D1pKCD6oL/qonE0MwTqH7hx/OtV6NLh3Ay35Jk4wXFhB05a+Ijyq6Blt46zyZTeGShQ+rgD4ikQdyZ4yA1zsHDnuCQ4lANDh0qf7kOkgOV2Hm0lyLurhIr1qtH0plmE6T8CM4SYDSS50onWKU8pO3raIHSbJBwVdNwN+1taLVfhDnwKR9vAKjEsM9UlLoy7rD/sVvt8lie7fx9B/z7q8Mw1IyuupkYDAl+V/HL3fVhxe6BcH0wTPQraYIx8bSprMTqHJJnLAdszxrv59hlXBGi1GFWNKX2oirI3mf5Poh42D0X8zR9/Dwf0MMTX79dOCU6xImNzck0cxj0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=No2NWryl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=No2NWryl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2vNB0n1Tz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 08:45:46 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7251331e756so5792561b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2024 13:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733262343; x=1733867143; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qs8g8TfVrzMP3nfe0JT9vEzBGBKRI0HwFLAlhcTSKWg=;
        b=No2NWrylexIf4PG13NDKGcHTRYuKyY+1uo4PVHpTrU9Ra2DtZCWwF+MWqeTMB6/cp1
         nAjxUlZqop17Ros2K3BY2pqeS4LiYIx+TorLtR3eeQthHJ3Id8xgMnUIMdoHhSbEughp
         X+KdFf7kPFlQFHVtnhGf4OHqNV4KWK/J2xQh7Hgk56t5KAWEOvoq51pkMJ5/+lmV1ypD
         rzsomE2Vg6LVCJN9wuPfDBbvIuHssu6jJSJE7yLepFkhOZMYvmGBS36OagTxUeldSjht
         +Q5ZdUANUs7hQRFtT3GH3l8ueDzK/po5HyyVogefjlDlK+UfHKzb+L0mcMw7HrOnzB1b
         JE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733262343; x=1733867143;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qs8g8TfVrzMP3nfe0JT9vEzBGBKRI0HwFLAlhcTSKWg=;
        b=Bdyy0abWRNNo2AU+gjjpEIv+9ZVpIBigbI82CfK5tJBA4M6pTn0u/2OicMfGnIyQxA
         xjzvTNBimhWHN1PSbNQjuz1i+yBYO1t7L08NyKJFpwjzyUnRqj7svWv6fu1+hYyzNw+r
         zS34EYnQrsuvcqKjE2GwptrJZ/cMag6UCcu140JVD1zshEfQojeb2Lyjngqgr0CfxgwR
         DpLDt3L4dHPvjstI2Zs/VTjjYA1GHkK1Aw8CUwUu31Fssyybsw9jUv+HwEDT5wPw7j76
         PXDBKdi2zamnEHVBF8FE3tyYnWDJc9Q9fSdWK2uIT1iRcI3LPT0qYWWid5MZiwmrFJ4M
         5bmA==
X-Forwarded-Encrypted: i=1; AJvYcCWwYzZx89Qh3IfevE45N4SXYAO5g3PBN2/X5oBFUAh9vj7U9AuIw26oDmiEIl1dTLR7JUjCXiBWj3/vFBQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwquRdy9jTe6QuQ6HvSgwB2CGRzuXyVfc+7ActJQfVqHeLsuGHQ
	xsSuBA3CCJDjV05BhjWoM7V57DGgkCdJpkO3qTYnP1CDyTAoqBRy
X-Gm-Gg: ASbGncvP1ltmvCkI4FvNQD4V2CPsgyUCGI8AyZyKtGadCi12cD6kiuJWOeGX3gAfn8p
	DKTbvfwURVtdLlzmIQqpNJjT0hC5IevO3UQvVuIFQFuuu3bpcyYA72fYliJx+rW+7ksKHwq15D/
	lyOO7RKK+/ysWl34d58kpA6Tnuc+0/VzizaxvgZr6CKcPGR0QmNbIDtsZ7bdhdcD9PrpM+c/wFw
	cYIG00dFuJ7mDtUp3j5JNEjIpfO7G+Jg4rREaPfTDdLes0hkEQDG5toVdt2fM2//Yt1Z8cnLCk7
	bzLf4h7xXEb9xaWzM5Q=
X-Google-Smtp-Source: AGHT+IFH94IguKLdgVw+VaVbk0Dgd3wlsWzR0YzD34u1W6McikqACVjvflyQTMBVfkngrgHBYaF02w==
X-Received: by 2002:a17:902:db0a:b0:212:51dc:3d51 with SMTP id d9443c01a7336-215bd200db3mr39103915ad.27.1733262343149;
        Tue, 03 Dec 2024 13:45:43 -0800 (PST)
Received: from DESKTOP-DUKSS9G. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215bd2fd69dsm17513345ad.189.2024.12.03.13.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 13:45:42 -0800 (PST)
Message-ID: <674f7c06.170a0220.348678.b687@mx.google.com>
X-Google-Original-Message-ID: <Z098BOv87dnqnHHC@DESKTOP-DUKSS9G.>
Date: Tue, 3 Dec 2024 13:45:40 -0800
From: Vishal Moola <vishal.moola@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH RESEND v2 3/6] mm/page_alloc: make
 __alloc_contig_migrate_range() static
References: <20241203094732.200195-1-david@redhat.com>
 <20241203094732.200195-4-david@redhat.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203094732.200195-4-david@redhat.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Dec 03, 2024 at 10:47:29AM +0100, David Hildenbrand wrote:
> The single user is in page_alloc.c.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

