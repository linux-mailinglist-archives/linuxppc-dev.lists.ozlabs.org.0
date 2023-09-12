Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5500B79D9A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 21:37:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R/GARk51;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlYl81vwyz3dfJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 05:37:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=R/GARk51;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlYkJ09bSz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 05:36:56 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6FCB3B82037;
	Tue, 12 Sep 2023 19:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F15C433C9;
	Tue, 12 Sep 2023 19:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694547409;
	bh=SvlumMTdQZh6G5IlMqBFuVWCG4j/pbQtNHmOMRfenUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/GARk51udRfyyi6T1TBkuQvcisgm+pwQW9wF9Wyyf87P1Vq1bOBpWxVRL/CMzvvx
	 IsOYPpi+tl7Ehb02HTRT2pit8d52oruRKK3mscTPSnY5wMqetzHFfhqkQEJeKSZXja
	 8XSGPjUy3P9CJVwrj6RnqIHFU00+8ruDcLwMAt+C4QduvU9Mg5rnmmDqV309XQoQpc
	 n6OMWMM7x/Ff8PH9byMkQfYgEd55P0yfchWqvp545j+XjkEUwYrHtGLjaJNpRrKIG9
	 1n73DFcnlt9SzVtoe2W5VXR4X4yDOSHYCp1YKMvMkgek9XW9sLx+rt1HUo4IEwlzPu
	 AkxavjgFkdIKQ==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 8E0C2403F4; Tue, 12 Sep 2023 16:36:46 -0300 (-03)
Date: Tue, 12 Sep 2023 16:36:46 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH V3] tools/perf: Add includes for detected configs in
 Makefile.perf
Message-ID: <ZQC9zp14T92/fwCN@kernel.org>
References: <20230912063807.74250-1-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fU644=VvHf1JcQ1LN7tb_wAkrnrE+n4xCVyWae=UxTFyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fU644=VvHf1JcQ1LN7tb_wAkrnrE+n4xCVyWae=UxTFyg@mail.gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Sep 12, 2023 at 07:00:00AM -0700, Ian Rogers escreveu:
> On Mon, Sep 11, 2023 at 11:38 PM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
> >
> > Makefile.perf uses "CONFIG_*" checks in the code. Example the config
> > for libtraceevent is used to set PYTHON_EXT_SRCS
> >
> >         ifeq ($(CONFIG_LIBTRACEEVENT),y)
> >           PYTHON_EXT_SRCS := $(shell grep -v ^\# util/python-ext-sources)
> >         else
> >           PYTHON_EXT_SRCS := $(shell grep -v '^\#\|util/trace-event.c' util/python-ext-sources)
> >         endif
> >
> > But this is not picking the value for CONFIG_LIBTRACEEVENT that is
> > set using the settings in Makefile.config. Include the file
> > ".config-detected" so that make will use the system detected
> > configuration in the CONFIG checks. This will fix isues that
> > could arise when other "CONFIG_*" checks are added to Makefile.perf
> > in future as well.
> >
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> 
> Reviewed-by: Ian Rogers <irogers@google.com>

Thanks, applied.

- Arnaldo

 
> Thanks,
> Ian
> 
> > ---
> > Changelog:
> > v2 -> v3:
> > Added -include since in some cases make clean or make
> > will fail when config is not included and if config-detected
> > file is not present.
> >
> > v1 -> v2:
> > Added $(OUTPUT) prefix to config-detected as pointed
> > out by Ian
> >
> >  tools/perf/Makefile.perf | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> > index 37af6df7b978..f6fdc2d5a92f 100644
> > --- a/tools/perf/Makefile.perf
> > +++ b/tools/perf/Makefile.perf
> > @@ -351,6 +351,9 @@ export PYTHON_EXTBUILD_LIB PYTHON_EXTBUILD_TMP
> >
> >  python-clean := $(call QUIET_CLEAN, python) $(RM) -r $(PYTHON_EXTBUILD) $(OUTPUT)python/perf*.so
> >
> > +# Use the detected configuration
> > +-include $(OUTPUT).config-detected
> > +
> >  ifeq ($(CONFIG_LIBTRACEEVENT),y)
> >    PYTHON_EXT_SRCS := $(shell grep -v ^\# util/python-ext-sources)
> >  else
> > --
> > 2.31.1
> >

-- 

- Arnaldo
