Return-Path: <linuxppc-dev+bounces-16527-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFhcOEjxgGkgDQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16527-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 19:47:36 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A522D04A8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 19:47:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4bFw5fb4z30FP;
	Tue, 03 Feb 2026 05:47:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770058052;
	cv=none; b=ciXKSZbR/ZZ/yxfaY+6+bGDgneV7ABBPbOT3knN7KmK2mxnuInLNtwgRwVaQMwFG2sG7PN5ERUg4ckGiUJUvi9xQL3HW1ogtKXwqulff2H8uaU35vV9vR05aQiQVKHT3bbmiWKOkaD3C7AHsJMLZrYCTy3bsjnsUOk1RcjAwcDK+zRNB5Dj8oVllVMG+gxgi/jyH5Izq8HvaWDRdogOAfb1ZswVj4LT5teqOKmxbnYSV081K5FjAQVqSOGgZ28cD/xVMLLjRxKjgcHsE0Y3uQEwox3ucZJNSzb8I4PB5h0ObqGUQdbBsk/kf2JS78BQUUXEr5nV80fGsH3VqgIoTMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770058052; c=relaxed/relaxed;
	bh=Zp4groAgVFf8Z6FsyW78hGxMRu8WsOlzg3z3ubBRZRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kz2xjI3TMKqoPrvQhipY8bv02haIQeB99dMOz8VN0Gbl/QsHhOuImrNgVUnyeOS1w5RX0vvMXXpllYr0hOwDfRrGE6Kz87T04RWeKqJw4Lay9KuZ4yOdlgB3qBjYo/aYBqhUPU4MwO5T7Zy3ySYQn9APnJqNJeSu1kMmFouUFX0BHQfRck7n5QMYVTr/ZqJ3JTriw4+7ogJM9Tqsh+CfjPVW9rit96HtynOkVMwaLKCzWjkgDKwL4s35mfV2rRmVaUb8G32t4/Z+NJljmZVum5TnlnHuSE5Bw91XK8iFpBC+jZ+xlQEHyObH7EeBmr8Cqaz3IbjHLx934cq9wHzECA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aCKhW3mX; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aCKhW3mX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4bFv4CHYz2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Feb 2026 05:47:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8915860010;
	Mon,  2 Feb 2026 18:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8E1C116C6;
	Mon,  2 Feb 2026 18:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770058049;
	bh=b1c9hVroKYW8OCGypKuuUgArjCJp8gAKeo9XoSbuZKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aCKhW3mXh4GMY6S3gJZHpkUL/e079wkvIz4StZSSFnNiJpENS1vb009Nnw6/Gv1Ho
	 O7IqLvlFBUcPPaHmemphyl8g5x/Xu1vGyLhXz2xHPJYq43Akq6PHjLNgr+KJ5RZ3OB
	 jYfmikmo7u6XcZF1Y+aEaBpajLhG1o0HZca91/uZ12/t/3iGvhD3gTGbGV0Xpk4bzT
	 7PvlHHVPEAx2QjM9YwOHrva2imznODhL/DXbiUI1JtwPimcHJQbP4HucTvqJN5r3am
	 r+PSyekjnt8ryUK0OML++wPPKLWeKExnZA83OKQWgOm51T9t9rlSEUc/Xm3GptqwJC
	 CajFQV8Axm+mw==
Date: Mon, 2 Feb 2026 10:47:25 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: =?us-ascii?B?PT9VVEYtOD9xP01paGFpLURyb3NpPTIwQz1DMz1BMmp1Pz0=?= <mcaju95@gmail.com>,
	linux@weissschuh.net, arnd@arndb.de, arnout@bzzt.net,
	atomlin@atomlin.com, bigeasy@linutronix.de, chleroy@kernel.org,
	christian@heusel.eu, corbet@lwn.net, coxu@redhat.com,
	da.gomez@kernel.org, da.gomez@samsung.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	f.gruenbichler@proxmox.com, jmorris@namei.org, kpcyrd@archlinux.org,
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-integrity@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, lkp@intel.com, maddy@linux.ibm.com,
	mattia@mapreri.org, mcgrof@kernel.org, mpe@ellerman.id.au,
	nathan@kernel.org, naveen@kernel.org,
	nicolas.bouchinet@oss.cyber.gouv.fr, nicolas.schier@linux.dev,
	npiggin@gmail.com, nsc@kernel.org, paul@paul-moore.com,
	petr.pavlu@suse.com, roberto.sassu@huawei.com,
	samitolvanen@google.com, serge@hallyn.com, xiujianfeng@huawei.com,
	zohar@linux.ibm.com
Subject: Re: [PATCH v4 00/17] module: Introduce hash-based integrity checking
Message-ID: <20260202184725.GC2036@quark>
References: <20260202183055.GB2036@quark>
 <20260201201218.GA15755@quark>
 <20260131073636.65494-1-mcaju95@gmail.com>
 <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
 <2316630.1769965788@warthog.procyon.org.uk>
 <2339369.1770024079@warthog.procyon.org.uk>
 <2513499.1770057531@warthog.procyon.org.uk>
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
In-Reply-To: <2513499.1770057531@warthog.procyon.org.uk>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	CC_EXCESS_BASE64(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16527-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dhowells@redhat.com,m:mcaju95@gmail.com,m:linux@weissschuh.net,m:arnd@arndb.de,m:arnout@bzzt.net,m:atomlin@atomlin.com,m:bigeasy@linutronix.de,m:chleroy@kernel.org,m:christian@heusel.eu,m:corbet@lwn.net,m:coxu@redhat.com,m:da.gomez@kernel.org,m:da.gomez@samsung.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:f.gruenbichler@proxmox.com,m:jmorris@namei.org,m:kpcyrd@archlinux.org,m:linux-arch@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-integrity@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:lkp@intel.com,m:maddy@linux.ibm.com,m:mattia@mapreri.org,m:mcgrof@kernel.org,m:mpe@ellerman.id.au,m:nathan@kernel.org,m:naveen@kernel.org,m:nicolas.bouchinet@oss.cyber.gouv.fr,m:nicolas.schier@linux.dev,m:npiggin@gmail.com,m:nsc@kernel.org,m:paul@paul-moore.com,m:petr.pavlu@suse.com,m:roberto.sassu@huawei.com,m:samito
 lvanen@google.com,m:serge@hallyn.com,m:xiujianfeng@huawei.com,m:zohar@linux.ibm.com,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_SENDER(0.00)[ebiggers@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,weissschuh.net,arndb.de,bzzt.net,atomlin.com,linutronix.de,kernel.org,heusel.eu,lwn.net,redhat.com,samsung.com,oracle.com,proxmox.com,namei.org,archlinux.org,vger.kernel.org,lists.ozlabs.org,intel.com,linux.ibm.com,mapreri.org,ellerman.id.au,oss.cyber.gouv.fr,linux.dev,paul-moore.com,suse.com,huawei.com,google.com,hallyn.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 0A522D04A8
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 06:38:51PM +0000, David Howells wrote:
> > Could you give more details on this use case and why it needs
> > signatures, as opposed to e.g. loading an additional Merkle tree root
> > into the kernel to add to the set of allowed modules?
> 
> Because we don't want to, for example, include all the nvidia drivers in our
> kernel SRPM.

That doesn't answer my question.  Are you trying to say these modules
need to be built later *and* signed using the original signing key?

- Eric

