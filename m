Return-Path: <linuxppc-dev+bounces-16915-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNSfHh3QlGlGIAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16915-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 21:31:25 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE9114FFA8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 21:31:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFrrn2W2Nz2yFb;
	Wed, 18 Feb 2026 07:31:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=216.40.44.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771360281;
	cv=none; b=kByZVMaatZgUzvgLpYcbetXHILGT4Zfh7sDDwkD62kGA2A6HvU6hnSRd+8qUelhyK1fpm0Tf0Kr/hX/fJjxGRsimWvR/QvWa5RG5PfX3M0z2unU4CVZ5LJfxbfV8iS0EyG2+eYIE4nooO+d1PRXvJjxGk/0XTLus4vA6KagMH0WAtssClpfcD1p4PygDv5GSZgucRBMcFJr4R0vD3b0iDfG//w0i/7N/967XQauNKiVjVvWFXa0/Gokk8pZmNr3JHARVB4zeKcgEhZvUIw3DNM62CFB6mFBiEkStOv4j6zgx12BntZlfEyTIN3kOR2w+a4Z7eB3L7RNs2BarO87H6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771360281; c=relaxed/relaxed;
	bh=aav3TUOp3yM6XEIV9qLupYdrqZmhuQYVEOqu87VezeY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gzz8gEbTFBgB+zXY3fSrnHeudLNZWzLz+RLv6GGBjZ65S5FkDccKp/kulll5eEPjgeKAa49nVHGEzxmWFIrLylt/Z0pCcXqzuxjVL+E0hSjOk7T+8/iNSuD2QAbWSGWizHFKRY4UQCLk+ADtOBQH6qT6hRFlNlOQgjn+rDQYnb/pc6/U8EWr+4bmf6rbm26nnVVZS2exnLO2mVGE7p8WEQqFmjfTpANgpfv0/awW7XXXmeOd0Ww9yRgZbtZnM2Lz2Uoz/Hfbdws2gyCXsAH2GyhOgC5aFV2hzOcs+Ag1JZzhFKuG1x2Qpx/9ZelYpOxH2FSBCbarajaQhKdPKKx/qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=216.40.44.13; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org) smtp.mailfrom=goodmis.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=goodmis.org (client-ip=216.40.44.13; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 474 seconds by postgrey-1.37 at boromir; Wed, 18 Feb 2026 07:31:19 AEDT
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFrrl4k8Nz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Feb 2026 07:31:18 +1100 (AEDT)
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 2F2D6B8160;
	Tue, 17 Feb 2026 20:23:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf12.hostedemail.com (Postfix) with ESMTPA id 26A1617;
	Tue, 17 Feb 2026 20:23:15 +0000 (UTC)
Date: Tue, 17 Feb 2026 15:23:16 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Nassiri, Mohammad" <mnassiri@ciena.com>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-trace-users@vger.kernel.org" <linux-trace-users@vger.kernel.org>,
 "michael@ellerman.id.au" <michael@ellerman.id.au>, "srostedt@redhat.com"
 <srostedt@redhat.com>, "masami.hiramatsu@linaro.org"
 <masami.hiramatsu@linaro.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PPC][Tracing] Missing syscalls:* ftrace/perf events on PowerPC
 vs x86
Message-ID: <20260217152316.78d2dca8@gandalf.local.home>
In-Reply-To: <CH2PR04MB6821DAF7C6684BB990A0288BC56DA@CH2PR04MB6821.namprd04.prod.outlook.com>
References: <CH2PR04MB6821DAF7C6684BB990A0288BC56DA@CH2PR04MB6821.namprd04.prod.outlook.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 1xdoguaa1ixyckddak7mc6mjxxqgww1c
X-Spam-Status: No, score=0.0 required=3.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/8QjY5lPcZmBYn+nIlhLI5IN77rpkBj2w=
X-HE-Tag: 1771359795-761203
X-HE-Meta: U2FsdGVkX19dJW83xGOaCcQd1buhUTb0h2SypQSEZN3KTbh8n3AEMA8DD3jKvJA0BOusb1BY3RiNOtnfXIlsczA1MrPsCJ7xio/FF/M97Gg+Nry0/TUlICOJ5bCAukcaEPMoKyTmZx8HxNCkSz5H/tQ/ZECc6OqkuuDLPi2Brk1WcqgSfPq5lWXwhHmpAvib0V0u4P7tjWsu55b1v0h3xZx8nPozTmG/99uSRCAzpb3SY9ObEPchQWZqg14a+jTx1LKhv/ZWZK8fl0gOVMT91nKxTsXPuBI58s0yO1ocVrHPw0a5f/v/tSWVTJFF16ER2WsrSnH96vmIePVCBqcjFiB0Ch8zF9kY3Xohp+Z7zDI9cRNWePQfiQ==
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mnassiri@ciena.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-trace-users@vger.kernel.org,m:michael@ellerman.id.au,m:srostedt@redhat.com,m:masami.hiramatsu@linaro.org,m:christophe.leroy@csgroup.eu,m:npiggin@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[rostedt@goodmis.org,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-16915-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,vger.kernel.org,ellerman.id.au,redhat.com,linaro.org,csgroup.eu,gmail.com];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ciena.com:email,gandalf.local.home:mid]
X-Rspamd-Queue-Id: EEE9114FFA8
X-Rspamd-Action: no action

On Tue, 17 Feb 2026 20:10:39 +0000
"Nassiri, Mohammad" <mnassiri@ciena.com> wrote:

> Hello,
> 
> On PPC64 with Yocto Kirkstone and Linux 5.10.x,

5.10 is ancient and nobody working upstream is going to bother looking at
this.

If it works on a more recent kernel, then maybe something needs to be
backported.

-- Steve

