Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C495B768A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 18:34:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRpvr1grvz3c2g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 02:34:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GAL/vVTb;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wZiMmYWH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GAL/vVTb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wZiMmYWH;
	dkim-atps=neutral
X-Greylist: delayed 26442 seconds by postgrey-1.36 at boromir; Wed, 14 Sep 2022 02:33:55 AEST
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRpv73KhNz2xn5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 02:33:54 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 6303334C94;
	Tue, 13 Sep 2022 16:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1663086824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G+0/LysbokAzH3nfVJCfLD1HJyONhXA3k1asjd6ZpuU=;
	b=GAL/vVTboiPfL6nqKly6L4ys0VP8Rjr4JSnNmOgdGBp/b3aCy7MSfdHt/R+eWwXSrMHBBz
	gGJebnloswyiDy7rdpxnWxsQ0WQ9FIMS0tE5+8pjqIb8siv7q/quj0rnXCzUFEq7w/JMAs
	TYmZ6SlcColGm2/UPbQU5S1+QHmNux0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1663086824;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G+0/LysbokAzH3nfVJCfLD1HJyONhXA3k1asjd6ZpuU=;
	b=wZiMmYWHW3tRWJEU+DOSnDTSvIiUt6MtbIBCW2JEX2xq9tqcJRFWMdCyJr5uWzlAmaM7X1
	OxEh1ms6O2nbSwCg==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 3A9AB2C141;
	Tue, 13 Sep 2022 16:33:44 +0000 (UTC)
Date: Tue, 13 Sep 2022 18:33:43 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: add lparctl driver for
 platform-specific functions
Message-ID: <20220913163343.GA28810@kitsune.suse.cz>
References: <20220730000458.130938-1-nathanl@linux.ibm.com>
 <0ead0cd1-f6f6-ecf0-65d9-f3d9366e258c@linux.ibm.com>
 <87k07dl1f6.fsf@linux.ibm.com>
 <20220913091302.GY28810@kitsune.suse.cz>
 <87v8prtgcj.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v8prtgcj.fsf@linux.ibm.com>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org, Chun-Yi <jlee@suse.com>, Lee@kitsune.suse.cz, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 13, 2022 at 10:59:56AM -0500, Nathan Lynch wrote:
> Michal Suchánek <msuchanek@suse.de> writes:
> 
> > On Fri, Aug 12, 2022 at 02:14:21PM -0500, Nathan Lynch wrote:
> >> Laurent Dufour <ldufour@linux.ibm.com> writes:
> >> > Le 30/07/2022 à 02:04, Nathan Lynch a écrit :
> >> >> +static long lparctl_get_sysparm(struct lparctl_get_system_parameter __user *argp)
> >> >> +{
> >> >> +	struct lparctl_get_system_parameter *gsp;
> >> >> +	long ret;
> >> >> +	int fwrc;
> >> >> +
> >> >> +	/*
> >> >> +	 * Special case to allow user space to probe the command.
> >> >> +	 */
> >> >> +	if (argp == NULL)
> >> >> +		return 0;
> >> >> +
> >> >> +	gsp = memdup_user(argp, sizeof(*gsp));
> >> >> +	if (IS_ERR(gsp)) {
> >> >> +		ret = PTR_ERR(gsp);
> >> >> +		goto err_return;
> >> >> +	}
> >> >> +
> >> >> +	ret = -EINVAL;
> >> >> +	if (gsp->rtas_status != 0)
> >> >> +		goto err_free;
> >> >> +
> >> >> +	do {
> >> >> +		static_assert(sizeof(gsp->data) <= sizeof(rtas_data_buf));
> >> >> +
> >> >> +		spin_lock(&rtas_data_buf_lock);
> >> >> +		memset(rtas_data_buf, 0, sizeof(rtas_data_buf));
> >> >> +		memcpy(rtas_data_buf, gsp->data, sizeof(gsp->data));
> >> >> +		fwrc = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
> >> >> +				 NULL, gsp->token, __pa(rtas_data_buf),
> >> >> +				 sizeof(gsp->data));
> >> >> +		if (fwrc == 0)
> >> >> +			memcpy(gsp->data, rtas_data_buf, sizeof(gsp->data));
> >> >
> >> > May be the amount of data copied out to the user space could be
> >> > gsp->length. This would prevent copying 4K bytes all the time.
> >> >
> >> > In a more general way, the size of the RTAS buffer is quite big, and I'm
> >> > wondering if all the data need to be copied back and forth to the kernel.
> >> >
> >> > Unless there are a high frequency of calls this doesn't make sense, and
> >> > keeping the code simple might be the best way. Otherwise limiting the bytes
> >> > copied could help a bit.
> >> 
> >> This is not intended to be a high-bandwidth interface and I don't think
> >> there's much of a performance concern here, so I'd rather just keep the
> >> copy sizes involved constant.
> >
> > But that's absolutely horrible!
> 
> ?
> 
> > The user wants the VPD data, all of it. And you only give one page with
> > this interface.
> 
> The code here is for system parameters, which have a known maximum size,
> unlike VPD. There's no code for VPD retrieval in this patch.

But we do need to support the calls that return multiple pages of data.

If the new driver supports only the simple calls it's a failure.

> 
> But I'm happy to constructively discuss how a VPD ioctl interface should
> work.
> 
> > Worse, the call is not reentrant so you need to lock against other users
> > calling the call while the current caller is retrieving the inidividual
> > pagaes.
> >
> > You could do that per process, but then processes with userspace
> > threading would want the data as well so you would have to save the
> > arguments of the last call, and compare to arguments of any subsequent
> > call to determine if you can let it pass or block.
> >
> > And when you do all that there will be a process that retrieves a couple
> > of pages and goes out for lunch or loses interest completely, blocking
> > out everyone from accessing the interface at all.
> 
> Right, the ibm,get-vpd RTAS function is tricky to expose to user space.
> 
> It needs to be called repeatedly until all data has been returned, 4KB
> at a time.
> 
> Only one ibm,get-vpd sequence can be in progress at any time. If an
> ibm,get-vpd sequence is begun while another sequence is already
> outstanding, the first one is invalidated -- I would guess -1 or some
> other error is returned on its next call.
> 
> So a new system-call level interface for VPD retrieval probably should
> not expose the repeating sequence-based nature of the RTAS function to
> user space, to prevent concurrent clients from interfering with each
> other. That implies that the kernel should buffer the VPD results
> internally; at least that's the only idea I've had so far. Open to
> other suggestions.

It can save the data to an user-supplied buffer until all data is
transferred or the buffer space runs out.

Thanks

Michal
