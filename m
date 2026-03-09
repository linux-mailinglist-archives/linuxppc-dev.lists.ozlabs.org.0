Return-Path: <linuxppc-dev+bounces-17886-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EjICuSirmk9HAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17886-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 11:37:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F60B237375
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 11:37:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTtk62blfz3bnm;
	Mon, 09 Mar 2026 21:37:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.121.94.184
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773052638;
	cv=none; b=fIoMiov3b60NDiewEV9oUXAPX4uzUg2e2RfU80QhhMMd/tVcJeLxvtqHKeb7mt0VbqsmemP0L5e6WSekhhcfm+Sy6n9hrRDwfWNyZfsFuL66BR0d2AsKDZk75WJri5p3VtXDs+bA2vuoEc/tYSUfZU2EzrUHpti0zjhxI/XZXCwkwmga7U1qprJH+GSM+xxVdtht+Wx0N5mAaRoN63LNAGwzC1B4RSNV1DJVdYD5IWvFj8tdCDmCUYNE9t1avaM+sEPcmnQLWPzee6cfYlqpVDgCC6sSMxaJgqgsl+8x28O/hXi7jwQhUa3IfFrmR1qJUmL8DXRdu5AxtJ8gB4k8FA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773052638; c=relaxed/relaxed;
	bh=ckpEHAnulgmol8HBXr9yJMJtjL8J1gGJjXBTIEoqxfQ=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=CGdMWZcsBfwZdl0VhsDzfLJ8MqTfA6UAeJW/LDdCIT/l77zo+S0P/LrRx+MOdyvWeJ70+jfFwphZeOYLDVi4B5Yx36CN4uQiuWIrs3DNIEar0G3yBKPJYw/GVcTgUurvmqKPYdqfkatnGKslNVI6nkjTdoO6G88P1gzpavc5MSNsLpFPwVZL3SSZbOyXz0WbFem1vVr2iWIq5qfaRKLy5TdyThWg4Jfj/Qu2ZnDd6Q6kWmDQ0gf2bYL+jnwXfXnffzW3pItJqJ+taB0vi/kaiTo9OCkvgdf030hd6YWp9Uu5L7uciAUwnXnJOFK/oKlMcmF9q7BL05vhwq7DZPiANg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; dkim=pass (2048-bit key; secure) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=betPpnhE; dkim-atps=neutral; spf=pass (client-ip=195.121.94.184; helo=ewsoutbound.kpnmail.nl; envelope-from=jkoolstra@xs4all.nl; receiver=lists.ozlabs.org) smtp.mailfrom=xs4all.nl
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=betPpnhE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xs4all.nl (client-ip=195.121.94.184; helo=ewsoutbound.kpnmail.nl; envelope-from=jkoolstra@xs4all.nl; receiver=lists.ozlabs.org)
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTtk30bZGz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 21:37:12 +1100 (AEDT)
X-KPN-MessageId: b75f9fa6-1ba3-11f1-afd7-005056994fde
Received: from mta.kpnmail.nl (unknown [10.31.161.188])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id b75f9fa6-1ba3-11f1-afd7-005056994fde;
	Mon, 09 Mar 2026 11:35:39 +0100 (CET)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.189])
	by mta.kpnmail.nl (Halon) with ESMTP
	id b75e7f88-1ba3-11f1-80ea-00505699693e;
	Mon, 09 Mar 2026 11:35:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=ckpEHAnulgmol8HBXr9yJMJtjL8J1gGJjXBTIEoqxfQ=;
	b=betPpnhEzwQX/UPLP4miwpty+/3PT4ryhB2ClfVPG3UZKsUEuay54fkuOGJcm1400454Cs5eddqKG
	 1L6htMJrKI/FJqKK5y60X5/CKYTEbLx9uL6uN5YEKCPGwMtxqkjxSAZWHmH6kLI6w1c/4QRsZMOmFR
	 YMhXLwj28U2PPUpyjimufSi69bMopqB0rQaQpmaFN3H1o2qe/gI3axo+PzuRtIgMAddzOh/0reBX/9
	 oHqcJyydPnewQ+/ENRjAoiawag9StFDngyVXTUU3Bn+oQWBNmOb/9BOAMi2L9V5Mx4Jd6Q9wLnm8kI
	 f4fb5GZb0BdyPm3vCNadksDCmevx/Gw==
X-KPN-MID: 33|B/nqTAMxH8tNNBEQ2l6omfk+YWEqk+RsbTcGI6Ph9UEDsCGZc+wALV8EqdyMBZr
 eRo45Ll9OJa8nvoRIhPbRxC0FljnzLZm93X0Qou7OZ8w=
