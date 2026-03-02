Return-Path: <linuxppc-dev+bounces-17534-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFo9JmCZpWnxEgYAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17534-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 15:06:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F701DA5DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 15:06:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPghW2SN4z3bt1;
	Tue, 03 Mar 2026 01:06:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0c:5a00:149::26"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772460379;
	cv=none; b=bz2cUXm2s/FFlPoEg90Qf81jGmJe6DcxX7anXHSy0wtRrdq4Y/neGkebIZKNxtBNQ7RA4LbGKx5FLcr/eT1c5oxF3Sc04ldcabnh1h22sA/KeeuBPDBjCn3fgnqVXxEHlv5ymsr0cQH5tebYC5YIEWeqIaGsJvrjo8lFmuSs/05LURWnXf4FtSXBOq3Pb1W0XdSd3ywYXFZmHdiupR0mBucCmdCo+0FLK5YNN06iiKXPqTlAzvzAEL4Ok0hbXhf1S5T53WXmKmoynkjvLlSdhrtvPUoS6sVFfIN7SUMPNzDbJZLawupIY+DfBxwfuncnoQe97mYso1lnx+3WOCXJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772460379; c=relaxed/relaxed;
	bh=TqCugejn+OGjGM2P4bwUziYu78OGaka0Bim+UNMgjx0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=hVZLt3dk+RjwGFbM5CxdYNvSrokfP9O3qrm9NNk/+OBoCJ/keLjX9DeO4qJGkBcncLIP2Evhs7ozKy7vgq/Rt2TFIHUE0iLjH2AmzPHrBfUhei4dlH5YjNBWqwRIx6Rvy8JIue9jD6ngGdWwAdoYvFt734MD+FzeyGKCPLmJWYUjmZGtT9vOCnGMPhfpOl9BP90CZkdgXP3VU7tLsE6jQbPtPn+FfT/vdU1GBZ9ttV9xRo6XKazKy8J1nN0rHoV+ZiCFc2dH+CmH7lRNjzp+00mQvAwuxydstkPVi4FlrjWHu7ZZFadC3LaZ1arZn1K385pRs2gPh+I+/TzYLpUrCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector2 header.b=CnVsYB+8; dkim-atps=neutral; spf=pass (client-ip=2a0c:5a00:149::26; helo=mailtransmit05.runbox.com; envelope-from=david.laight.linux_spam@runbox.com; receiver=lists.ozlabs.org) smtp.mailfrom=runbox.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector2 header.b=CnVsYB+8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=runbox.com (client-ip=2a0c:5a00:149::26; helo=mailtransmit05.runbox.com; envelope-from=david.laight.linux_spam@runbox.com; receiver=lists.ozlabs.org)
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [IPv6:2a0c:5a00:149::26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPghV5Nnmz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 01:06:18 +1100 (AEDT)
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vx3Jw-003bl3-6s; Mon, 02 Mar 2026 14:28:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:To:From; bh=TqCugejn+OGjGM2P4bwUziYu78OGaka0Bim+UNMgjx0=; b=CnVsYB+8+
	VTkexEkCIXtWxDk0ct8bmk056FpnSkPCeP5i9Yz34bIo3y9sfFFKxB70WZvWoa5uqvPOn8FGr0qGf
	EbIp0aausm3TBu9LxPZnWweSATT+ezR5WZWL2ZB5A/AohwyvAn5sRz/2VIhze8//praDWx5tUs3Kh
	uSZ5LHvoL37lkFaTAFRYZPn6z3367lk4BEMixUtiAnxmBvTrEt3Nok0C2xREQl+pFHBZNSGve89hN
	sVBOcOV0Nc47MyZUOiMqCn7FnHZ5wI0tCUtCptdrGMcotngqvg2PlvnsYF2JihFCbaufaLijoNZFG
	NDR1Prmpt8MS2YYeGDqIb7kqQ==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vx3Js-0003sJ-UZ; Mon, 02 Mar 2026 14:28:21 +0100
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vx3Jf-008UTR-B9; Mon, 02 Mar 2026 14:28:07 +0100
From: david.laight.linux@gmail.com
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Andre Almeida <andrealmeid@igalia.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Christian Brauner <brauner@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Darren Hart <dvhart@infradead.org>,
	David Laight <david.laight.linux@gmail.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Heiko Carstens <hca@linux.ibm.com>,
	Jan Kara <jack@suse.cz>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org,
	Kees Cook <kees@kernel.org>,
	akpm@linux-foundation.org
Subject: [PATCH v2 0/5] uaccess: Updates to scoped_user_access()
Date: Mon,  2 Mar 2026 13:27:50 +0000
Message-Id: <20260302132755.1475451-1-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[runbox.com:s=selector2];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:andrealmeid@igalia.com,m:andrew.cooper3@citrix.com,m:borntraeger@linux.ibm.com,m:brauner@kernel.org,m:christophe.leroy@csgroup.eu,m:chleroy@kernel.org,m:dvhart@infradead.org,m:david.laight.linux@gmail.com,m:dave@stgolabs.net,m:hca@linux.ibm.com,m:jack@suse.cz,m:Julia.Lawall@inria.fr,m:torvalds@linux-foundation.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fsdevel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:maddy@linux.ibm.com,m:mathieu.desnoyers@efficios.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:nicolas.palix@imag.fr,m:palmer@dabbelt.com,m:pjw@kernel.org,m:peterz@infradead.org,m:linux@armlinux.org.uk,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:x86@kernel.org,m:kees@kernel.org,m:akpm@linux-foundation.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[zeniv.linux.org.uk,igalia.com,citrix.com,linux.ibm.com,kernel.org,csgroup.eu,infradead.org,gmail.com,stgolabs.net,suse.cz,inria.fr,linux-foundation.org,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,efficios.com,ellerman.id.au,imag.fr,dabbelt.com,armlinux.org.uk,linutronix.de];
	TAGGED_FROM(0.00)[bounces-17534-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[runbox.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org]
X-Rspamd-Queue-Id: B5F701DA5DD
X-Rspamd-Action: no action

From: David Laight <david.laight.linux@gmail.com>

Converting kernel/signal.c to use scoped_user_access() had compilation
warnings because some of the pointers are 'pointer to const'.
This is fixed in patch 1.

The same problem has been found compiling arch/powerpc/lib/checksum_wrappers.c

For v2 I've changed the code to use 'auto' and replaced the over-complex
CLASS definition (and its for loop) with a much simpler __cleanup() function
on the second loop.

Patches 2 and 3 factor out the 'autoterminating nested for loops'.
I'm sure there'll be a 'bikeshed' discussion about the names.

Patch 4 stops warnings from -Wshadow (enabled by W=2).
I did think about making the _diag_xxx conditional on a W=2 build,
but since the pre-processor just emits #pragma lines and they are
smaller that the for() loop it doesn't seem worth while.

Patch 5 is the change to signal.c that prompted patch 1.
The generated code looks fine, but I've not tested it.
Most of the changes are to 'compat' code - so are probably not
usually performance critical.
IIRC the non-compat code uses copy_to/from_user() for the structures
so is probably slower than the compat code's member by member copy.

David Laight (5):
  uaccess: Fix scoped_user_read_access() for 'pointer to const'
  compiler.h: Add generic support for 'autoterminating nested for()
    loops'
  uaccess.h: Use with() and and_with() in __scoped_user_access()
  uaccess: Disable -Wshadow in __scoped_user_access()
  signal: Use scoped_user_access() instead of __put/get_user()

 include/linux/compiler.h | 26 +++++++++++++++
 include/linux/uaccess.h  | 51 ++++++++++------------------
 kernel/signal.c          | 72 +++++++++++++++++++++++-----------------
 3 files changed, 86 insertions(+), 63 deletions(-)

-- 
2.39.5


