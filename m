Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 306BC4B467C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 10:44:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxzns4pWRz3bV7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 20:44:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gv/iNtL1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4Ypss7oh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=gv/iNtL1; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4Ypss7oh; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxzn10nVvz3cFf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 20:43:33 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id BB46A210EC;
 Mon, 14 Feb 2022 09:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644831808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ieTABS8pAkBiRe6k1EpMR6Q+a+Q4aVC4XYWf5FEqum4=;
 b=gv/iNtL1uP726yVkEYXeRsMt+tpDyYzlh39SvUkgz6XfWQ02M9SW3BgdwGOydhrlU8B+qI
 WWfGtIJTYFiTjOgO3SZ+wWWXNJY6G5N8zt3+7+urlTPazFMsX6x3ZP8ZmE96goZ5yQb1RS
 7fAZgrKZoPtwRyvgSRDbvOMUhLkPPKU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644831808;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ieTABS8pAkBiRe6k1EpMR6Q+a+Q4aVC4XYWf5FEqum4=;
 b=4Ypss7oh4DH3TDMhy4uRIx9fBehaGubyKzaAmwfQ34EwT62ZYYvOogwH8E7NsKG4RU9RHn
 wszzGu1QGKjjm5Cw==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id ADE1AA3C13;
 Mon, 14 Feb 2022 09:43:28 +0000 (UTC)
Date: Mon, 14 Feb 2022 10:43:27 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: No Linux logs when doing `ppc64_cpu --smt=off/8`
Message-ID: <20220214094327.GL3113@kunlun.suse.cz>
References: <d141d8c3-5c72-02ab-6b31-c32cd02f8291@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d141d8c3-5c72-02ab-6b31-c32cd02f8291@molgen.mpg.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Mon, Feb 14, 2022 at 07:08:07AM +0100, Paul Menzel wrote:
> Dear PPC folks,
> 
> 
> On the POWER8 server IBM S822LC running `ppc64_cpu --smt=off` or `ppc64_cpu
> --smt=8`, Linux 5.17-rc4 does not log anything. I would have expected a
> message about the change in number of processing units.

IIRC it was considered too noisy for systems with many CPUs and the
message was dropped. You can always check the resulting state with
ppc64_cpu or examining sysfs.

Thanks

Michal
