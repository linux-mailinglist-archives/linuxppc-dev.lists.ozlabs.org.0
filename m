Return-Path: <linuxppc-dev+bounces-17888-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +L62I/qlrmkFHQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17888-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 11:50:34 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A64FD2375DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 11:50:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTv1M05dGz3bnm;
	Mon, 09 Mar 2026 21:50:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.121.94.186
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773053430;
	cv=none; b=fGrQcvyNRUj6BRTms8nU3cyoNo2+smZMB6CXcuIovOr/bH06UzcW9w8kSO9XG4M7x6TsCNNi5tGHbkmK18UobZN9bv2qiV1ous/NzKjnID9Xuqo+FLYTnb7KYL+xQbIdyJb+HdRY8q9G9+YO+s+9ILjN9Vb46iwb6I15Q/+moHu7MJQhrS+3bnCibfsODU/osmYvzwqtlFuUk0dw2+SVhMsCpDEjq3M+Qvl0GOMjOAfpeDShBbJaNzW/MDzlngj7b6naISHiZI0sPJwTYYaT7H0CpORNqAJHMLhlLuDYU0QjHm+PXA53+SaAE5unPQoGW8KN+5jVvvw0n9/r4oVDNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773053430; c=relaxed/relaxed;
	bh=4/dgxrnTnrLEGt/A2Bs8Fwqo/mGr5lGhtCb9SX8UaB4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=hn/1NB1DijrHqAi268EGSSLtbFlOz/QqO0ninXuMV+52loWGoYbOh6SLQJvJTlqIYgaumlF9eshiAtK5Wbldw7098yh2S1NvC7PPuQUzpJm2cWuEfZmRc1wfcO91KV1MfE6biGJQhhrzEA42Wy9/Revvkux/Bkv4lfRCeK25NnHZ6T7krdeCJcoCIGLqrGzm8Ok9jjNCoPllAmAPClrqbu9BRHwt08+p8fzzUrh/UeLlBbhutCNeGTcXFYUEo14A4WKuLWX8G+PCSjsJfqjZi1bYj9xNDxQzETW0yTNTWbsCxXm2fD2ycTC1Jar/gIwEYOTZtv5rsth697P90ezCvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; dkim=pass (2048-bit key; secure) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=jWftS7VA; dkim-atps=neutral; spf=pass (client-ip=195.121.94.186; helo=ewsoutbound.kpnmail.nl; envelope-from=jkoolstra@xs4all.nl; receiver=lists.ozlabs.org) smtp.mailfrom=xs4all.nl
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=jWftS7VA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xs4all.nl (client-ip=195.121.94.186; helo=ewsoutbound.kpnmail.nl; envelope-from=jkoolstra@xs4all.nl; receiver=lists.ozlabs.org)
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTv1L0mbWz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 21:50:29 +1100 (AEDT)
X-KPN-MessageId: 92ef4384-1ba5-11f1-89dd-00505699b430
Received: from mta.kpnmail.nl (unknown [10.31.161.189])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 92ef4384-1ba5-11f1-89dd-00505699b430;
	Mon, 09 Mar 2026 11:48:57 +0100 (CET)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.189])
	by mta.kpnmail.nl (Halon) with ESMTP
	id 92f485ec-1ba5-11f1-b5cf-0050569981f5;
	Mon, 09 Mar 2026 11:48:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=4/dgxrnTnrLEGt/A2Bs8Fwqo/mGr5lGhtCb9SX8UaB4=;
	b=jWftS7VAN30uh6c3HLw6EGa5IffCTMHmjGlnfZDNe+AoOxMHDqBC9pLYkigx/VI7IjMYOSARvmaQe
	 YP+iIPIDahRlTkh5BTTDn8V/7m/m0qqFNAEdIUiShhgkWPjQVIef8jASDrA+MDLlCZFJbtkTktYfsU
	 HzT7gKzUtchRf+h6YO/6CgFl2tO8/SIiFXgKteZrXwwzEHoo4ObF3Ekk3vnEMDXZzyJXwIllnonHGF
	 /3X6w+5sL69BMUTplT+rilPjuYK/KJ5ZcLsY5aLOhVwZ7BryQKBWnl2zeMZyOVTPJtOFn8Y7ZEqi8U
	 LnyPwADxuPYtCs40JRBKLcizcTtdntw==
X-KPN-MID: 33|tTvuX4lcQB8xRIuE0s7zVJyvXWzLbExFJPJqgnNDYk5zyuFOXZHzVNh2NCpweOm
 vANmYeSIwt0O2S470ktrvs9RUtEUDuqnvmaQf5Xt2PUI=
X-CMASSUN: 33|SeNBNwBLs7kS57k/i3P1QJF6J4PZyqX4IEJ6kmTMpK2C0YyCg0UJDjW7i8qIiYr
 CEI0Yqto6ilW7gK3ajKbD5w==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh05 (cpxoxapps-mh05.personalcloud.so.kpn.org [10.128.135.211])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id 92dde228-1ba5-11f1-94b1-00505699eff2;
	Mon, 09 Mar 2026 11:48:57 +0100 (CET)
Date: Mon, 9 Mar 2026 11:48:57 +0100 (CET)
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
Message-ID: <1304966204.915283.1773053337271@kpc.webmail.kpnmail.nl>
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
X-Rspamd-Queue-Id: A64FD2375DA
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
	TAGGED_FROM(0.00)[bounces-17888-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,linuxfoundation.org:email,xs4all.nl:dkim,kpc.webmail.kpnmail.nl:mid]
X-Rspamd-Action: no action

My bad, the earlier email went out to soon.

> Op 09-03-2026 07:01 CET schreef Greg KH <gregkh@linuxfoundation.org>:
> >  arch/powerpc/platforms/book3s/vas-api.c | 34 +++++++++++++++++++------
> >  1 file changed, 26 insertions(+), 8 deletions(-)
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

It also passes a hard-coded name for the device ("nx-gzip"), and this name is also
used as the device class name. Now, this is a problem if we want to get rid of
class_create(). Somehow "nx-gzip" needs to get linked to the appropriate const struct
class. I figured it is better to use the cop_type, and a cop_to_class() function to
set this link. However, since the other co-processor types are not implemented (yet)
it would seem silly to already assign struct classes for these, hence the NULL return.
It is meant to signal: not implemented. Then again, if ever a new co-processor was added
you must update the cop_to_class()... but at least this is my line of thought.

There is also a function static char *cop_to_str(int cop) that strangely takes
an int instead of an enum vas_cop_type, and also misses an option I think.


> thanks,
> 
> greg k-h

Thanks,
Jori.

