Return-Path: <linuxppc-dev+bounces-16548-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGIIB/nsgWkFMAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16548-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 13:41:29 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B53D9226
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 13:41:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f53503lrGz30T8;
	Tue, 03 Feb 2026 23:41:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770122484;
	cv=none; b=lR2ORBIIVd5L0E6xUApoFLRMvFYnUKXO/fw9s+Z6x2ZTI0f5VpMDIzeH9VAhGG6i3vjNp64DUJD3OstLuA8KXVWxsyipGr+Wji7EE03ic81D/MKi8uYrYvVN6vPJ0PCmewfACD8bPNEqV0F0D/b8gyHK46BY4+TMfwujCyxhxYOA9Vcz9yqUU79ktrhSM0F80ltoKzJq2ZMc4vQWM5Hip0ATO/8Fj8VGdBk2eMUTjKtYC3+qu6ylrKnNeZRv1+6bY+C6OnRcg2JC1tmuCf7z8u2PfImDWz9GejxtdYo8IEQuxU1wvQAOF9ghvM4JfbVRHSqhN71T9gJZRLDMVQ3yKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770122484; c=relaxed/relaxed;
	bh=v6GtJdM3kRFSAX33r1Im8CwgeGgdPrlgBD73qxe6vkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TL4IlaOrVDAu9a83v+SMEUWt4m3WMEvsce0WikinBPo4rcY73ZtLGkZE9oosc8R+OmRxx54gCMOur75uOFpFEHyui6//p/0ioaIj8bNGiOREntvFzWw20fQXt5FQMogOQlO6kZD4+iVzwf7BzQw9M9fE3V9LC0SacEFgypburnYWVSUQlsb5jMRJPqfI7ozWnQEhxUE2Y8WVnLlQEeS5sEy5r0EnaY8kFDzPcor1M7buXS/fgU0E6yrhihVhRNziR3MGP7pqmSANflgvkswCmynxKk8WXLukPlJIZXUsy0LlMxVStLxgW8/BeNCIQMgNUI3XKBlAVB72o78V4Y8loQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=CkgRgfaM; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=CkgRgfaM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 159537 seconds by postgrey-1.37 at boromir; Tue, 03 Feb 2026 23:41:22 AEDT
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f534y50FTz309S
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 23:41:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1770122475;
	bh=27oXttc/YCfqQLF6/9YmAKAGfCgRZ7XRUWdootutwwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CkgRgfaM7qWLKghTEIx+MJoJL1TSz/puDFT4aA0A47zHSz7qBO38AmiuXDIbwnO+9
	 jTsm6rRQlV+UI6ps6KvSgRNlGU11st7vBubPuf2xiTrBSvQnmeeWfcacfFSVUoIDIM
	 58ywalIbcSvDlTUECIKiDn7Rl75oBHolY69QDVA4=
Date: Tue, 3 Feb 2026 13:41:14 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Daniel Gomez <da.gomez@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>, Xiu Jianfeng <xiujianfeng@huawei.com>, 
	Fabian =?utf-8?Q?Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, Arnout Engelen <arnout@bzzt.net>, 
	Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>, 
	Christian Heusel <christian@heusel.eu>, =?utf-8?B?Q8OianU=?= Mihai-Drosi <mcaju95@gmail.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 08/17] module: Deduplicate signature extraction
