Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E717920FD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 10:25:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iqiIod1D;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oU1erxzl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rfz8Y6DX7z3bhp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 18:25:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iqiIod1D;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oU1erxzl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rfz7f6hVdz2yWD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 18:24:30 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 3CDE121842;
	Tue,  5 Sep 2023 08:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1693902266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zV0vnDdG0SNSlYi0UIj5zdDVQkYJZ+7ip9KDTjH2Ocg=;
	b=iqiIod1D/yzc9l7Vei44jo8za0s0iHfprcnYGmdqwxG35NjY//WCAf5svKWHK0PuD4WCDW
	yAJzgKK1Q1I/Pae2fDZXX6II9uJLW4gOCyooAb5k6uL/SdgyFLpLyqSIUJ6EttkRLMGpzs
	79G6El4toMldjcPok7hO5kpb4mLXXOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693902266;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zV0vnDdG0SNSlYi0UIj5zdDVQkYJZ+7ip9KDTjH2Ocg=;
	b=oU1erxzl6nUYq7rN5DCNY8mRyGI1U9jw2KPhAeOzVSQAGEMlI74cI48oX/rwwxUYr2nWx4
	gb5xTGnETf6vdhCA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id D365B2C142;
	Tue,  5 Sep 2023 08:24:25 +0000 (UTC)
Date: Tue, 5 Sep 2023 10:24:23 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH RFC 1/2] powerpc/pseries: papr-vpd char driver for VPD
 retrieval
Message-ID: <20230905082423.GS8826@kitsune.suse.cz>
References: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
 <20230822-papr-sys_rtas-vs-lockdown-v1-1-932623cf3c7b@linux.ibm.com>
 <20230830072801.GC8826@kitsune.suse.cz>
 <8734zz3hci.fsf@mail.lhotse>
 <20230831103811.GF8826@kitsune.suse.cz>
 <87r0nj1lzr.fsf@mail.lhotse>
 <20230831114431.GH8826@kitsune.suse.cz>
 <875y4vytxe.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <20230904072037.GN8826@kitsune.suse.cz>
 <877cp5ibng.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877cp5ibng.fsf@mail.lhotse>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 05, 2023 at 12:42:11PM +1000, Michael Ellerman wrote:
> Michal Suchánek <msuchanek@suse.de> writes:
> > On Thu, Aug 31, 2023 at 12:59:25PM -0500, Nathan Lynch wrote:
> ...
> >> You (Michal) seem to favor a kernel-user ABI where user space is allowed
> >> to invoke arbitrary RTAS functions by name. But we already have that in
> >> the form of the rtas() syscall. (User space looks up function tokens by
> >> name in the DT.) The point of the series is that we need to move away
> >> from that. It's too low-level and user space has to use /dev/mem when
> >> invoking any of the less-simple RTAS functions.
> >
> > We don't have that, directly accessing /dev/mem does not really work.
> > And that's what needs fixing in my view.
> >
> > The rtas calls are all mechanically the same, the function implemented
> > here should be able to call any of them if there was a way to specify
> > the call.
> >
> > Given that there is desire to have access to multiple calls I don't
> > think it makes sense to allocate a separate device with different name
> > for each.
> 
> I think it does make sense.
> 
> We explicitly don't want a general "call any RTAS function" API.
> 
> We want tightly scoped APIs that do one thing, or a family of related
> things, but not anything & everything.
> 
> Having different devices for each of those APIs means permissions can be
> granted separately on those devices. So a user/group can be given access
> to the "papr-vpd" device, but not some other unrelated device that also
> happens to expose an RTAS service (eg. error injection).

Yes, it does work as a kludge for setting permissions for individual
calls.

Thanks

Michal
