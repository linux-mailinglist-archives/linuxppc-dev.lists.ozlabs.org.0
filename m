Return-Path: <linuxppc-dev+bounces-17879-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNgYKDhirmlbCwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17879-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 07:01:28 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7D82340F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 07:01:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTmbl3tgHz3c9M;
	Mon, 09 Mar 2026 17:01:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773036083;
	cv=none; b=GsdEF3g7TlKaXeGAnTRR8t1t0cxQaAVK3jtgn4/LtzrlsZeIwgTKGwX+vAKiC8MZVumNNeeEBSsZqvNiGvFM6uWMjHTW3ngOmgHNoneftj8DCdvN1X1p62V0fxrFId1me0btTKWqefINNdDBcyE1jR57PggKkySp2q+Gwu2TS4SUKcnpYQUrVshag6Qaz4Ar5oPUk3e/L0Zrlb7qvG4RHbUR4Kvk6IUWM2hbP/AXDg1Bgj2MTgI5+BPYcX/ssqd3aV35ySzR1Hn76yEcPWNhGcAAA28c0284qfWsyLjLCMSMqZ50FfRov7F1OIDItxbmbjpcNHSylDdXVTEN86lEbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773036083; c=relaxed/relaxed;
	bh=aCjqZ83PN27u1yW2cYM4O41Gwgt4NwEqHKj8GqUj1YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBr5NnyJbWKa4yqqXIFlKIGguttbZIgY1YTK+gChhKtgHsQeZB37NP2ujMln1chRbCqFzc/GMQEgqxYKSPxp07whw1nYb2TQc7lQVJRbIVLLe8h1PJbTijigY1+DAtylMoy50Oc+9cCb605SQ55bREyM1wZEX5ixjvjlmY23JqCC2lbU1P7U2KI4Q4NbMraZ+HmQzNbC5A3bUPh4xl5kgVS4ogPY8rACKFEug6WPlWDC/ujfcV3YeXUF3PwYpps0mJdu2rYes5mrML83O5qwtPNtIAy2VyPfX7QuABi0SkG4C9wkGuimf7SL/MlgPLTOon4ZIwy928ul5qdcnSvSLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=15RTuOMn; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=15RTuOMn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTmbj5mcbz2xdL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 17:01:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB6F540350;
	Mon,  9 Mar 2026 06:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 063A3C4CEF7;
	Mon,  9 Mar 2026 06:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773036078;
	bh=gVxcvHJNBraLn9M5BiTJWU/1HdTbvq+6QHUIrPxzgXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=15RTuOMn5e9UtCmYbatnqrEpDrmYSoEuuiG6YS2iMtIHowfu0e7HEWq/oFZRIWHSS
	 +SfPyuwociimJ283zgBd62ohu7PhxSeh3A28z4Eoa8aEnC26cyvVMtYCO3JafeiPPV
	 YEFL3ecS5neM52NaHKjfqf+PyF5Kt6S5Dn2CuLYg=
Date: Mon, 9 Mar 2026 07:01:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Haren Myneni <haren@linux.ibm.com>,
	Srikar Dronamraju <srikar@linux.ibm.com>,
	Jonathan Greental <yonatan02greental@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] powerpc: vas-api: constify dynamic struct class in
 coproc api register
Message-ID: <2026030924-penniless-hermit-ffc0@gregkh>
References: <20260308214634.1215051-1-jkoolstra@xs4all.nl>
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
In-Reply-To: <20260308214634.1215051-1-jkoolstra@xs4all.nl>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 1A7D82340F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[xs4all.nl];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jkoolstra@xs4all.nl,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:haren@linux.ibm.com,m:srikar@linux.ibm.com,m:yonatan02greental@gmail.com,m:kees@kernel.org,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17879-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.710];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:email]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 10:46:31PM +0100, Jori Koolstra wrote:
> The class_create() call has been deprecated in favor of class_register()
> as the driver core now allows for a struct class to be in read-only
> memory.
> 
> In vas_register_coproc_api() the dynamic allocation of the struct class
> corresonding to the coprocessor type (right now only nx-gzip) is
> replaced by calling
> 
> 	static const struct class* cop_to_class(enum vas_cop_type cop)
> 
> which links the coprocessor type to the appropriate static const struct
> class.
> 
> Compile tested only.
> 
> Link: https://lore.kernel.org/all/2023040244-duffel-pushpin-f738@gregkh/
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Jori Koolstra <jkoolstra@xs4all.nl>
> ---
> v2: undo whitespace removal
> 
>  arch/powerpc/platforms/book3s/vas-api.c | 34 +++++++++++++++++++------
>  1 file changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
> index ea4ffa63f043..e377981fd533 100644
> --- a/arch/powerpc/platforms/book3s/vas-api.c
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -45,7 +45,7 @@ static struct coproc_dev {
>  	struct device *device;
>  	char *name;
>  	dev_t devt;
> -	struct class *class;
> +	const struct class *class;
>  	enum vas_cop_type cop_type;
>  	const struct vas_user_win_ops *vops;
>  } coproc_device;
> @@ -599,6 +599,21 @@ static struct file_operations coproc_fops = {
>  	.unlocked_ioctl = coproc_ioctl,
>  };
>  
> +static const struct class nx_gzip_class = {
> +	.name		= "nx-gzip",
> +	.devnode	= coproc_devnode
> +};
> +
> +static const struct class* cop_to_class(enum vas_cop_type cop)
> +{
> +	switch (cop) {
> +	case VAS_COP_TYPE_GZIP:		return &nx_gzip_class;
> +	default:
> +		pr_err("No device class defined for cop type %d\n", cop);
> +		return NULL;
> +	}
> +}
> +
>  /*
>   * Supporting only nx-gzip coprocessor type now, but this API code
>   * extended to other coprocessor types later.
> @@ -609,6 +624,10 @@ int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
>  {
>  	int rc = -EINVAL;
>  	dev_t devno;
> +	const struct class* class = cop_to_class(cop_type);
> +
> +	if (!class)
> +		return rc;

How can this happen?

This feels odd, are different types of devices being registered here?  I
don't see where VAS_COP_TYPE_GZIP was being tested in the original code,
why add this additional logic?

thanks,

greg k-h

