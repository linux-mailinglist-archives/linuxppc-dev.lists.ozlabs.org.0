Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E75FD650BFA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 13:43:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NbKB35vlfz3c6K
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 23:43:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kodQKXx+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kodQKXx+;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbK9637wQz304s
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Dec 2022 23:42:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1D9A3B80E07;
	Mon, 19 Dec 2022 12:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2EFC433F2;
	Mon, 19 Dec 2022 12:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1671453727;
	bh=Tn9mf6KkjelrcTKj1IdFXGj3T1cbY56aU9U6ynMx0yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kodQKXx+MIWmz17WVUePuq95c4DD9KeoSIcW6oCun7trjUru/D+Yuz6s9M5CrS5/C
	 KGdR0CAjPvTO0F4eksphJ09BDzHQyscPNvHjM2H2tFe8nYMxkuIUerS9iyjxTO7Ei/
	 4j1nYIkKqkqICIC/aFd5actl7+aWYVIizJKp/YZg=
Date: Mon, 19 Dec 2022 13:42:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] [Backport for 4.14] perf script python: Remove explicit
 shebang from tests/attr.c
Message-ID: <Y6BcGM6k1PM9+/4Q@kroah.com>
References: <3ca0515edb717e0f394f973f3cbbe2c80abb35e4.1671190496.git.christophe.leroy@csgroup.eu>
 <Y6BWeFdJiz/tIhQ6@kroah.com>
 <617a746a-5f64-6d7c-48df-7c96b3aca535@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <617a746a-5f64-6d7c-48df-7c96b3aca535@csgroup.eu>
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Tony Jones <tonyj@suse.de>, Jonathan Corbet <corbet@lwn.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, Jiri Olsa <jolsa@kernel.org>, FRANJOU Stephane <stephane.franjou@csgroup.eu>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Seeteena Thoufeek <s1seetee@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 19, 2022 at 12:21:47PM +0000, Christophe Leroy wrote:
> 
> 
> Le 19/12/2022 à 13:18, Greg KH a écrit :
> > On Fri, Dec 16, 2022 at 12:38:12PM +0100, Christophe Leroy wrote:
> >> From: Tony Jones <tonyj@suse.de>
> >>
> >> [Upstream commit d72eadbc1d2866fc047edd4535ffb0298fe240be]
> >>
> >> tests/attr.c invokes attr.py via an explicit invocation of Python
> >> ($PYTHON) so there is therefore no need for an explicit shebang.
> >>
> >> Also most distros follow pep-0394 which recommends that /usr/bin/python
> >> refer only to v2 and so may not exist on the system (if PYTHON=python3).
> >>
> >> Signed-off-by: Tony Jones <tonyj@suse.de>
> >> Acked-by: Jiri Olsa <jolsa@kernel.org>
> >> Cc: Jonathan Corbet <corbet@lwn.net>
> >> Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> >> Cc: Seeteena Thoufeek <s1seetee@linux.vnet.ibm.com>
> >> Link: http://lkml.kernel.org/r/20190124005229.16146-5-tonyj@suse.de
> >> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> ---
> >>   tools/perf/tests/attr.py | 1 -
> >>   1 file changed, 1 deletion(-)
> > 
> > Why only 4.14?  What about 4.19?
> > 
> 
> 
> I submitted that backport because I encountered the problem while 
> building perf for 4.14.
> 
> I didn't look at other kernel versions.

In the future, remember that we can not add fixes to an older version
and not a newer one, otherwise you would have a regression moving to a
newer kernel.

thanks,

greg k-h
