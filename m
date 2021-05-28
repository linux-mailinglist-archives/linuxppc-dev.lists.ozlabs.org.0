Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A05A394275
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 14:22:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fs3hl5WsPz30FJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 22:21:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UzcnnXo5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UzcnnXo5; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fs3hG2grkz2yYn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 22:21:34 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BC8F611BD;
 Fri, 28 May 2021 12:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622204490;
 bh=rDa5x/cpxroT53ZErrZLm3VPXNPftRcYEHoGFY9QZps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UzcnnXo5uLA0bdWPpQRG12Jdd9LA1NaAJifegj5sVuLbslTq5DOX0YYn1GlJ9484w
 DcYSpuRpwioX22+7wfm4WXfxNEk3rGfyazE4U7a3lPeUJrFH8LObDZOmwOsyNqnpKS
 45VU2SZFH7W6vg88HV8TtDAcgc9o5SCj3kmaXb+8XZgqMpDKTi9jL/vq5SsBCw9aWw
 tob/v+/AT+dYeR0tWHiHzlHPISYblEB179WuXKXIsC1BxQ05Wi4SJef3pW7bLpnC/I
 u9tb+M6/iRMeFdnvWNgwZ2IEf4RuaTClqT+ZCIM8zOp2JpjuR4yfwoRmnL1LFpNsKZ
 R9+sArsJ/fWoQ==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id D96544011C; Fri, 28 May 2021 09:21:27 -0300 (-03)
Date: Fri, 28 May 2021 09:21:27 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: kajoljain <kjain@linux.ibm.com>
Subject: Re: [PATCH] perf vendor events: Fix eventcode of power10 json events
Message-ID: <YLDgRyvhJt+bbmn/@kernel.org>
References: <20210525063723.1191514-1-kjain@linux.ibm.com>
 <20210525144215.GA2135213@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
 <20210525152736.GB2135213@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
 <5960AF7C-64BD-4E57-BA6D-08AA9932B063@linux.ibm.com>
 <da7617f8-050e-c597-ec3d-5e803775252c@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da7617f8-050e-c597-ec3d-5e803775252c@linux.ibm.com>
X-Url: http://acmel.wordpress.com
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
Cc: ravi.bangoria@linux.ibm.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nageswara Sastry <rnsastry@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 maddy@linux.vnet.ibm.com, "Paul A. Clarke" <pc@us.ibm.com>, jolsa@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Fri, May 28, 2021 at 01:26:50PM +0530, kajoljain escreveu:
> 
> 
> On 5/26/21 11:42 AM, Nageswara Sastry wrote:
> > 
> > 
> >> On 25-May-2021, at 8:57 PM, Paul A. Clarke <pc@us.ibm.com> wrote:
> >>>
> >> I lost the original message, but Nageswara Sastry said:
> >>> 1. Extracted all the 244 events from the patch.
> >>> 2. Check them in 'perf list' - all 244 events found
> >>> 3. Ran all the events with 'perf stat -e "event name" sleep 1', all ran fine.
> >>>    No errors were seen in 'dmesg'
> >>
> >> I count 255 events.
> >>
> >> PC
> > 
> > Seems while extracting I filtered out newly added ones, so I got 244(255-11). 
> > Now checked with all 255 events. Thanks for pointing out.
> > 
> > Thanks!!
> > R.Nageswara Sastry
> > 
> 
> Hi Paul/Nageswara,
>    Yes we currently have 255 power10 json events which is updated in this patch. 
> Thanks for reviewing the patch.
> 
> Arnaldo can you pull this patch if changes looks fine to you.

Applied to test/urgent, thanks everybody for the tests and reviews, all
tags collected.

- Arnaldo
