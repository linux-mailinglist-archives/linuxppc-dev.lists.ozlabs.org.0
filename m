Return-Path: <linuxppc-dev+bounces-16498-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNzEBwSJf2mptAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16498-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Feb 2026 18:10:28 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FA6C69F6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Feb 2026 18:10:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f3x8H33M1z2ySb;
	Mon, 02 Feb 2026 04:10:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769965823;
	cv=none; b=lKZHCERw+IGmnPp0+S+3wR1rwJDGzqWQczW280XxsdCD6zeu6PFdb3/xnKtWLhO2PfeRD+LJlGKY18BEPT5tLJ8Asq+GLEH7LVeguCtI28kJkAZRx1rYBm7AkoKFP8Y8TjgLO80oW+5vCPyxJFww8ZQnS6Y2ZDtH0VNZk9SHw1Msg6OgOiwwIKAAsnzgmWDhz6OwNqBc9+Bx5p3fRBwRbcg01fPIs0xdZlmCJPCH6tv7LlNeHioYZ7GWgGDc/rRNP5pw8wmx5iwAm4uri0knLeTnvQdonV6cSuUt1cgshng/WbajzDfJGBatn3qpgUrC1KGv94CZJVz15HQou9hE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769965823; c=relaxed/relaxed;
	bh=AXzGf8dg7zdwjSpH9NQ85FkESCYj8y44yqTfJ6FGfkQ=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=P1qb/1gpBUPdfkDg4yNFFY1dVQC/IDM77jriCQJ7HRTEVkUN6iZgjMdjDAoNfRaOjHQJ11JdsvX3gL6SjnEVaVlLqklXrwfFgtdowu6pyWvJGI2+TYzf7gh+MIPS7VWyzH7uYGZwCy6iYxbugrrQhtIR4uOmm5zB7+w5F2oHfH8hXdkNqjvfBeXMIr9BPsVuL/ycpASkqQW8eOXjbRQR3l3P8bOfNjCOM2uwKDWDqUR3/5MCbZ1sUV3Rhp2JmfnmbcHO++ETtOx+1T2qpktSIrDSKkpwwFR86N0CGnkrfKKmpLZwOFSBkTIjRT1YkrOmPXgAee2jdADc0ZP038zXZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DKbBqLBP; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DKbBqLBP; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhowells@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DKbBqLBP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DKbBqLBP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhowells@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f3x8G0MLhz2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 04:10:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769965815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AXzGf8dg7zdwjSpH9NQ85FkESCYj8y44yqTfJ6FGfkQ=;
	b=DKbBqLBPl4hPr0jsOScvmYifKqR6CfkpCX35Lbs7ZhtCnrAgGB2DvmgW1zvVIqxrbD3Ac9
	U179HmV67I/6F+9xo528x4zrNs+CgIIQsFyIhpBZiQLw6sbUx7FuNo+LYpKlqS3fonYpn4
	z+fDEu6PBFGqChb5lDDCYgWhNm8x6F4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769965815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AXzGf8dg7zdwjSpH9NQ85FkESCYj8y44yqTfJ6FGfkQ=;
	b=DKbBqLBPl4hPr0jsOScvmYifKqR6CfkpCX35Lbs7ZhtCnrAgGB2DvmgW1zvVIqxrbD3Ac9
	U179HmV67I/6F+9xo528x4zrNs+CgIIQsFyIhpBZiQLw6sbUx7FuNo+LYpKlqS3fonYpn4
	z+fDEu6PBFGqChb5lDDCYgWhNm8x6F4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-479-oQw7rZraM7KagOwiXj8BJg-1; Sun,
 01 Feb 2026 12:10:11 -0500
X-MC-Unique: oQw7rZraM7KagOwiXj8BJg-1
X-Mimecast-MFC-AGG-ID: oQw7rZraM7KagOwiXj8BJg_1769965807
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 99D621956066;
	Sun,  1 Feb 2026 17:10:04 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.33.164])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3D41A18004D8;
	Sun,  1 Feb 2026 17:09:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20260131073636.65494-1-mcaju95@gmail.com>
