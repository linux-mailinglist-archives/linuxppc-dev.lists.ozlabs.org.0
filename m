Return-Path: <linuxppc-dev+bounces-4965-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44300A08A56
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 09:35:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTw2m00rTz3cPb;
	Fri, 10 Jan 2025 19:35:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736498127;
	cv=none; b=JySx8ayaeb/bgBScwyPfC5HT3cTwb79+dBXm947Wa6j5S+pbz0Oqecsh0OnvYS+YGKqafS4fC9MDyqhNOSweBtLsqPtU88tUQJRJV1CP428juIlqf+Fx6wscMr3B6gpkztWUbYZNPXdehwbgquZtPB5Jf+/8nuSgecvN/4hXBBVi+3eGWWxF5mT09fFj0FVQ9FFpmmUBhNn37Pnvajj8brzN0DNRoU7NLRWjzZAgBsx72pjsfMFFtaWRcHoxFSjSPUVuMZZLwsGstkOkZsPslbDiBs1bTBfGbxC7EsrWMviM4xyx0RFAEFZS7PbqdJQWsrWB7/NQHgq6ed3XNPv8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736498127; c=relaxed/relaxed;
	bh=o8qrqXqwRa4BMpwojDAfoBiKZqvCyoJMAHOmYLdPAjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYURbl9rQuWwopMrg1sGfmjVLDOqlCQzUN9VrLZgmIzHA9nCLvG3qF+jnokFI3hHXLdLIW5gEeX6wUo2dk13ZqQbr+JSNyCvOhegQfatRU6p3AoO/hIJhGpM+CG9rKibUyT1fyHW522aGYiCTKQcG7dncYb4nT1fEsFTFH610tn4z6OmYua91AIgfLIKHwqYyF7uZQ7I37L29Fwjx8IqmFvDKZSxIt30EhGJu4nFYZge4vLTmuLEcUOZHY6/DgWMxzYr+DcRPPReZbKNCFecrqfbc0FIcSYtQhyxDIotvi4v3I3z1iNgtrhGqGQsIPHx6KPYnAUrRN7u8/PmULSAjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=llSkrF2J; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=llSkrF2J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTw2l03gFz3cPZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 19:35:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B97305C0713;
	Fri, 10 Jan 2025 08:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C2DC4CED6;
	Fri, 10 Jan 2025 08:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736498124;
	bh=UGivn+o7IAkyooc/nYpBc8QvM13HdTc5TSccpydQw0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=llSkrF2Jg8q4H0hudcAFMoi/gS94sAoRUqdq/ibwcWIgqAtA07lJlAXA/XtxHhKGP
	 /sHDpULfWxNTrH/R//Ytl+OCX9kKuEyuuHUrtNzEP6DGXfOlbVXgyEmIpwKM+uQeXA
	 T70bX3mo/kgUBN+n8ag4CcIpDFnXzAuOkD3a+AZo=
Date: Fri, 10 Jan 2025 09:35:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Cc: johannes.berg@intel.com, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: Kernel Warnings at fs/debugfs/file.c 90
Message-ID: <2025011012-duke-washbowl-805a@gregkh>
References: <a1cf98f7-c16b-472a-b56d-f745e94017ef@linux.vnet.ibm.com>
 <2025011024-yearning-prism-020f@gregkh>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025011024-yearning-prism-020f@gregkh>
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 09:34:52AM +0100, Greg KH wrote:
> On Fri, Jan 10, 2025 at 12:14:13PM +0530, Venkat Rao Bagalkote wrote:
> > Greetings!!!
> > 
> > 
> > Observing Kernel Warnings on kernel 6.13.0-rc6-next-20250109, while running
> > fstests ext4/001.
> 
> What is fstests doing in debugfs?
> 
> > Traces:
> > 
> > [  433.607975] ------------[ cut here ]------------
> > [  433.607984] WARNING: CPU: 2 PID: 32051 at fs/debugfs/file.c:90
> > __debugfs_file_get+0xcc/0x274
> 
> This is an assertion firing, Johannes, any ideas?

Oh nevermind, you already sent me a fix for this, thanks!

greg k-h