Message-ID: <df277beb-3bc2-4941-941e-adb294d34394@t-8ch.de>
References: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
 <20260113-module-hashes-v4-8-0b932db9b56b@weissschuh.net>
 <52cbbccf-d5b6-4a33-b16a-4a09fe5e64d3@suse.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52cbbccf-d5b6-4a33-b16a-4a09fe5e64d3@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16548-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[linux@weissschuh.net,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,google.com,samsung.com,paul-moore.com,namei.org,hallyn.com,lwn.net,linux.ibm.com,ellerman.id.au,gmail.com,huawei.com,oracle.com,linux.dev,atomlin.com,oss.cyber.gouv.fr,proxmox.com,bzzt.net,mapreri.org,archlinux.org,heusel.eu,linutronix.de,vger.kernel.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORGED_RECIPIENTS(0.00)[m:petr.pavlu@suse.com,m:nathan@kernel.org,m:arnd@arndb.de,m:mcgrof@kernel.org,m:samitolvanen@google.com,m:da.gomez@samsung.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:naveen@kernel.org,m:zohar@linux.ibm.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:nicolas.schier@linux.dev,m:da.gomez@kernel.org,m:atomlin@atomlin.com,m:chleroy@kernel.org,m:nsc@kernel.org,m:nicolas.bouchinet@oss.cyber.gouv.fr,m:xiujianfeng@huawei.com,m:f.gruenbichler@proxmox.com,m:arnout@bzzt.net,m:mattia@mapreri.org,m:kpcyrd@archlinux.org,m:christian@heusel.eu,m:mcaju95@gmail.com,m:bigeasy@linutronix.de,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-integrity@vger.kernel
 .org,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[t-8ch.de:mid]
X-Rspamd-Queue-Id: 44B53D9226
X-Rspamd-Action: no action

On 2026-01-27 16:20:15+0100, Petr Pavlu wrote:
> On 1/13/26 1:28 PM, Thomas Weißschuh wrote:

(...)

> >  int module_sig_check(struct load_info *info, int flags)
> >  {
> > -	int err = -ENODATA;
> > -	const unsigned long markerlen = sizeof(MODULE_SIG_STRING) - 1;
> > +	int err;
> >  	const char *reason;
> >  	const void *mod = info->hdr;
> > +	size_t sig_len;
> > +	const u8 *sig;
> >  	bool mangled_module = flags & (MODULE_INIT_IGNORE_MODVERSIONS |
> >  				       MODULE_INIT_IGNORE_VERMAGIC);
> > -	/*
> > -	 * Do not allow mangled modules as a module with version information
> > -	 * removed is no longer the module that was signed.
> > -	 */
> > -	if (!mangled_module &&
> > -	    info->len > markerlen &&
> > -	    memcmp(mod + info->len - markerlen, MODULE_SIG_STRING, markerlen) == 0) {
> > -		/* We truncate the module to discard the signature */
> > -		info->len -= markerlen;
> > -		err = mod_verify_sig(mod, info);
> > +
> > +	err = mod_split_sig(info->hdr, &info->len, mangled_module, &sig_len, &sig, "module");
> > +	if (!err) {
> > +		err = verify_pkcs7_signature(mod, info->len, sig, sig_len,
> > +					     VERIFY_USE_SECONDARY_KEYRING,
> > +					     VERIFYING_MODULE_SIGNATURE,
> > +					     NULL, NULL);
> >  		if (!err) {
> >  			info->sig_ok = true;
> >  			return 0;
> 
> The patch looks to modify the behavior when mangled_module is true.
> 
> Previously, module_sig_check() didn't attempt to extract the signature
> in such a case and treated the module as unsigned. The err remained set
> to -ENODATA and the function subsequently consulted module_sig_check()
> and security_locked_down() to determine an appropriate result.
> 
> Newly, module_sig_check() calls mod_split_sig(), which skips the
> extraction of the marker ("~Module signature appended~\n") from the end
> of the module and instead attempts to read it as an actual
> module_signature. The value is then passed to mod_check_sig() which
> should return -EBADMSG. The error is propagated to module_sig_check()
> and treated as fatal, without consulting module_sig_check() and
> security_locked_down().
> 
> I think the mangled_module flag should not be passed to mod_split_sig()
> and it should be handled solely by module_sig_check().

Ack.

(...)

> > diff --git a/security/integrity/ima/ima_modsig.c b/security/integrity/ima/ima_modsig.c
> > index 3265d744d5ce..a57342d39b07 100644
> > --- a/security/integrity/ima/ima_modsig.c
> > +++ b/security/integrity/ima/ima_modsig.c
> > @@ -40,44 +40,30 @@ struct modsig {
> >  int ima_read_modsig(enum ima_hooks func, const void *buf, loff_t buf_len,
> >  		    struct modsig **modsig)
> >  {
> > -	const size_t marker_len = strlen(MODULE_SIG_STRING);
> > -	const struct module_signature *sig;
> > +	size_t buf_len_sz = buf_len;
> >  	struct modsig *hdr;
> >  	size_t sig_len;
> > -	const void *p;
> > +	const u8 *sig;
> >  	int rc;
> >  
> > -	if (buf_len <= marker_len + sizeof(*sig))
> > -		return -ENOENT;
> > -
> > -	p = buf + buf_len - marker_len;
> > -	if (memcmp(p, MODULE_SIG_STRING, marker_len))
> > -		return -ENOENT;
> > -
> > -	buf_len -= marker_len;
> > -	sig = (const struct module_signature *)(p - sizeof(*sig));
> > -
> > -	rc = mod_check_sig(sig, buf_len, func_tokens[func]);
> > +	rc = mod_split_sig(buf, &buf_len_sz, true, &sig_len, &sig, func_tokens[func]);
> 
> Passing mangled=true to mod_split_sig() seems incorrect here. It causes
> that the function doesn't properly extract the signature marker at the
> end of the module, no?

Indeed, thanks.
 
I am thinking about dropping this patch from the series for now.
It was meant for IMA modsig compatibility, which is not part of the
series anymore.

> >  	if (rc)
> >  		return rc;
> >  
> > -	sig_len = be32_to_cpu(sig->sig_len);
> > -	buf_len -= sig_len + sizeof(*sig);
> > -
> >  	/* Allocate sig_len additional bytes to hold the raw PKCS#7 data. */
> >  	hdr = kzalloc(struct_size(hdr, raw_pkcs7, sig_len), GFP_KERNEL);
> >  	if (!hdr)
> >  		return -ENOMEM;
> >  
> >  	hdr->raw_pkcs7_len = sig_len;
> > -	hdr->pkcs7_msg = pkcs7_parse_message(buf + buf_len, sig_len);
> > +	hdr->pkcs7_msg = pkcs7_parse_message(sig, sig_len);
> >  	if (IS_ERR(hdr->pkcs7_msg)) {
> >  		rc = PTR_ERR(hdr->pkcs7_msg);
> >  		kfree(hdr);
> >  		return rc;
> >  	}
> >  
> > -	memcpy(hdr->raw_pkcs7, buf + buf_len, sig_len);
> > +	memcpy(hdr->raw_pkcs7, sig, sig_len);
> >  
> >  	/* We don't know the hash algorithm yet. */
> >  	hdr->hash_algo = HASH_ALGO__LAST;
> > 

