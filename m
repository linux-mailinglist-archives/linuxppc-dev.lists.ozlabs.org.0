Return-Path: <linuxppc-dev+bounces-14657-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBD5CA8BCF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 19:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNKRV32l4z2y7b;
	Sat, 06 Dec 2025 05:20:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764958806;
	cv=none; b=bLUl86IYTqW1VQMw9rIAVcQ6okE/Wg20ARsItm1Fj/Hb0HZfU5h/o6iuor2GJEhTbO7MPD1UyyafbLFxINUbGQGWVF/aJzqX5B2/WSbN5P++xHHW2GxZ1+DU7Q+r50C3ddMhBPDmJ88JYmEIOnLSjIfnUPbA/aa8g1Ce1Yr5AezG2M5mYpql1DtcmqYBLJ/0FbzuN38B/cE2+gzXUTM4DXPf2+pC1N6GOKc20zitdHUygCd0w4dybGaYxJXIrPO1MAriKWxZHFyqrWGqKF20STxJkoj+Lki+lOd/NFzDMH7pmSPkGd0tvXPQ2YABW+mLxS8YTGAAhZNir8YdTOiiKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764958806; c=relaxed/relaxed;
	bh=TB5O1IivxgT40PMCiat1nUPFv7ewjxHUnFbq0ckScDM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BhGpKrwkDdclPRtGiEkrGtUXh0Pt5y5U1ui5s0tdqUHkn2+d7wlOEs6AxR6wUsDptIsJbEB3Ncx1Fhe7F0w5CerxQVXuKYFo1NwF1EpqYRClxf+p0c9XBpJ7ouqNTIwHN4eNbwYgIbz9sW0W/H15BNxrYtMQq63LJS3xrbyDw2StVx5VklqfyU6BaVeE6Kx2/+QXONgR51AnXPxoIS5DQmPpobDxX78FDcJj8oYQleihSWPC2mOfYavGi/jng0WPB96R8KkwqHuURAQkYOhO2TCNVqhIstFTcb5bl2y6T0k3UtbPqyPsl2/PmowOGcYOqHsk0g5Zh7rA9zXKMdaybA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=IkWGNHpi; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=IkWGNHpi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNKRT1Pkzz2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 05:20:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72FBA60010;
	Fri,  5 Dec 2025 18:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E392C4CEF1;
	Fri,  5 Dec 2025 18:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1764958801;
	bh=uWu59OOnukX41sFdZObKv7Syg27XPL0QGtwNOMvGJSE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IkWGNHpiezZQcCDCyS+Jz9xPdN6j423fwolXLjv6Qzs/t5OXs4LjIdSkioy/9nAlE
	 3g8bFq8XAuinz65X0BHEHz7pVBa/y0ERbNIx2ACo9u6Hy8Priz1AeMs73MvNc2ygol
	 HqjASwbYLerygzx50pzCxEeP4KgUbI1x+Zvhpajk=
Date: Fri, 5 Dec 2025 10:19:59 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 surenb@google.com, mhocko@suse.com, masahiroy@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] Revert
 "mm: fix MAX_FOLIO_ORDER on powerpc configs with hugetlb"
Message-Id: <20251205101959.b9e89f4416e90d54646c2f63@linux-foundation.org>
In-Reply-To: <057ff845-6ab3-46a2-82df-067c25bef56e@kernel.org>
References: <20251204023358.54107-1-skhan@linuxfoundation.org>
	<20251204135746.6d291cc861b4507b1fe95aaa@linux-foundation.org>
	<aTKDRF2sMdM_5aRB@kernel.org>
	<dc22e2e2-a62b-4b9f-9fb0-f3a42a57b00f@kernel.org>
	<057ff845-6ab3-46a2-82df-067c25bef56e@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 5 Dec 2025 08:41:07 +0100 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:

> > Thinking about reverting arbitrary commits after Shuah clearly tested 
> > something wrong is completely unreasonable.
> > 
> 
> That irrelevant revert has already been applied on mm-hotfixes-unstable, 
> see https://lore.kernel.org/all/20251204215938.750D3C4CEFB@smtp.kernel.org/
> 
> Andrew, could you please drop it ?

I already disabled it - it never made it into linux-next.