X-CMASSUN: 33|jD1L4Lvah775wR+nw4Jzauk4eyFG/bQZVUAqg3Mdj/OHmihexivhkwbBVVb8sT0
 p5TZbEJRjHnfAay5TrhoW+w==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh05 (cpxoxapps-mh05.personalcloud.so.kpn.org [10.128.135.211])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id b7535740-1ba3-11f1-94b1-00505699eff2;
	Mon, 09 Mar 2026 11:35:39 +0100 (CET)
Date: Mon, 9 Mar 2026 11:35:39 +0100 (CET)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Haren Myneni <haren@linux.ibm.com>,
	Srikar Dronamraju <srikar@linux.ibm.com>,
	Jonathan Greental <yonatan02greental@gmail.com>,
	Kees Cook <kees@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>,
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Message-ID: <1788533150.912368.1773052539444@kpc.webmail.kpnmail.nl>
In-Reply-To: <2026030924-penniless-hermit-ffc0@gregkh>
References: <20260308214634.1215051-1-jkoolstra@xs4all.nl>
 <2026030924-penniless-hermit-ffc0@gregkh>
Subject: Re: [PATCH v2] powerpc: vas-api: constify dynamic struct class in
 coproc api register
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Originating-IP: 178.229.142.230
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 2F60B237375
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[xs4all.nl,reject];
	R_DKIM_ALLOW(-0.20)[xs4all.nl:s=xs4all01];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-17886-lists,linuxppc-dev=lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,lists.ozlabs.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:haren@linux.ibm.com,m:srikar@linux.ibm.com,m:yonatan02greental@gmail.com,m:kees@kernel.org,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[jkoolstra@xs4all.nl,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[xs4all.nl];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	HAS_XOIP(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jkoolstra@xs4all.nl,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[xs4all.nl:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,xs4all.nl:dkim]
X-Rspamd-Action: no action


> Op 09-03-2026 07:01 CET schreef Greg KH <gregkh@linuxfoundation.org>:
> 
> > 
> > diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
> > index ea4ffa63f043..e377981fd533 100644
> > --- a/arch/powerpc/platforms/book3s/vas-api.c
> > +++ b/arch/powerpc/platforms/book3s/vas-api.c
> > @@ -45,7 +45,7 @@ static struct coproc_dev {
> >  	struct device *device;
> >  	char *name;
> >  	dev_t devt;
> > -	struct class *class;
> > +	const struct class *class;
> >  	enum vas_cop_type cop_type;
> >  	const struct vas_user_win_ops *vops;
> >  } coproc_device;
> > @@ -599,6 +599,21 @@ static struct file_operations coproc_fops = {
> >  	.unlocked_ioctl = coproc_ioctl,
> >  };
> >  
> > +static const struct class nx_gzip_class = {
> > +	.name		= "nx-gzip",
> > +	.devnode	= coproc_devnode
> > +};
> > +
> > +static const struct class* cop_to_class(enum vas_cop_type cop)
> > +{
> > +	switch (cop) {
> > +	case VAS_COP_TYPE_GZIP:		return &nx_gzip_class;
> > +	default:
> > +		pr_err("No device class defined for cop type %d\n", cop);
> > +		return NULL;
> > +	}
> > +}
> > +
> >  /*
> >   * Supporting only nx-gzip coprocessor type now, but this API code
> >   * extended to other coprocessor types later.
> > @@ -609,6 +624,10 @@ int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
> >  {
> >  	int rc = -EINVAL;
> >  	dev_t devno;
> > +	const struct class* class = cop_to_class(cop_type);
> > +
> > +	if (!class)
> > +		return rc;
> 
> How can this happen?
> 
> This feels odd, are different types of devices being registered here?  I
> don't see where VAS_COP_TYPE_GZIP was being tested in the original code,
> why add this additional logic?
> 

My line of thought is this:

There is a function vas_register_coproc_api() that does some kind of registering
for different coprocessor types. It has the following comment above:

/*
 * Supporting only nx-gzip coprocessor type now, but this API code
 * extended to other coprocessor types later.
 */

If you look at where this function is eventually triggered it is indeed only ever
passed VAS_COP_TYPE_GZIP. For instance, line 1238 of drivers/crypto/nx/nx-common-series.c
has the call

	ret = vas_register_api_pseries(THIS_MODULE, VAS_COP_TYPE_GZIP,
				       "nx-gzip");

(which immediately calls vas_register_coproc_api())

It also passes a hard-coded name for the device, and this name is also used as thedevice
class name. Now, this is

There is a function static char *cop_to_str(int cop) that strangely takes
an int instead of an enum vas_cop_type, and also misses an option I think.

> thanks,
> 
> greg k-h

