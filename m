Return-Path: <linuxppc-dev+bounces-16552-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC7THB/xgWnkMwMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16552-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 13:59:11 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C141D9815
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Feb 2026 13:59:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f53TR2dVMz30T8;
	Tue, 03 Feb 2026 23:59:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770123547;
	cv=none; b=RhuavIeJyCVhJ+nbeXuuZDC2ZXSW6zhCdaqSQDY6sdWwLXN16r5pFAWNUd0Sk/g+dE5+vJrABLdMr+q9V79GKQ0rXqy11HPwkM4GgbEKo61q72eSpe1V3KpWdEUNZDyMGD1VIRg6m0h/rntIfFxfTPux2wmBcxHA3neBhY3/aKgR9TxUh+PCnGXmwPSB2h6CdmUXn6yjAxgJg+m8Jrhprk6Zxt1lGJv/mPYPwxfowyUisr5mscxP+qE2HQ1ZU4YxWxD2Gd/IxH8X0cfU3MWQkuxUtIzuuOGjTOpFkYDkWe7HkQzHuSnEkWHnY6/wkiXd1Xf0rm6T80Z5HR2eVCrjPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770123547; c=relaxed/relaxed;
	bh=f7WbDf6ppBGZw1zGUTqtisKIQ3OECv7udSRxwXjOPuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nuk501/8NLLwcqzbpjHFP0K/whetOIZt/5fjr2RHLVaMvVwcBq8g3mXYeTVrhEyTW7/kaPFkHnBhiAFkyHtnl3HHHShPV+sXRdVopyCTILvAUBS/r2vVMYI//3buibp3P8/F5MjDLMgJZpbgGiUc5nkbY/8ZMr3CbIhEgCSLmAMy0Dk1jDPR2F1bi/XB1O5d9QcAiSvU6gOv1E+nRz4I7oyE8WJHs69vhXGGnnzpKTvarbO2/SGbhdTaM8ELXzOECKXU4jYEq6PvnmFRk5GaCH2iOL+6sGr/CLS4AIZdTGHOtYVtWkFitDNsyZroOVL77ckRJK/9d5nU/8K2J0yiqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=SPdtsnUd; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=SPdtsnUd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f53TQ2bJPz309S
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 23:59:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1770123542;
	bh=6LS/kA+onmwNe8A7Ynby1iar5OwBoPJ8XKnL5twRNZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SPdtsnUdSSGeLAvpGs66Yc7fwhPORRh9r7ctAvysXw3f//3u70CJ0gLtNJWuXJQC9
	 7MAnhu/JI34H1H6OHyalZvy4k5hxQXNQ1m/yLoFxdGWEao2ummshchk8d8wnhmjVOu
	 e+aM1OBp2myV2ypeuFFm6aPHmRqcdO/MCSevgV0o=
Date: Tue, 3 Feb 2026 13:59:02 +0100
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
Subject: Re: [PATCH v4 15/17] module: Introduce hash-based integrity checking
Message-ID: <633ddd60-edbf-4072-932e-2d67d2173edd@t-8ch.de>
References: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
 <20260113-module-hashes-v4-15-0b932db9b56b@weissschuh.net>
 <fab2af64-e396-45f9-8876-feff4002e04b@suse.com>
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
In-Reply-To: <fab2af64-e396-45f9-8876-feff4002e04b@suse.com>
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
	TAGGED_FROM(0.00)[bounces-16552-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:dkim,t-8ch.de:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 0C141D9815
X-Rspamd-Action: no action

On 2026-02-03 13:19:20+0100, Petr Pavlu wrote:
> On 1/13/26 1:28 PM, Thomas Weißschuh wrote:
> > The current signature-based module integrity checking has some drawbacks
> > in combination with reproducible builds. Either the module signing key
> > is generated at build time, which makes the build unreproducible, or a
> > static signing key is used, which precludes rebuilds by third parties
> > and makes the whole build and packaging process much more complicated.
> > 
> > The goal is to reach bit-for-bit reproducibility. Excluding certain
> > parts of the build output from the reproducibility analysis would be
> > error-prone and force each downstream consumer to introduce new tooling.
> > 
> > Introduce a new mechanism to ensure only well-known modules are loaded
> > by embedding a merkle tree root of all modules built as part of the full
> > kernel build into vmlinux.
> > 
> > Non-builtin modules can be validated as before through signatures.
> > 
> > Normally the .ko module files depend on a fully built vmlinux to be
> > available for modpost validation and BTF generation. With
> > CONFIG_MODULE_HASHES, vmlinux now depends on the modules
> > to build a merkle tree. This introduces a dependency cycle which is
> > impossible to satisfy. Work around this by building the modules during
> > link-vmlinux.sh, after vmlinux is complete enough for modpost and BTF
> > but before the final module hashes are
> > 
> > The PKCS7 format which is used for regular module signatures can not
> > represent Merkle proofs, so a new kind of module signature is
> > introduced. As this signature type is only ever used for builtin
> > modules, no compatibility issues can arise.
> 
> Nit: The description uses the term "builtin modules" in a misleading
> way. Typically, "builtin modules" refers to modules that are linked
> directly into vmlinux. However, this text uses the term to refer to
> loadable modules that are built together with the main kernel image,
> which is something different.

Agreed. I'll go through everything again, to consistently use "in-tree".

(...)

> > +
> > +	while (fgets(line, PATH_MAX, in)) {
> > +		struct file_entry *entry;
> > +
> > +		fh_list = xreallocarray(fh_list, num_files + 1, sizeof(*fh_list));
> 
> It might be useful to not reallocate this array for each file, although
> I don't immediately see that it contributes any significant time to the
> runtime.

The libc implementation should optimize this internally to not actually
grow one elemet at a time. I'd like to keep this as-is.

(...)

Ack to everything else.