References: <20260131073636.65494-1-mcaju95@gmail.com> <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
To: =?us-ascii?Q?=3D=3FUTF-8=3Fq=3FMihai-Drosi=3D20C=3DC3=3DA2ju=3F=3D?= <mcaju95@gmail.com>
Cc: dhowells@redhat.com, linux@weissschuh.net, arnd@arndb.de,
    arnout@bzzt.net, atomlin@atomlin.com, bigeasy@linutronix.de,
    chleroy@kernel.org, christian@heusel.eu, corbet@lwn.net,
    coxu@redhat.com, da.gomez@kernel.org, da.gomez@samsung.com,
    dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
    f.gruenbichler@proxmox.com, jmorris@namei.org, kpcyrd@archlinux.org,
    linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
    linux-integrity@vger.kernel.org, linux-kbuild@vger.kernel.org,
    linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
    linux-security-module@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
    lkp@intel.com, maddy@linux.ibm.com, mattia@mapreri.org,
    mcgrof@kernel.org, mpe@ellerman.id.au, nathan@kernel.org,
    naveen@kernel.org, nicolas.bouchinet@oss.cyber.gouv.fr,
    nicolas.schier@linux.dev, npiggin@gmail.com, nsc@kernel.org,
    paul@paul-moore.com, petr.pavlu@suse.com, roberto.sassu@huawei.com,
    samitolvanen@google.com, serge@hallyn.com, xiujianfeng@huawei.com,
    zohar@linux.ibm.com
Subject: Re: [PATCH v4 00/17] module: Introduce hash-based integrity checking
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
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Feb 2026 17:09:48 +0000
Message-ID: <2316630.1769965788@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	TO_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16498-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dhowells@redhat.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_RECIPIENTS(0.00)[m:mcaju95@gmail.com,m:dhowells@redhat.com,m:linux@weissschuh.net,m:arnd@arndb.de,m:arnout@bzzt.net,m:atomlin@atomlin.com,m:bigeasy@linutronix.de,m:chleroy@kernel.org,m:christian@heusel.eu,m:corbet@lwn.net,m:coxu@redhat.com,m:da.gomez@kernel.org,m:da.gomez@samsung.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:f.gruenbichler@proxmox.com,m:jmorris@namei.org,m:kpcyrd@archlinux.org,m:linux-arch@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-integrity@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:lkp@intel.com,m:maddy@linux.ibm.com,m:mattia@mapreri.org,m:mcgrof@kernel.org,m:mpe@ellerman.id.au,m:nathan@kernel.org,m:naveen@kernel.org,m:nicolas.bouchinet@oss.cyber.gouv.fr,m:nicolas.schier@linux.dev,m:npiggin@gmail.com,m:nsc@kernel.org,m:paul@paul-moore.com,m:petr.pavlu@suse.com,m:roberto.sassu@huawei.com,m:samito
 lvanen@google.com,m:serge@hallyn.com,m:xiujianfeng@huawei.com,m:zohar@linux.ibm.com,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[redhat.com,weissschuh.net,arndb.de,bzzt.net,atomlin.com,linutronix.de,kernel.org,heusel.eu,lwn.net,samsung.com,gmail.com,oracle.com,proxmox.com,namei.org,archlinux.org,vger.kernel.org,lists.ozlabs.org,intel.com,linux.ibm.com,mapreri.org,ellerman.id.au,oss.cyber.gouv.fr,linux.dev,paul-moore.com,suse.com,huawei.com,google.com,hallyn.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[warthog.procyon.org.uk:mid]
X-Rspamd-Queue-Id: 63FA6C69F6
X-Rspamd-Action: no action

Mihai-Drosi C=C3=A2ju <mcaju95@gmail.com> wrote:

> > The current signature-based module integrity checking has some drawbacks
> in combination with reproducible builds. Either the module signing key
> is generated at build time, which makes the build unreproducible, or a
> static signing key is used, which precludes rebuilds by third parties
> and makes the whole build and packaging process much more complicated.

There is another issue too: If you have a static private key that you use to
sign modules (and probably other things), someone will likely give you a GPL
request to get it.

One advantage of using a transient key every build and deleting it after is
that no one has the key.

One other thing to remember: security is *meant* to get in the way.  That's
the whole point of it.

However, IANAL.

David


