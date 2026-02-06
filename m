Return-Path: <linuxppc-dev+bounces-16651-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHk3GROkhWmSEQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16651-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 09:19:31 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 795F4FB640
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 09:19:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6n7M515Dz2yFc;
	Fri, 06 Feb 2026 19:19:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770365967;
	cv=none; b=OeQbbapgHDrnVI/2ZOUqVbmUFMiRF/yW1f5zrzxu4UczRrPBFUkVADx6VLY+FjOggRRtVfbxx9yzcs3l8ZBQcjzhVfbLB/MueKUJGv0buPGyQieeJFoHY7Oo/4YWHFO77hSlR5K0B/Q+dvCAZxuF5ozxtiXgA4ZGM6Gftq0aHhYbFJOobKhFfpqyTbXmiNW3qAuwLQugX0s2z3pSU3ZVqW9fWy8lotQllK24nbK5ok1EWAu8RO4wpdTujP02Vsy+51BVKinEyKA8nn0wgeKEmnFKYMktExSB3WK17DisFYSwE91Zdei73M+zlUXPsESbHLsiBDoBZJHPmXs4NUYf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770365967; c=relaxed/relaxed;
	bh=bCriBhlazS/0HXIrSjYBexp6X65YIc7sYJB9i7mUNXQ=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=O5prrjwTZ2LdrdTGnCdjXWUxKKn72rAKKLGVmvdlQWRdGZ3BISmsFXXNGaPUoxMJDKDDBG6nmFNxiNdC6gzIxffh+ZlN/J/0GaxcujUMcm5b6z1RGMA7BksMU9qyoIY3LhVBps4sNs79eoXG9lUtBRsIiOAlcNOexRnBPcgNN14uoRylGC0racyKDtFk/Ud5h5mJbtDxtiUk2dL/pv01g+LbO90yubGmGu1Dsu/jm3cjQaXGgjx2YANC56tDcJaHrqDwpxoopBzN/qEEzhEzBEjIFkwbv13qFTDiDrRsRwAn5oaAle2njU4LwLUtcLsDpsiWIoibVzs356mCLK7o7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z2EMrjfP; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MMru0GWA; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhowells@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z2EMrjfP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MMru0GWA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhowells@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6n7L0WK8z2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 19:19:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770365959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bCriBhlazS/0HXIrSjYBexp6X65YIc7sYJB9i7mUNXQ=;
	b=Z2EMrjfPot0ak00tiDkn1mmvOvpcgDFbVDQpk3j6mtgxbGRyHFlsh+7E0UgKpJkQkm9/0C
	8TpaeAmk+Imbn4JOqAguaGa14AJbhSJnSddkSMLUTzScG1ZZduHm3x+Df3kw/Xmv6wmTQx
	drhbZUpsUlaXgmrJ2VDhl1GhoH6KbFc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770365960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bCriBhlazS/0HXIrSjYBexp6X65YIc7sYJB9i7mUNXQ=;
	b=MMru0GWAvu9Gl97FT3OXGt2ItDWYwSN1yIAUomlrG1G5eLKCgkWcLUuuHO57ZtU0xZerWs
	q90DTZPOZIpCFY8WVFt3kD3Izjw+GqcF4XHAR/VTtkMQ9b9Gb2nSc926sAHJaV881h229e
	HRzpdvF0Adgsy40UeesoePkA0fHgjRc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516--zY-X-rwO-qBHh21bdBLDA-1; Fri,
 06 Feb 2026 03:19:15 -0500
X-MC-Unique: -zY-X-rwO-qBHh21bdBLDA-1
X-Mimecast-MFC-AGG-ID: -zY-X-rwO-qBHh21bdBLDA_1770365951
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ABCD01956095;
	Fri,  6 Feb 2026 08:19:08 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.33.164])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C245A3000707;
	Fri,  6 Feb 2026 08:18:54 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20260113-module-hashes-v4-5-0b932db9b56b@weissschuh.net>
References: <20260113-module-hashes-v4-5-0b932db9b56b@weissschuh.net> <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
To: =?us-ascii?Q?=3D=3Futf-8=3Fq=3FThomas=5FWei=3DC3=3D9Fschuh=3F=3D?= <linux@weissschuh.net>
Cc: dhowells@redhat.com, Nathan Chancellor <nathan@kernel.org>,
    Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>,
    Sami Tolvanen <samitolvanen@google.com>,
    Daniel Gomez <da.gomez@samsung.com>,
    Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
    "Serge E.
 Hallyn" <serge@hallyn.com>,
    Jonathan Corbet <corbet@lwn.net>,
    Madhavan Srinivasan <maddy@linux.ibm.com>,
    Michael Ellerman <mpe@ellerman.id.au>,
    Nicholas Piggin <npiggin@gmail.com>,
    Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
    Roberto Sassu <roberto.sassu@huawei.com>,
    Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
    Eric Snowberg <eric.snowberg@oracle.com>,
    Nicolas Schier <nicolas.schier@linux.dev>,
    Daniel Gomez <da.gomez@kernel.org>,
    Aaron Tomlin <atomlin@atomlin.com>,
    "Christophe
 Leroy (CS GROUP)" <chleroy@kernel.org>,
    Nicolas Schier <nsc@kernel.org>,
    Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
    Xiu Jianfeng <xiujianfeng@huawei.com>,
    Fabian =?utf-8?Q?Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>,
    Arnout Engelen <arnout@bzzt.net>,
    Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>,
    Christian Heusel <christian@heusel.eu>,
    =?utf-8?Q?C=C3=A2ju?= Mihai-Drosi <mcaju95@gmail.com>,
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
    linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
    linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
    linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
    linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 05/17] module: Switch load_info::len to size_t
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
Date: Fri, 06 Feb 2026 08:18:53 +0000
Message-ID: <2919071.1770365933@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: WDZib4mYFgnbkCgIVjQmzz7o7732WVFERAysnaYeF8Q_1770365951
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16651-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[42];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@weissschuh.net,m:dhowells@redhat.com,m:nathan@kernel.org,m:arnd@arndb.de,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:samitolvanen@google.com,m:da.gomez@samsung.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:naveen@kernel.org,m:zohar@linux.ibm.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:nicolas.schier@linux.dev,m:da.gomez@kernel.org,m:atomlin@atomlin.com,m:chleroy@kernel.org,m:nsc@kernel.org,m:nicolas.bouchinet@oss.cyber.gouv.fr,m:xiujianfeng@huawei.com,m:f.gruenbichler@proxmox.com,m:arnout@bzzt.net,m:mattia@mapreri.org,m:kpcyrd@archlinux.org,m:christian@heusel.eu,m:mcaju95@gmail.com,m:bigeasy@linutronix.de,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linuxppc-dev@l
 ists.ozlabs.org,m:linux-integrity@vger.kernel.org,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[dhowells@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,arndb.de,suse.com,google.com,samsung.com,paul-moore.com,namei.org,hallyn.com,lwn.net,linux.ibm.com,ellerman.id.au,gmail.com,huawei.com,oracle.com,linux.dev,atomlin.com,oss.cyber.gouv.fr,proxmox.com,bzzt.net,mapreri.org,archlinux.org,heusel.eu,linutronix.de,vger.kernel.org,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,warthog.procyon.org.uk:mid]
X-Rspamd-Queue-Id: 795F4FB640
X-Rspamd-Action: no action

Thomas Wei=C3=9Fschuh <linux@weissschuh.net> wrote:

> As both 'size_t' and 'unsigned int' are always the same size, this
> should be risk-free.

Did you mean 'unsigned long'?

David


