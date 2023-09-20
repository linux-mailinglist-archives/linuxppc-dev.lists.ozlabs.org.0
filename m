Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFBF7A89D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 18:57:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=B5zucAFR;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=TEI3317K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrPq43QhFz3cPD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 02:57:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=B5zucAFR;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=TEI3317K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=jack@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrPp82stNz3c4V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 02:57:03 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 54B642017D;
	Wed, 20 Sep 2023 16:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1695229020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=arrJUNtqjU/izONia38ns6kqz5a2Ljs8vzyYYK7Z784=;
	b=B5zucAFR4XyR8/5tRFN24icRoW3Li46w9AYROy5fgeQHJjHHmWe1VBSTJAgJzltxBUTQfj
	A2xO9YmlmCUAHIhnO6bcsmBlTch94Tqw9Zrs2J99gUVXgRrg7N5SnwIhK/ADmsG7DqDXb5
	NyDsDzox8Vmqa0S6njAX9jt6GCL7qPo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1695229020;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=arrJUNtqjU/izONia38ns6kqz5a2Ljs8vzyYYK7Z784=;
	b=TEI3317KDo5yb9aq6yYTvDHKSUd5zcn5XGrWvmgB48JFj1/RVX24vTZ5l0fScD+mlAMJpN
	CaN28xdVs9HUPMBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 420581333E;
	Wed, 20 Sep 2023 16:57:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id s1QXEFwkC2UDdgAAMHmgww
	(envelope-from <jack@suse.cz>); Wed, 20 Sep 2023 16:57:00 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id AE8E8A077D; Wed, 20 Sep 2023 18:56:59 +0200 (CEST)
Date: Wed, 20 Sep 2023 18:56:59 +0200
From: Jan Kara <jack@suse.cz>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/7] arch/*: config: Remove ReiserFS from defconfig
Message-ID: <20230920165659.coe7d2lydiaatoby@quack3>
References: <20230918175529.19011-1-peter@n8pjl.ca>
 <20230918234108.GN19790@gate.crashing.org>
 <20230919000026.7409-1-peter@n8pjl.ca>
 <20230919151630.GO19790@gate.crashing.org>
 <20230919155832.4179-1-peter@n8pjl.ca>
 <CAMuHMdXQ=xpeY3tmLXe1kgJbRtmVAn62rEhvzO+VB7GCgy4F8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXQ=xpeY3tmLXe1kgJbRtmVAn62rEhvzO+VB7GCgy4F8w@mail.gmail.com>
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
Cc: linux-m68k@vger.kernel.org, tsbogend@alpha.franken.de, jack@suse.cz, linux-sh@vger.kernel.org, richard.henderson@linaro.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, richard@nod.at, ink@jurassic.park.msu.ru, Peter Lafreniere <peter@n8pjl.ca>, linux-alpha@vger.kernel.org, linux@armlinux.org.uk, johannes@sipsolutions.net, reiserfs-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, anton.ivanov@cambridgegreys.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 19-09-23 18:02:39, Geert Uytterhoeven wrote:
> Hi Peter,
> 
> On Tue, Sep 19, 2023 at 5:58 PM Peter Lafreniere <peter@n8pjl.ca> wrote:
> >  2) Stops building an obsolete and largely-unused filesystem unnecessarily.
> >     Some hobbyist targets like m68k and alpha may prefer to keep all filesystems
> >     available until total removal, but others like arm and UML have no need for
> >     ReiserFS to be built unless specifically configured.
> 
> As UML is used a lot for testing, isn't it actually counter-productive
> to remove ReiserFS from the UML defconfig?  The less testing it
> receives, the higher the chance of introducing regressions.

The only testing I know about for reiserfs (besides build testing) is
syzbot. And regarding the people / bots doing filesystem testing I know
none of them uses UML. Rather it is x86 VMs these days where reiserfs is
disabled in the defconfig for a *long* time (many years). Also when you do
filesystem testing, you usually just test the few filesystems you care
about and for which you have all the tools installed. So frankly I don't
see a good reason to leave reiserfs enabled in defconfigs. But sure if
m68k or other arch wants to keep reiserfs in it's defconfig for some
consistency reasons, I'm fine with it. I just suspect that for most archs
this is just a historical reason.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
