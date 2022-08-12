Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B7259157C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 20:29:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M4BzX57J2z3c7K
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Aug 2022 04:29:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Dnk3Qtxa;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RKeJHxsr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=bp@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Dnk3Qtxa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RKeJHxsr;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M4Byq5QGtz2ywl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Aug 2022 04:29:06 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 25B892076B;
	Fri, 12 Aug 2022 18:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1660328943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tPX04jbC0BQlROGb55mEQeAkYdO/pUMQJcyP6P8yDMg=;
	b=Dnk3QtxahbVc8N9Wb+mg3LWpIqkL3j324Xp+zLN1b3scdy/6qC3SQRFK8mueXE9dOR3bzD
	kJVAa0mCRV10Ey1xRS0KdJiaA9Wz8rqTWrRnCe1cOw0qo+FQTx1rfRhSaWUJljn9CEbQwD
	xzFf5Tca5Jc7aJLzQhyTBqFAUhyiUPw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1660328943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tPX04jbC0BQlROGb55mEQeAkYdO/pUMQJcyP6P8yDMg=;
	b=RKeJHxsr+7BAG6RlGp765vCQzZKzbcl/KDPcaPksygxZXVLn3ATBYyju64TDEMjTHB+oX2
	LKozQGXN/hssDQAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 14F5C13AAE;
	Fri, 12 Aug 2022 18:29:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Is0VBe+b9mLdIgAAMHmgww
	(envelope-from <bp@suse.de>); Fri, 12 Aug 2022 18:29:03 +0000
Date: Fri, 12 Aug 2022 20:28:58 +0200
From: Borislav Petkov <bp@suse.de>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v7 3/6] x86/kexec: Carry forward IMA measurement log on
 kexec
Message-ID: <Yvab6lC9BUbmp4a8@zn.tnic>
References: <20220812164305.2056641-1-stefanb@linux.ibm.com>
 <20220812164305.2056641-4-stefanb@linux.ibm.com>
 <YvaJc7bQjz61Y1jj@zn.tnic>
 <935988a4-c245-7cb1-4e14-bc99d39220a1@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <935988a4-c245-7cb1-4e14-bc99d39220a1@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, Jonathan McDowell <noodles@fb.com>, nayna@linux.ibm.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, nasastry@in.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 12, 2022 at 01:14:38PM -0400, Stefan Berger wrote:
> Yes, so this series can be tested by krobot.

You mean Intel's 0day robot?

I believe that thing has by now enough logic to figure out which branch
to base patches ontop. Or maybe there's some magic incantation to tell
it which base commit to use so that you can simply do your patches ontop
of latest linux-next instead of having to carry upstreamed patches.

Also, there's a little point in testing against 5.19 when you wanna test
it against v6.0-rc1...

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Martje Boudien Moerman
(HRB 36809, AG Nürnberg)
