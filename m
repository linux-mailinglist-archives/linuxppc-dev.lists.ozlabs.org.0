Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79410650B4C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 13:18:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NbJf82KV7z3c8f
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 23:18:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gBMkkauR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gBMkkauR;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbJdD0mScz2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Dec 2022 23:18:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 904E660F3D;
	Mon, 19 Dec 2022 12:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664ADC433D2;
	Mon, 19 Dec 2022 12:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1671452283;
	bh=3Abw710UXrDt/s6OKArjDnvrdscxZZG36Ti2zptfupw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gBMkkauR9b4nvpxJWcfED3tL8kmnRVY0QnDKPWjimTUqT30OhpZbvpDOmC22YBwlg
	 WKUn65k30nsPAbU6cZAIvGKe+NAV4acXosVx1zLE7m3WcXfn9ynzUWMzPLODgpxkIA
	 qel4kqAZZJ1/NFAlv32NV/exVJImoYo3PDhnYLEw=
Date: Mon, 19 Dec 2022 13:18:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] [Backport for 4.14] perf script python: Remove explicit
 shebang from tests/attr.c
Message-ID: <Y6BWeFdJiz/tIhQ6@kroah.com>
References: <3ca0515edb717e0f394f973f3cbbe2c80abb35e4.1671190496.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ca0515edb717e0f394f973f3cbbe2c80abb35e4.1671190496.git.christophe.leroy@csgroup.eu>
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Tony Jones <tonyj@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, Jiri Olsa <jolsa@kernel.org>, FRANJOU Stephane <stephane.franjou@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Seeteena Thoufeek <s1seetee@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 16, 2022 at 12:38:12PM +0100, Christophe Leroy wrote:
> From: Tony Jones <tonyj@suse.de>
> 
> [Upstream commit d72eadbc1d2866fc047edd4535ffb0298fe240be]
> 
> tests/attr.c invokes attr.py via an explicit invocation of Python
> ($PYTHON) so there is therefore no need for an explicit shebang.
> 
> Also most distros follow pep-0394 which recommends that /usr/bin/python
> refer only to v2 and so may not exist on the system (if PYTHON=python3).
> 
> Signed-off-by: Tony Jones <tonyj@suse.de>
> Acked-by: Jiri Olsa <jolsa@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> Cc: Seeteena Thoufeek <s1seetee@linux.vnet.ibm.com>
> Link: http://lkml.kernel.org/r/20190124005229.16146-5-tonyj@suse.de
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  tools/perf/tests/attr.py | 1 -
>  1 file changed, 1 deletion(-)

Why only 4.14?  What about 4.19?

thanks,

greg k-h
