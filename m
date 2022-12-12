Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7AA6499F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 09:16:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NVvc54vTlz3bhD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 19:16:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=SJ/+WWdz;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NWtmdhrl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=mbenes@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=SJ/+WWdz;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NWtmdhrl;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NVvb73KJ2z2xH6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 19:16:02 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 9C10E337F2;
	Mon, 12 Dec 2022 08:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1670832958; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fkpn+tZcJeudANWrekmNzhJ9sWWRStUcNOk75TUGVOA=;
	b=SJ/+WWdzMjwNVHUSzgOqB/oaFKfchvGfon2Thz64qkaYhD47mzXyBL4U+yxHRN4klzl0+B
	1rUsmxeY/vPKxv9IZtKM/cmn+Yjl4+R9Krt9ssu3+AI9SnyImRzataysig3eXvO2zAJ9Yq
	7ksf3UtdkMkA0dGmk40TEHXOdfTuvkQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1670832958;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fkpn+tZcJeudANWrekmNzhJ9sWWRStUcNOk75TUGVOA=;
	b=NWtmdhrlM4aNQ/hGXkEvMQzIyNYUxlqdwMKG7pGo9kSYOvG0zhzfbTl9AxBXhMIbsvLxb0
	q3pFWmUqQYmxcPCw==
Received: from pobox.suse.cz (pobox.suse.cz [10.100.2.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 4CD622C141;
	Mon, 12 Dec 2022 08:15:58 +0000 (UTC)
Date: Mon, 12 Dec 2022 09:16:01 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v6] livepatch: Clear relocation targets on a module
 removal
In-Reply-To: <CAPhsuW53njtTrL=w33QBY5AiSftNxZ=UOQ1_qZ+qsp5VL1vU0g@mail.gmail.com>
Message-ID: <alpine.LSU.2.21.2212120912270.4964@pobox.suse.cz>
References: <20220901171252.2148348-1-song@kernel.org> <alpine.LSU.2.21.2212091352370.18933@pobox.suse.cz> <CAPhsuW53njtTrL=w33QBY5AiSftNxZ=UOQ1_qZ+qsp5VL1vU0g@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: pmladek@suse.com, jikos@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, joe.lawrence@redhat.com, Josh Poimboeuf <jpoimboe@redhat.com>, live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> > Petr has commented on the code aspects. I will just add that s390x was not
> > dealt with at the time because there was no live patching support for
> > s390x back then if I remember correctly and my notes do not lie. The same
> > applies to powerpc32. I think that both should be fixed as well with this
> > patch. It might also help to clean up the ifdeffery in the patch a bit.
> 
> I don't have test environments for s390 and powerpc, so I really don't know
> whether I am doing something sane for them.

I would say that if you implement it, there are people here who would be 
able help with the testing and reviewing the changes if CCed.

> Would you have time to finish these parts? (Or maybe the whole patch..)

Unfortunately I cannot promise anything at the moment. I am really sorry 
about that.

Miroslav
