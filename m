Return-Path: <linuxppc-dev+bounces-17868-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHIaH4OhrWkF5QEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17868-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 08 Mar 2026 17:19:15 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B50212310D7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 08 Mar 2026 17:19:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTQM14wCXz3c9D;
	Mon, 09 Mar 2026 03:19:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772986749;
	cv=none; b=g87BpA/eO6x2T/l/iPA3vWCCeuN09PRdRxxhJDjYX0tUKa++QWpiFLcqPpbhqSbwzwRHVjPrq1QgfwNxCauPlLNwn1bbg3g0DhcnUzX1UcCQUn71mvRlzHMTVToOUDGrOL/rK4+cKwxh9i2Mmxjqk5dKACCLl6y5QQURSGykHGrKuA14tVoLq93B7XrIDtn67UsT3BDl8KB7ySZ8d8Ihm+ZEcfS27hVCN5Gd0PfMDkHAaOzjOrZZgV2rL/LnS+qp1fp4Y1FKG9WLlgRQ4/1S/miO+8eeqU+9656cFzkFJ/87lrOKZFYxIOoqaZkEWlYdqw+wbdCJk2THt1dn+tggmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772986749; c=relaxed/relaxed;
	bh=/cKN/6iawKgnQRyKbEQ45nAUplK//qLG3DIQMuxFFfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nawxAEBCCFb/1y9saK7VPlXJ3kS2P+9o4nJqHHceiG+ecFsFcJlX3MMngA1ys3JQRSl9XJFwpJ7zNYsutrBnN+Rw2u0bz/Bj2Pkm98ZYd9GfHPQt7DFtcFDWgRVnj7mNqrK6ff9dBeyYjTf6BMqvIPRh09bVSlBVui0DENJDAj7UHcoQd635FjcDJ3X8EBG3rZs1PNSmUZLGoXj7brLVcpet9V2YwDVLuqbdL971PCIQEtKixQwQ5EJ7CWQh5xZTSs3gma6DMxOEr+7X3oOZTtoHZ8UuGU8+KMS+4eArnybiLr6HXL6yheaxyciw5fAJr/7zxZo083iLGCvR4FuJ+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=G4HbTHjQ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=G4HbTHjQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTQLz6H64z3bTf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 03:19:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B5D344017;
	Sun,  8 Mar 2026 16:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB29FC116C6;
	Sun,  8 Mar 2026 16:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772986744;
	bh=mhOJ6fEZ8X0Mwa2WasBbeUv/CXeY4qF0R4tBJHye2OQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G4HbTHjQVrcJJ6MmoKSjkmlkE5C9Z7PKNVAmY/+PF3RzjK8gO1CGzgM51yiggS00M
	 xsWMRZlNLTbgm84itqKuxe2ITlcTL5s/1XUwAVdw4OTAcPtci1Z98ZdvtgvGDs0WOg
	 VWfYd5u1SmxQfQAoiaqOSk9wnNZnu6P2M0Zvpn5I=
Date: Sun, 8 Mar 2026 17:19:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Srikar Dronamraju <srikar@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Kees Cook <kees@kernel.org>, Haren Myneni <haren@linux.ibm.com>,
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] powerpc: vas-api: constify dynamic struct class in
 coproc api register
Message-ID: <2026030846-wince-recess-c338@gregkh>
References: <20260308123917.1013607-1-jkoolstra@xs4all.nl>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308123917.1013607-1-jkoolstra@xs4all.nl>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: B50212310D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17868-lists,linuxppc-dev=lfdr.de];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jkoolstra@xs4all.nl,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:srikar@linux.ibm.com,m:sshegde@linux.ibm.com,m:kees@kernel.org,m:haren@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[xs4all.nl];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.667];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 01:39:12PM +0100, Jori Koolstra wrote:
> diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
> index 9f093176b8db..34403582c895 100644
> --- a/arch/powerpc/platforms/powernv/vas-window.c
> +++ b/arch/powerpc/platforms/powernv/vas-window.c
> @@ -1459,7 +1459,6 @@ static const struct vas_user_win_ops vops =  {
>  int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_type,
>  			     const char *name)
>  {
> -
>  	return vas_register_coproc_api(mod, cop_type, name, &vops);
>  }
>  EXPORT_SYMBOL_GPL(vas_register_api_powernv);
> 

This change wasn't needed here :(

thanks,

greg k-h

